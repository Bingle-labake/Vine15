package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.util.List;

public class SdkLogRequest$Builder extends SpecificRecordBuilderBase<SdkLogRequest>
  implements RecordBuilder<SdkLogRequest>
{
  private CharSequence bX;
  private List<AdReportedId> ca;
  private boolean cc;
  private List<SdkAdLog> dl;
  private long dm;

  private SdkLogRequest$Builder(byte paramByte)
  {
    super(SdkLogRequest.SCHEMA$);
  }

  public SdkLogRequest build()
  {
    try
    {
      SdkLogRequest localSdkLogRequest = new SdkLogRequest();
      CharSequence localCharSequence;
      List localList1;
      label42: List localList2;
      label63: long l;
      if (fieldSetFlags()[0] != 0)
      {
        localCharSequence = this.bX;
        localSdkLogRequest.bX = localCharSequence;
        if (fieldSetFlags()[1] == 0)
          break label130;
        localList1 = this.ca;
        localSdkLogRequest.ca = localList1;
        if (fieldSetFlags()[2] == 0)
          break label148;
        localList2 = this.dl;
        localSdkLogRequest.dl = localList2;
        if (fieldSetFlags()[3] == 0)
          break label166;
        l = this.dm;
        label84: localSdkLogRequest.dm = l;
        if (fieldSetFlags()[4] == 0)
          break label187;
      }
      label130: label148: label166: label187: boolean bool1;
      for (boolean bool2 = this.cc; ; bool2 = bool1)
      {
        localSdkLogRequest.cc = bool2;
        return localSdkLogRequest;
        localCharSequence = (CharSequence)defaultValue(fields()[0]);
        break;
        localList1 = (List)defaultValue(fields()[1]);
        break label42;
        localList2 = (List)defaultValue(fields()[2]);
        break label63;
        l = ((Long)defaultValue(fields()[3])).longValue();
        break label84;
        bool1 = ((Boolean)defaultValue(fields()[4])).booleanValue();
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearAdReportedIds()
  {
    this.ca = null;
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearAgentTimestamp()
  {
    fieldSetFlags()[3] = 0;
    return this;
  }

  public Builder clearApiKey()
  {
    this.bX = null;
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Builder clearSdkAdLogs()
  {
    this.dl = null;
    fieldSetFlags()[2] = 0;
    return this;
  }

  public Builder clearTestDevice()
  {
    fieldSetFlags()[4] = 0;
    return this;
  }

  public List<AdReportedId> getAdReportedIds()
  {
    return this.ca;
  }

  public Long getAgentTimestamp()
  {
    return Long.valueOf(this.dm);
  }

  public CharSequence getApiKey()
  {
    return this.bX;
  }

  public List<SdkAdLog> getSdkAdLogs()
  {
    return this.dl;
  }

  public Boolean getTestDevice()
  {
    return Boolean.valueOf(this.cc);
  }

  public boolean hasAdReportedIds()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasAgentTimestamp()
  {
    return fieldSetFlags()[3];
  }

  public boolean hasApiKey()
  {
    return fieldSetFlags()[0];
  }

  public boolean hasSdkAdLogs()
  {
    return fieldSetFlags()[2];
  }

  public boolean hasTestDevice()
  {
    return fieldSetFlags()[4];
  }

  public Builder setAdReportedIds(List<AdReportedId> paramList)
  {
    validate(fields()[1], paramList);
    this.ca = paramList;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setAgentTimestamp(long paramLong)
  {
    validate(fields()[3], Long.valueOf(paramLong));
    this.dm = paramLong;
    fieldSetFlags()[3] = 1;
    return this;
  }

  public Builder setApiKey(CharSequence paramCharSequence)
  {
    validate(fields()[0], paramCharSequence);
    this.bX = paramCharSequence;
    fieldSetFlags()[0] = 1;
    return this;
  }

  public Builder setSdkAdLogs(List<SdkAdLog> paramList)
  {
    validate(fields()[2], paramList);
    this.dl = paramList;
    fieldSetFlags()[2] = 1;
    return this;
  }

  public Builder setTestDevice(boolean paramBoolean)
  {
    validate(fields()[4], Boolean.valueOf(paramBoolean));
    this.cc = paramBoolean;
    fieldSetFlags()[4] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.SdkLogRequest.Builder
 * JD-Core Version:    0.6.2
 */