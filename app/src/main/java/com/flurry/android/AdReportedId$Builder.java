package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;
import java.nio.ByteBuffer;

public class AdReportedId$Builder extends SpecificRecordBuilderBase<AdReportedId>
  implements RecordBuilder<AdReportedId>
{
  private ByteBuffer ev;
  private int type;

  private AdReportedId$Builder(byte paramByte)
  {
    super(AdReportedId.SCHEMA$);
  }

  public AdReportedId build()
  {
    try
    {
      AdReportedId localAdReportedId = new AdReportedId();
      int i;
      if (fieldSetFlags()[0] != 0)
      {
        i = this.type;
        localAdReportedId.type = i;
        if (fieldSetFlags()[1] == 0)
          break label70;
      }
      label70: for (ByteBuffer localByteBuffer = this.ev; ; localByteBuffer = (ByteBuffer)defaultValue(fields()[1]))
      {
        localAdReportedId.ev = localByteBuffer;
        return localAdReportedId;
        i = ((Integer)defaultValue(fields()[0])).intValue();
        break;
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearId()
  {
    this.ev = null;
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Builder clearType()
  {
    fieldSetFlags()[0] = 0;
    return this;
  }

  public ByteBuffer getId()
  {
    return this.ev;
  }

  public Integer getType()
  {
    return Integer.valueOf(this.type);
  }

  public boolean hasId()
  {
    return fieldSetFlags()[1];
  }

  public boolean hasType()
  {
    return fieldSetFlags()[0];
  }

  public Builder setId(ByteBuffer paramByteBuffer)
  {
    validate(fields()[1], paramByteBuffer);
    this.ev = paramByteBuffer;
    fieldSetFlags()[1] = 1;
    return this;
  }

  public Builder setType(int paramInt)
  {
    validate(fields()[0], Integer.valueOf(paramInt));
    this.type = paramInt;
    fieldSetFlags()[0] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.AdReportedId.Builder
 * JD-Core Version:    0.6.2
 */