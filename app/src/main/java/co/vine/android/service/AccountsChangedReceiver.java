package co.vine.android.service;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import co.vine.android.client.AppController;
import co.vine.android.client.VineAccountHelper;

public class AccountsChangedReceiver extends BroadcastReceiver
{
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    Account[] arrayOfAccount = AccountManager.get(paramContext).getAccountsByType(VineAccountHelper.ACCOUNT_TYPE);
    AppController localAppController = AppController.getInstance(paramContext);
    if (arrayOfAccount.length > 0)
      return;
    localAppController.logout(localAppController.getActiveSession());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.AccountsChangedReceiver
 * JD-Core Version:    0.6.2
 */