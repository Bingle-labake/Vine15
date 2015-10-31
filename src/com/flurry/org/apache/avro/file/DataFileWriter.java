package com.flurry.org.apache.avro.file;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.generic.GenericDatumReader;
import com.flurry.org.apache.avro.io.BinaryEncoder;
import com.flurry.org.apache.avro.io.DatumWriter;
import com.flurry.org.apache.avro.io.EncoderFactory;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilterOutputStream;
import java.io.Flushable;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.rmi.server.UID;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class DataFileWriter<D>
  implements Closeable, Flushable
{
  private long blockCount;
  private BinaryEncoder bufOut;
  private NonCopyingByteArrayOutputStream buffer;
  private Codec codec;
  private DatumWriter<D> dout;
  private boolean isOpen;
  private final Map<String, byte[]> meta = new HashMap();
  private DataFileWriter<D>.BufferedFileOutputStream out;
  private Schema schema;
  private byte[] sync;
  private int syncInterval = 16000;
  private BinaryEncoder vout;

  public DataFileWriter(DatumWriter<D> paramDatumWriter)
  {
    this.dout = paramDatumWriter;
  }

  private void assertNotOpen()
  {
    if (this.isOpen)
      throw new AvroRuntimeException("already open");
  }

  private void assertOpen()
  {
    if (!this.isOpen)
      throw new AvroRuntimeException("not open");
  }

  private int bufferInUse()
  {
    return this.buffer.size() + this.bufOut.bytesBuffered();
  }

  private static byte[] generateSync()
  {
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("MD5");
      long l = System.currentTimeMillis();
      localMessageDigest.update((new UID() + "@" + l).getBytes());
      byte[] arrayOfByte = localMessageDigest.digest();
      return arrayOfByte;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new RuntimeException(localNoSuchAlgorithmException);
    }
  }

  private void init(OutputStream paramOutputStream)
    throws IOException
  {
    this.out = new BufferedFileOutputStream(paramOutputStream);
    EncoderFactory localEncoderFactory = new EncoderFactory();
    this.vout = localEncoderFactory.binaryEncoder(this.out, null);
    this.dout.setSchema(this.schema);
    this.buffer = new NonCopyingByteArrayOutputStream(Math.min((int)(1.25D * this.syncInterval), 1073741822));
    this.bufOut = localEncoderFactory.binaryEncoder(this.buffer, null);
    if (this.codec == null)
      this.codec = CodecFactory.nullCodec().createInstance();
    this.isOpen = true;
  }

  public static boolean isReservedMeta(String paramString)
  {
    return paramString.startsWith("avro.");
  }

  private void resetBufferTo(int paramInt)
    throws IOException
  {
    this.bufOut.flush();
    byte[] arrayOfByte = this.buffer.toByteArray();
    this.buffer.reset();
    this.buffer.write(arrayOfByte, 0, paramInt);
  }

  private DataFileWriter<D> setMetaInternal(String paramString1, String paramString2)
  {
    try
    {
      DataFileWriter localDataFileWriter = setMetaInternal(paramString1, paramString2.getBytes("UTF-8"));
      return localDataFileWriter;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException);
    }
  }

  private DataFileWriter<D> setMetaInternal(String paramString, byte[] paramArrayOfByte)
  {
    assertNotOpen();
    this.meta.put(paramString, paramArrayOfByte);
    return this;
  }

  private void writeBlock()
    throws IOException
  {
    if (this.blockCount > 0L)
    {
      this.bufOut.flush();
      DataFileStream.DataBlock localDataBlock = new DataFileStream.DataBlock(this.buffer.getByteArrayAsByteBuffer(), this.blockCount);
      localDataBlock.compressUsing(this.codec);
      localDataBlock.writeBlockTo(this.vout, this.sync);
      this.buffer.reset();
      this.blockCount = 0L;
    }
  }

  private void writeIfBlockFull()
    throws IOException
  {
    if (bufferInUse() >= this.syncInterval)
      writeBlock();
  }

  public void append(D paramD)
    throws IOException
  {
    assertOpen();
    int i = bufferInUse();
    try
    {
      this.dout.write(paramD, this.bufOut);
      this.blockCount = (1L + this.blockCount);
      writeIfBlockFull();
      return;
    }
    catch (IOException localIOException)
    {
      resetBufferTo(i);
      throw new AppendWriteException(localIOException);
    }
    catch (RuntimeException localRuntimeException)
    {
      resetBufferTo(i);
      throw new AppendWriteException(localRuntimeException);
    }
  }

  public void appendAllFrom(DataFileStream<D> paramDataFileStream, boolean paramBoolean)
    throws IOException
  {
    assertOpen();
    Schema localSchema = paramDataFileStream.getSchema();
    if (!this.schema.equals(localSchema))
      throw new IOException("Schema from file " + paramDataFileStream + " does not match");
    writeBlock();
    Codec localCodec = paramDataFileStream.resolveCodec();
    boolean bool = this.codec.equals(localCodec);
    DataFileStream.DataBlock localDataBlock = null;
    if (bool)
    {
      localDataBlock = null;
      if (!paramBoolean)
        while (paramDataFileStream.hasNextBlock())
        {
          localDataBlock = paramDataFileStream.nextRawBlock(localDataBlock);
          localDataBlock.writeBlockTo(this.vout, this.sync);
        }
    }
    while (paramDataFileStream.hasNextBlock())
    {
      localDataBlock = paramDataFileStream.nextRawBlock(localDataBlock);
      localDataBlock.decompressUsing(localCodec);
      localDataBlock.compressUsing(this.codec);
      localDataBlock.writeBlockTo(this.vout, this.sync);
    }
  }

  public void appendEncoded(ByteBuffer paramByteBuffer)
    throws IOException
  {
    assertOpen();
    int i = paramByteBuffer.position();
    this.bufOut.writeFixed(paramByteBuffer.array(), i, paramByteBuffer.limit() - i);
    this.blockCount = (1L + this.blockCount);
    writeIfBlockFull();
  }

  public DataFileWriter<D> appendTo(File paramFile)
    throws IOException
  {
    assertNotOpen();
    if (!paramFile.exists())
      throw new FileNotFoundException("Not found: " + paramFile);
    RandomAccessFile localRandomAccessFile = new RandomAccessFile(paramFile, "r");
    DataFileReader localDataFileReader = new DataFileReader(new SeekableFileInput(localRandomAccessFile.getFD()), new GenericDatumReader());
    this.schema = localDataFileReader.getSchema();
    this.sync = localDataFileReader.getHeader().sync;
    this.meta.putAll(localDataFileReader.getHeader().meta);
    byte[] arrayOfByte = (byte[])this.meta.get("avro.codec");
    if (arrayOfByte != null);
    for (this.codec = CodecFactory.fromString(new String(arrayOfByte, "UTF-8")).createInstance(); ; this.codec = CodecFactory.nullCodec().createInstance())
    {
      localRandomAccessFile.close();
      init(new FileOutputStream(paramFile, true));
      return this;
    }
  }

  public void close()
    throws IOException
  {
    flush();
    this.out.close();
    this.isOpen = false;
  }

  public DataFileWriter<D> create(Schema paramSchema, File paramFile)
    throws IOException
  {
    return create(paramSchema, new FileOutputStream(paramFile));
  }

  public DataFileWriter<D> create(Schema paramSchema, OutputStream paramOutputStream)
    throws IOException
  {
    assertNotOpen();
    this.schema = paramSchema;
    setMetaInternal("avro.schema", paramSchema.toString());
    this.sync = generateSync();
    init(paramOutputStream);
    this.vout.writeFixed(DataFileConstants.MAGIC);
    this.vout.writeMapStart();
    this.vout.setItemCount(this.meta.size());
    Iterator localIterator = this.meta.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      this.vout.startItem();
      this.vout.writeString((String)localEntry.getKey());
      this.vout.writeBytes((byte[])localEntry.getValue());
    }
    this.vout.writeMapEnd();
    this.vout.writeFixed(this.sync);
    this.vout.flush();
    return this;
  }

  public void flush()
    throws IOException
  {
    sync();
    this.vout.flush();
  }

  public DataFileWriter<D> setCodec(CodecFactory paramCodecFactory)
  {
    assertNotOpen();
    this.codec = paramCodecFactory.createInstance();
    setMetaInternal("avro.codec", this.codec.getName());
    return this;
  }

  public DataFileWriter<D> setMeta(String paramString, long paramLong)
  {
    return setMeta(paramString, Long.toString(paramLong));
  }

  public DataFileWriter<D> setMeta(String paramString1, String paramString2)
  {
    try
    {
      DataFileWriter localDataFileWriter = setMeta(paramString1, paramString2.getBytes("UTF-8"));
      return localDataFileWriter;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException);
    }
  }

  public DataFileWriter<D> setMeta(String paramString, byte[] paramArrayOfByte)
  {
    if (isReservedMeta(paramString))
      throw new AvroRuntimeException("Cannot set reserved meta key: " + paramString);
    return setMetaInternal(paramString, paramArrayOfByte);
  }

  public DataFileWriter<D> setSyncInterval(int paramInt)
  {
    if ((paramInt < 32) || (paramInt > 1073741824))
      throw new IllegalArgumentException("Invalid syncInterval value: " + paramInt);
    this.syncInterval = paramInt;
    return this;
  }

  public long sync()
    throws IOException
  {
    assertOpen();
    writeBlock();
    return this.out.tell();
  }

  public static class AppendWriteException extends RuntimeException
  {
    public AppendWriteException(Exception paramException)
    {
      super();
    }
  }

  private class BufferedFileOutputStream extends BufferedOutputStream
  {
    private long position;

    public BufferedFileOutputStream(OutputStream arg2)
      throws IOException
    {
      super();
      OutputStream localOutputStream;
      this.out = new PositionFilter(localOutputStream);
    }

    public long tell()
    {
      return this.position + this.count;
    }

    private class PositionFilter extends FilterOutputStream
    {
      public PositionFilter(OutputStream arg2)
        throws IOException
      {
        super();
      }

      public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
        throws IOException
      {
        this.out.write(paramArrayOfByte, paramInt1, paramInt2);
        DataFileWriter.BufferedFileOutputStream.access$014(DataFileWriter.BufferedFileOutputStream.this, paramInt2);
      }
    }
  }

  private static class NonCopyingByteArrayOutputStream extends ByteArrayOutputStream
  {
    NonCopyingByteArrayOutputStream(int paramInt)
    {
      super();
    }

    ByteBuffer getByteArrayAsByteBuffer()
    {
      return ByteBuffer.wrap(this.buf, 0, this.count);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.DataFileWriter
 * JD-Core Version:    0.6.2
 */