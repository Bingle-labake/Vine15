package com.fasterxml.jackson.core.type;

public abstract class ResolvedType
{
  public abstract ResolvedType containedType(int paramInt);

  public abstract int containedTypeCount();

  public abstract String containedTypeName(int paramInt);

  public abstract ResolvedType getContentType();

  public abstract ResolvedType getKeyType();

  public abstract Class<?> getRawClass();

  public abstract boolean hasGenericTypes();

  public abstract boolean hasRawClass(Class<?> paramClass);

  public abstract boolean isAbstract();

  public abstract boolean isArrayType();

  public abstract boolean isCollectionLikeType();

  public abstract boolean isConcrete();

  public abstract boolean isContainerType();

  public abstract boolean isEnumType();

  public abstract boolean isFinal();

  public abstract boolean isInterface();

  public abstract boolean isMapLikeType();

  public abstract boolean isPrimitive();

  public abstract boolean isThrowable();

  public abstract String toCanonical();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.type.ResolvedType
 * JD-Core Version:    0.6.2
 */