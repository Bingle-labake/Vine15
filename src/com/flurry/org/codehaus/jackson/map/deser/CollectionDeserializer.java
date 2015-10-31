package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.lang.reflect.Constructor;
import java.util.Collection;

@Deprecated
public class CollectionDeserializer extends com.flurry.org.codehaus.jackson.map.deser.std.CollectionDeserializer
{
  protected CollectionDeserializer(CollectionDeserializer paramCollectionDeserializer)
  {
    super(paramCollectionDeserializer);
  }

  public CollectionDeserializer(JavaType paramJavaType, JsonDeserializer<Object> paramJsonDeserializer, TypeDeserializer paramTypeDeserializer, ValueInstantiator paramValueInstantiator)
  {
    super(paramJavaType, paramJsonDeserializer, paramTypeDeserializer, paramValueInstantiator);
  }

  @Deprecated
  public CollectionDeserializer(JavaType paramJavaType, JsonDeserializer<Object> paramJsonDeserializer, TypeDeserializer paramTypeDeserializer, Constructor<Collection<Object>> paramConstructor)
  {
    super(paramJavaType, paramJsonDeserializer, paramTypeDeserializer, paramConstructor);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.CollectionDeserializer
 * JD-Core Version:    0.6.2
 */