package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.GoogleMapOptionsCreator;
import com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate;
import com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate.a;
import com.google.android.gms.maps.internal.IMapFragmentDelegate;
import com.google.android.gms.maps.internal.IMapFragmentDelegate.a;
import com.google.android.gms.maps.internal.IMapViewDelegate;
import com.google.android.gms.maps.internal.IMapViewDelegate.a;

public abstract interface cl extends IInterface
{
  public abstract IMapViewDelegate a(bc parambc, GoogleMapOptions paramGoogleMapOptions)
    throws RemoteException;

  public abstract void a(bc parambc, int paramInt)
    throws RemoteException;

  public abstract ICameraUpdateFactoryDelegate aR()
    throws RemoteException;

  public abstract dj aS()
    throws RemoteException;

  public abstract void c(bc parambc)
    throws RemoteException;

  public abstract IMapFragmentDelegate d(bc parambc)
    throws RemoteException;

  public static abstract class a extends Binder
    implements cl
  {
    public static cl t(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.ICreator");
      if ((localIInterface != null) && ((localIInterface instanceof cl)))
        return (cl)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.ICreator");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        c(bc.a.j(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        IMapFragmentDelegate localIMapFragmentDelegate = d(bc.a.j(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        IBinder localIBinder4 = null;
        if (localIMapFragmentDelegate != null)
          localIBinder4 = localIMapFragmentDelegate.asBinder();
        paramParcel2.writeStrongBinder(localIBinder4);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        bc localbc = bc.a.j(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0);
        for (GoogleMapOptions localGoogleMapOptions = GoogleMapOptions.CREATOR.createFromParcel(paramParcel1); ; localGoogleMapOptions = null)
        {
          IMapViewDelegate localIMapViewDelegate = a(localbc, localGoogleMapOptions);
          paramParcel2.writeNoException();
          IBinder localIBinder3 = null;
          if (localIMapViewDelegate != null)
            localIBinder3 = localIMapViewDelegate.asBinder();
          paramParcel2.writeStrongBinder(localIBinder3);
          return true;
        }
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        ICameraUpdateFactoryDelegate localICameraUpdateFactoryDelegate = aR();
        paramParcel2.writeNoException();
        IBinder localIBinder2 = null;
        if (localICameraUpdateFactoryDelegate != null)
          localIBinder2 = localICameraUpdateFactoryDelegate.asBinder();
        paramParcel2.writeStrongBinder(localIBinder2);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
        dj localdj = aS();
        paramParcel2.writeNoException();
        IBinder localIBinder1 = null;
        if (localdj != null)
          localIBinder1 = localdj.asBinder();
        paramParcel2.writeStrongBinder(localIBinder1);
        return true;
      case 6:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICreator");
      a(bc.a.j(paramParcel1.readStrongBinder()), paramParcel1.readInt());
      paramParcel2.writeNoException();
      return true;
    }

    static class a
      implements cl
    {
      private IBinder a;

      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }

      public IMapViewDelegate a(bc parambc, GoogleMapOptions paramGoogleMapOptions)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          IBinder localIBinder;
          if (parambc != null)
          {
            localIBinder = parambc.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramGoogleMapOptions == null)
              break label96;
            localParcel1.writeInt(1);
            paramGoogleMapOptions.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(3, localParcel1, localParcel2, 0);
            localParcel2.readException();
            IMapViewDelegate localIMapViewDelegate = IMapViewDelegate.a.y(localParcel2.readStrongBinder());
            return localIMapViewDelegate;
            localIBinder = null;
            break;
            label96: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(bc parambc, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          if (parambc != null);
          for (IBinder localIBinder = parambc.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            this.a.transact(6, localParcel1, localParcel2, 0);
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

      public ICameraUpdateFactoryDelegate aR()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          this.a.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          ICameraUpdateFactoryDelegate localICameraUpdateFactoryDelegate = ICameraUpdateFactoryDelegate.a.r(localParcel2.readStrongBinder());
          return localICameraUpdateFactoryDelegate;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public dj aS()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          this.a.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          dj localdj = dj.a.J(localParcel2.readStrongBinder());
          return localdj;
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

      public void c(bc parambc)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
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

      public IMapFragmentDelegate d(bc parambc)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICreator");
          if (parambc != null);
          for (IBinder localIBinder = parambc.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(2, localParcel1, localParcel2, 0);
            localParcel2.readException();
            IMapFragmentDelegate localIMapFragmentDelegate = IMapFragmentDelegate.a.x(localParcel2.readStrongBinder());
            return localIMapFragmentDelegate;
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
 * Qualified Name:     com.google.android.gms.internal.cl
 * JD-Core Version:    0.6.2
 */