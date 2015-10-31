package com.flurry.org.codehaus.jackson.map.jsontype;

public final class NamedType
{
  protected final Class<?> _class;
  protected final int _hashCode;
  protected String _name;

  public NamedType(Class<?> paramClass)
  {
    this(paramClass, null);
  }

  public NamedType(Class<?> paramClass, String paramString)
  {
    this._class = paramClass;
    this._hashCode = paramClass.getName().hashCode();
    setName(paramString);
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
    while (this._class == ((NamedType)paramObject)._class);
    return false;
  }

  public String getName()
  {
    return this._name;
  }

  public Class<?> getType()
  {
    return this._class;
  }

  public boolean hasName()
  {
    return this._name != null;
  }

  public int hashCode()
  {
    return this._hashCode;
  }

  public void setName(String paramString)
  {
    if ((paramString == null) || (paramString.length() == 0))
      paramString = null;
    this._name = paramString;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder().append("[NamedType, class ").append(this._class.getName()).append(", name: ");
    if (this._name == null);
    for (String str = "null"; ; str = "'" + this._name + "'")
      return str + "]";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.jsontype.NamedType
 * JD-Core Version:    0.6.2
 */