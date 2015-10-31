package com.crashlytics.android;

import android.os.AsyncTask;

public class CrashTest
{
  public void crashAsyncTask(long paramLong)
  {
    new r(this, paramLong).execute(new Void[] { null });
  }

  public void indexOutOfBounds()
  {
    int i = new int[2][10];
    av.b("Out of bounds value: " + i);
  }

  public void stackOverflow()
  {
    stackOverflow();
  }

  public void throwFiveChainedExceptions()
  {
    try
    {
      throw new RuntimeException("1");
    }
    catch (Exception localException1)
    {
      try
      {
        throw new RuntimeException("2", localException1);
      }
      catch (Exception localException2)
      {
        try
        {
          throw new RuntimeException("3", localException2);
        }
        catch (Exception localException3)
        {
          try
          {
            throw new RuntimeException("4", localException3);
          }
          catch (Exception localException4)
          {
            throw new RuntimeException("5", localException4);
          }
        }
      }
    }
  }

  public void throwRuntimeException(String paramString)
  {
    throw new RuntimeException(paramString);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.CrashTest
 * JD-Core Version:    0.6.2
 */