package com.flurry.org.codehaus.jackson.map.exc;

import com.flurry.org.codehaus.jackson.JsonLocation;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;

public class UnrecognizedPropertyException extends JsonMappingException
{
  private static final long serialVersionUID = 1L;
  protected final Class<?> _referringClass;
  protected final String _unrecognizedPropertyName;

  public UnrecognizedPropertyException(String paramString1, JsonLocation paramJsonLocation, Class<?> paramClass, String paramString2)
  {
    super(paramString1, paramJsonLocation);
    this._referringClass = paramClass;
    this._unrecognizedPropertyName = paramString2;
  }

  public static UnrecognizedPropertyException from(JsonParser paramJsonParser, Object paramObject, String paramString)
  {
    if (paramObject == null)
      throw new IllegalArgumentException();
    if ((paramObject instanceof Class));
    for (Class localClass = (Class)paramObject; ; localClass = paramObject.getClass())
    {
      UnrecognizedPropertyException localUnrecognizedPropertyException = new UnrecognizedPropertyException("Unrecognized field \"" + paramString + "\" (Class " + localClass.getName() + "), not marked as ignorable", paramJsonParser.getCurrentLocation(), localClass, paramString);
      localUnrecognizedPropertyException.prependPath(paramObject, paramString);
      return localUnrecognizedPropertyException;
    }
  }

  public Class<?> getReferringClass()
  {
    return this._referringClass;
  }

  public String getUnrecognizedPropertyName()
  {
    return this._unrecognizedPropertyName;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.exc.UnrecognizedPropertyException
 * JD-Core Version:    0.6.2
 */