package com.google.android.gms.internal;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;

public final class bg extends j
  implements Player
{
  public bg(k paramk, int paramInt)
  {
    super(paramk, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return PlayerEntity.a(this, paramObject);
  }

  public Player freeze()
  {
    return new PlayerEntity(this);
  }

  public String getDisplayName()
  {
    return getString("profile_name");
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    a("profile_name", paramCharArrayBuffer);
  }

  public Uri getHiResImageUri()
  {
    return c("profile_hi_res_image_uri");
  }

  public Uri getIconImageUri()
  {
    return c("profile_icon_image_uri");
  }

  public String getPlayerId()
  {
    return getString("external_player_id");
  }

  public long getRetrievedTimestamp()
  {
    return getLong("last_updated");
  }

  public boolean hasHiResImage()
  {
    return getHiResImageUri() != null;
  }

  public boolean hasIconImage()
  {
    return getIconImageUri() != null;
  }

  public int hashCode()
  {
    return PlayerEntity.a(this);
  }

  public String toString()
  {
    return PlayerEntity.b(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((PlayerEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bg
 * JD-Core Version:    0.6.2
 */