package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface cu extends IInterface
{
  public abstract void b(bc parambc)
    throws RemoteException;

  public static abstract class a extends Binder
    implements cu
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
    }

    public static cu G(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
      if ((localIInterface != null) && ((localIInterface instanceof cu)))
        return (cu)localIInterface;
      return new a(paramIBinder);
    }

    public IBinder asBinder()
    {
      return this;
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
      b(bc.a.j(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }

    static class a
      implements cu
    {
      private IBinder a;

      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }

      public IBinder asBinder()
      {
        return this.a;
      }

      public void b(bc parambc)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IOnMyLocationChangeListener");
          if (parambc != null);
          for (IBinder localIBinder = parambc.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.cu
 * JD-Core Version:    0.6.2
 */