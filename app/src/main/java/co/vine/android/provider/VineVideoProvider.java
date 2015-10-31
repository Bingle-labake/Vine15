package co.vine.android.provider;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import co.vine.android.util.PlayerUtil;
import java.io.File;
import java.io.FileNotFoundException;

public class VineVideoProvider extends ContentProvider
{
  public static final String AUTHORITY = PlayerUtil.getAuthority(".provider.VineVideoProvider");
  public static final String CONTENT_AUTHORITY = "content://" + AUTHORITY + "/";
  private static final String VIDEO_MIME_TYPE = "video/mp4";

  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    throw new UnsupportedOperationException();
  }

  public String getType(Uri paramUri)
  {
    return "video/mp4";
  }

  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    throw new UnsupportedOperationException();
  }

  public boolean onCreate()
  {
    return true;
  }

  public ParcelFileDescriptor openFile(Uri paramUri, String paramString)
    throws FileNotFoundException
  {
    File localFile = new File(paramUri.getPath());
    if (localFile.exists())
      return ParcelFileDescriptor.open(localFile, 268435456);
    throw new FileNotFoundException(paramUri.getPath());
  }

  public Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    throw new UnsupportedOperationException();
  }

  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.VineVideoProvider
 * JD-Core Version:    0.6.2
 */