package org.apache.commons.io.output;

import java.io.Serializable;
import java.io.Writer;

public class StringBuilderWriter extends Writer
  implements Serializable
{
  private final StringBuilder builder;

  public StringBuilderWriter()
  {
    this.builder = new StringBuilder();
  }

  public StringBuilderWriter(int paramInt)
  {
    this.builder = new StringBuilder(paramInt);
  }

  public StringBuilderWriter(StringBuilder paramStringBuilder)
  {
    if (paramStringBuilder != null);
    while (true)
    {
      this.builder = paramStringBuilder;
      return;
      paramStringBuilder = new StringBuilder();
    }
  }

  public Writer append(char paramChar)
  {
    this.builder.append(paramChar);
    return this;
  }

  public Writer append(CharSequence paramCharSequence)
  {
    this.builder.append(paramCharSequence);
    return this;
  }

  public Writer append(CharSequence paramCharSequence, int paramInt1, int paramInt2)
  {
    this.builder.append(paramCharSequence, paramInt1, paramInt2);
    return this;
  }

  public void close()
  {
  }

  public void flush()
  {
  }

  public StringBuilder getBuilder()
  {
    return this.builder;
  }

  public String toString()
  {
    return this.builder.toString();
  }

  public void write(String paramString)
  {
    if (paramString != null)
      this.builder.append(paramString);
  }

  public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfChar != null)
      this.builder.append(paramArrayOfChar, paramInt1, paramInt2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.output.StringBuilderWriter
 * JD-Core Version:    0.6.2
 */