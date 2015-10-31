package com.google.android.gms.games.multiplayer.realtime;

import android.database.CharArrayBuffer;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.multiplayer.Participant;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import com.google.android.gms.internal.ax;
import com.google.android.gms.internal.w;
import com.google.android.gms.internal.w.a;
import java.util.ArrayList;

public final class RoomEntity
  implements Room
{
  public static final Parcelable.Creator<RoomEntity> CREATOR = new Parcelable.Creator()
  {
    public RoomEntity[] F(int paramAnonymousInt)
    {
      return new RoomEntity[paramAnonymousInt];
    }

    public RoomEntity s(Parcel paramAnonymousParcel)
    {
      String str1 = paramAnonymousParcel.readString();
      String str2 = paramAnonymousParcel.readString();
      long l = paramAnonymousParcel.readLong();
      int i = paramAnonymousParcel.readInt();
      String str3 = paramAnonymousParcel.readString();
      int j = paramAnonymousParcel.readInt();
      Bundle localBundle = paramAnonymousParcel.readBundle();
      int k = paramAnonymousParcel.readInt();
      ArrayList localArrayList = new ArrayList(k);
      for (int m = 0; m < k; m++)
        localArrayList.add(ParticipantEntity.CREATOR.createFromParcel(paramAnonymousParcel));
      return new RoomEntity(str1, str2, l, i, str3, j, localBundle, localArrayList, null);
    }
  };
  private final String cU;
  private final String ch;
  private final long dG;
  private final ArrayList<Participant> dJ;
  private final int dX;
  private final Bundle dZ;
  private final String ed;
  private final int ee;

  public RoomEntity(Room paramRoom)
  {
    this.cU = paramRoom.getRoomId();
    this.ed = paramRoom.getCreatorId();
    this.dG = paramRoom.getCreationTimestamp();
    this.ee = paramRoom.getStatus();
    this.ch = paramRoom.getDescription();
    this.dX = paramRoom.getVariant();
    this.dZ = paramRoom.getAutoMatchCriteria();
    ArrayList localArrayList = paramRoom.getParticipants();
    int i = localArrayList.size();
    this.dJ = new ArrayList(i);
    for (int j = 0; j < i; j++)
      this.dJ.add(((Participant)localArrayList.get(j)).freeze());
  }

  private RoomEntity(String paramString1, String paramString2, long paramLong, int paramInt1, String paramString3, int paramInt2, Bundle paramBundle, ArrayList<Participant> paramArrayList)
  {
    this.cU = paramString1;
    this.ed = paramString2;
    this.dG = paramLong;
    this.ee = paramInt1;
    this.ch = paramString3;
    this.dX = paramInt2;
    this.dZ = paramBundle;
    this.dJ = paramArrayList;
  }

  public static int a(Room paramRoom)
  {
    Object[] arrayOfObject = new Object[8];
    arrayOfObject[0] = paramRoom.getRoomId();
    arrayOfObject[1] = paramRoom.getCreatorId();
    arrayOfObject[2] = Long.valueOf(paramRoom.getCreationTimestamp());
    arrayOfObject[3] = Integer.valueOf(paramRoom.getStatus());
    arrayOfObject[4] = paramRoom.getDescription();
    arrayOfObject[5] = Integer.valueOf(paramRoom.getVariant());
    arrayOfObject[6] = paramRoom.getAutoMatchCriteria();
    arrayOfObject[7] = paramRoom.getParticipants();
    return w.hashCode(arrayOfObject);
  }

  public static boolean a(Room paramRoom, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Room))
      bool = false;
    Room localRoom;
    do
    {
      do
        return bool;
      while (paramRoom == paramObject);
      localRoom = (Room)paramObject;
    }
    while ((w.a(localRoom.getRoomId(), paramRoom.getRoomId())) && (w.a(localRoom.getCreatorId(), paramRoom.getCreatorId())) && (w.a(Long.valueOf(localRoom.getCreationTimestamp()), Long.valueOf(paramRoom.getCreationTimestamp()))) && (w.a(Integer.valueOf(localRoom.getStatus()), Integer.valueOf(paramRoom.getStatus()))) && (w.a(localRoom.getDescription(), paramRoom.getDescription())) && (w.a(Integer.valueOf(localRoom.getVariant()), Integer.valueOf(paramRoom.getVariant()))) && (w.a(localRoom.getAutoMatchCriteria(), paramRoom.getAutoMatchCriteria())) && (w.a(localRoom.getParticipants(), paramRoom.getParticipants())));
    return false;
  }

  public static String b(Room paramRoom)
  {
    return w.c(paramRoom).a("RoomId", paramRoom.getRoomId()).a("CreatorId", paramRoom.getCreatorId()).a("CreationTimestamp", Long.valueOf(paramRoom.getCreationTimestamp())).a("RoomStatus", Integer.valueOf(paramRoom.getStatus())).a("Description", paramRoom.getDescription()).a("Variant", Integer.valueOf(paramRoom.getVariant())).a("AutoMatchCriteria", paramRoom.getAutoMatchCriteria()).a("Participants", paramRoom.getParticipants()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }

  public Room freeze()
  {
    return this;
  }

  public Bundle getAutoMatchCriteria()
  {
    return this.dZ;
  }

  public long getCreationTimestamp()
  {
    return this.dG;
  }

  public String getCreatorId()
  {
    return this.ed;
  }

  public String getDescription()
  {
    return this.ch;
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    ax.b(this.ch, paramCharArrayBuffer);
  }

  public String getParticipantId(String paramString)
  {
    int i = this.dJ.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)this.dJ.get(j);
      Player localPlayer = localParticipant.getPlayer();
      if ((localPlayer != null) && (localPlayer.getPlayerId().equals(paramString)))
        return localParticipant.getParticipantId();
    }
    return null;
  }

  public ArrayList<String> getParticipantIds()
  {
    int i = this.dJ.size();
    ArrayList localArrayList = new ArrayList(i);
    for (int j = 0; j < i; j++)
      localArrayList.add(((Participant)this.dJ.get(j)).getParticipantId());
    return localArrayList;
  }

  public int getParticipantStatus(String paramString)
  {
    int i = this.dJ.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)this.dJ.get(j);
      if (localParticipant.getParticipantId().equals(paramString))
        return localParticipant.getStatus();
    }
    throw new IllegalStateException("Participant " + paramString + " is not in room " + getRoomId());
  }

  public ArrayList<Participant> getParticipants()
  {
    return this.dJ;
  }

  public String getRoomId()
  {
    return this.cU;
  }

  public int getStatus()
  {
    return this.ee;
  }

  public int getVariant()
  {
    return this.dX;
  }

  public int hashCode()
  {
    return a(this);
  }

  public String toString()
  {
    return b(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.cU);
    paramParcel.writeString(this.ed);
    paramParcel.writeLong(this.dG);
    paramParcel.writeInt(this.ee);
    paramParcel.writeString(this.ch);
    paramParcel.writeInt(this.dX);
    paramParcel.writeBundle(this.dZ);
    int i = this.dJ.size();
    paramParcel.writeInt(i);
    for (int j = 0; j < i; j++)
      ((Participant)this.dJ.get(j)).writeToParcel(paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.realtime.RoomEntity
 * JD-Core Version:    0.6.2
 */