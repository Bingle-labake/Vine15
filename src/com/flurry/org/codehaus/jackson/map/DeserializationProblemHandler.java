package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.JsonProcessingException;
import java.io.IOException;

public abstract class DeserializationProblemHandler
{
  public boolean handleUnknownProperty(DeserializationContext paramDeserializationContext, JsonDeserializer<?> paramJsonDeserializer, Object paramObject, String paramString)
    throws IOException, JsonProcessingException
  {
    return false;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.DeserializationProblemHandler
 * JD-Core Version:    0.6.2
 */