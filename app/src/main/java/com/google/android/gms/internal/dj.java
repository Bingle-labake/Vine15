package com.google.android.gms.internal;

import android.graphics.Bitmap;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract interface dj extends IInterface
{
  public abstract bc N(int paramInt)
    throws RemoteException;

  public abstract bc a(Bitmap paramBitmap)
    throws RemoteException;

  public abstract bc bb()
    throws RemoteException;

  public abstract bc c(float paramFloat)
    throws RemoteException;

  public abstract bc x(String paramString)
    throws RemoteException;

  public abstract bc y(String paramString)
    throws RemoteException;

  public abstract bc z(String paramString)
    throws RemoteException;

  public static abstract class a extends Binder
    implements dj
  {
    public static dj J(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof dj)))
        return (dj)localIInterface;
      return new a(paramIBinder);
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        bc localbc7 = N(paramParcel1.readInt());
        paramParcel2.writeNoException();
        if (localbc7 != null);
        for (IBinder localIBinder7 = localbc7.asBinder(); ; localIBinder7 = null)
        {
          paramParcel2.writeStrongBinder(localIBinder7);
          return true;
        }
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        bc localbc6 = x(paramParcel1.readString());
        paramParcel2.writeNoException();
        IBinder localIBinder6 = null;
        if (localbc6 != null)
          localIBinder6 = localbc6.asBinder();
        paramParcel2.writeStrongBinder(localIBinder6);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        bc localbc5 = y(paramParcel1.readString());
        paramParcel2.writeNoException();
        IBinder localIBinder5 = null;
        if (localbc5 != null)
          localIBinder5 = localbc5.asBinder();
        paramParcel2.writeStrongBinder(localIBinder5);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        bc localbc4 = bb();
        paramParcel2.writeNoException();
        IBinder localIBinder4 = null;
        if (localbc4 != null)
          localIBinder4 = localbc4.asBinder();
        paramParcel2.writeStrongBinder(localIBinder4);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        bc localbc3 = c(paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder3 = null;
        if (localbc3 != null)
          localIBinder3 = localbc3.asBinder();
        paramParcel2.writeStrongBinder(localIBinder3);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (Bitmap localBitmap = (Bitmap)Bitmap.CREATOR.createFromParcel(paramParcel1); ; localBitmap = null)
        {
          bc localbc2 = a(localBitmap);
          paramParcel2.writeNoException();
          IBinder localIBinder2 = null;
          if (localbc2 != null)
            localIBinder2 = localbc2.asBinder();
          paramParcel2.writeStrongBinder(localIBinder2);
          return true;
        }
      case 7:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
      bc localbc1 = z(paramParcel1.readString());
      paramParcel2.writeNoException();
      IBinder localIBinder1 = null;
      if (localbc1 != null)
        localIBinder1 = localbc1.asBinder();
      paramParcel2.writeStrongBinder(localIBinder1);
      return true;
    }

    static class a
      implements dj
    {
      private IBinder a;

      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }

      public bc N(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          localParcel1.writeInt(paramInt);
          this.a.transact(1, localParcel1, localParcel2, 0);
          localParcel2.readException();
          bc localbc = bc.a.j(localParcel2.readStrongBinder());
          return localbc;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public bc a(Bitmap paramBitmap)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          if (paramBitmap != null)
          {
            localParcel1.writeInt(1);
            paramBitmap.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(6, localParcel1, localParcel2, 0);
            localParcel2.readException();
            bc localbc = bc.a.j(localParcel2.readStrongBinder());
            return localbc;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public IBinder asBinder()
      {
        return this.a;
      }

      public bc bb()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          this.a.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          bc localbc = bc.a.j(localParcel2.readStrongBinder());
          return localbc;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public bc c(float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          localParcel1.writeFloat(paramFloat);
          this.a.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          bc localbc = bc.a.j(localParcel2.readStrongBinder());
          return localbc;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public bc x(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          localParcel1.writeString(paramString);
          this.a.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          bc localbc = bc.a.j(localParcel2.readStrongBinder());
          return localbc;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public bc y(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          localParcel1.writeString(paramString);
          this.a.transact(3, localParcel1, localParcel2, 0);
          localParcel2.readException();
          bc localbc = bc.a.j(localParcel2.readStrongBinder());
          return localbc;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public bc z(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          localParcel1.writeString(paramString);
          this.a.transact(7, localParcel1, localParcel2, 0);
          localParcel2.readException();
          bc localbc = bc.a.j(localParcel2.readStrongBinder());
          return localbc;
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
 * Qualified Name:     com.google.android.gms.internal.dj
 * JD-Core Version:    0.6.2
 */