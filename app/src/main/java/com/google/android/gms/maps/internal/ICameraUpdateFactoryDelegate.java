package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.internal.bc;
import com.google.android.gms.internal.bc.a;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.CameraPositionCreator;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.LatLngBoundsCreator;
import com.google.android.gms.maps.model.LatLngCreator;

public abstract interface ICameraUpdateFactoryDelegate extends IInterface
{
  public abstract bc newCameraPosition(CameraPosition paramCameraPosition)
    throws RemoteException;

  public abstract bc newLatLng(LatLng paramLatLng)
    throws RemoteException;

  public abstract bc newLatLngBounds(LatLngBounds paramLatLngBounds, int paramInt)
    throws RemoteException;

  public abstract bc newLatLngBoundsWithSize(LatLngBounds paramLatLngBounds, int paramInt1, int paramInt2, int paramInt3)
    throws RemoteException;

  public abstract bc newLatLngZoom(LatLng paramLatLng, float paramFloat)
    throws RemoteException;

  public abstract bc scrollBy(float paramFloat1, float paramFloat2)
    throws RemoteException;

  public abstract bc zoomBy(float paramFloat)
    throws RemoteException;

  public abstract bc zoomByWithFocus(float paramFloat, int paramInt1, int paramInt2)
    throws RemoteException;

  public abstract bc zoomIn()
    throws RemoteException;

  public abstract bc zoomOut()
    throws RemoteException;

  public abstract bc zoomTo(float paramFloat)
    throws RemoteException;

  public static abstract class a extends Binder
    implements ICameraUpdateFactoryDelegate
  {
    public static ICameraUpdateFactoryDelegate r(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof ICameraUpdateFactoryDelegate)))
        return (ICameraUpdateFactoryDelegate)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        bc localbc11 = zoomIn();
        paramParcel2.writeNoException();
        IBinder localIBinder11 = null;
        if (localbc11 != null)
          localIBinder11 = localbc11.asBinder();
        paramParcel2.writeStrongBinder(localIBinder11);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        bc localbc10 = zoomOut();
        paramParcel2.writeNoException();
        IBinder localIBinder10 = null;
        if (localbc10 != null)
          localIBinder10 = localbc10.asBinder();
        paramParcel2.writeStrongBinder(localIBinder10);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        bc localbc9 = scrollBy(paramParcel1.readFloat(), paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder9 = null;
        if (localbc9 != null)
          localIBinder9 = localbc9.asBinder();
        paramParcel2.writeStrongBinder(localIBinder9);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        bc localbc8 = zoomTo(paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder8 = null;
        if (localbc8 != null)
          localIBinder8 = localbc8.asBinder();
        paramParcel2.writeStrongBinder(localIBinder8);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        bc localbc7 = zoomBy(paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder7 = null;
        if (localbc7 != null)
          localIBinder7 = localbc7.asBinder();
        paramParcel2.writeStrongBinder(localIBinder7);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        bc localbc6 = zoomByWithFocus(paramParcel1.readFloat(), paramParcel1.readInt(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        IBinder localIBinder6 = null;
        if (localbc6 != null)
          localIBinder6 = localbc6.asBinder();
        paramParcel2.writeStrongBinder(localIBinder6);
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (CameraPosition localCameraPosition = CameraPosition.CREATOR.createFromParcel(paramParcel1); ; localCameraPosition = null)
        {
          bc localbc5 = newCameraPosition(localCameraPosition);
          paramParcel2.writeNoException();
          IBinder localIBinder5 = null;
          if (localbc5 != null)
            localIBinder5 = localbc5.asBinder();
          paramParcel2.writeStrongBinder(localIBinder5);
          return true;
        }
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (LatLng localLatLng2 = LatLng.CREATOR.createFromParcel(paramParcel1); ; localLatLng2 = null)
        {
          bc localbc4 = newLatLng(localLatLng2);
          paramParcel2.writeNoException();
          IBinder localIBinder4 = null;
          if (localbc4 != null)
            localIBinder4 = localbc4.asBinder();
          paramParcel2.writeStrongBinder(localIBinder4);
          return true;
        }
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (LatLng localLatLng1 = LatLng.CREATOR.createFromParcel(paramParcel1); ; localLatLng1 = null)
        {
          bc localbc3 = newLatLngZoom(localLatLng1, paramParcel1.readFloat());
          paramParcel2.writeNoException();
          IBinder localIBinder3 = null;
          if (localbc3 != null)
            localIBinder3 = localbc3.asBinder();
          paramParcel2.writeStrongBinder(localIBinder3);
          return true;
        }
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (LatLngBounds localLatLngBounds2 = LatLngBounds.CREATOR.createFromParcel(paramParcel1); ; localLatLngBounds2 = null)
        {
          bc localbc2 = newLatLngBounds(localLatLngBounds2, paramParcel1.readInt());
          paramParcel2.writeNoException();
          IBinder localIBinder2 = null;
          if (localbc2 != null)
            localIBinder2 = localbc2.asBinder();
          paramParcel2.writeStrongBinder(localIBinder2);
          return true;
        }
      case 11:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
      if (paramParcel1.readInt() != 0);
      for (LatLngBounds localLatLngBounds1 = LatLngBounds.CREATOR.createFromParcel(paramParcel1); ; localLatLngBounds1 = null)
      {
        bc localbc1 = newLatLngBoundsWithSize(localLatLngBounds1, paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        IBinder localIBinder1 = null;
        if (localbc1 != null)
          localIBinder1 = localbc1.asBinder();
        paramParcel2.writeStrongBinder(localIBinder1);
        return true;
      }
    }

    static class a
      implements ICameraUpdateFactoryDelegate
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

      public bc newCameraPosition(CameraPosition paramCameraPosition)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramCameraPosition != null)
          {
            localParcel1.writeInt(1);
            paramCameraPosition.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(7, localParcel1, localParcel2, 0);
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

      public bc newLatLng(LatLng paramLatLng)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramLatLng != null)
          {
            localParcel1.writeInt(1);
            paramLatLng.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(8, localParcel1, localParcel2, 0);
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

      public bc newLatLngBounds(LatLngBounds paramLatLngBounds, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramLatLngBounds != null)
          {
            localParcel1.writeInt(1);
            paramLatLngBounds.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeInt(paramInt);
            this.a.transact(10, localParcel1, localParcel2, 0);
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

      public bc newLatLngBoundsWithSize(LatLngBounds paramLatLngBounds, int paramInt1, int paramInt2, int paramInt3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramLatLngBounds != null)
          {
            localParcel1.writeInt(1);
            paramLatLngBounds.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            this.a.transact(11, localParcel1, localParcel2, 0);
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

      public bc newLatLngZoom(LatLng paramLatLng, float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramLatLng != null)
          {
            localParcel1.writeInt(1);
            paramLatLng.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeFloat(paramFloat);
            this.a.transact(9, localParcel1, localParcel2, 0);
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

      public bc scrollBy(float paramFloat1, float paramFloat2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat1);
          localParcel1.writeFloat(paramFloat2);
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

      public bc zoomBy(float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
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

      public bc zoomByWithFocus(float paramFloat, int paramInt1, int paramInt2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat);
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          this.a.transact(6, localParcel1, localParcel2, 0);
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

      public bc zoomIn()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
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

      public bc zoomOut()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
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

      public bc zoomTo(float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat);
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
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate
 * JD-Core Version:    0.6.2
 */