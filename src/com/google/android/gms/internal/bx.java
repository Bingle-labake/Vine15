package com.google.android.gms.internal;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.multiplayer.Participant;
import com.google.android.gms.games.multiplayer.ParticipantEntity;

public final class bx extends j
  implements Participant
{
  private final bg dQ;

  public bx(k paramk, int paramInt)
  {
    super(paramk, paramInt);
    this.dQ = new bg(paramk, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return ParticipantEntity.a(this, paramObject);
  }

  public Participant freeze()
  {
    return new ParticipantEntity(this);
  }

  public String getClientAddress()
  {
    return getString("client_address");
  }

  public String getDisplayName()
  {
    if (d("external_player_id"))
      return getString("default_display_name");
    return this.dQ.getDisplayName();
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (d("external_player_id"))
    {
      a("default_display_name", paramCharArrayBuffer);
      return;
    }
    this.dQ.getDisplayName(paramCharArrayBuffer);
  }

  public Uri getHiResImageUri()
  {
    if (d("external_player_id"))
      return null;
    return this.dQ.getHiResImageUri();
  }

  public Uri getIconImageUri()
  {
    if (d("external_player_id"))
      return c("default_display_image_uri");
    return this.dQ.getIconImageUri();
  }

  public String getParticipantId()
  {
    return getString("external_participant_id");
  }

  public Player getPlayer()
  {
    if (d("external_player_id"))
      return null;
    return this.dQ;
  }

  public int getStatus()
  {
    return getInteger("player_status");
  }

  public int hashCode()
  {
    return ParticipantEntity.a(this);
  }

  public boolean isConnectedToRoom()
  {
    return getInteger("connected") > 0;
  }

  public String toString()
  {
    return ParticipantEntity.b(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((ParticipantEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bx
 * JD-Core Version:    0.6.2
 */