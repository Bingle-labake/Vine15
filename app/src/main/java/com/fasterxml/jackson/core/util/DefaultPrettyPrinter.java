package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.PrettyPrinter;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.io.SerializedString;
import java.io.IOException;
import java.io.Serializable;
import java.util.Arrays;

public class DefaultPrettyPrinter
  implements PrettyPrinter, Instantiatable<DefaultPrettyPrinter>, Serializable
{
  public static final SerializedString DEFAULT_ROOT_VALUE_SEPARATOR = new SerializedString(" ");
  private static final long serialVersionUID = -5512586643324525213L;
  protected Indenter _arrayIndenter = FixedSpaceIndenter.instance;
  protected transient int _nesting = 0;
  protected Indenter _objectIndenter = Lf2SpacesIndenter.instance;
  protected final SerializableString _rootSeparator;
  protected boolean _spacesInObjectEntries = true;

  public DefaultPrettyPrinter()
  {
    this(DEFAULT_ROOT_VALUE_SEPARATOR);
  }

  public DefaultPrettyPrinter(SerializableString paramSerializableString)
  {
    this._rootSeparator = paramSerializableString;
  }

  public DefaultPrettyPrinter(DefaultPrettyPrinter paramDefaultPrettyPrinter)
  {
    this(paramDefaultPrettyPrinter, paramDefaultPrettyPrinter._rootSeparator);
  }

  public DefaultPrettyPrinter(DefaultPrettyPrinter paramDefaultPrettyPrinter, SerializableString paramSerializableString)
  {
    this._arrayIndenter = paramDefaultPrettyPrinter._arrayIndenter;
    this._objectIndenter = paramDefaultPrettyPrinter._objectIndenter;
    this._spacesInObjectEntries = paramDefaultPrettyPrinter._spacesInObjectEntries;
    this._nesting = paramDefaultPrettyPrinter._nesting;
    this._rootSeparator = paramSerializableString;
  }

  public DefaultPrettyPrinter(String paramString)
  {
  }

  public void beforeArrayValues(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    this._arrayIndenter.writeIndentation(paramJsonGenerator, this._nesting);
  }

  public void beforeObjectEntries(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    this._objectIndenter.writeIndentation(paramJsonGenerator, this._nesting);
  }

  public DefaultPrettyPrinter createInstance()
  {
    return new DefaultPrettyPrinter(this);
  }

  public void indentArraysWith(Indenter paramIndenter)
  {
    if (paramIndenter == null)
      paramIndenter = NopIndenter.instance;
    this._arrayIndenter = paramIndenter;
  }

  public void indentObjectsWith(Indenter paramIndenter)
  {
    if (paramIndenter == null)
      paramIndenter = NopIndenter.instance;
    this._objectIndenter = paramIndenter;
  }

  public void spacesInObjectEntries(boolean paramBoolean)
  {
    this._spacesInObjectEntries = paramBoolean;
  }

  public DefaultPrettyPrinter withRootSeparator(SerializableString paramSerializableString)
  {
    if ((this._rootSeparator == paramSerializableString) || ((paramSerializableString != null) && (paramSerializableString.equals(this._rootSeparator))))
      return this;
    return new DefaultPrettyPrinter(this, paramSerializableString);
  }

  public void writeArrayValueSeparator(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw(',');
    this._arrayIndenter.writeIndentation(paramJsonGenerator, this._nesting);
  }

  public void writeEndArray(JsonGenerator paramJsonGenerator, int paramInt)
    throws IOException, JsonGenerationException
  {
    if (!this._arrayIndenter.isInline())
      this._nesting = (-1 + this._nesting);
    if (paramInt > 0)
      this._arrayIndenter.writeIndentation(paramJsonGenerator, this._nesting);
    while (true)
    {
      paramJsonGenerator.writeRaw(']');
      return;
      paramJsonGenerator.writeRaw(' ');
    }
  }

  public void writeEndObject(JsonGenerator paramJsonGenerator, int paramInt)
    throws IOException, JsonGenerationException
  {
    if (!this._objectIndenter.isInline())
      this._nesting = (-1 + this._nesting);
    if (paramInt > 0)
      this._objectIndenter.writeIndentation(paramJsonGenerator, this._nesting);
    while (true)
    {
      paramJsonGenerator.writeRaw('}');
      return;
      paramJsonGenerator.writeRaw(' ');
    }
  }

  public void writeObjectEntrySeparator(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw(',');
    this._objectIndenter.writeIndentation(paramJsonGenerator, this._nesting);
  }

  public void writeObjectFieldValueSeparator(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    if (this._spacesInObjectEntries)
    {
      paramJsonGenerator.writeRaw(" : ");
      return;
    }
    paramJsonGenerator.writeRaw(':');
  }

  public void writeRootValueSeparator(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    if (this._rootSeparator != null)
      paramJsonGenerator.writeRaw(this._rootSeparator);
  }

  public void writeStartArray(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    if (!this._arrayIndenter.isInline())
      this._nesting = (1 + this._nesting);
    paramJsonGenerator.writeRaw('[');
  }

  public void writeStartObject(JsonGenerator paramJsonGenerator)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeRaw('{');
    if (!this._objectIndenter.isInline())
      this._nesting = (1 + this._nesting);
  }

  public static class FixedSpaceIndenter extends DefaultPrettyPrinter.NopIndenter
  {
    public static final FixedSpaceIndenter instance = new FixedSpaceIndenter();

    public boolean isInline()
    {
      return true;
    }

    public void writeIndentation(JsonGenerator paramJsonGenerator, int paramInt)
      throws IOException, JsonGenerationException
    {
      paramJsonGenerator.writeRaw(' ');
    }
  }

  public static abstract interface Indenter
  {
    public abstract boolean isInline();

    public abstract void writeIndentation(JsonGenerator paramJsonGenerator, int paramInt)
      throws IOException, JsonGenerationException;
  }

  public static class Lf2SpacesIndenter extends DefaultPrettyPrinter.NopIndenter
  {
    static final char[] SPACES;
    static final int SPACE_COUNT = 64;
    private static final String SYS_LF;
    public static final Lf2SpacesIndenter instance = new Lf2SpacesIndenter();

    static
    {
      try
      {
        String str2 = System.getProperty("line.separator");
        str1 = str2;
        if (str1 == null)
          str1 = "\n";
        SYS_LF = str1;
        SPACES = new char[64];
        Arrays.fill(SPACES, ' ');
        return;
      }
      catch (Throwable localThrowable)
      {
        while (true)
          String str1 = null;
      }
    }

    public boolean isInline()
    {
      return false;
    }

    public void writeIndentation(JsonGenerator paramJsonGenerator, int paramInt)
      throws IOException, JsonGenerationException
    {
      paramJsonGenerator.writeRaw(SYS_LF);
      if (paramInt > 0)
      {
        int i = paramInt + paramInt;
        while (i > 64)
        {
          paramJsonGenerator.writeRaw(SPACES, 0, 64);
          i -= SPACES.length;
        }
        paramJsonGenerator.writeRaw(SPACES, 0, i);
      }
    }
  }

  public static class NopIndenter
    implements DefaultPrettyPrinter.Indenter, Serializable
  {
    public static final NopIndenter instance = new NopIndenter();

    public boolean isInline()
    {
      return true;
    }

    public void writeIndentation(JsonGenerator paramJsonGenerator, int paramInt)
      throws IOException, JsonGenerationException
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.util.DefaultPrettyPrinter
 * JD-Core Version:    0.6.2
 */