package com.fasterxml.jackson.core.base;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonGenerator.Feature;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonParser.NumberType;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.json.JsonWriteContext;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.core.util.VersionUtil;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

public abstract class GeneratorBase extends JsonGenerator
{
  protected boolean _cfgNumbersAsStrings;
  protected boolean _closed;
  protected int _features;
  protected ObjectCodec _objectCodec;
  protected JsonWriteContext _writeContext;

  protected GeneratorBase(int paramInt, ObjectCodec paramObjectCodec)
  {
    this._features = paramInt;
    this._writeContext = JsonWriteContext.createRootContext();
    this._objectCodec = paramObjectCodec;
    this._cfgNumbersAsStrings = isEnabled(JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS);
  }

  protected abstract void _releaseBuffers();

  protected void _reportError(String paramString)
    throws JsonGenerationException
  {
    throw new JsonGenerationException(paramString);
  }

  protected void _reportUnsupportedOperation()
  {
    throw new UnsupportedOperationException("Operation not supported by generator of type " + getClass().getName());
  }

  protected final void _throwInternal()
  {
    VersionUtil.throwInternal();
  }

  protected abstract void _verifyValueWrite(String paramString)
    throws IOException, JsonGenerationException;

  protected void _writeSimpleObject(Object paramObject)
    throws IOException, JsonGenerationException
  {
    if (paramObject == null)
    {
      writeNull();
      return;
    }
    if ((paramObject instanceof String))
    {
      writeString((String)paramObject);
      return;
    }
    if ((paramObject instanceof Number))
    {
      Number localNumber = (Number)paramObject;
      if ((localNumber instanceof Integer))
      {
        writeNumber(localNumber.intValue());
        return;
      }
      if ((localNumber instanceof Long))
      {
        writeNumber(localNumber.longValue());
        return;
      }
      if ((localNumber instanceof Double))
      {
        writeNumber(localNumber.doubleValue());
        return;
      }
      if ((localNumber instanceof Float))
      {
        writeNumber(localNumber.floatValue());
        return;
      }
      if ((localNumber instanceof Short))
      {
        writeNumber(localNumber.shortValue());
        return;
      }
      if ((localNumber instanceof Byte))
      {
        writeNumber((short)localNumber.byteValue());
        return;
      }
      if ((localNumber instanceof BigInteger))
      {
        writeNumber((BigInteger)localNumber);
        return;
      }
      if ((localNumber instanceof BigDecimal))
      {
        writeNumber((BigDecimal)localNumber);
        return;
      }
      if ((localNumber instanceof AtomicInteger))
      {
        writeNumber(((AtomicInteger)localNumber).get());
        return;
      }
      if ((localNumber instanceof AtomicLong))
        writeNumber(((AtomicLong)localNumber).get());
    }
    else
    {
      if ((paramObject instanceof byte[]))
      {
        writeBinary((byte[])paramObject);
        return;
      }
      if ((paramObject instanceof Boolean))
      {
        writeBoolean(((Boolean)paramObject).booleanValue());
        return;
      }
      if ((paramObject instanceof AtomicBoolean))
      {
        writeBoolean(((AtomicBoolean)paramObject).get());
        return;
      }
    }
    throw new IllegalStateException("No ObjectCodec defined for the generator, can only serialize simple wrapper types (type passed " + paramObject.getClass().getName() + ")");
  }

  public void close()
    throws IOException
  {
    this._closed = true;
  }

  public final void copyCurrentEvent(JsonParser paramJsonParser)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == null)
      _reportError("No current event to copy");
    switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[localJsonToken.ordinal()])
    {
    default:
      _throwInternal();
      return;
    case 1:
      writeStartObject();
      return;
    case 2:
      writeEndObject();
      return;
    case 3:
      writeStartArray();
      return;
    case 4:
      writeEndArray();
      return;
    case 5:
      writeFieldName(paramJsonParser.getCurrentName());
      return;
    case 6:
      if (paramJsonParser.hasTextCharacters())
      {
        writeString(paramJsonParser.getTextCharacters(), paramJsonParser.getTextOffset(), paramJsonParser.getTextLength());
        return;
      }
      writeString(paramJsonParser.getText());
      return;
    case 7:
      switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[paramJsonParser.getNumberType().ordinal()])
      {
      default:
        writeNumber(paramJsonParser.getLongValue());
        return;
      case 1:
        writeNumber(paramJsonParser.getIntValue());
        return;
      case 2:
      }
      writeNumber(paramJsonParser.getBigIntegerValue());
      return;
    case 8:
      switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonParser$NumberType[paramJsonParser.getNumberType().ordinal()])
      {
      default:
        writeNumber(paramJsonParser.getDoubleValue());
        return;
      case 3:
        writeNumber(paramJsonParser.getDecimalValue());
        return;
      case 4:
      }
      writeNumber(paramJsonParser.getFloatValue());
      return;
    case 9:
      writeBoolean(true);
      return;
    case 10:
      writeBoolean(false);
      return;
    case 11:
      writeNull();
      return;
    case 12:
    }
    writeObject(paramJsonParser.getEmbeddedObject());
  }

  public final void copyCurrentStructure(JsonParser paramJsonParser)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.FIELD_NAME)
    {
      writeFieldName(paramJsonParser.getCurrentName());
      localJsonToken = paramJsonParser.nextToken();
    }
    switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[localJsonToken.ordinal()])
    {
    case 2:
    default:
      copyCurrentEvent(paramJsonParser);
      return;
    case 3:
      writeStartArray();
      while (paramJsonParser.nextToken() != JsonToken.END_ARRAY)
        copyCurrentStructure(paramJsonParser);
      writeEndArray();
      return;
    case 1:
    }
    writeStartObject();
    while (paramJsonParser.nextToken() != JsonToken.END_OBJECT)
      copyCurrentStructure(paramJsonParser);
    writeEndObject();
  }

  public JsonGenerator disable(JsonGenerator.Feature paramFeature)
  {
    this._features &= (0xFFFFFFFF ^ paramFeature.getMask());
    if (paramFeature == JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS)
      this._cfgNumbersAsStrings = false;
    while (paramFeature != JsonGenerator.Feature.ESCAPE_NON_ASCII)
      return this;
    setHighestNonEscapedChar(0);
    return this;
  }

  public JsonGenerator enable(JsonGenerator.Feature paramFeature)
  {
    this._features |= paramFeature.getMask();
    if (paramFeature == JsonGenerator.Feature.WRITE_NUMBERS_AS_STRINGS)
      this._cfgNumbersAsStrings = true;
    while (paramFeature != JsonGenerator.Feature.ESCAPE_NON_ASCII)
      return this;
    setHighestNonEscapedChar(127);
    return this;
  }

  public abstract void flush()
    throws IOException;

  public final ObjectCodec getCodec()
  {
    return this._objectCodec;
  }

  public final JsonWriteContext getOutputContext()
  {
    return this._writeContext;
  }

  public boolean isClosed()
  {
    return this._closed;
  }

  public final boolean isEnabled(JsonGenerator.Feature paramFeature)
  {
    return (this._features & paramFeature.getMask()) != 0;
  }

  public JsonGenerator setCodec(ObjectCodec paramObjectCodec)
  {
    this._objectCodec = paramObjectCodec;
    return this;
  }

  public JsonGenerator useDefaultPrettyPrinter()
  {
    if (getPrettyPrinter() != null)
      return this;
    return setPrettyPrinter(new DefaultPrettyPrinter());
  }

  public Version version()
  {
    return VersionUtil.versionFor(getClass());
  }

  public int writeBinary(Base64Variant paramBase64Variant, InputStream paramInputStream, int paramInt)
    throws IOException, JsonGenerationException
  {
    _reportUnsupportedOperation();
    return 0;
  }

  public void writeFieldName(SerializableString paramSerializableString)
    throws IOException, JsonGenerationException
  {
    writeFieldName(paramSerializableString.getValue());
  }

  public void writeObject(Object paramObject)
    throws IOException, JsonProcessingException
  {
    if (paramObject == null)
    {
      writeNull();
      return;
    }
    if (this._objectCodec != null)
    {
      this._objectCodec.writeValue(this, paramObject);
      return;
    }
    _writeSimpleObject(paramObject);
  }

  public void writeRawValue(String paramString)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write raw value");
    writeRaw(paramString);
  }

  public void writeRawValue(String paramString, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write raw value");
    writeRaw(paramString, paramInt1, paramInt2);
  }

  public void writeRawValue(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write raw value");
    writeRaw(paramArrayOfChar, paramInt1, paramInt2);
  }

  public void writeString(SerializableString paramSerializableString)
    throws IOException, JsonGenerationException
  {
    writeString(paramSerializableString.getValue());
  }

  public void writeTree(TreeNode paramTreeNode)
    throws IOException, JsonProcessingException
  {
    if (paramTreeNode == null)
    {
      writeNull();
      return;
    }
    if (this._objectCodec == null)
      throw new IllegalStateException("No ObjectCodec defined");
    this._objectCodec.writeValue(this, paramTreeNode);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.base.GeneratorBase
 * JD-Core Version:    0.6.2
 */