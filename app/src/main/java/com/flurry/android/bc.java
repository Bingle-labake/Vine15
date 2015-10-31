package com.flurry.android;

import java.io.File;

final class bc
{
  private static String d = "FlurryAgent";

  static boolean b(File paramFile)
  {
    if (paramFile == null)
      return false;
    File localFile = paramFile.getParentFile();
    if ((!localFile.mkdirs()) && (!localFile.exists()))
    {
      db.d(d, "Unable to create persistent dir: " + localFile);
      return false;
    }
    return true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bc
 * JD-Core Version:    0.6.2
 */