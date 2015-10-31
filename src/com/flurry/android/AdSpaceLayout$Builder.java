package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;

public class AdSpaceLayout$Builder extends SpecificRecordBuilderBase<AdSpaceLayout>
  implements RecordBuilder<AdSpaceLayout>
{
  private int jdField_do;
  private int dp;
  private CharSequence dq;
  private CharSequence dr;
  private CharSequence ds;

  private AdSpaceLayout$Builder()
  {
    super(AdSpaceLayout.SCHEMA$);
  }

  public AdSpaceLayout build()
  {
    try
    {
      AdSpaceLayout localAdSpaceLayout = new AdSpaceLayout();
      int i;
      int j;
      label42: CharSequence localCharSequence1;
      label63: CharSequence localCharSequence2;
      if (fieldSetFlags()[0] != 0)
      {
        i = this.jdField_do;
        localAdSpaceLayout.jdField_do = i;
        if (fieldSetFlags()[1] == 0)
          break label133;
        j = this.dp;
        localAdSpaceLayout.dp = j;
        if (fieldSetFlags()[2] == 0)
          break label154;
        localCharSequence1 = this.dq;
        localAdSpaceLayout.dq = localCharSequence1;
        if (fieldSetFlags()[3] == 0)
          break label172;
        localCharSequence2 = this.dr;
        label84: localAdSpaceLayout.dr = localCharSequence2;
        if (fieldSetFlags()[4] == 0)
          break label190;
      }
      label133: label154: label172: label190: for (CharSequence localCharSequence3 = this.ds; ; localCharSequence3 = (CharSequence)defaultValue(fields()[4]))
      {
        localAdSpaceLayout.ds = localCharSequence3;
        return localAdSpaceLayout;
        i = ((Integer)defaultValue(fields()[0])).intValue();
        break;
        j = ((Integer)defaultValue(fields()[1])).intValue();
        break label42;
        localCharSequence1 = (CharSequence)defaultValue(fields()[2]);
        break label63;
        localCharSequence2 = (CharSequence)defaultValue(fields()[3]);
        break label84;
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearAdHeight()
  {
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearAdWidth()
  {
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Builder clearAlignment()
  {
    this.ds = null;
    fieldSetFlags()[4] = 0;
    return this;
  }

  public Builder clearFix()
  {
    this.dq = null;
    fieldSetFlags()[2] = 0;
    return this;
  }

  public Builder clearFormat()
  {
    this.dr = null;
    fieldSetFlags()[3] = 0;
    return this;
  }

  public Integer getAdHeight()
  {
    return Integer.valueOf(this.dp);
  }

  public Integer getAdWidth()
  {
    return Integer.valueOf(this.jdField_do);
  }

  public CharSequence getAlignment()
  {
    return this.ds;
  }

  public CharSequence getFix()
  {
    return this.dq;
  }

  public CharSequence getFormat()
  {
    return this.dr;
  }

  public boolean hasAdHeight()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasAdWidth()
  {
    return fieldSetFlags()[0];
  }

  public boolean hasAlignment()
  {
    return fieldSetFlags()[4];
  }

  public boolean hasFix()
  {
    return fieldSetFlags()[2];
  }

  public boolean hasFormat()
  {
    return fieldSetFlags()[3];
  }

  public Builder setAdHeight(int paramInt)
  {
    validate(fields()[1], Integer.valueOf(paramInt));
    this.dp = paramInt;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setAdWidth(int paramInt)
  {
    validate(fields()[0], Integer.valueOf(paramInt));
    this.jdField_do = paramInt;
    fieldSetFlags()[0] = 1;
    return this;
  }

  public Builder setAlignment(CharSequence paramCharSequence)
  {
    validate(fields()[4], paramCharSequence);
    this.ds = paramCharSequence;
    fieldSetFlags()[4] = 1;
    return this;
  }

  public Builder setFix(CharSequence paramCharSequence)
  {
    validate(fields()[2], paramCharSequence);
    this.dq = paramCharSequence;
    fieldSetFlags()[2] = 1;
    return this;
  }

  public Builder setFormat(CharSequence paramCharSequence)
  {
    validate(fields()[3], paramCharSequence);
    this.dr = paramCharSequence;
    fieldSetFlags()[3] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.AdSpaceLayout.Builder
 * JD-Core Version:    0.6.2
 */