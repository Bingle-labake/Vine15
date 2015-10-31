package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;

public class JavaTypeDeserializer extends StdScalarDeserializer<JavaType>
{
  public JavaTypeDeserializer()
  {
    super(JavaType.class);
  }

  public JavaType deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.VALUE_STRING)
    {
      String str = paramJsonParser.getText().trim();
      if (str.length() == 0)
        return (JavaType)getEmptyValue();
      return paramDeserializationContext.getTypeFactory().constructFromCanonical(str);
    }
    if (localJsonToken == JsonToken.VALUE_EMBEDDED_OBJECT)
      return (JavaType)paramJsonParser.getEmbeddedObject();
    throw paramDeserializationContext.mappingException(this._valueClass);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.JavaTypeDeserializer
 * JD-Core Version:    0.6.2
 */