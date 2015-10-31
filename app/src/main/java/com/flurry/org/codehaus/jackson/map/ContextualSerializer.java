package com.flurry.org.codehaus.jackson.map;

public abstract interface ContextualSerializer<T>
{
  public abstract JsonSerializer<T> createContextual(SerializationConfig paramSerializationConfig, BeanProperty paramBeanProperty)
    throws JsonMappingException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ContextualSerializer
 * JD-Core Version:    0.6.2
 */