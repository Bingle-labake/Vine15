package co.vine.android.recorder;

import android.os.AsyncTask;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public abstract class HashAsyncTask extends AsyncTask<RecordingFile, Void, RecordingFile>
  implements RecordCompleteConsumer
{
  private final RecordCompleteConsumer mParent;

  public HashAsyncTask(RecordCompleteConsumer paramRecordCompleteConsumer)
  {
    this.mParent = paramRecordCompleteConsumer;
  }

  private static byte[] createChecksum(String paramString)
    throws NoSuchAlgorithmException, IOException
  {
    if (!new File(paramString).exists())
      return new byte[0];
    FileInputStream localFileInputStream = new FileInputStream(paramString);
    byte[] arrayOfByte = new byte[1024];
    MessageDigest localMessageDigest = MessageDigest.getInstance("MD5");
    int i;
    do
    {
      i = localFileInputStream.read(arrayOfByte);
      if (i > 0)
        localMessageDigest.update(arrayOfByte, 0, i);
    }
    while (i != -1);
    return localMessageDigest.digest();
  }

  public static String getMD5Checksum(String paramString)
    throws Exception
  {
    byte[] arrayOfByte = createChecksum(paramString);
    String str = "";
    int i = arrayOfByte.length;
    for (int j = 0; j < i; j++)
    {
      int k = arrayOfByte[j];
      str = str + Integer.toString(256 + (k & 0xFF), 16).substring(1);
    }
    return str;
  }

  public static void setMD5Checksum(RecordingFile paramRecordingFile)
    throws Exception
  {
    paramRecordingFile.setHash(getMD5Checksum(paramRecordingFile.getVideoPath()));
  }

  protected RecordingFile doInBackground(RecordingFile[] paramArrayOfRecordingFile)
  {
    if ((paramArrayOfRecordingFile == null) || (paramArrayOfRecordingFile.length == 0))
      return null;
    if (paramArrayOfRecordingFile.length > 1)
      throw new IllegalArgumentException("You can only throw on file per execute.");
    RecordingFile localRecordingFile = paramArrayOfRecordingFile[0];
    try
    {
      localRecordingFile.setHash(getMD5Checksum(localRecordingFile.getVideoPath()));
      return localRecordingFile;
    }
    catch (Exception localException)
    {
      onError(localRecordingFile, localException);
    }
    return null;
  }

  public final void onComplete(RecordingFile paramRecordingFile)
  {
    onComplete(paramRecordingFile, this.mParent);
  }

  public abstract void onComplete(RecordingFile paramRecordingFile, RecordCompleteConsumer paramRecordCompleteConsumer);

  public final void onError(RecordingFile paramRecordingFile, Exception paramException)
  {
    onError(paramRecordingFile, paramException, this.mParent);
  }

  public abstract void onError(RecordingFile paramRecordingFile, Exception paramException, RecordCompleteConsumer paramRecordCompleteConsumer);

  protected final void onPostExecute(RecordingFile paramRecordingFile)
  {
    onComplete(paramRecordingFile, this.mParent);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.HashAsyncTask
 * JD-Core Version:    0.6.2
 */