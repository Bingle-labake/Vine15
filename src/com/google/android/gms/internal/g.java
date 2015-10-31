package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface g extends IInterface
{
  public abstract void a(f paramf)
    throws RemoteException;

  public abstract void a(f paramf, int paramInt)
    throws RemoteException;

  public abstract void a(f paramf, int paramInt, String paramString, byte[] paramArrayOfByte)
    throws RemoteException;

  public abstract void a(f paramf, int paramInt, byte[] paramArrayOfByte)
    throws RemoteException;

  public abstract void b(f paramf)
    throws RemoteException;

  public abstract void b(f paramf, int paramInt)
    throws RemoteException;

  public abstract void c(f paramf)
    throws RemoteException;

  public abstract int getMaxNumKeys()
    throws RemoteException;

  public abstract int getMaxStateSize()
    throws RemoteException;

  public static abstract class a extends Binder
    implements g
  {
    public static g e(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.appstate.internal.IAppStateService");
      if ((localIInterface != null) && ((localIInterface instanceof g)))
        return (g)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.appstate.internal.IAppStateService");
        return true;
      case 5001:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        int j = getMaxStateSize();
        paramParcel2.writeNoException();
        paramParcel2.writeInt(j);
        return true;
      case 5002:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        int i = getMaxNumKeys();
        paramParcel2.writeNoException();
        paramParcel2.writeInt(i);
        return true;
      case 5003:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        a(f.a.d(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 5004:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        a(f.a.d(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5005:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        a(f.a.d(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5006:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        a(f.a.d(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readString(), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 5007:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        b(f.a.d(paramParcel1.readStrongBinder()), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5008:
        paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
        b(f.a.d(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5009:
      }
      paramParcel1.enforceInterface("com.google.android.gms.appstate.internal.IAppStateService");
      c(f.a.d(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }

    static class a
      implements g
    {
      private IBinder a;

      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }

      public void a(f paramf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramf != null);
          for (IBinder localIBinder = paramf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5005, localParcel1, localParcel2, 0);
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

      public void a(f paramf, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramf != null);
          for (IBinder localIBinder = paramf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            this.a.transact(5004, localParcel1, localParcel2, 0);
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

      public void a(f paramf, int paramInt, String paramString, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramf != null);
          for (IBinder localIBinder = paramf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeString(paramString);
            localParcel1.writeByteArray(paramArrayOfByte);
            this.a.transact(5006, localParcel1, localParcel2, 0);
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

      public void a(f paramf, int paramInt, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramf != null);
          for (IBinder localIBinder = paramf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeByteArray(paramArrayOfByte);
            this.a.transact(5003, localParcel1, localParcel2, 0);
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

      public IBinder asBinder()
      {
        return this.a;
      }

      public void b(f paramf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramf != null);
          for (IBinder localIBinder = paramf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5008, localParcel1, localParcel2, 0);
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

      public void b(f paramf, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramf != null);
          for (IBinder localIBinder = paramf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            this.a.transact(5007, localParcel1, localParcel2, 0);
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

      public void c(f paramf)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          if (paramf != null);
          for (IBinder localIBinder = paramf.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5009, localParcel1, localParcel2, 0);
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

      public int getMaxNumKeys()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          this.a.transact(5002, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int getMaxStateSize()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.appstate.internal.IAppStateService");
          this.a.transact(5001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
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
 * Qualified Name:     com.google.android.gms.internal.g
 * JD-Core Version:    0.6.2
 */