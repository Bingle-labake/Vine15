package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;

public class TestAds$Builder extends SpecificRecordBuilderBase<TestAds>
  implements RecordBuilder<TestAds>
{
  private int ew;

  private TestAds$Builder(byte paramByte)
  {
    super(TestAds.SCHEMA$);
  }

  public TestAds build()
  {
    try
    {
      TestAds localTestAds = new TestAds();
      if (fieldSetFlags()[0] != 0);
      int i;
      for (int j = this.ew; ; j = i)
      {
        localTestAds.ew = j;
        return localTestAds;
        i = ((Integer)defaultValue(fields()[0])).intValue();
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearAdspacePlacement()
  {
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Integer getAdspacePlacement()
  {
    return Integer.valueOf(this.ew);
  }

  public boolean hasAdspacePlacement()
  {
    return fieldSetFlags()[0];
  }

  public Builder setAdspacePlacement(int paramInt)
  {
    validate(fields()[0], Integer.valueOf(paramInt));
    this.ew = paramInt;
    fieldSetFlags()[0] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.TestAds.Builder
 * JD-Core Version:    0.6.2
 */