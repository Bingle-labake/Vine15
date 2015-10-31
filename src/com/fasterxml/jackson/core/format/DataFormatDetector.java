package com.fasterxml.jackson.core.format;

import com.fasterxml.jackson.core.JsonFactory;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

public class DataFormatDetector
{
  public static final int DEFAULT_MAX_INPUT_LOOKAHEAD = 64;
  protected final JsonFactory[] _detectors;
  protected final int _maxInputLookahead;
  protected final MatchStrength _minimalMatch;
  protected final MatchStrength _optimalMatch;

  public DataFormatDetector(Collection<JsonFactory> paramCollection)
  {
    this((JsonFactory[])paramCollection.toArray(new JsonFactory[paramCollection.size()]));
  }

  public DataFormatDetector(JsonFactory[] paramArrayOfJsonFactory)
  {
    this(paramArrayOfJsonFactory, MatchStrength.SOLID_MATCH, MatchStrength.WEAK_MATCH, 64);
  }

  private DataFormatDetector(JsonFactory[] paramArrayOfJsonFactory, MatchStrength paramMatchStrength1, MatchStrength paramMatchStrength2, int paramInt)
  {
    this._detectors = paramArrayOfJsonFactory;
    this._optimalMatch = paramMatchStrength1;
    this._minimalMatch = paramMatchStrength2;
    this._maxInputLookahead = paramInt;
  }

  private DataFormatMatcher _findFormat(InputAccessor.Std paramStd)
    throws IOException
  {
    JsonFactory[] arrayOfJsonFactory = this._detectors;
    int i = arrayOfJsonFactory.length;
    int j = 0;
    Object localObject1 = null;
    Object localObject2 = null;
    Object localObject4;
    Object localObject3;
    Object localObject5;
    if (j < i)
    {
      localObject4 = arrayOfJsonFactory[j];
      paramStd.reset();
      localObject3 = ((JsonFactory)localObject4).hasFormat(paramStd);
      if (localObject3 != null)
        if (((MatchStrength)localObject3).ordinal() < this._minimalMatch.ordinal())
          localObject5 = localObject1;
    }
    while (true)
    {
      j++;
      localObject1 = localObject5;
      break;
      if ((localObject1 != null) && (localObject2.ordinal() >= ((MatchStrength)localObject3).ordinal()))
      {
        localObject5 = localObject1;
      }
      else
      {
        if (((MatchStrength)localObject3).ordinal() >= this._optimalMatch.ordinal())
          while (true)
          {
            return paramStd.createMatcher((JsonFactory)localObject4, (MatchStrength)localObject3);
            localObject5 = localObject1;
            break;
            localObject3 = localObject2;
            localObject4 = localObject1;
          }
        localObject2 = localObject3;
        localObject5 = localObject4;
      }
    }
  }

  public DataFormatMatcher findFormat(InputStream paramInputStream)
    throws IOException
  {
    return _findFormat(new InputAccessor.Std(paramInputStream, new byte[this._maxInputLookahead]));
  }

  public DataFormatMatcher findFormat(byte[] paramArrayOfByte)
    throws IOException
  {
    return _findFormat(new InputAccessor.Std(paramArrayOfByte));
  }

  public DataFormatMatcher findFormat(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    return _findFormat(new InputAccessor.Std(paramArrayOfByte, paramInt1, paramInt2));
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append('[');
    int i = this._detectors.length;
    if (i > 0)
    {
      localStringBuilder.append(this._detectors[0].getFormatName());
      for (int j = 1; j < i; j++)
      {
        localStringBuilder.append(", ");
        localStringBuilder.append(this._detectors[j].getFormatName());
      }
    }
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }

  public DataFormatDetector withMaxInputLookahead(int paramInt)
  {
    if (paramInt == this._maxInputLookahead)
      return this;
    return new DataFormatDetector(this._detectors, this._optimalMatch, this._minimalMatch, paramInt);
  }

  public DataFormatDetector withMinimalMatch(MatchStrength paramMatchStrength)
  {
    if (paramMatchStrength == this._minimalMatch)
      return this;
    return new DataFormatDetector(this._detectors, this._optimalMatch, paramMatchStrength, this._maxInputLookahead);
  }

  public DataFormatDetector withOptimalMatch(MatchStrength paramMatchStrength)
  {
    if (paramMatchStrength == this._optimalMatch)
      return this;
    return new DataFormatDetector(this._detectors, paramMatchStrength, this._minimalMatch, this._maxInputLookahead);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.format.DataFormatDetector
 * JD-Core Version:    0.6.2
 */