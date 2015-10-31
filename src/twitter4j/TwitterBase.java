package twitter4j;

import twitter4j.auth.Authorization;
import twitter4j.conf.Configuration;

public abstract interface TwitterBase
{
  public abstract Authorization getAuthorization();

  public abstract Configuration getConfiguration();

  public abstract void shutdown();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.TwitterBase
 * JD-Core Version:    0.6.2
 */