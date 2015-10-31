package com.flurry.org.codehaus.jackson.map.ext;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.deser.std.FromStringDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdScalarDeserializer;
import com.flurry.org.codehaus.jackson.map.util.Provider;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.Duration;
import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.namespace.QName;

public class CoreXMLDeserializers
  implements Provider<StdDeserializer<?>>
{
  static final DatatypeFactory _dataTypeFactory;

  static
  {
    try
    {
      _dataTypeFactory = DatatypeFactory.newInstance();
      return;
    }
    catch (DatatypeConfigurationException localDatatypeConfigurationException)
    {
      throw new RuntimeException(localDatatypeConfigurationException);
    }
  }

  public Collection<StdDeserializer<?>> provide()
  {
    StdDeserializer[] arrayOfStdDeserializer = new StdDeserializer[3];
    arrayOfStdDeserializer[0] = new DurationDeserializer();
    arrayOfStdDeserializer[1] = new GregorianCalendarDeserializer();
    arrayOfStdDeserializer[2] = new QNameDeserializer();
    return Arrays.asList(arrayOfStdDeserializer);
  }

  public static class DurationDeserializer extends FromStringDeserializer<Duration>
  {
    public DurationDeserializer()
    {
      super();
    }

    protected Duration _deserialize(String paramString, DeserializationContext paramDeserializationContext)
      throws IllegalArgumentException
    {
      return CoreXMLDeserializers._dataTypeFactory.newDuration(paramString);
    }
  }

  public static class GregorianCalendarDeserializer extends StdScalarDeserializer<XMLGregorianCalendar>
  {
    public GregorianCalendarDeserializer()
    {
      super();
    }

    public XMLGregorianCalendar deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      Date localDate = _parseDate(paramJsonParser, paramDeserializationContext);
      if (localDate == null)
        return null;
      GregorianCalendar localGregorianCalendar = new GregorianCalendar();
      localGregorianCalendar.setTime(localDate);
      return CoreXMLDeserializers._dataTypeFactory.newXMLGregorianCalendar(localGregorianCalendar);
    }
  }

  public static class QNameDeserializer extends FromStringDeserializer<QName>
  {
    public QNameDeserializer()
    {
      super();
    }

    protected QName _deserialize(String paramString, DeserializationContext paramDeserializationContext)
      throws IllegalArgumentException
    {
      return QName.valueOf(paramString);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ext.CoreXMLDeserializers
 * JD-Core Version:    0.6.2
 */