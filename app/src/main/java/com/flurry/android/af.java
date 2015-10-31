package com.flurry.android;

import java.util.Map;

final class af
{
  final String bu;
  final Map<String, String> bv;
  final cw bw;

  af(String paramString, Map<String, String> paramMap, cw paramcw)
  {
    this.bu = paramString;
    this.bv = paramMap;
    this.bw = paramcw;
  }

  public final String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("action=");
    localStringBuilder.append(this.bu);
    localStringBuilder.append(",params=");
    localStringBuilder.append(this.bv);
    localStringBuilder.append(",");
    localStringBuilder.append(this.bw);
    return localStringBuilder.toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.af
 * JD-Core Version:    0.6.2
 */