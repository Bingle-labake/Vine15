package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMethod;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.lang.reflect.Method;

public final class SettableAnyProperty
{
  protected final BeanProperty _property;
  protected final Method _setter;
  protected final JavaType _type;
  protected JsonDeserializer<Object> _valueDeserializer;

  @Deprecated
  public SettableAnyProperty(BeanProperty paramBeanProperty, AnnotatedMethod paramAnnotatedMethod, JavaType paramJavaType)
  {
    this(paramBeanProperty, paramAnnotatedMethod, paramJavaType, null);
  }

  public SettableAnyProperty(BeanProperty paramBeanProperty, AnnotatedMethod paramAnnotatedMethod, JavaType paramJavaType, JsonDeserializer<Object> paramJsonDeserializer)
  {
    this(paramBeanProperty, paramAnnotatedMethod.getAnnotated(), paramJavaType, paramJsonDeserializer);
  }

  public SettableAnyProperty(BeanProperty paramBeanProperty, Method paramMethod, JavaType paramJavaType, JsonDeserializer<Object> paramJsonDeserializer)
  {
    this._property = paramBeanProperty;
    this._type = paramJavaType;
    this._setter = paramMethod;
    this._valueDeserializer = paramJsonDeserializer;
  }

  private String getClassName()
  {
    return this._setter.getDeclaringClass().getName();
  }

  protected void _throwAsIOE(Exception paramException, String paramString, Object paramObject)
    throws IOException
  {
    if ((paramException instanceof IllegalArgumentException))
    {
      String str1;
      StringBuilder localStringBuilder;
      if (paramObject == null)
      {
        str1 = "[NULL]";
        localStringBuilder = new StringBuilder("Problem deserializing \"any\" property '").append(paramString);
        localStringBuilder.append("' of class " + getClassName() + " (expected type: ").append(this._type);
        localStringBuilder.append("; actual type: ").append(str1).append(")");
        String str2 = paramException.getMessage();
        if (str2 == null)
          break label139;
        localStringBuilder.append(", problem: ").append(str2);
      }
      while (true)
      {
        throw new JsonMappingException(localStringBuilder.toString(), null, paramException);
        str1 = paramObject.getClass().getName();
        break;
        label139: localStringBuilder.append(" (no error message provided)");
      }
    }
    if ((paramException instanceof IOException))
      throw ((IOException)paramException);
    if ((paramException instanceof RuntimeException))
      throw ((RuntimeException)paramException);
    for (Object localObject = paramException; ((Throwable)localObject).getCause() != null; localObject = ((Throwable)localObject).getCause());
    throw new JsonMappingException(((Throwable)localObject).getMessage(), null, (Throwable)localObject);
  }

  public final Object deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (paramJsonParser.getCurrentToken() == JsonToken.VALUE_NULL)
      return null;
    return this._valueDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
  }

  public final void deserializeAndSet(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject, String paramString)
    throws IOException, JsonProcessingException
  {
    set(paramObject, paramString, deserialize(paramJsonParser, paramDeserializationContext));
  }

  public BeanProperty getProperty()
  {
    return this._property;
  }

  public JavaType getType()
  {
    return this._type;
  }

  public boolean hasValueDeserializer()
  {
    return this._valueDeserializer != null;
  }

  public final void set(Object paramObject1, String paramString, Object paramObject2)
    throws IOException
  {
    try
    {
      this._setter.invoke(paramObject1, new Object[] { paramString, paramObject2 });
      return;
    }
    catch (Exception localException)
    {
      _throwAsIOE(localException, paramString, paramObject2);
    }
  }

  @Deprecated
  public void setValueDeserializer(JsonDeserializer<Object> paramJsonDeserializer)
  {
    if (this._valueDeserializer != null)
      throw new IllegalStateException("Already had assigned deserializer for SettableAnyProperty");
    this._valueDeserializer = paramJsonDeserializer;
  }

  public String toString()
  {
    return "[any property on class " + getClassName() + "]";
  }

  public SettableAnyProperty withValueDeserializer(JsonDeserializer<Object> paramJsonDeserializer)
  {
    return new SettableAnyProperty(this._property, this._setter, this._type, paramJsonDeserializer);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.SettableAnyProperty
 * JD-Core Version:    0.6.2
 */