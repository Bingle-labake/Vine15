package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.util.List;

public class SdkAdLog$Builder extends SpecificRecordBuilderBase<SdkAdLog>
  implements RecordBuilder<SdkAdLog>
{
  private long bU;
  private CharSequence bV;
  private List<SdkAdEvent> bW;

  private SdkAdLog$Builder()
  {
    super(SdkAdLog.SCHEMA$);
  }

  public SdkAdLog build()
  {
    try
    {
      SdkAdLog localSdkAdLog = new SdkAdLog();
      long l;
      CharSequence localCharSequence;
      if (fieldSetFlags()[0] != 0)
      {
        l = this.bU;
        localSdkAdLog.bU = l;
        if (fieldSetFlags()[1] == 0)
          break label91;
        localCharSequence = this.bV;
        label42: localSdkAdLog.bV = localCharSequence;
        if (fieldSetFlags()[2] == 0)
          break label109;
      }
      label91: label109: for (List localList = this.bW; ; localList = (List)defaultValue(fields()[2]))
      {
        localSdkAdLog.bW = localList;
        return localSdkAdLog;
        l = ((Long)defaultValue(fields()[0])).longValue();
        break;
        localCharSequence = (CharSequence)defaultValue(fields()[1]);
        break label42;
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearAdLogGUID()
  {
    this.bV = null;
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearSdkAdEvents()
  {
    this.bW = null;
    fieldSetFlags()[2] = 0;
    return this;
  }

  public Builder clearSessionId()
  {
    fieldSetFlags()[0] = 0;
    return this;
  }

  public CharSequence getAdLogGUID()
  {
    return this.bV;
  }

  public List<SdkAdEvent> getSdkAdEvents()
  {
    return this.bW;
  }

  public Long getSessionId()
  {
    return Long.valueOf(this.bU);
  }

  public boolean hasAdLogGUID()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasSdkAdEvents()
  {
    return fieldSetFlags()[2];
  }

  public boolean hasSessionId()
  {
    return fieldSetFlags()[0];
  }

  public Builder setAdLogGUID(CharSequence paramCharSequence)
  {
    validate(fields()[1], paramCharSequence);
    this.bV = paramCharSequence;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setSdkAdEvents(List<SdkAdEvent> paramList)
  {
    validate(fields()[2], paramList);
    this.bW = paramList;
    fieldSetFlags()[2] = 1;
    return this;
  }

  public Builder setSessionId(long paramLong)
  {
    validate(fields()[0], Long.valueOf(paramLong));
    this.bU = paramLong;
    fieldSetFlags()[0] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.SdkAdLog.Builder
 * JD-Core Version:    0.6.2
 */