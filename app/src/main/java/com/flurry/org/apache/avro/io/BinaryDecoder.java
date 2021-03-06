package com.flurry.org.apache.avro.io;

import com.flurry.org.apache.avro.util.Utf8;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

public class BinaryDecoder extends Decoder
{
  private byte[] buf = null;
  private int limit = 0;
  private int minPos = 0;
  private int pos = 0;
  private final Utf8 scratchUtf8 = new Utf8();
  private ByteSource source = null;

  protected BinaryDecoder()
  {
  }

  BinaryDecoder(InputStream paramInputStream, int paramInt)
  {
    configure(paramInputStream, paramInt);
  }

  BinaryDecoder(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    configure(paramArrayOfByte, paramInt1, paramInt2);
  }

  private void configureSource(int paramInt, ByteSource paramByteSource)
  {
    if (this.source != null)
      this.source.detach();
    paramByteSource.attach(paramInt, this);
    this.source = paramByteSource;
  }

  private long doSkipItems()
    throws IOException
  {
    for (long l = readInt(); l < 0L; l = readInt())
      doSkipBytes(readLong());
    return l;
  }

  private void ensureBounds(int paramInt)
    throws IOException
  {
    int i = this.limit - this.pos;
    if (i < paramInt)
      this.source.compactAndFill(this.buf, this.pos, this.minPos, i);
  }

  private long innerLongDecode(long paramLong)
    throws IOException
  {
    int i = 1;
    int j = 0xFF & this.buf[this.pos];
    long l = paramLong ^ (0x7F & j) << 28;
    if (j > 127)
    {
      byte[] arrayOfByte1 = this.buf;
      int k = this.pos;
      int m = i + 1;
      int n = 0xFF & arrayOfByte1[(k + i)];
      l ^= (0x7F & n) << 35;
      if (n > 127)
      {
        byte[] arrayOfByte2 = this.buf;
        int i1 = this.pos;
        i = m + 1;
        int i2 = 0xFF & arrayOfByte2[(i1 + 2)];
        l ^= (0x7F & i2) << 42;
        if (i2 > 127)
        {
          byte[] arrayOfByte3 = this.buf;
          int i3 = this.pos;
          i++;
          int i4 = 0xFF & arrayOfByte3[(i3 + 3)];
          l ^= (0x7F & i4) << 49;
          if (i4 > 127)
          {
            byte[] arrayOfByte4 = this.buf;
            int i5 = this.pos;
            i++;
            int i6 = 0xFF & arrayOfByte4[(i5 + 4)];
            l ^= (0x7F & i6) << 56;
            if (i6 > 127)
            {
              byte[] arrayOfByte5 = this.buf;
              int i7 = this.pos;
              i++;
              int i8 = 0xFF & arrayOfByte5[(i7 + 5)];
              l ^= (0x7F & i8) << 63;
              if (i8 > 127)
                throw new IOException("Invalid long encoding");
            }
          }
        }
      }
      else
      {
        i = m;
      }
    }
    this.pos = (i + this.pos);
    return l;
  }

  public long arrayNext()
    throws IOException
  {
    return doReadItemCount();
  }

  BinaryDecoder configure(InputStream paramInputStream, int paramInt)
  {
    configureSource(paramInt, new InputStreamByteSource(paramInputStream, null));
    return this;
  }

  BinaryDecoder configure(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    configureSource(8192, new ByteArrayByteSource(paramArrayOfByte, paramInt1, paramInt2, null));
    return this;
  }

  protected void doReadBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = this.limit - this.pos;
    if (paramInt2 <= i)
    {
      System.arraycopy(this.buf, this.pos, paramArrayOfByte, paramInt1, paramInt2);
      this.pos = (paramInt2 + this.pos);
      return;
    }
    System.arraycopy(this.buf, this.pos, paramArrayOfByte, paramInt1, i);
    int j = paramInt1 + i;
    int k = paramInt2 - i;
    this.pos = this.limit;
    this.source.readRaw(paramArrayOfByte, j, k);
  }

  protected long doReadItemCount()
    throws IOException
  {
    long l = readLong();
    if (l < 0L)
    {
      readLong();
      l = -l;
    }
    return l;
  }

  protected void doSkipBytes(long paramLong)
    throws IOException
  {
    int i = this.limit - this.pos;
    if (paramLong <= i)
    {
      this.pos = ((int)(paramLong + this.pos));
      return;
    }
    this.pos = 0;
    this.limit = 0;
    long l = paramLong - i;
    this.source.skipSourceBytes(l);
  }

  BufferAccessor getBufferAccessor()
  {
    return new BufferAccessor(this, null);
  }

  public InputStream inputStream()
  {
    return this.source;
  }

  public boolean isEnd()
    throws IOException
  {
    if (this.limit - this.pos > 0);
    int i;
    do
    {
      return false;
      if (this.source.isEof())
        return true;
      i = this.source.tryReadRaw(this.buf, 0, this.buf.length);
      this.pos = 0;
      this.limit = i;
    }
    while (i != 0);
    return true;
  }

  public long mapNext()
    throws IOException
  {
    return doReadItemCount();
  }

  public long readArrayStart()
    throws IOException
  {
    return doReadItemCount();
  }

  public boolean readBoolean()
    throws IOException
  {
    if (this.limit == this.pos)
    {
      this.limit = this.source.tryReadRaw(this.buf, 0, this.buf.length);
      this.pos = 0;
      if (this.limit == 0)
        throw new EOFException();
    }
    byte[] arrayOfByte = this.buf;
    int i = this.pos;
    this.pos = (i + 1);
    return (0xFF & arrayOfByte[i]) == 1;
  }

  public ByteBuffer readBytes(ByteBuffer paramByteBuffer)
    throws IOException
  {
    int i = readInt();
    ByteBuffer localByteBuffer;
    if ((paramByteBuffer != null) && (i <= paramByteBuffer.capacity()))
    {
      localByteBuffer = paramByteBuffer;
      localByteBuffer.clear();
    }
    while (true)
    {
      doReadBytes(localByteBuffer.array(), localByteBuffer.position(), i);
      localByteBuffer.limit(i);
      return localByteBuffer;
      localByteBuffer = ByteBuffer.allocate(i);
    }
  }

  public double readDouble()
    throws IOException
  {
    ensureBounds(8);
    int i = 0xFF & this.buf[this.pos];
    byte[] arrayOfByte1 = this.buf;
    int j = this.pos;
    int k = 1 + 1;
    int m = i | (0xFF & arrayOfByte1[(j + 1)]) << 8;
    byte[] arrayOfByte2 = this.buf;
    int n = this.pos;
    int i1 = k + 1;
    int i2 = m | (0xFF & arrayOfByte2[(n + 2)]) << 16;
    byte[] arrayOfByte3 = this.buf;
    int i3 = this.pos;
    int i4 = i1 + 1;
    int i5 = i2 | (0xFF & arrayOfByte3[(i3 + 3)]) << 24;
    byte[] arrayOfByte4 = this.buf;
    int i6 = this.pos;
    int i7 = i4 + 1;
    int i8 = 0xFF & arrayOfByte4[(i6 + 4)];
    byte[] arrayOfByte5 = this.buf;
    int i9 = this.pos;
    int i10 = i7 + 1;
    int i11 = i8 | (0xFF & arrayOfByte5[(i9 + 5)]) << 8;
    byte[] arrayOfByte6 = this.buf;
    int i12 = this.pos;
    int i13 = i10 + 1;
    int i14 = i11 | (0xFF & arrayOfByte6[(i12 + 6)]) << 16;
    byte[] arrayOfByte7 = this.buf;
    int i15 = this.pos;
    (i13 + 1);
    int i16 = i14 | (0xFF & arrayOfByte7[(i15 + 7)]) << 24;
    if (8 + this.pos > this.limit)
      throw new EOFException();
    this.pos = (8 + this.pos);
    return Double.longBitsToDouble(0xFFFFFFFF & i5 | i16 << 32);
  }

  public int readEnum()
    throws IOException
  {
    return readInt();
  }

  public void readFixed(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    doReadBytes(paramArrayOfByte, paramInt1, paramInt2);
  }

  public float readFloat()
    throws IOException
  {
    ensureBounds(4);
    int i = 0xFF & this.buf[this.pos];
    byte[] arrayOfByte1 = this.buf;
    int j = this.pos;
    int k = 1 + 1;
    int m = i | (0xFF & arrayOfByte1[(j + 1)]) << 8;
    byte[] arrayOfByte2 = this.buf;
    int n = this.pos;
    int i1 = k + 1;
    int i2 = m | (0xFF & arrayOfByte2[(n + 2)]) << 16;
    byte[] arrayOfByte3 = this.buf;
    int i3 = this.pos;
    (i1 + 1);
    int i4 = i2 | (0xFF & arrayOfByte3[(i3 + 3)]) << 24;
    if (4 + this.pos > this.limit)
      throw new EOFException();
    this.pos = (4 + this.pos);
    return Float.intBitsToFloat(i4);
  }

  public int readIndex()
    throws IOException
  {
    return readInt();
  }

  public int readInt()
    throws IOException
  {
    ensureBounds(5);
    int i = 1;
    int j = 0xFF & this.buf[this.pos];
    int k = j & 0x7F;
    if (j > 127)
    {
      byte[] arrayOfByte1 = this.buf;
      int m = this.pos;
      int n = i + 1;
      int i1 = 0xFF & arrayOfByte1[(m + i)];
      k ^= (i1 & 0x7F) << 7;
      if (i1 > 127)
      {
        byte[] arrayOfByte2 = this.buf;
        int i2 = this.pos;
        i = n + 1;
        int i3 = 0xFF & arrayOfByte2[(i2 + 2)];
        k ^= (i3 & 0x7F) << 14;
        if (i3 > 127)
        {
          byte[] arrayOfByte3 = this.buf;
          int i4 = this.pos;
          i++;
          int i5 = 0xFF & arrayOfByte3[(i4 + 3)];
          k ^= (i5 & 0x7F) << 21;
          if (i5 > 127)
          {
            byte[] arrayOfByte4 = this.buf;
            int i6 = this.pos;
            i++;
            int i7 = 0xFF & arrayOfByte4[(i6 + 4)];
            k ^= (i7 & 0x7F) << 28;
            if (i7 > 127)
              throw new IOException("Invalid int encoding");
          }
        }
      }
      else
      {
        i = n;
      }
    }
    this.pos = (i + this.pos);
    if (this.pos > this.limit)
      throw new EOFException();
    return k >>> 1 ^ -(k & 0x1);
  }

  public long readLong()
    throws IOException
  {
    ensureBounds(10);
    byte[] arrayOfByte1 = this.buf;
    int i = this.pos;
    this.pos = (i + 1);
    int j = 0xFF & arrayOfByte1[i];
    int k = j & 0x7F;
    int i1;
    int i4;
    int i7;
    long l;
    if (j > 127)
    {
      byte[] arrayOfByte2 = this.buf;
      int m = this.pos;
      this.pos = (m + 1);
      int n = 0xFF & arrayOfByte2[m];
      i1 = k ^ (n & 0x7F) << 7;
      if (n > 127)
      {
        byte[] arrayOfByte3 = this.buf;
        int i2 = this.pos;
        this.pos = (i2 + 1);
        int i3 = 0xFF & arrayOfByte3[i2];
        i4 = i1 ^ (i3 & 0x7F) << 14;
        if (i3 > 127)
        {
          byte[] arrayOfByte4 = this.buf;
          int i5 = this.pos;
          this.pos = (i5 + 1);
          int i6 = 0xFF & arrayOfByte4[i5];
          i7 = i4 ^ (i6 & 0x7F) << 21;
          if (i6 > 127)
            l = innerLongDecode(i7);
        }
      }
    }
    while (this.pos > this.limit)
    {
      throw new EOFException();
      l = i7;
      continue;
      l = i4;
      continue;
      l = i1;
      continue;
      l = k;
    }
    return l >>> 1 ^ -(1L & l);
  }

  public long readMapStart()
    throws IOException
  {
    return doReadItemCount();
  }

  public void readNull()
    throws IOException
  {
  }

  public Utf8 readString(Utf8 paramUtf8)
    throws IOException
  {
    int i = readInt();
    if (paramUtf8 != null);
    for (Utf8 localUtf8 = paramUtf8; ; localUtf8 = new Utf8())
    {
      localUtf8.setByteLength(i);
      if (i != 0)
        doReadBytes(localUtf8.getBytes(), 0, i);
      return localUtf8;
    }
  }

  public String readString()
    throws IOException
  {
    return readString(this.scratchUtf8).toString();
  }

  public long skipArray()
    throws IOException
  {
    return doSkipItems();
  }

  public void skipBytes()
    throws IOException
  {
    doSkipBytes(readInt());
  }

  public void skipFixed(int paramInt)
    throws IOException
  {
    doSkipBytes(paramInt);
  }

  public long skipMap()
    throws IOException
  {
    return doSkipItems();
  }

  public void skipString()
    throws IOException
  {
    doSkipBytes(readInt());
  }

  static class BufferAccessor
  {
    private byte[] buf;
    private final BinaryDecoder decoder;
    boolean detached = false;
    private int limit;
    private int pos;

    private BufferAccessor(BinaryDecoder paramBinaryDecoder)
    {
      this.decoder = paramBinaryDecoder;
    }

    void detach()
    {
      this.buf = this.decoder.buf;
      this.pos = this.decoder.pos;
      this.limit = this.decoder.limit;
      this.detached = true;
    }

    byte[] getBuf()
    {
      if (this.detached)
        return this.buf;
      return this.decoder.buf;
    }

    int getLim()
    {
      if (this.detached)
        return this.limit;
      return this.decoder.limit;
    }

    int getPos()
    {
      if (this.detached)
        return this.pos;
      return this.decoder.pos;
    }

    void setBuf(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      if (this.detached)
      {
        this.buf = paramArrayOfByte;
        this.limit = (paramInt1 + paramInt2);
        this.pos = paramInt1;
        return;
      }
      BinaryDecoder.access$302(this.decoder, paramArrayOfByte);
      BinaryDecoder.access$502(this.decoder, paramInt1 + paramInt2);
      BinaryDecoder.access$402(this.decoder, paramInt1);
      BinaryDecoder.access$602(this.decoder, paramInt1);
    }

    void setLimit(int paramInt)
    {
      if (this.detached)
      {
        this.limit = paramInt;
        return;
      }
      BinaryDecoder.access$502(this.decoder, paramInt);
    }

    void setPos(int paramInt)
    {
      if (this.detached)
      {
        this.pos = paramInt;
        return;
      }
      BinaryDecoder.access$402(this.decoder, paramInt);
    }
  }

  private static class ByteArrayByteSource extends BinaryDecoder.ByteSource
  {
    private boolean compacted = false;
    private byte[] data;
    private int max;
    private int position;

    private ByteArrayByteSource(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      if ((paramArrayOfByte.length < 16) || (paramInt2 < 16))
      {
        this.data = new byte[16];
        System.arraycopy(paramArrayOfByte, paramInt1, this.data, 0, paramInt2);
        this.position = 0;
        this.max = paramInt2;
        return;
      }
      this.data = paramArrayOfByte;
      this.position = paramInt1;
      this.max = (paramInt1 + paramInt2);
    }

    protected void attach(int paramInt, BinaryDecoder paramBinaryDecoder)
    {
      BinaryDecoder.access$302(paramBinaryDecoder, this.data);
      BinaryDecoder.access$402(paramBinaryDecoder, this.position);
      BinaryDecoder.access$602(paramBinaryDecoder, this.position);
      BinaryDecoder.access$502(paramBinaryDecoder, this.max);
      this.ba = new BinaryDecoder.BufferAccessor(paramBinaryDecoder, null);
    }

    public void close()
      throws IOException
    {
      this.ba.setPos(this.ba.getLim());
    }

    protected void compactAndFill(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
      throws IOException
    {
      if (!this.compacted)
      {
        byte[] arrayOfByte = new byte[paramInt3 + 16];
        System.arraycopy(paramArrayOfByte, paramInt1, arrayOfByte, 0, paramInt3);
        this.ba.setBuf(arrayOfByte, 0, paramInt3);
        this.compacted = true;
      }
    }

    public boolean isEof()
    {
      return this.ba.getLim() - this.ba.getPos() == 0;
    }

    public int read()
      throws IOException
    {
      this.max = this.ba.getLim();
      this.position = this.ba.getPos();
      if (this.position >= this.max)
        return -1;
      byte[] arrayOfByte = this.ba.getBuf();
      int i = this.position;
      this.position = (i + 1);
      int j = 0xFF & arrayOfByte[i];
      this.ba.setPos(this.position);
      return j;
    }

    protected void readRaw(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      if (tryReadRaw(paramArrayOfByte, paramInt1, paramInt2) < paramInt2)
        throw new EOFException();
    }

    protected void skipSourceBytes(long paramLong)
      throws IOException
    {
      if (trySkipBytes(paramLong) < paramLong)
        throw new EOFException();
    }

    protected int tryReadRaw(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      return 0;
    }

    protected long trySkipBytes(long paramLong)
      throws IOException
    {
      this.max = this.ba.getLim();
      this.position = this.ba.getPos();
      long l = this.max - this.position;
      if (l >= paramLong)
      {
        this.position = ((int)(paramLong + this.position));
        this.ba.setPos(this.position);
        return paramLong;
      }
      this.position = ((int)(l + this.position));
      this.ba.setPos(this.position);
      return l;
    }
  }

  static abstract class ByteSource extends InputStream
  {
    protected BinaryDecoder.BufferAccessor ba;

    protected void attach(int paramInt, BinaryDecoder paramBinaryDecoder)
    {
      BinaryDecoder.access$302(paramBinaryDecoder, new byte[paramInt]);
      BinaryDecoder.access$402(paramBinaryDecoder, 0);
      BinaryDecoder.access$602(paramBinaryDecoder, 0);
      BinaryDecoder.access$502(paramBinaryDecoder, 0);
      this.ba = new BinaryDecoder.BufferAccessor(paramBinaryDecoder, null);
    }

    public int available()
      throws IOException
    {
      return this.ba.getLim() - this.ba.getPos();
    }

    protected void compactAndFill(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
      throws IOException
    {
      System.arraycopy(paramArrayOfByte, paramInt1, paramArrayOfByte, paramInt2, paramInt3);
      this.ba.setPos(paramInt2);
      int i = paramInt3 + tryReadRaw(paramArrayOfByte, paramInt2 + paramInt3, paramArrayOfByte.length - paramInt3);
      this.ba.setLimit(i);
    }

    protected void detach()
    {
      this.ba.detach();
    }

    abstract boolean isEof();

    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      int i = this.ba.getLim();
      int j = this.ba.getPos();
      byte[] arrayOfByte = this.ba.getBuf();
      int k = i - j;
      if (k >= paramInt2)
      {
        System.arraycopy(arrayOfByte, j, paramArrayOfByte, paramInt1, paramInt2);
        int i1 = j + paramInt2;
        this.ba.setPos(i1);
        return paramInt2;
      }
      System.arraycopy(arrayOfByte, j, paramArrayOfByte, paramInt1, k);
      int m = j + k;
      this.ba.setPos(m);
      int n = k + tryReadRaw(paramArrayOfByte, paramInt1 + k, paramInt2 - k);
      if (n == 0)
        return -1;
      return n;
    }

    protected abstract void readRaw(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException;

    public long skip(long paramLong)
      throws IOException
    {
      int i = this.ba.getLim();
      int j = this.ba.getPos();
      int k = i - j;
      if (k > paramLong)
      {
        int m = (int)(paramLong + j);
        this.ba.setPos(m);
        return paramLong;
      }
      this.ba.setPos(i);
      return trySkipBytes(paramLong - k) + k;
    }

    protected abstract void skipSourceBytes(long paramLong)
      throws IOException;

    protected abstract int tryReadRaw(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException;

    protected abstract long trySkipBytes(long paramLong)
      throws IOException;
  }

  private static class InputStreamByteSource extends BinaryDecoder.ByteSource
  {
    private InputStream in;
    protected boolean isEof = false;

    private InputStreamByteSource(InputStream paramInputStream)
    {
      this.in = paramInputStream;
    }

    public void close()
      throws IOException
    {
      this.in.close();
    }

    public boolean isEof()
    {
      return this.isEof;
    }

    public int read()
      throws IOException
    {
      if (this.ba.getLim() - this.ba.getPos() == 0)
        return this.in.read();
      int i = this.ba.getPos();
      int j = 0xFF & this.ba.getBuf()[i];
      this.ba.setPos(i + 1);
      return j;
    }

    protected void readRaw(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      while (paramInt2 > 0)
      {
        int i = this.in.read(paramArrayOfByte, paramInt1, paramInt2);
        if (i < 0)
        {
          this.isEof = true;
          throw new EOFException();
        }
        paramInt2 -= i;
        paramInt1 += i;
      }
    }

    protected void skipSourceBytes(long paramLong)
      throws IOException
    {
      int i = 0;
      while (paramLong > 0L)
      {
        long l = this.in.skip(paramLong);
        if (l > 0L)
        {
          paramLong -= l;
        }
        else if (l == 0L)
        {
          if (i != 0)
          {
            this.isEof = true;
            throw new EOFException();
          }
          i = 1;
        }
        else
        {
          this.isEof = true;
          throw new EOFException();
        }
      }
    }

    protected int tryReadRaw(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      int i = paramInt2;
      while (true)
      {
        if (i > 0);
        try
        {
          int j = this.in.read(paramArrayOfByte, paramInt1, i);
          if (j < 0)
          {
            this.isEof = true;
            return paramInt2 - i;
          }
          i -= j;
          paramInt1 += j;
        }
        catch (EOFException localEOFException)
        {
          while (true)
            this.isEof = true;
        }
      }
    }

    protected long trySkipBytes(long paramLong)
      throws IOException
    {
      long l1 = paramLong;
      label75: for (int i = 0; ; i = 1)
      {
        while (true)
          if (l1 > 0L)
            try
            {
              long l2 = this.in.skip(paramLong);
              if (l2 > 0L)
              {
                l1 -= l2;
              }
              else if (l2 == 0L)
              {
                if (i == 0)
                  break label75;
                this.isEof = true;
              }
              else
              {
                this.isEof = true;
              }
            }
            catch (EOFException localEOFException)
            {
              this.isEof = true;
            }
        return paramLong - l1;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.BinaryDecoder
 * JD-Core Version:    0.6.2
 */