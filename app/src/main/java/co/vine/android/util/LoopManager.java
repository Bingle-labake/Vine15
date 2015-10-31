package co.vine.android.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.util.Log;
import co.vine.android.client.AppController;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class LoopManager
{
  private static final boolean DEBUGGABLE = false;
  private static final String TAG = "VineLoopManager";
  private static LoopManager sInstance;
  private Context mContext;
  private Set<String> mFinalRecords;
  private long mLastViewedId;
  private SharedPreferences mPrefs;
  private HashMap<Long, Record> mRecords;

  private LoopManager(Context paramContext)
  {
    this.mPrefs = Util.getDefaultSharedPrefs(paramContext);
    this.mRecords = new HashMap();
    this.mFinalRecords = new HashSet();
    this.mContext = paramContext;
  }

  public static LoopManager get(Context paramContext)
  {
    if (sInstance == null)
      sInstance = new LoopManager(paramContext);
    return sInstance;
  }

  public void addRecord(long paramLong, Record paramRecord)
  {
    this.mRecords.put(Long.valueOf(paramLong), paramRecord);
  }

  public void commit()
  {
    while (true)
    {
      try
      {
        boolean bool = this.mRecords.isEmpty();
        if (bool)
          return;
        Iterator localIterator = this.mRecords.values().iterator();
        if (localIterator.hasNext())
        {
          Record localRecord = (Record)localIterator.next();
          StringBuilder localStringBuilder = new StringBuilder();
          localStringBuilder.append(localRecord.userId).append(':');
          localStringBuilder.append(localRecord.postId).append(':');
          localStringBuilder.append(localRecord.loopCount).append(':');
          localStringBuilder.append(localRecord.timeStamp);
          this.mFinalRecords.add(localStringBuilder.toString());
          continue;
        }
      }
      finally
      {
      }
      if (DEBUGGABLE)
        Log.v("VineLoopManager", "Commiting these loop records:\n" + toString());
      this.mPrefs.edit().putStringSet("pref_loop_count_records", this.mFinalRecords).commit();
      this.mRecords.clear();
      this.mFinalRecords.clear();
    }
  }

  public void increment(long paramLong)
  {
    try
    {
      Record localRecord;
      if (this.mLastViewedId != paramLong)
      {
        localRecord = new Record(AppController.getInstance(this.mContext).getActiveId(), paramLong);
        addRecord(paramLong, localRecord);
      }
      while (true)
      {
        this.mLastViewedId = paramLong;
        localRecord.increment();
        return;
        localRecord = (Record)this.mRecords.get(Long.valueOf(paramLong));
        if (localRecord == null)
        {
          localRecord = new Record(AppController.getInstance(this.mContext).getActiveId(), paramLong);
          addRecord(paramLong, localRecord);
        }
      }
    }
    finally
    {
    }
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = this.mFinalRecords.iterator();
    while (localIterator.hasNext())
      localStringBuilder.append((String)localIterator.next()).append('\n');
    return localStringBuilder.toString();
  }

  private class Record
  {
    public int loopCount;
    public long postId;
    private long timeStamp;
    public long userId;

    public Record(long arg2, long arg4)
    {
      this.userId = ???;
      Object localObject;
      this.postId = localObject;
      this.loopCount = 0;
    }

    public void increment()
    {
      this.loopCount = (1 + this.loopCount);
      this.timeStamp = System.currentTimeMillis();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.LoopManager
 * JD-Core Version:    0.6.2
 */