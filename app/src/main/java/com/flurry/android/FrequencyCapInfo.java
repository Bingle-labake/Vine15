package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Parser;
import com.flurry.org.apache.avro.specific.SpecificRecord;
import com.flurry.org.apache.avro.specific.SpecificRecordBase;

class FrequencyCapInfo extends SpecificRecordBase
  implements SpecificRecord
{
  public static final Schema SCHEMA$ = new Schema.Parser().parse("{\"type\":\"record\",\"name\":\"FrequencyCapInfo\",\"namespace\":\"com.flurry.android\",\"fields\":[{\"name\":\"idHash\",\"type\":\"string\",\"default\":\"null\"},{\"name\":\"serveTime\",\"type\":\"long\"},{\"name\":\"expirationTime\",\"type\":\"long\"},{\"name\":\"views\",\"type\":\"int\"},{\"name\":\"newCap\",\"type\":\"int\"},{\"name\":\"previousCap\",\"type\":\"int\"},{\"name\":\"previousCapType\",\"type\":\"int\"}]}");
  public CharSequence W;
  public long X;
  public int Y;
  public int Z;
  public int aa;
  public long ab;
  public int df;

  public static FrequencyCapInfo.Builder ak()
  {
    return new FrequencyCapInfo.Builder();
  }

  public Object get(int paramInt)
  {
    switch (paramInt)
    {
    default:
      throw new AvroRuntimeException("Bad index");
    case 0:
      return this.W;
    case 1:
      return Long.valueOf(this.X);
    case 2:
      return Long.valueOf(this.ab);
    case 3:
      return Integer.valueOf(this.df);
    case 4:
      return Integer.valueOf(this.Y);
    case 5:
      return Integer.valueOf(this.Z);
    case 6:
    }
    return Integer.valueOf(this.aa);
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
      this.W = ((CharSequence)paramObject);
      return;
    case 1:
      this.X = ((Long)paramObject).longValue();
      return;
    case 2:
      this.ab = ((Long)paramObject).longValue();
      return;
    case 3:
      this.df = ((Integer)paramObject).intValue();
      return;
    case 4:
      this.Y = ((Integer)paramObject).intValue();
      return;
    case 5:
      this.Z = ((Integer)paramObject).intValue();
      return;
    case 6:
    }
    this.aa = ((Integer)paramObject).intValue();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.FrequencyCapInfo
 * JD-Core Version:    0.6.2
 */