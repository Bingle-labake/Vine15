package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.util.List;

public class AdUnit$Builder extends SpecificRecordBuilderBase<AdUnit>
  implements RecordBuilder<AdUnit>
{
  private CharSequence R;
  private long S;
  private List<AdFrame> T;
  private int U;
  private CharSequence V;
  private CharSequence W;
  private long X;
  private int Y;
  private int Z;
  private int aa;
  private long ab;

  private AdUnit$Builder()
  {
    super(AdUnit.SCHEMA$);
  }

  public AdUnit build()
  {
    try
    {
      AdUnit localAdUnit = new AdUnit();
      CharSequence localCharSequence1;
      long l1;
      label42: List localList;
      label63: int i;
      label84: CharSequence localCharSequence2;
      label105: CharSequence localCharSequence3;
      label126: long l2;
      label148: int j;
      label170: int k;
      label192: int m;
      if (fieldSetFlags()[0] != 0)
      {
        localCharSequence1 = this.R;
        localAdUnit.R = localCharSequence1;
        if (fieldSetFlags()[1] == 0)
          break label261;
        l1 = this.S;
        localAdUnit.S = l1;
        if (fieldSetFlags()[2] == 0)
          break label282;
        localList = this.T;
        localAdUnit.T = localList;
        if (fieldSetFlags()[3] == 0)
          break label300;
        i = this.U;
        localAdUnit.U = i;
        if (fieldSetFlags()[4] == 0)
          break label321;
        localCharSequence2 = this.V;
        localAdUnit.V = localCharSequence2;
        if (fieldSetFlags()[5] == 0)
          break label339;
        localCharSequence3 = this.W;
        localAdUnit.W = localCharSequence3;
        if (fieldSetFlags()[6] == 0)
          break label357;
        l2 = this.X;
        localAdUnit.X = l2;
        if (fieldSetFlags()[7] == 0)
          break label379;
        j = this.Y;
        localAdUnit.Y = j;
        if (fieldSetFlags()[8] == 0)
          break label401;
        k = this.Z;
        localAdUnit.Z = k;
        if (fieldSetFlags()[9] == 0)
          break label423;
        m = this.aa;
        label214: localAdUnit.aa = m;
        if (fieldSetFlags()[10] == 0)
          break label445;
      }
      label261: label282: label300: label321: label339: label357: label379: long l3;
      for (long l4 = this.ab; ; l4 = l3)
      {
        localAdUnit.ab = l4;
        return localAdUnit;
        localCharSequence1 = (CharSequence)defaultValue(fields()[0]);
        break;
        l1 = ((Long)defaultValue(fields()[1])).longValue();
        break label42;
        localList = (List)defaultValue(fields()[2]);
        break label63;
        i = ((Integer)defaultValue(fields()[3])).intValue();
        break label84;
        localCharSequence2 = (CharSequence)defaultValue(fields()[4]);
        break label105;
        localCharSequence3 = (CharSequence)defaultValue(fields()[5]);
        break label126;
        l2 = ((Long)defaultValue(fields()[6])).longValue();
        break label148;
        j = ((Integer)defaultValue(fields()[7])).intValue();
        break label170;
        label401: k = ((Integer)defaultValue(fields()[8])).intValue();
        break label192;
        label423: m = ((Integer)defaultValue(fields()[9])).intValue();
        break label214;
        label445: l3 = ((Long)defaultValue(fields()[10])).longValue();
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearAdFrames()
  {
    this.T = null;
    fieldSetFlags()[2] = 0;
    return this;
  }

  public Builder clearAdSpace()
  {
    this.R = null;
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Builder clearCombinable()
  {
    fieldSetFlags()[3] = 0;
    return this;
  }

  public Builder clearExpiration()
  {
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearExpirationTime()
  {
    fieldSetFlags()[10] = 0;
    return this;
  }

  public Builder clearGroupId()
  {
    this.V = null;
    fieldSetFlags()[4] = 0;
    return this;
  }

  public Builder clearIdHash()
  {
    this.W = null;
    fieldSetFlags()[5] = 0;
    return this;
  }

  public Builder clearNewCap()
  {
    fieldSetFlags()[7] = 0;
    return this;
  }

  public Builder clearPreviousCap()
  {
    fieldSetFlags()[8] = 0;
    return this;
  }

  public Builder clearPreviousCapType()
  {
    fieldSetFlags()[9] = 0;
    return this;
  }

  public Builder clearServeTime()
  {
    fieldSetFlags()[6] = 0;
    return this;
  }

  public List<AdFrame> getAdFrames()
  {
    return this.T;
  }

  public CharSequence getAdSpace()
  {
    return this.R;
  }

  public Integer getCombinable()
  {
    return Integer.valueOf(this.U);
  }

  public Long getExpiration()
  {
    return Long.valueOf(this.S);
  }

  public Long getExpirationTime()
  {
    return Long.valueOf(this.ab);
  }

  public CharSequence getGroupId()
  {
    return this.V;
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

  public boolean hasAdFrames()
  {
    return fieldSetFlags()[2];
  }

  public boolean hasAdSpace()
  {
    return fieldSetFlags()[0];
  }

  public boolean hasCombinable()
  {
    return fieldSetFlags()[3];
  }

  public boolean hasExpiration()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasExpirationTime()
  {
    return fieldSetFlags()[10];
  }

  public boolean hasGroupId()
  {
    return fieldSetFlags()[4];
  }

  public boolean hasIdHash()
  {
    return fieldSetFlags()[5];
  }

  public boolean hasNewCap()
  {
    return fieldSetFlags()[7];
  }

  public boolean hasPreviousCap()
  {
    return fieldSetFlags()[8];
  }

  public boolean hasPreviousCapType()
  {
    return fieldSetFlags()[9];
  }

  public boolean hasServeTime()
  {
    return fieldSetFlags()[6];
  }

  public Builder setAdFrames(List<AdFrame> paramList)
  {
    validate(fields()[2], paramList);
    this.T = paramList;
    fieldSetFlags()[2] = 1;
    return this;
  }

  public Builder setAdSpace(CharSequence paramCharSequence)
  {
    validate(fields()[0], paramCharSequence);
    this.R = paramCharSequence;
    fieldSetFlags()[0] = 1;
    return this;
  }

  public Builder setCombinable(int paramInt)
  {
    validate(fields()[3], Integer.valueOf(paramInt));
    this.U = paramInt;
    fieldSetFlags()[3] = 1;
    return this;
  }

  public Builder setExpiration(long paramLong)
  {
    validate(fields()[1], Long.valueOf(paramLong));
    this.S = paramLong;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setExpirationTime(long paramLong)
  {
    validate(fields()[10], Long.valueOf(paramLong));
    this.ab = paramLong;
    fieldSetFlags()[10] = 1;
    return this;
  }

  public Builder setGroupId(CharSequence paramCharSequence)
  {
    validate(fields()[4], paramCharSequence);
    this.V = paramCharSequence;
    fieldSetFlags()[4] = 1;
    return this;
  }

  public Builder setIdHash(CharSequence paramCharSequence)
  {
    validate(fields()[5], paramCharSequence);
    this.W = paramCharSequence;
    fieldSetFlags()[5] = 1;
    return this;
  }

  public Builder setNewCap(int paramInt)
  {
    validate(fields()[7], Integer.valueOf(paramInt));
    this.Y = paramInt;
    fieldSetFlags()[7] = 1;
    return this;
  }

  public Builder setPreviousCap(int paramInt)
  {
    validate(fields()[8], Integer.valueOf(paramInt));
    this.Z = paramInt;
    fieldSetFlags()[8] = 1;
    return this;
  }

  public Builder setPreviousCapType(int paramInt)
  {
    validate(fields()[9], Integer.valueOf(paramInt));
    this.aa = paramInt;
    fieldSetFlags()[9] = 1;
    return this;
  }

  public Builder setServeTime(long paramLong)
  {
    validate(fields()[6], Long.valueOf(paramLong));
    this.X = paramLong;
    fieldSetFlags()[6] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.AdUnit.Builder
 * JD-Core Version:    0.6.2
 */