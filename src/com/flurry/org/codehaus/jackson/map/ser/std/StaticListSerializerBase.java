package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import java.lang.reflect.Type;
import java.util.Collection;

public abstract class StaticListSerializerBase<T extends Collection<?>> extends SerializerBase<T>
{
  protected final BeanProperty _property;

  protected StaticListSerializerBase(Class<?> paramClass, BeanProperty paramBeanProperty)
  {
    super(paramClass, false);
    this._property = paramBeanProperty;
  }

  protected abstract JsonNode contentSchema();

  public JsonNode getSchema(SerializerProvider paramSerializerProvider, Type paramType)
  {
    ObjectNode localObjectNode = createSchemaNode("array", true);
    localObjectNode.put("items", contentSchema());
    return localObjectNode;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.StaticListSerializerBase
 * JD-Core Version:    0.6.2
 */