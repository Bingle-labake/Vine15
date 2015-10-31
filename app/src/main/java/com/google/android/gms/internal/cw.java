package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public class cw
{
  private static Context aZ;
  private static cl fH;

  private static <T> T a(ClassLoader paramClassLoader, String paramString)
  {
    try
    {
      Object localObject = b(((ClassLoader)x.d(paramClassLoader)).loadClass(paramString));
      return localObject;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
    }
    throw new IllegalStateException("Unable to find dynamic class " + paramString);
  }

  public static boolean aT()
  {
    return aU() != null;
  }

  private static Class<?> aU()
  {
    try
    {
      Class localClass = Class.forName("com.google.android.gms.maps.internal.CreatorImpl");
      return localClass;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
    }
    return null;
  }

  private static <T> T b(Class<?> paramClass)
  {
    try
    {
      Object localObject = paramClass.newInstance();
      return localObject;
    }
    catch (InstantiationException localInstantiationException)
    {
      throw new IllegalStateException("Unable to instantiate the dynamic class " + paramClass.getName());
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
    }
    throw new IllegalStateException("Unable to call the default constructor of " + paramClass.getName());
  }

  public static cl g(Context paramContext)
    throws GooglePlayServicesNotAvailableException
  {
    x.d(paramContext);
    i(paramContext);
    if (fH == null)
      j(paramContext);
    if (fH != null)
      return fH;
    fH = cl.a.t((IBinder)a(getRemoteContext(paramContext).getClassLoader(), "com.google.android.gms.maps.internal.CreatorImpl"));
    h(paramContext);
    return fH;
  }

  private static Context getRemoteContext(Context paramContext)
  {
    if (aZ == null)
      if (aU() == null)
        break label20;
    label20: for (aZ = paramContext; ; aZ = GooglePlayServicesUtil.getRemoteContext(paramContext))
      return aZ;
  }

  private static void h(Context paramContext)
  {
    try
    {
      fH.a(bd.f(getRemoteContext(paramContext).getResources()), 3136100);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public static void i(Context paramContext)
    throws GooglePlayServicesNotAvailableException
  {
    if (!aT())
    {
      int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramContext);
      if (i != 0)
        throw new GooglePlayServicesNotAvailableException(i);
    }
  }

  private static void j(Context paramContext)
  {
    Class localClass = aU();
    if (localClass != null)
    {
      Log.i(cw.class.getSimpleName(), "Making Creator statically");
      fH = (cl)b(localClass);
      h(paramContext);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.cw
 * JD-Core Version:    0.6.2
 */