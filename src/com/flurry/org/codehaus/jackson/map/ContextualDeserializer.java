package com.flurry.org.codehaus.jackson.map;

public abstract interface ContextualDeserializer<T>
{
  public abstract JsonDeserializer<T> createContextual(DeserializationConfig paramDeserializationConfig, BeanProperty paramBeanProperty)
    throws JsonMappingException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ContextualDeserializer
 * JD-Core Version:    0.6.2
 */