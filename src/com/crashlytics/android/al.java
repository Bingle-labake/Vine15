package com.crashlytics.android;

import android.content.Context;
import android.util.Log;
import java.io.File;
import java.io.FilenameFilter;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

final class al
{
  static final Map<String, String> a = Collections.singletonMap("X-CRASHLYTICS-INVALID-SESSION", "1");
  private static final FilenameFilter b = new am();
  private static final short[] c = { 10, 20, 30, 60, 120, 300 };
  private final Object d = new Object();
  private final Y e;
  private Thread f;

  public al(Y paramY)
  {
    if (paramY == null)
      throw new IllegalArgumentException("createReportCall must not be null.");
    this.e = paramY;
  }

  final List<ak> a()
  {
    int i = 0;
    av.b("Checking for crash reports...");
    while (true)
    {
      LinkedList localLinkedList;
      synchronized (this.d)
      {
        File[] arrayOfFile1 = Crashlytics.h().listFiles(b);
        File localFile1 = Crashlytics.getInstance().m().b();
        if (!localFile1.exists())
          break label227;
        arrayOfFile2 = localFile1.listFiles(n.a);
        localLinkedList = new LinkedList();
        int j = arrayOfFile1.length;
        int k = 0;
        if (k < j)
        {
          File localFile3 = arrayOfFile1[k];
          av.b("Found crash report " + localFile3.getPath());
          localLinkedList.add(new ak(localFile3));
          k++;
        }
      }
      if (arrayOfFile2 != null)
      {
        int m = arrayOfFile2.length;
        while (i < m)
        {
          File localFile2 = arrayOfFile2[i];
          av.b("Found invalid crash file " + localFile2.getPath());
          localLinkedList.add(new ak(localFile2, a));
          i++;
        }
      }
      if (localLinkedList.size() == 0)
        av.b("No reports found.");
      return localLinkedList;
      label227: File[] arrayOfFile2 = null;
    }
  }

  public final void a(Context paramContext, float paramFloat)
  {
    try
    {
      if (this.f == null)
      {
        this.f = new Thread(new an(this, paramContext, paramFloat), "Crashlytics Report Uploader");
        this.f.start();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  final boolean a(ak paramak)
  {
    synchronized (this.d)
    {
      try
      {
        av.d();
        X localX = new X(Crashlytics.g(), paramak);
        boolean bool2 = this.e.a(localX);
        StringBuilder localStringBuilder = new StringBuilder("Crashlytics report upload ");
        if (bool2);
        for (String str = "complete: "; ; str = "FAILED: ")
        {
          Log.d("Crashlytics", str + paramak.b());
          bool1 = false;
          if (bool2)
          {
            paramak.a();
            bool1 = true;
          }
          return bool1;
        }
      }
      catch (Exception localException)
      {
        while (true)
        {
          av.a("Error occurred sending report " + paramak, localException);
          boolean bool1 = false;
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.al
 * JD-Core Version:    0.6.2
 */