package com.google.android.gms.maps.model;

import android.os.RemoteException;

public final class RuntimeRemoteException extends RuntimeException
{
  public RuntimeRemoteException(RemoteException paramRemoteException)
  {
    super(paramRemoteException);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.RuntimeRemoteException
 * JD-Core Version:    0.6.2
 */