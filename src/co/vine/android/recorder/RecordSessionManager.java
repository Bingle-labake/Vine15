package co.vine.android.recorder;

import android.content.Context;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.SystemUtil;
import com.edisonwang.android.slog.SLog;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import org.apache.commons.io.FileUtils;

public class RecordSessionManager
{
  private static RecordSessionManager INSTANCE;
  private static final int REQUIRED_SPACE_LIMIT = 20971520;
  private final File mDir;

  private RecordSessionManager(Context paramContext)
    throws IOException
  {
    File localFile = paramContext.getExternalFilesDir(null);
    if (localFile == null)
      localFile = paramContext.getFilesDir();
    this.mDir = new File(localFile, "drafts");
    if ((this.mDir.exists()) && (!this.mDir.isDirectory()))
      FileUtils.forceDelete(this.mDir);
    FileUtils.forceMkdir(this.mDir);
    try
    {
      long l = this.mDir.getFreeSpace();
      if ((l > 0L) && (l < 20971520L))
        throw new IOException("Not enough space left for drafts.");
      SLog.d("free space left: {}.", Long.valueOf(l));
      return;
    }
    catch (SecurityException localSecurityException)
    {
    }
  }

  public static void deleteSession(File paramFile, String paramString)
    throws IOException
  {
    CrashUtil.log("Session deleted: {}, {}.", new Object[] { paramString, paramFile });
    FileUtils.deleteDirectory(paramFile);
  }

  public static File getDataFile(File paramFile, boolean paramBoolean)
  {
    if (paramBoolean);
    for (String str = "data.bin"; ; str = "data.temp")
      return new File(paramFile, str);
  }

  public static File getFrameInfoFile(File paramFile)
  {
    return new File(paramFile, "frame.info");
  }

  public static RecordSessionManager getInstance(Context paramContext)
    throws IOException
  {
    if (INSTANCE == null)
      INSTANCE = new RecordSessionManager(paramContext);
    return INSTANCE;
  }

  public static File getMetaFile(File paramFile)
  {
    return new File(paramFile, "meta.bin");
  }

  public static int getNumberOfValidSessions(Context paramContext)
    throws IOException
  {
    ArrayList localArrayList = getValidSessions(paramContext);
    if (localArrayList != null)
      return localArrayList.size();
    return 0;
  }

  public static String getPreviewThumbnailPath(File paramFile)
  {
    return new File(paramFile, "preview.jpg").getAbsolutePath();
  }

  public static String getPreviewVideoPath(File paramFile)
  {
    return new File(paramFile, "preview.mp4").getAbsolutePath();
  }

  public static String getSegmentThumbnailPath(File paramFile)
  {
    return new File(paramFile, "segment.jpg").getAbsolutePath();
  }

  public static String getSegmentVideoPath(File paramFile)
  {
    return new File(paramFile, "segment_" + System.currentTimeMillis() + ".mp4").getAbsolutePath();
  }

  public static String getThumbnailPath(File paramFile)
  {
    return new File(paramFile, "thumbnail.jpg").getAbsolutePath();
  }

  public static ArrayList<RecordSessionInfo> getValidSessions(Context paramContext)
    throws IOException
  {
    return getInstance(paramContext).getValidSessions();
  }

  public static String getVideoPath(File paramFile)
  {
    return new File(paramFile, "video.mp4").getAbsolutePath();
  }

  public static boolean isSessionSaved(File paramFile)
  {
    return (getMetaFile(paramFile).exists()) && (getDataFile(paramFile, true).exists());
  }

  public static RecordSession readDataObject(File paramFile)
    throws IOException
  {
    return (RecordSession)readObject(getDataFile(paramFile, true));
  }

  public static ArrayList<Integer> readFrameInfo(File paramFile)
    throws IOException
  {
    return (ArrayList)readObject(paramFile);
  }

  public static RecordSessionMeta readMetaObject(File paramFile)
    throws IOException
  {
    return (RecordSessionMeta)readObject(getMetaFile(paramFile));
  }

  private static Object readObject(File paramFile)
    throws IOException
  {
    try
    {
      if (!paramFile.exists())
        throw new FileNotFoundException("File not found: " + paramFile.getPath());
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new IOException("Invalid file found.", localClassNotFoundException);
    }
    BufferedInputStream localBufferedInputStream = new BufferedInputStream(new FileInputStream(paramFile));
    try
    {
      ObjectInputStream localObjectInputStream = new ObjectInputStream(localBufferedInputStream);
      try
      {
        Object localObject2 = localObjectInputStream.readObject();
        return localObject2;
      }
      finally
      {
        localObjectInputStream.close();
      }
    }
    catch (EOFException localEOFException)
    {
      SLog.e("Failed to read a corrupted file.");
      FileUtils.deleteQuietly(paramFile);
      throw localEOFException;
    }
  }

  private static void writeData(File paramFile, RecordSession paramRecordSession, boolean paramBoolean)
    throws IOException
  {
    writeObject(getDataFile(paramFile, paramBoolean), paramRecordSession);
    if (paramBoolean)
      FileUtils.deleteQuietly(getDataFile(paramFile, false));
  }

  public static void writeFrameInfo(File paramFile, ArrayList<Integer> paramArrayList)
    throws IOException
  {
    writeObject(getFrameInfoFile(paramFile), paramArrayList);
  }

  private static void writeMeta(File paramFile, RecordSessionMeta paramRecordSessionMeta)
    throws IOException
  {
    writeObject(getMetaFile(paramFile), paramRecordSessionMeta);
  }

  private static void writeObject(File paramFile, Object paramObject)
    throws IOException
  {
    CrashUtil.log("Writing: {}.", new Object[] { paramFile });
    SystemUtil.quietlyEnsureParentExists(paramFile);
    ObjectOutputStream localObjectOutputStream = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream(paramFile)));
    try
    {
      localObjectOutputStream.writeObject(paramObject);
      return;
    }
    finally
    {
      localObjectOutputStream.close();
      CrashUtil.log("Closed: {}.", new Object[] { paramFile });
    }
  }

  public static void writeRecordingFile(RecordingFile paramRecordingFile, boolean paramBoolean)
    throws IOException
  {
    writeData(paramRecordingFile.folder, paramRecordingFile.getSession(), paramBoolean);
    if (paramBoolean)
    {
      writeMeta(paramRecordingFile.folder, new RecordSessionMeta(RecordConfigUtils.getTimeStampInNsFromSampleCounted(paramRecordingFile.getSession().getAudioDataCount()) / 1000));
      FileUtils.deleteQuietly(getDataFile(paramRecordingFile.folder, false));
    }
  }

  public void cleanUnusedFolders()
  {
    File[] arrayOfFile1 = this.mDir.listFiles();
    int i = 0;
    if (arrayOfFile1 != null)
    {
      int j = arrayOfFile1.length;
      int k = 0;
      if (k < j)
      {
        File localFile = arrayOfFile1[k];
        File[] arrayOfFile2;
        if (localFile.isDirectory())
        {
          arrayOfFile2 = localFile.listFiles();
          if (arrayOfFile2 != null)
          {
            if (arrayOfFile2.length != 0)
              break label73;
            FileUtils.deleteQuietly(localFile);
            i++;
          }
        }
        while (true)
        {
          k++;
          break;
          label73: if ((arrayOfFile2.length == 1) && (arrayOfFile2[0].getName().endsWith(".mp4")))
            FileUtils.deleteQuietly(localFile);
          i++;
        }
      }
    }
    SLog.i("{} empty folders deleted.", Integer.valueOf(i));
  }

  public File createFolderForSession()
    throws IOException
  {
    File localFile = new File(this.mDir, String.valueOf(System.currentTimeMillis()));
    FileUtils.forceMkdir(localFile);
    return localFile;
  }

  public HashMap<RecordSession, File> getCrashedSession()
    throws IOException
  {
    Iterator localIterator = getFolders().iterator();
    while (localIterator.hasNext())
    {
      File localFile1 = (File)localIterator.next();
      File localFile2 = getDataFile(localFile1, false);
      if (localFile2.exists())
        try
        {
          HashMap localHashMap = new HashMap();
          localHashMap.put((RecordSession)readObject(localFile2), localFile1);
          return localHashMap;
        }
        catch (IOException localIOException)
        {
          SLog.e("Failed to read session object.", localIOException);
        }
    }
    return null;
  }

  public File getFolderFromName(String paramString)
  {
    if (paramString != null)
      return new File(this.mDir, paramString);
    return null;
  }

  public ArrayList<File> getFolders()
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    File[] arrayOfFile = this.mDir.listFiles();
    if (arrayOfFile == null)
      throw new IOException("This should never happen.");
    int i = arrayOfFile.length;
    for (int j = 0; j < i; j++)
    {
      File localFile = arrayOfFile[j];
      if (localFile.isDirectory())
        localArrayList.add(localFile);
    }
    return localArrayList;
  }

  public ArrayList<RecordSessionInfo> getValidSessions()
    throws IOException
  {
    ArrayList localArrayList1 = getFolders();
    ArrayList localArrayList2 = new ArrayList(localArrayList1.size());
    Iterator localIterator = localArrayList1.iterator();
    while (localIterator.hasNext())
    {
      File localFile1 = (File)localIterator.next();
      try
      {
        if (getMetaFile(localFile1).exists())
        {
          File localFile2 = new File(getThumbnailPath(localFile1));
          File localFile3 = new File(getVideoPath(localFile1));
          RecordSessionMeta localRecordSessionMeta = readMetaObject(localFile1);
          if ((localFile2.exists()) && (localFile3.exists()))
            localArrayList2.add(new RecordSessionInfo(localFile1, localFile2, localFile3, localRecordSessionMeta));
        }
      }
      catch (Exception localException)
      {
        CrashUtil.logException(localException);
      }
    }
    Collections.sort(localArrayList2);
    return localArrayList2;
  }

  public static class RecordSessionInfo
    implements Comparable<RecordSessionInfo>
  {
    public final File folder;
    public final RecordSessionMeta meta;
    public final File thumb;
    public final File video;

    public RecordSessionInfo(File paramFile1, File paramFile2, File paramFile3, RecordSessionMeta paramRecordSessionMeta)
    {
      this.folder = paramFile1;
      this.thumb = paramFile2;
      this.video = paramFile3;
      this.meta = paramRecordSessionMeta;
    }

    public int compareTo(RecordSessionInfo paramRecordSessionInfo)
    {
      return Long.valueOf(this.folder.getName()).compareTo(Long.valueOf(paramRecordSessionInfo.folder.getName()));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RecordSessionManager
 * JD-Core Version:    0.6.2
 */