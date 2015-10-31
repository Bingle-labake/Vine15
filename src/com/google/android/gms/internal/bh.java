package com.google.android.gms.internal;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.achievement.Achievement;

public final class bh extends j
  implements Achievement
{
  public bh(k paramk, int paramInt)
  {
    super(paramk, paramInt);
  }

  public String getAchievementId()
  {
    return getString("external_achievement_id");
  }

  public int getCurrentSteps()
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      n.a(i);
      return getInteger("current_steps");
      int j = 0;
    }
  }

  public String getDescription()
  {
    return getString("description");
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    a("description", paramCharArrayBuffer);
  }

  public String getFormattedCurrentSteps()
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      n.a(i);
      return getString("formatted_current_steps");
      int j = 0;
    }
  }

  public void getFormattedCurrentSteps(CharArrayBuffer paramCharArrayBuffer)
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      n.a(i);
      a("formatted_current_steps", paramCharArrayBuffer);
      return;
      int j = 0;
    }
  }

  public String getFormattedTotalSteps()
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      n.a(i);
      return getString("formatted_total_steps");
      int j = 0;
    }
  }

  public void getFormattedTotalSteps(CharArrayBuffer paramCharArrayBuffer)
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      n.a(i);
      a("formatted_total_steps", paramCharArrayBuffer);
      return;
      int j = 0;
    }
  }

  public long getLastUpdatedTimestamp()
  {
    return getLong("last_updated_timestamp");
  }

  public String getName()
  {
    return getString("name");
  }

  public void getName(CharArrayBuffer paramCharArrayBuffer)
  {
    a("name", paramCharArrayBuffer);
  }

  public Player getPlayer()
  {
    return new bg(this.O, this.R);
  }

  public Uri getRevealedImageUri()
  {
    return c("revealed_icon_image_uri");
  }

  public int getState()
  {
    return getInteger("state");
  }

  public int getTotalSteps()
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      n.a(i);
      return getInteger("total_steps");
      int j = 0;
    }
  }

  public int getType()
  {
    return getInteger("type");
  }

  public Uri getUnlockedImageUri()
  {
    return c("unlocked_icon_image_uri");
  }

  public String toString()
  {
    w.a locala = w.c(this).a("id", getAchievementId()).a("name", getName()).a("state", Integer.valueOf(getState())).a("type", Integer.valueOf(getType()));
    if (getType() == 1)
      locala.a("steps", getCurrentSteps() + "/" + getTotalSteps());
    return locala.toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bh
 * JD-Core Version:    0.6.2
 */