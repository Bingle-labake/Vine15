package com.google.android.gms.internal;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.leaderboard.LeaderboardScore;

public final class bu extends j
  implements LeaderboardScore
{
  private final bg dA;

  public bu(k paramk, int paramInt)
  {
    super(paramk, paramInt);
    this.dA = new bg(paramk, paramInt);
  }

  public LeaderboardScore as()
  {
    return new bt(this);
  }

  public boolean equals(Object paramObject)
  {
    return bt.a(this, paramObject);
  }

  public String getDisplayRank()
  {
    return getString("display_rank");
  }

  public void getDisplayRank(CharArrayBuffer paramCharArrayBuffer)
  {
    a("display_rank", paramCharArrayBuffer);
  }

  public String getDisplayScore()
  {
    return getString("display_score");
  }

  public void getDisplayScore(CharArrayBuffer paramCharArrayBuffer)
  {
    a("display_score", paramCharArrayBuffer);
  }

  public long getRank()
  {
    return getLong("rank");
  }

  public long getRawScore()
  {
    return getLong("raw_score");
  }

  public Player getScoreHolder()
  {
    if (d("external_player_id"))
      return null;
    return this.dA;
  }

  public String getScoreHolderDisplayName()
  {
    if (d("external_player_id"))
      return getString("default_display_name");
    return this.dA.getDisplayName();
  }

  public void getScoreHolderDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (d("external_player_id"))
    {
      a("default_display_name", paramCharArrayBuffer);
      return;
    }
    this.dA.getDisplayName(paramCharArrayBuffer);
  }

  public Uri getScoreHolderHiResImageUri()
  {
    if (d("external_player_id"))
      return null;
    return this.dA.getHiResImageUri();
  }

  public Uri getScoreHolderIconImageUri()
  {
    if (d("external_player_id"))
      return c("default_display_image_uri");
    return this.dA.getIconImageUri();
  }

  public long getTimestampMillis()
  {
    return getLong("achieved_timestamp");
  }

  public int hashCode()
  {
    return bt.a(this);
  }

  public String toString()
  {
    return bt.b(this);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bu
 * JD-Core Version:    0.6.2
 */