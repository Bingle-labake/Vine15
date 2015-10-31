package com.flurry.org.codehaus.jackson.map.util;

import java.lang.reflect.Array;

public class Comparators
{
  public static Object getArrayComparator(Object paramObject)
  {
    return new Object()
    {
      public boolean equals(Object paramAnonymousObject)
      {
        if (paramAnonymousObject == this)
          return true;
        if ((paramAnonymousObject == null) || (paramAnonymousObject.getClass() != this.val$defaultValue.getClass()))
          return false;
        if (Array.getLength(paramAnonymousObject) != this.val$length)
          return false;
        int i = 0;
        label42: Object localObject1;
        Object localObject2;
        if (i < this.val$length)
        {
          localObject1 = Array.get(this.val$defaultValue, i);
          localObject2 = Array.get(paramAnonymousObject, i);
          if (localObject1 != localObject2)
            break label78;
        }
        label78: 
        while ((localObject1 == null) || (localObject1.equals(localObject2)))
        {
          i++;
          break label42;
          break;
        }
        return false;
      }
    };
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.util.Comparators
 * JD-Core Version:    0.6.2
 */