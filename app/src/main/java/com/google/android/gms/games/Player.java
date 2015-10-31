package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;

public abstract interface Player extends Parcelable, Freezable<Player>
{
  public abstract String getDisplayName();

  public abstract void getDisplayName(CharArrayBuffer paramCharArrayBuffer);

  public abstract Uri getHiResImageUri();

  public abstract Uri getIconImageUri();

  public abstract String getPlayerId();

  public abstract long getRetrievedTimestamp();

  public abstract boolean hasHiResImage();

  public abstract boolean hasIconImage();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.Player
 * JD-Core Version:    0.6.2
 */