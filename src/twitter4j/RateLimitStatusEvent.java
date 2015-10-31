package twitter4j;

import java.util.EventObject;

public final class RateLimitStatusEvent extends EventObject
{
  private static final long serialVersionUID = -2332507741769177298L;
  private boolean isAccountRateLimitStatus;
  private RateLimitStatus rateLimitStatus;

  RateLimitStatusEvent(Object paramObject, RateLimitStatus paramRateLimitStatus, boolean paramBoolean)
  {
    super(paramObject);
    this.rateLimitStatus = paramRateLimitStatus;
    this.isAccountRateLimitStatus = paramBoolean;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.RateLimitStatusEvent
 * JD-Core Version:    0.6.2
 */