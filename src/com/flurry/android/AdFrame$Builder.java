package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.util.List;

public class AdFrame$Builder extends SpecificRecordBuilderBase<AdFrame>
  implements RecordBuilder<AdFrame>
{
  private int p;
  private CharSequence q;
  private CharSequence r;
  private AdSpaceLayout s;
  private List<Callback> t;
  private CharSequence u;

  private AdFrame$Builder()
  {
    super(AdFrame.SCHEMA$);
  }

  public AdFrame build()
  {
    try
    {
      AdFrame localAdFrame = new AdFrame();
      int i;
      CharSequence localCharSequence1;
      label42: CharSequence localCharSequence2;
      label63: AdSpaceLayout localAdSpaceLayout;
      label84: List localList;
      if (fieldSetFlags()[0] != 0)
      {
        i = this.p;
        localAdFrame.p = i;
        if (fieldSetFlags()[1] == 0)
          break label154;
        localCharSequence1 = this.q;
        localAdFrame.q = localCharSequence1;
        if (fieldSetFlags()[2] == 0)
          break label172;
        localCharSequence2 = this.r;
        localAdFrame.r = localCharSequence2;
        if (fieldSetFlags()[3] == 0)
          break label190;
        localAdSpaceLayout = this.s;
        localAdFrame.s = localAdSpaceLayout;
        if (fieldSetFlags()[4] == 0)
          break label208;
        localList = this.t;
        label105: localAdFrame.t = localList;
        if (fieldSetFlags()[5] == 0)
          break label226;
      }
      label154: label172: label190: label208: label226: for (CharSequence localCharSequence3 = this.u; ; localCharSequence3 = (CharSequence)defaultValue(fields()[5]))
      {
        localAdFrame.u = localCharSequence3;
        return localAdFrame;
        i = ((Integer)defaultValue(fields()[0])).intValue();
        break;
        localCharSequence1 = (CharSequence)defaultValue(fields()[1]);
        break label42;
        localCharSequence2 = (CharSequence)defaultValue(fields()[2]);
        break label63;
        localAdSpaceLayout = (AdSpaceLayout)defaultValue(fields()[3]);
        break label84;
        localList = (List)defaultValue(fields()[4]);
        break label105;
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearAdGuid()
  {
    this.u = null;
    fieldSetFlags()[5] = 0;
    return this;
  }

  public Builder clearAdSpaceLayout()
  {
    this.s = null;
    fieldSetFlags()[3] = 0;
    return this;
  }

  public Builder clearBinding()
  {
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Builder clearCallbacks()
  {
    this.t = null;
    fieldSetFlags()[4] = 0;
    return this;
  }

  public Builder clearContent()
  {
    this.r = null;
    fieldSetFlags()[2] = 0;
    return this;
  }

  public Builder clearDisplay()
  {
    this.q = null;
    fieldSetFlags()[1] = 0;
    return this;
  }

  public CharSequence getAdGuid()
  {
    return this.u;
  }

  public AdSpaceLayout getAdSpaceLayout()
  {
    return this.s;
  }

  public Integer getBinding()
  {
    return Integer.valueOf(this.p);
  }

  public List<Callback> getCallbacks()
  {
    return this.t;
  }

  public CharSequence getContent()
  {
    return this.r;
  }

  public CharSequence getDisplay()
  {
    return this.q;
  }

  public boolean hasAdGuid()
  {
    return fieldSetFlags()[5];
  }

  public boolean hasAdSpaceLayout()
  {
    return fieldSetFlags()[3];
  }

  public boolean hasBinding()
  {
    return fieldSetFlags()[0];
  }

  public boolean hasCallbacks()
  {
    return fieldSetFlags()[4];
  }

  public boolean hasContent()
  {
    return fieldSetFlags()[2];
  }

  public boolean hasDisplay()
  {
    return fieldSetFlags()[1];
  }

  public Builder setAdGuid(CharSequence paramCharSequence)
  {
    validate(fields()[5], paramCharSequence);
    this.u = paramCharSequence;
    fieldSetFlags()[5] = 1;
    return this;
  }

  public Builder setAdSpaceLayout(AdSpaceLayout paramAdSpaceLayout)
  {
    validate(fields()[3], paramAdSpaceLayout);
    this.s = paramAdSpaceLayout;
    fieldSetFlags()[3] = 1;
    return this;
  }

  public Builder setBinding(int paramInt)
  {
    validate(fields()[0], Integer.valueOf(paramInt));
    this.p = paramInt;
    fieldSetFlags()[0] = 1;
    return this;
  }

  public Builder setCallbacks(List<Callback> paramList)
  {
    validate(fields()[4], paramList);
    this.t = paramList;
    fieldSetFlags()[4] = 1;
    return this;
  }

  public Builder setContent(CharSequence paramCharSequence)
  {
    validate(fields()[2], paramCharSequence);
    this.r = paramCharSequence;
    fieldSetFlags()[2] = 1;
    return this;
  }

  public Builder setDisplay(CharSequence paramCharSequence)
  {
    validate(fields()[1], paramCharSequence);
    this.q = paramCharSequence;
    fieldSetFlags()[1] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.AdFrame.Builder
 * JD-Core Version:    0.6.2
 */