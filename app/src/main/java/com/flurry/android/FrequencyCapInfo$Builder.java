package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;

public class FrequencyCapInfo$Builder extends SpecificRecordBuilderBase<FrequencyCapInfo>
  implements RecordBuilder<FrequencyCapInfo>
{
  private CharSequence W;
  private long X;
  private int Y;
  private int Z;
  private int aa;
  private long ab;
  private int df;

  private FrequencyCapInfo$Builder(byte paramByte)
  {
    super(FrequencyCapInfo.SCHEMA$);
  }

  public FrequencyCapInfo build()
  {
    try
    {
      FrequencyCapInfo localFrequencyCapInfo = new FrequencyCapInfo();
      CharSequence localCharSequence;
      long l1;
      label42: long l2;
      label63: int i;
      label84: int j;
      label105: int k;
      if (fieldSetFlags()[0] != 0)
      {
        localCharSequence = this.W;
        localFrequencyCapInfo.W = localCharSequence;
        if (fieldSetFlags()[1] == 0)
          break label173;
        l1 = this.X;
        localFrequencyCapInfo.X = l1;
        if (fieldSetFlags()[2] == 0)
          break label194;
        l2 = this.ab;
        localFrequencyCapInfo.ab = l2;
        if (fieldSetFlags()[3] == 0)
          break label215;
        i = this.df;
        localFrequencyCapInfo.df = i;
        if (fieldSetFlags()[4] == 0)
          break label236;
        j = this.Y;
        localFrequencyCapInfo.Y = j;
        if (fieldSetFlags()[5] == 0)
          break label257;
        k = this.Z;
        label126: localFrequencyCapInfo.Z = k;
        if (fieldSetFlags()[6] == 0)
          break label278;
      }
      label173: label194: label215: label236: int m;
      for (int n = this.aa; ; n = m)
      {
        localFrequencyCapInfo.aa = n;
        return localFrequencyCapInfo;
        localCharSequence = (CharSequence)defaultValue(fields()[0]);
        break;
        l1 = ((Long)defaultValue(fields()[1])).longValue();
        break label42;
        l2 = ((Long)defaultValue(fields()[2])).longValue();
        break label63;
        i = ((Integer)defaultValue(fields()[3])).intValue();
        break label84;
        j = ((Integer)defaultValue(fields()[4])).intValue();
        break label105;
        label257: k = ((Integer)defaultValue(fields()[5])).intValue();
        break label126;
        label278: m = ((Integer)defaultValue(fields()[6])).intValue();
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearExpirationTime()
  {
    fieldSetFlags()[2] = 0;
    return this;
  }

  public Builder clearIdHash()
  {
    this.W = null;
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Builder clearNewCap()
  {
    fieldSetFlags()[4] = 0;
    return this;
  }

  public Builder clearPreviousCap()
  {
    fieldSetFlags()[5] = 0;
    return this;
  }

  public Builder clearPreviousCapType()
  {
    fieldSetFlags()[6] = 0;
    return this;
  }

  public Builder clearServeTime()
  {
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearViews()
  {
    fieldSetFlags()[3] = 0;
    return this;
  }

  public Long getExpirationTime()
  {
    return Long.valueOf(this.ab);
  }

  public CharSequence getIdHash()
  {
    return this.W;
  }

  public Integer getNewCap()
  {
    return Integer.valueOf(this.Y);
  }

  public Integer getPreviousCap()
  {
    return Integer.valueOf(this.Z);
  }

  public Integer getPreviousCapType()
  {
    return Integer.valueOf(this.aa);
  }

  public Long getServeTime()
  {
    return Long.valueOf(this.X);
  }

  public Integer getViews()
  {
    return Integer.valueOf(this.df);
  }

  public boolean hasExpirationTime()
  {
    return fieldSetFlags()[2];
  }

  public boolean hasIdHash()
  {
    return fieldSetFlags()[0];
  }

  public boolean hasNewCap()
  {
    return fieldSetFlags()[4];
  }

  public boolean hasPreviousCap()
  {
    return fieldSetFlags()[5];
  }

  public boolean hasPreviousCapType()
  {
    return fieldSetFlags()[6];
  }

  public boolean hasServeTime()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasViews()
  {
    return fieldSetFlags()[3];
  }

  public Builder setExpirationTime(long paramLong)
  {
    validate(fields()[2], Long.valueOf(paramLong));
    this.ab = paramLong;
    fieldSetFlags()[2] = 1;
    return this;
  }

  public Builder setIdHash(CharSequence paramCharSequence)
  {
    validate(fields()[0], paramCharSequence);
    this.W = paramCharSequence;
    fieldSetFlags()[0] = 1;
    return this;
  }

  public Builder setNewCap(int paramInt)
  {
    validate(fields()[4], Integer.valueOf(paramInt));
    this.Y = paramInt;
    fieldSetFlags()[4] = 1;
    return this;
  }

  public Builder setPreviousCap(int paramInt)
  {
    validate(fields()[5], Integer.valueOf(paramInt));
    this.Z = paramInt;
    fieldSetFlags()[5] = 1;
    return this;
  }

  public Builder setPreviousCapType(int paramInt)
  {
    validate(fields()[6], Integer.valueOf(paramInt));
    this.aa = paramInt;
    fieldSetFlags()[6] = 1;
    return this;
  }

  public Builder setServeTime(long paramLong)
  {
    validate(fields()[1], Long.valueOf(paramLong));
    this.X = paramLong;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setViews(int paramInt)
  {
    validate(fields()[3], Integer.valueOf(paramInt));
    this.df = paramInt;
    fieldSetFlags()[3] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.FrequencyCapInfo.Builder
 * JD-Core Version:    0.6.2
 */