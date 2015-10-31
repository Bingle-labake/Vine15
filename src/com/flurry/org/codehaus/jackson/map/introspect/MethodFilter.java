package com.flurry.org.codehaus.jackson.map.introspect;

import java.lang.reflect.Method;

public abstract interface MethodFilter
{
  public abstract boolean includeMethod(Method paramMethod);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.introspect.MethodFilter
 * JD-Core Version:    0.6.2
 */