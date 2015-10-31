package co.vine.android;

import android.accounts.AbstractAccountAuthenticator;
import android.accounts.Account;
import android.accounts.AccountAuthenticatorResponse;
import android.accounts.AccountManager;
import android.accounts.NetworkErrorException;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import co.vine.android.client.VineAccountHelper;

public class VineAccountAuthenticator extends AbstractAccountAuthenticator
{
  private final Context mContext;

  public VineAccountAuthenticator(Context paramContext)
  {
    super(paramContext);
    this.mContext = paramContext;
  }

  public Bundle addAccount(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, String paramString1, String paramString2, String[] paramArrayOfString, Bundle paramBundle)
    throws NetworkErrorException
  {
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("intent", new Intent(this.mContext, LoginActivity.class).putExtra("accountAuthenticatorResponse", paramAccountAuthenticatorResponse));
    return localBundle;
  }

  public Bundle confirmCredentials(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, Account paramAccount, Bundle paramBundle)
    throws NetworkErrorException
  {
    Intent localIntent = new Intent(this.mContext, AuthenticatorActivity.class);
    localIntent.putExtra("username", paramAccount.name);
    localIntent.putExtra("confirm_credentials", true);
    localIntent.putExtra("accountAuthenticatorResponse", paramAccountAuthenticatorResponse);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("intent", localIntent);
    return localBundle;
  }

  public Bundle editProperties(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, String paramString)
  {
    throw new UnsupportedOperationException();
  }

  public Bundle getAuthToken(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, Account paramAccount, String paramString, Bundle paramBundle)
    throws NetworkErrorException
  {
    if (!paramString.equals("co.vine.android.basic_auth.token.secret"))
    {
      Bundle localBundle1 = new Bundle();
      localBundle1.putString("errorMessage", "invalid authTokenType");
      return localBundle1;
    }
    String str = AccountManager.get(this.mContext).peekAuthToken(paramAccount, paramString);
    if (str != null)
    {
      Bundle localBundle2 = new Bundle();
      localBundle2.putString("authAccount", paramAccount.name);
      localBundle2.putString("accountType", VineAccountHelper.ACCOUNT_TYPE);
      localBundle2.putString("authtoken", str);
      return localBundle2;
    }
    Intent localIntent = new Intent(this.mContext, AuthenticatorActivity.class);
    localIntent.putExtra("accountAuthenticatorResponse", paramAccountAuthenticatorResponse);
    localIntent.putExtra("username", paramAccount.name);
    localIntent.putExtra("auth_token_type", paramString);
    Bundle localBundle3 = new Bundle();
    localBundle3.putParcelable("intent", localIntent);
    return localBundle3;
  }

  public String getAuthTokenLabel(String paramString)
  {
    return this.mContext.getString(2131624007);
  }

  public Bundle hasFeatures(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, Account paramAccount, String[] paramArrayOfString)
    throws NetworkErrorException
  {
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("booleanResult", false);
    return localBundle;
  }

  public Bundle updateCredentials(AccountAuthenticatorResponse paramAccountAuthenticatorResponse, Account paramAccount, String paramString, Bundle paramBundle)
  {
    Intent localIntent = new Intent(this.mContext, AuthenticatorActivity.class);
    localIntent.putExtra("username", paramAccount.name);
    localIntent.putExtra("auth_token_type", paramString);
    localIntent.putExtra("confirm_credentials", false);
    localIntent.putExtra("accountAuthenticatorResponse", paramAccountAuthenticatorResponse);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("intent", localIntent);
    return localBundle;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.VineAccountAuthenticator
 * JD-Core Version:    0.6.2
 */