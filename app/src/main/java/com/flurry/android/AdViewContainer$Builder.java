package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;

public class AdViewContainer$Builder extends SpecificRecordBuilderBase<AdViewContainer>
  implements RecordBuilder<AdViewContainer>
{
  private int ai;
  private int aj;
  private int ak;
  private int al;

  private AdViewContainer$Builder(byte paramByte)
  {
    super(AdViewContainer.SCHEMA$);
  }

  public AdViewContainer build()
  {
    try
    {
      AdViewContainer localAdViewContainer = new AdViewContainer();
      int i;
      int j;
      label42: int k;
      if (fieldSetFlags()[0] != 0)
      {
        i = this.ai;
        localAdViewContainer.ai = i;
        if (fieldSetFlags()[1] == 0)
          break label112;
        j = this.aj;
        localAdViewContainer.aj = j;
        if (fieldSetFlags()[2] == 0)
          break label133;
        k = this.ak;
        label63: localAdViewContainer.ak = k;
        if (fieldSetFlags()[3] == 0)
          break label154;
      }
      label112: int m;
      for (int n = this.al; ; n = m)
      {
        localAdViewContainer.al = n;
        return localAdViewContainer;
        i = ((Integer)defaultValue(fields()[0])).intValue();
        break;
        j = ((Integer)defaultValue(fields()[1])).intValue();
        break label42;
        label133: k = ((Integer)defaultValue(fields()[2])).intValue();
        break label63;
        label154: m = ((Integer)defaultValue(fields()[3])).intValue();
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearScreenHeight()
  {
    fieldSetFlags()[3] = 0;
    return this;
  }

  public Builder clearScreenWidth()
  {
    fieldSetFlags()[2] = 0;
    return this;
  }

  public Builder clearViewHeight()
  {
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearViewWidth()
  {
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Integer getScreenHeight()
  {
    return Integer.valueOf(this.al);
  }

  public Integer getScreenWidth()
  {
    return Integer.valueOf(this.ak);
  }

  public Integer getViewHeight()
  {
    return Integer.valueOf(this.aj);
  }

  public Integer getViewWidth()
  {
    return Integer.valueOf(this.ai);
  }

  public boolean hasScreenHeight()
  {
    return fieldSetFlags()[3];
  }

  public boolean hasScreenWidth()
  {
    return fieldSetFlags()[2];
  }

  public boolean hasViewHeight()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasViewWidth()
  {
    return fieldSetFlags()[0];
  }

  public Builder setScreenHeight(int paramInt)
  {
    validate(fields()[3], Integer.valueOf(paramInt));
    this.al = paramInt;
    fieldSetFlags()[3] = 1;
    return this;
  }

  public Builder setScreenWidth(int paramInt)
  {
    validate(fields()[2], Integer.valueOf(paramInt));
    this.ak = paramInt;
    fieldSetFlags()[2] = 1;
    return this;
  }

  public Builder setViewHeight(int paramInt)
  {
    validate(fields()[1], Integer.valueOf(paramInt));
    this.aj = paramInt;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setViewWidth(int paramInt)
  {
    validate(fields()[0], Integer.valueOf(paramInt));
    this.ai = paramInt;
    fieldSetFlags()[0] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.AdViewContainer.Builder
 * JD-Core Version:    0.6.2
 */