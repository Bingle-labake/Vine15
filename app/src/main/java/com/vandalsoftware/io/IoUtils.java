package com.vandalsoftware.io;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.net.Socket;
import java.util.ArrayList;
import java.util.LinkedList;

public final class IoUtils
{
  public static final String UTF_8 = "UTF-8";

  public static void closeQuietly(Closeable paramCloseable)
  {
    if (paramCloseable != null);
    try
    {
      paramCloseable.close();
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public static void closeQuietly(Socket paramSocket)
  {
    if (paramSocket != null);
    try
    {
      paramSocket.close();
      return;
    }
    catch (Exception localException)
    {
    }
  }

  public static void deleteContents(File paramFile)
    throws IOException
  {
    if (!paramFile.isDirectory())
      throw new IllegalArgumentException("not a directory: " + paramFile);
    LinkedList localLinkedList = new LinkedList();
    localLinkedList.add(paramFile);
    ArrayList localArrayList = new ArrayList();
    while (!localLinkedList.isEmpty())
    {
      File localFile1 = (File)localLinkedList.remove();
      File[] arrayOfFile = localFile1.listFiles();
      if (arrayOfFile != null)
      {
        int j = arrayOfFile.length;
        int k = 0;
        if (k < j)
        {
          File localFile2 = arrayOfFile[k];
          if (localFile2.isDirectory())
            localLinkedList.add(localFile2);
          while (true)
          {
            k++;
            break;
            deleteFileOrThrow(localFile2);
          }
        }
        localArrayList.add(localFile1);
      }
    }
    for (int i = -1 + localArrayList.size(); i >= 0; i--)
      deleteFileOrThrow((File)localArrayList.get(i));
  }

  public static void deleteFileOrThrow(File paramFile)
    throws IOException
  {
    if ((paramFile.exists()) && (!paramFile.delete()))
      throw new IOException("failed to delete file: " + paramFile);
  }

  public static byte[] readFileAsByteArray(String paramString)
    throws IOException
  {
    return readFileAsBytes(paramString).toByteArray();
  }

  private static UnsafeByteSequence readFileAsBytes(String paramString)
    throws IOException
  {
    try
    {
      RandomAccessFile localRandomAccessFile1 = new RandomAccessFile(paramString, "r");
      try
      {
        UnsafeByteSequence localUnsafeByteSequence = new UnsafeByteSequence((int)localRandomAccessFile1.length());
        byte[] arrayOfByte = new byte[8192];
        while (true)
        {
          int i = localRandomAccessFile1.read(arrayOfByte);
          if (i == -1)
          {
            closeQuietly(localRandomAccessFile1);
            return localUnsafeByteSequence;
          }
          localUnsafeByteSequence.write(arrayOfByte, 0, i);
        }
      }
      finally
      {
        localRandomAccessFile2 = localRandomAccessFile1;
      }
      closeQuietly(localRandomAccessFile2);
      throw localObject1;
    }
    finally
    {
      RandomAccessFile localRandomAccessFile2 = null;
    }
  }

  public static String readFileAsString(String paramString)
    throws IOException
  {
    return readFileAsBytes(paramString).toString("UTF-8");
  }

  public static void renameFileOrThrow(File paramFile1, File paramFile2)
    throws IOException
  {
    if (!paramFile1.renameTo(paramFile2))
      throw new IOException("file not renamed " + paramFile1 + " " + paramFile2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.vandalsoftware.io.IoUtils
 * JD-Core Version:    0.6.2
 */