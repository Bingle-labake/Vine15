package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.internal.bs;
import com.google.android.gms.internal.bu;
import com.google.android.gms.internal.k;

public final class LeaderboardScoreBuffer extends DataBuffer<LeaderboardScore>
{
  private final bs dp;

  public LeaderboardScoreBuffer(k paramk)
  {
    super(paramk);
    this.dp = new bs(paramk.h());
  }

  public bs aq()
  {
    return this.dp;
  }

  public LeaderboardScore get(int paramInt)
  {
    return new bu(this.O, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer
 * JD-Core Version:    0.6.2
 */