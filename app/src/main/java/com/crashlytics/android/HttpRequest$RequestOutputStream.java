package com.crashlytics.android;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;

public class HttpRequest$RequestOutputStream extends BufferedOutputStream
{
  private final CharsetEncoder a;

  public HttpRequest$RequestOutputStream(OutputStream paramOutputStream, String paramString, int paramInt)
  {
    super(paramOutputStream, paramInt);
    this.a = Charset.forName(HttpRequest.a(paramString)).newEncoder();
  }

  public RequestOutputStream write(String paramString)
    throws IOException
  {
    ByteBuffer localByteBuffer = this.a.encode(CharBuffer.wrap(paramString));
    super.write(localByteBuffer.array(), 0, localByteBuffer.limit());
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.HttpRequest.RequestOutputStream
 * JD-Core Version:    0.6.2
 */