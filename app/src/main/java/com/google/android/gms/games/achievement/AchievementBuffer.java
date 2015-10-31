package com.google.android.gms.games.achievement;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.internal.bh;
import com.google.android.gms.internal.k;

public final class AchievementBuffer extends DataBuffer<Achievement>
{
  public AchievementBuffer(k paramk)
  {
    super(paramk);
  }

  public Achievement get(int paramInt)
  {
    return new bh(this.O, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.achievement.AchievementBuffer
 * JD-Core Version:    0.6.2
 */