package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.Base64Variant;
import com.flurry.org.codehaus.jackson.Base64Variants;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders.BooleanBuilder;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders.ByteBuilder;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders.DoubleBuilder;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders.FloatBuilder;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders.IntBuilder;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders.LongBuilder;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders.ShortBuilder;
import com.flurry.org.codehaus.jackson.map.util.ObjectBuffer;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.util.HashMap;

public class PrimitiveArrayDeserializers
{
  static final PrimitiveArrayDeserializers instance = new PrimitiveArrayDeserializers();
  HashMap<JavaType, JsonDeserializer<Object>> _allDeserializers = new HashMap();

  protected PrimitiveArrayDeserializers()
  {
    add(Boolean.TYPE, new BooleanDeser());
    add(Byte.TYPE, new ByteDeser());
    add(Short.TYPE, new ShortDeser());
    add(Integer.TYPE, new IntDeser());
    add(Long.TYPE, new LongDeser());
    add(Float.TYPE, new FloatDeser());
    add(Double.TYPE, new DoubleDeser());
    add(String.class, new StringDeser());
    add(Character.TYPE, new CharDeser());
  }

  private void add(Class<?> paramClass, JsonDeserializer<?> paramJsonDeserializer)
  {
    this._allDeserializers.put(TypeFactory.defaultInstance().constructType(paramClass), paramJsonDeserializer);
  }

  public static HashMap<JavaType, JsonDeserializer<Object>> getAll()
  {
    return instance._allDeserializers;
  }

  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return paramTypeDeserializer.deserializeTypedFromArray(paramJsonParser, paramDeserializationContext);
  }

  static abstract class Base<T> extends StdDeserializer<T>
  {
    protected Base(Class<T> paramClass)
    {
      super();
    }

    public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
      throws IOException, JsonProcessingException
    {
      return paramTypeDeserializer.deserializeTypedFromArray(paramJsonParser, paramDeserializationContext);
    }
  }

  @JacksonStdImpl
  static final class BooleanDeser extends PrimitiveArrayDeserializers.Base<boolean[]>
  {
    public BooleanDeser()
    {
      super();
    }

    private final boolean[] handleNonArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) && (paramJsonParser.getText().length() == 0))
        return null;
      if (!paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY))
        throw paramDeserializationContext.mappingException(this._valueClass);
      boolean[] arrayOfBoolean = new boolean[1];
      arrayOfBoolean[0] = _parseBooleanPrimitive(paramJsonParser, paramDeserializationContext);
      return arrayOfBoolean;
    }

    public boolean[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (!paramJsonParser.isExpectedStartArrayToken())
        return handleNonArray(paramJsonParser, paramDeserializationContext);
      ArrayBuilders.BooleanBuilder localBooleanBuilder = paramDeserializationContext.getArrayBuilders().getBooleanBuilder();
      boolean[] arrayOfBoolean = (boolean[])localBooleanBuilder.resetAndStart();
      int j;
      for (int i = 0; paramJsonParser.nextToken() != JsonToken.END_ARRAY; i = j)
      {
        boolean bool = _parseBooleanPrimitive(paramJsonParser, paramDeserializationContext);
        if (i >= arrayOfBoolean.length)
        {
          arrayOfBoolean = (boolean[])localBooleanBuilder.appendCompletedChunk(arrayOfBoolean, i);
          i = 0;
        }
        j = i + 1;
        arrayOfBoolean[i] = bool;
      }
      return (boolean[])localBooleanBuilder.completeAndClearBuffer(arrayOfBoolean, i);
    }
  }

  @JacksonStdImpl
  static final class ByteDeser extends PrimitiveArrayDeserializers.Base<byte[]>
  {
    public ByteDeser()
    {
      super();
    }

    private final byte[] handleNonArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) && (paramJsonParser.getText().length() == 0))
        return null;
      if (!paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY))
        throw paramDeserializationContext.mappingException(this._valueClass);
      JsonToken localJsonToken = paramJsonParser.getCurrentToken();
      if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT));
      for (int i = paramJsonParser.getByteValue(); ; i = 0)
      {
        return new byte[] { i };
        if (localJsonToken != JsonToken.VALUE_NULL)
          throw paramDeserializationContext.mappingException(this._valueClass.getComponentType());
      }
    }

    public byte[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
      if (localJsonToken1 == JsonToken.VALUE_STRING)
        return paramJsonParser.getBinaryValue(paramDeserializationContext.getBase64Variant());
      if (localJsonToken1 == JsonToken.VALUE_EMBEDDED_OBJECT)
      {
        Object localObject = paramJsonParser.getEmbeddedObject();
        if (localObject == null)
          return null;
        if ((localObject instanceof byte[]))
          return (byte[])localObject;
      }
      if (!paramJsonParser.isExpectedStartArrayToken())
        return handleNonArray(paramJsonParser, paramDeserializationContext);
      ArrayBuilders.ByteBuilder localByteBuilder = paramDeserializationContext.getArrayBuilders().getByteBuilder();
      byte[] arrayOfByte = (byte[])localByteBuilder.resetAndStart();
      int i = 0;
      JsonToken localJsonToken2 = paramJsonParser.nextToken();
      if (localJsonToken2 != JsonToken.END_ARRAY)
      {
        if ((localJsonToken2 == JsonToken.VALUE_NUMBER_INT) || (localJsonToken2 == JsonToken.VALUE_NUMBER_FLOAT));
        for (int j = paramJsonParser.getByteValue(); ; j = 0)
        {
          if (i >= arrayOfByte.length)
          {
            arrayOfByte = (byte[])localByteBuilder.appendCompletedChunk(arrayOfByte, i);
            i = 0;
          }
          int k = i + 1;
          arrayOfByte[i] = j;
          i = k;
          break;
          if (localJsonToken2 != JsonToken.VALUE_NULL)
            throw paramDeserializationContext.mappingException(this._valueClass.getComponentType());
        }
      }
      return (byte[])localByteBuilder.completeAndClearBuffer(arrayOfByte, i);
    }
  }

  @JacksonStdImpl
  static final class CharDeser extends PrimitiveArrayDeserializers.Base<char[]>
  {
    public CharDeser()
    {
      super();
    }

    public char[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
      if (localJsonToken1 == JsonToken.VALUE_STRING)
      {
        char[] arrayOfChar1 = paramJsonParser.getTextCharacters();
        int i = paramJsonParser.getTextOffset();
        int j = paramJsonParser.getTextLength();
        char[] arrayOfChar2 = new char[j];
        System.arraycopy(arrayOfChar1, i, arrayOfChar2, 0, j);
        return arrayOfChar2;
      }
      if (paramJsonParser.isExpectedStartArrayToken())
      {
        StringBuilder localStringBuilder = new StringBuilder(64);
        while (true)
        {
          JsonToken localJsonToken2 = paramJsonParser.nextToken();
          if (localJsonToken2 == JsonToken.END_ARRAY)
            break;
          if (localJsonToken2 != JsonToken.VALUE_STRING)
            throw paramDeserializationContext.mappingException(Character.TYPE);
          String str = paramJsonParser.getText();
          if (str.length() != 1)
            throw JsonMappingException.from(paramJsonParser, "Can not convert a JSON String of length " + str.length() + " into a char element of char array");
          localStringBuilder.append(str.charAt(0));
        }
        return localStringBuilder.toString().toCharArray();
      }
      if (localJsonToken1 == JsonToken.VALUE_EMBEDDED_OBJECT)
      {
        Object localObject = paramJsonParser.getEmbeddedObject();
        if (localObject == null)
          return null;
        if ((localObject instanceof char[]))
          return (char[])localObject;
        if ((localObject instanceof String))
          return ((String)localObject).toCharArray();
        if ((localObject instanceof byte[]))
          return Base64Variants.getDefaultVariant().encode((byte[])localObject, false).toCharArray();
      }
      throw paramDeserializationContext.mappingException(this._valueClass);
    }
  }

  @JacksonStdImpl
  static final class DoubleDeser extends PrimitiveArrayDeserializers.Base<double[]>
  {
    public DoubleDeser()
    {
      super();
    }

    private final double[] handleNonArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) && (paramJsonParser.getText().length() == 0))
        return null;
      if (!paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY))
        throw paramDeserializationContext.mappingException(this._valueClass);
      double[] arrayOfDouble = new double[1];
      arrayOfDouble[0] = _parseDoublePrimitive(paramJsonParser, paramDeserializationContext);
      return arrayOfDouble;
    }

    public double[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (!paramJsonParser.isExpectedStartArrayToken())
        return handleNonArray(paramJsonParser, paramDeserializationContext);
      ArrayBuilders.DoubleBuilder localDoubleBuilder = paramDeserializationContext.getArrayBuilders().getDoubleBuilder();
      double[] arrayOfDouble = (double[])localDoubleBuilder.resetAndStart();
      int j;
      for (int i = 0; paramJsonParser.nextToken() != JsonToken.END_ARRAY; i = j)
      {
        double d = _parseDoublePrimitive(paramJsonParser, paramDeserializationContext);
        if (i >= arrayOfDouble.length)
        {
          arrayOfDouble = (double[])localDoubleBuilder.appendCompletedChunk(arrayOfDouble, i);
          i = 0;
        }
        j = i + 1;
        arrayOfDouble[i] = d;
      }
      return (double[])localDoubleBuilder.completeAndClearBuffer(arrayOfDouble, i);
    }
  }

  @JacksonStdImpl
  static final class FloatDeser extends PrimitiveArrayDeserializers.Base<float[]>
  {
    public FloatDeser()
    {
      super();
    }

    private final float[] handleNonArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) && (paramJsonParser.getText().length() == 0))
        return null;
      if (!paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY))
        throw paramDeserializationContext.mappingException(this._valueClass);
      float[] arrayOfFloat = new float[1];
      arrayOfFloat[0] = _parseFloatPrimitive(paramJsonParser, paramDeserializationContext);
      return arrayOfFloat;
    }

    public float[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (!paramJsonParser.isExpectedStartArrayToken())
        return handleNonArray(paramJsonParser, paramDeserializationContext);
      ArrayBuilders.FloatBuilder localFloatBuilder = paramDeserializationContext.getArrayBuilders().getFloatBuilder();
      float[] arrayOfFloat = (float[])localFloatBuilder.resetAndStart();
      int j;
      for (int i = 0; paramJsonParser.nextToken() != JsonToken.END_ARRAY; i = j)
      {
        float f = _parseFloatPrimitive(paramJsonParser, paramDeserializationContext);
        if (i >= arrayOfFloat.length)
        {
          arrayOfFloat = (float[])localFloatBuilder.appendCompletedChunk(arrayOfFloat, i);
          i = 0;
        }
        j = i + 1;
        arrayOfFloat[i] = f;
      }
      return (float[])localFloatBuilder.completeAndClearBuffer(arrayOfFloat, i);
    }
  }

  @JacksonStdImpl
  static final class IntDeser extends PrimitiveArrayDeserializers.Base<int[]>
  {
    public IntDeser()
    {
      super();
    }

    private final int[] handleNonArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) && (paramJsonParser.getText().length() == 0))
        return null;
      if (!paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY))
        throw paramDeserializationContext.mappingException(this._valueClass);
      int[] arrayOfInt = new int[1];
      arrayOfInt[0] = _parseIntPrimitive(paramJsonParser, paramDeserializationContext);
      return arrayOfInt;
    }

    public int[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (!paramJsonParser.isExpectedStartArrayToken())
        return handleNonArray(paramJsonParser, paramDeserializationContext);
      ArrayBuilders.IntBuilder localIntBuilder = paramDeserializationContext.getArrayBuilders().getIntBuilder();
      int[] arrayOfInt = (int[])localIntBuilder.resetAndStart();
      int k;
      for (int i = 0; paramJsonParser.nextToken() != JsonToken.END_ARRAY; i = k)
      {
        int j = _parseIntPrimitive(paramJsonParser, paramDeserializationContext);
        if (i >= arrayOfInt.length)
        {
          arrayOfInt = (int[])localIntBuilder.appendCompletedChunk(arrayOfInt, i);
          i = 0;
        }
        k = i + 1;
        arrayOfInt[i] = j;
      }
      return (int[])localIntBuilder.completeAndClearBuffer(arrayOfInt, i);
    }
  }

  @JacksonStdImpl
  static final class LongDeser extends PrimitiveArrayDeserializers.Base<long[]>
  {
    public LongDeser()
    {
      super();
    }

    private final long[] handleNonArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) && (paramJsonParser.getText().length() == 0))
        return null;
      if (!paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY))
        throw paramDeserializationContext.mappingException(this._valueClass);
      long[] arrayOfLong = new long[1];
      arrayOfLong[0] = _parseLongPrimitive(paramJsonParser, paramDeserializationContext);
      return arrayOfLong;
    }

    public long[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (!paramJsonParser.isExpectedStartArrayToken())
        return handleNonArray(paramJsonParser, paramDeserializationContext);
      ArrayBuilders.LongBuilder localLongBuilder = paramDeserializationContext.getArrayBuilders().getLongBuilder();
      long[] arrayOfLong = (long[])localLongBuilder.resetAndStart();
      int j;
      for (int i = 0; paramJsonParser.nextToken() != JsonToken.END_ARRAY; i = j)
      {
        long l = _parseLongPrimitive(paramJsonParser, paramDeserializationContext);
        if (i >= arrayOfLong.length)
        {
          arrayOfLong = (long[])localLongBuilder.appendCompletedChunk(arrayOfLong, i);
          i = 0;
        }
        j = i + 1;
        arrayOfLong[i] = l;
      }
      return (long[])localLongBuilder.completeAndClearBuffer(arrayOfLong, i);
    }
  }

  @JacksonStdImpl
  static final class ShortDeser extends PrimitiveArrayDeserializers.Base<short[]>
  {
    public ShortDeser()
    {
      super();
    }

    private final short[] handleNonArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) && (paramJsonParser.getText().length() == 0))
        return null;
      if (!paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY))
        throw paramDeserializationContext.mappingException(this._valueClass);
      short[] arrayOfShort = new short[1];
      arrayOfShort[0] = _parseShortPrimitive(paramJsonParser, paramDeserializationContext);
      return arrayOfShort;
    }

    public short[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (!paramJsonParser.isExpectedStartArrayToken())
        return handleNonArray(paramJsonParser, paramDeserializationContext);
      ArrayBuilders.ShortBuilder localShortBuilder = paramDeserializationContext.getArrayBuilders().getShortBuilder();
      short[] arrayOfShort = (short[])localShortBuilder.resetAndStart();
      int k;
      for (int i = 0; paramJsonParser.nextToken() != JsonToken.END_ARRAY; i = k)
      {
        int j = _parseShortPrimitive(paramJsonParser, paramDeserializationContext);
        if (i >= arrayOfShort.length)
        {
          arrayOfShort = (short[])localShortBuilder.appendCompletedChunk(arrayOfShort, i);
          i = 0;
        }
        k = i + 1;
        arrayOfShort[i] = j;
      }
      return (short[])localShortBuilder.completeAndClearBuffer(arrayOfShort, i);
    }
  }

  @JacksonStdImpl
  static final class StringDeser extends PrimitiveArrayDeserializers.Base<String[]>
  {
    public StringDeser()
    {
      super();
    }

    private final String[] handleNonArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (!paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY))
      {
        if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) && (paramJsonParser.getText().length() == 0))
          return null;
        throw paramDeserializationContext.mappingException(this._valueClass);
      }
      String[] arrayOfString = new String[1];
      JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
      JsonToken localJsonToken2 = JsonToken.VALUE_NULL;
      String str = null;
      if (localJsonToken1 == localJsonToken2);
      while (true)
      {
        arrayOfString[0] = str;
        return arrayOfString;
        str = paramJsonParser.getText();
      }
    }

    public String[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (!paramJsonParser.isExpectedStartArrayToken())
        return handleNonArray(paramJsonParser, paramDeserializationContext);
      ObjectBuffer localObjectBuffer = paramDeserializationContext.leaseObjectBuffer();
      Object[] arrayOfObject = localObjectBuffer.resetAndStart();
      int i = 0;
      JsonToken localJsonToken = paramJsonParser.nextToken();
      if (localJsonToken != JsonToken.END_ARRAY)
      {
        if (localJsonToken == JsonToken.VALUE_NULL);
        for (String str = null; ; str = paramJsonParser.getText())
        {
          if (i >= arrayOfObject.length)
          {
            arrayOfObject = localObjectBuffer.appendCompletedChunk(arrayOfObject);
            i = 0;
          }
          int j = i + 1;
          arrayOfObject[i] = str;
          i = j;
          break;
        }
      }
      String[] arrayOfString = (String[])localObjectBuffer.completeAndClearBuffer(arrayOfObject, i, String.class);
      paramDeserializationContext.returnObjectBuffer(localObjectBuffer);
      return arrayOfString;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.PrimitiveArrayDeserializers
 * JD-Core Version:    0.6.2
 */