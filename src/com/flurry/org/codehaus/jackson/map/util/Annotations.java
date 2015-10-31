package com.flurry.org.codehaus.jackson.map.util;

import java.lang.annotation.Annotation;

public abstract interface Annotations
{
  public abstract <A extends Annotation> A get(Class<A> paramClass);

  public abstract int size();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.util.Annotations
 * JD-Core Version:    0.6.2
 */