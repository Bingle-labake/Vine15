package com.flurry.android;

final class cx
{
  static cz a(FlurryAds paramFlurryAds, String paramString)
  {
    long l = paramFlurryAds.L();
    paramFlurryAds.M();
    cz localcz = new cz(l, paramString);
    paramFlurryAds.a(localcz);
    return localcz;
  }

  static AdCreative b(AdSpaceLayout paramAdSpaceLayout)
  {
    return new AdCreative(paramAdSpaceLayout.getAdHeight().intValue(), paramAdSpaceLayout.getAdWidth().intValue(), paramAdSpaceLayout.getFormat().toString(), paramAdSpaceLayout.getFix().toString(), paramAdSpaceLayout.getAlignment().toString());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.cx
 * JD-Core Version:    0.6.2
 */