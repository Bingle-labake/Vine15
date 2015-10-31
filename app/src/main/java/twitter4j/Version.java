package twitter4j;

import java.io.PrintStream;

public final class Version
{
  private static final String TITLE = "Twitter4J";
  private static final String VERSION = "3.0.6-SNAPSHOT";

  private Version()
  {
    throw new AssertionError();
  }

  public static String getVersion()
  {
    return "3.0.6-SNAPSHOT";
  }

  public static void main(String[] paramArrayOfString)
  {
    System.out.println("Twitter4J 3.0.6-SNAPSHOT");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.Version
 * JD-Core Version:    0.6.2
 */