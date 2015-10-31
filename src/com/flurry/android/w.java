package com.flurry.android;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class w
{
  private static String d = "FlurryAgent";
  private FlurryAds Q;

  w(FlurryAds paramFlurryAds)
  {
    this.Q = paramFlurryAds;
  }

  private static boolean a(String paramString1, String paramString2)
  {
    return paramString2.equals("%{" + paramString1 + "}");
  }

  final String a(cz paramcz, AdUnit paramAdUnit, String paramString1, String paramString2)
  {
    String str2;
    if (a("fids", paramString2))
    {
      String str10 = 0 + ":" + this.Q.getPhoneId();
      db.c(d, "Replacing param fids with: " + str10);
      str2 = paramString1.replace(paramString2, bd.p(str10));
    }
    String str1;
    do
    {
      return str2;
      if (a("sid", paramString2))
      {
        String str9 = String.valueOf(this.Q.L());
        db.c(d, "Replacing param sid with: " + str9);
        return paramString1.replace(paramString2, bd.p(str9));
      }
      if (a("lid", paramString2))
      {
        String str8 = String.valueOf(paramcz.getIndex());
        db.c(d, "Replacing param lid with: " + str8);
        return paramString1.replace(paramString2, bd.p(str8));
      }
      if (a("guid", paramString2))
      {
        String str7 = paramcz.at();
        db.c(d, "Replacing param guid with: " + str7);
        return paramString1.replace(paramString2, bd.p(str7));
      }
      if (a("ats", paramString2))
      {
        String str6 = String.valueOf(System.currentTimeMillis());
        db.c(d, "Replacing param ats with: " + str6);
        return paramString1.replace(paramString2, bd.p(str6));
      }
      if (a("apik", paramString2))
      {
        String str5 = FlurryAds.w();
        db.c(d, "Replacing param apik with: " + str5);
        return paramString1.replace(paramString2, bd.p(str5));
      }
      if (a("hid", paramString2))
      {
        String str4 = paramAdUnit.getAdSpace().toString();
        db.c(d, "Replacing param hid with: " + str4);
        return paramString1.replace(paramString2, bd.p(str4));
      }
      if (a("eso", paramString2))
      {
        String str3 = Long.toString(System.currentTimeMillis() - this.Q.L());
        db.c(d, "Replacing param eso with: " + str3);
        return paramString1.replace(paramString2, bd.p(str3));
      }
      if (!a("uc", paramString2))
        break;
      Iterator localIterator = this.Q.O().entrySet().iterator();
      Map.Entry localEntry;
      for (str1 = ""; localIterator.hasNext(); str1 = str1 + "c_" + bd.p((String)localEntry.getKey()) + "=" + bd.p((String)localEntry.getValue()) + "&")
        localEntry = (Map.Entry)localIterator.next();
      db.c(d, "Replacing param uc with: " + str1);
      str2 = paramString1.replace(paramString2, str1);
    }
    while ((!str1.equals("")) || (str2.length() <= 0));
    return str2.substring(0, -1 + str2.length());
    db.c(d, "Unknown param: " + paramString2);
    return paramString1.replace(paramString2, "");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.w
 * JD-Core Version:    0.6.2
 */