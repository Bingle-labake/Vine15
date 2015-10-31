package com.fasterxml.jackson.core;

public class JsonGenerationException extends JsonProcessingException
{
  private static final long serialVersionUID = 123L;

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
 * Qualified Name:     com.fasterxml.jackson.core.JsonGenerationException
 * JD-Core Version:    0.6.2
 */