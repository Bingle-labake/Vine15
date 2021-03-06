package com.flurry.org.codehaus.jackson.map.deser.impl;

import com.flurry.org.codehaus.jackson.map.BeanProperty.Std;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMember;
import com.flurry.org.codehaus.jackson.map.util.Annotations;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;

public class ValueInjector extends BeanProperty.Std
{
  protected final Object _valueId;

  public ValueInjector(String paramString, JavaType paramJavaType, Annotations paramAnnotations, AnnotatedMember paramAnnotatedMember, Object paramObject)
  {
    super(paramString, paramJavaType, paramAnnotations, paramAnnotatedMember);
    this._valueId = paramObject;
  }

  public Object findValue(DeserializationContext paramDeserializationContext, Object paramObject)
  {
    return paramDeserializationContext.findInjectableValue(this._valueId, this, paramObject);
  }

  public void inject(DeserializationContext paramDeserializationContext, Object paramObject)
    throws IOException
  {
    this._member.setValue(paramObject, findValue(paramDeserializationContext, paramObject));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.impl.ValueInjector
 * JD-Core Version:    0.6.2
 */