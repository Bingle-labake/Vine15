package com.google.android.gms.internal;

import com.google.android.gms.games.leaderboard.LeaderboardVariant;

public final class bv extends j
  implements LeaderboardVariant
{
  bv(k paramk, int paramInt)
  {
    super(paramk, paramInt);
  }

  public String at()
  {
    return getString("top_page_token_next");
  }

  public String au()
  {
    return getString("window_page_token_prev");
  }

  public String av()
  {
    return getString("window_page_token_next");
  }

  public int getCollection()
  {
    return getInteger("collection");
  }

  public String getDisplayPlayerRank()
  {
    return getString("player_display_rank");
  }

  public String getDisplayPlayerScore()
  {
    return getString("player_display_score");
  }

  public long getNumScores()
  {
    if (d("total_scores"))
      return -1L;
    return getLong("total_scores");
  }

  public long getPlayerRank()
  {
    if (d("player_rank"))
      return -1L;
    return getLong("player_rank");
  }

  public long getRawPlayerScore()
  {
    if (d("player_raw_score"))
      return -1L;
    return getLong("player_raw_score");
  }

  public int getTimeSpan()
  {
    return getInteger("timespan");
  }

  public boolean hasPlayerInfo()
  {
    return !d("player_raw_score");
  }

  public String toString()
  {
    w.a locala1 = w.c(this).a("TimeSpan", bq.B(getTimeSpan())).a("Collection", bp.B(getCollection()));
    Object localObject1;
    String str1;
    label65: Object localObject2;
    label91: w.a locala4;
    if (hasPlayerInfo())
    {
      localObject1 = Long.valueOf(getRawPlayerScore());
      w.a locala2 = locala1.a("RawPlayerScore", localObject1);
      if (!hasPlayerInfo())
        break label173;
      str1 = getDisplayPlayerScore();
      w.a locala3 = locala2.a("DisplayPlayerScore", str1);
      if (!hasPlayerInfo())
        break label180;
      localObject2 = Long.valueOf(getPlayerRank());
      locala4 = locala3.a("PlayerRank", localObject2);
      if (!hasPlayerInfo())
        break label187;
    }
    label173: label180: label187: for (String str2 = getDisplayPlayerRank(); ; str2 = "none")
    {
      return locala4.a("DisplayPlayerRank", str2).a("NumScores", Long.valueOf(getNumScores())).a("TopPageNextToken", at()).a("WindowPageNextToken", av()).a("WindowPagePrevToken", au()).toString();
      localObject1 = "none";
      break;
      str1 = "none";
      break label65;
      localObject2 = "none";
      break label91;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bv
 * JD-Core Version:    0.6.2
 */