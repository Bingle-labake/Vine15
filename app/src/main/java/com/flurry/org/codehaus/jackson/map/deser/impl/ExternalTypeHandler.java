package com.flurry.org.codehaus.jackson.map.deser.impl;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.deser.SettableBeanProperty;
import com.flurry.org.codehaus.jackson.util.TokenBuffer;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class ExternalTypeHandler
{
  private final HashMap<String, Integer> _nameToPropertyIndex;
  private final ExtTypedProperty[] _properties;
  private final TokenBuffer[] _tokens;
  private final String[] _typeIds;

  protected ExternalTypeHandler(ExternalTypeHandler paramExternalTypeHandler)
  {
    this._properties = paramExternalTypeHandler._properties;
    this._nameToPropertyIndex = paramExternalTypeHandler._nameToPropertyIndex;
    int i = this._properties.length;
    this._typeIds = new String[i];
    this._tokens = new TokenBuffer[i];
  }

  protected ExternalTypeHandler(ExtTypedProperty[] paramArrayOfExtTypedProperty, HashMap<String, Integer> paramHashMap, String[] paramArrayOfString, TokenBuffer[] paramArrayOfTokenBuffer)
  {
    this._properties = paramArrayOfExtTypedProperty;
    this._nameToPropertyIndex = paramHashMap;
    this._typeIds = paramArrayOfString;
    this._tokens = paramArrayOfTokenBuffer;
  }

  protected final void _deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject, int paramInt)
    throws IOException, JsonProcessingException
  {
    TokenBuffer localTokenBuffer = new TokenBuffer(paramJsonParser.getCodec());
    localTokenBuffer.writeStartArray();
    localTokenBuffer.writeString(this._typeIds[paramInt]);
    JsonParser localJsonParser1 = this._tokens[paramInt].asParser(paramJsonParser);
    localJsonParser1.nextToken();
    localTokenBuffer.copyCurrentStructure(localJsonParser1);
    localTokenBuffer.writeEndArray();
    JsonParser localJsonParser2 = localTokenBuffer.asParser(paramJsonParser);
    localJsonParser2.nextToken();
    this._properties[paramInt].getProperty().deserializeAndSet(localJsonParser2, paramDeserializationContext, paramObject);
  }

  public Object complete(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject)
    throws IOException, JsonProcessingException
  {
    int i = 0;
    int j = this._properties.length;
    if (i < j)
    {
      if (this._typeIds[i] == null)
        if (this._tokens[i] != null);
      while (true)
      {
        i++;
        break;
        throw paramDeserializationContext.mappingException("Missing external type id property '" + this._properties[i].getTypePropertyName());
        if (this._tokens[i] == null)
        {
          SettableBeanProperty localSettableBeanProperty = this._properties[i].getProperty();
          throw paramDeserializationContext.mappingException("Missing property '" + localSettableBeanProperty.getName() + "' for external type id '" + this._properties[i].getTypePropertyName());
        }
        _deserialize(paramJsonParser, paramDeserializationContext, paramObject, i);
      }
    }
    return paramObject;
  }

  public boolean handleToken(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, String paramString, Object paramObject)
    throws IOException, JsonProcessingException
  {
    Integer localInteger = (Integer)this._nameToPropertyIndex.get(paramString);
    if (localInteger == null)
      return false;
    int i = localInteger.intValue();
    int j;
    if (this._properties[i].hasTypePropertyName(paramString))
    {
      this._typeIds[i] = paramJsonParser.getText();
      paramJsonParser.skipChildren();
      j = 0;
      if (paramObject != null)
      {
        TokenBuffer localTokenBuffer2 = this._tokens[i];
        j = 0;
        if (localTokenBuffer2 != null)
          j = 1;
      }
    }
    while (true)
    {
      if (j != 0)
      {
        _deserialize(paramJsonParser, paramDeserializationContext, paramObject, i);
        this._typeIds[i] = null;
        this._tokens[i] = null;
      }
      return true;
      TokenBuffer localTokenBuffer1 = new TokenBuffer(paramJsonParser.getCodec());
      localTokenBuffer1.copyCurrentStructure(paramJsonParser);
      this._tokens[i] = localTokenBuffer1;
      j = 0;
      if (paramObject != null)
      {
        String str = this._typeIds[i];
        j = 0;
        if (str != null)
          j = 1;
      }
    }
  }

  public ExternalTypeHandler start()
  {
    return new ExternalTypeHandler(this);
  }

  public static class Builder
  {
    private final HashMap<String, Integer> _nameToPropertyIndex = new HashMap();
    private final ArrayList<ExternalTypeHandler.ExtTypedProperty> _properties = new ArrayList();

    public void addExternal(SettableBeanProperty paramSettableBeanProperty, String paramString)
    {
      Integer localInteger = Integer.valueOf(this._properties.size());
      this._properties.add(new ExternalTypeHandler.ExtTypedProperty(paramSettableBeanProperty, paramString));
      this._nameToPropertyIndex.put(paramSettableBeanProperty.getName(), localInteger);
      this._nameToPropertyIndex.put(paramString, localInteger);
    }

    public ExternalTypeHandler build()
    {
      return new ExternalTypeHandler((ExternalTypeHandler.ExtTypedProperty[])this._properties.toArray(new ExternalTypeHandler.ExtTypedProperty[this._properties.size()]), this._nameToPropertyIndex, null, null);
    }
  }

  private static final class ExtTypedProperty
  {
    private final SettableBeanProperty _property;
    private final String _typePropertyName;

    public ExtTypedProperty(SettableBeanProperty paramSettableBeanProperty, String paramString)
    {
      this._property = paramSettableBeanProperty;
      this._typePropertyName = paramString;
    }

    public SettableBeanProperty getProperty()
    {
      return this._property;
    }

    public String getTypePropertyName()
    {
      return this._typePropertyName;
    }

    public boolean hasTypePropertyName(String paramString)
    {
      return paramString.equals(this._typePropertyName);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.impl.ExternalTypeHandler
 * JD-Core Version:    0.6.2
 */