package com.fasterxml.jackson.core.io;

import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;
import java.lang.ref.SoftReference;

public final class JsonStringEncoder
{
  private static final byte[] HEX_BYTES = CharTypes.copyHexBytes();
  private static final char[] HEX_CHARS = CharTypes.copyHexChars();
  private static final int INT_0 = 48;
  private static final int INT_BACKSLASH = 92;
  private static final int INT_U = 117;
  private static final int SURR1_FIRST = 55296;
  private static final int SURR1_LAST = 56319;
  private static final int SURR2_FIRST = 56320;
  private static final int SURR2_LAST = 57343;
  protected static final ThreadLocal<SoftReference<JsonStringEncoder>> _threadEncoder = new ThreadLocal();
  protected ByteArrayBuilder _byteBuilder;
  protected final char[] _quoteBuffer = new char[6];
  protected TextBuffer _textBuffer;

  public JsonStringEncoder()
  {
    this._quoteBuffer[0] = '\\';
    this._quoteBuffer[2] = '0';
    this._quoteBuffer[3] = '0';
  }

  private int _appendByteEscape(int paramInt1, int paramInt2, ByteArrayBuilder paramByteArrayBuilder, int paramInt3)
  {
    paramByteArrayBuilder.setCurrentSegmentLength(paramInt3);
    paramByteArrayBuilder.append(92);
    if (paramInt2 < 0)
    {
      paramByteArrayBuilder.append(117);
      if (paramInt1 > 255)
      {
        int i = paramInt1 >> 8;
        paramByteArrayBuilder.append(HEX_BYTES[(i >> 4)]);
        paramByteArrayBuilder.append(HEX_BYTES[(i & 0xF)]);
        paramInt1 &= 255;
        paramByteArrayBuilder.append(HEX_BYTES[(paramInt1 >> 4)]);
        paramByteArrayBuilder.append(HEX_BYTES[(paramInt1 & 0xF)]);
      }
    }
    while (true)
    {
      return paramByteArrayBuilder.getCurrentSegmentLength();
      paramByteArrayBuilder.append(48);
      paramByteArrayBuilder.append(48);
      break;
      paramByteArrayBuilder.append((byte)paramInt2);
    }
  }

  private int _appendNamedEscape(int paramInt, char[] paramArrayOfChar)
  {
    paramArrayOfChar[1] = ((char)paramInt);
    return 2;
  }

  private int _appendNumericEscape(int paramInt, char[] paramArrayOfChar)
  {
    paramArrayOfChar[1] = 'u';
    paramArrayOfChar[4] = HEX_CHARS[(paramInt >> 4)];
    paramArrayOfChar[5] = HEX_CHARS[(paramInt & 0xF)];
    return 6;
  }

  protected static int _convertSurrogate(int paramInt1, int paramInt2)
  {
    if ((paramInt2 < 56320) || (paramInt2 > 57343))
      throw new IllegalArgumentException("Broken surrogate pair: first char 0x" + Integer.toHexString(paramInt1) + ", second 0x" + Integer.toHexString(paramInt2) + "; illegal combination");
    return 65536 + (paramInt1 - 55296 << 10) + (paramInt2 - 56320);
  }

  protected static void _illegalSurrogate(int paramInt)
  {
    throw new IllegalArgumentException(UTF8Writer.illegalSurrogateDesc(paramInt));
  }

  public static JsonStringEncoder getInstance()
  {
    SoftReference localSoftReference = (SoftReference)_threadEncoder.get();
    if (localSoftReference == null);
    for (JsonStringEncoder localJsonStringEncoder = null; ; localJsonStringEncoder = (JsonStringEncoder)localSoftReference.get())
    {
      if (localJsonStringEncoder == null)
      {
        localJsonStringEncoder = new JsonStringEncoder();
        _threadEncoder.set(new SoftReference(localJsonStringEncoder));
      }
      return localJsonStringEncoder;
    }
  }

  public byte[] encodeAsUTF8(String paramString)
  {
    ByteArrayBuilder localByteArrayBuilder = this._byteBuilder;
    if (localByteArrayBuilder == null)
    {
      localByteArrayBuilder = new ByteArrayBuilder(null);
      this._byteBuilder = localByteArrayBuilder;
    }
    int i = paramString.length();
    Object localObject1 = localByteArrayBuilder.resetAndGetFirstSegment();
    int j = localObject1.length;
    int k = 0;
    int m = 0;
    int i1;
    int i2;
    Object localObject2;
    int i4;
    int i5;
    label81: int i18;
    if (m < i)
    {
      i1 = m + 1;
      i2 = paramString.charAt(m);
      int i3 = j;
      localObject2 = localObject1;
      i4 = k;
      i5 = i3;
      if (i2 <= 127)
      {
        if (i4 >= i5)
        {
          localObject2 = localByteArrayBuilder.finishCurrentSegment();
          i5 = localObject2.length;
          i4 = 0;
        }
        i18 = i4 + 1;
        localObject2[i4] = ((byte)i2);
        if (i1 < i);
      }
    }
    for (int n = i18; ; n = k)
    {
      return this._byteBuilder.completeAndCoalesce(n);
      int i19 = i1 + 1;
      i2 = paramString.charAt(i1);
      i1 = i19;
      i4 = i18;
      break label81;
      if (i4 >= i5)
      {
        localObject2 = localByteArrayBuilder.finishCurrentSegment();
        i5 = localObject2.length;
      }
      for (int i6 = 0; ; i6 = i4)
      {
        int i9;
        int i10;
        if (i2 < 2048)
        {
          i9 = i6 + 1;
          localObject2[i6] = ((byte)(0xC0 | i2 >> 6));
          i10 = i2;
        }
        for (m = i1; ; m = i1)
        {
          if (i9 >= i5)
          {
            localObject2 = localByteArrayBuilder.finishCurrentSegment();
            i5 = localObject2.length;
            i9 = 0;
          }
          int i11 = i9 + 1;
          localObject2[i9] = ((byte)(0x80 | i10 & 0x3F));
          localObject1 = localObject2;
          j = i5;
          k = i11;
          break;
          if ((i2 >= 55296) && (i2 <= 57343))
            break label378;
          int i7 = i6 + 1;
          localObject2[i6] = ((byte)(0xE0 | i2 >> 12));
          if (i7 >= i5)
          {
            localObject2 = localByteArrayBuilder.finishCurrentSegment();
            i5 = localObject2.length;
            i7 = 0;
          }
          int i8 = i7 + 1;
          localObject2[i7] = ((byte)(0x80 | 0x3F & i2 >> 6));
          i9 = i8;
          i10 = i2;
        }
        label378: if (i2 > 56319)
          _illegalSurrogate(i2);
        if (i1 >= i)
          _illegalSurrogate(i2);
        int i12 = i1 + 1;
        int i13 = _convertSurrogate(i2, paramString.charAt(i1));
        if (i13 > 1114111)
          _illegalSurrogate(i13);
        int i14 = i6 + 1;
        localObject2[i6] = ((byte)(0xF0 | i13 >> 18));
        if (i14 >= i5)
        {
          localObject2 = localByteArrayBuilder.finishCurrentSegment();
          i5 = localObject2.length;
          i14 = 0;
        }
        int i15 = i14 + 1;
        localObject2[i14] = ((byte)(0x80 | 0x3F & i13 >> 12));
        if (i15 >= i5)
        {
          localObject2 = localByteArrayBuilder.finishCurrentSegment();
          i5 = localObject2.length;
        }
        for (int i16 = 0; ; i16 = i15)
        {
          int i17 = i16 + 1;
          localObject2[i16] = ((byte)(0x80 | 0x3F & i13 >> 6));
          i9 = i17;
          i10 = i13;
          m = i12;
          break;
        }
      }
    }
  }

  public char[] quoteAsString(String paramString)
  {
    TextBuffer localTextBuffer = this._textBuffer;
    if (localTextBuffer == null)
    {
      localTextBuffer = new TextBuffer(null);
      this._textBuffer = localTextBuffer;
    }
    char[] arrayOfChar = localTextBuffer.emptyAndGetCurrentSegment();
    int[] arrayOfInt = CharTypes.get7BitOutputEscapes();
    int i = arrayOfInt.length;
    int j = paramString.length();
    int k = 0;
    int m = 0;
    int n;
    int i4;
    int i5;
    while (m < j)
    {
      n = paramString.charAt(m);
      if ((n < i) && (arrayOfInt[n] != 0))
      {
        int i2 = m + 1;
        int i3 = paramString.charAt(m);
        i4 = arrayOfInt[i3];
        if (i4 >= 0)
          break label233;
        i5 = _appendNumericEscape(i3, this._quoteBuffer);
        label118: if (k + i5 <= arrayOfChar.length)
          break label248;
        int i6 = arrayOfChar.length - k;
        if (i6 > 0)
          System.arraycopy(this._quoteBuffer, 0, arrayOfChar, k, i6);
        arrayOfChar = localTextBuffer.finishCurrentSegment();
        k = i5 - i6;
        System.arraycopy(this._quoteBuffer, i6, arrayOfChar, 0, k);
        label178: m = i2;
      }
      else
      {
        if (k < arrayOfChar.length)
          break label271;
        arrayOfChar = localTextBuffer.finishCurrentSegment();
      }
    }
    label271: for (int i1 = 0; ; i1 = k)
    {
      k = i1 + 1;
      arrayOfChar[i1] = n;
      m++;
      if (m < j)
        break;
      localTextBuffer.setCurrentLength(k);
      return localTextBuffer.contentsAsArray();
      label233: i5 = _appendNamedEscape(i4, this._quoteBuffer);
      break label118;
      label248: System.arraycopy(this._quoteBuffer, 0, arrayOfChar, k, i5);
      k += i5;
      break label178;
    }
  }

  public byte[] quoteAsUTF8(String paramString)
  {
    ByteArrayBuilder localByteArrayBuilder = this._byteBuilder;
    if (localByteArrayBuilder == null)
    {
      localByteArrayBuilder = new ByteArrayBuilder(null);
      this._byteBuilder = localByteArrayBuilder;
    }
    int i = paramString.length();
    Object localObject1 = localByteArrayBuilder.resetAndGetFirstSegment();
    int j = 0;
    int k = 0;
    label51: int m;
    int n;
    int i1;
    while (k < i)
    {
      int[] arrayOfInt = CharTypes.get7BitOutputEscapes();
      m = paramString.charAt(k);
      if ((m > 127) || (arrayOfInt[m] != 0))
      {
        if (j >= localObject1.length)
        {
          localObject1 = localByteArrayBuilder.finishCurrentSegment();
          j = 0;
        }
        n = k + 1;
        i1 = paramString.charAt(k);
        if (i1 > 127)
          break label191;
        j = _appendByteEscape(i1, arrayOfInt[i1], localByteArrayBuilder, j);
        localObject1 = localByteArrayBuilder.getCurrentSegment();
        k = n;
      }
      else
      {
        if (j < localObject1.length)
          break label591;
        localObject1 = localByteArrayBuilder.finishCurrentSegment();
      }
    }
    label191: label584: label591: for (int i16 = 0; ; i16 = j)
    {
      j = i16 + 1;
      localObject1[i16] = ((byte)m);
      k++;
      if (k < i)
        break label51;
      return this._byteBuilder.completeAndCoalesce(j);
      int i4;
      Object localObject2;
      int i6;
      if (i1 <= 2047)
      {
        i4 = j + 1;
        localObject1[j] = ((byte)(0xC0 | i1 >> 6));
        int i15 = 0x80 | i1 & 0x3F;
        localObject2 = localObject1;
        i6 = i15;
        if (i4 >= localObject2.length)
        {
          localObject2 = localByteArrayBuilder.finishCurrentSegment();
          i4 = 0;
        }
        int i7 = i4 + 1;
        localObject2[i4] = ((byte)i6);
        localObject1 = localObject2;
        k = n;
        j = i7;
        break;
      }
      int i2;
      if ((i1 < 55296) || (i1 > 57343))
      {
        i2 = j + 1;
        localObject1[j] = ((byte)(0xE0 | i1 >> 12));
        if (i2 < localObject1.length)
          break label584;
        localObject1 = localByteArrayBuilder.finishCurrentSegment();
      }
      for (int i3 = 0; ; i3 = i2)
      {
        i4 = i3 + 1;
        localObject1[i3] = ((byte)(0x80 | 0x3F & i1 >> 6));
        int i5 = 0x80 | i1 & 0x3F;
        localObject2 = localObject1;
        i6 = i5;
        break;
        if (i1 > 56319)
          _illegalSurrogate(i1);
        if (n >= i)
          _illegalSurrogate(i1);
        int i8 = n + 1;
        int i9 = _convertSurrogate(i1, paramString.charAt(n));
        if (i9 > 1114111)
          _illegalSurrogate(i9);
        int i10 = j + 1;
        localObject1[j] = ((byte)(0xF0 | i9 >> 18));
        if (i10 >= localObject1.length)
          localObject1 = localByteArrayBuilder.finishCurrentSegment();
        for (int i11 = 0; ; i11 = i10)
        {
          int i12 = i11 + 1;
          localObject1[i11] = ((byte)(0x80 | 0x3F & i9 >> 12));
          if (i12 >= localObject1.length)
            localObject1 = localByteArrayBuilder.finishCurrentSegment();
          for (int i13 = 0; ; i13 = i12)
          {
            i4 = i13 + 1;
            localObject1[i13] = ((byte)(0x80 | 0x3F & i9 >> 6));
            int i14 = 0x80 | i9 & 0x3F;
            n = i8;
            Object localObject3 = localObject1;
            i6 = i14;
            localObject2 = localObject3;
            break;
          }
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.io.JsonStringEncoder
 * JD-Core Version:    0.6.2
 */