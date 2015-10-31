package com.flurry.org.codehaus.jackson.map.introspect;

import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import java.lang.reflect.Member;

public abstract class AnnotatedMember extends Annotated
{
  protected final AnnotationMap _annotations;

  protected AnnotatedMember(AnnotationMap paramAnnotationMap)
  {
    this._annotations = paramAnnotationMap;
  }

  public final void fixAccess()
  {
    ClassUtil.checkAndFixAccess(getMember());
  }

  protected AnnotationMap getAllAnnotations()
  {
    return this._annotations;
  }

  public abstract Class<?> getDeclaringClass();

  public abstract Member getMember();

  public abstract void setValue(Object paramObject1, Object paramObject2)
    throws UnsupportedOperationException, IllegalArgumentException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMember
 * JD-Core Version:    0.6.2
 */