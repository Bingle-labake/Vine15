package com.flurry.org.apache.avro.file;

import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.io.BinaryDecoder;
import com.flurry.org.apache.avro.io.DatumReader;
import com.flurry.org.apache.avro.io.DecoderFactory;
import com.flurry.org.apache.avro.util.Utf8;
import java.io.Closeable;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class DataFileReader12<D>
  implements FileReader<D>, Closeable
{
  private static final String CODEC = "codec";
  private static final String COUNT = "count";
  private static final long FOOTER_BLOCK = -1L;
  static final byte[] MAGIC = { 79, 98, 106, 0 };
  private static final String NULL_CODEC = "null";
  private static final String SCHEMA = "schema";
  private static final String SYNC = "sync";
  private static final int SYNC_INTERVAL = 16000;
  private static final int SYNC_SIZE = 16;
  private static final byte VERSION;
  private long blockCount;
  private long blockStart;
  private long count;
  private DataFileReader.SeekableInputStream in;
  private Map<String, byte[]> meta = new HashMap();
  private D peek;
  private DatumReader<D> reader;
  private Schema schema;
  private byte[] sync = new byte[16];
  private byte[] syncBuffer = new byte[16];
  private BinaryDecoder vin;

  public DataFileReader12(SeekableInput paramSeekableInput, DatumReader<D> paramDatumReader)
    throws IOException
  {
    this.in = new DataFileReader.SeekableInputStream(paramSeekableInput);
    byte[] arrayOfByte1 = new byte[4];
    this.in.read(arrayOfByte1);
    if (!Arrays.equals(MAGIC, arrayOfByte1))
      throw new IOException("Not a data file.");
    long l1 = this.in.length();
    this.in.seek(l1 - 4L);
    seek(l1 - ((this.in.read() << 24) + (this.in.read() << 16) + (this.in.read() << 8) + this.in.read()));
    long l2 = this.vin.readMapStart();
    if (l2 > 0L)
      do
      {
        for (long l3 = 0L; l3 < l2; l3 += 1L)
        {
          String str2 = this.vin.readString(null).toString();
          ByteBuffer localByteBuffer = this.vin.readBytes(null);
          byte[] arrayOfByte2 = new byte[localByteBuffer.remaining()];
          localByteBuffer.get(arrayOfByte2);
          this.meta.put(str2, arrayOfByte2);
        }
        l2 = this.vin.mapNext();
      }
      while (l2 != 0L);
    this.sync = getMeta("sync");
    this.count = getMetaLong("count");
    String str1 = getMetaString("codec");
    if ((str1 != null) && (!str1.equals("null")))
      throw new IOException("Unknown codec: " + str1);
    this.schema = Schema.parse(getMetaString("schema"));
    this.reader = paramDatumReader;
    paramDatumReader.setSchema(this.schema);
    seek(MAGIC.length);
  }

  private void skipSync()
    throws IOException
  {
    this.vin.readFixed(this.syncBuffer);
    if (!Arrays.equals(this.syncBuffer, this.sync))
      throw new IOException("Invalid sync!");
  }

  public void close()
    throws IOException
  {
    try
    {
      this.in.close();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public byte[] getMeta(String paramString)
  {
    try
    {
      byte[] arrayOfByte = (byte[])this.meta.get(paramString);
      return arrayOfByte;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public long getMetaLong(String paramString)
  {
    try
    {
      long l = Long.parseLong(getMetaString(paramString));
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public String getMetaString(String paramString)
  {
    try
    {
      byte[] arrayOfByte = getMeta(paramString);
      String str;
      if (arrayOfByte == null)
        str = null;
      while (true)
      {
        return str;
        try
        {
          str = new String(arrayOfByte, "UTF-8");
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException)
        {
          throw new RuntimeException(localUnsupportedEncodingException);
        }
      }
    }
    finally
    {
    }
  }

  public Schema getSchema()
  {
    return this.schema;
  }

  public boolean hasNext()
  {
    if ((this.peek != null) || (this.blockCount != 0L));
    do
    {
      return true;
      this.peek = next();
    }
    while (this.peek != null);
    return false;
  }

  public Iterator<D> iterator()
  {
    return this;
  }

  public D next()
  {
    if (this.peek != null)
    {
      Object localObject2 = this.peek;
      this.peek = null;
      return localObject2;
    }
    try
    {
      Object localObject1 = next(null);
      return localObject1;
    }
    catch (IOException localIOException)
    {
      throw new RuntimeException(localIOException);
    }
  }

  public D next(D paramD)
    throws IOException
  {
    while (true)
    {
      try
      {
        if (this.blockCount == 0L)
        {
          long l1 = this.in.tell();
          long l2 = this.in.length();
          if (l1 == l2)
          {
            localObject3 = null;
            return localObject3;
          }
          skipSync();
          this.blockCount = this.vin.readLong();
          if (this.blockCount != -1L)
            continue;
          seek(this.vin.readLong() + this.in.tell());
          continue;
        }
      }
      finally
      {
      }
      this.blockCount -= 1L;
      Object localObject2 = this.reader.read(paramD, this.vin);
      Object localObject3 = localObject2;
    }
  }

  public boolean pastSync(long paramLong)
    throws IOException
  {
    return (this.blockStart >= 16L + paramLong) || (this.blockStart >= this.in.length());
  }

  public void remove()
  {
    throw new UnsupportedOperationException();
  }

  public void seek(long paramLong)
    throws IOException
  {
    try
    {
      this.in.seek(paramLong);
      this.blockCount = 0L;
      this.blockStart = paramLong;
      this.vin = DecoderFactory.get().binaryDecoder(this.in, this.vin);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void sync(long paramLong)
    throws IOException
  {
    while (true)
    {
      int i;
      int j;
      try
      {
        if (16L + this.in.tell() >= this.in.length())
        {
          seek(this.in.length());
          return;
        }
        this.in.seek(paramLong);
        this.vin.readFixed(this.syncBuffer);
        i = 0;
        if (this.in.tell() >= this.in.length())
          break label183;
        j = 0;
        if ((j >= this.sync.length) || (this.sync[j] != this.syncBuffer[((i + j) % this.sync.length)]))
        {
          if (j != this.sync.length)
            break label156;
          seek(this.in.tell() - 16L);
          continue;
        }
      }
      finally
      {
      }
      j++;
      continue;
      label156: this.syncBuffer[(i % this.sync.length)] = ((byte)this.in.read());
      i++;
      continue;
      label183: seek(this.in.length());
    }
  }

  public long tell()
    throws IOException
  {
    return this.in.tell();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.DataFileReader12
 * JD-Core Version:    0.6.2
 */