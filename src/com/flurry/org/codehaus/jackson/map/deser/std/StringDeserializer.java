package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.Base64Variant;
import com.flurry.org.codehaus.jackson.Base64Variants;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import java.io.IOException;

@JacksonStdImpl
public class StringDeserializer extends StdScalarDeserializer<String>
{
  public StringDeserializer()
  {
    super(String.class);
  }

  public String deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.VALUE_STRING)
      return paramJsonParser.getText();
    if (localJsonToken == JsonToken.VALUE_EMBEDDED_OBJECT)
    {
      Object localObject = paramJsonParser.getEmbeddedObject();
      if (localObject == null)
        return null;
      if ((localObject instanceof byte[]))
        return Base64Variants.getDefaultVariant().encode((byte[])localObject, false);
      return localObject.toString();
    }
    if (localJsonToken.isScalarValue())
      return paramJsonParser.getText();
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  public String deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return deserialize(paramJsonParser, paramDeserializationContext);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.StringDeserializer
 * JD-Core Version:    0.6.2
 */