package co.vine.android.network;

import java.io.IOException;
import java.io.InputStream;

public abstract interface HttpOperationReader
{
  public abstract void onHandleError(HttpResult paramHttpResult);

  public abstract void readInput(int paramInt1, int paramInt2, InputStream paramInputStream)
    throws IOException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.HttpOperationReader
 * JD-Core Version:    0.6.2
 */