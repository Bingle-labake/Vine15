package co.vine.android.util;

import android.content.Context;
import android.graphics.Bitmap;
import android.media.MediaMetadataRetriever;
import android.media.MediaScannerConnection;
import android.media.MediaScannerConnection.MediaScannerConnectionClient;
import android.net.Uri;
import com.edisonwang.android.slog.SLog;
import java.io.File;

public class MediaUtil
{
  public static Bitmap[] getVideoFrames(String paramString, long[] paramArrayOfLong)
  {
    MediaMetadataRetriever localMediaMetadataRetriever = new MediaMetadataRetriever();
    try
    {
      localMediaMetadataRetriever.setDataSource(paramString);
      Bitmap[] arrayOfBitmap = new Bitmap[paramArrayOfLong.length];
      int i = 0;
      l1 = -1L;
      int j = paramArrayOfLong.length;
      for (int k = 0; k < j; k++)
      {
        l2 = paramArrayOfLong[k];
        if (l2 == -1L)
        {
          if (l1 != -1L)
            break label176;
          l1 = Long.parseLong(localMediaMetadataRetriever.extractMetadata(9));
          SLog.d("Got duration: {}.", Long.valueOf(l1));
          break label176;
        }
        arrayOfBitmap[i] = localMediaMetadataRetriever.getFrameAtTime(l2, 1);
        i++;
      }
      try
      {
        localMediaMetadataRetriever.release();
        return arrayOfBitmap;
      }
      catch (RuntimeException localRuntimeException4)
      {
        SLog.e("Failed to release.", localRuntimeException4);
        return arrayOfBitmap;
      }
    }
    catch (RuntimeException localRuntimeException2)
    {
      SLog.e("Failed to get frame.", localRuntimeException2);
      try
      {
        localMediaMetadataRetriever.release();
        return null;
      }
      catch (RuntimeException localRuntimeException3)
      {
        while (true)
          SLog.e("Failed to release.", localRuntimeException3);
      }
    }
    finally
    {
      while (true)
      {
        long l1;
        try
        {
          localMediaMetadataRetriever.release();
          throw localObject;
        }
        catch (RuntimeException localRuntimeException1)
        {
          SLog.e("Failed to release.", localRuntimeException1);
          continue;
        }
        label176: long l2 = l1 * 1000L;
      }
    }
  }

  public static void scanFile(Context paramContext, File paramFile, String paramString)
  {
    MediaConnectionClient localMediaConnectionClient = new MediaConnectionClient(paramFile.getAbsolutePath(), paramString);
    MediaScannerConnection localMediaScannerConnection = new MediaScannerConnection(paramContext, localMediaConnectionClient);
    localMediaConnectionClient.connection = localMediaScannerConnection;
    localMediaScannerConnection.connect();
  }

  public static class MediaConnectionClient
    implements MediaScannerConnection.MediaScannerConnectionClient
  {
    public MediaScannerConnection connection;
    private final String mMimeType;
    private final String mPath;

    public MediaConnectionClient(String paramString1, String paramString2)
    {
      this.mPath = paramString1;
      this.mMimeType = paramString2;
    }

    public void onMediaScannerConnected()
    {
      this.connection.scanFile(this.mPath, this.mMimeType);
      this.connection.disconnect();
    }

    public void onScanCompleted(String paramString, Uri paramUri)
    {
      SLog.d("Scan completed: {}, {}.", paramString, paramUri);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.MediaUtil
 * JD-Core Version:    0.6.2
 */