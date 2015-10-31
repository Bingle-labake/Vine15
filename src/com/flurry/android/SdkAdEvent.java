package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Parser;
import com.flurry.org.apache.avro.specific.SpecificRecord;
import com.flurry.org.apache.avro.specific.SpecificRecordBase;
import java.util.Map;

class SdkAdEvent extends SpecificRecordBase
  implements SpecificRecord
{
  public static final Schema SCHEMA$ = new Schema.Parser().parse("{\"type\":\"record\",\"name\":\"SdkAdEvent\",\"namespace\":\"com.flurry.android\",\"fields\":[{\"name\":\"type\",\"type\":\"string\"},{\"name\":\"params\",\"type\":{\"type\":\"map\",\"values\":\"string\"}},{\"name\":\"timeOffset\",\"type\":\"long\"}]}");
  public CharSequence af;
  public Map<CharSequence, CharSequence> ag;
  public long ah;

  public final void a(CharSequence paramCharSequence)
  {
    this.af = paramCharSequence;
  }

  public final void a(Long paramLong)
  {
    this.ah = paramLong.longValue();
  }

  public final void a(Map<CharSequence, CharSequence> paramMap)
  {
    this.ag = paramMap;
  }

  public Object get(int paramInt)
  {
    switch (paramInt)
    {
    default:
      throw new AvroRuntimeException("Bad index");
    case 0:
      return this.af;
    case 1:
      return this.ag;
    case 2:
    }
    return Long.valueOf(this.ah);
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
      this.af = ((CharSequence)paramObject);
      return;
    case 1:
      this.ag = ((Map)paramObject);
      return;
    case 2:
    }
    this.ah = ((Long)paramObject).longValue();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.SdkAdEvent
 * JD-Core Version:    0.6.2
 */