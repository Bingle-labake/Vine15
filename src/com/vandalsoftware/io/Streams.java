package com.vandalsoftware.io;

import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.StringWriter;
import java.util.concurrent.atomic.AtomicReference;

public final class Streams
{
  private static AtomicReference<byte[]> skipBuffer = new AtomicReference();

  private static void checkOffsetAndCount(int paramInt1, int paramInt2, int paramInt3)
    throws EOFException
  {
    if (paramInt2 + paramInt3 > paramInt1)
      throw new EOFException();
  }

  public static int copy(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    int i = 0;
    byte[] arrayOfByte = new byte[8192];
    while (true)
    {
      int j = paramInputStream.read(arrayOfByte);
      if (j == -1)
        break;
      i += j;
      paramOutputStream.write(arrayOfByte, 0, j);
    }
    return i;
  }

  public static String readAsciiLine(InputStream paramInputStream)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder(80);
    while (true)
    {
      int i = paramInputStream.read();
      if (i == -1)
        throw new EOFException();
      if (i == 10)
      {
        int j = localStringBuilder.length();
        if ((j > 0) && (localStringBuilder.charAt(j - 1) == '\r'))
          localStringBuilder.setLength(j - 1);
        return localStringBuilder.toString();
      }
      localStringBuilder.append((char)i);
    }
  }

  public static String readFully(Reader paramReader)
    throws IOException
  {
    StringWriter localStringWriter;
    try
    {
      localStringWriter = new StringWriter();
      char[] arrayOfChar = new char[1024];
      while (true)
      {
        int i = paramReader.read(arrayOfChar);
        if (i == -1)
          break;
        localStringWriter.write(arrayOfChar, 0, i);
      }
    }
    finally
    {
      paramReader.close();
    }
    String str = localStringWriter.toString();
    paramReader.close();
    return str;
  }

  public static void readFully(InputStream paramInputStream, byte[] paramArrayOfByte)
    throws IOException
  {
    readFully(paramInputStream, paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public static void readFully(InputStream paramInputStream, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramInt2 == 0);
    while (true)
    {
      return;
      if (paramInputStream == null)
        throw new NullPointerException("in == null");
      if (paramArrayOfByte == null)
        throw new NullPointerException("dst == null");
      checkOffsetAndCount(paramArrayOfByte.length, paramInt1, paramInt2);
      while (paramInt2 > 0)
      {
        int i = paramInputStream.read(paramArrayOfByte, paramInt1, paramInt2);
        if (i < 0)
          throw new EOFException();
        paramInt1 += i;
        paramInt2 -= i;
      }
    }
  }

  public static byte[] readFully(InputStream paramInputStream)
    throws IOException
  {
    try
    {
      byte[] arrayOfByte = readFullyNoClose(paramInputStream);
      return arrayOfByte;
    }
    finally
    {
      paramInputStream.close();
    }
  }

  public static byte[] readFullyNoClose(InputStream paramInputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    byte[] arrayOfByte = new byte[1024];
    while (true)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (i == -1)
        break;
      localByteArrayOutputStream.write(arrayOfByte, 0, i);
    }
    return localByteArrayOutputStream.toByteArray();
  }

  public static int readSingleByte(InputStream paramInputStream)
    throws IOException
  {
    int i = -1;
    byte[] arrayOfByte = new byte[1];
    if (paramInputStream.read(arrayOfByte, 0, 1) != i)
      i = 0xFF & arrayOfByte[0];
    return i;
  }

  public static String readStringFrom(InputStream paramInputStream)
    throws IOException
  {
    return readFully(new InputStreamReader(paramInputStream, "UTF-8"));
  }

  public static int skipAll(InputStream paramInputStream)
    throws IOException
  {
    int i = 0;
    do
      i = (int)(i + paramInputStream.skip(9223372036854775807L));
    while (paramInputStream.read() != -1);
    return i;
  }

  public static long skipByReading(InputStream paramInputStream, long paramLong)
    throws IOException
  {
    byte[] arrayOfByte = (byte[])skipBuffer.getAndSet(null);
    if (arrayOfByte == null)
      arrayOfByte = new byte[4096];
    long l = 0L;
    int i;
    int j;
    if (l < paramLong)
    {
      i = (int)Math.min(paramLong - l, arrayOfByte.length);
      j = paramInputStream.read(arrayOfByte, 0, i);
      if (j != -1)
        break label70;
    }
    while (true)
    {
      skipBuffer.set(arrayOfByte);
      return l;
      label70: l += j;
      if (j >= i)
        break;
    }
  }

  public static void writeSingleByte(OutputStream paramOutputStream, int paramInt)
    throws IOException
  {
    byte[] arrayOfByte = new byte[1];
    arrayOfByte[0] = ((byte)(paramInt & 0xFF));
    paramOutputStream.write(arrayOfByte);
  }

  // ERROR //
  public static void writeStringTo(OutputStream paramOutputStream, String paramString)
    throws IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: new 160	java/io/OutputStreamWriter
    //   5: dup
    //   6: aload_0
    //   7: ldc 121
    //   9: invokespecial 162	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/lang/String;)V
    //   12: astore_3
    //   13: aload_3
    //   14: aload_1
    //   15: invokevirtual 166	java/io/Writer:write	(Ljava/lang/String;)V
    //   18: aload_3
    //   19: invokestatic 172	com/vandalsoftware/io/IoUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   22: return
    //   23: astore 4
    //   25: aload_2
    //   26: invokestatic 172	com/vandalsoftware/io/IoUtils:closeQuietly	(Ljava/io/Closeable;)V
    //   29: aload 4
    //   31: athrow
    //   32: astore 4
    //   34: aload_3
    //   35: astore_2
    //   36: goto -11 -> 25
    //
    // Exception table:
    //   from	to	target	type
    //   2	13	23	finally
    //   13	18	32	finally
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.vandalsoftware.io.Streams
 * JD-Core Version:    0.6.2
 */