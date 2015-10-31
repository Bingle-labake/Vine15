package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface cm extends IInterface
{
  public abstract bc f(dm paramdm)
    throws RemoteException;

  public abstract bc g(dm paramdm)
    throws RemoteException;

  public static abstract class a extends Binder
    implements cm
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.maps.internal.IInfoWindowAdapter");
    }

    public static cm v(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
      if ((localIInterface != null) && ((localIInterface instanceof cm)))
        return (cm)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IInfoWindowAdapter");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
        bc localbc2 = f(dm.a.M(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        IBinder localIBinder2 = null;
        if (localbc2 != null)
          localIBinder2 = localbc2.asBinder();
        paramParcel2.writeStrongBinder(localIBinder2);
        return true;
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
      bc localbc1 = g(dm.a.M(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      IBinder localIBinder1 = null;
      if (localbc1 != null)
        localIBinder1 = localbc1.asBinder();
      paramParcel2.writeStrongBinder(localIBinder1);
      return true;
    }

    static class a
      implements cm
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

      public bc f(dm paramdm)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IInfoWindowAdapter");
          if (paramdm != null);
          for (IBinder localIBinder = paramdm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            bc localbc = bc.a.j(localParcel2.readStrongBinder());
            return localbc;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public bc g(dm paramdm)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IInfoWindowAdapter");
          if (paramdm != null);
          for (IBinder localIBinder = paramdm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(2, localParcel1, localParcel2, 0);
            localParcel2.readException();
            bc localbc = bc.a.j(localParcel2.readStrongBinder());
            return localbc;
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
 * Qualified Name:     com.google.android.gms.internal.cm
 * JD-Core Version:    0.6.2
 */