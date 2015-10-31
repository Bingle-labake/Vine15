package com.google.android.gms.games;

import android.os.ParcelFileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public abstract interface RealTimeSocket
{
  public abstract void close()
    throws IOException;

  public abstract InputStream getInputStream()
    throws IOException;

  public abstract OutputStream getOutputStream()
    throws IOException;

  public abstract ParcelFileDescriptor getParcelFileDescriptor()
    throws IOException;

  public abstract boolean isClosed();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.RealTimeSocket
 * JD-Core Version:    0.6.2
 */