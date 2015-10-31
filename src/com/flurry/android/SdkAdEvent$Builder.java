package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.util.Map;

public class SdkAdEvent$Builder extends SpecificRecordBuilderBase<SdkAdEvent>
  implements RecordBuilder<SdkAdEvent>
{
  private CharSequence af;
  private Map<CharSequence, CharSequence> ag;
  private long ah;

  private SdkAdEvent$Builder()
  {
    super(SdkAdEvent.SCHEMA$);
  }

  public SdkAdEvent build()
  {
    try
    {
      SdkAdEvent localSdkAdEvent = new SdkAdEvent();
      CharSequence localCharSequence;
      Map localMap;
      if (fieldSetFlags()[0] != 0)
      {
        localCharSequence = this.af;
        localSdkAdEvent.af = localCharSequence;
        if (fieldSetFlags()[1] == 0)
          break label88;
        localMap = this.ag;
        label42: localSdkAdEvent.ag = localMap;
        if (fieldSetFlags()[2] == 0)
          break label106;
      }
      label88: label106: long l1;
      for (long l2 = this.ah; ; l2 = l1)
      {
        localSdkAdEvent.ah = l2;
        return localSdkAdEvent;
        localCharSequence = (CharSequence)defaultValue(fields()[0]);
        break;
        localMap = (Map)defaultValue(fields()[1]);
        break label42;
        l1 = ((Long)defaultValue(fields()[2])).longValue();
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearParams()
  {
    this.ag = null;
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearTimeOffset()
  {
    fieldSetFlags()[2] = 0;
    return this;
  }

  public Builder clearType()
  {
    this.af = null;
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Map<CharSequence, CharSequence> getParams()
  {
    return this.ag;
  }

  public Long getTimeOffset()
  {
    return Long.valueOf(this.ah);
  }

  public CharSequence getType()
  {
    return this.af;
  }

  public boolean hasParams()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasTimeOffset()
  {
    return fieldSetFlags()[2];
  }

  public boolean hasType()
  {
    return fieldSetFlags()[0];
  }

  public Builder setParams(Map<CharSequence, CharSequence> paramMap)
  {
    validate(fields()[1], paramMap);
    this.ag = paramMap;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setTimeOffset(long paramLong)
  {
    validate(fields()[2], Long.valueOf(paramLong));
    this.ah = paramLong;
    fieldSetFlags()[2] = 1;
    return this;
  }

  public Builder setType(CharSequence paramCharSequence)
  {
    validate(fields()[0], paramCharSequence);
    this.af = paramCharSequence;
    fieldSetFlags()[0] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.SdkAdEvent.Builder
 * JD-Core Version:    0.6.2
 */