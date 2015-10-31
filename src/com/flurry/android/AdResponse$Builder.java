package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.util.List;

public class AdResponse$Builder extends SpecificRecordBuilderBase<AdResponse>
  implements RecordBuilder<AdResponse>
{
  private List<AdUnit> bx;
  private List<CharSequence> x;

  private AdResponse$Builder()
  {
    super(AdResponse.SCHEMA$);
  }

  public AdResponse build()
  {
    try
    {
      AdResponse localAdResponse = new AdResponse();
      List localList1;
      if (fieldSetFlags()[0] != 0)
      {
        localList1 = this.bx;
        localAdResponse.bx = localList1;
        if (fieldSetFlags()[1] == 0)
          break label67;
      }
      label67: for (List localList2 = this.x; ; localList2 = (List)defaultValue(fields()[1]))
      {
        localAdResponse.x = localList2;
        return localAdResponse;
        localList1 = (List)defaultValue(fields()[0]);
        break;
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearAdUnits()
  {
    this.bx = null;
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Builder clearErrors()
  {
    this.x = null;
    fieldSetFlags()[1] = 0;
    return this;
  }

  public List<AdUnit> getAdUnits()
  {
    return this.bx;
  }

  public List<CharSequence> getErrors()
  {
    return this.x;
  }

  public boolean hasAdUnits()
  {
    return fieldSetFlags()[0];
  }

  public boolean hasErrors()
  {
    return fieldSetFlags()[1];
  }

  public Builder setAdUnits(List<AdUnit> paramList)
  {
    validate(fields()[0], paramList);
    this.bx = paramList;
    fieldSetFlags()[0] = 1;
    return this;
  }

  public Builder setErrors(List<CharSequence> paramList)
  {
    validate(fields()[1], paramList);
    this.x = paramList;
    fieldSetFlags()[1] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.AdResponse.Builder
 * JD-Core Version:    0.6.2
 */