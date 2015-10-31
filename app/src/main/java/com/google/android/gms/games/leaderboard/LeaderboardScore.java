package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.games.Player;

public abstract interface LeaderboardScore extends Freezable<LeaderboardScore>
{
  public abstract String getDisplayRank();

  public abstract void getDisplayRank(CharArrayBuffer paramCharArrayBuffer);

  public abstract String getDisplayScore();

  public abstract void getDisplayScore(CharArrayBuffer paramCharArrayBuffer);

  public abstract long getRank();

  public abstract long getRawScore();

  public abstract Player getScoreHolder();

  public abstract String getScoreHolderDisplayName();

  public abstract void getScoreHolderDisplayName(CharArrayBuffer paramCharArrayBuffer);

  public abstract Uri getScoreHolderHiResImageUri();

  public abstract Uri getScoreHolderIconImageUri();

  public abstract long getTimestampMillis();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.leaderboard.LeaderboardScore
 * JD-Core Version:    0.6.2
 */