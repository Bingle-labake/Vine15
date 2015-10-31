package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessage;

public abstract interface bl extends IInterface
{
  public abstract void A(int paramInt)
    throws RemoteException;

  public abstract void a(int paramInt1, int paramInt2, String paramString)
    throws RemoteException;

  public abstract void a(int paramInt, String paramString)
    throws RemoteException;

  public abstract void a(int paramInt, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void a(k paramk1, k paramk2)
    throws RemoteException;

  public abstract void a(k paramk, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void b(k paramk)
    throws RemoteException;

  public abstract void b(k paramk, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void c(k paramk)
    throws RemoteException;

  public abstract void c(k paramk, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void d(k paramk)
    throws RemoteException;

  public abstract void d(k paramk, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void e(k paramk)
    throws RemoteException;

  public abstract void e(k paramk, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void f(k paramk)
    throws RemoteException;

  public abstract void f(k paramk, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void g(k paramk)
    throws RemoteException;

  public abstract void h(k paramk)
    throws RemoteException;

  public abstract void i(k paramk)
    throws RemoteException;

  public abstract void j(k paramk)
    throws RemoteException;

  public abstract void k(k paramk)
    throws RemoteException;

  public abstract void l(k paramk)
    throws RemoteException;

  public abstract void m(k paramk)
    throws RemoteException;

  public abstract void n(k paramk)
    throws RemoteException;

  public abstract void o(k paramk)
    throws RemoteException;

  public abstract void onAchievementUpdated(int paramInt, String paramString)
    throws RemoteException;

  public abstract void onLeftRoom(int paramInt, String paramString)
    throws RemoteException;

  public abstract void onRealTimeMessageReceived(RealTimeMessage paramRealTimeMessage)
    throws RemoteException;

  public abstract void onSignOutComplete()
    throws RemoteException;

  public abstract void p(k paramk)
    throws RemoteException;

  public abstract void q(k paramk)
    throws RemoteException;

  public abstract void r(k paramk)
    throws RemoteException;

  public abstract void s(k paramk)
    throws RemoteException;

  public abstract void t(k paramk)
    throws RemoteException;

  public abstract void u(k paramk)
    throws RemoteException;

  public abstract void v(k paramk)
    throws RemoteException;

  public abstract void w(k paramk)
    throws RemoteException;

  public abstract void x(int paramInt)
    throws RemoteException;

  public abstract void y(int paramInt)
    throws RemoteException;

  public abstract void z(int paramInt)
    throws RemoteException;

  public static abstract class a extends Binder
    implements bl
  {
    public a()
    {
      attachInterface(this, "com.google.android.gms.games.internal.IGamesCallbacks");
    }

    public static bl l(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.games.internal.IGamesCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof bl)))
        return (bl)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.games.internal.IGamesCallbacks");
        return true;
      case 5001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        a(paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i26 = paramParcel1.readInt();
        k localk30 = null;
        if (i26 != 0)
          localk30 = k.CREATOR.a(paramParcel1);
        b(localk30);
        paramParcel2.writeNoException();
        return true;
      case 5003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        onAchievementUpdated(paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i25 = paramParcel1.readInt();
        k localk29 = null;
        if (i25 != 0)
          localk29 = k.CREATOR.a(paramParcel1);
        c(localk29);
        paramParcel2.writeNoException();
        return true;
      case 5005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        if (paramParcel1.readInt() != 0);
        for (k localk27 = k.CREATOR.a(paramParcel1); ; localk27 = null)
        {
          int i24 = paramParcel1.readInt();
          k localk28 = null;
          if (i24 != 0)
            localk28 = k.CREATOR.a(paramParcel1);
          a(localk27, localk28);
          paramParcel2.writeNoException();
          return true;
        }
      case 5006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i23 = paramParcel1.readInt();
        k localk26 = null;
        if (i23 != 0)
          localk26 = k.CREATOR.a(paramParcel1);
        d(localk26);
        paramParcel2.writeNoException();
        return true;
      case 5007:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i22 = paramParcel1.readInt();
        k localk25 = null;
        if (i22 != 0)
          localk25 = k.CREATOR.a(paramParcel1);
        e(localk25);
        paramParcel2.writeNoException();
        return true;
      case 5008:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i21 = paramParcel1.readInt();
        k localk24 = null;
        if (i21 != 0)
          localk24 = k.CREATOR.a(paramParcel1);
        f(localk24);
        paramParcel2.writeNoException();
        return true;
      case 5009:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i20 = paramParcel1.readInt();
        k localk23 = null;
        if (i20 != 0)
          localk23 = k.CREATOR.a(paramParcel1);
        g(localk23);
        paramParcel2.writeNoException();
        return true;
      case 5010:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i19 = paramParcel1.readInt();
        k localk22 = null;
        if (i19 != 0)
          localk22 = k.CREATOR.a(paramParcel1);
        h(localk22);
        paramParcel2.writeNoException();
        return true;
      case 5011:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i18 = paramParcel1.readInt();
        k localk21 = null;
        if (i18 != 0)
          localk21 = k.CREATOR.a(paramParcel1);
        i(localk21);
        paramParcel2.writeNoException();
        return true;
      case 5012:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i17 = paramParcel1.readInt();
        k localk20 = null;
        if (i17 != 0)
          localk20 = k.CREATOR.a(paramParcel1);
        l(localk20);
        paramParcel2.writeNoException();
        return true;
      case 5013:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        x(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5014:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i16 = paramParcel1.readInt();
        k localk19 = null;
        if (i16 != 0)
          localk19 = k.CREATOR.a(paramParcel1);
        m(localk19);
        paramParcel2.writeNoException();
        return true;
      case 5015:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        y(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5016:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        onSignOutComplete();
        paramParcel2.writeNoException();
        return true;
      case 5017:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i15 = paramParcel1.readInt();
        k localk18 = null;
        if (i15 != 0)
          localk18 = k.CREATOR.a(paramParcel1);
        j(localk18);
        paramParcel2.writeNoException();
        return true;
      case 5037:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i14 = paramParcel1.readInt();
        k localk17 = null;
        if (i14 != 0)
          localk17 = k.CREATOR.a(paramParcel1);
        k(localk17);
        paramParcel2.writeNoException();
        return true;
      case 5018:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i13 = paramParcel1.readInt();
        k localk16 = null;
        if (i13 != 0)
          localk16 = k.CREATOR.a(paramParcel1);
        n(localk16);
        paramParcel2.writeNoException();
        return true;
      case 5019:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i12 = paramParcel1.readInt();
        k localk15 = null;
        if (i12 != 0)
          localk15 = k.CREATOR.a(paramParcel1);
        o(localk15);
        paramParcel2.writeNoException();
        return true;
      case 5020:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        onLeftRoom(paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5021:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i11 = paramParcel1.readInt();
        k localk14 = null;
        if (i11 != 0)
          localk14 = k.CREATOR.a(paramParcel1);
        p(localk14);
        paramParcel2.writeNoException();
        return true;
      case 5022:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i10 = paramParcel1.readInt();
        k localk13 = null;
        if (i10 != 0)
          localk13 = k.CREATOR.a(paramParcel1);
        q(localk13);
        paramParcel2.writeNoException();
        return true;
      case 5023:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i9 = paramParcel1.readInt();
        k localk12 = null;
        if (i9 != 0)
          localk12 = k.CREATOR.a(paramParcel1);
        r(localk12);
        paramParcel2.writeNoException();
        return true;
      case 5024:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i8 = paramParcel1.readInt();
        k localk11 = null;
        if (i8 != 0)
          localk11 = k.CREATOR.a(paramParcel1);
        s(localk11);
        paramParcel2.writeNoException();
        return true;
      case 5025:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i7 = paramParcel1.readInt();
        k localk10 = null;
        if (i7 != 0)
          localk10 = k.CREATOR.a(paramParcel1);
        t(localk10);
        paramParcel2.writeNoException();
        return true;
      case 5026:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i6 = paramParcel1.readInt();
        k localk9 = null;
        if (i6 != 0)
          localk9 = k.CREATOR.a(paramParcel1);
        a(localk9, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5027:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i5 = paramParcel1.readInt();
        k localk8 = null;
        if (i5 != 0)
          localk8 = k.CREATOR.a(paramParcel1);
        b(localk8, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5028:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i4 = paramParcel1.readInt();
        k localk7 = null;
        if (i4 != 0)
          localk7 = k.CREATOR.a(paramParcel1);
        c(localk7, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5029:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i3 = paramParcel1.readInt();
        k localk6 = null;
        if (i3 != 0)
          localk6 = k.CREATOR.a(paramParcel1);
        d(localk6, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5030:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i2 = paramParcel1.readInt();
        k localk5 = null;
        if (i2 != 0)
          localk5 = k.CREATOR.a(paramParcel1);
        e(localk5, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5031:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i1 = paramParcel1.readInt();
        k localk4 = null;
        if (i1 != 0)
          localk4 = k.CREATOR.a(paramParcel1);
        f(localk4, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5032:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int n = paramParcel1.readInt();
        RealTimeMessage localRealTimeMessage = null;
        if (n != 0)
          localRealTimeMessage = (RealTimeMessage)RealTimeMessage.CREATOR.createFromParcel(paramParcel1);
        onRealTimeMessageReceived(localRealTimeMessage);
        paramParcel2.writeNoException();
        return true;
      case 5033:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        a(paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5034:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int m = paramParcel1.readInt();
        String str = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (boolean bool = true; ; bool = false)
        {
          a(m, str, bool);
          paramParcel2.writeNoException();
          return true;
        }
      case 5038:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int k = paramParcel1.readInt();
        k localk3 = null;
        if (k != 0)
          localk3 = k.CREATOR.a(paramParcel1);
        u(localk3);
        paramParcel2.writeNoException();
        return true;
      case 5035:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int j = paramParcel1.readInt();
        k localk2 = null;
        if (j != 0)
          localk2 = k.CREATOR.a(paramParcel1);
        v(localk2);
        paramParcel2.writeNoException();
        return true;
      case 5036:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        z(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5039:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i = paramParcel1.readInt();
        k localk1 = null;
        if (i != 0)
          localk1 = k.CREATOR.a(paramParcel1);
        w(localk1);
        paramParcel2.writeNoException();
        return true;
      case 5040:
      }
      paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
      A(paramParcel1.readInt());
      paramParcel2.writeNoException();
      return true;
    }

    static class a
      implements bl
    {
      private IBinder a;

      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }

      public void A(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          this.a.transact(5040, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(int paramInt1, int paramInt2, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          localParcel1.writeString(paramString);
          this.a.transact(5033, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          this.a.transact(5001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(int paramInt, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.a.transact(5034, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(k paramk1, k paramk2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
            if (paramk1 != null)
            {
              localParcel1.writeInt(1);
              paramk1.writeToParcel(localParcel1, 0);
              if (paramk2 != null)
              {
                localParcel1.writeInt(1);
                paramk2.writeToParcel(localParcel1, 0);
                this.a.transact(5005, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          localParcel1.writeInt(0);
        }
      }

      public void a(k paramk, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.a.transact(5026, localParcel1, localParcel2, 0);
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

      public IBinder asBinder()
      {
        return this.a;
      }

      public void b(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5002, localParcel1, localParcel2, 0);
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

      public void b(k paramk, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.a.transact(5027, localParcel1, localParcel2, 0);
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

      public void c(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5004, localParcel1, localParcel2, 0);
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

      public void c(k paramk, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.a.transact(5028, localParcel1, localParcel2, 0);
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

      public void d(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5006, localParcel1, localParcel2, 0);
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

      public void d(k paramk, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.a.transact(5029, localParcel1, localParcel2, 0);
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

      public void e(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5007, localParcel1, localParcel2, 0);
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

      public void e(k paramk, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.a.transact(5030, localParcel1, localParcel2, 0);
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

      public void f(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5008, localParcel1, localParcel2, 0);
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

      public void f(k paramk, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.a.transact(5031, localParcel1, localParcel2, 0);
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

      public void g(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5009, localParcel1, localParcel2, 0);
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

      public void h(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5010, localParcel1, localParcel2, 0);
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

      public void i(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5011, localParcel1, localParcel2, 0);
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

      public void j(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5017, localParcel1, localParcel2, 0);
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

      public void k(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5037, localParcel1, localParcel2, 0);
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

      public void l(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5012, localParcel1, localParcel2, 0);
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

      public void m(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5014, localParcel1, localParcel2, 0);
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

      public void n(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5018, localParcel1, localParcel2, 0);
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

      public void o(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5019, localParcel1, localParcel2, 0);
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

      public void onAchievementUpdated(int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          this.a.transact(5003, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onLeftRoom(int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          this.a.transact(5020, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onRealTimeMessageReceived(RealTimeMessage paramRealTimeMessage)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramRealTimeMessage != null)
          {
            localParcel1.writeInt(1);
            paramRealTimeMessage.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5032, localParcel1, localParcel2, 0);
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

      public void onSignOutComplete()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          this.a.transact(5016, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void p(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5021, localParcel1, localParcel2, 0);
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

      public void q(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5022, localParcel1, localParcel2, 0);
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

      public void r(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5023, localParcel1, localParcel2, 0);
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

      public void s(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5024, localParcel1, localParcel2, 0);
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

      public void t(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5025, localParcel1, localParcel2, 0);
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

      public void u(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5038, localParcel1, localParcel2, 0);
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

      public void v(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5035, localParcel1, localParcel2, 0);
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

      public void w(k paramk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramk != null)
          {
            localParcel1.writeInt(1);
            paramk.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5039, localParcel1, localParcel2, 0);
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

      public void x(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          this.a.transact(5013, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void y(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          this.a.transact(5015, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void z(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          this.a.transact(5036, localParcel1, localParcel2, 0);
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
 * Qualified Name:     com.google.android.gms.internal.bl
 * JD-Core Version:    0.6.2
 */