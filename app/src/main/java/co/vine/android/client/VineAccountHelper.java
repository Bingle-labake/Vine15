package co.vine.android.client;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.content.Context;
import co.vine.android.api.VineLogin;
import co.vine.android.provider.SettingsManager;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.SystemUtil;
import co.vine.android.util.SystemUtil.PrefBooleanState;

public class VineAccountHelper
{
  public static final String ACCOUNT_TYPE = BuildUtil.getAuthority(".auth");
  public static final String KEY_ADD_WIDGET = "account_add_widget";
  public static final String KEY_LOGIN_TYPE = "account_login_type";
  public static final String KEY_NORMAL_VIDEO_PLAYABLE = "account_normal_video_playable";
  public static final String KEY_SETTINGS = "account_settings";
  public static final String KEY_TWITTER_SECRET = "account_t_secret";
  public static final String KEY_TWITTER_TOKEN = "account_t_token";
  public static final String KEY_TWITTER_USERNAME = "account_t_username";
  public static final String KEY_TWITTER_USER_ID = "account_t_id";
  public static final String KEY_USER_AVATAR = "account_user_avatar";
  public static final String KEY_USER_DATA = "account_user_data";
  public static final String KEY_USER_ID = "account_user_info";
  public static final String KEY_USER_NAME = "account_user_name";
  public static final int LOGIN_TYPE_EMAIL = 1;
  public static final int LOGIN_TYPE_TWITTER = 2;
  public static final String SESSION_TOKEN_KEY = "co.vine.android.basic_auth.token.secret";
  private static Session mActiveSession;

  public static Account createAccount(Context paramContext, String paramString1, VineLogin paramVineLogin, String paramString2, String paramString3, String paramString4)
  {
    AccountManager localAccountManager = AccountManager.get(paramContext);
    Account localAccount = getAccount(paramContext, paramString1);
    if (localAccount == null)
    {
      localAccount = new Account(paramString1, ACCOUNT_TYPE);
      if (!localAccountManager.addAccountExplicitly(localAccount, null, null))
        return null;
    }
    switch (paramVineLogin.loginType)
    {
    default:
    case 1:
    case 2:
    }
    while (true)
    {
      localAccountManager.setUserData(localAccount, "account_user_name", paramString4);
      localAccountManager.setUserData(localAccount, "account_user_avatar", paramString3);
      localAccountManager.setUserData(localAccount, "account_user_info", String.valueOf(paramVineLogin.userId));
      localAccountManager.setAuthToken(localAccount, "co.vine.android.basic_auth.token.secret", paramVineLogin.key);
      return localAccount;
      localAccountManager.setPassword(localAccount, paramString2);
      localAccountManager.setUserData(localAccount, "account_login_type", String.valueOf(1));
      continue;
      localAccountManager.setUserData(localAccount, "account_t_token", paramVineLogin.twitterToken);
      localAccountManager.setUserData(localAccount, "account_t_secret", paramVineLogin.twitterSecret);
      localAccountManager.setUserData(localAccount, "account_t_id", String.valueOf(paramVineLogin.twitterUserId));
      localAccountManager.setUserData(localAccount, "account_t_username", paramVineLogin.twitterUsername);
      localAccountManager.setUserData(localAccount, "account_login_type", String.valueOf(2));
    }
  }

  private static Session createSession()
  {
    return new Session(null, 0L, null, null, null);
  }

  public static Session createSession(Context paramContext, Account paramAccount)
  {
    AccountManager localAccountManager = AccountManager.get(paramContext);
    long l = getUserId(localAccountManager, paramAccount);
    String str = SettingsManager.getEdition(paramContext);
    return new Session(getSessionKey(localAccountManager, paramAccount), l, getName(localAccountManager, paramAccount), getAvatarUrl(localAccountManager, paramAccount), str);
  }

  public static Account getAccount(Context paramContext, String paramString)
  {
    for (Account localAccount : AccountManager.get(paramContext).getAccountsByType(ACCOUNT_TYPE))
      if (localAccount.name.equals(paramString))
        return localAccount;
    return null;
  }

  public static int getAccountsCount(Context paramContext)
  {
    return AccountManager.get(paramContext).getAccountsByType(ACCOUNT_TYPE).length;
  }

  public static Account getActiveAccount(Context paramContext)
  {
    return getAccount(paramContext, AppController.getInstance(paramContext).getActiveSession().getLoginEmail());
  }

  public static Session getActiveSession(Context paramContext, boolean paramBoolean)
  {
    if (mActiveSession == null)
    {
      Account[] arrayOfAccount = AccountManager.get(paramContext).getAccountsByType(ACCOUNT_TYPE);
      if (arrayOfAccount.length > 0)
      {
        String str = SettingsManager.getCurrentAccount(paramContext);
        int i = arrayOfAccount.length;
        for (int j = 0; j < i; j++)
        {
          Account localAccount = arrayOfAccount[j];
          if ((str == null) || (localAccount.name.equals(str)))
          {
            Session localSession2 = getSession(paramContext, localAccount.name);
            localSession2.setLoginEmail(localAccount.name);
            localSession2.setLoginStatus(Session.LoginStatus.LOGGED_IN);
            if (!paramBoolean)
              setActiveSession(paramContext, localSession2);
            mActiveSession = localSession2;
            return localSession2;
          }
        }
      }
      Session localSession1 = createSession();
      if (!paramBoolean)
        setActiveSession(paramContext, localSession1);
      mActiveSession = localSession1;
    }
    return mActiveSession;
  }

  public static String getAvatarUrl(AccountManager paramAccountManager, Account paramAccount)
  {
    return paramAccountManager.getUserData(paramAccount, "account_user_avatar");
  }

  public static Session getCachedActiveSession()
  {
    return mActiveSession;
  }

  public static int getLoginType(AccountManager paramAccountManager, Account paramAccount)
  {
    return Integer.parseInt(paramAccountManager.getUserData(paramAccount, "account_login_type"));
  }

  public static String getName(AccountManager paramAccountManager, Account paramAccount)
  {
    return paramAccountManager.getUserData(paramAccount, "account_user_name");
  }

  public static String getPassword(AccountManager paramAccountManager, Account paramAccount)
  {
    return paramAccountManager.getPassword(paramAccount);
  }

  public static Session getSession(Context paramContext, String paramString)
  {
    if (paramString == null)
      return createSession();
    Account localAccount;
    if (mActiveSession == null)
    {
      localAccount = getAccount(paramContext, paramString);
      if (localAccount != null)
        break label34;
    }
    label34: for (mActiveSession = createSession(); ; mActiveSession = createSession(paramContext, localAccount))
      return mActiveSession;
  }

  public static String getSessionKey(AccountManager paramAccountManager, Account paramAccount)
  {
    return paramAccountManager.peekAuthToken(paramAccount, "co.vine.android.basic_auth.token.secret");
  }

  public static String getTwitterSecret(AccountManager paramAccountManager, Account paramAccount)
  {
    return paramAccountManager.getUserData(paramAccount, "account_t_secret");
  }

  public static String getTwitterToken(AccountManager paramAccountManager, Account paramAccount)
  {
    return paramAccountManager.getUserData(paramAccount, "account_t_token");
  }

  public static String getTwitterUsername(AccountManager paramAccountManager, Account paramAccount)
  {
    return paramAccountManager.getUserData(paramAccount, "account_t_username");
  }

  public static long getUserId(AccountManager paramAccountManager, Account paramAccount)
  {
    String str = paramAccountManager.getUserData(paramAccount, "account_user_info");
    if (str != null)
      return Long.parseLong(str);
    return 0L;
  }

  public static boolean isLoggedIn(Context paramContext, boolean paramBoolean)
  {
    return getActiveSession(paramContext, paramBoolean).isLoggedIn();
  }

  public static SystemUtil.PrefBooleanState isNormalVideoPlayable(Context paramContext)
  {
    AccountManager localAccountManager = AccountManager.get(paramContext);
    if (localAccountManager == null)
      return SystemUtil.PrefBooleanState.UNKNOWN;
    Account localAccount = getActiveAccount(paramContext);
    String str = null;
    if (localAccount != null)
      str = localAccountManager.getUserData(localAccount, "account_normal_video_playable");
    if (str != null)
      return SystemUtil.PrefBooleanState.valueOf(str);
    return SystemUtil.PrefBooleanState.UNKNOWN;
  }

  public static boolean needsAddwidget(AccountManager paramAccountManager, Account paramAccount)
  {
    return paramAccountManager.getUserData(paramAccount, "account_add_widget") == null;
  }

  public static AccountManagerFuture<Boolean> removeAccount(Context paramContext, String paramString)
  {
    AccountManager localAccountManager = AccountManager.get(paramContext);
    Account[] arrayOfAccount = localAccountManager.getAccountsByType(ACCOUNT_TYPE);
    int i = arrayOfAccount.length;
    for (int j = 0; ; j++)
    {
      AccountManagerFuture localAccountManagerFuture = null;
      if (j < i)
      {
        Account localAccount = arrayOfAccount[j];
        if (localAccount.name.equals(paramString))
          localAccountManagerFuture = localAccountManager.removeAccount(localAccount, null, null);
      }
      else
      {
        return localAccountManagerFuture;
      }
    }
  }

  public static void removeTwitterInfo(Context paramContext, String paramString)
  {
    Account localAccount = getAccount(paramContext, paramString);
    if (localAccount != null)
    {
      AccountManager localAccountManager = AccountManager.get(paramContext);
      localAccountManager.setUserData(localAccount, "account_t_token", null);
      localAccountManager.setUserData(localAccount, "account_t_secret", null);
      localAccountManager.setUserData(localAccount, "account_t_id", null);
      localAccountManager.setUserData(localAccount, "account_t_username", null);
      localAccountManager.setUserData(localAccount, "account_login_type", String.valueOf(1));
    }
  }

  public static void resetActiveSession()
  {
    mActiveSession = null;
  }

  public static void saveTwitterInfo(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, long paramLong)
  {
    Account localAccount = getAccount(paramContext, paramString1);
    if (localAccount != null)
    {
      AccountManager localAccountManager = AccountManager.get(paramContext);
      localAccountManager.setUserData(localAccount, "account_t_token", paramString3);
      localAccountManager.setUserData(localAccount, "account_t_secret", paramString4);
      localAccountManager.setUserData(localAccount, "account_t_id", String.valueOf(paramLong));
      localAccountManager.setUserData(localAccount, "account_t_username", paramString2);
      localAccountManager.setUserData(localAccount, "account_login_type", String.valueOf(2));
    }
  }

  public static void saveUserId(Context paramContext, String paramString, long paramLong)
  {
    Account localAccount = getAccount(paramContext, paramString);
    if (localAccount != null)
    {
      AccountManager localAccountManager = AccountManager.get(paramContext);
      if (paramLong > 0L)
        localAccountManager.setUserData(localAccount, "account_user_info", String.valueOf(paramLong));
    }
  }

  public static void setActiveSession(Context paramContext, Session paramSession)
  {
    SettingsManager.setCurrentAccount(paramContext, paramSession.getLoginEmail(), paramSession.getName(), paramSession.getUserId());
  }

  public static void setAddWidget(AccountManager paramAccountManager, Account paramAccount)
  {
    paramAccountManager.setUserData(paramAccount, "account_add_widget", "YES");
  }

  public static void setSessionKey(AccountManager paramAccountManager, Account paramAccount, String paramString)
  {
    paramAccountManager.setAuthToken(paramAccount, "co.vine.android.basic_auth.token.secret", paramString);
  }

  public static void syncNormalVideoPlayable(Context paramContext)
  {
    SystemUtil.PrefBooleanState localPrefBooleanState1 = isNormalVideoPlayable(paramContext);
    SystemUtil.PrefBooleanState localPrefBooleanState2 = SystemUtil.isNormalVideoPlayable(paramContext);
    if (localPrefBooleanState1 != localPrefBooleanState2)
    {
      if (localPrefBooleanState2 == SystemUtil.PrefBooleanState.UNKNOWN)
        break label58;
      AccountManager localAccountManager = AccountManager.get(paramContext);
      Account localAccount = getActiveAccount(paramContext);
      if ((localAccountManager != null) && (localAccount != null))
        localAccountManager.setUserData(localAccount, "account_normal_video_playable", localPrefBooleanState2.name());
    }
    return;
    label58: if (localPrefBooleanState1 == SystemUtil.PrefBooleanState.TRUE);
    for (boolean bool = true; ; bool = false)
    {
      SystemUtil.setNormalVideoPlayable(paramContext, bool);
      return;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.client.VineAccountHelper
 * JD-Core Version:    0.6.2
 */