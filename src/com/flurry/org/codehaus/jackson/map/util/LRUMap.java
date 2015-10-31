package com.flurry.org.codehaus.jackson.map.util;

import java.util.LinkedHashMap;
import java.util.Map.Entry;

public class LRUMap<K, V> extends LinkedHashMap<K, V>
{
  protected final int _maxEntries;

  public LRUMap(int paramInt1, int paramInt2)
  {
    super(paramInt1, 0.8F, true);
    this._maxEntries = paramInt2;
  }

  protected boolean removeEldestEntry(Map.Entry<K, V> paramEntry)
  {
    return size() > this._maxEntries;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.util.LRUMap
 * JD-Core Version:    0.6.2
 */