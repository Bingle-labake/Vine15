package com.crashlytics.android;

import java.io.Closeable;
import java.io.InputStream;
import java.io.OutputStream;

final class af extends HttpRequest.CloseOperation<HttpRequest>
{
  af(HttpRequest paramHttpRequest, Closeable paramCloseable, boolean paramBoolean, InputStream paramInputStream, OutputStream paramOutputStream)
  {
    super(paramCloseable, paramBoolean);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.af
 * JD-Core Version:    0.6.2
 */