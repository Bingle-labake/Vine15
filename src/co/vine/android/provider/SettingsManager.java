package co.vine.android.provider;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import co.vine.android.util.Util;

public class SettingsManager
{
  private static final String CURRENT_ACCOUNT_KEY = "current_account";
  private static final String CURRENT_ACCOUNT_NAME = "current_name";
  private static final String CURRENT_USER_ID_KEY = "current_user_id";
  private static final String[] VALUE_PROJECTION = { "value" };

  public static String getCurrentAccount(Context paramContext)
  {
    return getValue(paramContext, "current_account", null);
  }

  public static String getCurrentAccountName(Context paramContext)
  {
    return getValue(paramContext, "current_name", null);
  }

  public static long getCurrentUserId(Context paramContext)
  {
    return getValue(paramContext, "current_user_id", 0L);
  }

  public static String getEdition(Context paramContext)
  {
    return Util.getDefaultSharedPrefs(paramContext).getString("settings_edition", null);
  }

  private static long getValue(Context paramContext, String paramString, long paramLong)
  {
    try
    {
      Cursor localCursor = paramContext.getContentResolver().query(Vine.Settings.CONTENT_URI, VALUE_PROJECTION, "name=?", new String[] { paramString }, null);
      long l = paramLong;
      if (localCursor != null)
      {
        if (localCursor.moveToFirst())
          l = localCursor.getLong(0);
        localCursor.close();
      }
      return l;
    }
    finally
    {
    }
  }

  private static String getValue(Context paramContext, String paramString1, String paramString2)
  {
    try
    {
      Cursor localCursor = paramContext.getContentResolver().query(Vine.Settings.CONTENT_URI, VALUE_PROJECTION, "name=?", new String[] { paramString1 }, null);
      String str = paramString2;
      if (localCursor != null)
      {
        if (localCursor.moveToFirst())
          str = localCursor.getString(0);
        localCursor.close();
      }
      return str;
    }
    finally
    {
    }
  }

  public static void setCurrentAccount(Context paramContext, String paramString1, String paramString2, long paramLong)
  {
    setValue(paramContext, "current_account", paramString1);
    setValue(paramContext, "current_user_id", paramLong);
    setValue(paramContext, "current_name", paramString2);
  }

  private static void setValue(Context paramContext, String paramString, long paramLong)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("value", Long.valueOf(paramLong));
    VineDatabaseHelper.getDatabaseHelper(paramContext).saveUserValue(paramString, localContentValues);
  }

  private static void setValue(Context paramContext, String paramString1, String paramString2)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("value", paramString2);
    VineDatabaseHelper.getDatabaseHelper(paramContext).saveUserValue(paramString1, localContentValues);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.SettingsManager
 * JD-Core Version:    0.6.2
 */