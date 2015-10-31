package co.vine.android.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.text.TextUtils;
import co.vine.android.api.VineParserReader;
import co.vine.android.client.Amazon;
import co.vine.android.client.VineAPI;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.network.HttpOperation;
import co.vine.android.network.ThreadedHttpOperationClient;
import co.vine.android.util.image.ImageUtils;
import com.edisonwang.android.slog.SLog;
import java.io.File;
import java.util.UUID;

public class MediaUtility
{
  public static final int MEDIA = 2;
  public static final int S3 = 1;
  private Context mContext;

  public MediaUtility(Context paramContext)
  {
    this.mContext = paramContext;
  }

  public static int getUploadType(Context paramContext)
  {
    if (!VineAccountHelper.isLoggedIn(paramContext, true));
    while ("s3".equals(Util.getDefaultSharedPrefs(paramContext).getString("server_upload_type", "media")))
      return 1;
    return 2;
  }

  public String getPhotoUri(Uri paramUri, String paramString, Context paramContext)
    throws Exception
  {
    String str1 = "avatars/" + UUID.randomUUID() + ".jpg";
    String str2 = null;
    if (paramUri != null)
    {
      boolean bool = TextUtils.isEmpty(paramUri.toString());
      str2 = null;
      if (!bool)
      {
        FileInfo localFileInfo = upload(null, str1, new File(ImageUtils.getRealPathFromImageUri(paramContext, paramUri)), paramString, "avatars");
        str2 = null;
        if (localFileInfo != null)
          str2 = localFileInfo.uploadKey;
      }
    }
    return str2;
  }

  public String getThumbnailUri(VineProgressListener paramVineProgressListener, String paramString, File paramFile, Context paramContext)
    throws Exception
  {
    String str = Amazon.getBucket(paramContext);
    FileInfo localFileInfo = upload(paramVineProgressListener, "thumbs/" + paramString + ".jpg", paramFile, str, "thumbs");
    if (localFileInfo != null)
      return localFileInfo.uploadKey;
    return null;
  }

  public String getVideoUri(VineProgressListener paramVineProgressListener, File paramFile, Context paramContext, String paramString)
    throws Exception
  {
    String str = Amazon.getBucket(paramContext);
    FileInfo localFileInfo = upload(paramVineProgressListener, "videos/" + paramString, paramFile, str, "videos");
    if (localFileInfo != null)
      return localFileInfo.uploadKey;
    return null;
  }

  public FileInfo upload(VineProgressListener paramVineProgressListener, String paramString1, File paramFile, String paramString2, String paramString3)
    throws Exception
  {
    SLog.d("Upload started for {}.", paramFile.getName());
    switch (getUploadType(this.mContext))
    {
    default:
    case 1:
    case 2:
    }
    while (true)
    {
      return null;
      if (paramString1.endsWith(".mp4"))
      {
        SLog.d("Upload video through media.");
        String str2 = BuildUtil.get(this.mContext).getMediaUrl();
        Object[] arrayOfObject2 = new Object[3];
        arrayOfObject2[0] = "upload";
        arrayOfObject2[1] = "videos";
        arrayOfObject2[2] = (paramFile.getName() + ".mp4");
        StringBuilder localStringBuilder2 = VineAPI.buildUponUrl(str2, arrayOfObject2);
        MeasureOutputStream localMeasureOutputStream2 = new MeasureOutputStream(paramFile, "video/mp4", paramVineProgressListener);
        VineParserReader localVineParserReader2 = VineParserReader.createParserReader(16);
        HttpOperation localHttpOperation2 = HttpOperation.createMediaPutRequest(ThreadedHttpOperationClient.getInstance(this.mContext), localStringBuilder2, localVineParserReader2, localMeasureOutputStream2, VineAPI.getInstance(this.mContext)).execute();
        if (localHttpOperation2.isOK())
        {
          SLog.d("Upload {} successful.", localHttpOperation2.uploadKey);
          return new FileInfo(paramFile.getName(), paramFile, localHttpOperation2.uploadKey);
        }
        SLog.d("{} {} {}", localStringBuilder2, Integer.valueOf(localHttpOperation2.statusCode), localHttpOperation2.statusPhrase);
      }
      else if (paramString1.endsWith("jpg"))
      {
        SLog.d("Upload image through media.");
        String str1 = BuildUtil.get(this.mContext).getMediaUrl();
        Object[] arrayOfObject1 = new Object[3];
        arrayOfObject1[0] = "upload";
        arrayOfObject1[1] = paramString3;
        arrayOfObject1[2] = (paramFile.getName() + ".jpg");
        StringBuilder localStringBuilder1 = VineAPI.buildUponUrl(str1, arrayOfObject1);
        MeasureOutputStream localMeasureOutputStream1 = new MeasureOutputStream(paramFile, "image/jpeg", paramVineProgressListener);
        VineParserReader localVineParserReader1 = VineParserReader.createParserReader(16);
        HttpOperation localHttpOperation1 = HttpOperation.createMediaPutRequest(ThreadedHttpOperationClient.getInstance(this.mContext), localStringBuilder1, localVineParserReader1, localMeasureOutputStream1, VineAPI.getInstance(this.mContext)).execute();
        if (localHttpOperation1.isOK())
        {
          SLog.d("Upload {} successful.", localHttpOperation1.uploadKey);
          return new FileInfo(paramFile.getName(), paramFile, localHttpOperation1.uploadKey);
        }
        SLog.d("{} {} {}", localStringBuilder1, Integer.valueOf(localHttpOperation1.statusCode), localHttpOperation1.statusPhrase);
      }
    }
  }

  private static class FileInfo
  {
    public File file;
    public String filename;
    public String uploadKey;

    public FileInfo(String paramString1, File paramFile, String paramString2)
    {
      this.filename = paramString1;
      this.file = paramFile;
      this.uploadKey = paramString2;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.MediaUtility
 * JD-Core Version:    0.6.2
 */