package co.vine.android.util;

public class PlayerUtil
{
  private static String sAuthority;

  public static String getAuthority(String paramString)
  {
    return sAuthority + paramString;
  }

  public static void setup(String paramString)
  {
    sAuthority = paramString;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.PlayerUtil
 * JD-Core Version:    0.6.2
 */