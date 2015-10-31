package com.crashlytics.android;

import java.io.File;
import java.io.FilenameFilter;

final class o
  implements FilenameFilter
{
  public final boolean accept(File paramFile, String paramString)
  {
    return paramString.endsWith(".cls_temp");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.o
 * JD-Core Version:    0.6.2
 */