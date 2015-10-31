package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcelable;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.games.GameBuffer;
import com.google.android.gms.games.OnGamesLoadedListener;
import com.google.android.gms.games.OnPlayersLoadedListener;
import com.google.android.gms.games.OnSignOutCompleteListener;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerBuffer;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.games.RealTimeSocket;
import com.google.android.gms.games.achievement.AchievementBuffer;
import com.google.android.gms.games.achievement.OnAchievementUpdatedListener;
import com.google.android.gms.games.achievement.OnAchievementsLoadedListener;
import com.google.android.gms.games.leaderboard.LeaderboardBuffer;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;
import com.google.android.gms.games.leaderboard.OnLeaderboardMetadataLoadedListener;
import com.google.android.gms.games.leaderboard.OnLeaderboardScoresLoadedListener;
import com.google.android.gms.games.leaderboard.OnScoreSubmittedListener;
import com.google.android.gms.games.leaderboard.SubmitScoreResult;
import com.google.android.gms.games.multiplayer.Invitation;
import com.google.android.gms.games.multiplayer.InvitationBuffer;
import com.google.android.gms.games.multiplayer.OnInvitationReceivedListener;
import com.google.android.gms.games.multiplayer.OnInvitationsLoadedListener;
import com.google.android.gms.games.multiplayer.ParticipantUtils;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessage;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessageReceivedListener;
import com.google.android.gms.games.multiplayer.realtime.RealTimeReliableMessageSentListener;
import com.google.android.gms.games.multiplayer.realtime.Room;
import com.google.android.gms.games.multiplayer.realtime.RoomConfig;
import com.google.android.gms.games.multiplayer.realtime.RoomStatusUpdateListener;
import com.google.android.gms.games.multiplayer.realtime.RoomUpdateListener;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

public final class bj extends p<bm>
{
  private PlayerEntity cA;
  private final bn cB;
  private boolean cC = false;
  private final Binder cD;
  private final long cE;
  private final boolean cF;
  private final String cy;
  private final Map<String, bo> cz;
  private final String g;

  public bj(Context paramContext, String paramString1, String paramString2, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String[] paramArrayOfString, int paramInt, View paramView, boolean paramBoolean)
  {
    super(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, paramArrayOfString);
    this.cy = paramString1;
    this.g = ((String)x.d(paramString2));
    this.cD = new Binder();
    this.cz = new HashMap();
    this.cB = bn.a(this, paramInt);
    setViewForPopups(paramView);
    this.cE = hashCode();
    this.cF = paramBoolean;
  }

  private void ah()
  {
    this.cA = null;
  }

  private void ai()
  {
    Iterator localIterator = this.cz.values().iterator();
    while (localIterator.hasNext())
    {
      bo localbo = (bo)localIterator.next();
      try
      {
        localbo.close();
      }
      catch (IOException localIOException)
      {
        bk.a("GamesClient", "IOException:", localIOException);
      }
    }
    this.cz.clear();
  }

  // ERROR //
  private bo p(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 134	com/google/android/gms/internal/bj:o	()Landroid/os/IInterface;
    //   4: checkcast 136	com/google/android/gms/internal/bm
    //   7: aload_1
    //   8: invokeinterface 140 2 0
    //   13: astore_3
    //   14: aload_3
    //   15: ifnonnull +5 -> 20
    //   18: aconst_null
    //   19: areturn
    //   20: ldc 116
    //   22: new 142	java/lang/StringBuilder
    //   25: dup
    //   26: invokespecial 143	java/lang/StringBuilder:<init>	()V
    //   29: ldc 145
    //   31: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   34: aload_3
    //   35: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   41: invokestatic 156	com/google/android/gms/internal/bk:d	(Ljava/lang/String;Ljava/lang/String;)V
    //   44: new 158	android/net/LocalSocket
    //   47: dup
    //   48: invokespecial 159	android/net/LocalSocket:<init>	()V
    //   51: astore 4
    //   53: aload 4
    //   55: new 161	android/net/LocalSocketAddress
    //   58: dup
    //   59: aload_3
    //   60: invokespecial 164	android/net/LocalSocketAddress:<init>	(Ljava/lang/String;)V
    //   63: invokevirtual 168	android/net/LocalSocket:connect	(Landroid/net/LocalSocketAddress;)V
    //   66: new 111	com/google/android/gms/internal/bo
    //   69: dup
    //   70: aload 4
    //   72: aload_1
    //   73: invokespecial 171	com/google/android/gms/internal/bo:<init>	(Landroid/net/LocalSocket;Ljava/lang/String;)V
    //   76: astore 6
    //   78: aload_0
    //   79: getfield 53	com/google/android/gms/internal/bj:cz	Ljava/util/Map;
    //   82: aload_1
    //   83: aload 6
    //   85: invokeinterface 175 3 0
    //   90: pop
    //   91: aload 6
    //   93: areturn
    //   94: astore_2
    //   95: ldc 116
    //   97: ldc 177
    //   99: invokestatic 180	com/google/android/gms/internal/bk:c	(Ljava/lang/String;Ljava/lang/String;)V
    //   102: aconst_null
    //   103: areturn
    //   104: astore 5
    //   106: ldc 116
    //   108: new 142	java/lang/StringBuilder
    //   111: dup
    //   112: invokespecial 143	java/lang/StringBuilder:<init>	()V
    //   115: ldc 182
    //   117: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   120: aload 5
    //   122: invokevirtual 185	java/io/IOException:getMessage	()Ljava/lang/String;
    //   125: invokevirtual 149	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   128: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   131: invokestatic 180	com/google/android/gms/internal/bk:c	(Ljava/lang/String;Ljava/lang/String;)V
    //   134: aconst_null
    //   135: areturn
    //
    // Exception table:
    //   from	to	target	type
    //   0	14	94	android/os/RemoteException
    //   20	53	94	android/os/RemoteException
    //   53	66	94	android/os/RemoteException
    //   66	91	94	android/os/RemoteException
    //   106	134	94	android/os/RemoteException
    //   53	66	104	java/io/IOException
  }

  private Room x(k paramk)
  {
    by localby = new by(paramk);
    try
    {
      int i = localby.getCount();
      Room localRoom = null;
      if (i > 0)
        localRoom = (Room)((Room)localby.get(0)).freeze();
      return localRoom;
    }
    finally
    {
      localby.close();
    }
  }

  public int a(byte[] paramArrayOfByte, String paramString, String[] paramArrayOfString)
  {
    x.b(paramArrayOfString, "Participant IDs must not be null");
    try
    {
      int i = ((bm)o()).b(paramArrayOfByte, paramString, paramArrayOfString);
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
    return -1;
  }

  public void a(IBinder paramIBinder, Bundle paramBundle)
  {
    if (isConnected());
    try
    {
      ((bm)o()).a(paramIBinder, paramBundle);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  protected void a(ConnectionResult paramConnectionResult)
  {
    super.a(paramConnectionResult);
    this.cC = false;
  }

  public void a(OnPlayersLoadedListener paramOnPlayersLoadedListener, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    try
    {
      ((bm)o()).a(new ad(paramOnPlayersLoadedListener), paramInt, paramBoolean1, paramBoolean2);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void a(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, String paramString)
  {
    Object localObject;
    if (paramOnAchievementUpdatedListener == null)
      localObject = null;
    try
    {
      while (true)
      {
        ((bm)o()).a((bl)localObject, paramString, this.cB.ao(), this.cB.an());
        return;
        d locald = new d(paramOnAchievementUpdatedListener);
        localObject = locald;
      }
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void a(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, String paramString, int paramInt)
  {
    Object localObject;
    if (paramOnAchievementUpdatedListener == null)
      localObject = null;
    try
    {
      while (true)
      {
        ((bm)o()).a((bl)localObject, paramString, paramInt, this.cB.ao(), this.cB.an());
        return;
        localObject = new d(paramOnAchievementUpdatedListener);
      }
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void a(OnScoreSubmittedListener paramOnScoreSubmittedListener, String paramString, long paramLong)
  {
    Object localObject;
    if (paramOnScoreSubmittedListener == null)
      localObject = null;
    try
    {
      while (true)
      {
        ((bm)o()).a((bl)localObject, paramString, paramLong);
        return;
        ao localao = new ao(paramOnScoreSubmittedListener);
        localObject = localao;
      }
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  protected void a(u paramu, p<bm>.d paramp)
    throws RemoteException
  {
    String str = getContext().getResources().getConfiguration().locale.toString();
    j localj = new j(paramp);
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("com.google.android.gms.games.key.isHeadless", this.cF);
    paramu.a(localj, 3136100, getContext().getPackageName(), this.g, j(), this.cy, this.cB.ao(), str, localBundle);
  }

  protected void a(String[] paramArrayOfString)
  {
    int i = 0;
    int j = 0;
    boolean bool1 = false;
    if (i < paramArrayOfString.length)
    {
      String str = paramArrayOfString[i];
      if (str.equals("https://www.googleapis.com/auth/games"))
        bool1 = true;
      while (true)
      {
        i++;
        break;
        if (str.equals("https://www.googleapis.com/auth/games.firstparty"))
          j = 1;
      }
    }
    if (j != 0)
    {
      if (!bool1);
      for (boolean bool2 = true; ; bool2 = false)
      {
        x.a(bool2, String.format("Cannot have both %s and %s!", new Object[] { "https://www.googleapis.com/auth/games", "https://www.googleapis.com/auth/games.firstparty" }));
        return;
      }
    }
    x.a(bool1, String.format("GamesClient requires %s to function.", new Object[] { "https://www.googleapis.com/auth/games" }));
  }

  public void aj()
  {
    if (isConnected());
    try
    {
      ((bm)o()).aj();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  protected String b()
  {
    return "com.google.android.gms.games.service.START";
  }

  public void b(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, String paramString)
  {
    Object localObject;
    if (paramOnAchievementUpdatedListener == null)
      localObject = null;
    try
    {
      while (true)
      {
        ((bm)o()).b((bl)localObject, paramString, this.cB.ao(), this.cB.an());
        return;
        d locald = new d(paramOnAchievementUpdatedListener);
        localObject = locald;
      }
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  protected String c()
  {
    return "com.google.android.gms.games.internal.IGamesService";
  }

  public void clearNotifications(int paramInt)
  {
    try
    {
      ((bm)o()).clearNotifications(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void connect()
  {
    ah();
    super.connect();
  }

  public void createRoom(RoomConfig paramRoomConfig)
  {
    try
    {
      ai localai = new ai(paramRoomConfig.getRoomUpdateListener(), paramRoomConfig.getRoomStatusUpdateListener(), paramRoomConfig.getMessageReceivedListener());
      ((bm)o()).a(localai, this.cD, paramRoomConfig.getVariant(), paramRoomConfig.getInvitedPlayerIds(), paramRoomConfig.getAutoMatchCriteria(), paramRoomConfig.isSocketEnabled(), this.cE);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void disconnect()
  {
    this.cC = false;
    if (isConnected());
    try
    {
      bm localbm = (bm)o();
      localbm.aj();
      localbm.b(this.cE);
      localbm.a(this.cE);
      ai();
      super.disconnect();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      while (true)
        bk.b("GamesClient", "Failed to notify client disconnect.");
    }
  }

  public Intent getAchievementsIntent()
  {
    n();
    Intent localIntent = new Intent("com.google.android.gms.games.VIEW_ACHIEVEMENTS");
    localIntent.addFlags(67108864);
    return localIntent;
  }

  public Intent getAllLeaderboardsIntent()
  {
    n();
    Intent localIntent = new Intent("com.google.android.gms.games.VIEW_LEADERBOARDS");
    localIntent.putExtra("com.google.android.gms.games.GAME_PACKAGE_NAME", this.cy);
    localIntent.addFlags(67108864);
    return localIntent;
  }

  public String getAppId()
  {
    try
    {
      String str = ((bm)o()).getAppId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
    return null;
  }

  public String getCurrentAccountName()
  {
    try
    {
      String str = ((bm)o()).getCurrentAccountName();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
    return null;
  }

  public Player getCurrentPlayer()
  {
    n();
    try
    {
      PlayerEntity localPlayerEntity = this.cA;
      if (localPlayerEntity == null);
      try
      {
        PlayerBuffer localPlayerBuffer = new PlayerBuffer(((bm)o()).ak());
        try
        {
          if (localPlayerBuffer.getCount() > 0)
            this.cA = ((PlayerEntity)localPlayerBuffer.get(0).freeze());
          localPlayerBuffer.close();
          return this.cA;
        }
        finally
        {
          localObject2 = finally;
          localPlayerBuffer.close();
          throw localObject2;
        }
      }
      catch (RemoteException localRemoteException)
      {
        while (true)
          bk.b("GamesClient", "service died");
      }
    }
    finally
    {
    }
  }

  public String getCurrentPlayerId()
  {
    try
    {
      String str = ((bm)o()).getCurrentPlayerId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
    return null;
  }

  public Intent getInvitationInboxIntent()
  {
    n();
    Intent localIntent = new Intent("com.google.android.gms.games.SHOW_INVITATIONS");
    localIntent.putExtra("com.google.android.gms.games.GAME_PACKAGE_NAME", this.cy);
    return localIntent;
  }

  public Intent getLeaderboardIntent(String paramString)
  {
    n();
    Intent localIntent = new Intent("com.google.android.gms.games.VIEW_LEADERBOARD_SCORES");
    localIntent.putExtra("com.google.android.gms.games.LEADERBOARD_ID", paramString);
    localIntent.addFlags(67108864);
    return localIntent;
  }

  public RealTimeSocket getRealTimeSocketForParticipant(String paramString1, String paramString2)
  {
    if ((paramString2 == null) || (!ParticipantUtils.v(paramString2)))
      throw new IllegalArgumentException("Bad participant ID");
    bo localbo = (bo)this.cz.get(paramString2);
    if ((localbo == null) || (localbo.isClosed()))
      localbo = p(paramString2);
    return localbo;
  }

  public Intent getRealTimeWaitingRoomIntent(Room paramRoom, int paramInt)
  {
    n();
    Intent localIntent = new Intent("com.google.android.gms.games.SHOW_REAL_TIME_WAITING_ROOM");
    x.b(paramRoom, "Room parameter must not be null");
    localIntent.putExtra("room", (Parcelable)paramRoom.freeze());
    if (paramInt >= 0);
    for (boolean bool = true; ; bool = false)
    {
      x.a(bool, "minParticipantsToStart must be >= 0");
      localIntent.putExtra("com.google.android.gms.games.MIN_PARTICIPANTS_TO_START", paramInt);
      return localIntent;
    }
  }

  public Intent getSelectPlayersIntent(int paramInt1, int paramInt2)
  {
    n();
    Intent localIntent = new Intent("com.google.android.gms.games.SELECT_PLAYERS");
    localIntent.putExtra("com.google.android.gms.games.MIN_SELECTIONS", paramInt1);
    localIntent.putExtra("com.google.android.gms.games.MAX_SELECTIONS", paramInt2);
    return localIntent;
  }

  public Intent getSettingsIntent()
  {
    n();
    Intent localIntent = new Intent("com.google.android.gms.games.SHOW_SETTINGS");
    localIntent.putExtra("com.google.android.gms.games.GAME_PACKAGE_NAME", this.cy);
    localIntent.addFlags(67108864);
    return localIntent;
  }

  public void h(String paramString, int paramInt)
  {
    try
    {
      ((bm)o()).h(paramString, paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void i(String paramString, int paramInt)
  {
    try
    {
      ((bm)o()).i(paramString, paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void joinRoom(RoomConfig paramRoomConfig)
  {
    try
    {
      ai localai = new ai(paramRoomConfig.getRoomUpdateListener(), paramRoomConfig.getRoomStatusUpdateListener(), paramRoomConfig.getMessageReceivedListener());
      ((bm)o()).a(localai, this.cD, paramRoomConfig.getInvitationId(), paramRoomConfig.isSocketEnabled(), this.cE);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  protected bm k(IBinder paramIBinder)
  {
    return bm.a.m(paramIBinder);
  }

  protected void k()
  {
    super.k();
    if (this.cC)
    {
      this.cB.am();
      this.cC = false;
    }
  }

  protected Bundle l()
  {
    try
    {
      Bundle localBundle = ((bm)o()).l();
      if (localBundle != null)
        localBundle.setClassLoader(bj.class.getClassLoader());
      return localBundle;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
    return null;
  }

  public void leaveRoom(RoomUpdateListener paramRoomUpdateListener, String paramString)
  {
    try
    {
      ((bm)o()).e(new ai(paramRoomUpdateListener), paramString);
      ai();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void loadAchievements(OnAchievementsLoadedListener paramOnAchievementsLoadedListener)
  {
    try
    {
      ((bm)o()).c(new f(paramOnAchievementsLoadedListener));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void loadGame(OnGamesLoadedListener paramOnGamesLoadedListener)
  {
    try
    {
      ((bm)o()).d(new k(paramOnGamesLoadedListener));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void loadInvitations(OnInvitationsLoadedListener paramOnInvitationsLoadedListener)
  {
    try
    {
      ((bm)o()).e(new o(paramOnInvitationsLoadedListener));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void loadLeaderboardMetadata(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener)
  {
    try
    {
      ((bm)o()).b(new t(paramOnLeaderboardMetadataLoadedListener));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void loadLeaderboardMetadata(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener, String paramString)
  {
    try
    {
      ((bm)o()).d(new t(paramOnLeaderboardMetadataLoadedListener), paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void loadMoreScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, LeaderboardScoreBuffer paramLeaderboardScoreBuffer, int paramInt1, int paramInt2)
  {
    try
    {
      ((bm)o()).a(new r(paramOnLeaderboardScoresLoadedListener), paramLeaderboardScoreBuffer.aq().ar(), paramInt1, paramInt2);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void loadPlayer(OnPlayersLoadedListener paramOnPlayersLoadedListener, String paramString)
  {
    try
    {
      ((bm)o()).c(new ad(paramOnPlayersLoadedListener), paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void loadPlayerCenteredScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    try
    {
      ((bm)o()).b(new r(paramOnLeaderboardScoresLoadedListener), paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void loadTopScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    try
    {
      ((bm)o()).a(new r(paramOnLeaderboardScoresLoadedListener), paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void registerInvitationListener(OnInvitationReceivedListener paramOnInvitationReceivedListener)
  {
    try
    {
      m localm = new m(paramOnInvitationReceivedListener);
      ((bm)o()).a(localm, this.cE);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public int sendReliableRealTimeMessage(RealTimeReliableMessageSentListener paramRealTimeReliableMessageSentListener, byte[] paramArrayOfByte, String paramString1, String paramString2)
  {
    try
    {
      int i = ((bm)o()).a(new ag(paramRealTimeReliableMessageSentListener), paramArrayOfByte, paramString1, paramString2);
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
    return -1;
  }

  public int sendUnreliableRealTimeMessageToAll(byte[] paramArrayOfByte, String paramString)
  {
    try
    {
      int i = ((bm)o()).b(paramArrayOfByte, paramString, null);
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
    return -1;
  }

  public void setGravityForPopups(int paramInt)
  {
    this.cB.setGravity(paramInt);
  }

  public void setUseNewPlayerNotificationsFirstParty(boolean paramBoolean)
  {
    try
    {
      ((bm)o()).setUseNewPlayerNotificationsFirstParty(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void setViewForPopups(View paramView)
  {
    this.cB.a(paramView);
  }

  public void signOut(OnSignOutCompleteListener paramOnSignOutCompleteListener)
  {
    Object localObject;
    if (paramOnSignOutCompleteListener == null)
      localObject = null;
    try
    {
      while (true)
      {
        ((bm)o()).a((bl)localObject);
        return;
        am localam = new am(paramOnSignOutCompleteListener);
        localObject = localam;
      }
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  public void unregisterInvitationListener()
  {
    try
    {
      ((bm)o()).b(this.cE);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      bk.b("GamesClient", "service died");
    }
  }

  abstract class a extends bj.c
  {
    private final ArrayList<String> cG = new ArrayList();

    a(RoomStatusUpdateListener paramk, k paramArrayOfString, String[] arg4)
    {
      super(paramk, paramArrayOfString);
      int i = 0;
      Object localObject;
      int j = localObject.length;
      while (i < j)
      {
        this.cG.add(localObject[i]);
        i++;
      }
    }

    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      if (paramRoomStatusUpdateListener != null)
        a(paramRoomStatusUpdateListener, paramRoom, this.cG);
    }

    protected abstract void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList);
  }

  final class aa extends bj.a
  {
    aa(RoomStatusUpdateListener paramk, k paramArrayOfString, String[] arg4)
    {
      super(paramk, paramArrayOfString, arrayOfString);
    }

    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onPeerInvitedToRoom(paramRoom, paramArrayList);
    }
  }

  final class ab extends bj.a
  {
    ab(RoomStatusUpdateListener paramk, k paramArrayOfString, String[] arg4)
    {
      super(paramk, paramArrayOfString, arrayOfString);
    }

    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onPeerJoined(paramRoom, paramArrayList);
    }
  }

  final class ac extends bj.a
  {
    ac(RoomStatusUpdateListener paramk, k paramArrayOfString, String[] arg4)
    {
      super(paramk, paramArrayOfString, arrayOfString);
    }

    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onPeerLeft(paramRoom, paramArrayList);
    }
  }

  final class ad extends bi
  {
    private final OnPlayersLoadedListener cW;

    ad(OnPlayersLoadedListener arg2)
    {
      Object localObject;
      this.cW = ((OnPlayersLoadedListener)x.b(localObject, "Listener must not be null"));
    }

    public void e(k paramk)
    {
      bj.this.a(new bj.ae(bj.this, this.cW, paramk));
    }
  }

  final class ae extends p<bm>.c<OnPlayersLoadedListener>
  {
    ae(OnPlayersLoadedListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    protected void a(OnPlayersLoadedListener paramOnPlayersLoadedListener)
    {
      paramOnPlayersLoadedListener.onPlayersLoaded(this.O.getStatusCode(), new PlayerBuffer(this.O));
    }
  }

  final class af extends p<bm>.b<RealTimeReliableMessageSentListener>
  {
    private final String cX;
    private final int cY;
    private final int p;

    af(RealTimeReliableMessageSentListener paramInt1, int paramInt2, int paramString, String arg5)
    {
      super(paramInt1);
      this.p = paramInt2;
      this.cY = paramString;
      Object localObject;
      this.cX = localObject;
    }

    public void a(RealTimeReliableMessageSentListener paramRealTimeReliableMessageSentListener)
    {
      if (paramRealTimeReliableMessageSentListener != null)
        paramRealTimeReliableMessageSentListener.onRealTimeMessageSent(this.p, this.cY, this.cX);
    }
  }

  final class ag extends bi
  {
    final RealTimeReliableMessageSentListener cZ;

    public ag(RealTimeReliableMessageSentListener arg2)
    {
      Object localObject;
      this.cZ = localObject;
    }

    public void a(int paramInt1, int paramInt2, String paramString)
    {
      bj.this.a(new bj.af(bj.this, this.cZ, paramInt1, paramInt2, paramString));
    }
  }

  final class ah extends bj.c
  {
    ah(RoomStatusUpdateListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onRoomAutoMatching(paramRoom);
    }
  }

  final class ai extends bi
  {
    private final RoomUpdateListener da;
    private final RoomStatusUpdateListener db;
    private final RealTimeMessageReceivedListener dc;

    public ai(RoomUpdateListener arg2)
    {
      Object localObject;
      this.da = ((RoomUpdateListener)x.b(localObject, "Callbacks must not be null"));
      this.db = null;
      this.dc = null;
    }

    public ai(RoomUpdateListener paramRoomStatusUpdateListener, RoomStatusUpdateListener paramRealTimeMessageReceivedListener, RealTimeMessageReceivedListener arg4)
    {
      this.da = ((RoomUpdateListener)x.b(paramRoomStatusUpdateListener, "Callbacks must not be null"));
      this.db = paramRealTimeMessageReceivedListener;
      Object localObject;
      this.dc = localObject;
    }

    public void a(k paramk, String[] paramArrayOfString)
    {
      bj.this.a(new bj.aa(bj.this, this.db, paramk, paramArrayOfString));
    }

    public void b(k paramk, String[] paramArrayOfString)
    {
      bj.this.a(new bj.ab(bj.this, this.db, paramk, paramArrayOfString));
    }

    public void c(k paramk, String[] paramArrayOfString)
    {
      bj.this.a(new bj.ac(bj.this, this.db, paramk, paramArrayOfString));
    }

    public void d(k paramk, String[] paramArrayOfString)
    {
      bj.this.a(new bj.y(bj.this, this.db, paramk, paramArrayOfString));
    }

    public void e(k paramk, String[] paramArrayOfString)
    {
      bj.this.a(new bj.x(bj.this, this.db, paramk, paramArrayOfString));
    }

    public void f(k paramk, String[] paramArrayOfString)
    {
      bj.this.a(new bj.z(bj.this, this.db, paramk, paramArrayOfString));
    }

    public void n(k paramk)
    {
      bj.this.a(new bj.al(bj.this, this.da, paramk));
    }

    public void o(k paramk)
    {
      bj.this.a(new bj.q(bj.this, this.da, paramk));
    }

    public void onLeftRoom(int paramInt, String paramString)
    {
      bj.this.a(new bj.v(bj.this, this.da, paramInt, paramString));
    }

    public void onRealTimeMessageReceived(RealTimeMessage paramRealTimeMessage)
    {
      bk.a("GamesClient", "RoomBinderCallbacks: onRealTimeMessageReceived");
      bj.this.a(new bj.w(bj.this, this.dc, paramRealTimeMessage));
    }

    public void p(k paramk)
    {
      bj.this.a(new bj.ak(bj.this, this.db, paramk));
    }

    public void q(k paramk)
    {
      bj.this.a(new bj.ah(bj.this, this.db, paramk));
    }

    public void r(k paramk)
    {
      bj.this.a(new bj.aj(bj.this, this.da, paramk));
    }

    public void s(k paramk)
    {
      bj.this.a(new bj.h(bj.this, this.db, paramk));
    }

    public void t(k paramk)
    {
      bj.this.a(new bj.i(bj.this, this.db, paramk));
    }
  }

  final class aj extends bj.b
  {
    aj(RoomUpdateListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    public void a(RoomUpdateListener paramRoomUpdateListener, Room paramRoom)
    {
      if (paramRoomUpdateListener != null)
        paramRoomUpdateListener.onRoomConnected(this.O.getStatusCode(), paramRoom);
    }
  }

  final class ak extends bj.c
  {
    ak(RoomStatusUpdateListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onRoomConnecting(paramRoom);
    }
  }

  final class al extends bj.b
  {
    public al(RoomUpdateListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    public void a(RoomUpdateListener paramRoomUpdateListener, Room paramRoom)
    {
      paramRoomUpdateListener.onRoomCreated(this.O.getStatusCode(), paramRoom);
    }
  }

  final class am extends bi
  {
    private final OnSignOutCompleteListener dd;

    public am(OnSignOutCompleteListener arg2)
    {
      Object localObject;
      this.dd = ((OnSignOutCompleteListener)x.b(localObject, "Listener must not be null"));
    }

    public void onSignOutComplete()
    {
      bj.this.a(new bj.an(bj.this, this.dd));
    }
  }

  final class an extends p<bm>.b<OnSignOutCompleteListener>
  {
    public an(OnSignOutCompleteListener arg2)
    {
      super(localObject);
    }

    public void a(OnSignOutCompleteListener paramOnSignOutCompleteListener)
    {
      paramOnSignOutCompleteListener.onSignOutComplete();
    }
  }

  final class ao extends bi
  {
    private final OnScoreSubmittedListener de;

    public ao(OnScoreSubmittedListener arg2)
    {
      Object localObject;
      this.de = ((OnScoreSubmittedListener)x.b(localObject, "Listener must not be null"));
    }

    public void d(k paramk)
    {
      SubmitScoreResult localSubmitScoreResult = new SubmitScoreResult(paramk);
      bj.this.a(new bj.ap(bj.this, this.de, localSubmitScoreResult));
    }
  }

  final class ap extends p<bm>.b<OnScoreSubmittedListener>
  {
    private final SubmitScoreResult df;

    public ap(OnScoreSubmittedListener paramSubmitScoreResult, SubmitScoreResult arg3)
    {
      super(paramSubmitScoreResult);
      Object localObject;
      this.df = localObject;
    }

    public void a(OnScoreSubmittedListener paramOnScoreSubmittedListener)
    {
      paramOnScoreSubmittedListener.onScoreSubmitted(this.df.getStatusCode(), this.df);
    }
  }

  abstract class b extends p<bm>.c<RoomUpdateListener>
  {
    b(RoomUpdateListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    protected void a(RoomUpdateListener paramRoomUpdateListener)
    {
      a(paramRoomUpdateListener, bj.a(bj.this, this.O));
    }

    protected abstract void a(RoomUpdateListener paramRoomUpdateListener, Room paramRoom);
  }

  abstract class c extends p<bm>.c<RoomStatusUpdateListener>
  {
    c(RoomStatusUpdateListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener)
    {
      if (paramRoomStatusUpdateListener != null)
        a(paramRoomStatusUpdateListener, bj.a(bj.this, this.O));
    }

    protected abstract void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom);
  }

  final class d extends bi
  {
    private final OnAchievementUpdatedListener cI;

    d(OnAchievementUpdatedListener arg2)
    {
      Object localObject;
      this.cI = ((OnAchievementUpdatedListener)x.b(localObject, "Listener must not be null"));
    }

    public void onAchievementUpdated(int paramInt, String paramString)
    {
      bj.this.a(new bj.e(bj.this, this.cI, paramInt, paramString));
    }
  }

  final class e extends p<bm>.b<OnAchievementUpdatedListener>
  {
    private final String cJ;
    private final int p;

    e(OnAchievementUpdatedListener paramInt, int paramString, String arg4)
    {
      super(paramInt);
      this.p = paramString;
      Object localObject;
      this.cJ = localObject;
    }

    protected void a(OnAchievementUpdatedListener paramOnAchievementUpdatedListener)
    {
      paramOnAchievementUpdatedListener.onAchievementUpdated(this.p, this.cJ);
    }
  }

  final class f extends bi
  {
    private final OnAchievementsLoadedListener cK;

    f(OnAchievementsLoadedListener arg2)
    {
      Object localObject;
      this.cK = ((OnAchievementsLoadedListener)x.b(localObject, "Listener must not be null"));
    }

    public void b(k paramk)
    {
      bj.this.a(new bj.g(bj.this, this.cK, paramk));
    }
  }

  final class g extends p<bm>.c<OnAchievementsLoadedListener>
  {
    g(OnAchievementsLoadedListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    protected void a(OnAchievementsLoadedListener paramOnAchievementsLoadedListener)
    {
      paramOnAchievementsLoadedListener.onAchievementsLoaded(this.O.getStatusCode(), new AchievementBuffer(this.O));
    }
  }

  final class h extends bj.c
  {
    h(RoomStatusUpdateListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onConnectedToRoom(paramRoom);
    }
  }

  final class i extends bj.c
  {
    i(RoomStatusUpdateListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onDisconnectedFromRoom(paramRoom);
    }
  }

  public final class j extends t.a
  {
    private final p.d cL;

    public j(p.d arg2)
    {
      Object localObject;
      this.cL = localObject;
    }

    public void a(int paramInt, IBinder paramIBinder, Bundle paramBundle)
    {
      this.cL.a(paramInt, paramIBinder, paramBundle);
      if ((paramInt == 0) && (paramBundle != null))
        bj.a(bj.this, paramBundle.getBoolean("show_welcome_popup"));
    }
  }

  final class k extends bi
  {
    private final OnGamesLoadedListener cM;

    k(OnGamesLoadedListener arg2)
    {
      Object localObject;
      this.cM = ((OnGamesLoadedListener)x.b(localObject, "Listener must not be null"));
    }

    public void g(k paramk)
    {
      bj.this.a(new bj.l(bj.this, this.cM, paramk));
    }
  }

  final class l extends p<bm>.c<OnGamesLoadedListener>
  {
    l(OnGamesLoadedListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    protected void a(OnGamesLoadedListener paramOnGamesLoadedListener)
    {
      paramOnGamesLoadedListener.onGamesLoaded(this.O.getStatusCode(), new GameBuffer(this.O));
    }
  }

  final class m extends bi
  {
    private final OnInvitationReceivedListener cN;

    m(OnInvitationReceivedListener arg2)
    {
      Object localObject;
      this.cN = localObject;
    }

    public void k(k paramk)
    {
      InvitationBuffer localInvitationBuffer = new InvitationBuffer(paramk);
      try
      {
        int i = localInvitationBuffer.getCount();
        Invitation localInvitation = null;
        if (i > 0)
          localInvitation = (Invitation)((Invitation)localInvitationBuffer.get(0)).freeze();
        localInvitationBuffer.close();
        if (localInvitation != null)
          bj.this.a(new bj.n(bj.this, this.cN, localInvitation));
        return;
      }
      finally
      {
        localInvitationBuffer.close();
      }
    }
  }

  final class n extends p<bm>.b<OnInvitationReceivedListener>
  {
    private final Invitation cO;

    n(OnInvitationReceivedListener paramInvitation, Invitation arg3)
    {
      super(paramInvitation);
      Object localObject;
      this.cO = localObject;
    }

    protected void a(OnInvitationReceivedListener paramOnInvitationReceivedListener)
    {
      paramOnInvitationReceivedListener.onInvitationReceived(this.cO);
    }
  }

  final class o extends bi
  {
    private final OnInvitationsLoadedListener cP;

    o(OnInvitationsLoadedListener arg2)
    {
      Object localObject;
      this.cP = localObject;
    }

    public void j(k paramk)
    {
      bj.this.a(new bj.p(bj.this, this.cP, paramk));
    }
  }

  final class p extends p<bm>.c<OnInvitationsLoadedListener>
  {
    p(OnInvitationsLoadedListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    protected void a(OnInvitationsLoadedListener paramOnInvitationsLoadedListener)
    {
      paramOnInvitationsLoadedListener.onInvitationsLoaded(this.O.getStatusCode(), new InvitationBuffer(this.O));
    }
  }

  final class q extends bj.b
  {
    public q(RoomUpdateListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    public void a(RoomUpdateListener paramRoomUpdateListener, Room paramRoom)
    {
      paramRoomUpdateListener.onJoinedRoom(this.O.getStatusCode(), paramRoom);
    }
  }

  final class r extends bi
  {
    private final OnLeaderboardScoresLoadedListener cQ;

    r(OnLeaderboardScoresLoadedListener arg2)
    {
      Object localObject;
      this.cQ = ((OnLeaderboardScoresLoadedListener)x.b(localObject, "Listener must not be null"));
    }

    public void a(k paramk1, k paramk2)
    {
      bj.this.a(new bj.s(bj.this, this.cQ, paramk1, paramk2));
    }
  }

  final class s extends p<bm>.b<OnLeaderboardScoresLoadedListener>
  {
    private final k cR;
    private final k cS;

    s(OnLeaderboardScoresLoadedListener paramk1, k paramk2, k arg4)
    {
      super(paramk1);
      this.cR = paramk2;
      Object localObject;
      this.cS = localObject;
    }

    protected void a(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener)
    {
      LeaderboardBuffer localLeaderboardBuffer = new LeaderboardBuffer(this.cR);
      LeaderboardScoreBuffer localLeaderboardScoreBuffer = new LeaderboardScoreBuffer(this.cS);
      paramOnLeaderboardScoresLoadedListener.onLeaderboardScoresLoaded(this.cS.getStatusCode(), localLeaderboardBuffer, localLeaderboardScoreBuffer);
    }
  }

  final class t extends bi
  {
    private final OnLeaderboardMetadataLoadedListener cT;

    t(OnLeaderboardMetadataLoadedListener arg2)
    {
      Object localObject;
      this.cT = ((OnLeaderboardMetadataLoadedListener)x.b(localObject, "Listener must not be null"));
    }

    public void c(k paramk)
    {
      bj.this.a(new bj.u(bj.this, this.cT, paramk));
    }
  }

  final class u extends p<bm>.c<OnLeaderboardMetadataLoadedListener>
  {
    u(OnLeaderboardMetadataLoadedListener paramk, k arg3)
    {
      super(paramk, localk);
    }

    protected void a(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener)
    {
      paramOnLeaderboardMetadataLoadedListener.onLeaderboardMetadataLoaded(this.O.getStatusCode(), new LeaderboardBuffer(this.O));
    }
  }

  final class v extends p<bm>.b<RoomUpdateListener>
  {
    private final String cU;
    private final int p;

    v(RoomUpdateListener paramInt, int paramString, String arg4)
    {
      super(paramInt);
      this.p = paramString;
      Object localObject;
      this.cU = localObject;
    }

    public void a(RoomUpdateListener paramRoomUpdateListener)
    {
      paramRoomUpdateListener.onLeftRoom(this.p, this.cU);
    }
  }

  final class w extends p<bm>.b<RealTimeMessageReceivedListener>
  {
    private final RealTimeMessage cV;

    w(RealTimeMessageReceivedListener paramRealTimeMessage, RealTimeMessage arg3)
    {
      super(paramRealTimeMessage);
      Object localObject;
      this.cV = localObject;
    }

    public void a(RealTimeMessageReceivedListener paramRealTimeMessageReceivedListener)
    {
      bk.a("GamesClient", "Deliver Message received callback");
      if (paramRealTimeMessageReceivedListener != null)
        paramRealTimeMessageReceivedListener.onRealTimeMessageReceived(this.cV);
    }
  }

  final class x extends bj.a
  {
    x(RoomStatusUpdateListener paramk, k paramArrayOfString, String[] arg4)
    {
      super(paramk, paramArrayOfString, arrayOfString);
    }

    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onPeersConnected(paramRoom, paramArrayList);
    }
  }

  final class y extends bj.a
  {
    y(RoomStatusUpdateListener paramk, k paramArrayOfString, String[] arg4)
    {
      super(paramk, paramArrayOfString, arrayOfString);
    }

    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onPeerDeclined(paramRoom, paramArrayList);
    }
  }

  final class z extends bj.a
  {
    z(RoomStatusUpdateListener paramk, k paramArrayOfString, String[] arg4)
    {
      super(paramk, paramArrayOfString, arrayOfString);
    }

    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      if (paramRoomStatusUpdateListener != null)
        paramRoomStatusUpdateListener.onPeersDisconnected(paramRoom, paramArrayList);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bj
 * JD-Core Version:    0.6.2
 */