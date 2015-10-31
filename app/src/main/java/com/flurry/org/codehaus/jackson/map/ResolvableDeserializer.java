package com.flurry.org.codehaus.jackson.map;

public abstract interface ResolvableDeserializer
{
  public abstract void resolve(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider)
    throws JsonMappingException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ResolvableDeserializer
 * JD-Core Version:    0.6.2
 */