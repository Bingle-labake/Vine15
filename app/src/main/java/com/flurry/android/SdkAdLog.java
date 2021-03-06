package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Parser;
import com.flurry.org.apache.avro.specific.SpecificRecord;
import com.flurry.org.apache.avro.specific.SpecificRecordBase;
import java.util.List;

class SdkAdLog extends SpecificRecordBase
  implements SpecificRecord
{
  public static final Schema SCHEMA$ = new Schema.Parser().parse("{\"type\":\"record\",\"name\":\"SdkAdLog\",\"namespace\":\"com.flurry.android\",\"fields\":[{\"name\":\"sessionId\",\"type\":\"long\"},{\"name\":\"adLogGUID\",\"type\":\"string\"},{\"name\":\"sdkAdEvents\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"SdkAdEvent\",\"fields\":[{\"name\":\"type\",\"type\":\"string\"},{\"name\":\"params\",\"type\":{\"type\":\"map\",\"values\":\"string\"}},{\"name\":\"timeOffset\",\"type\":\"long\"}]}}}]}");
  public long bU;
  public CharSequence bV;
  public List<SdkAdEvent> bW;

  public final void b(Long paramLong)
  {
    this.bU = paramLong.longValue();
  }

  public final void c(CharSequence paramCharSequence)
  {
    this.bV = paramCharSequence;
  }

  public final void g(List<SdkAdEvent> paramList)
  {
    this.bW = paramList;
  }

  public Object get(int paramInt)
  {
    switch (paramInt)
    {
    default:
      throw new AvroRuntimeException("Bad index");
    case 0:
      return Long.valueOf(this.bU);
    case 1:
      return this.bV;
    case 2:
    }
    return this.bW;
  }

  public Schema getSchema()
  {
    return SCHEMA$;
  }

  public void put(int paramInt, Object paramObject)
  {
    switch (paramInt)
    {
    default:
      throw new AvroRuntimeException("Bad index");
    case 0:
      this.bU = ((Long)paramObject).longValue();
      return;
    case 1:
      this.bV = ((CharSequence)paramObject);
      return;
    case 2:
    }
    this.bW = ((List)paramObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.SdkAdLog
 * JD-Core Version:    0.6.2
 */