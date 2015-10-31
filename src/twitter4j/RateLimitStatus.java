package twitter4j;

import java.io.Serializable;

public abstract interface RateLimitStatus extends Serializable
{
  public abstract int getLimit();

  public abstract int getRemaining();

  public abstract int getRemainingHits();

  public abstract int getResetTimeInSeconds();

  public abstract int getSecondsUntilReset();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.RateLimitStatus
 * JD-Core Version:    0.6.2
 */