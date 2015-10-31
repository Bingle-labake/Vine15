package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.games.Player;

public abstract interface Participant extends Parcelable, Freezable<Participant>
{
  public static final int STATUS_DECLINED = 3;
  public static final int STATUS_INVITED = 1;
  public static final int STATUS_JOINED = 2;
  public static final int STATUS_LEFT = 4;

  public abstract String getClientAddress();

  public abstract String getDisplayName();

  public abstract void getDisplayName(CharArrayBuffer paramCharArrayBuffer);

  public abstract Uri getHiResImageUri();

  public abstract Uri getIconImageUri();

  public abstract String getParticipantId();

  public abstract Player getPlayer();

  public abstract int getStatus();

  public abstract boolean isConnectedToRoom();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.Participant
 * JD-Core Version:    0.6.2
 */