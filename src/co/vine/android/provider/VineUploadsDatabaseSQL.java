package co.vine.android.provider;

public class VineUploadsDatabaseSQL
{
  public static final String ADD_COLUMN = " ADD COLUMN ";
  public static final String ALTER_TABLE = "ALTER TABLE ";
  public static final String CREATE_TABLE = "CREATE TABLE ";
  public static final String UPLOADS_ADD_CAPTCHA_URL_COLUMN = "ALTER TABLE uploads ADD COLUMN captcha_url TEXT";
  public static final String UPLOADS_ADD_OWNER_ID_COLUMN = "ALTER TABLE uploads ADD COLUMN owner_id INT";
  public static final String UPLOADS_ADD_REFERENCE_COLUMN = "ALTER TABLE uploads ADD COLUMN reference TEXT;";
  public static final String UPLOADS_TABLE_SQL = "CREATE TABLE  IF NOT EXISTS uploads (_id INTEGER PRIMARY KEY,path TEXT,hash TEXT,status INT,post_info TEXT,video_url TEXT,thumbnail_path TEXT,thumbnail_url TEXT,upload_time TEXT,reference TEXT,owner_id INT,captcha_url TEXT);";

  public static final class UploadsQuery
  {
    public static final int INDEX_CAPTCHA_URL = 11;
    public static final int INDEX_HASH = 2;
    public static final int INDEX_ID = 0;
    public static final int INDEX_OWNER_ID = 10;
    public static final int INDEX_PATH = 1;
    public static final int INDEX_POST_INFO = 4;
    public static final int INDEX_REFERENCE = 9;
    public static final int INDEX_STATUS = 3;
    public static final int INDEX_THUMBNAIL_PATH = 6;
    public static final int INDEX_THUMBNAIL_URL = 7;
    public static final int INDEX_UPLOAD_TIME = 8;
    public static final int INDEX_VIDEO_URL = 5;
    public static final String[] PROJECTION = { "_id", "path", "hash", "status", "post_info", "video_url", "thumbnail_path", "thumbnail_url", "upload_time", "reference", "owner_id", "captcha_url" };
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.VineUploadsDatabaseSQL
 * JD-Core Version:    0.6.2
 */