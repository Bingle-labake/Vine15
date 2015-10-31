package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.format.InputAccessor;
import com.fasterxml.jackson.core.format.MatchStrength;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.io.MergedStream;
import com.fasterxml.jackson.core.io.UTF32Reader;
import com.fasterxml.jackson.core.sym.BytesToNameCanonicalizer;
import com.fasterxml.jackson.core.sym.CharsToNameCanonicalizer;
import java.io.ByteArrayInputStream;
import java.io.CharConversionException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

public final class ByteSourceJsonBootstrapper
{
  static final byte UTF8_BOM_1 = -17;
  static final byte UTF8_BOM_2 = -69;
  static final byte UTF8_BOM_3 = -65;
  protected boolean _bigEndian = true;
  private final boolean _bufferRecyclable;
  protected int _bytesPerChar = 0;
  protected final IOContext _context;
  protected final InputStream _in;
  protected final byte[] _inputBuffer;
  private int _inputEnd;
  protected int _inputProcessed;
  private int _inputPtr;

  public ByteSourceJsonBootstrapper(IOContext paramIOContext, InputStream paramInputStream)
  {
    this._context = paramIOContext;
    this._in = paramInputStream;
    this._inputBuffer = paramIOContext.allocReadIOBuffer();
    this._inputPtr = 0;
    this._inputEnd = 0;
    this._inputProcessed = 0;
    this._bufferRecyclable = true;
  }

  public ByteSourceJsonBootstrapper(IOContext paramIOContext, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    this._context = paramIOContext;
    this._in = null;
    this._inputBuffer = paramArrayOfByte;
    this._inputPtr = paramInt1;
    this._inputEnd = (paramInt1 + paramInt2);
    this._inputProcessed = (-paramInt1);
    this._bufferRecyclable = false;
  }

  private boolean checkUTF16(int paramInt)
  {
    if ((0xFF00 & paramInt) == 0);
    for (this._bigEndian = true; ; this._bigEndian = false)
    {
      this._bytesPerChar = 2;
      boolean bool = true;
      int i;
      do
      {
        return bool;
        i = paramInt & 0xFF;
        bool = false;
      }
      while (i != 0);
    }
  }

  private boolean checkUTF32(int paramInt)
    throws IOException
  {
    if (paramInt >> 8 == 0)
      this._bigEndian = true;
    while (true)
    {
      this._bytesPerChar = 4;
      boolean bool = true;
      int i;
      do
      {
        return bool;
        if ((0xFFFFFF & paramInt) == 0)
        {
          this._bigEndian = false;
          break;
        }
        if ((0xFF00FFFF & paramInt) == 0)
        {
          reportWeirdUCS4("3412");
          break;
        }
        i = 0xFFFF00FF & paramInt;
        bool = false;
      }
      while (i != 0);
      reportWeirdUCS4("2143");
    }
  }

  private boolean handleBOM(int paramInt)
    throws IOException
  {
    switch (paramInt)
    {
    default:
    case 65279:
    case -131072:
    case 65534:
    case -16842752:
    }
    int i;
    while (true)
    {
      i = paramInt >>> 16;
      if (i != 65279)
        break;
      this._inputPtr = (2 + this._inputPtr);
      this._bytesPerChar = 2;
      this._bigEndian = true;
      return true;
      this._bigEndian = true;
      this._inputPtr = (4 + this._inputPtr);
      this._bytesPerChar = 4;
      return true;
      this._inputPtr = (4 + this._inputPtr);
      this._bytesPerChar = 4;
      this._bigEndian = false;
      return true;
      reportWeirdUCS4("2143");
      reportWeirdUCS4("3412");
    }
    if (i == 65534)
    {
      this._inputPtr = (2 + this._inputPtr);
      this._bytesPerChar = 2;
      this._bigEndian = false;
      return true;
    }
    if (paramInt >>> 8 == 15711167)
    {
      this._inputPtr = (3 + this._inputPtr);
      this._bytesPerChar = 1;
      this._bigEndian = true;
      return true;
    }
    return false;
  }

  public static MatchStrength hasJSONFormat(InputAccessor paramInputAccessor)
    throws IOException
  {
    MatchStrength localMatchStrength;
    if (!paramInputAccessor.hasMoreBytes())
      localMatchStrength = MatchStrength.INCONCLUSIVE;
    int i;
    int j;
    do
    {
      do
      {
        return localMatchStrength;
        byte b = paramInputAccessor.nextByte();
        if (b == -17)
        {
          if (!paramInputAccessor.hasMoreBytes())
            return MatchStrength.INCONCLUSIVE;
          if (paramInputAccessor.nextByte() != -69)
            return MatchStrength.NO_MATCH;
          if (!paramInputAccessor.hasMoreBytes())
            return MatchStrength.INCONCLUSIVE;
          if (paramInputAccessor.nextByte() != -65)
            return MatchStrength.NO_MATCH;
          if (!paramInputAccessor.hasMoreBytes())
            return MatchStrength.INCONCLUSIVE;
          b = paramInputAccessor.nextByte();
        }
        i = skipSpace(paramInputAccessor, b);
        if (i < 0)
          return MatchStrength.INCONCLUSIVE;
        if (i == 123)
        {
          int m = skipSpace(paramInputAccessor);
          if (m < 0)
            return MatchStrength.INCONCLUSIVE;
          if ((m == 34) || (m == 125))
            return MatchStrength.SOLID_MATCH;
          return MatchStrength.NO_MATCH;
        }
        if (i == 91)
        {
          int k = skipSpace(paramInputAccessor);
          if (k < 0)
            return MatchStrength.INCONCLUSIVE;
          if ((k == 93) || (k == 91))
            return MatchStrength.SOLID_MATCH;
          return MatchStrength.SOLID_MATCH;
        }
        localMatchStrength = MatchStrength.WEAK_MATCH;
      }
      while ((i == 34) || ((i <= 57) && (i >= 48)));
      if (i != 45)
        break;
      j = skipSpace(paramInputAccessor);
      if (j < 0)
        return MatchStrength.INCONCLUSIVE;
    }
    while ((j <= 57) && (j >= 48));
    return MatchStrength.NO_MATCH;
    if (i == 110)
      return tryMatch(paramInputAccessor, "ull", localMatchStrength);
    if (i == 116)
      return tryMatch(paramInputAccessor, "rue", localMatchStrength);
    if (i == 102)
      return tryMatch(paramInputAccessor, "alse", localMatchStrength);
    return MatchStrength.NO_MATCH;
  }

  private void reportWeirdUCS4(String paramString)
    throws IOException
  {
    throw new CharConversionException("Unsupported UCS-4 endianness (" + paramString + ") detected");
  }

  private static int skipSpace(InputAccessor paramInputAccessor)
    throws IOException
  {
    if (!paramInputAccessor.hasMoreBytes())
      return -1;
    return skipSpace(paramInputAccessor, paramInputAccessor.nextByte());
  }

  private static int skipSpace(InputAccessor paramInputAccessor, byte paramByte)
    throws IOException
  {
    while (true)
    {
      int i = paramByte & 0xFF;
      if ((i != 32) && (i != 13) && (i != 10) && (i != 9))
        return i;
      if (!paramInputAccessor.hasMoreBytes())
        return -1;
      paramByte = paramInputAccessor.nextByte();
      (paramByte & 0xFF);
    }
  }

  private static MatchStrength tryMatch(InputAccessor paramInputAccessor, String paramString, MatchStrength paramMatchStrength)
    throws IOException
  {
    int i = 0;
    int j = paramString.length();
    while (true)
    {
      if (i < j)
      {
        if (!paramInputAccessor.hasMoreBytes())
          paramMatchStrength = MatchStrength.INCONCLUSIVE;
      }
      else
        return paramMatchStrength;
      if (paramInputAccessor.nextByte() != paramString.charAt(i))
        return MatchStrength.NO_MATCH;
      i++;
    }
  }

  public JsonParser constructParser(int paramInt, ObjectCodec paramObjectCodec, BytesToNameCanonicalizer paramBytesToNameCanonicalizer, CharsToNameCanonicalizer paramCharsToNameCanonicalizer, boolean paramBoolean1, boolean paramBoolean2)
    throws IOException, JsonParseException
  {
    if ((detectEncoding() == JsonEncoding.UTF8) && (paramBoolean1))
    {
      BytesToNameCanonicalizer localBytesToNameCanonicalizer = paramBytesToNameCanonicalizer.makeChild(paramBoolean1, paramBoolean2);
      return new UTF8StreamJsonParser(this._context, paramInt, this._in, paramObjectCodec, localBytesToNameCanonicalizer, this._inputBuffer, this._inputPtr, this._inputEnd, this._bufferRecyclable);
    }
    return new ReaderBasedJsonParser(this._context, paramInt, constructReader(), paramObjectCodec, paramCharsToNameCanonicalizer.makeChild(paramBoolean1, paramBoolean2));
  }

  public Reader constructReader()
    throws IOException
  {
    JsonEncoding localJsonEncoding = this._context.getEncoding();
    switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonEncoding[localJsonEncoding.ordinal()])
    {
    default:
      throw new RuntimeException("Internal error");
    case 1:
    case 2:
      return new UTF32Reader(this._context, this._in, this._inputBuffer, this._inputPtr, this._inputEnd, this._context.getEncoding().isBigEndian());
    case 3:
    case 4:
    case 5:
    }
    InputStream localInputStream = this._in;
    Object localObject;
    if (localInputStream == null)
      localObject = new ByteArrayInputStream(this._inputBuffer, this._inputPtr, this._inputEnd);
    while (true)
    {
      return new InputStreamReader((InputStream)localObject, localJsonEncoding.getJavaName());
      if (this._inputPtr < this._inputEnd)
        localObject = new MergedStream(this._context, localInputStream, this._inputBuffer, this._inputPtr, this._inputEnd);
      else
        localObject = localInputStream;
    }
  }

  public JsonEncoding detectEncoding()
    throws IOException, JsonParseException
  {
    int i = 1;
    int j;
    JsonEncoding localJsonEncoding;
    if (ensureLoaded(4))
    {
      j = this._inputBuffer[this._inputPtr] << 24 | (0xFF & this._inputBuffer[(1 + this._inputPtr)]) << 16 | (0xFF & this._inputBuffer[(2 + this._inputPtr)]) << 8 | 0xFF & this._inputBuffer[(3 + this._inputPtr)];
      if (handleBOM(j))
      {
        if (i != 0)
          break label177;
        localJsonEncoding = JsonEncoding.UTF8;
      }
    }
    while (true)
    {
      this._context.setEncoding(localJsonEncoding);
      return localJsonEncoding;
      if ((checkUTF32(j)) || (checkUTF16(j >>> 16)))
        break;
      do
      {
        i = 0;
        break;
      }
      while ((!ensureLoaded(2)) || (!checkUTF16((0xFF & this._inputBuffer[this._inputPtr]) << 8 | 0xFF & this._inputBuffer[(1 + this._inputPtr)])));
      break;
      label177: switch (this._bytesPerChar)
      {
      case 3:
      default:
        throw new RuntimeException("Internal error");
      case 1:
        localJsonEncoding = JsonEncoding.UTF8;
        break;
      case 2:
        if (this._bigEndian)
          localJsonEncoding = JsonEncoding.UTF16_BE;
        else
          localJsonEncoding = JsonEncoding.UTF16_LE;
        break;
      case 4:
        if (this._bigEndian)
          localJsonEncoding = JsonEncoding.UTF32_BE;
        else
          localJsonEncoding = JsonEncoding.UTF32_LE;
        break;
      }
    }
  }

  protected boolean ensureLoaded(int paramInt)
    throws IOException
  {
    int i = 1;
    label37: int m;
    for (int j = this._inputEnd - this._inputPtr; ; j = m + j)
    {
      if (j < paramInt)
        if (this._in != null)
          break label37;
      for (int k = -1; k < i; m = this._in.read(this._inputBuffer, this._inputEnd, this._inputBuffer.length - this._inputEnd))
      {
        i = 0;
        return i;
      }
      this._inputEnd = (m + this._inputEnd);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.json.ByteSourceJsonBootstrapper
 * JD-Core Version:    0.6.2
 */