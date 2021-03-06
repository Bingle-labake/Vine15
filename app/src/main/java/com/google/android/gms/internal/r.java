package com.google.android.gms.internal;

import android.content.Intent;
import android.net.Uri;
import android.net.Uri.Builder;

public class r
{
  private static final Uri aT = Uri.parse("http://plus.google.com/");
  private static final Uri aU = aT.buildUpon().appendPath("circles").appendPath("find").build();

  public static Intent e(String paramString)
  {
    Uri localUri = Uri.fromParts("package", paramString, null);
    Intent localIntent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
    localIntent.setData(localUri);
    return localIntent;
  }

  private static Uri f(String paramString)
  {
    return Uri.parse("market://details").buildUpon().appendQueryParameter("id", paramString).build();
  }

  public static Intent g(String paramString)
  {
    Intent localIntent = new Intent("android.intent.action.VIEW");
    localIntent.setData(f(paramString));
    localIntent.setPackage("com.android.vending");
    localIntent.addFlags(524288);
    return localIntent;
  }

  public static Intent h(String paramString)
  {
    Uri localUri = Uri.parse("bazaar://search?q=pname:" + paramString);
    Intent localIntent = new Intent("android.intent.action.VIEW");
    localIntent.setData(localUri);
    localIntent.setFlags(524288);
    return localIntent;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.r
 * JD-Core Version:    0.6.2
 */