package co.vine.android.recorder;

import com.edisonwang.android.slog.FormattingTuple;
import com.edisonwang.android.slog.MessageFormatter;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import org.apache.commons.io.FileUtils;

public class RecordingFile
{
  public ArrayList<RecordSegment> editedSegments;
  public final File folder;
  public boolean isDirty;
  public final boolean isLastSession;
  public boolean isSavedSession;
  private String mHash;
  private RecordSession mSession;

  public RecordingFile(File paramFile, RecordSession paramRecordSession, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    this.mSession = paramRecordSession;
    this.folder = paramFile;
    this.isSavedSession = paramBoolean1;
    this.isLastSession = paramBoolean3;
    this.isDirty = paramBoolean2;
    try
    {
      FileUtils.forceMkdir(this.folder);
      return;
    }
    catch (IOException localIOException)
    {
      throw new RuntimeException(localIOException);
    }
  }

  public static String getLastFramePathThumbnailFromThumbnailPath(String paramString, boolean paramBoolean)
  {
    return paramString + ".last." + String.valueOf(paramBoolean) + ".jpg";
  }

  public String getHash()
  {
    return this.mHash;
  }

  public String getLastFramePath()
  {
    String str1 = getThumbnailPath();
    String str2 = getLastFramePathThumbnailFromThumbnailPath(str1, false);
    if (!new File(str2).exists())
      return str1;
    return str2;
  }

  public String getPreviewThumbnailPath()
  {
    return RecordSessionManager.getPreviewThumbnailPath(this.folder);
  }

  public String getPreviewVideoPath()
  {
    return RecordSessionManager.getPreviewVideoPath(this.folder);
  }

  public String getSegmentThumbnailPath()
  {
    return RecordSessionManager.getSegmentThumbnailPath(this.folder);
  }

  public String getSegmentVideoPath()
  {
    return RecordSessionManager.getSegmentVideoPath(this.folder);
  }

  public RecordSession getSession()
  {
    return this.mSession;
  }

  public String getThumbnailPath()
  {
    return RecordSessionManager.getThumbnailPath(this.folder);
  }

  public String getVideoPath()
  {
    return RecordSessionManager.getVideoPath(this.folder);
  }

  public boolean hasData()
  {
    return this.mSession.getSegments().size() > 0;
  }

  public void invalidateGhostThumbnail()
  {
    File localFile = new File(getLastFramePathThumbnailFromThumbnailPath(getPreviewThumbnailPath(), true));
    if (localFile.exists())
      localFile.renameTo(new File(getLastFramePathThumbnailFromThumbnailPath(getThumbnailPath(), false)));
  }

  public void setHash(String paramString)
  {
    this.mHash = paramString;
  }

  public void setSession(RecordSession paramRecordSession)
  {
    this.mSession = paramRecordSession;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = this.folder;
    arrayOfObject[1] = Boolean.valueOf(this.isLastSession);
    arrayOfObject[2] = Boolean.valueOf(this.isDirty);
    arrayOfObject[3] = Boolean.valueOf(this.isSavedSession);
    arrayOfObject[4] = this.mSession;
    return MessageFormatter.format("Folder: {}, isLastSession: {}, isDirty: {}, isSavedSession: {}, Session: {}", arrayOfObject).getMessage();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RecordingFile
 * JD-Core Version:    0.6.2
 */