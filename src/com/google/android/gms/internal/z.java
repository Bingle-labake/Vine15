package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.view.View;
import com.google.android.gms.common.GooglePlayServicesUtil;

public final class z
{
  private static Context aZ;
  private static v ba;

  public static View d(Context paramContext, int paramInt1, int paramInt2)
    throws z.a
  {
    v localv = f(paramContext);
    try
    {
      bc localbc = localv.a(bd.f(paramContext), paramInt1, paramInt2);
      return (View)bd.a(localbc);
    }
    catch (Exception localException)
    {
    }
    throw new a("Could not get button with size " + paramInt1 + " and color " + paramInt2);
  }

  private static v f(Context paramContext)
    throws z.a
  {
    x.d(paramContext);
    ClassLoader localClassLoader;
    if (ba == null)
    {
      if (aZ == null)
      {
        aZ = GooglePlayServicesUtil.getRemoteContext(paramContext);
        if (aZ == null)
          throw new a("Could not get remote context.");
      }
      localClassLoader = aZ.getClassLoader();
    }
    try
    {
      ba = v.a.i((IBinder)localClassLoader.loadClass("com.google.android.gms.common.ui.SignInButtonCreatorImpl").newInstance());
      return ba;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new a("Could not load creator class.");
    }
    catch (InstantiationException localInstantiationException)
    {
      throw new a("Could not instantiate creator.");
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
    }
    throw new a("Could not access creator.");
  }

  public static class a extends Exception
  {
    public a(String paramString)
    {
      super();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.z
 * JD-Core Version:    0.6.2
 */