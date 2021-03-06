package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.DeserializationProblemHandler;
import com.flurry.org.codehaus.jackson.map.DeserializerProvider;
import com.flurry.org.codehaus.jackson.map.InjectableValues;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.exc.UnrecognizedPropertyException;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import com.flurry.org.codehaus.jackson.map.util.LinkedNode;
import com.flurry.org.codehaus.jackson.map.util.ObjectBuffer;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

public class StdDeserializationContext extends DeserializationContext
{
  static final int MAX_ERROR_STR_LEN = 500;
  protected ArrayBuilders _arrayBuilders;
  protected DateFormat _dateFormat;
  protected final DeserializerProvider _deserProvider;
  protected final InjectableValues _injectableValues;
  protected ObjectBuffer _objectBuffer;
  protected JsonParser _parser;

  public StdDeserializationContext(DeserializationConfig paramDeserializationConfig, JsonParser paramJsonParser, DeserializerProvider paramDeserializerProvider, InjectableValues paramInjectableValues)
  {
    super(paramDeserializationConfig);
    this._parser = paramJsonParser;
    this._deserProvider = paramDeserializerProvider;
    this._injectableValues = paramInjectableValues;
  }

  protected String _calcName(Class<?> paramClass)
  {
    if (paramClass.isArray())
      return _calcName(paramClass.getComponentType()) + "[]";
    return paramClass.getName();
  }

  protected String _desc(String paramString)
  {
    if (paramString.length() > 500)
      paramString = paramString.substring(0, 500) + "]...[" + paramString.substring(-500 + paramString.length());
    return paramString;
  }

  protected String _valueDesc()
  {
    try
    {
      String str = _desc(this._parser.getText());
      return str;
    }
    catch (Exception localException)
    {
    }
    return "[N/A]";
  }

  public Calendar constructCalendar(Date paramDate)
  {
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.setTime(paramDate);
    return localCalendar;
  }

  protected String determineClassName(Object paramObject)
  {
    return ClassUtil.getClassDescription(paramObject);
  }

  public Object findInjectableValue(Object paramObject1, BeanProperty paramBeanProperty, Object paramObject2)
  {
    if (this._injectableValues == null)
      throw new IllegalStateException("No 'injectableValues' configured, can not inject value with id [" + paramObject1 + "]");
    return this._injectableValues.findInjectableValue(paramObject1, this, paramBeanProperty, paramObject2);
  }

  public final ArrayBuilders getArrayBuilders()
  {
    if (this._arrayBuilders == null)
      this._arrayBuilders = new ArrayBuilders();
    return this._arrayBuilders;
  }

  protected DateFormat getDateFormat()
  {
    if (this._dateFormat == null)
      this._dateFormat = ((DateFormat)this._config.getDateFormat().clone());
    return this._dateFormat;
  }

  public DeserializerProvider getDeserializerProvider()
  {
    return this._deserProvider;
  }

  public JsonParser getParser()
  {
    return this._parser;
  }

  public boolean handleUnknownProperty(JsonParser paramJsonParser, JsonDeserializer<?> paramJsonDeserializer, Object paramObject, String paramString)
    throws IOException, JsonProcessingException
  {
    Object localObject1 = this._config.getProblemHandlers();
    JsonParser localJsonParser;
    if (localObject1 != null)
    {
      localJsonParser = this._parser;
      this._parser = paramJsonParser;
    }
    while (true)
    {
      if (localObject1 != null);
      try
      {
        boolean bool = ((DeserializationProblemHandler)((LinkedNode)localObject1).value()).handleUnknownProperty(this, paramJsonDeserializer, paramObject, paramString);
        if (bool)
          return true;
        LinkedNode localLinkedNode = ((LinkedNode)localObject1).next();
        localObject1 = localLinkedNode;
        continue;
        return false;
      }
      finally
      {
        this._parser = localJsonParser;
      }
    }
  }

  public JsonMappingException instantiationException(Class<?> paramClass, String paramString)
  {
    return JsonMappingException.from(this._parser, "Can not construct instance of " + paramClass.getName() + ", problem: " + paramString);
  }

  public JsonMappingException instantiationException(Class<?> paramClass, Throwable paramThrowable)
  {
    return JsonMappingException.from(this._parser, "Can not construct instance of " + paramClass.getName() + ", problem: " + paramThrowable.getMessage(), paramThrowable);
  }

  public final ObjectBuffer leaseObjectBuffer()
  {
    ObjectBuffer localObjectBuffer = this._objectBuffer;
    if (localObjectBuffer == null)
      return new ObjectBuffer();
    this._objectBuffer = null;
    return localObjectBuffer;
  }

  public JsonMappingException mappingException(Class<?> paramClass)
  {
    return mappingException(paramClass, this._parser.getCurrentToken());
  }

  public JsonMappingException mappingException(Class<?> paramClass, JsonToken paramJsonToken)
  {
    String str = _calcName(paramClass);
    return JsonMappingException.from(this._parser, "Can not deserialize instance of " + str + " out of " + paramJsonToken + " token");
  }

  public Date parseDate(String paramString)
    throws IllegalArgumentException
  {
    try
    {
      Date localDate = getDateFormat().parse(paramString);
      return localDate;
    }
    catch (ParseException localParseException)
    {
      throw new IllegalArgumentException(localParseException.getMessage());
    }
  }

  public final void returnObjectBuffer(ObjectBuffer paramObjectBuffer)
  {
    if ((this._objectBuffer == null) || (paramObjectBuffer.initialCapacity() >= this._objectBuffer.initialCapacity()))
      this._objectBuffer = paramObjectBuffer;
  }

  public JsonMappingException unknownFieldException(Object paramObject, String paramString)
  {
    return UnrecognizedPropertyException.from(this._parser, paramObject, paramString);
  }

  public JsonMappingException unknownTypeException(JavaType paramJavaType, String paramString)
  {
    return JsonMappingException.from(this._parser, "Could not resolve type id '" + paramString + "' into a subtype of " + paramJavaType);
  }

  public JsonMappingException weirdKeyException(Class<?> paramClass, String paramString1, String paramString2)
  {
    return JsonMappingException.from(this._parser, "Can not construct Map key of type " + paramClass.getName() + " from String \"" + _desc(paramString1) + "\": " + paramString2);
  }

  public JsonMappingException weirdNumberException(Class<?> paramClass, String paramString)
  {
    return JsonMappingException.from(this._parser, "Can not construct instance of " + paramClass.getName() + " from number value (" + _valueDesc() + "): " + paramString);
  }

  public JsonMappingException weirdStringException(Class<?> paramClass, String paramString)
  {
    return JsonMappingException.from(this._parser, "Can not construct instance of " + paramClass.getName() + " from String value '" + _valueDesc() + "': " + paramString);
  }

  public JsonMappingException wrongTokenException(JsonParser paramJsonParser, JsonToken paramJsonToken, String paramString)
  {
    return JsonMappingException.from(paramJsonParser, "Unexpected token (" + paramJsonParser.getCurrentToken() + "), expected " + paramJsonToken + ": " + paramString);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.StdDeserializationContext
 * JD-Core Version:    0.6.2
 */