package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.ax;
import com.google.android.gms.internal.w;
import com.google.android.gms.internal.w.a;

public final class ParticipantEntity
  implements Parcelable, Participant
{
  public static final Parcelable.Creator<ParticipantEntity> CREATOR = new Parcelable.Creator()
  {
    public ParticipantEntity[] D(int paramAnonymousInt)
    {
      return new ParticipantEntity[paramAnonymousInt];
    }

    public ParticipantEntity q(Parcel paramAnonymousParcel)
    {
      boolean bool1 = true;
      String str1 = paramAnonymousParcel.readString();
      String str2 = paramAnonymousParcel.readString();
      String str3 = paramAnonymousParcel.readString();
      Uri localUri1;
      String str4;
      Uri localUri2;
      label41: int i;
      String str5;
      boolean bool2;
      if (str3 == null)
      {
        localUri1 = null;
        str4 = paramAnonymousParcel.readString();
        if (str4 != null)
          break label122;
        localUri2 = null;
        i = paramAnonymousParcel.readInt();
        str5 = paramAnonymousParcel.readString();
        if (paramAnonymousParcel.readInt() <= 0)
          break label132;
        bool2 = bool1;
        label63: if (paramAnonymousParcel.readInt() <= 0)
          break label138;
        label70: if (!bool1)
          break label143;
      }
      label132: label138: label143: for (PlayerEntity localPlayerEntity = (PlayerEntity)PlayerEntity.CREATOR.createFromParcel(paramAnonymousParcel); ; localPlayerEntity = null)
      {
        return new ParticipantEntity(str1, str2, localUri1, localUri2, i, str5, bool2, localPlayerEntity, null);
        localUri1 = Uri.parse(str3);
        break;
        label122: localUri2 = Uri.parse(str4);
        break label41;
        bool2 = false;
        break label63;
        bool1 = false;
        break label70;
      }
    }
  };
  private final String bm;
  private final Uri cj;
  private final Uri ck;
  private final PlayerEntity dM;
  private final int dN;
  private final String dO;
  private final boolean dP;
  private final String dm;

  public ParticipantEntity(Participant paramParticipant)
  {
    Player localPlayer = paramParticipant.getPlayer();
    if (localPlayer == null);
    for (PlayerEntity localPlayerEntity = null; ; localPlayerEntity = new PlayerEntity(localPlayer))
    {
      this.dM = localPlayerEntity;
      this.dm = paramParticipant.getParticipantId();
      this.bm = paramParticipant.getDisplayName();
      this.cj = paramParticipant.getIconImageUri();
      this.ck = paramParticipant.getHiResImageUri();
      this.dN = paramParticipant.getStatus();
      this.dO = paramParticipant.getClientAddress();
      this.dP = paramParticipant.isConnectedToRoom();
      return;
    }
  }

  private ParticipantEntity(String paramString1, String paramString2, Uri paramUri1, Uri paramUri2, int paramInt, String paramString3, boolean paramBoolean, PlayerEntity paramPlayerEntity)
  {
    this.dm = paramString1;
    this.bm = paramString2;
    this.cj = paramUri1;
    this.ck = paramUri2;
    this.dN = paramInt;
    this.dO = paramString3;
    this.dP = paramBoolean;
    this.dM = paramPlayerEntity;
  }

  public static int a(Participant paramParticipant)
  {
    Object[] arrayOfObject = new Object[7];
    arrayOfObject[0] = paramParticipant.getPlayer();
    arrayOfObject[1] = Integer.valueOf(paramParticipant.getStatus());
    arrayOfObject[2] = paramParticipant.getClientAddress();
    arrayOfObject[3] = Boolean.valueOf(paramParticipant.isConnectedToRoom());
    arrayOfObject[4] = paramParticipant.getDisplayName();
    arrayOfObject[5] = paramParticipant.getIconImageUri();
    arrayOfObject[6] = paramParticipant.getHiResImageUri();
    return w.hashCode(arrayOfObject);
  }

  public static boolean a(Participant paramParticipant, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Participant))
      bool = false;
    Participant localParticipant;
    do
    {
      do
        return bool;
      while (paramParticipant == paramObject);
      localParticipant = (Participant)paramObject;
    }
    while ((w.a(localParticipant.getPlayer(), paramParticipant.getPlayer())) && (w.a(Integer.valueOf(localParticipant.getStatus()), Integer.valueOf(paramParticipant.getStatus()))) && (w.a(localParticipant.getClientAddress(), paramParticipant.getClientAddress())) && (w.a(Boolean.valueOf(localParticipant.isConnectedToRoom()), Boolean.valueOf(paramParticipant.isConnectedToRoom()))) && (w.a(localParticipant.getDisplayName(), paramParticipant.getDisplayName())) && (w.a(localParticipant.getIconImageUri(), paramParticipant.getIconImageUri())) && (w.a(localParticipant.getHiResImageUri(), paramParticipant.getHiResImageUri())));
    return false;
  }

  public static String b(Participant paramParticipant)
  {
    return w.c(paramParticipant).a("Player", paramParticipant.getPlayer()).a("Status", Integer.valueOf(paramParticipant.getStatus())).a("ClientAddress", paramParticipant.getClientAddress()).a("ConnectedToRoom", Boolean.valueOf(paramParticipant.isConnectedToRoom())).a("DisplayName", paramParticipant.getDisplayName()).a("IconImage", paramParticipant.getIconImageUri()).a("HiResImage", paramParticipant.getHiResImageUri()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }

  public Participant freeze()
  {
    return this;
  }

  public String getClientAddress()
  {
    return this.dO;
  }

  public String getDisplayName()
  {
    if (this.dM == null)
      return this.bm;
    return this.dM.getDisplayName();
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (this.dM == null)
    {
      ax.b(this.bm, paramCharArrayBuffer);
      return;
    }
    this.dM.getDisplayName(paramCharArrayBuffer);
  }

  public Uri getHiResImageUri()
  {
    if (this.dM == null)
      return this.ck;
    return this.dM.getHiResImageUri();
  }

  public Uri getIconImageUri()
  {
    if (this.dM == null)
      return this.cj;
    return this.dM.getIconImageUri();
  }

  public String getParticipantId()
  {
    return this.dm;
  }

  public Player getPlayer()
  {
    return this.dM;
  }

  public int getStatus()
  {
    return this.dN;
  }

  public int hashCode()
  {
    return a(this);
  }

  public boolean isConnectedToRoom()
  {
    return this.dP;
  }

  public String toString()
  {
    return b(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.dm);
    paramParcel.writeString(this.bm);
    String str1;
    String str2;
    label44: int i;
    label76: int j;
    if (this.cj == null)
    {
      str1 = null;
      paramParcel.writeString(str1);
      Uri localUri = this.ck;
      str2 = null;
      if (localUri != null)
        break label130;
      paramParcel.writeString(str2);
      paramParcel.writeInt(this.dN);
      paramParcel.writeString(this.dO);
      if (!this.dP)
        break label142;
      i = 1;
      paramParcel.writeInt(i);
      PlayerEntity localPlayerEntity = this.dM;
      j = 0;
      if (localPlayerEntity != null)
        break label148;
    }
    while (true)
    {
      paramParcel.writeInt(j);
      if (this.dM != null)
        this.dM.writeToParcel(paramParcel, paramInt);
      return;
      str1 = this.cj.toString();
      break;
      label130: str2 = this.ck.toString();
      break label44;
      label142: i = 0;
      break label76;
      label148: j = 1;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.ParticipantEntity
 * JD-Core Version:    0.6.2
 */