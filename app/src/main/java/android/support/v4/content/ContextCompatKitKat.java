package android.support.v4.content;

import android.content.Context;
import java.io.File;

class ContextCompatKitKat
{
  public static File[] getExternalCacheDirs(Context paramContext)
  {
    return paramContext.getExternalCacheDirs();
  }

  public static File[] getExternalFilesDirs(Context paramContext, String paramString)
  {
    return paramContext.getExternalFilesDirs(paramString);
  }

  public static File[] getObbDirs(Context paramContext)
  {
    return paramContext.getObbDirs();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v4.content.ContextCompatKitKat
 * JD-Core Version:    0.6.2
 */