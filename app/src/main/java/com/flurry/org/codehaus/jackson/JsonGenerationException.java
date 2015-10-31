package com.flurry.org.codehaus.jackson;

public class JsonGenerationException extends JsonProcessingException
{
  static final long serialVersionUID = 123L;

  public JsonGenerationException(String paramString)
  {
    super(paramString, (JsonLocation)null);
  }

  public JsonGenerationException(String paramString, Throwable paramThrowable)
  {
    super(paramString, (JsonLocation)null, paramThrowable);
  }

  public JsonGenerationException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.JsonGenerationException
 * JD-Core Version:    0.6.2
 */