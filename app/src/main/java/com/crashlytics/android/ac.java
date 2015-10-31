package com.crashlytics.android;

import android.content.Context;

final class ac
{
  private final Context a;
  private final aj b;

  public ac(Context paramContext, aj paramaj)
  {
    this.a = paramContext;
    this.b = paramaj;
  }

  private String a(String paramString1, String paramString2)
  {
    String str = av.a(this.a, paramString1);
    if ((str == null) || (str.length() == 0));
    for (int i = 1; i != 0; i = 0)
      return paramString2;
    return str;
  }

  public final String a()
  {
    return a("com.crashlytics.CrashSubmissionPromptTitle", this.b.b());
  }

  public final String b()
  {
    return a("com.crashlytics.CrashSubmissionPromptMessage", this.b.c());
  }

  public final String c()
  {
    return a("com.crashlytics.CrashSubmissionSendTitle", this.b.d());
  }

  public final String d()
  {
    return a("com.crashlytics.CrashSubmissionAlwaysSendTitle", this.b.h());
  }

  public final String e()
  {
    return a("com.crashlytics.CrashSubmissionCancelTitle", this.b.f());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.ac
 * JD-Core Version:    0.6.2
 */