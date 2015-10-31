package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.deser.BeanDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.SettableAnyProperty;
import com.flurry.org.codehaus.jackson.map.deser.SettableBeanProperty;
import com.flurry.org.codehaus.jackson.map.deser.ValueInstantiator;
import com.flurry.org.codehaus.jackson.map.deser.impl.BeanPropertyMap;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.util.HashSet;

public class ThrowableDeserializer extends BeanDeserializer
{
  protected static final String PROP_NAME_MESSAGE = "message";

  public ThrowableDeserializer(BeanDeserializer paramBeanDeserializer)
  {
    super(paramBeanDeserializer);
  }

  protected ThrowableDeserializer(BeanDeserializer paramBeanDeserializer, boolean paramBoolean)
  {
    super(paramBeanDeserializer, paramBoolean);
  }

  public Object deserializeFromObject(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    Object localObject;
    if (this._propertyBasedCreator != null)
      localObject = _deserializeUsingPropertyBased(paramJsonParser, paramDeserializationContext);
    label486: 
    while (true)
    {
      return localObject;
      if (this._delegateDeserializer != null)
        return this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
      if (this._beanType.isAbstract())
        throw JsonMappingException.from(paramJsonParser, "Can not instantiate abstract type " + this._beanType + " (need to add/enable type information?)");
      boolean bool1 = this._valueInstantiator.canCreateFromString();
      boolean bool2 = this._valueInstantiator.canCreateUsingDefault();
      if ((!bool1) && (!bool2))
        throw new JsonMappingException("Can not deserialize Throwable of type " + this._beanType + " without having a default contructor, a single-String-arg constructor; or explicit @JsonCreator");
      localObject = null;
      Object[] arrayOfObject = null;
      int i = 0;
      if (paramJsonParser.getCurrentToken() != JsonToken.END_OBJECT)
      {
        String str = paramJsonParser.getCurrentName();
        SettableBeanProperty localSettableBeanProperty = this._beanProperties.find(str);
        paramJsonParser.nextToken();
        if (localSettableBeanProperty != null)
          if (localObject != null)
            localSettableBeanProperty.deserializeAndSet(paramJsonParser, paramDeserializationContext, localObject);
        while (true)
        {
          paramJsonParser.nextToken();
          break;
          if (arrayOfObject == null)
          {
            int i2 = this._beanProperties.size();
            arrayOfObject = new Object[i2 + i2];
          }
          int i1 = i + 1;
          arrayOfObject[i] = localSettableBeanProperty;
          i = i1 + 1;
          arrayOfObject[i1] = localSettableBeanProperty.deserialize(paramJsonParser, paramDeserializationContext);
          continue;
          if (("message".equals(str)) && (bool1))
          {
            localObject = this._valueInstantiator.createFromString(paramJsonParser.getText());
            if (arrayOfObject != null)
            {
              int m = 0;
              int n = i;
              while (m < n)
              {
                ((SettableBeanProperty)arrayOfObject[m]).set(localObject, arrayOfObject[(m + 1)]);
                m += 2;
              }
              arrayOfObject = null;
            }
          }
          else if ((this._ignorableProps != null) && (this._ignorableProps.contains(str)))
          {
            paramJsonParser.skipChildren();
          }
          else if (this._anySetter != null)
          {
            this._anySetter.deserializeAndSet(paramJsonParser, paramDeserializationContext, localObject, str);
          }
          else
          {
            handleUnknownProperty(paramJsonParser, paramDeserializationContext, localObject, str);
          }
        }
      }
      if (localObject == null)
      {
        if (bool1);
        for (localObject = this._valueInstantiator.createFromString(null); ; localObject = this._valueInstantiator.createUsingDefault())
        {
          if (arrayOfObject == null)
            break label486;
          int j = 0;
          int k = i;
          while (j < k)
          {
            ((SettableBeanProperty)arrayOfObject[j]).set(localObject, arrayOfObject[(j + 1)]);
            j += 2;
          }
          break;
        }
      }
    }
  }

  public JsonDeserializer<Object> unwrappingDeserializer()
  {
    if (getClass() != ThrowableDeserializer.class)
      return this;
    return new ThrowableDeserializer(this, true);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.ThrowableDeserializer
 * JD-Core Version:    0.6.2
 */