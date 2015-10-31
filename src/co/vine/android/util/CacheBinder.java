package co.vine.android.util;

import android.os.Binder;
import android.support.v4.util.LruCache;

public class CacheBinder<K, V> extends Binder
{
  public final LruCache<K, V> cache;

  public CacheBinder(LruCache<K, V> paramLruCache)
  {
    this.cache = paramLruCache;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.CacheBinder
 * JD-Core Version:    0.6.2
 */