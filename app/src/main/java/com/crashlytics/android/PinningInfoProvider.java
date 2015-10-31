package com.crashlytics.android;

import java.io.InputStream;

public abstract interface PinningInfoProvider
{
  public abstract String getKeyStorePassword();

  public abstract InputStream getKeyStoreStream();

  public abstract String[] getPins();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.PinningInfoProvider
 * JD-Core Version:    0.6.2
 */