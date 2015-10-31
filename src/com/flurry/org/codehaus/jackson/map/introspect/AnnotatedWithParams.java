package com.flurry.org.codehaus.jackson.map.introspect;

import com.flurry.org.codehaus.jackson.map.type.TypeBindings;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;

public abstract class AnnotatedWithParams extends AnnotatedMember
{
  protected final AnnotationMap[] _paramAnnotations;

  protected AnnotatedWithParams(AnnotationMap paramAnnotationMap, AnnotationMap[] paramArrayOfAnnotationMap)
  {
    super(paramAnnotationMap);
    this._paramAnnotations = paramArrayOfAnnotationMap;
  }

  public final void addIfNotPresent(Annotation paramAnnotation)
  {
    this._annotations.addIfNotPresent(paramAnnotation);
  }

  public final void addOrOverride(Annotation paramAnnotation)
  {
    this._annotations.add(paramAnnotation);
  }

  public final void addOrOverrideParam(int paramInt, Annotation paramAnnotation)
  {
    AnnotationMap localAnnotationMap = this._paramAnnotations[paramInt];
    if (localAnnotationMap == null)
    {
      localAnnotationMap = new AnnotationMap();
      this._paramAnnotations[paramInt] = localAnnotationMap;
    }
    localAnnotationMap.add(paramAnnotation);
  }

  public abstract Object call()
    throws Exception;

  public abstract Object call(Object[] paramArrayOfObject)
    throws Exception;

  public abstract Object call1(Object paramObject)
    throws Exception;

  public final <A extends Annotation> A getAnnotation(Class<A> paramClass)
  {
    return this._annotations.get(paramClass);
  }

  public final int getAnnotationCount()
  {
    return this._annotations.size();
  }

  public final AnnotatedParameter getParameter(int paramInt)
  {
    return new AnnotatedParameter(this, getParameterType(paramInt), this._paramAnnotations[paramInt], paramInt);
  }

  public final AnnotationMap getParameterAnnotations(int paramInt)
  {
    if ((this._paramAnnotations != null) && (paramInt >= 0) && (paramInt <= this._paramAnnotations.length))
      return this._paramAnnotations[paramInt];
    return null;
  }

  public abstract Class<?> getParameterClass(int paramInt);

  public abstract int getParameterCount();

  public abstract Type getParameterType(int paramInt);

  protected JavaType getType(TypeBindings paramTypeBindings, TypeVariable<?>[] paramArrayOfTypeVariable)
  {
    if ((paramArrayOfTypeVariable != null) && (paramArrayOfTypeVariable.length > 0))
    {
      paramTypeBindings = paramTypeBindings.childInstance();
      int i = paramArrayOfTypeVariable.length;
      int j = 0;
      if (j < i)
      {
        TypeVariable<?> localTypeVariable = paramArrayOfTypeVariable[j];
        paramTypeBindings._addPlaceholder(localTypeVariable.getName());
        Type localType = localTypeVariable.getBounds()[0];
        if (localType == null);
        for (JavaType localJavaType = TypeFactory.unknownType(); ; localJavaType = paramTypeBindings.resolveType(localType))
        {
          paramTypeBindings.addBinding(localTypeVariable.getName(), localJavaType);
          j++;
          break;
        }
      }
    }
    return paramTypeBindings.resolveType(getGenericType());
  }

  protected AnnotatedParameter replaceParameterAnnotations(int paramInt, AnnotationMap paramAnnotationMap)
  {
    this._paramAnnotations[paramInt] = paramAnnotationMap;
    return getParameter(paramInt);
  }

  public final JavaType resolveParameterType(int paramInt, TypeBindings paramTypeBindings)
  {
    return paramTypeBindings.resolveType(getParameterType(paramInt));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.introspect.AnnotatedWithParams
 * JD-Core Version:    0.6.2
 */