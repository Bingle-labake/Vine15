package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract interface cb extends IInterface
{
  public abstract void onAddGeofencesResult(int paramInt, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void onRemoveGeofencesByPendingIntentResult(int paramInt, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void onRemoveGeofencesByRequestIdsResult(int paramInt, String[] paramArrayOfString)
    throws RemoteException;

  public static abstract class a extends Binder
    implements cb
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.location.internal.IGeofencerCallbacks");
    }

    public static cb o(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.location.internal.IGeofencerCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof cb)))
        return (cb)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.location.internal.IGeofencerCallbacks");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGeofencerCallbacks");
        onAddGeofencesResult(paramParcel1.readInt(), paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGeofencerCallbacks");
        onRemoveGeofencesByRequestIdsResult(paramParcel1.readInt(), paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 3:
      }
      paramParcel1.enforceInterface("com.google.android.gms.location.internal.IGeofencerCallbacks");
      int i = paramParcel1.readInt();
      if (paramParcel1.readInt() != 0);
      for (PendingIntent localPendingIntent = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent = null)
      {
        onRemoveGeofencesByPendingIntentResult(i, localPendingIntent);
        paramParcel2.writeNoException();
        return true;
      }
    }

    static class a
      implements cb
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

      public void onAddGeofencesResult(int paramInt, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGeofencerCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeStringArray(paramArrayOfString);
          this.a.transact(1, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onRemoveGeofencesByPendingIntentResult(int paramInt, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGeofencerCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramPendingIntent != null)
          {
            localParcel1.writeInt(1);
            paramPendingIntent.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(3, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onRemoveGeofencesByRequestIdsResult(int paramInt, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.IGeofencerCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeStringArray(paramArrayOfString);
          this.a.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
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
 * Qualified Name:     com.google.android.gms.internal.cb
 * JD-Core Version:    0.6.2
 */