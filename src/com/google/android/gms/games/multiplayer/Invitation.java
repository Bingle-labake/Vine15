package com.google.android.gms.games.multiplayer;

import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.games.Game;

public abstract interface Invitation extends Parcelable, Freezable<Invitation>, Participatable
{
  public abstract long getCreationTimestamp();

  public abstract Game getGame();

  public abstract String getInvitationId();

  public abstract int getInvitationType();

  public abstract Participant getInviter();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.Invitation
 * JD-Core Version:    0.6.2
 */