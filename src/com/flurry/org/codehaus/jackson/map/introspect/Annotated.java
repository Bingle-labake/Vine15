package com.flurry.org.codehaus.jackson.map.introspect;

import com.flurry.org.codehaus.jackson.map.type.TypeBindings;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;

public abstract class Annotated
{
  protected abstract AnnotationMap getAllAnnotations();

  public abstract AnnotatedElement getAnnotated();

  public abstract <A extends Annotation> A getAnnotation(Class<A> paramClass);

  public abstract Type getGenericType();

  protected abstract int getModifiers();

  public abstract String getName();

  public abstract Class<?> getRawType();

  public JavaType getType(TypeBindings paramTypeBindings)
  {
    return paramTypeBindings.resolveType(getGenericType());
  }

  public final <A extends Annotation> boolean hasAnnotation(Class<A> paramClass)
  {
    return getAnnotation(paramClass) != null;
  }

  public final boolean isPublic()
  {
    return Modifier.isPublic(getModifiers());
  }

  public abstract Annotated withAnnotations(AnnotationMap paramAnnotationMap);

  public final Annotated withFallBackAnnotationsFrom(Annotated paramAnnotated)
  {
    return withAnnotations(AnnotationMap.merge(getAllAnnotations(), paramAnnotated.getAllAnnotations()));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.introspect.Annotated
 * JD-Core Version:    0.6.2
 */