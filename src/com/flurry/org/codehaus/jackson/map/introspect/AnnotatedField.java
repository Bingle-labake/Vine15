package com.flurry.org.codehaus.jackson.map.introspect;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Type;

public final class AnnotatedField extends AnnotatedMember
{
  protected final Field _field;

  public AnnotatedField(Field paramField, AnnotationMap paramAnnotationMap)
  {
    super(paramAnnotationMap);
    this._field = paramField;
  }

  public void addOrOverride(Annotation paramAnnotation)
  {
    this._annotations.add(paramAnnotation);
  }

  public Field getAnnotated()
  {
    return this._field;
  }

  public <A extends Annotation> A getAnnotation(Class<A> paramClass)
  {
    return this._annotations.get(paramClass);
  }

  public int getAnnotationCount()
  {
    return this._annotations.size();
  }

  public Class<?> getDeclaringClass()
  {
    return this._field.getDeclaringClass();
  }

  public String getFullName()
  {
    return getDeclaringClass().getName() + "#" + getName();
  }

  public Type getGenericType()
  {
    return this._field.getGenericType();
  }

  public Member getMember()
  {
    return this._field;
  }

  public int getModifiers()
  {
    return this._field.getModifiers();
  }

  public String getName()
  {
    return this._field.getName();
  }

  public Class<?> getRawType()
  {
    return this._field.getType();
  }

  public void setValue(Object paramObject1, Object paramObject2)
    throws IllegalArgumentException
  {
    try
    {
      this._field.set(paramObject1, paramObject2);
      return;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new IllegalArgumentException("Failed to setValue() for field " + getFullName() + ": " + localIllegalAccessException.getMessage(), localIllegalAccessException);
    }
  }

  public String toString()
  {
    return "[field " + getName() + ", annotations: " + this._annotations + "]";
  }

  public AnnotatedField withAnnotations(AnnotationMap paramAnnotationMap)
  {
    return new AnnotatedField(this._field, paramAnnotationMap);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.introspect.AnnotatedField
 * JD-Core Version:    0.6.2
 */