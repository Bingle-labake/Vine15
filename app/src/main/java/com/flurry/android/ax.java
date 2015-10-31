package com.flurry.android;

import android.app.Activity;
import android.content.ComponentName;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.util.SparseArray;
import android.util.SparseIntArray;

final class ax
{
  private static final String bA = ax.class.getSimpleName();
  private static final SparseArray<SparseIntArray> cp;

  static
  {
    SparseArray localSparseArray = new SparseArray();
    int i = I();
    SparseIntArray localSparseIntArray1 = new SparseIntArray();
    localSparseIntArray1.put(-1, i);
    localSparseIntArray1.put(2, i);
    localSparseIntArray1.put(3, i);
    localSparseIntArray1.put(4, i);
    localSparseIntArray1.put(1, 1);
    localSparseIntArray1.put(5, 5);
    localSparseIntArray1.put(7, 7);
    localSparseIntArray1.put(9, 9);
    localSparseIntArray1.put(10, 7);
    localSparseArray.put(1, localSparseIntArray1);
    if (l.SDK_INT >= 9);
    for (int j = 6; ; j = 0)
    {
      SparseIntArray localSparseIntArray2 = new SparseIntArray();
      localSparseIntArray2.put(-1, j);
      localSparseIntArray2.put(2, j);
      localSparseIntArray2.put(3, j);
      localSparseIntArray2.put(4, j);
      localSparseIntArray2.put(0, 0);
      localSparseIntArray2.put(5, 5);
      localSparseIntArray2.put(6, 6);
      localSparseIntArray2.put(8, 8);
      localSparseIntArray2.put(10, 6);
      localSparseArray.put(2, localSparseIntArray2);
      cp = localSparseArray;
      return;
    }
  }

  public static int I()
  {
    int i = 1;
    if (l.SDK_INT >= 9)
      i = 7;
    return i;
  }

  private static ActivityInfo a(Activity paramActivity)
  {
    if (paramActivity == null)
      return null;
    try
    {
      ActivityInfo localActivityInfo = paramActivity.getPackageManager().getActivityInfo(paramActivity.getComponentName(), 0);
      return localActivityInfo;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      new StringBuilder().append("cannot find info for activity: ").append(paramActivity.getComponentName()).toString();
    }
    return null;
  }

  public static void a(Activity paramActivity, int paramInt)
  {
    if (paramActivity != null)
      paramActivity.setRequestedOrientation(paramInt);
  }

  public static boolean a(Activity paramActivity, int paramInt, boolean paramBoolean)
  {
    if (paramActivity == null)
      return false;
    ActivityInfo localActivityInfo = a(paramActivity);
    int i;
    int j;
    label30: int m;
    if (localActivityInfo == null)
    {
      i = 0;
      if ((i & 0x80) != 0)
        break label130;
      j = 0;
      if (j != 0)
        break label196;
      if (paramActivity != null)
        break label151;
      m = -1;
    }
    while (true)
    {
      if (-1 == m)
      {
        new StringBuilder().append("cannot set requested orientation without restarting activity, requestedOrientation = ").append(paramInt).toString();
        db.d(bA, "cannot set requested orientation without restarting activity. It is recommended to add keyboardHidden|orientation|screenSize for android:configChanges attribute for activity: " + paramActivity.getComponentName().getClassName());
        return false;
        i = localActivityInfo.configChanges;
        if (localActivityInfo.applicationInfo.targetSdkVersion >= 13)
          break;
        i |= 3072;
        break;
        label130: if ((i & 0x400) == 0)
        {
          j = 0;
          break label30;
        }
        j = 1;
        break label30;
        label151: int k = paramActivity.getResources().getConfiguration().orientation;
        SparseIntArray localSparseIntArray = (SparseIntArray)cp.get(k);
        if (localSparseIntArray == null)
          break label203;
        m = localSparseIntArray.get(paramInt, -1);
        continue;
      }
      paramInt = m;
      label196: paramActivity.setRequestedOrientation(paramInt);
      return true;
      label203: m = -1;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ax
 * JD-Core Version:    0.6.2
 */