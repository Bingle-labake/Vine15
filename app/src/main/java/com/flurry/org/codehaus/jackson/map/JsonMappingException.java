package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.JsonLocation;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import java.io.Serializable;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class JsonMappingException extends JsonProcessingException
{
  static final int MAX_REFS_TO_LIST = 1000;
  private static final long serialVersionUID = 1L;
  protected LinkedList<Reference> _path;

  public JsonMappingException(String paramString)
  {
    super(paramString);
  }

  public JsonMappingException(String paramString, JsonLocation paramJsonLocation)
  {
    super(paramString, paramJsonLocation);
  }

  public JsonMappingException(String paramString, JsonLocation paramJsonLocation, Throwable paramThrowable)
  {
    super(paramString, paramJsonLocation, paramThrowable);
  }

  public JsonMappingException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }

  public static JsonMappingException from(JsonParser paramJsonParser, String paramString)
  {
    return new JsonMappingException(paramString, paramJsonParser.getTokenLocation());
  }

  public static JsonMappingException from(JsonParser paramJsonParser, String paramString, Throwable paramThrowable)
  {
    return new JsonMappingException(paramString, paramJsonParser.getTokenLocation(), paramThrowable);
  }

  public static JsonMappingException wrapWithPath(Throwable paramThrowable, Reference paramReference)
  {
    if ((paramThrowable instanceof JsonMappingException));
    String str;
    for (JsonMappingException localJsonMappingException = (JsonMappingException)paramThrowable; ; localJsonMappingException = new JsonMappingException(str, null, paramThrowable))
    {
      localJsonMappingException.prependPath(paramReference);
      return localJsonMappingException;
      str = paramThrowable.getMessage();
      if ((str == null) || (str.length() == 0))
        str = "(was " + paramThrowable.getClass().getName() + ")";
    }
  }

  public static JsonMappingException wrapWithPath(Throwable paramThrowable, Object paramObject, int paramInt)
  {
    return wrapWithPath(paramThrowable, new Reference(paramObject, paramInt));
  }

  public static JsonMappingException wrapWithPath(Throwable paramThrowable, Object paramObject, String paramString)
  {
    return wrapWithPath(paramThrowable, new Reference(paramObject, paramString));
  }

  protected void _appendPathDesc(StringBuilder paramStringBuilder)
  {
    Iterator localIterator = this._path.iterator();
    while (localIterator.hasNext())
    {
      paramStringBuilder.append(((Reference)localIterator.next()).toString());
      if (localIterator.hasNext())
        paramStringBuilder.append("->");
    }
  }

  public String getMessage()
  {
    String str = super.getMessage();
    if (this._path == null)
      return str;
    if (str == null);
    for (StringBuilder localStringBuilder = new StringBuilder(); ; localStringBuilder = new StringBuilder(str))
    {
      localStringBuilder.append(" (through reference chain: ");
      _appendPathDesc(localStringBuilder);
      localStringBuilder.append(')');
      return localStringBuilder.toString();
    }
  }

  public List<Reference> getPath()
  {
    if (this._path == null)
      return Collections.emptyList();
    return Collections.unmodifiableList(this._path);
  }

  public void prependPath(Reference paramReference)
  {
    if (this._path == null)
      this._path = new LinkedList();
    if (this._path.size() < 1000)
      this._path.addFirst(paramReference);
  }

  public void prependPath(Object paramObject, int paramInt)
  {
    prependPath(new Reference(paramObject, paramInt));
  }

  public void prependPath(Object paramObject, String paramString)
  {
    prependPath(new Reference(paramObject, paramString));
  }

  public String toString()
  {
    return getClass().getName() + ": " + getMessage();
  }

  public static class Reference
    implements Serializable
  {
    private static final long serialVersionUID = 1L;
    protected String _fieldName;
    protected Object _from;
    protected int _index = -1;

    protected Reference()
    {
    }

    public Reference(Object paramObject)
    {
      this._from = paramObject;
    }

    public Reference(Object paramObject, int paramInt)
    {
      this._from = paramObject;
      this._index = paramInt;
    }

    public Reference(Object paramObject, String paramString)
    {
      this._from = paramObject;
      if (paramString == null)
        throw new NullPointerException("Can not pass null fieldName");
      this._fieldName = paramString;
    }

    public String getFieldName()
    {
      return this._fieldName;
    }

    public Object getFrom()
    {
      return this._from;
    }

    public int getIndex()
    {
      return this._index;
    }

    public void setFieldName(String paramString)
    {
      this._fieldName = paramString;
    }

    public void setFrom(Object paramObject)
    {
      this._from = paramObject;
    }

    public void setIndex(int paramInt)
    {
      this._index = paramInt;
    }

    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      Class localClass;
      if ((this._from instanceof Class))
      {
        localClass = (Class)this._from;
        Package localPackage = localClass.getPackage();
        if (localPackage != null)
        {
          localStringBuilder.append(localPackage.getName());
          localStringBuilder.append('.');
        }
        localStringBuilder.append(localClass.getSimpleName());
        localStringBuilder.append('[');
        if (this._fieldName == null)
          break label120;
        localStringBuilder.append('"');
        localStringBuilder.append(this._fieldName);
        localStringBuilder.append('"');
      }
      while (true)
      {
        localStringBuilder.append(']');
        return localStringBuilder.toString();
        localClass = this._from.getClass();
        break;
        label120: if (this._index >= 0)
          localStringBuilder.append(this._index);
        else
          localStringBuilder.append('?');
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.JsonMappingException
 * JD-Core Version:    0.6.2
 */