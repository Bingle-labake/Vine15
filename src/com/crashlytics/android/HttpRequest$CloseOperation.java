package com.crashlytics.android;

import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;

public abstract class HttpRequest$CloseOperation<V> extends HttpRequest.Operation<V>
{
  private final Closeable a;
  private final boolean b;

  protected HttpRequest$CloseOperation(Closeable paramCloseable, boolean paramBoolean)
  {
    this.a = paramCloseable;
    this.b = paramBoolean;
  }

  protected final void b()
    throws IOException
  {
    if ((this.a instanceof Flushable))
      ((Flushable)this.a).flush();
    if (this.b);
    try
    {
      this.a.close();
      return;
      this.a.close();
      return;
    }
    catch (IOException localIOException)
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.HttpRequest.CloseOperation
 * JD-Core Version:    0.6.2
 */