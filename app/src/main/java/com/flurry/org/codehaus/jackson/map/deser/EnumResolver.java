package com.flurry.org.codehaus.jackson.map.deser;

import java.util.HashMap;

@Deprecated
public final class EnumResolver<T extends Enum<T>> extends com.flurry.org.codehaus.jackson.map.util.EnumResolver<T>
{
  private EnumResolver(Class<T> paramClass, T[] paramArrayOfT, HashMap<String, T> paramHashMap)
  {
    super(paramClass, paramArrayOfT, paramHashMap);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.EnumResolver
 * JD-Core Version:    0.6.2
 */