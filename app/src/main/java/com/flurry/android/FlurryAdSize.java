package com.flurry.android;

public enum FlurryAdSize
{
  private int et;

  static
  {
    BANNER_BOTTOM = new FlurryAdSize("BANNER_BOTTOM", 1, 2);
    FULLSCREEN = new FlurryAdSize("FULLSCREEN", 2, 3);
    FlurryAdSize[] arrayOfFlurryAdSize = new FlurryAdSize[3];
    arrayOfFlurryAdSize[0] = BANNER_TOP;
    arrayOfFlurryAdSize[1] = BANNER_BOTTOM;
    arrayOfFlurryAdSize[2] = FULLSCREEN;
  }

  private FlurryAdSize(int paramInt)
  {
    this.et = paramInt;
  }

  static FlurryAdSize a(AdSpaceLayout paramAdSpaceLayout)
  {
    String str = paramAdSpaceLayout.getFormat().toString();
    String[] arrayOfString = paramAdSpaceLayout.getAlignment().toString().split("-");
    if (str.equals("takeover"))
      return FULLSCREEN;
    if (arrayOfString[0].equals("b"))
      return BANNER_BOTTOM;
    return BANNER_TOP;
  }

  final int getValue()
  {
    return this.et;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.FlurryAdSize
 * JD-Core Version:    0.6.2
 */