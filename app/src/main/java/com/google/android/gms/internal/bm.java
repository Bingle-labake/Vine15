package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract interface bm extends IInterface
{
  public abstract int a(bl parambl, byte[] paramArrayOfByte, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void a(long paramLong)
    throws RemoteException;

  public abstract void a(IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract void a(bl parambl)
    throws RemoteException;

  public abstract void a(bl parambl, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void a(bl parambl, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void a(bl parambl, long paramLong)
    throws RemoteException;

  public abstract void a(bl parambl, Bundle paramBundle, int paramInt1, int paramInt2)
    throws RemoteException;

  public abstract void a(bl parambl, IBinder paramIBinder, int paramInt, String[] paramArrayOfString, Bundle paramBundle, boolean paramBoolean, long paramLong)
    throws RemoteException;

  public abstract void a(bl parambl, IBinder paramIBinder, String paramString, boolean paramBoolean, long paramLong)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString, int paramInt, IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString, long paramLong)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString, IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void a(bl parambl, String paramString, boolean paramBoolean, long[] paramArrayOfLong)
    throws RemoteException;

  public abstract void a(bl parambl, boolean paramBoolean)
    throws RemoteException;

  public abstract void a(String paramString1, String paramString2, int paramInt)
    throws RemoteException;

  public abstract void aj()
    throws RemoteException;

  public abstract k ak()
    throws RemoteException;

  public abstract boolean al()
    throws RemoteException;

  public abstract int b(byte[] paramArrayOfByte, String paramString, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void b(long paramLong)
    throws RemoteException;

  public abstract void b(bl parambl)
    throws RemoteException;

  public abstract void b(bl parambl, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void b(bl parambl, String paramString)
    throws RemoteException;

  public abstract void b(bl parambl, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException;

  public abstract void b(bl parambl, String paramString, IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract void b(bl parambl, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void b(bl parambl, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException;

  public abstract void c(bl parambl)
    throws RemoteException;

  public abstract void c(bl parambl, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void c(bl parambl, String paramString)
    throws RemoteException;

  public abstract void c(bl parambl, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void clearNotifications(int paramInt)
    throws RemoteException;

  public abstract void d(bl parambl)
    throws RemoteException;

  public abstract void d(bl parambl, String paramString)
    throws RemoteException;

  public abstract void e(bl parambl)
    throws RemoteException;

  public abstract void e(bl parambl, String paramString)
    throws RemoteException;

  public abstract void e(String paramString1, String paramString2)
    throws RemoteException;

  public abstract void f(bl parambl)
    throws RemoteException;

  public abstract void f(bl parambl, String paramString)
    throws RemoteException;

  public abstract void g(bl parambl)
    throws RemoteException;

  public abstract void g(bl parambl, String paramString)
    throws RemoteException;

  public abstract String getAppId()
    throws RemoteException;

  public abstract String getCurrentAccountName()
    throws RemoteException;

  public abstract String getCurrentPlayerId()
    throws RemoteException;

  public abstract void h(bl parambl)
    throws RemoteException;

  public abstract void h(bl parambl, String paramString)
    throws RemoteException;

  public abstract void h(String paramString, int paramInt)
    throws RemoteException;

  public abstract void i(bl parambl)
    throws RemoteException;

  public abstract void i(bl parambl, String paramString)
    throws RemoteException;

  public abstract void i(String paramString, int paramInt)
    throws RemoteException;

  public abstract int j(bl parambl, String paramString)
    throws RemoteException;

  public abstract void j(String paramString, int paramInt)
    throws RemoteException;

  public abstract void k(bl parambl, String paramString)
    throws RemoteException;

  public abstract Bundle l()
    throws RemoteException;

  public abstract void l(bl parambl, String paramString)
    throws RemoteException;

  public abstract String q(String paramString)
    throws RemoteException;

  public abstract String r(String paramString)
    throws RemoteException;

  public abstract void s(String paramString)
    throws RemoteException;

  public abstract void setUseNewPlayerNotificationsFirstParty(boolean paramBoolean)
    throws RemoteException;

  public abstract int t(String paramString)
    throws RemoteException;

  public abstract Uri u(String paramString)
    throws RemoteException;

  public static abstract class a extends Binder
    implements bm
  {
    public static bm m(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.games.internal.IGamesService");
      if ((localIInterface != null) && ((localIInterface instanceof bm)))
        return (bm)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.games.internal.IGamesService");
        return true;
      case 5001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        a(paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 5002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        a(bl.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        String str18 = getAppId();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str18);
        return true;
      case 5004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        Bundle localBundle7 = l();
        paramParcel2.writeNoException();
        if (localBundle7 != null)
        {
          paramParcel2.writeInt(1);
          localBundle7.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 5005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        IBinder localIBinder6 = paramParcel1.readStrongBinder();
        int i32 = paramParcel1.readInt();
        Bundle localBundle6 = null;
        if (i32 != 0)
          localBundle6 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
        a(localIBinder6, localBundle6);
        paramParcel2.writeNoException();
        return true;
      case 5006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        aj();
        paramParcel2.writeNoException();
        return true;
      case 5007:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        String str17 = getCurrentAccountName();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str17);
        return true;
      case 5064:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        String str16 = q(paramParcel1.readString());
        paramParcel2.writeNoException();
        paramParcel2.writeString(str16);
        return true;
      case 5065:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        e(paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5008:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        a(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5009:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        a(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5010:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        b(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5011:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl18 = bl.a.l(paramParcel1.readStrongBinder());
        String str15 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (boolean bool21 = true; ; bool21 = false)
        {
          a(localbl18, str15, bool21, paramParcel1.createLongArray());
          paramParcel2.writeNoException();
          return true;
        }
      case 5012:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        String str14 = getCurrentPlayerId();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str14);
        return true;
      case 5013:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        k localk = ak();
        paramParcel2.writeNoException();
        if (localk != null)
        {
          paramParcel2.writeInt(1);
          localk.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 5014:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        c(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5015:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl17 = bl.a.l(paramParcel1.readStrongBinder());
        int i30 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (boolean bool19 = true; ; bool19 = false)
        {
          int i31 = paramParcel1.readInt();
          boolean bool20 = false;
          if (i31 != 0)
            bool20 = true;
          a(localbl17, i30, bool19, bool20);
          paramParcel2.writeNoException();
          return true;
        }
      case 5016:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        a(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 5017:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        b(bl.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5018:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        d(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5019:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl16 = bl.a.l(paramParcel1.readStrongBinder());
        String str13 = paramParcel1.readString();
        int i27 = paramParcel1.readInt();
        int i28 = paramParcel1.readInt();
        int i29 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (boolean bool18 = true; ; bool18 = false)
        {
          a(localbl16, str13, i27, i28, i29, bool18);
          paramParcel2.writeNoException();
          return true;
        }
      case 5020:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl15 = bl.a.l(paramParcel1.readStrongBinder());
        String str12 = paramParcel1.readString();
        int i24 = paramParcel1.readInt();
        int i25 = paramParcel1.readInt();
        int i26 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (boolean bool17 = true; ; bool17 = false)
        {
          b(localbl15, str12, i24, i25, i26, bool17);
          paramParcel2.writeNoException();
          return true;
        }
      case 5021:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl14 = bl.a.l(paramParcel1.readStrongBinder());
        int i23 = paramParcel1.readInt();
        Bundle localBundle5 = null;
        if (i23 != 0)
          localBundle5 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
        a(localbl14, localBundle5, paramParcel1.readInt(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5022:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        c(bl.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5023:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl13 = bl.a.l(paramParcel1.readStrongBinder());
        String str11 = paramParcel1.readString();
        IBinder localIBinder5 = paramParcel1.readStrongBinder();
        int i22 = paramParcel1.readInt();
        Bundle localBundle4 = null;
        if (i22 != 0)
          localBundle4 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
        a(localbl13, str11, localIBinder5, localBundle4);
        paramParcel2.writeNoException();
        return true;
      case 5024:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl12 = bl.a.l(paramParcel1.readStrongBinder());
        String str10 = paramParcel1.readString();
        IBinder localIBinder4 = paramParcel1.readStrongBinder();
        int i21 = paramParcel1.readInt();
        Bundle localBundle3 = null;
        if (i21 != 0)
          localBundle3 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
        b(localbl12, str10, localIBinder4, localBundle3);
        paramParcel2.writeNoException();
        return true;
      case 5025:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl11 = bl.a.l(paramParcel1.readStrongBinder());
        String str9 = paramParcel1.readString();
        int i20 = paramParcel1.readInt();
        IBinder localIBinder3 = paramParcel1.readStrongBinder();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle2 = null)
        {
          a(localbl11, str9, i20, localIBinder3, localBundle2);
          paramParcel2.writeNoException();
          return true;
        }
      case 5026:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        d(bl.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5027:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        e(bl.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5028:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        i(paramParcel1.readString(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5029:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        h(paramParcel1.readString(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5058:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        a(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 5059:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        b(paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 5030:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl10 = bl.a.l(paramParcel1.readStrongBinder());
        IBinder localIBinder2 = paramParcel1.readStrongBinder();
        int i19 = paramParcel1.readInt();
        String[] arrayOfString = paramParcel1.createStringArray();
        Bundle localBundle1;
        if (paramParcel1.readInt() != 0)
        {
          localBundle1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label1930;
        }
        for (boolean bool16 = true; ; bool16 = false)
        {
          a(localbl10, localIBinder2, i19, arrayOfString, localBundle1, bool16, paramParcel1.readLong());
          paramParcel2.writeNoException();
          return true;
          localBundle1 = null;
          break;
        }
      case 5031:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl9 = bl.a.l(paramParcel1.readStrongBinder());
        IBinder localIBinder1 = paramParcel1.readStrongBinder();
        String str8 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (boolean bool15 = true; ; bool15 = false)
        {
          a(localbl9, localIBinder1, str8, bool15, paramParcel1.readLong());
          paramParcel2.writeNoException();
          return true;
        }
      case 5032:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        e(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5033:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        int i18 = a(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.createByteArray(), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        paramParcel2.writeInt(i18);
        return true;
      case 5034:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        int i17 = b(paramParcel1.createByteArray(), paramParcel1.readString(), paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        paramParcel2.writeInt(i17);
        return true;
      case 5035:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        String str7 = r(paramParcel1.readString());
        paramParcel2.writeNoException();
        paramParcel2.writeString(str7);
        return true;
      case 5036:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        clearNotifications(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5037:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        f(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5038:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        b(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5039:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl8 = bl.a.l(paramParcel1.readStrongBinder());
        String str5 = paramParcel1.readString();
        String str6 = paramParcel1.readString();
        int i13 = paramParcel1.readInt();
        int i14 = paramParcel1.readInt();
        int i15 = paramParcel1.readInt();
        int i16 = paramParcel1.readInt();
        boolean bool14 = false;
        if (i16 != 0)
          bool14 = true;
        a(localbl8, str5, str6, i13, i14, i15, bool14);
        paramParcel2.writeNoException();
        return true;
      case 5040:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl7 = bl.a.l(paramParcel1.readStrongBinder());
        String str3 = paramParcel1.readString();
        String str4 = paramParcel1.readString();
        int i9 = paramParcel1.readInt();
        int i10 = paramParcel1.readInt();
        int i11 = paramParcel1.readInt();
        int i12 = paramParcel1.readInt();
        boolean bool13 = false;
        if (i12 != 0)
          bool13 = true;
        b(localbl7, str3, str4, i9, i10, i11, bool13);
        paramParcel2.writeNoException();
        return true;
      case 5041:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        c(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5042:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        g(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5043:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        h(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5044:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl6 = bl.a.l(paramParcel1.readStrongBinder());
        int i7 = paramParcel1.readInt();
        int i8 = paramParcel1.readInt();
        boolean bool11;
        if (paramParcel1.readInt() != 0)
        {
          bool11 = true;
          if (paramParcel1.readInt() == 0)
            break label2543;
        }
        for (boolean bool12 = true; ; bool12 = false)
        {
          a(localbl6, i7, i8, bool11, bool12);
          paramParcel2.writeNoException();
          return true;
          bool11 = false;
          break;
        }
      case 5045:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl5 = bl.a.l(paramParcel1.readStrongBinder());
        String str2 = paramParcel1.readString();
        int i6 = paramParcel1.readInt();
        boolean bool9;
        if (paramParcel1.readInt() != 0)
        {
          bool9 = true;
          if (paramParcel1.readInt() == 0)
            break label2622;
        }
        for (boolean bool10 = true; ; bool10 = false)
        {
          a(localbl5, str2, i6, bool9, bool10);
          paramParcel2.writeNoException();
          return true;
          bool9 = false;
          break;
        }
      case 5046:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl4 = bl.a.l(paramParcel1.readStrongBinder());
        int i4 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (boolean bool7 = true; ; bool7 = false)
        {
          int i5 = paramParcel1.readInt();
          boolean bool8 = false;
          if (i5 != 0)
            bool8 = true;
          b(localbl4, i4, bool7, bool8);
          paramParcel2.writeNoException();
          return true;
        }
      case 5047:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        f(bl.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5048:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl3 = bl.a.l(paramParcel1.readStrongBinder());
        int i2 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (boolean bool5 = true; ; bool5 = false)
        {
          int i3 = paramParcel1.readInt();
          boolean bool6 = false;
          if (i3 != 0)
            bool6 = true;
          c(localbl3, i2, bool5, bool6);
          paramParcel2.writeNoException();
          return true;
        }
      case 5049:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        g(bl.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5050:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        s(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5051:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        a(paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5052:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        i(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5053:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        int i1 = j(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        paramParcel2.writeInt(i1);
        return true;
      case 5060:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        int n = t(paramParcel1.readString());
        paramParcel2.writeNoException();
        paramParcel2.writeInt(n);
        return true;
      case 5054:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        bl localbl2 = bl.a.l(paramParcel1.readStrongBinder());
        String str1 = paramParcel1.readString();
        int m = paramParcel1.readInt();
        boolean bool4 = false;
        if (m != 0)
          bool4 = true;
        a(localbl2, str1, bool4);
        paramParcel2.writeNoException();
        return true;
      case 5061:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        k(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5055:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        j(paramParcel1.readString(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5067:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        boolean bool3 = al();
        paramParcel2.writeNoException();
        int k = 0;
        if (bool3)
          k = 1;
        paramParcel2.writeInt(k);
        return true;
      case 5068:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        int j = paramParcel1.readInt();
        boolean bool2 = false;
        if (j != 0)
          bool2 = true;
        setUseNewPlayerNotificationsFirstParty(bool2);
        paramParcel2.writeNoException();
        return true;
      case 5056:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        h(bl.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5057:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        l(bl.a.l(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5062:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        i(bl.a.l(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5063:
        label1930: label2543: paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        label2622: bl localbl1 = bl.a.l(paramParcel1.readStrongBinder());
        int i = paramParcel1.readInt();
        boolean bool1 = false;
        if (i != 0)
          bool1 = true;
        a(localbl1, bool1);
        paramParcel2.writeNoException();
        return true;
      case 5066:
      }
      paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
      Uri localUri = u(paramParcel1.readString());
      paramParcel2.writeNoException();
      if (localUri != null)
      {
        paramParcel2.writeInt(1);
        localUri.writeToParcel(paramParcel2, 1);
        return true;
      }
      paramParcel2.writeInt(0);
      return true;
    }

    static class a
      implements bm
    {
      private IBinder a;

      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }

      public int a(bl parambl, byte[] paramArrayOfByte, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeByteArray(paramArrayOfByte);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.a.transact(5033, localParcel1, localParcel2, 0);
            localParcel2.readException();
            int i = localParcel2.readInt();
            return i;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
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

      public void a(IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeStrongBinder(paramIBinder);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5005, localParcel1, localParcel2, 0);
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

      public void a(bl parambl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5002, localParcel1, localParcel2, 0);
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

      public void a(bl parambl, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (parambl != null)
          {
            localIBinder = parambl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            if (!paramBoolean1)
              break label119;
            j = i;
            label60: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label125;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.a.transact(5044, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label119: j = 0;
            break label60;
            label125: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(bl parambl, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (parambl != null)
          {
            localIBinder = parambl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label112;
            j = i;
            label53: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label118;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.a.transact(5015, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label112: j = 0;
            break label53;
            label118: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(bl parambl, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            this.a.transact(5058, localParcel1, localParcel2, 0);
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

      public void a(bl parambl, Bundle paramBundle, int paramInt1, int paramInt2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (parambl != null)
          {
            localIBinder = parambl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramBundle == null)
              break label106;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            this.a.transact(5021, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label106: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(bl parambl, IBinder paramIBinder, int paramInt, String[] paramArrayOfString, Bundle paramBundle, boolean paramBoolean, long paramLong)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            IBinder localIBinder;
            if (parambl != null)
            {
              localIBinder = parambl.asBinder();
              localParcel1.writeStrongBinder(localIBinder);
              localParcel1.writeStrongBinder(paramIBinder);
              localParcel1.writeInt(paramInt);
              localParcel1.writeStringArray(paramArrayOfString);
              if (paramBundle != null)
              {
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
                break label164;
                localParcel1.writeInt(i);
                localParcel1.writeLong(paramLong);
                this.a.transact(5030, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder = null;
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          label164: 
          while (!paramBoolean)
          {
            i = 0;
            break;
          }
        }
      }

      public void a(bl parambl, IBinder paramIBinder, String paramString, boolean paramBoolean, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeStrongBinder(paramIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            localParcel1.writeLong(paramLong);
            this.a.transact(5031, localParcel1, localParcel2, 0);
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

      public void a(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public void a(bl parambl, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.a.transact(5019, localParcel1, localParcel2, 0);
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

      public void a(bl parambl, String paramString, int paramInt, IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (parambl != null)
          {
            localIBinder = parambl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            localParcel1.writeStrongBinder(paramIBinder);
            if (paramBundle == null)
              break label114;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5025, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label114: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(bl parambl, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (parambl != null)
          {
            localIBinder = parambl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label119;
            j = i;
            label60: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label125;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.a.transact(5045, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label119: j = 0;
            break label60;
            label125: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(bl parambl, String paramString, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeLong(paramLong);
            this.a.transact(5016, localParcel1, localParcel2, 0);
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

      public void a(bl parambl, String paramString, IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (parambl != null)
          {
            localIBinder = parambl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeStrongBinder(paramIBinder);
            if (paramBundle == null)
              break label107;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5023, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label107: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(bl parambl, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
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

      public void a(bl parambl, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.a.transact(5039, localParcel1, localParcel2, 0);
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

      public void a(bl parambl, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.a.transact(5054, localParcel1, localParcel2, 0);
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

      public void a(bl parambl, String paramString, boolean paramBoolean, long[] paramArrayOfLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            localParcel1.writeLongArray(paramArrayOfLong);
            this.a.transact(5011, localParcel1, localParcel2, 0);
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

      public void a(bl parambl, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.a.transact(5063, localParcel1, localParcel2, 0);
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

      public void a(String paramString1, String paramString2, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          localParcel1.writeInt(paramInt);
          this.a.transact(5051, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void aj()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.a.transact(5006, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public k ak()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.a.transact(5013, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            k localk2 = k.CREATOR.a(localParcel2);
            localk1 = localk2;
            return localk1;
          }
          k localk1 = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public boolean al()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.a.transact(5067, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0)
            bool = true;
          return bool;
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

      public int b(byte[] paramArrayOfByte, String paramString, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeByteArray(paramArrayOfByte);
          localParcel1.writeString(paramString);
          localParcel1.writeStringArray(paramArrayOfString);
          this.a.transact(5034, localParcel1, localParcel2, 0);
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

      public void b(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
          this.a.transact(5059, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void b(bl parambl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5017, localParcel1, localParcel2, 0);
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

      public void b(bl parambl, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (parambl != null)
          {
            localIBinder = parambl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label112;
            j = i;
            label53: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label118;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.a.transact(5046, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label112: j = 0;
            break label53;
            label118: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void b(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5010, localParcel1, localParcel2, 0);
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

      public void b(bl parambl, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.a.transact(5020, localParcel1, localParcel2, 0);
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

      public void b(bl parambl, String paramString, IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (parambl != null)
          {
            localIBinder = parambl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeStrongBinder(paramIBinder);
            if (paramBundle == null)
              break label107;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(5024, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label107: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void b(bl parambl, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.a.transact(5038, localParcel1, localParcel2, 0);
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

      public void b(bl parambl, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.a.transact(5040, localParcel1, localParcel2, 0);
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

      public void c(bl parambl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5022, localParcel1, localParcel2, 0);
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

      public void c(bl parambl, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (parambl != null)
          {
            localIBinder = parambl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label112;
            j = i;
            label53: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label118;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.a.transact(5048, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label112: j = 0;
            break label53;
            label118: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void c(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5014, localParcel1, localParcel2, 0);
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

      public void c(bl parambl, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.a.transact(5041, localParcel1, localParcel2, 0);
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

      public void clearNotifications(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
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

      public void d(bl parambl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5026, localParcel1, localParcel2, 0);
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

      public void d(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5018, localParcel1, localParcel2, 0);
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

      public void e(bl parambl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5027, localParcel1, localParcel2, 0);
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

      public void e(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5032, localParcel1, localParcel2, 0);
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

      public void e(String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          this.a.transact(5065, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void f(bl parambl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5047, localParcel1, localParcel2, 0);
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

      public void f(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5037, localParcel1, localParcel2, 0);
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

      public void g(bl parambl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5049, localParcel1, localParcel2, 0);
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

      public void g(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5042, localParcel1, localParcel2, 0);
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

      public String getAppId()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.a.transact(5003, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String getCurrentAccountName()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.a.transact(5007, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String getCurrentPlayerId()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.a.transact(5012, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void h(bl parambl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5056, localParcel1, localParcel2, 0);
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

      public void h(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5043, localParcel1, localParcel2, 0);
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

      public void h(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          this.a.transact(5029, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void i(bl parambl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(5062, localParcel1, localParcel2, 0);
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

      public void i(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5052, localParcel1, localParcel2, 0);
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

      public void i(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          this.a.transact(5028, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int j(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5053, localParcel1, localParcel2, 0);
            localParcel2.readException();
            int i = localParcel2.readInt();
            return i;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void j(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          this.a.transact(5055, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void k(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5061, localParcel1, localParcel2, 0);
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

      public Bundle l()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.a.transact(5004, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localBundle = (Bundle)Bundle.CREATOR.createFromParcel(localParcel2);
            return localBundle;
          }
          Bundle localBundle = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void l(bl parambl, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (parambl != null);
          for (IBinder localIBinder = parambl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(5057, localParcel1, localParcel2, 0);
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

      public String q(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.a.transact(5064, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String r(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.a.transact(5035, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void s(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.a.transact(5050, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void setUseNewPlayerNotificationsFirstParty(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.a.transact(5068, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int t(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.a.transact(5060, localParcel1, localParcel2, 0);
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

      public Uri u(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.a.transact(5066, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localUri = (Uri)Uri.CREATOR.createFromParcel(localParcel2);
            return localUri;
          }
          Uri localUri = null;
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
 * Qualified Name:     com.google.android.gms.internal.bm
 * JD-Core Version:    0.6.2
 */