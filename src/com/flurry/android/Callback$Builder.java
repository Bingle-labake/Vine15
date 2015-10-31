package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.util.List;

public class Callback$Builder extends SpecificRecordBuilderBase<Callback>
  implements RecordBuilder<Callback>
{
  private CharSequence bJ;
  private List<CharSequence> bK;

  private Callback$Builder()
  {
    super(Callback.SCHEMA$);
  }

  public Callback build()
  {
    try
    {
      Callback localCallback = new Callback();
      CharSequence localCharSequence;
      if (fieldSetFlags()[0] != 0)
      {
        localCharSequence = this.bJ;
        localCallback.bJ = localCharSequence;
        if (fieldSetFlags()[1] == 0)
          break label67;
      }
      label67: for (List localList = this.bK; ; localList = (List)defaultValue(fields()[1]))
      {
        localCallback.bK = localList;
        return localCallback;
        localCharSequence = (CharSequence)defaultValue(fields()[0]);
        break;
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearActions()
  {
    this.bK = null;
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearEvent()
  {
    this.bJ = null;
    fieldSetFlags()[0] = 0;
    return this;
  }

  public List<CharSequence> getActions()
  {
    return this.bK;
  }

  public CharSequence getEvent()
  {
    return this.bJ;
  }

  public boolean hasActions()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasEvent()
  {
    return fieldSetFlags()[0];
  }

  public Builder setActions(List<CharSequence> paramList)
  {
    validate(fields()[1], paramList);
    this.bK = paramList;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setEvent(CharSequence paramCharSequence)
  {
    validate(fields()[0], paramCharSequence);
    this.bJ = paramCharSequence;
    fieldSetFlags()[0] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.Callback.Builder
 * JD-Core Version:    0.6.2
 */