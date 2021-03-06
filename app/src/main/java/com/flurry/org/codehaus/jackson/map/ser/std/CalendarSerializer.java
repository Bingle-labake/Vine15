package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.map.SerializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Calendar;

@JacksonStdImpl
public class CalendarSerializer extends ScalarSerializerBase<Calendar>
{
  public static CalendarSerializer instance = new CalendarSerializer();

  public CalendarSerializer()
  {
    super(Calendar.class);
  }

  public JsonNode getSchema(SerializerProvider paramSerializerProvider, Type paramType)
  {
    if (paramSerializerProvider.isEnabled(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS));
    for (String str = "number"; ; str = "string")
      return createSchemaNode(str, true);
  }

  public void serialize(Calendar paramCalendar, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    paramSerializerProvider.defaultSerializeDateValue(paramCalendar.getTimeInMillis(), paramJsonGenerator);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.CalendarSerializer
 * JD-Core Version:    0.6.2
 */