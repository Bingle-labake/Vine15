package com.flurry.org.codehaus.jackson.map.ext;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdScalarDeserializer;
import com.flurry.org.codehaus.jackson.map.util.Provider;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import org.joda.time.DateMidnight;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.joda.time.Period;
import org.joda.time.ReadableDateTime;
import org.joda.time.ReadableInstant;
import org.joda.time.ReadablePeriod;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

public class JodaDeserializers
  implements Provider<StdDeserializer<?>>
{
  public Collection<StdDeserializer<?>> provide()
  {
    StdDeserializer[] arrayOfStdDeserializer = new StdDeserializer[7];
    arrayOfStdDeserializer[0] = new DateTimeDeserializer(DateTime.class);
    arrayOfStdDeserializer[1] = new DateTimeDeserializer(ReadableDateTime.class);
    arrayOfStdDeserializer[2] = new DateTimeDeserializer(ReadableInstant.class);
    arrayOfStdDeserializer[3] = new LocalDateDeserializer();
    arrayOfStdDeserializer[4] = new LocalDateTimeDeserializer();
    arrayOfStdDeserializer[5] = new DateMidnightDeserializer();
    arrayOfStdDeserializer[6] = new PeriodDeserializer();
    return Arrays.asList(arrayOfStdDeserializer);
  }

  public static class DateMidnightDeserializer extends JodaDeserializers.JodaDeserializer<DateMidnight>
  {
    public DateMidnightDeserializer()
    {
      super();
    }

    public DateMidnight deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (paramJsonParser.isExpectedStartArrayToken())
      {
        paramJsonParser.nextToken();
        int i = paramJsonParser.getIntValue();
        paramJsonParser.nextToken();
        int j = paramJsonParser.getIntValue();
        paramJsonParser.nextToken();
        int k = paramJsonParser.getIntValue();
        if (paramJsonParser.nextToken() != JsonToken.END_ARRAY)
          throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.END_ARRAY, "after DateMidnight ints");
        return new DateMidnight(i, j, k);
      }
      switch (JodaDeserializers.1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.getCurrentToken().ordinal()])
      {
      default:
        throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.START_ARRAY, "expected JSON Array, Number or String");
      case 1:
        return new DateMidnight(paramJsonParser.getLongValue());
      case 2:
      }
      DateTime localDateTime = parseLocal(paramJsonParser);
      if (localDateTime == null)
        return null;
      return localDateTime.toDateMidnight();
    }
  }

  public static class DateTimeDeserializer<T extends ReadableInstant> extends JodaDeserializers.JodaDeserializer<T>
  {
    public DateTimeDeserializer(Class<T> paramClass)
    {
      super();
    }

    public T deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      JsonToken localJsonToken = paramJsonParser.getCurrentToken();
      if (localJsonToken == JsonToken.VALUE_NUMBER_INT)
        return new DateTime(paramJsonParser.getLongValue(), DateTimeZone.UTC);
      if (localJsonToken == JsonToken.VALUE_STRING)
      {
        String str = paramJsonParser.getText().trim();
        if (str.length() == 0)
          return null;
        return new DateTime(str, DateTimeZone.UTC);
      }
      throw paramDeserializationContext.mappingException(getValueClass());
    }
  }

  static abstract class JodaDeserializer<T> extends StdScalarDeserializer<T>
  {
    static final DateTimeFormatter _localDateTimeFormat = ISODateTimeFormat.localDateOptionalTimeParser();

    protected JodaDeserializer(Class<T> paramClass)
    {
      super();
    }

    protected DateTime parseLocal(JsonParser paramJsonParser)
      throws IOException, JsonProcessingException
    {
      String str = paramJsonParser.getText().trim();
      if (str.length() == 0)
        return null;
      return _localDateTimeFormat.parseDateTime(str);
    }
  }

  public static class LocalDateDeserializer extends JodaDeserializers.JodaDeserializer<LocalDate>
  {
    public LocalDateDeserializer()
    {
      super();
    }

    public LocalDate deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (paramJsonParser.isExpectedStartArrayToken())
      {
        paramJsonParser.nextToken();
        int i = paramJsonParser.getIntValue();
        paramJsonParser.nextToken();
        int j = paramJsonParser.getIntValue();
        paramJsonParser.nextToken();
        int k = paramJsonParser.getIntValue();
        if (paramJsonParser.nextToken() != JsonToken.END_ARRAY)
          throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.END_ARRAY, "after LocalDate ints");
        return new LocalDate(i, j, k);
      }
      switch (JodaDeserializers.1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.getCurrentToken().ordinal()])
      {
      default:
        throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.START_ARRAY, "expected JSON Array, String or Number");
      case 1:
        return new LocalDate(paramJsonParser.getLongValue());
      case 2:
      }
      DateTime localDateTime = parseLocal(paramJsonParser);
      if (localDateTime == null)
        return null;
      return localDateTime.toLocalDate();
    }
  }

  public static class LocalDateTimeDeserializer extends JodaDeserializers.JodaDeserializer<LocalDateTime>
  {
    public LocalDateTimeDeserializer()
    {
      super();
    }

    public LocalDateTime deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (paramJsonParser.isExpectedStartArrayToken())
      {
        paramJsonParser.nextToken();
        int i = paramJsonParser.getIntValue();
        paramJsonParser.nextToken();
        int j = paramJsonParser.getIntValue();
        paramJsonParser.nextToken();
        int k = paramJsonParser.getIntValue();
        paramJsonParser.nextToken();
        int m = paramJsonParser.getIntValue();
        paramJsonParser.nextToken();
        int n = paramJsonParser.getIntValue();
        paramJsonParser.nextToken();
        int i1 = paramJsonParser.getIntValue();
        JsonToken localJsonToken1 = paramJsonParser.nextToken();
        JsonToken localJsonToken2 = JsonToken.END_ARRAY;
        int i2 = 0;
        if (localJsonToken1 != localJsonToken2)
        {
          i2 = paramJsonParser.getIntValue();
          paramJsonParser.nextToken();
        }
        if (paramJsonParser.getCurrentToken() != JsonToken.END_ARRAY)
          throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.END_ARRAY, "after LocalDateTime ints");
        return new LocalDateTime(i, j, k, m, n, i1, i2);
      }
      switch (JodaDeserializers.1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.getCurrentToken().ordinal()])
      {
      default:
        throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.START_ARRAY, "expected JSON Array or Number");
      case 1:
        return new LocalDateTime(paramJsonParser.getLongValue());
      case 2:
      }
      DateTime localDateTime = parseLocal(paramJsonParser);
      if (localDateTime == null)
        return null;
      return localDateTime.toLocalDateTime();
    }
  }

  public static class PeriodDeserializer extends JodaDeserializers.JodaDeserializer<ReadablePeriod>
  {
    public PeriodDeserializer()
    {
      super();
    }

    public ReadablePeriod deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      switch (JodaDeserializers.1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.getCurrentToken().ordinal()])
      {
      default:
        throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.START_ARRAY, "expected JSON Number or String");
      case 1:
        return new Period(paramJsonParser.getLongValue());
      case 2:
      }
      return new Period(paramJsonParser.getText());
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ext.JodaDeserializers
 * JD-Core Version:    0.6.2
 */