package co.vine.android.util;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.util.LruCache;
import android.text.TextUtils;
import android.util.Log;
import co.vine.android.client.VineAPI;
import co.vine.android.network.HttpOperation;
import co.vine.android.network.HttpOperationReader;
import co.vine.android.network.HttpResult;
import co.vine.android.network.ThreadedHttpOperationClient;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public abstract class UrlResourceCache<K, V extends UrlResource<T>, T>
{
  protected static final int IO_BUFFER_SIZE = 4096;
  protected static final boolean LOGGABLE = false;
  static final long NEXT_REQUEST_INTERVAL = 60000L;
  private static final long POST_DELAY_MILLIS = 100L;
  protected static final String TAG = "ResourceCache";
  protected static final ExecutorService sExecutor = Executors.newSingleThreadExecutor();
  private static final Handler sMainHandler = new Handler(Looper.getMainLooper());
  private CacheBinder<K, V> mCacheBinder;
  protected final Context mContext;
  final int[] mLock = new int[0];
  protected final LinkedHashMap<K, PendingRes> mPendingDownload;
  protected final HashMap<K, PendingRes> mQueuedDownload;
  private final LruCache<K, V> mResourceCache;

  public UrlResourceCache(Context paramContext, int paramInt)
  {
    this.mContext = paramContext.getApplicationContext();
    this.mPendingDownload = new LinkedHashMap(20, 10.0F, true);
    this.mQueuedDownload = new HashMap(20, 10.0F);
    if (paramInt > 0)
    {
      this.mResourceCache = new MemoryLruCache(paramInt);
      return;
    }
    this.mResourceCache = null;
  }

  private V queueResourceLoad(long paramLong, K paramK, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      if (paramBoolean2)
        return loadResource(paramLong, paramK, paramString);
      synchronized (this.mLock)
      {
        if (!this.mPendingDownload.containsKey(paramK))
        {
          PendingRes localPendingRes = new PendingRes(paramString, paramBoolean1);
          this.mPendingDownload.put(paramK, localPendingRes);
          this.mQueuedDownload.put(paramK, localPendingRes);
          sMainHandler.postDelayed(new QueueRunnable(paramLong), 100L);
        }
      }
    }
    return null;
  }

  public int cancel(K paramK)
  {
    synchronized (this.mLock)
    {
      if ((PendingRes)this.mQueuedDownload.remove(paramK) != null)
      {
        this.mPendingDownload.remove(paramK);
        return 1;
      }
      return 0;
    }
  }

  public int cancel(List<K> paramList)
  {
    int i = 0;
    synchronized (this.mLock)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
        i += cancel(localIterator.next());
      return i;
    }
  }

  public void clear()
  {
    if (this.mResourceCache != null)
      synchronized (this.mResourceCache)
      {
        this.mResourceCache.evictAll();
      }
    synchronized (this.mLock)
    {
      this.mPendingDownload.clear();
      return;
      localObject2 = finally;
      throw localObject2;
    }
  }

  protected final V get(long paramLong, K paramK, String paramString, boolean paramBoolean)
  {
    return get(paramLong, paramK, paramString, paramBoolean, false);
  }

  protected final V get(long paramLong, K paramK, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    Object localObject1;
    if (paramString == null)
    {
      localObject1 = null;
      return localObject1;
    }
    if (LOGGABLE)
      Log.d("ResourceCache", "Url: " + paramString);
    if (this.mResourceCache != null);
    while (true)
    {
      synchronized (this.mResourceCache)
      {
        localObject1 = (UrlResource)this.mResourceCache.get(paramK);
        if (localObject1 == null)
          break label177;
        if (LOGGABLE)
          Log.d("ResourceCache", "Have resource: " + ((UrlResource)localObject1).url);
        if ((((UrlResource)localObject1).url.equals(paramString)) && ((((UrlResource)localObject1).nextRequestTime <= 0L) || (((UrlResource)localObject1).nextRequestTime >= System.currentTimeMillis())))
          break;
        return queueResourceLoad(paramLong, paramK, paramString, paramBoolean1, paramBoolean2);
      }
      localObject1 = null;
    }
    label177: if (LOGGABLE)
      Log.d("ResourceCache", "Looking in persistent storage: " + paramString);
    return queueResourceLoad(paramLong, paramK, paramString, paramBoolean1, paramBoolean2);
  }

  public CacheBinder<K, V> getCacheBinder()
  {
    if (this.mResourceCache != null)
      synchronized (this.mResourceCache)
      {
        if (this.mCacheBinder == null)
          this.mCacheBinder = new CacheBinder(this.mResourceCache);
        return this.mCacheBinder;
      }
    return null;
  }

  protected abstract V instantiateResource(K paramK, String paramString, T paramT);

  protected abstract V loadResource(long paramLong, K paramK, String paramString);

  protected abstract V obtainResource(K paramK, String paramString, InputStream paramInputStream);

  protected abstract void onResourceError(K paramK, HttpResult paramHttpResult);

  protected abstract void onResourceLoaded(HashMap<K, V> paramHashMap);

  public V peek(K paramK)
  {
    if (this.mResourceCache != null)
      synchronized (this.mResourceCache)
      {
        UrlResource localUrlResource = (UrlResource)this.mResourceCache.get(paramK);
        return localUrlResource;
      }
    return null;
  }

  public V put(K paramK, V paramV)
  {
    if (this.mResourceCache != null)
      synchronized (this.mResourceCache)
      {
        UrlResource localUrlResource = (UrlResource)this.mResourceCache.put(paramK, paramV);
        return localUrlResource;
      }
    return null;
  }

  public V remove(K paramK)
  {
    if (this.mResourceCache != null)
      synchronized (this.mResourceCache)
      {
        UrlResource localUrlResource = (UrlResource)this.mResourceCache.remove(paramK);
        return localUrlResource;
      }
    return null;
  }

  protected abstract V saveResource(long paramLong, K paramK, String paramString, InputStream paramInputStream);

  public Map<K, V> snapShot()
  {
    return this.mResourceCache.snapshot();
  }

  void urlResourceLoaded(HashMap<K, V> paramHashMap)
  {
    if (paramHashMap.isEmpty())
      return;
    Iterator localIterator = paramHashMap.entrySet().iterator();
    if (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object localObject1 = localEntry.getKey();
      UrlResource localUrlResource = (UrlResource)localEntry.getValue();
      if ((this.mResourceCache != null) && (localUrlResource != null));
      synchronized (this.mResourceCache)
      {
        while (true)
        {
          this.mResourceCache.put(localObject1, localUrlResource);
          synchronized (this.mLock)
          {
            this.mPendingDownload.remove(localObject1);
          }
        }
      }
    }
    onResourceLoaded(paramHashMap);
  }

  private class FetchRunnable
    implements Runnable
  {
    private final long mOwnerId;
    private final HashMap<K, UrlResourceCache.PendingRes> mWorkQueue;

    public FetchRunnable(HashMap<K, UrlResourceCache.PendingRes> arg3)
    {
      Object localObject1;
      this.mOwnerId = localObject1;
      Object localObject2;
      this.mWorkQueue = localObject2;
    }

    public void run()
    {
      HashMap localHashMap1 = this.mWorkQueue;
      if (UrlResourceCache.LOGGABLE)
        Log.d("ResourceCache", "Queueing " + localHashMap1.size());
      if (!localHashMap1.isEmpty())
      {
        HashMap localHashMap2 = new HashMap(localHashMap1.size());
        ThreadedHttpOperationClient localThreadedHttpOperationClient = ThreadedHttpOperationClient.getInstance(UrlResourceCache.this.mContext);
        Iterator localIterator = localHashMap1.entrySet().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          Object localObject = localEntry.getKey();
          UrlResourceCache.PendingRes localPendingRes = (UrlResourceCache.PendingRes)localEntry.getValue();
          String str = localPendingRes.url;
          UrlResource localUrlResource = UrlResourceCache.this.loadResource(this.mOwnerId, localObject, str);
          if (localUrlResource != null)
          {
            localHashMap2.put(localObject, localUrlResource);
          }
          else
          {
            if (UrlResourceCache.LOGGABLE)
              Log.d("ResourceCache", "Fetch " + str);
            if (Util.parseURI(str) != null)
            {
              UrlResourceCache.ResourceHttpOperationReader localResourceHttpOperationReader = new UrlResourceCache.ResourceHttpOperationReader(UrlResourceCache.this, this.mOwnerId, localObject, str, localPendingRes.persist);
              if (HttpOperation.createResourceGetRequest(localThreadedHttpOperationClient, new StringBuilder(str), VineAPI.getInstance(UrlResourceCache.this.mContext), localResourceHttpOperationReader).execute().isOK())
                localUrlResource = localResourceHttpOperationReader.getResultResource();
              if (localUrlResource == null)
              {
                localUrlResource = UrlResourceCache.this.instantiateResource(localObject, str, null);
                localUrlResource.nextRequestTime = (60000L + System.currentTimeMillis());
              }
              localHashMap2.put(localObject, localUrlResource);
            }
          }
        }
        UrlResourceCache.sMainHandler.post(new UrlResourceCache.ResultRunnable(UrlResourceCache.this, localHashMap2));
      }
    }
  }

  private static class MemoryLruCache<K, V extends UrlResource> extends LruCache<K, V>
  {
    public MemoryLruCache(int paramInt)
    {
      super();
    }

    protected int sizeOf(K paramK, V paramV)
    {
      return paramV.size();
    }
  }

  private static class PendingRes
  {
    final boolean persist;
    final String url;

    public PendingRes(String paramString, boolean paramBoolean)
    {
      this.url = paramString;
      this.persist = paramBoolean;
    }
  }

  private class QueueRunnable
    implements Runnable
  {
    private final long mOwnerId;

    public QueueRunnable(long arg2)
    {
      Object localObject;
      this.mOwnerId = localObject;
    }

    public void run()
    {
      synchronized (UrlResourceCache.this.mLock)
      {
        if (UrlResourceCache.this.mQueuedDownload.isEmpty())
          return;
        HashMap localHashMap = new HashMap(UrlResourceCache.this.mQueuedDownload.size());
        localHashMap.putAll(UrlResourceCache.this.mQueuedDownload);
        UrlResourceCache.this.mQueuedDownload.clear();
        UrlResourceCache.sExecutor.execute(new UrlResourceCache.FetchRunnable(UrlResourceCache.this, this.mOwnerId, localHashMap));
        return;
      }
    }
  }

  private class ResourceHttpOperationReader
    implements HttpOperationReader
  {
    private final K mKey;
    private final long mOwnerId;
    private final boolean mPersist;
    private V mResource = null;
    private final String mUrl;

    public ResourceHttpOperationReader(K paramBoolean, String arg4, boolean arg5)
    {
      this.mOwnerId = paramString;
      Object localObject1;
      this.mKey = localObject1;
      Object localObject2;
      this.mUrl = localObject2;
      boolean bool;
      this.mPersist = bool;
    }

    public final V getResultResource()
    {
      return this.mResource;
    }

    public void onHandleError(HttpResult paramHttpResult)
    {
      UrlResourceCache.this.onResourceError(this.mKey, paramHttpResult);
    }

    public final void readInput(int paramInt1, int paramInt2, InputStream paramInputStream)
      throws IOException
    {
      if (this.mPersist)
      {
        this.mResource = UrlResourceCache.this.saveResource(this.mOwnerId, this.mKey, this.mUrl, paramInputStream);
        return;
      }
      this.mResource = UrlResourceCache.this.obtainResource(this.mKey, this.mUrl, paramInputStream);
    }
  }

  private class ResultRunnable
    implements Runnable
  {
    private final HashMap<K, V> mResult;

    public ResultRunnable()
    {
      Object localObject;
      this.mResult = localObject;
    }

    public void run()
    {
      UrlResourceCache.this.urlResourceLoaded(this.mResult);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.UrlResourceCache
 * JD-Core Version:    0.6.2
 */