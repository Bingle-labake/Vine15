package com.flurry.org.codehaus.jackson.map;

public class RuntimeJsonMappingException extends RuntimeException
{
  public RuntimeJsonMappingException(JsonMappingException paramJsonMappingException)
  {
    super(paramJsonMappingException);
  }

  public RuntimeJsonMappingException(String paramString)
  {
    super(paramString);
  }

  public RuntimeJsonMappingException(String paramString, JsonMappingException paramJsonMappingException)
  {
    super(paramString, paramJsonMappingException);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.RuntimeJsonMappingException
 * JD-Core Version:    0.6.2
 */