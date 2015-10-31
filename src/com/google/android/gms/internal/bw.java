package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.multiplayer.Invitation;
import com.google.android.gms.games.multiplayer.InvitationEntity;
import com.google.android.gms.games.multiplayer.Participant;
import java.util.ArrayList;

public final class bw extends j
  implements Invitation
{
  private final ArrayList<Participant> dJ;
  private final Game dK;
  private final bx dL;

  public bw(k paramk, int paramInt1, int paramInt2)
  {
    super(paramk, paramInt1);
    this.dK = new bf(paramk, paramInt1);
    this.dJ = new ArrayList(paramInt2);
    String str = getString("external_inviter_id");
    int i = 0;
    Object localObject = null;
    while (i < paramInt2)
    {
      bx localbx = new bx(this.O, i + this.R);
      if (localbx.getParticipantId().equals(str))
        localObject = localbx;
      this.dJ.add(localbx);
      i++;
    }
    this.dL = ((bx)x.b(localObject, "Must have a valid inviter!"));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return InvitationEntity.a(this, paramObject);
  }

  public Invitation freeze()
  {
    return new InvitationEntity(this);
  }

  public long getCreationTimestamp()
  {
    return getLong("creation_timestamp");
  }

  public Game getGame()
  {
    return this.dK;
  }

  public String getInvitationId()
  {
    return getString("external_invitation_id");
  }

  public int getInvitationType()
  {
    return getInteger("type");
  }

  public Participant getInviter()
  {
    return this.dL;
  }

  public ArrayList<Participant> getParticipants()
  {
    return this.dJ;
  }

  public int hashCode()
  {
    return InvitationEntity.a(this);
  }

  public String toString()
  {
    return InvitationEntity.b(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((InvitationEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bw
 * JD-Core Version:    0.6.2
 */