package com.flurry.org.codehaus.jackson.map.deser.impl;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.SettableBeanProperty;
import com.flurry.org.codehaus.jackson.map.deser.ValueInstantiator;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;

public final class PropertyBasedCreator
{
  protected Object[] _defaultValues;
  protected final HashMap<String, SettableBeanProperty> _properties;
  protected final SettableBeanProperty[] _propertiesWithInjectables;
  protected final ValueInstantiator _valueInstantiator;

  public PropertyBasedCreator(ValueInstantiator paramValueInstantiator)
  {
    this._valueInstantiator = paramValueInstantiator;
    this._properties = new HashMap();
    Object[] arrayOfObject = null;
    SettableBeanProperty[] arrayOfSettableBeanProperty1 = paramValueInstantiator.getFromObjectArguments();
    SettableBeanProperty[] arrayOfSettableBeanProperty2 = null;
    int i = 0;
    int j = arrayOfSettableBeanProperty1.length;
    while (i < j)
    {
      SettableBeanProperty localSettableBeanProperty = arrayOfSettableBeanProperty1[i];
      this._properties.put(localSettableBeanProperty.getName(), localSettableBeanProperty);
      if (localSettableBeanProperty.getType().isPrimitive())
      {
        if (arrayOfObject == null)
          arrayOfObject = new Object[j];
        arrayOfObject[i] = ClassUtil.defaultValue(localSettableBeanProperty.getType().getRawClass());
      }
      if (localSettableBeanProperty.getInjectableValueId() != null)
      {
        if (arrayOfSettableBeanProperty2 == null)
          arrayOfSettableBeanProperty2 = new SettableBeanProperty[j];
        arrayOfSettableBeanProperty2[i] = localSettableBeanProperty;
      }
      i++;
    }
    this._defaultValues = arrayOfObject;
    this._propertiesWithInjectables = arrayOfSettableBeanProperty2;
  }

  public void assignDeserializer(SettableBeanProperty paramSettableBeanProperty, JsonDeserializer<Object> paramJsonDeserializer)
  {
    SettableBeanProperty localSettableBeanProperty = paramSettableBeanProperty.withValueDeserializer(paramJsonDeserializer);
    this._properties.put(localSettableBeanProperty.getName(), localSettableBeanProperty);
    Object localObject = paramJsonDeserializer.getNullValue();
    if (localObject != null)
    {
      if (this._defaultValues == null)
        this._defaultValues = new Object[this._properties.size()];
      this._defaultValues[localSettableBeanProperty.getPropertyIndex()] = localObject;
    }
  }

  public Object build(PropertyValueBuffer paramPropertyValueBuffer)
    throws IOException
  {
    Object localObject = this._valueInstantiator.createFromObjectWith(paramPropertyValueBuffer.getParameters(this._defaultValues));
    for (PropertyValue localPropertyValue = paramPropertyValueBuffer.buffered(); localPropertyValue != null; localPropertyValue = localPropertyValue.next)
      localPropertyValue.assign(localObject);
    return localObject;
  }

  public SettableBeanProperty findCreatorProperty(String paramString)
  {
    return (SettableBeanProperty)this._properties.get(paramString);
  }

  public Collection<SettableBeanProperty> getCreatorProperties()
  {
    return this._properties.values();
  }

  public PropertyValueBuffer startBuilding(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
  {
    PropertyValueBuffer localPropertyValueBuffer = new PropertyValueBuffer(paramJsonParser, paramDeserializationContext, this._properties.size());
    if (this._propertiesWithInjectables != null)
      localPropertyValueBuffer.inject(this._propertiesWithInjectables);
    return localPropertyValueBuffer;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.impl.PropertyBasedCreator
 * JD-Core Version:    0.6.2
 */