package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

@JacksonStdImpl
public class CalendarDeserializer extends StdScalarDeserializer<Calendar>
{
  protected final Class<? extends Calendar> _calendarClass;

  public CalendarDeserializer()
  {
    this(null);
  }

  public CalendarDeserializer(Class<? extends Calendar> paramClass)
  {
    super(Calendar.class);
    this._calendarClass = paramClass;
  }

  public Calendar deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    Date localDate = _parseDate(paramJsonParser, paramDeserializationContext);
    if (localDate == null)
      return null;
    if (this._calendarClass == null)
      return paramDeserializationContext.constructCalendar(localDate);
    try
    {
      Calendar localCalendar = (Calendar)this._calendarClass.newInstance();
      localCalendar.setTimeInMillis(localDate.getTime());
      return localCalendar;
    }
    catch (Exception localException)
    {
      throw paramDeserializationContext.instantiationException(this._calendarClass, localException);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.CalendarDeserializer
 * JD-Core Version:    0.6.2
 */