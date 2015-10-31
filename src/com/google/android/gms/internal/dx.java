package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import java.util.List;

public abstract interface dx extends IInterface
{
  public abstract void a(at paramat)
    throws RemoteException;

  public abstract void a(dw paramdw)
    throws RemoteException;

  public abstract void a(dw paramdw, int paramInt1, int paramInt2, int paramInt3, String paramString)
    throws RemoteException;

  public abstract void a(dw paramdw, int paramInt, String paramString)
    throws RemoteException;

  public abstract void a(dw paramdw, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
    throws RemoteException;

  public abstract void a(dw paramdw, Uri paramUri, Bundle paramBundle)
    throws RemoteException;

  public abstract void a(dw paramdw, String paramString)
    throws RemoteException;

  public abstract void a(dw paramdw, String paramString, eb parameb)
    throws RemoteException;

  public abstract void a(dw paramdw, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void a(dw paramdw, String paramString1, String paramString2, int paramInt, String paramString3)
    throws RemoteException;

  public abstract void a(dw paramdw, String paramString, List<String> paramList1, List<String> paramList2, List<String> paramList3)
    throws RemoteException;

  public abstract void a(dw paramdw, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void a(dw paramdw, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void b(dw paramdw)
    throws RemoteException;

  public abstract void b(dw paramdw, String paramString)
    throws RemoteException;

  public abstract void c(dw paramdw)
    throws RemoteException;

  public abstract void c(dw paramdw, String paramString)
    throws RemoteException;

  public abstract void clearDefaultAccount()
    throws RemoteException;

  public abstract void d(dw paramdw, String paramString)
    throws RemoteException;

  public abstract void e(dw paramdw, String paramString)
    throws RemoteException;

  public abstract void f(dw paramdw, String paramString)
    throws RemoteException;

  public abstract void f(String paramString1, String paramString2)
    throws RemoteException;

  public abstract void g(dw paramdw, String paramString)
    throws RemoteException;

  public abstract String getAccountName()
    throws RemoteException;

  public abstract void removeMoment(String paramString)
    throws RemoteException;

  public static abstract class a extends Binder
    implements dx
  {
    public static dx V(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.plus.internal.IPlusService");
      if ((localIInterface != null) && ((localIInterface instanceof dx)))
        return (dx)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.plus.internal.IPlusService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        b(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        if (paramParcel1.readInt() != 0);
        for (at localat = at.CREATOR.m(paramParcel1); ; localat = null)
        {
          a(localat);
          paramParcel2.writeNoException();
          return true;
        }
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        String str4 = getAccountName();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str4);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        clearDefaultAccount();
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        c(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(dw.a.U(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        dw localdw5 = dw.a.U(paramParcel1.readStrongBinder());
        Uri localUri2;
        if (paramParcel1.readInt() != 0)
        {
          localUri2 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label532;
        }
        for (Bundle localBundle = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle = null)
        {
          a(localdw5, localUri2, localBundle);
          paramParcel2.writeNoException();
          return true;
          localUri2 = null;
          break;
        }
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        d(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        f(paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        b(dw.a.U(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 14:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        dw localdw4 = dw.a.U(paramParcel1.readStrongBinder());
        int m = paramParcel1.readInt();
        String str3 = paramParcel1.readString();
        int n = paramParcel1.readInt();
        Uri localUri1 = null;
        if (n != 0)
          localUri1 = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
        a(localdw4, m, str3, localUri1, paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 16:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 17:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        removeMoment(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 18:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        e(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 19:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        c(dw.a.U(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 20:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 21:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        dw localdw3 = dw.a.U(paramParcel1.readStrongBinder());
        String str2 = paramParcel1.readString();
        int k = paramParcel1.readInt();
        boolean bool3 = false;
        if (k != 0)
          bool3 = true;
        a(localdw3, str2, bool3);
        paramParcel2.writeNoException();
        return true;
      case 22:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        dw localdw2 = dw.a.U(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0);
        for (boolean bool1 = true; ; bool1 = false)
        {
          int j = paramParcel1.readInt();
          boolean bool2 = false;
          if (j != 0)
            bool2 = true;
          a(localdw2, bool1, bool2);
          paramParcel2.writeNoException();
          return true;
        }
      case 23:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        a(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.createStringArrayList(), paramParcel1.createStringArrayList(), paramParcel1.createStringArrayList());
        paramParcel2.writeNoException();
        return true;
      case 24:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        f(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 25:
        label532: paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
        dw localdw1 = dw.a.U(paramParcel1.readStrongBinder());
        String str1 = paramParcel1.readString();
        int i = paramParcel1.readInt();
        eb localeb = null;
        if (i != 0)
          localeb = eb.CREATOR.u(paramParcel1);
        a(localdw1, str1, localeb);
        paramParcel2.writeNoException();
        return true;
      case 26:
      }
      paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusService");
      g(dw.a.U(paramParcel1.readStrongBinder()), paramParcel1.readString());
      paramParcel2.writeNoException();
      return true;
    }

    static class a
      implements dx
    {
      private IBinder a;

      a(IBinder paramIBinder)
      {
        this.a = paramIBinder;
      }

      public void a(at paramat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramat != null)
          {
            localParcel1.writeInt(1);
            paramat.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(4, localParcel1, localParcel2, 0);
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

      public void a(dw paramdw)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(8, localParcel1, localParcel2, 0);
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

      public void a(dw paramdw, int paramInt1, int paramInt2, int paramInt3, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            localParcel1.writeString(paramString);
            this.a.transact(16, localParcel1, localParcel2, 0);
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

      public void a(dw paramdw, int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeString(paramString);
            this.a.transact(20, localParcel1, localParcel2, 0);
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

      public void a(dw paramdw, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          IBinder localIBinder;
          if (paramdw != null)
          {
            localIBinder = paramdw.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeString(paramString1);
            if (paramUri == null)
              break label120;
            localParcel1.writeInt(1);
            paramUri.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeString(paramString2);
            localParcel1.writeString(paramString3);
            this.a.transact(14, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label120: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(dw paramdw, Uri paramUri, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
            IBinder localIBinder;
            if (paramdw != null)
            {
              localIBinder = paramdw.asBinder();
              localParcel1.writeStrongBinder(localIBinder);
              if (paramUri != null)
              {
                localParcel1.writeInt(1);
                paramUri.writeToParcel(localParcel1, 0);
                if (paramBundle == null)
                  break label133;
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
                this.a.transact(9, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          label133: localParcel1.writeInt(0);
        }
      }

      public void a(dw paramdw, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
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

      public void a(dw paramdw, String paramString, eb parameb)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          IBinder localIBinder;
          if (paramdw != null)
          {
            localIBinder = paramdw.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            if (parameb == null)
              break label98;
            localParcel1.writeInt(1);
            parameb.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.a.transact(25, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label98: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void a(dw paramdw, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.a.transact(2, localParcel1, localParcel2, 0);
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

      public void a(dw paramdw, String paramString1, String paramString2, int paramInt, String paramString3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeInt(paramInt);
            localParcel1.writeString(paramString3);
            this.a.transact(12, localParcel1, localParcel2, 0);
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

      public void a(dw paramdw, String paramString, List<String> paramList1, List<String> paramList2, List<String> paramList3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeStringList(paramList1);
            localParcel1.writeStringList(paramList2);
            localParcel1.writeStringList(paramList3);
            this.a.transact(23, localParcel1, localParcel2, 0);
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

      public void a(dw paramdw, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.a.transact(21, localParcel1, localParcel2, 0);
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

      public void a(dw paramdw, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          IBinder localIBinder;
          int j;
          if (paramdw != null)
          {
            localIBinder = paramdw.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (!paramBoolean1)
              break label104;
            j = i;
            label47: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label110;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.a.transact(22, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label104: j = 0;
            break label47;
            label110: i = 0;
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

      public void b(dw paramdw)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(13, localParcel1, localParcel2, 0);
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

      public void b(dw paramdw, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(3, localParcel1, localParcel2, 0);
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

      public void c(dw paramdw)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.a.transact(19, localParcel1, localParcel2, 0);
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

      public void c(dw paramdw, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(7, localParcel1, localParcel2, 0);
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

      public void clearDefaultAccount()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          this.a.transact(6, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void d(dw paramdw, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(10, localParcel1, localParcel2, 0);
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

      public void e(dw paramdw, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(18, localParcel1, localParcel2, 0);
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

      public void f(dw paramdw, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(24, localParcel1, localParcel2, 0);
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

      public void f(String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          this.a.transact(11, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void g(dw paramdw, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          if (paramdw != null);
          for (IBinder localIBinder = paramdw.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.a.transact(26, localParcel1, localParcel2, 0);
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

      public String getAccountName()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          this.a.transact(5, localParcel1, localParcel2, 0);
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

      public void removeMoment(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusService");
          localParcel1.writeString(paramString);
          this.a.transact(17, localParcel1, localParcel2, 0);
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
 * Qualified Name:     com.google.android.gms.internal.dx
 * JD-Core Version:    0.6.2
 */