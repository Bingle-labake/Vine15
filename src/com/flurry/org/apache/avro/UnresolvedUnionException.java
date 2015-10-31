package com.flurry.org.apache.avro;

public class UnresolvedUnionException extends AvroRuntimeException
{
  private Schema unionSchema;
  private Object unresolvedDatum;

  public UnresolvedUnionException(Schema paramSchema, Object paramObject)
  {
    super("Not in union " + paramSchema + ": " + paramObject);
    this.unionSchema = paramSchema;
    this.unresolvedDatum = paramObject;
  }

  public Schema getUnionSchema()
  {
    return this.unionSchema;
  }

  public Object getUnresolvedDatum()
  {
    return this.unresolvedDatum;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.UnresolvedUnionException
 * JD-Core Version:    0.6.2
 */