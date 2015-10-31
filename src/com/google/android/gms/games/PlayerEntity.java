package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ax;
import com.google.android.gms.internal.n;
import com.google.android.gms.internal.w;
import com.google.android.gms.internal.w.a;

public final class PlayerEntity
  implements Player
{
  public static final Parcelable.Creator<PlayerEntity> CREATOR = new Parcelable.Creator()
  {
    public PlayerEntity o(Parcel paramAnonymousParcel)
    {
      String str1 = paramAnonymousParcel.readString();
      String str2 = paramAnonymousParcel.readString();
      String str3 = paramAnonymousParcel.readString();
      String str4 = paramAnonymousParcel.readString();
      Uri localUri1;
      if (str3 == null)
      {
        localUri1 = null;
        if (str4 != null)
          break label67;
      }
      label67: for (Uri localUri2 = null; ; localUri2 = Uri.parse(str4))
      {
        return new PlayerEntity(str1, str2, localUri1, localUri2, paramAnonymousParcel.readLong(), null);
        localUri1 = Uri.parse(str3);
        break;
      }
    }

    public PlayerEntity[] w(int paramAnonymousInt)
    {
      return new PlayerEntity[paramAnonymousInt];
    }
  };
  private final String bm;
  private final Uri cj;
  private final Uri ck;
  private final String cw;
  private final long cx;

  public PlayerEntity(Player paramPlayer)
  {
    this.cw = paramPlayer.getPlayerId();
    this.bm = paramPlayer.getDisplayName();
    this.cj = paramPlayer.getIconImageUri();
    this.ck = paramPlayer.getHiResImageUri();
    this.cx = paramPlayer.getRetrievedTimestamp();
    n.b(this.cw);
    n.b(this.bm);
    if (this.cx > 0L);
    for (boolean bool = true; ; bool = false)
    {
      n.a(bool);
      return;
    }
  }

  private PlayerEntity(String paramString1, String paramString2, Uri paramUri1, Uri paramUri2, long paramLong)
  {
    this.cw = paramString1;
    this.bm = paramString2;
    this.cj = paramUri1;
    this.ck = paramUri2;
    this.cx = paramLong;
  }

  public static int a(Player paramPlayer)
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = paramPlayer.getPlayerId();
    arrayOfObject[1] = paramPlayer.getDisplayName();
    arrayOfObject[2] = paramPlayer.getIconImageUri();
    arrayOfObject[3] = paramPlayer.getHiResImageUri();
    arrayOfObject[4] = Long.valueOf(paramPlayer.getRetrievedTimestamp());
    return w.hashCode(arrayOfObject);
  }

  public static boolean a(Player paramPlayer, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Player))
      bool = false;
    Player localPlayer;
    do
    {
      do
        return bool;
      while (paramPlayer == paramObject);
      localPlayer = (Player)paramObject;
    }
    while ((w.a(localPlayer.getPlayerId(), paramPlayer.getPlayerId())) && (w.a(localPlayer.getDisplayName(), paramPlayer.getDisplayName())) && (w.a(localPlayer.getIconImageUri(), paramPlayer.getIconImageUri())) && (w.a(localPlayer.getHiResImageUri(), paramPlayer.getHiResImageUri())) && (w.a(Long.valueOf(localPlayer.getRetrievedTimestamp()), Long.valueOf(paramPlayer.getRetrievedTimestamp()))));
    return false;
  }

  public static String b(Player paramPlayer)
  {
    return w.c(paramPlayer).a("PlayerId", paramPlayer.getPlayerId()).a("DisplayName", paramPlayer.getDisplayName()).a("IconImageUri", paramPlayer.getIconImageUri()).a("HiResImageUri", paramPlayer.getHiResImageUri()).a("RetrievedTimestamp", Long.valueOf(paramPlayer.getRetrievedTimestamp())).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }

  public Player freeze()
  {
    return this;
  }

  public String getDisplayName()
  {
    return this.bm;
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    ax.b(this.bm, paramCharArrayBuffer);
  }

  public Uri getHiResImageUri()
  {
    return this.ck;
  }

  public Uri getIconImageUri()
  {
    return this.cj;
  }

  public String getPlayerId()
  {
    return this.cw;
  }

  public long getRetrievedTimestamp()
  {
    return this.cx;
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
    return a(this);
  }

  public String toString()
  {
    return b(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.cw);
    paramParcel.writeString(this.bm);
    String str1;
    String str2;
    if (this.cj == null)
    {
      str1 = null;
      paramParcel.writeString(str1);
      Uri localUri = this.ck;
      str2 = null;
      if (localUri != null)
        break label70;
    }
    while (true)
    {
      paramParcel.writeString(str2);
      paramParcel.writeLong(this.cx);
      return;
      str1 = this.cj.toString();
      break;
      label70: str2 = this.ck.toString();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.PlayerEntity
 * JD-Core Version:    0.6.2
 */