package com.google.android.gms.games.multiplayer;

import com.google.android.gms.games.Player;
import com.google.android.gms.internal.x;
import java.util.ArrayList;

public final class ParticipantUtils
{
  public static String getParticipantId(ArrayList<Participant> paramArrayList, String paramString)
  {
    int i = paramArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)paramArrayList.get(j);
      Player localPlayer = localParticipant.getPlayer();
      if ((localPlayer != null) && (localPlayer.getPlayerId().equals(paramString)))
        return localParticipant.getParticipantId();
    }
    return null;
  }

  public static boolean v(String paramString)
  {
    x.b(paramString, "Participant ID must not be null");
    return paramString.startsWith("p_");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.ParticipantUtils
 * JD-Core Version:    0.6.2
 */