package com.google.android.gms.internal;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.games.leaderboard.Leaderboard;
import com.google.android.gms.games.leaderboard.LeaderboardVariant;
import java.util.ArrayList;

public final class br extends j
  implements Leaderboard
{
  private final int jdField_do;

  public br(k paramk, int paramInt1, int paramInt2)
  {
    super(paramk, paramInt1);
    this.jdField_do = paramInt2;
  }

  public String getDisplayName()
  {
    return getString("name");
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    a("name", paramCharArrayBuffer);
  }

  public Uri getIconImageUri()
  {
    return c("board_icon_image_uri");
  }

  public String getLeaderboardId()
  {
    return getString("external_leaderboard_id");
  }

  public int getScoreOrder()
  {
    return getInteger("score_order");
  }

  public ArrayList<LeaderboardVariant> getVariants()
  {
    ArrayList localArrayList = new ArrayList(this.jdField_do);
    for (int i = 0; i < this.jdField_do; i++)
      localArrayList.add(new bv(this.O, i + this.R));
    return localArrayList;
  }

  public String toString()
  {
    return w.c(this).a("ID", getLeaderboardId()).a("DisplayName", getDisplayName()).a("IconImageURI", getIconImageUri()).a("ScoreOrder", Integer.valueOf(getScoreOrder())).toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.br
 * JD-Core Version:    0.6.2
 */