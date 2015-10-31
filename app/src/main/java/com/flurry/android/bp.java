package com.flurry.android;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;

final class bp
{
  private static final String d = bp.class.getSimpleName();

  public static Bundle p(Context paramContext)
  {
    Object localObject = null;
    if (paramContext != null);
    try
    {
      ApplicationInfo localApplicationInfo = paramContext.getPackageManager().getApplicationInfo(paramContext.getPackageName(), 128);
      localObject = localApplicationInfo;
      if ((localObject != null) && (localObject.metaData != null))
        return localObject.metaData;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      while (true)
      {
        db.c(d, "Cannot find meta data for package: " + paramContext.getPackageName());
        localObject = null;
      }
    }
    return Bundle.EMPTY;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bp
 * JD-Core Version:    0.6.2
 */