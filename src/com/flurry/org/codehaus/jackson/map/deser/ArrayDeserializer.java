package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.ObjectArrayDeserializer;
import com.flurry.org.codehaus.jackson.map.type.ArrayType;

@Deprecated
public class ArrayDeserializer extends ObjectArrayDeserializer
{
  @Deprecated
  public ArrayDeserializer(ArrayType paramArrayType, JsonDeserializer<Object> paramJsonDeserializer)
  {
    this(paramArrayType, paramJsonDeserializer, null);
  }

  public ArrayDeserializer(ArrayType paramArrayType, JsonDeserializer<Object> paramJsonDeserializer, TypeDeserializer paramTypeDeserializer)
  {
    super(paramArrayType, paramJsonDeserializer, paramTypeDeserializer);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.ArrayDeserializer
 * JD-Core Version:    0.6.2
 */