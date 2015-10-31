package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.io.NumberInput;
import java.math.BigDecimal;
import java.util.ArrayList;

public final class TextBuffer
{
  static final int MAX_SEGMENT_LEN = 262144;
  static final int MIN_SEGMENT_LEN = 1000;
  static final char[] NO_CHARS = new char[0];
  private final BufferRecycler _allocator;
  private char[] _currentSegment;
  private int _currentSize;
  private boolean _hasSegments = false;
  private char[] _inputBuffer;
  private int _inputLen;
  private int _inputStart;
  private char[] _resultArray;
  private String _resultString;
  private int _segmentSize;
  private ArrayList<char[]> _segments;

  public TextBuffer(BufferRecycler paramBufferRecycler)
  {
    this._allocator = paramBufferRecycler;
  }

  private char[] _charArray(int paramInt)
  {
    return new char[paramInt];
  }

  private char[] buildResultArray()
  {
    if (this._resultString != null)
      return this._resultString.toCharArray();
    if (this._inputStart >= 0)
    {
      if (this._inputLen < 1)
        return NO_CHARS;
      char[] arrayOfChar3 = _charArray(this._inputLen);
      System.arraycopy(this._inputBuffer, this._inputStart, arrayOfChar3, 0, this._inputLen);
      return arrayOfChar3;
    }
    int i = size();
    if (i < 1)
      return NO_CHARS;
    char[] arrayOfChar1 = _charArray(i);
    int n;
    if (this._segments != null)
    {
      int k = this._segments.size();
      int m = 0;
      n = 0;
      while (m < k)
      {
        char[] arrayOfChar2 = (char[])this._segments.get(m);
        int i1 = arrayOfChar2.length;
        System.arraycopy(arrayOfChar2, 0, arrayOfChar1, n, i1);
        n += i1;
        m++;
      }
    }
    for (int j = n; ; j = 0)
    {
      System.arraycopy(this._currentSegment, 0, arrayOfChar1, j, this._currentSize);
      return arrayOfChar1;
    }
  }

  private void clearSegments()
  {
    this._hasSegments = false;
    this._segments.clear();
    this._segmentSize = 0;
    this._currentSize = 0;
  }

  private void expand(int paramInt)
  {
    if (this._segments == null)
      this._segments = new ArrayList();
    char[] arrayOfChar1 = this._currentSegment;
    this._hasSegments = true;
    this._segments.add(arrayOfChar1);
    this._segmentSize += arrayOfChar1.length;
    int i = arrayOfChar1.length;
    int j = i >> 1;
    if (j < paramInt);
    while (true)
    {
      char[] arrayOfChar2 = _charArray(Math.min(262144, i + paramInt));
      this._currentSize = 0;
      this._currentSegment = arrayOfChar2;
      return;
      paramInt = j;
    }
  }

  private char[] findBuffer(int paramInt)
  {
    if (this._allocator != null)
      return this._allocator.allocCharBuffer(BufferRecycler.CharBufferType.TEXT_BUFFER, paramInt);
    return new char[Math.max(paramInt, 1000)];
  }

  private void unshare(int paramInt)
  {
    int i = this._inputLen;
    this._inputLen = 0;
    char[] arrayOfChar = this._inputBuffer;
    this._inputBuffer = null;
    int j = this._inputStart;
    this._inputStart = -1;
    int k = i + paramInt;
    if ((this._currentSegment == null) || (k > this._currentSegment.length))
      this._currentSegment = findBuffer(k);
    if (i > 0)
      System.arraycopy(arrayOfChar, j, this._currentSegment, 0, i);
    this._segmentSize = 0;
    this._currentSize = i;
  }

  public void append(char paramChar)
  {
    if (this._inputStart >= 0)
      unshare(16);
    this._resultString = null;
    this._resultArray = null;
    char[] arrayOfChar = this._currentSegment;
    if (this._currentSize >= arrayOfChar.length)
    {
      expand(1);
      arrayOfChar = this._currentSegment;
    }
    int i = this._currentSize;
    this._currentSize = (i + 1);
    arrayOfChar[i] = paramChar;
  }

  public void append(String paramString, int paramInt1, int paramInt2)
  {
    if (this._inputStart >= 0)
      unshare(paramInt2);
    this._resultString = null;
    this._resultArray = null;
    char[] arrayOfChar = this._currentSegment;
    int i = arrayOfChar.length - this._currentSize;
    if (i >= paramInt2)
    {
      paramString.getChars(paramInt1, paramInt1 + paramInt2, arrayOfChar, this._currentSize);
      this._currentSize = (paramInt2 + this._currentSize);
      return;
    }
    if (i > 0)
    {
      paramString.getChars(paramInt1, paramInt1 + i, arrayOfChar, this._currentSize);
      paramInt2 -= i;
      paramInt1 += i;
    }
    do
    {
      expand(paramInt2);
      int j = Math.min(this._currentSegment.length, paramInt2);
      paramString.getChars(paramInt1, paramInt1 + j, this._currentSegment, 0);
      this._currentSize = (j + this._currentSize);
      paramInt1 += j;
      paramInt2 -= j;
    }
    while (paramInt2 > 0);
  }

  public void append(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    if (this._inputStart >= 0)
      unshare(paramInt2);
    this._resultString = null;
    this._resultArray = null;
    char[] arrayOfChar = this._currentSegment;
    int i = arrayOfChar.length - this._currentSize;
    if (i >= paramInt2)
    {
      System.arraycopy(paramArrayOfChar, paramInt1, arrayOfChar, this._currentSize, paramInt2);
      this._currentSize = (paramInt2 + this._currentSize);
      return;
    }
    if (i > 0)
    {
      System.arraycopy(paramArrayOfChar, paramInt1, arrayOfChar, this._currentSize, i);
      paramInt1 += i;
      paramInt2 -= i;
    }
    do
    {
      expand(paramInt2);
      int j = Math.min(this._currentSegment.length, paramInt2);
      System.arraycopy(paramArrayOfChar, paramInt1, this._currentSegment, 0, j);
      this._currentSize = (j + this._currentSize);
      paramInt1 += j;
      paramInt2 -= j;
    }
    while (paramInt2 > 0);
  }

  public char[] contentsAsArray()
  {
    char[] arrayOfChar = this._resultArray;
    if (arrayOfChar == null)
    {
      arrayOfChar = buildResultArray();
      this._resultArray = arrayOfChar;
    }
    return arrayOfChar;
  }

  public BigDecimal contentsAsDecimal()
    throws NumberFormatException
  {
    if (this._resultArray != null)
      return new BigDecimal(this._resultArray);
    if (this._inputStart >= 0)
      return new BigDecimal(this._inputBuffer, this._inputStart, this._inputLen);
    if (this._segmentSize == 0)
      return new BigDecimal(this._currentSegment, 0, this._currentSize);
    return new BigDecimal(contentsAsArray());
  }

  public double contentsAsDouble()
    throws NumberFormatException
  {
    return NumberInput.parseDouble(contentsAsString());
  }

  public String contentsAsString()
  {
    if (this._resultString == null)
    {
      if (this._resultArray == null)
        break label34;
      this._resultString = new String(this._resultArray);
    }
    while (true)
    {
      return this._resultString;
      label34: if (this._inputStart >= 0)
      {
        if (this._inputLen < 1)
        {
          this._resultString = "";
          return "";
        }
        this._resultString = new String(this._inputBuffer, this._inputStart, this._inputLen);
      }
      else
      {
        int i = this._segmentSize;
        int j = this._currentSize;
        if (i == 0)
        {
          if (j == 0);
          for (String str = ""; ; str = new String(this._currentSegment, 0, j))
          {
            this._resultString = str;
            break;
          }
        }
        StringBuilder localStringBuilder = new StringBuilder(i + j);
        if (this._segments != null)
        {
          int k = this._segments.size();
          for (int m = 0; m < k; m++)
          {
            char[] arrayOfChar = (char[])this._segments.get(m);
            localStringBuilder.append(arrayOfChar, 0, arrayOfChar.length);
          }
        }
        localStringBuilder.append(this._currentSegment, 0, this._currentSize);
        this._resultString = localStringBuilder.toString();
      }
    }
  }

  public char[] emptyAndGetCurrentSegment()
  {
    this._inputStart = -1;
    this._currentSize = 0;
    this._inputLen = 0;
    this._inputBuffer = null;
    this._resultString = null;
    this._resultArray = null;
    if (this._hasSegments)
      clearSegments();
    char[] arrayOfChar = this._currentSegment;
    if (arrayOfChar == null)
    {
      arrayOfChar = findBuffer(0);
      this._currentSegment = arrayOfChar;
    }
    return arrayOfChar;
  }

  public void ensureNotShared()
  {
    if (this._inputStart >= 0)
      unshare(16);
  }

  public char[] expandCurrentSegment()
  {
    char[] arrayOfChar = this._currentSegment;
    int i = arrayOfChar.length;
    if (i == 262144);
    for (int j = 262145; ; j = Math.min(262144, i + (i >> 1)))
    {
      this._currentSegment = _charArray(j);
      System.arraycopy(arrayOfChar, 0, this._currentSegment, 0, i);
      return this._currentSegment;
    }
  }

  public char[] finishCurrentSegment()
  {
    if (this._segments == null)
      this._segments = new ArrayList();
    this._hasSegments = true;
    this._segments.add(this._currentSegment);
    int i = this._currentSegment.length;
    this._segmentSize = (i + this._segmentSize);
    char[] arrayOfChar = _charArray(Math.min(i + (i >> 1), 262144));
    this._currentSize = 0;
    this._currentSegment = arrayOfChar;
    return arrayOfChar;
  }

  public char[] getCurrentSegment()
  {
    if (this._inputStart >= 0)
      unshare(1);
    while (true)
    {
      return this._currentSegment;
      char[] arrayOfChar = this._currentSegment;
      if (arrayOfChar == null)
        this._currentSegment = findBuffer(0);
      else if (this._currentSize >= arrayOfChar.length)
        expand(1);
    }
  }

  public int getCurrentSegmentSize()
  {
    return this._currentSize;
  }

  public char[] getTextBuffer()
  {
    if (this._inputStart >= 0)
      return this._inputBuffer;
    if (this._resultArray != null)
      return this._resultArray;
    if (this._resultString != null)
    {
      char[] arrayOfChar = this._resultString.toCharArray();
      this._resultArray = arrayOfChar;
      return arrayOfChar;
    }
    if (!this._hasSegments)
      return this._currentSegment;
    return contentsAsArray();
  }

  public int getTextOffset()
  {
    if (this._inputStart >= 0)
      return this._inputStart;
    return 0;
  }

  public boolean hasTextAsCharacters()
  {
    if ((this._inputStart >= 0) || (this._resultArray != null));
    while (this._resultString == null)
      return true;
    return false;
  }

  public void releaseBuffers()
  {
    if (this._allocator == null)
      resetWithEmpty();
    while (this._currentSegment == null)
      return;
    resetWithEmpty();
    char[] arrayOfChar = this._currentSegment;
    this._currentSegment = null;
    this._allocator.releaseCharBuffer(BufferRecycler.CharBufferType.TEXT_BUFFER, arrayOfChar);
  }

  public void resetWithCopy(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    this._inputBuffer = null;
    this._inputStart = -1;
    this._inputLen = 0;
    this._resultString = null;
    this._resultArray = null;
    if (this._hasSegments)
      clearSegments();
    while (true)
    {
      this._segmentSize = 0;
      this._currentSize = 0;
      append(paramArrayOfChar, paramInt1, paramInt2);
      return;
      if (this._currentSegment == null)
        this._currentSegment = findBuffer(paramInt2);
    }
  }

  public void resetWithEmpty()
  {
    this._inputStart = -1;
    this._currentSize = 0;
    this._inputLen = 0;
    this._inputBuffer = null;
    this._resultString = null;
    this._resultArray = null;
    if (this._hasSegments)
      clearSegments();
  }

  public void resetWithShared(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    this._resultString = null;
    this._resultArray = null;
    this._inputBuffer = paramArrayOfChar;
    this._inputStart = paramInt1;
    this._inputLen = paramInt2;
    if (this._hasSegments)
      clearSegments();
  }

  public void resetWithString(String paramString)
  {
    this._inputBuffer = null;
    this._inputStart = -1;
    this._inputLen = 0;
    this._resultString = paramString;
    this._resultArray = null;
    if (this._hasSegments)
      clearSegments();
    this._currentSize = 0;
  }

  public void setCurrentLength(int paramInt)
  {
    this._currentSize = paramInt;
  }

  public int size()
  {
    if (this._inputStart >= 0)
      return this._inputLen;
    if (this._resultArray != null)
      return this._resultArray.length;
    if (this._resultString != null)
      return this._resultString.length();
    return this._segmentSize + this._currentSize;
  }

  public String toString()
  {
    return contentsAsString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.util.TextBuffer
 * JD-Core Version:    0.6.2
 */