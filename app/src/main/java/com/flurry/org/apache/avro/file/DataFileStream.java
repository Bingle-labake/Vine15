package com.flurry.org.apache.avro.file;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.io.BinaryDecoder;
import com.flurry.org.apache.avro.io.BinaryEncoder;
import com.flurry.org.apache.avro.io.DatumReader;
import com.flurry.org.apache.avro.io.DecoderFactory;
import com.flurry.org.apache.avro.util.Utf8;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

public class DataFileStream<D>
  implements Iterator<D>, Iterable<D>, Closeable
{
  private boolean availableBlock = false;
  private DataBlock block = null;
  ByteBuffer blockBuffer;
  long blockCount;
  long blockRemaining;
  private long blockSize;
  private Codec codec;
  BinaryDecoder datumIn = null;
  private Header header;
  private DatumReader<D> reader;
  byte[] syncBuffer = new byte[16];
  BinaryDecoder vin;

  protected DataFileStream(DatumReader<D> paramDatumReader)
    throws IOException
  {
    this.reader = paramDatumReader;
  }

  public DataFileStream(InputStream paramInputStream, DatumReader<D> paramDatumReader)
    throws IOException
  {
    this.reader = paramDatumReader;
    initialize(paramInputStream);
  }

  protected void blockFinished()
    throws IOException
  {
  }

  public void close()
    throws IOException
  {
    this.vin.inputStream().close();
  }

  public long getBlockCount()
  {
    return this.blockCount;
  }

  public Header getHeader()
  {
    return this.header;
  }

  public byte[] getMeta(String paramString)
  {
    return (byte[])this.header.meta.get(paramString);
  }

  public List<String> getMetaKeys()
  {
    return this.header.metaKeyList;
  }

  public long getMetaLong(String paramString)
  {
    return Long.parseLong(getMetaString(paramString));
  }

  public String getMetaString(String paramString)
  {
    byte[] arrayOfByte = getMeta(paramString);
    if (arrayOfByte == null)
      return null;
    try
    {
      String str = new String(arrayOfByte, "UTF-8");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException);
    }
  }

  public Schema getSchema()
  {
    return this.header.schema;
  }

  public boolean hasNext()
  {
    try
    {
      if (this.blockRemaining == 0L)
      {
        if ((this.datumIn != null) && (!this.datumIn.isEnd()))
          throw new IOException("Block read partially, the data may be corrupt");
        if (hasNextBlock())
        {
          this.block = nextRawBlock(this.block);
          this.block.decompressUsing(this.codec);
          this.blockBuffer = this.block.getAsByteBuffer();
          this.datumIn = DecoderFactory.get().binaryDecoder(this.blockBuffer.array(), this.blockBuffer.arrayOffset() + this.blockBuffer.position(), this.blockBuffer.remaining(), this.datumIn);
        }
      }
      long l = this.blockRemaining;
      if (l != 0L)
        return true;
    }
    catch (IOException localIOException)
    {
      throw new AvroRuntimeException(localIOException);
    }
    catch (EOFException localEOFException)
    {
    }
    return false;
  }

  boolean hasNextBlock()
  {
    try
    {
      if (this.availableBlock)
        return true;
      if (this.vin.isEnd())
        return false;
      this.blockRemaining = this.vin.readLong();
      this.blockSize = this.vin.readLong();
      if ((this.blockSize > 2147483647L) || (this.blockSize < 0L))
        throw new IOException("Block size invalid or too large for this implementation: " + this.blockSize);
      this.blockCount = this.blockRemaining;
      this.availableBlock = true;
      return true;
    }
    catch (IOException localIOException)
    {
      throw new AvroRuntimeException(localIOException);
    }
    catch (EOFException localEOFException)
    {
    }
    return false;
  }

  void initialize(InputStream paramInputStream)
    throws IOException
  {
    this.header = new Header(null);
    this.vin = DecoderFactory.get().binaryDecoder(paramInputStream, this.vin);
    byte[] arrayOfByte1 = new byte[DataFileConstants.MAGIC.length];
    try
    {
      this.vin.readFixed(arrayOfByte1);
      if (!Arrays.equals(DataFileConstants.MAGIC, arrayOfByte1))
        throw new IOException("Not a data file.");
    }
    catch (IOException localIOException)
    {
      throw new IOException("Not a data file.");
    }
    long l1 = this.vin.readMapStart();
    if (l1 > 0L)
      do
      {
        for (long l2 = 0L; l2 < l1; l2 += 1L)
        {
          String str = this.vin.readString(null).toString();
          ByteBuffer localByteBuffer = this.vin.readBytes(null);
          byte[] arrayOfByte2 = new byte[localByteBuffer.remaining()];
          localByteBuffer.get(arrayOfByte2);
          this.header.meta.put(str, arrayOfByte2);
          this.header.metaKeyList.add(str);
        }
        l1 = this.vin.mapNext();
      }
      while (l1 != 0L);
    this.vin.readFixed(this.header.sync);
    Header.access$102(this.header, Collections.unmodifiableList(this.header.metaKeyList));
    this.header.schema = Schema.parse(getMetaString("avro.schema"), false);
    this.codec = resolveCodec();
    this.reader.setSchema(this.header.schema);
  }

  void initialize(InputStream paramInputStream, Header paramHeader)
    throws IOException
  {
    this.header = paramHeader;
    this.codec = resolveCodec();
    this.reader.setSchema(paramHeader.schema);
  }

  public Iterator<D> iterator()
  {
    return this;
  }

  public D next()
  {
    try
    {
      Object localObject = next(null);
      return localObject;
    }
    catch (IOException localIOException)
    {
      throw new AvroRuntimeException(localIOException);
    }
  }

  public D next(D paramD)
    throws IOException
  {
    if (!hasNext())
      throw new NoSuchElementException();
    Object localObject = this.reader.read(paramD, this.datumIn);
    long l = this.blockRemaining - 1L;
    this.blockRemaining = l;
    if (0L == l)
      blockFinished();
    return localObject;
  }

  public ByteBuffer nextBlock()
    throws IOException
  {
    if (!hasNext())
      throw new NoSuchElementException();
    if (this.blockRemaining != this.blockCount)
      throw new IllegalStateException("Not at block start.");
    this.blockRemaining = 0L;
    this.datumIn = null;
    return this.blockBuffer;
  }

  DataBlock nextRawBlock(DataBlock paramDataBlock)
    throws IOException
  {
    if (!hasNextBlock())
      throw new NoSuchElementException();
    if ((paramDataBlock == null) || (paramDataBlock.data.length < (int)this.blockSize))
      paramDataBlock = new DataBlock(this.blockRemaining, (int)this.blockSize, null);
    while (true)
    {
      this.vin.readFixed(paramDataBlock.data, 0, paramDataBlock.blockSize);
      this.vin.readFixed(this.syncBuffer);
      if (Arrays.equals(this.syncBuffer, this.header.sync))
        break;
      throw new IOException("Invalid sync!");
      DataBlock.access$402(paramDataBlock, this.blockRemaining);
      DataBlock.access$502(paramDataBlock, (int)this.blockSize);
    }
    this.availableBlock = false;
    return paramDataBlock;
  }

  public void remove()
  {
    throw new UnsupportedOperationException();
  }

  Codec resolveCodec()
  {
    String str = getMetaString("avro.codec");
    if (str != null)
      return CodecFactory.fromString(str).createInstance();
    return CodecFactory.nullCodec().createInstance();
  }

  static class DataBlock
  {
    private int blockSize;
    private byte[] data;
    private long numEntries;
    private int offset = 0;

    private DataBlock(long paramLong, int paramInt)
    {
      this.data = new byte[paramInt];
      this.numEntries = paramLong;
      this.blockSize = paramInt;
    }

    DataBlock(ByteBuffer paramByteBuffer, long paramLong)
    {
      this.data = paramByteBuffer.array();
      this.blockSize = paramByteBuffer.remaining();
      this.offset = (paramByteBuffer.arrayOffset() + paramByteBuffer.position());
      this.numEntries = paramLong;
    }

    void compressUsing(Codec paramCodec)
      throws IOException
    {
      ByteBuffer localByteBuffer = paramCodec.compress(getAsByteBuffer());
      this.data = localByteBuffer.array();
      this.blockSize = localByteBuffer.remaining();
    }

    void decompressUsing(Codec paramCodec)
      throws IOException
    {
      ByteBuffer localByteBuffer = paramCodec.decompress(getAsByteBuffer());
      this.data = localByteBuffer.array();
      this.blockSize = localByteBuffer.remaining();
    }

    ByteBuffer getAsByteBuffer()
    {
      return ByteBuffer.wrap(this.data, this.offset, this.blockSize);
    }

    int getBlockSize()
    {
      return this.blockSize;
    }

    byte[] getData()
    {
      return this.data;
    }

    long getNumEntries()
    {
      return this.numEntries;
    }

    void writeBlockTo(BinaryEncoder paramBinaryEncoder, byte[] paramArrayOfByte)
      throws IOException
    {
      paramBinaryEncoder.writeLong(this.numEntries);
      paramBinaryEncoder.writeLong(this.blockSize);
      paramBinaryEncoder.writeFixed(this.data, this.offset, this.blockSize);
      paramBinaryEncoder.writeFixed(paramArrayOfByte);
      paramBinaryEncoder.flush();
    }
  }

  public static final class Header
  {
    Map<String, byte[]> meta = new HashMap();
    private transient List<String> metaKeyList = new ArrayList();
    Schema schema;
    byte[] sync = new byte[16];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.DataFileStream
 * JD-Core Version:    0.6.2
 */