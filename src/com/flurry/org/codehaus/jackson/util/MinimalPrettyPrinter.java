package com.flurry.org.codehaus.jackson.util;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.PrettyPrinter;
import java.io.IOException;

public class MinimalPrettyPrinter
  implements PrettyPrinter
{
  public static final String DEFAULT_ROOT_VALUE_SEPARATOR = " ";
  protected String _rootValueSeparator = " ";

  public MinimalPrettyPrinter()
  {
    this(" ");
  }

  public MinimalPrettyPrinter(String paramString)
  {
    this._rootValueSeparator = paramString;
  }

  public void beforeArrayValues(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
  }

  public void beforeObjectEntries(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
  }

  public void setRootValueSeparator(String paramString)
  {
    this._rootValueSeparator = paramString;
  }

  public void writeArrayValueSeparator(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw(',');
  }

  public void writeEndArray(JsonGenerator paramJsonGenerator, int paramInt)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw(']');
  }

  public void writeEndObject(JsonGenerator paramJsonGenerator, int paramInt)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw('}');
  }

  public void writeObjectEntrySeparator(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw(',');
  }

  public void writeObjectFieldValueSeparator(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw(':');
  }

  public void writeRootValueSeparator(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    if (this._rootValueSeparator != null)
      paramJsonGenerator.writeRaw(this._rootValueSeparator);
  }

  public void writeStartArray(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw('[');
  }

  public void writeStartObject(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw('{');
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.util.MinimalPrettyPrinter
 * JD-Core Version:    0.6.2
 */