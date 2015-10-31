package com.flurry.org.codehaus.jackson;

public class JsonParseException extends JsonProcessingException
{
  static final long serialVersionUID = 123L;

  public JsonParseException(String paramString, JsonLocation paramJsonLocation)
  {
    super(paramString, paramJsonLocation);
  }

  public JsonParseException(String paramString, JsonLocation paramJsonLocation, Throwable paramThrowable)
  {
    super(paramString, paramJsonLocation, paramThrowable);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.JsonParseException
 * JD-Core Version:    0.6.2
 */