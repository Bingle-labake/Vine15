package com.flurry.android;

import android.content.Context;
import java.util.Map;

final class cw
{
  final Context J;
  final cz L;
  final AdUnit M;
  final Map<String, String> bv;
  final String eW;
  final int eX;

  cw(String paramString, Map<String, String> paramMap, Context paramContext, AdUnit paramAdUnit, cz paramcz, int paramInt)
  {
    this.eW = paramString;
    this.bv = paramMap;
    this.J = paramContext;
    this.M = paramAdUnit;
    this.L = paramcz;
    this.eX = paramInt;
  }

  public final String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("event=").append(this.eW);
    localStringBuilder.append(",params=").append(this.bv);
    localStringBuilder.append(",adspace=").append(this.M.getAdSpace());
    return localStringBuilder.toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.cw
 * JD-Core Version:    0.6.2
 */