package com.vandalsoftware.io;

import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public final class DiskLruCache
  implements Closeable
{
  private static final int CLEAN = 1;
  private static final int DIRTY = 2;
  private static final String JOURNAL_FILE = "journal";
  private static final String JOURNAL_FILE_TMP = "journal.tmp";
  private static final long MAGIC = -9130401435085039094L;
  private static final int READ = 4;
  private static final int REDUNDANT_OP_COMPACT_THRESHOLD = 2000;
  private static final int REMOVE = 3;
  private static final int VERSION = 2;
  private final int appVersion;
  private final Callable<Void> cleanupCallable = new Callable()
  {
    public Void call()
      throws Exception
    {
      synchronized (DiskLruCache.this)
      {
        if (DiskLruCache.this.journalStream == null)
          return null;
        DiskLruCache.this.trimToSize();
        if (DiskLruCache.this.journalRebuildRequired())
          DiskLruCache.this.rebuildJournal();
        return null;
      }
    }
  };
  private final File directory;
  private final ExecutorService executorService = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue());
  private final File journalFile;
  private final File journalFileTmp;
  private DataOutputStream journalStream;
  private final LinkedHashMap<String, Entry> lruEntries = new LinkedHashMap(0, 0.75F, true);
  private final long maxSize;
  private int redundantOpCount;
  private long size = 0L;
  private final int valueCount;

  private DiskLruCache(File paramFile, int paramInt1, int paramInt2, long paramLong)
  {
    this.directory = paramFile;
    this.appVersion = paramInt1;
    this.journalFile = new File(paramFile, "journal");
    this.journalFileTmp = new File(paramFile, "journal.tmp");
    this.valueCount = paramInt2;
    this.maxSize = paramLong;
  }

  private void checkNotClosed()
  {
    if (this.journalStream == null)
      throw new IllegalStateException("cache is closed");
  }

  private void completeEdit(Editor paramEditor, boolean paramBoolean)
    throws IOException
  {
    Entry localEntry;
    try
    {
      localEntry = paramEditor.entry;
      if (localEntry.currentEditor != paramEditor)
        throw new IllegalStateException();
    }
    finally
    {
    }
    int j;
    if ((paramBoolean) && (!localEntry.readable))
    {
      j = 0;
      if (j < this.valueCount)
        if (!localEntry.getDirtyFile(j).exists())
        {
          paramEditor.abort();
          throw new IllegalStateException("edit didn't create file " + j);
        }
    }
    while (true)
    {
      int i;
      if (i < this.valueCount)
      {
        File localFile1 = localEntry.getDirtyFile(i);
        if (paramBoolean)
        {
          if (localFile1.exists())
          {
            File localFile2 = localEntry.getCleanFile(i);
            IoUtils.renameFileOrThrow(localFile1, localFile2);
            long l1 = localEntry.lengths[i];
            long l2 = localFile2.length();
            localEntry.lengths[i] = l2;
            this.size = (l2 + (this.size - l1));
          }
        }
        else
          deleteIfExists(localFile1);
      }
      else
      {
        this.redundantOpCount = (1 + this.redundantOpCount);
        Entry.access$602(localEntry, null);
        if ((paramBoolean | localEntry.readable))
        {
          Entry.access$502(localEntry, true);
          writeCleanEntry(this.journalStream, localEntry);
        }
        while (true)
        {
          if ((this.size > this.maxSize) || (journalRebuildRequired()))
            this.executorService.submit(this.cleanupCallable);
          return;
          this.lruEntries.remove(localEntry.key);
          writeEntryKey(this.journalStream, 3, localEntry.key);
        }
        j++;
        break;
        i = 0;
        continue;
      }
      i++;
    }
  }

  private static boolean deleteIfExists(File paramFile)
    throws IOException
  {
    return (paramFile.exists()) && (paramFile.delete());
  }

  private boolean journalRebuildRequired()
  {
    return (this.redundantOpCount >= 2000) && (this.redundantOpCount >= this.lruEntries.size());
  }

  public static DiskLruCache open(File paramFile, int paramInt1, int paramInt2, long paramLong)
    throws IOException
  {
    if (paramLong <= 0L)
      throw new IllegalArgumentException("maxSize <= 0");
    if (paramInt2 <= 0)
      throw new IllegalArgumentException("valueCount <= 0");
    DiskLruCache localDiskLruCache1 = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong);
    if (localDiskLruCache1.journalFile.exists())
      try
      {
        int i = localDiskLruCache1.readJournal();
        localDiskLruCache1.processJournal();
        localDiskLruCache1.journalStream = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(localDiskLruCache1.journalFile, true)));
        localDiskLruCache1.redundantOpCount = (i - localDiskLruCache1.lruEntries.size());
        return localDiskLruCache1;
      }
      catch (IOException localIOException)
      {
        Log.w("DiskLruCache", paramFile + " is corrupt: " + localIOException.getMessage() + ", removing");
        localDiskLruCache1.delete();
      }
    if ((paramFile.mkdirs()) || (paramFile.exists()))
    {
      DiskLruCache localDiskLruCache2 = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong);
      localDiskLruCache2.rebuildJournal();
      return localDiskLruCache2;
    }
    throw new FileNotFoundException("directory not found " + paramFile);
  }

  private void processJournal()
    throws IOException
  {
    deleteIfExists(this.journalFileTmp);
    Iterator localIterator = this.lruEntries.values().iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      if (localEntry.currentEditor == null)
      {
        for (int j = 0; j < this.valueCount; j++)
          this.size += localEntry.lengths[j];
      }
      else
      {
        Entry.access$602(localEntry, null);
        for (int i = 0; i < this.valueCount; i++)
        {
          deleteIfExists(localEntry.getCleanFile(i));
          deleteIfExists(localEntry.getDirtyFile(i));
        }
        localIterator.remove();
      }
    }
  }

  private int readJournal()
    throws IOException
  {
    DataInputStream localDataInputStream = new DataInputStream(new BufferedInputStream(new FileInputStream(this.journalFile)));
    try
    {
      long l = localDataInputStream.readLong();
      int i = localDataInputStream.readUnsignedByte();
      int j = localDataInputStream.readInt();
      int k = localDataInputStream.readInt();
      int m = localDataInputStream.readByte();
      if ((-9130401435085039094L != l) || (2 != i) || (this.appVersion != j) || (this.valueCount != k) || (m != 10))
        throw new IOException("unexpected journal header: [" + l + ", " + i + ", " + k + ", " + m + "]");
    }
    finally
    {
      IoUtils.closeQuietly(localDataInputStream);
    }
    int n = 0;
    try
    {
      while (true)
      {
        readJournalLine(localDataInputStream);
        n++;
      }
    }
    catch (EOFException localEOFException)
    {
      IoUtils.closeQuietly(localDataInputStream);
    }
    return n;
  }

  private void readJournalLine(DataInput paramDataInput)
    throws IOException
  {
    int i = paramDataInput.readUnsignedByte();
    String str = paramDataInput.readUTF();
    if ((i == 3) && (paramDataInput.readByte() == 10))
      this.lruEntries.remove(str);
    do
    {
      return;
      Entry localEntry = (Entry)this.lruEntries.get(str);
      if (localEntry == null)
      {
        localEntry = new Entry(str, null);
        this.lruEntries.put(str, localEntry);
      }
      if (i == 1)
      {
        long[] arrayOfLong = new long[this.valueCount];
        for (int j = 0; j < this.valueCount; j++)
          arrayOfLong[j] = paramDataInput.readLong();
        if (paramDataInput.readByte() != 10)
          throw new IOException("unexpected journal entry: " + i + " " + str);
        Entry.access$502(localEntry, true);
        Entry.access$602(localEntry, null);
        System.arraycopy(arrayOfLong, 0, localEntry.lengths, 0, this.valueCount);
        return;
      }
      if ((i == 2) && (paramDataInput.readByte() == 10))
      {
        Entry.access$602(localEntry, new Editor(localEntry, null));
        return;
      }
    }
    while ((i == 4) && (paramDataInput.readByte() == 10));
    throw new IOException("unexpected journal entry: " + i + " " + str);
  }

  private void rebuildJournal()
    throws IOException
  {
    DataOutputStream localDataOutputStream;
    while (true)
    {
      Entry localEntry;
      try
      {
        if (this.journalStream != null)
          this.journalStream.close();
        localDataOutputStream = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(this.journalFileTmp)));
        try
        {
          localDataOutputStream.writeLong(-9130401435085039094L);
          localDataOutputStream.writeByte(2);
          localDataOutputStream.writeInt(this.appVersion);
          localDataOutputStream.writeInt(this.valueCount);
          localDataOutputStream.writeByte(10);
          Iterator localIterator = this.lruEntries.values().iterator();
          if (!localIterator.hasNext())
            break;
          localEntry = (Entry)localIterator.next();
          if (localEntry.currentEditor != null)
          {
            writeEntryKey(localDataOutputStream, 2, localEntry.key);
            continue;
          }
        }
        finally
        {
          localDataOutputStream.close();
        }
      }
      finally
      {
      }
      writeCleanEntry(localDataOutputStream, localEntry);
    }
    localDataOutputStream.close();
    IoUtils.renameFileOrThrow(this.journalFileTmp, this.journalFile);
    this.journalStream = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(this.journalFile, true)));
    this.redundantOpCount = 0;
  }

  private void trimToSize()
    throws IOException
  {
    while (this.size > this.maxSize)
      remove((String)((Map.Entry)this.lruEntries.entrySet().iterator().next()).getKey());
  }

  private void validateKey(String paramString)
  {
    if ((paramString.contains(" ")) || (paramString.contains("\n")) || (paramString.contains("\r")))
      throw new IllegalArgumentException("keys must not contain spaces or newlines: \"" + paramString + "\"");
  }

  private void writeCleanEntry(DataOutput paramDataOutput, Entry paramEntry)
    throws IOException
  {
    paramDataOutput.writeByte(1);
    paramDataOutput.writeUTF(paramEntry.key);
    long[] arrayOfLong = paramEntry.lengths;
    int i = arrayOfLong.length;
    for (int j = 0; j < i; j++)
      paramDataOutput.writeLong(arrayOfLong[j]);
    paramDataOutput.writeByte(10);
  }

  private void writeEntryKey(DataOutput paramDataOutput, int paramInt, String paramString)
    throws IOException
  {
    paramDataOutput.writeByte(paramInt);
    paramDataOutput.writeUTF(paramString);
    paramDataOutput.writeByte(10);
  }

  public void close()
    throws IOException
  {
    while (true)
    {
      try
      {
        DataOutputStream localDataOutputStream = this.journalStream;
        if (localDataOutputStream == null)
          return;
        Iterator localIterator = new ArrayList(this.lruEntries.values()).iterator();
        if (localIterator.hasNext())
        {
          Entry localEntry = (Entry)localIterator.next();
          if (localEntry.currentEditor == null)
            continue;
          localEntry.currentEditor.abort();
          continue;
        }
      }
      finally
      {
      }
      trimToSize();
      this.journalStream.close();
      this.journalStream = null;
    }
  }

  public void delete()
    throws IOException
  {
    close();
    if (this.directory.isDirectory())
      IoUtils.deleteContents(this.directory);
  }

  public Editor edit(String paramString)
    throws IOException
  {
    try
    {
      checkNotClosed();
      validateKey(paramString);
      Entry localEntry = (Entry)this.lruEntries.get(paramString);
      Editor localEditor1;
      if (localEntry == null)
      {
        localEntry = new Entry(paramString, null);
        this.lruEntries.put(paramString, localEntry);
        localEditor1 = new Editor(localEntry, null);
        Entry.access$602(localEntry, localEditor1);
        writeEntryKey(this.journalStream, 2, paramString);
        this.journalStream.flush();
      }
      while (true)
      {
        return localEditor1;
        Editor localEditor2 = localEntry.currentEditor;
        if (localEditor2 == null)
          break;
        localEditor1 = null;
      }
    }
    finally
    {
    }
  }

  public void flush()
    throws IOException
  {
    try
    {
      checkNotClosed();
      trimToSize();
      this.journalStream.flush();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public Snapshot get(String paramString)
    throws IOException
  {
    try
    {
      Snapshot localSnapshot = get(paramString, false);
      return localSnapshot;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public Snapshot get(String paramString, boolean paramBoolean)
    throws IOException
  {
    try
    {
      checkNotClosed();
      validateKey(paramString);
      Entry localEntry = (Entry)this.lruEntries.get(paramString);
      Snapshot localSnapshot = null;
      if (localEntry == null);
      while (true)
      {
        return localSnapshot;
        boolean bool = localEntry.readable;
        localSnapshot = null;
        if (bool)
        {
          InputStream[] arrayOfInputStream = new InputStream[this.valueCount];
          String[] arrayOfString = new String[this.valueCount];
          int i = 0;
          try
          {
            while (i < this.valueCount)
            {
              File localFile = localEntry.getCleanFile(i);
              arrayOfInputStream[i] = new FileInputStream(localFile);
              arrayOfString[i] = localFile.getAbsolutePath();
              i++;
            }
          }
          catch (FileNotFoundException localFileNotFoundException)
          {
            localSnapshot = null;
          }
          continue;
          if (!paramBoolean)
          {
            this.redundantOpCount = (1 + this.redundantOpCount);
            writeEntryKey(this.journalStream, 4, paramString);
            if (journalRebuildRequired())
              this.executorService.submit(this.cleanupCallable);
          }
          localSnapshot = new Snapshot(arrayOfInputStream, arrayOfString, null);
        }
      }
    }
    finally
    {
    }
  }

  public File getDirectory()
  {
    return this.directory;
  }

  public LinkedHashMap<String, Entry> getLruEntries()
  {
    return this.lruEntries;
  }

  public boolean isClosed()
  {
    return this.journalStream == null;
  }

  public long maxSize()
  {
    return this.maxSize;
  }

  public boolean remove(String paramString)
    throws IOException
  {
    try
    {
      checkNotClosed();
      validateKey(paramString);
      Entry localEntry = (Entry)this.lruEntries.get(paramString);
      if (localEntry != null)
      {
        Editor localEditor = localEntry.currentEditor;
        if (localEditor == null)
          break label46;
      }
      for (boolean bool = false; ; bool = true)
      {
        return bool;
        label46: for (int i = 0; i < this.valueCount; i++)
        {
          IoUtils.deleteFileOrThrow(localEntry.getCleanFile(i));
          this.size -= localEntry.lengths[i];
          localEntry.lengths[i] = 0L;
        }
        this.redundantOpCount = (1 + this.redundantOpCount);
        writeEntryKey(this.journalStream, 3, paramString);
        this.lruEntries.remove(paramString);
        if (journalRebuildRequired())
          this.executorService.submit(this.cleanupCallable);
      }
    }
    finally
    {
    }
  }

  public long size()
  {
    try
    {
      long l = this.size;
      return l;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final class Editor
  {
    private final DiskLruCache.Entry entry;
    private boolean hasErrors;

    private Editor(DiskLruCache.Entry arg2)
    {
      Object localObject;
      this.entry = localObject;
    }

    public void abort()
      throws IOException
    {
      DiskLruCache.this.completeEdit(this, false);
    }

    public void commit()
      throws IOException
    {
      if (this.hasErrors)
      {
        DiskLruCache.this.completeEdit(this, false);
        DiskLruCache.this.remove(DiskLruCache.Entry.access$900(this.entry));
        return;
      }
      DiskLruCache.this.completeEdit(this, true);
    }

    public OutputStream newOutputStream(int paramInt)
      throws IOException
    {
      synchronized (DiskLruCache.this)
      {
        if (DiskLruCache.Entry.access$600(this.entry) != this)
          throw new IllegalStateException();
      }
      ErrorCatchingOutputStream localErrorCatchingOutputStream = new ErrorCatchingOutputStream(new FileOutputStream(this.entry.getDirtyFile(paramInt)), null);
      return localErrorCatchingOutputStream;
    }

    private class ErrorCatchingOutputStream extends FilterOutputStream
    {
      private ErrorCatchingOutputStream(OutputStream arg2)
      {
        super();
      }

      public void close()
        throws IOException
      {
        try
        {
          this.out.close();
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$1402(DiskLruCache.Editor.this, true);
          throw localIOException;
        }
      }

      public void flush()
        throws IOException
      {
        try
        {
          this.out.flush();
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$1402(DiskLruCache.Editor.this, true);
          throw localIOException;
        }
      }

      public void write(int paramInt)
        throws IOException
      {
        try
        {
          this.out.write(paramInt);
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$1402(DiskLruCache.Editor.this, true);
          throw localIOException;
        }
      }

      public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
        throws IOException
      {
        try
        {
          this.out.write(paramArrayOfByte, paramInt1, paramInt2);
          return;
        }
        catch (IOException localIOException)
        {
          DiskLruCache.Editor.access$1402(DiskLruCache.Editor.this, true);
          throw localIOException;
        }
      }
    }
  }

  public final class Entry
  {
    private DiskLruCache.Editor currentEditor;
    private final String key;
    private final long[] lengths;
    private boolean readable;

    private Entry(String arg2)
    {
      Object localObject;
      this.key = localObject;
      this.lengths = new long[DiskLruCache.this.valueCount];
    }

    public File getCleanFile(int paramInt)
    {
      return new File(DiskLruCache.this.directory, this.key + "." + paramInt);
    }

    public File getDirtyFile(int paramInt)
    {
      return new File(DiskLruCache.this.directory, this.key + "." + paramInt + ".tmp");
    }
  }

  public static final class Snapshot
    implements Closeable
  {
    private final InputStream[] ins;
    private final String[] paths;

    private Snapshot(InputStream[] paramArrayOfInputStream, String[] paramArrayOfString)
    {
      this.ins = paramArrayOfInputStream;
      this.paths = paramArrayOfString;
    }

    public void close()
    {
      InputStream[] arrayOfInputStream = this.ins;
      int i = arrayOfInputStream.length;
      for (int j = 0; j < i; j++)
        IoUtils.closeQuietly(arrayOfInputStream[j]);
    }

    public InputStream getInputStream(int paramInt)
    {
      return this.ins[paramInt];
    }

    public String getPath(int paramInt)
    {
      return this.paths[paramInt];
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.vandalsoftware.io.DiskLruCache
 * JD-Core Version:    0.6.2
 */