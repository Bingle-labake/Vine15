package com.google.android.gms.games.multiplayer.realtime;

import android.os.Bundle;
import com.google.android.gms.internal.x;
import java.util.ArrayList;
import java.util.Arrays;

public final class RoomConfig
{
  private final String dF;
  private final RoomUpdateListener dU;
  private final RoomStatusUpdateListener dV;
  private final RealTimeMessageReceivedListener dW;
  private final int dX;
  private final String[] dY;
  private final Bundle dZ;
  private final boolean ea;

  private RoomConfig(Builder paramBuilder)
  {
    this.dU = paramBuilder.dU;
    this.dV = paramBuilder.dV;
    this.dW = paramBuilder.dW;
    this.dF = paramBuilder.eb;
    this.dX = paramBuilder.dX;
    this.dZ = paramBuilder.dZ;
    this.ea = paramBuilder.ea;
    int i = paramBuilder.ec.size();
    this.dY = ((String[])paramBuilder.ec.toArray(new String[i]));
    if (this.dW == null)
      x.a(this.ea, "Must either enable sockets OR specify a message listener");
  }

  public static Builder builder(RoomUpdateListener paramRoomUpdateListener)
  {
    return new Builder(paramRoomUpdateListener, null);
  }

  public static Bundle createAutoMatchCriteria(int paramInt1, int paramInt2, long paramLong)
  {
    Bundle localBundle = new Bundle();
    localBundle.putInt("min_automatch_players", paramInt1);
    localBundle.putInt("max_automatch_players", paramInt2);
    localBundle.putLong("exclusive_bit_mask", paramLong);
    return localBundle;
  }

  public Bundle getAutoMatchCriteria()
  {
    return this.dZ;
  }

  public String getInvitationId()
  {
    return this.dF;
  }

  public String[] getInvitedPlayerIds()
  {
    return this.dY;
  }

  public RealTimeMessageReceivedListener getMessageReceivedListener()
  {
    return this.dW;
  }

  public RoomStatusUpdateListener getRoomStatusUpdateListener()
  {
    return this.dV;
  }

  public RoomUpdateListener getRoomUpdateListener()
  {
    return this.dU;
  }

  public int getVariant()
  {
    return this.dX;
  }

  public boolean isSocketEnabled()
  {
    return this.ea;
  }

  public static final class Builder
  {
    final RoomUpdateListener dU;
    RoomStatusUpdateListener dV;
    RealTimeMessageReceivedListener dW;
    int dX = -1;
    Bundle dZ;
    boolean ea = false;
    String eb = null;
    ArrayList<String> ec = new ArrayList();

    private Builder(RoomUpdateListener paramRoomUpdateListener)
    {
      this.dU = ((RoomUpdateListener)x.b(paramRoomUpdateListener, "Must provide a RoomUpdateListener"));
    }

    public Builder addPlayersToInvite(ArrayList<String> paramArrayList)
    {
      x.d(paramArrayList);
      this.ec.addAll(paramArrayList);
      return this;
    }

    public Builder addPlayersToInvite(String[] paramArrayOfString)
    {
      x.d(paramArrayOfString);
      this.ec.addAll(Arrays.asList(paramArrayOfString));
      return this;
    }

    public RoomConfig build()
    {
      return new RoomConfig(this, null);
    }

    public Builder setAutoMatchCriteria(Bundle paramBundle)
    {
      this.dZ = paramBundle;
      return this;
    }

    public Builder setInvitationIdToAccept(String paramString)
    {
      x.d(paramString);
      this.eb = paramString;
      return this;
    }

    public Builder setMessageReceivedListener(RealTimeMessageReceivedListener paramRealTimeMessageReceivedListener)
    {
      this.dW = paramRealTimeMessageReceivedListener;
      return this;
    }

    public Builder setRoomStatusUpdateListener(RoomStatusUpdateListener paramRoomStatusUpdateListener)
    {
      this.dV = paramRoomStatusUpdateListener;
      return this;
    }

    public Builder setSocketCommunicationEnabled(boolean paramBoolean)
    {
      this.ea = paramBoolean;
      return this;
    }

    public Builder setVariant(int paramInt)
    {
      this.dX = paramInt;
      return this;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.realtime.RoomConfig
 * JD-Core Version:    0.6.2
 */