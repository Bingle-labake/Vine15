package com.flurry.org.codehaus.jackson.map.util;

import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.map.JsonSerializableWithType;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;

public class JSONPObject
  implements JsonSerializableWithType
{
  protected final String _function;
  protected final JavaType _serializationType;
  protected final Object _value;

  public JSONPObject(String paramString, Object paramObject)
  {
    this(paramString, paramObject, (JavaType)null);
  }

  public JSONPObject(String paramString, Object paramObject, JavaType paramJavaType)
  {
    this._function = paramString;
    this._value = paramObject;
    this._serializationType = paramJavaType;
  }

  @Deprecated
  public JSONPObject(String paramString, Object paramObject, Class<?> paramClass)
  {
    this._function = paramString;
    this._value = paramObject;
    if (paramClass == null);
    for (JavaType localJavaType = null; ; localJavaType = TypeFactory.defaultInstance().constructType(paramClass))
    {
      this._serializationType = localJavaType;
      return;
    }
  }

  public String getFunction()
  {
    return this._function;
  }

  public JavaType getSerializationType()
  {
    return this._serializationType;
  }

  public Object getValue()
  {
    return this._value;
  }

  public void serialize(JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonProcessingException
  {
    paramJsonGenerator.writeRaw(this._function);
    paramJsonGenerator.writeRaw('(');
    if (this._value == null)
      paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
    while (true)
    {
      paramJsonGenerator.writeRaw(')');
      return;
      if (this._serializationType != null)
        paramSerializerProvider.findTypedValueSerializer(this._serializationType, true, null).serialize(this._value, paramJsonGenerator, paramSerializerProvider);
      else
        paramSerializerProvider.findTypedValueSerializer(this._value.getClass(), true, null).serialize(this._value, paramJsonGenerator, paramSerializerProvider);
    }
  }

  public void serializeWithType(JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, TypeSerializer paramTypeSerializer)
    throws IOException, JsonProcessingException
  {
    serialize(paramJsonGenerator, paramSerializerProvider);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.util.JSONPObject
 * JD-Core Version:    0.6.2
 */