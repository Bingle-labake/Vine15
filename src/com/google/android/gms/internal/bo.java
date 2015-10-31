package com.google.android.gms.internal;

import android.net.LocalSocket;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import com.google.android.gms.games.RealTimeSocket;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

final class bo
  implements RealTimeSocket
{
  private final LocalSocket dl;
  private final String dm;
  private ParcelFileDescriptor dn;

  bo(LocalSocket paramLocalSocket, String paramString)
  {
    this.dl = paramLocalSocket;
    this.dm = paramString;
  }

  public void close()
    throws IOException
  {
    this.dl.close();
  }

  public InputStream getInputStream()
    throws IOException
  {
    return this.dl.getInputStream();
  }

  public OutputStream getOutputStream()
    throws IOException
  {
    return this.dl.getOutputStream();
  }

  public ParcelFileDescriptor getParcelFileDescriptor()
    throws IOException
  {
    if ((this.dn == null) && (!isClosed()))
    {
      Parcel localParcel = Parcel.obtain();
      localParcel.writeFileDescriptor(this.dl.getFileDescriptor());
      localParcel.setDataPosition(0);
      this.dn = localParcel.readFileDescriptor();
    }
    return this.dn;
  }

  public boolean isClosed()
  {
    return (!this.dl.isConnected()) && (!this.dl.isBound());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bo
 * JD-Core Version:    0.6.2
 */