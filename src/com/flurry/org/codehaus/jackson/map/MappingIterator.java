package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonStreamContext;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class MappingIterator<T>
  implements Iterator<T>
{
  protected static final MappingIterator<?> EMPTY_ITERATOR = new MappingIterator(null, null, null, null, false, null);
  protected final boolean _closeParser;
  protected final DeserializationContext _context;
  protected final JsonDeserializer<T> _deserializer;
  protected boolean _hasNextChecked;
  protected JsonParser _parser;
  protected final JavaType _type;
  protected final T _updatedValue;

  protected MappingIterator(JavaType paramJavaType, JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, JsonDeserializer<?> paramJsonDeserializer)
  {
    this(paramJavaType, paramJsonParser, paramDeserializationContext, paramJsonDeserializer, true, null);
  }

  protected MappingIterator(JavaType paramJavaType, JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, JsonDeserializer<?> paramJsonDeserializer, boolean paramBoolean, Object paramObject)
  {
    this._type = paramJavaType;
    this._parser = paramJsonParser;
    this._context = paramDeserializationContext;
    this._deserializer = paramJsonDeserializer;
    if ((paramJsonParser != null) && (paramJsonParser.getCurrentToken() == JsonToken.START_ARRAY) && (!paramJsonParser.getParsingContext().inRoot()))
      paramJsonParser.clearCurrentToken();
    this._closeParser = paramBoolean;
    if (paramObject == null)
    {
      this._updatedValue = null;
      return;
    }
    this._updatedValue = paramObject;
  }

  protected static <T> MappingIterator<T> emptyIterator()
  {
    return EMPTY_ITERATOR;
  }

  public boolean hasNext()
  {
    try
    {
      boolean bool = hasNextValue();
      return bool;
    }
    catch (JsonMappingException localJsonMappingException)
    {
      throw new RuntimeJsonMappingException(localJsonMappingException.getMessage(), localJsonMappingException);
    }
    catch (IOException localIOException)
    {
      throw new RuntimeException(localIOException.getMessage(), localIOException);
    }
  }

  public boolean hasNextValue()
    throws IOException
  {
    if (this._parser == null);
    JsonToken localJsonToken2;
    do
    {
      JsonParser localJsonParser;
      do
      {
        return false;
        if (this._hasNextChecked)
          break label75;
        JsonToken localJsonToken1 = this._parser.getCurrentToken();
        this._hasNextChecked = true;
        if (localJsonToken1 != null)
          break label75;
        localJsonToken2 = this._parser.nextToken();
        if (localJsonToken2 != null)
          break;
        localJsonParser = this._parser;
        this._parser = null;
      }
      while (!this._closeParser);
      localJsonParser.close();
      return false;
    }
    while (localJsonToken2 == JsonToken.END_ARRAY);
    label75: return true;
  }

  public T next()
  {
    try
    {
      Object localObject = nextValue();
      return localObject;
    }
    catch (JsonMappingException localJsonMappingException)
    {
      throw new RuntimeJsonMappingException(localJsonMappingException.getMessage(), localJsonMappingException);
    }
    catch (IOException localIOException)
    {
      throw new RuntimeException(localIOException.getMessage(), localIOException);
    }
  }

  public T nextValue()
    throws IOException
  {
    if ((!this._hasNextChecked) && (!hasNextValue()))
      throw new NoSuchElementException();
    if (this._parser == null)
      throw new NoSuchElementException();
    this._hasNextChecked = false;
    if (this._updatedValue == null);
    for (Object localObject = this._deserializer.deserialize(this._parser, this._context); ; localObject = this._updatedValue)
    {
      this._parser.clearCurrentToken();
      return localObject;
      this._deserializer.deserialize(this._parser, this._context, this._updatedValue);
    }
  }

  public void remove()
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.MappingIterator
 * JD-Core Version:    0.6.2
 */