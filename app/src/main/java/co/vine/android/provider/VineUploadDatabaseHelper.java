package co.vine.android.provider;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import co.vine.android.client.AppController;
import co.vine.android.client.Session;
import co.vine.android.util.CrashUtil;
import com.edisonwang.android.slog.SLog;
import java.util.HashMap;

public class VineUploadDatabaseHelper extends SQLiteOpenHelper
{
  public static final int DATABASE_VERSION = 3;
  private static final String DB_NAME = "upload";
  public static final int SCHEMA_VERSION = 1;
  private static final String SEPARATOR = "-";
  private static final HashMap<String, VineUploadDatabaseHelper> sHelperMap = new HashMap();
  private final Context mAppContext;

  private VineUploadDatabaseHelper(Context paramContext, String paramString)
  {
    super(paramContext, paramString, null, 3);
    this.mAppContext = paramContext.getApplicationContext();
  }

  public static VineUploadDatabaseHelper getDatabaseHelper(Context paramContext)
  {
    try
    {
      String str = getDatabaseName(1);
      VineUploadDatabaseHelper localVineUploadDatabaseHelper = (VineUploadDatabaseHelper)sHelperMap.get(str);
      if (localVineUploadDatabaseHelper == null)
      {
        localVineUploadDatabaseHelper = new VineUploadDatabaseHelper(paramContext.getApplicationContext(), str);
        sHelperMap.put(str, localVineUploadDatabaseHelper);
      }
      return localVineUploadDatabaseHelper;
    }
    finally
    {
    }
  }

  public static String getDatabaseName(int paramInt)
  {
    return "upload-" + paramInt;
  }

  protected void createTables(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("CREATE TABLE  IF NOT EXISTS uploads (_id INTEGER PRIMARY KEY,path TEXT,hash TEXT,status INT,post_info TEXT,video_url TEXT,thumbnail_path TEXT,thumbnail_url TEXT,upload_time TEXT,reference TEXT,owner_id INT,captcha_url TEXT);");
  }

  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    createTables(paramSQLiteDatabase);
  }

  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    int i = paramInt1;
    if (i == 1);
    try
    {
      paramSQLiteDatabase.execSQL("ALTER TABLE uploads ADD COLUMN reference TEXT;");
      paramSQLiteDatabase.execSQL("ALTER TABLE uploads ADD COLUMN owner_id INT");
      paramSQLiteDatabase.execSQL("UPDATE uploads SET status=2 WHERE (status=0 OR status=1);");
      long l = AppController.getInstance(this.mAppContext).getActiveSessionReadOnly().getUserId();
      paramSQLiteDatabase.execSQL("UPDATE uploads SET owner_id=" + l + ";");
      SLog.i("Upgraded uploads database to version={}", Integer.valueOf(3));
      i = 2;
      if (i != 2);
    }
    catch (SQLiteException localSQLiteException2)
    {
      try
      {
        paramSQLiteDatabase.execSQL("ALTER TABLE uploads ADD COLUMN captcha_url TEXT");
        return;
        localSQLiteException2 = localSQLiteException2;
        CrashUtil.logException(localSQLiteException2);
        paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS uploads;");
        paramSQLiteDatabase.execSQL("CREATE TABLE  IF NOT EXISTS uploads (_id INTEGER PRIMARY KEY,path TEXT,hash TEXT,status INT,post_info TEXT,video_url TEXT,thumbnail_path TEXT,thumbnail_url TEXT,upload_time TEXT,reference TEXT,owner_id INT,captcha_url TEXT);");
      }
      catch (SQLiteException localSQLiteException1)
      {
        while (true)
        {
          CrashUtil.logException(localSQLiteException1);
          paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS uploads;");
          paramSQLiteDatabase.execSQL("CREATE TABLE  IF NOT EXISTS uploads (_id INTEGER PRIMARY KEY,path TEXT,hash TEXT,status INT,post_info TEXT,video_url TEXT,thumbnail_path TEXT,thumbnail_url TEXT,upload_time TEXT,reference TEXT,owner_id INT,captcha_url TEXT);");
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.VineUploadDatabaseHelper
 * JD-Core Version:    0.6.2
 */