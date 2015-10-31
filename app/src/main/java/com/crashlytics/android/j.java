package com.crashlytics.android;

import android.util.Log;

final class j
{
  private String a;
  private boolean b;

  public j(String paramString, boolean paramBoolean)
  {
    this.a = paramString;
    this.b = paramBoolean;
  }

  public final void a(String paramString1, String paramString2)
  {
    if ((av.c(this.a)) && (this.b))
    {
      Log.e("Crashlytics", "---");
      Log.e("Crashlytics", "Crashlytics did not find a required runtime dependency. To configure your build environment, visit: ");
      Log.e("Crashlytics", " ");
      Log.e("Crashlytics", String.format("http://www.crashlytics.com/api/v1/%s/android/confirm/%s", new Object[] { paramString1, paramString2 }));
      Log.e("Crashlytics", "---");
      throw new CrashlyticsMissingDependencyException(paramString1, paramString2);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.j
 * JD-Core Version:    0.6.2
 */