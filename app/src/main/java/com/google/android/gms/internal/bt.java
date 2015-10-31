package com.google.android.gms.internal;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.games.leaderboard.LeaderboardScore;

public final class bt
  implements LeaderboardScore
{
  private final long dr;
  private final String ds;
  private final String dt;
  private final long du;
  private final long dv;
  private final String dw;
  private final Uri dx;
  private final Uri dy;
  private final PlayerEntity dz;

  public bt(LeaderboardScore paramLeaderboardScore)
  {
    this.dr = paramLeaderboardScore.getRank();
    this.ds = ((String)x.d(paramLeaderboardScore.getDisplayRank()));
    this.dt = ((String)x.d(paramLeaderboardScore.getDisplayScore()));
    this.du = paramLeaderboardScore.getRawScore();
    this.dv = paramLeaderboardScore.getTimestampMillis();
    this.dw = paramLeaderboardScore.getScoreHolderDisplayName();
    this.dx = paramLeaderboardScore.getScoreHolderIconImageUri();
    this.dy = paramLeaderboardScore.getScoreHolderHiResImageUri();
    Player localPlayer = paramLeaderboardScore.getScoreHolder();
    if (localPlayer == null);
    for (PlayerEntity localPlayerEntity = null; ; localPlayerEntity = (PlayerEntity)localPlayer.freeze())
    {
      this.dz = localPlayerEntity;
      return;
    }
  }

  static int a(LeaderboardScore paramLeaderboardScore)
  {
    Object[] arrayOfObject = new Object[9];
    arrayOfObject[0] = Long.valueOf(paramLeaderboardScore.getRank());
    arrayOfObject[1] = paramLeaderboardScore.getDisplayRank();
    arrayOfObject[2] = Long.valueOf(paramLeaderboardScore.getRawScore());
    arrayOfObject[3] = paramLeaderboardScore.getDisplayScore();
    arrayOfObject[4] = Long.valueOf(paramLeaderboardScore.getTimestampMillis());
    arrayOfObject[5] = paramLeaderboardScore.getScoreHolderDisplayName();
    arrayOfObject[6] = paramLeaderboardScore.getScoreHolderIconImageUri();
    arrayOfObject[7] = paramLeaderboardScore.getScoreHolderHiResImageUri();
    arrayOfObject[8] = paramLeaderboardScore.getScoreHolder();
    return w.hashCode(arrayOfObject);
  }

  static boolean a(LeaderboardScore paramLeaderboardScore, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof LeaderboardScore))
      bool = false;
    LeaderboardScore localLeaderboardScore;
    do
    {
      do
        return bool;
      while (paramLeaderboardScore == paramObject);
      localLeaderboardScore = (LeaderboardScore)paramObject;
    }
    while ((w.a(Long.valueOf(localLeaderboardScore.getRank()), Long.valueOf(paramLeaderboardScore.getRank()))) && (w.a(localLeaderboardScore.getDisplayRank(), paramLeaderboardScore.getDisplayRank())) && (w.a(Long.valueOf(localLeaderboardScore.getRawScore()), Long.valueOf(paramLeaderboardScore.getRawScore()))) && (w.a(localLeaderboardScore.getDisplayScore(), paramLeaderboardScore.getDisplayScore())) && (w.a(Long.valueOf(localLeaderboardScore.getTimestampMillis()), Long.valueOf(paramLeaderboardScore.getTimestampMillis()))) && (w.a(localLeaderboardScore.getScoreHolderDisplayName(), paramLeaderboardScore.getScoreHolderDisplayName())) && (w.a(localLeaderboardScore.getScoreHolderIconImageUri(), paramLeaderboardScore.getScoreHolderIconImageUri())) && (w.a(localLeaderboardScore.getScoreHolderHiResImageUri(), paramLeaderboardScore.getScoreHolderHiResImageUri())) && (w.a(localLeaderboardScore.getScoreHolder(), paramLeaderboardScore.getScoreHolder())));
    return false;
  }

  static String b(LeaderboardScore paramLeaderboardScore)
  {
    w.a locala = w.c(paramLeaderboardScore).a("Rank", Long.valueOf(paramLeaderboardScore.getRank())).a("DisplayRank", paramLeaderboardScore.getDisplayRank()).a("Score", Long.valueOf(paramLeaderboardScore.getRawScore())).a("DisplayScore", paramLeaderboardScore.getDisplayScore()).a("Timestamp", Long.valueOf(paramLeaderboardScore.getTimestampMillis())).a("DisplayName", paramLeaderboardScore.getScoreHolderDisplayName()).a("IconImageUri", paramLeaderboardScore.getScoreHolderIconImageUri()).a("HiResImageUri", paramLeaderboardScore.getScoreHolderHiResImageUri());
    if (paramLeaderboardScore.getScoreHolder() == null);
    for (Object localObject = null; ; localObject = paramLeaderboardScore.getScoreHolder())
      return locala.a("Player", localObject).toString();
  }

  public LeaderboardScore as()
  {
    return this;
  }

  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }

  public String getDisplayRank()
  {
    return this.ds;
  }

  public void getDisplayRank(CharArrayBuffer paramCharArrayBuffer)
  {
    ax.b(this.ds, paramCharArrayBuffer);
  }

  public String getDisplayScore()
  {
    return this.dt;
  }

  public void getDisplayScore(CharArrayBuffer paramCharArrayBuffer)
  {
    ax.b(this.dt, paramCharArrayBuffer);
  }

  public long getRank()
  {
    return this.dr;
  }

  public long getRawScore()
  {
    return this.du;
  }

  public Player getScoreHolder()
  {
    return this.dz;
  }

  public String getScoreHolderDisplayName()
  {
    if (this.dz == null)
      return this.dw;
    return this.dz.getDisplayName();
  }

  public void getScoreHolderDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (this.dz == null)
    {
      ax.b(this.dw, paramCharArrayBuffer);
      return;
    }
    this.dz.getDisplayName(paramCharArrayBuffer);
  }

  public Uri getScoreHolderHiResImageUri()
  {
    if (this.dz == null)
      return this.dy;
    return this.dz.getHiResImageUri();
  }

  public Uri getScoreHolderIconImageUri()
  {
    if (this.dz == null)
      return this.dx;
    return this.dz.getIconImageUri();
  }

  public long getTimestampMillis()
  {
    return this.dv;
  }

  public int hashCode()
  {
    return a(this);
  }

  public String toString()
  {
    return b(this);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bt
 * JD-Core Version:    0.6.2
 */