package com.google.android.gms.games.multiplayer.realtime;

import android.database.CharArrayBuffer;
import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.games.multiplayer.Participatable;
import java.util.ArrayList;

public abstract interface Room extends Parcelable, Freezable<Room>, Participatable
{
  public static final int ROOM_STATUS_ACTIVE = 3;
  public static final int ROOM_STATUS_AUTO_MATCHING = 1;
  public static final int ROOM_STATUS_CONNECTING = 2;
  public static final int ROOM_STATUS_INVITING = 0;
  public static final int ROOM_VARIANT_ANY = -1;

  public abstract Bundle getAutoMatchCriteria();

  public abstract long getCreationTimestamp();

  public abstract String getCreatorId();

  public abstract String getDescription();

  public abstract void getDescription(CharArrayBuffer paramCharArrayBuffer);

  public abstract String getParticipantId(String paramString);

  public abstract ArrayList<String> getParticipantIds();

  public abstract int getParticipantStatus(String paramString);

  public abstract String getRoomId();

  public abstract int getStatus();

  public abstract int getVariant();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.realtime.Room
 * JD-Core Version:    0.6.2
 */