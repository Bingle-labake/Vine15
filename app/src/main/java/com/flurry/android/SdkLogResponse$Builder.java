package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.util.List;

public class SdkLogResponse$Builder extends SpecificRecordBuilderBase<SdkLogResponse>
  implements RecordBuilder<SdkLogResponse>
{
  private CharSequence w;
  private List<CharSequence> x;

  private SdkLogResponse$Builder()
  {
    super(SdkLogResponse.SCHEMA$);
  }

  public SdkLogResponse build()
  {
    try
    {
      SdkLogResponse localSdkLogResponse = new SdkLogResponse();
      CharSequence localCharSequence;
      if (fieldSetFlags()[0] != 0)
      {
        localCharSequence = this.w;
        localSdkLogResponse.w = localCharSequence;
        if (fieldSetFlags()[1] == 0)
          break label67;
      }
      label67: for (List localList = this.x; ; localList = (List)defaultValue(fields()[1]))
      {
        localSdkLogResponse.x = localList;
        return localSdkLogResponse;
        localCharSequence = (CharSequence)defaultValue(fields()[0]);
        break;
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearErrors()
  {
    this.x = null;
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearResult()
  {
    this.w = null;
    fieldSetFlags()[0] = 0;
    return this;
  }

  public List<CharSequence> getErrors()
  {
    return this.x;
  }

  public CharSequence getResult()
  {
    return this.w;
  }

  public boolean hasErrors()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasResult()
  {
    return fieldSetFlags()[0];
  }

  public Builder setErrors(List<CharSequence> paramList)
  {
    validate(fields()[1], paramList);
    this.x = paramList;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setResult(CharSequence paramCharSequence)
  {
    validate(fields()[0], paramCharSequence);
    this.w = paramCharSequence;
    fieldSetFlags()[0] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.SdkLogResponse.Builder
 * JD-Core Version:    0.6.2
 */