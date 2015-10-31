package com.flurry.org.codehaus.jackson.map.type;

public final class ClassKey
  implements Comparable<ClassKey>
{
  private Class<?> _class;
  private String _className;
  private int _hashCode;

  public ClassKey()
  {
    this._class = null;
    this._className = null;
    this._hashCode = 0;
  }

  public ClassKey(Class<?> paramClass)
  {
    this._class = paramClass;
    this._className = paramClass.getName();
    this._hashCode = this._className.hashCode();
  }

  public int compareTo(ClassKey paramClassKey)
  {
    return this._className.compareTo(paramClassKey._className);
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    do
    {
      return true;
      if (paramObject == null)
        return false;
      if (paramObject.getClass() != getClass())
        return false;
    }
    while (((ClassKey)paramObject)._class == this._class);
    return false;
  }

  public int hashCode()
  {
    return this._hashCode;
  }

  public void reset(Class<?> paramClass)
  {
    this._class = paramClass;
    this._className = paramClass.getName();
    this._hashCode = this._className.hashCode();
  }

  public String toString()
  {
    return this._className;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.type.ClassKey
 * JD-Core Version:    0.6.2
 */