package com.fasterxml.jackson.core.io;

import com.fasterxml.jackson.core.util.BufferRecycler;
import com.fasterxml.jackson.core.util.TextBuffer;
import java.io.Writer;

public final class SegmentedStringWriter extends Writer
{
  protected final TextBuffer _buffer;

  public SegmentedStringWriter(BufferRecycler paramBufferRecycler)
  {
    this._buffer = new TextBuffer(paramBufferRecycler);
  }

  public Writer append(char paramChar)
  {
    write(paramChar);
    return this;
  }

  public Writer append(CharSequence paramCharSequence)
  {
    String str = paramCharSequence.toString();
    this._buffer.append(str, 0, str.length());
    return this;
  }

  public Writer append(CharSequence paramCharSequence, int paramInt1, int paramInt2)
  {
    String str = paramCharSequence.subSequence(paramInt1, paramInt2).toString();
    this._buffer.append(str, 0, str.length());
    return this;
  }

  public void close()
  {
  }

  public void flush()
  {
  }

  public String getAndClear()
  {
    String str = this._buffer.contentsAsString();
    this._buffer.releaseBuffers();
    return str;
  }

  public void write(int paramInt)
  {
    this._buffer.append((char)paramInt);
  }

  public void write(String paramString)
  {
    this._buffer.append(paramString, 0, paramString.length());
  }

  public void write(String paramString, int paramInt1, int paramInt2)
  {
    this._buffer.append(paramString, paramInt1, paramInt2);
  }

  public void write(char[] paramArrayOfChar)
  {
    this._buffer.append(paramArrayOfChar, 0, paramArrayOfChar.length);
  }

  public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    this._buffer.append(paramArrayOfChar, paramInt1, paramInt2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.io.SegmentedStringWriter
 * JD-Core Version:    0.6.2
 */