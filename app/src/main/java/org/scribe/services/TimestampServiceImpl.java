package org.scribe.services;

import java.util.Random;

public class TimestampServiceImpl
  implements TimestampService
{
  private Timer timer = new Timer();

  private Long getTs()
  {
    return Long.valueOf(this.timer.getMilis().longValue() / 1000L);
  }

  public String getNonce()
  {
    return String.valueOf(getTs().longValue() + this.timer.getRandomInteger().intValue());
  }

  public String getTimestampInSeconds()
  {
    return String.valueOf(getTs());
  }

  void setTimer(Timer paramTimer)
  {
    this.timer = paramTimer;
  }

  static class Timer
  {
    Long getMilis()
    {
      return Long.valueOf(System.currentTimeMillis());
    }

    Integer getRandomInteger()
    {
      return Integer.valueOf(new Random().nextInt());
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.services.TimestampServiceImpl
 * JD-Core Version:    0.6.2
 */