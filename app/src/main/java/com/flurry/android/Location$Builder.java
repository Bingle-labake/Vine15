package com.flurry.android;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.data.RecordBuilder;
import com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase;

public class Location$Builder extends SpecificRecordBuilderBase<Location>
  implements RecordBuilder<Location>
{
  private float eY;
  private float eZ;

  private Location$Builder(byte paramByte)
  {
    super(Location.SCHEMA$);
  }

  public Location build()
  {
    try
    {
      Location localLocation = new Location();
      float f1;
      if (fieldSetFlags()[0] != 0)
      {
        f1 = this.eY;
        localLocation.eY = f1;
        if (fieldSetFlags()[1] == 0)
          break label70;
      }
      label70: float f2;
      for (float f3 = this.eZ; ; f3 = f2)
      {
        localLocation.eZ = f3;
        return localLocation;
        f1 = ((Float)defaultValue(fields()[0])).floatValue();
        break;
        f2 = ((Float)defaultValue(fields()[1])).floatValue();
      }
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Builder clearLat()
  {
    fieldSetFlags()[0] = 0;
    return this;
  }

  public Builder clearLon()
  {
    fieldSetFlags()[1] = 0;
    return this;
  }

  public Float getLat()
  {
    return Float.valueOf(this.eY);
  }

  public Float getLon()
  {
    return Float.valueOf(this.eZ);
  }

  public boolean hasLat()
  {
    return fieldSetFlags()[0];
  }

  public boolean hasLon()
  {
    return fieldSetFlags()[1];
  }

  public Builder setLat(float paramFloat)
  {
    validate(fields()[0], Float.valueOf(paramFloat));
    this.eY = paramFloat;
    fieldSetFlags()[0] = 1;
    return this;
  }

  public Builder setLon(float paramFloat)
  {
    validate(fields()[1], Float.valueOf(paramFloat));
    this.eZ = paramFloat;
    fieldSetFlags()[1] = 1;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.Location.Builder
 * JD-Core Version:    0.6.2
 */