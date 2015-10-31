package com.google.android.gms.games.multiplayer.realtime;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.x;

public final class RealTimeMessage
  implements Parcelable
{
  public static final Parcelable.Creator<RealTimeMessage> CREATOR = new Parcelable.Creator()
  {
    public RealTimeMessage[] E(int paramAnonymousInt)
    {
      return new RealTimeMessage[paramAnonymousInt];
    }

    public RealTimeMessage r(Parcel paramAnonymousParcel)
    {
      return new RealTimeMessage(paramAnonymousParcel, null);
    }
  };
  public static final int RELIABLE = 1;
  public static final int UNRELIABLE;
  private final String dR;
  private final byte[] dS;
  private final int dT;

  private RealTimeMessage(Parcel paramParcel)
  {
    this(paramParcel.readString(), paramParcel.createByteArray(), paramParcel.readInt());
  }

  public RealTimeMessage(String paramString, byte[] paramArrayOfByte, int paramInt)
  {
    this.dR = ((String)x.d(paramString));
    this.dS = ((byte[])((byte[])x.d(paramArrayOfByte)).clone());
    this.dT = paramInt;
  }

  public int describeContents()
  {
    return 0;
  }

  public byte[] getMessageData()
  {
    return this.dS;
  }

  public String getSenderParticipantId()
  {
    return this.dR;
  }

  public boolean isReliable()
  {
    return this.dT == 1;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.dR);
    paramParcel.writeByteArray(this.dS);
    paramParcel.writeInt(this.dT);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.realtime.RealTimeMessage
 * JD-Core Version:    0.6.2
 */