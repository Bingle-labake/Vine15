package com.google.android.gms.games.leaderboard;

import com.google.android.gms.internal.br;
import com.google.android.gms.internal.k;
import com.google.android.gms.internal.m;

public final class LeaderboardBuffer extends m<Leaderboard>
{
  public LeaderboardBuffer(k paramk)
  {
    super(paramk);
  }

  protected Leaderboard getEntry(int paramInt1, int paramInt2)
  {
    return new br(this.O, paramInt1, paramInt2);
  }

  protected String getPrimaryDataMarkerColumn()
  {
    return "external_leaderboard_id";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.leaderboard.LeaderboardBuffer
 * JD-Core Version:    0.6.2
 */