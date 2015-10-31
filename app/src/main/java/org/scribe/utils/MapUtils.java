package org.scribe.utils;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class MapUtils
{
  public static <K, V> String toString(Map<K, V> paramMap)
  {
    if (paramMap == null)
      return "";
    if (paramMap.isEmpty())
      return "{}";
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = localEntry.getKey().toString();
      arrayOfObject[1] = localEntry.getValue().toString();
      localStringBuilder.append(String.format(", %s -> %s ", arrayOfObject));
    }
    return "{" + localStringBuilder.substring(1) + "}";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.utils.MapUtils
 * JD-Core Version:    0.6.2
 */