package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Parser;
import com.flurry.org.apache.avro.specific.SpecificRecord;
import com.flurry.org.apache.avro.specific.SpecificRecordBase;
import java.nio.ByteBuffer;

class AdReportedId extends SpecificRecordBase
  implements SpecificRecord
{
  public static final Schema SCHEMA$ = new Schema.Parser().parse("{\"type\":\"record\",\"name\":\"AdReportedId\",\"namespace\":\"com.flurry.android\",\"fields\":[{\"name\":\"type\",\"type\":\"int\"},{\"name\":\"id\",\"type\":\"bytes\"}]}");
  public ByteBuffer ev;
  public int type;

  public static AdReportedId.Builder aq()
  {
    return new AdReportedId.Builder();
  }

  public Object get(int paramInt)
  {
    switch (paramInt)
    {
    default:
      throw new AvroRuntimeException("Bad index");
    case 0:
      return Integer.valueOf(this.type);
    case 1:
    }
    return this.ev;
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
      this.type = ((Integer)paramObject).intValue();
      return;
    case 1:
    }
    this.ev = ((ByteBuffer)paramObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.AdReportedId
 * JD-Core Version:    0.6.2
 */