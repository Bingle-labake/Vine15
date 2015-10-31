package co.vine.android.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class FlexibleStringHashMap<K, V> extends HashMap<K, V>
{
  private static final long serialVersionUID = -1378998403357321549L;

  public V get(Object paramObject)
  {
    if ((paramObject instanceof String))
    {
      Object localObject1 = super.get(paramObject);
      if (localObject1 != null)
        return localObject1;
      Iterator localIterator = keySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject2 = localIterator.next();
        if (((String)paramObject).contains((CharSequence)localObject2))
          return super.get(localObject2);
      }
      return null;
    }
    return super.get(paramObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.FlexibleStringHashMap
 * JD-Core Version:    0.6.2
 */