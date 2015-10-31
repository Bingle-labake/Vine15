package co.vine.android.util;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.ContactsContract.Profile;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.telephony.TelephonyManager;
import android.text.TextUtils;

public class ContactsHelper
  implements LoaderManager.LoaderCallbacks<Cursor>
{
  private static final String GOOGLE_ACCOUNT = "com.google";
  private static final int LOADER_ID_CONTACTS_DATA = 2;
  private static final int LOADER_ID_CONTACTS_PROFILE = 1;
  private Fragment mFragment;
  private ContactHelperListener mListener;

  public ContactsHelper(Fragment paramFragment, ContactHelperListener paramContactHelperListener)
  {
    if (!BuildUtil.isExplore())
    {
      this.mFragment = paramFragment;
      this.mListener = paramContactHelperListener;
      LoaderManager localLoaderManager = paramFragment.getLoaderManager();
      localLoaderManager.initLoader(1, null, this);
      localLoaderManager.initLoader(2, null, this);
      Account[] arrayOfAccount = AccountManager.get(paramFragment.getActivity()).getAccountsByType("com.google");
      if ((arrayOfAccount != null) && (arrayOfAccount.length > 0))
        this.mListener.onEmailLoaded(arrayOfAccount[0].name);
    }
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    switch (paramInt)
    {
    default:
      return null;
    case 1:
      return new ContactCursorLoader(this.mFragment.getActivity(), ContactsContract.Profile.CONTENT_URI, new String[] { "display_name" }, null, null, null);
    case 2:
    }
    return new ContactCursorLoader(this.mFragment.getActivity(), Uri.withAppendedPath(ContactsContract.Profile.CONTENT_URI, "data"), ProfileQuery.PROJECTION, "mimetype=?", new String[] { "vnd.android.cursor.item/phone_v2" }, null);
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    switch (paramLoader.getId())
    {
    default:
    case 1:
      do
        return;
      while ((paramCursor == null) || (!paramCursor.moveToFirst()));
      String str2 = paramCursor.getString(paramCursor.getColumnIndex("display_name"));
      this.mListener.onNameLoaded(str2);
      return;
    case 2:
    }
    String str1 = null;
    if (paramCursor != null)
    {
      boolean bool1 = paramCursor.moveToFirst();
      str1 = null;
      if (bool1)
      {
        boolean bool2 = "vnd.android.cursor.item/phone_v2".equals(paramCursor.getString(2));
        str1 = null;
        if (bool2)
          str1 = paramCursor.getString(1);
      }
    }
    if (TextUtils.isEmpty(str1))
      str1 = ((TelephonyManager)this.mFragment.getActivity().getSystemService("phone")).getLine1Number();
    this.mListener.onPhoneNumberLoaded(str1);
  }

  public void onLoaderReset(Loader<Cursor> paramLoader)
  {
  }

  private static class ContactCursorLoader extends CursorLoader
  {
    public ContactCursorLoader(Context paramContext, Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
    {
      super(paramUri, paramArrayOfString1, paramString1, paramArrayOfString2, paramString2);
    }

    public Cursor loadInBackground()
    {
      try
      {
        Cursor localCursor = super.loadInBackground();
        return localCursor;
      }
      catch (Throwable localThrowable)
      {
        CrashUtil.logException(localThrowable);
      }
      return null;
    }
  }

  public static abstract interface ContactHelperListener
  {
    public abstract void onEmailLoaded(String paramString);

    public abstract void onNameLoaded(String paramString);

    public abstract void onPhoneNumberLoaded(String paramString);
  }

  private static abstract interface ProfileQuery
  {
    public static final int INDEX_MIME_TYPE = 2;
    public static final int INDEX_PHONE_NUMBER = 1;
    public static final String[] PROJECTION = { "_id", "data1", "mimetype" };
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.ContactsHelper
 * JD-Core Version:    0.6.2
 */