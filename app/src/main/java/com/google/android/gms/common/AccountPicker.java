package com.google.android.gms.common;

import android.accounts.Account;
import android.content.Intent;
import android.os.Bundle;
import java.util.ArrayList;

public final class AccountPicker
{
  public static Intent a(Account paramAccount, ArrayList<Account> paramArrayList, String[] paramArrayOfString1, boolean paramBoolean1, String paramString1, String paramString2, String[] paramArrayOfString2, Bundle paramBundle, boolean paramBoolean2)
  {
    Intent localIntent = new Intent();
    localIntent.setAction("com.google.android.gms.common.account.CHOOSE_ACCOUNT");
    localIntent.putExtra("allowableAccounts", paramArrayList);
    localIntent.putExtra("allowableAccountTypes", paramArrayOfString1);
    localIntent.putExtra("addAccountOptions", paramBundle);
    localIntent.putExtra("selectedAccount", paramAccount);
    localIntent.putExtra("alwaysPromptForAccount", paramBoolean1);
    localIntent.putExtra("descriptionTextOverride", paramString1);
    localIntent.putExtra("authTokenType", paramString2);
    localIntent.putExtra("addAccountRequiredFeatures", paramArrayOfString2);
    localIntent.putExtra("setGmsCoreAccount", paramBoolean2);
    return localIntent;
  }

  public static Intent newChooseAccountIntent(Account paramAccount, ArrayList<Account> paramArrayList, String[] paramArrayOfString1, boolean paramBoolean, String paramString1, String paramString2, String[] paramArrayOfString2, Bundle paramBundle)
  {
    return a(paramAccount, paramArrayList, paramArrayOfString1, paramBoolean, paramString1, paramString2, paramArrayOfString2, paramBundle, false);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.common.AccountPicker
 * JD-Core Version:    0.6.2
 */