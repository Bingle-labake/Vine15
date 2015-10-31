package com.google.android.gms.internal;

import android.database.CharArrayBuffer;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.multiplayer.Participant;
import com.google.android.gms.games.multiplayer.realtime.Room;
import com.google.android.gms.games.multiplayer.realtime.RoomConfig;
import com.google.android.gms.games.multiplayer.realtime.RoomEntity;
import java.util.ArrayList;

public final class bz extends j
  implements Room
{
  private final int jdField_do;

  bz(k paramk, int paramInt1, int paramInt2)
  {
    super(paramk, paramInt1);
    this.jdField_do = paramInt2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return RoomEntity.a(this, paramObject);
  }

  public Room freeze()
  {
    return new RoomEntity(this);
  }

  public Bundle getAutoMatchCriteria()
  {
    if (!getBoolean("has_automatch_criteria"))
      return null;
    return RoomConfig.createAutoMatchCriteria(getInteger("automatch_min_players"), getInteger("automatch_max_players"), getLong("automatch_bit_mask"));
  }

  public long getCreationTimestamp()
  {
    return getLong("creation_timestamp");
  }

  public String getCreatorId()
  {
    return getString("creator_external");
  }

  public String getDescription()
  {
    return getString("description");
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    a("description", paramCharArrayBuffer);
  }

  public String getParticipantId(String paramString)
  {
    ArrayList localArrayList = getParticipants();
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      Player localPlayer = localParticipant.getPlayer();
      if ((localPlayer != null) && (localPlayer.getPlayerId().equals(paramString)))
        return localParticipant.getParticipantId();
    }
    return null;
  }

  public ArrayList<String> getParticipantIds()
  {
    ArrayList localArrayList1 = getParticipants();
    ArrayList localArrayList2 = new ArrayList(this.jdField_do);
    for (int i = 0; i < this.jdField_do; i++)
      localArrayList2.add(((Participant)localArrayList1.get(i)).getParticipantId());
    return localArrayList2;
  }

  public int getParticipantStatus(String paramString)
  {
    ArrayList localArrayList = getParticipants();
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      if (localParticipant.getParticipantId().equals(paramString))
        return localParticipant.getStatus();
    }
    throw new IllegalStateException("Participant " + paramString + " is not in room " + getRoomId());
  }

  public ArrayList<Participant> getParticipants()
  {
    ArrayList localArrayList = new ArrayList(this.jdField_do);
    for (int i = 0; i < this.jdField_do; i++)
      localArrayList.add(new bx(this.O, i + this.R));
    return localArrayList;
  }

  public String getRoomId()
  {
    return getString("external_match_id");
  }

  public int getStatus()
  {
    return getInteger("status");
  }

  public int getVariant()
  {
    return getInteger("variant");
  }

  public int hashCode()
  {
    return RoomEntity.a(this);
  }

  public String toString()
  {
    return RoomEntity.b(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((RoomEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bz
 * JD-Core Version:    0.6.2
 */