package com.flurry.org.apache.avro.data;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import com.flurry.org.apache.avro.Schema.Type;
import com.flurry.org.apache.avro.generic.GenericData;
import com.flurry.org.apache.avro.generic.IndexedRecord;
import com.flurry.org.apache.avro.io.BinaryDecoder;
import com.flurry.org.apache.avro.io.BinaryEncoder;
import com.flurry.org.apache.avro.io.DatumReader;
import com.flurry.org.apache.avro.io.DecoderFactory;
import com.flurry.org.apache.avro.io.EncoderFactory;
import com.flurry.org.apache.avro.io.parsing.ResolvingGrammarGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public abstract class RecordBuilderBase<T extends IndexedRecord>
  implements RecordBuilder<T>
{
  private static final ConcurrentMap<String, ConcurrentMap<Integer, Object>> DEFAULT_VALUE_CACHE = new ConcurrentHashMap();
  private static final Schema.Field[] EMPTY_FIELDS = new Schema.Field[0];
  private final GenericData data;
  private BinaryDecoder decoder = null;
  private BinaryEncoder encoder = null;
  private final boolean[] fieldSetFlags;
  private final Schema.Field[] fields;
  private final Schema schema;

  protected RecordBuilderBase(Schema paramSchema, GenericData paramGenericData)
  {
    this.schema = paramSchema;
    this.data = paramGenericData;
    this.fields = ((Schema.Field[])paramSchema.getFields().toArray(EMPTY_FIELDS));
    this.fieldSetFlags = new boolean[this.fields.length];
  }

  protected RecordBuilderBase(RecordBuilderBase<T> paramRecordBuilderBase, GenericData paramGenericData)
  {
    this.schema = paramRecordBuilderBase.schema;
    this.data = paramGenericData;
    this.fields = ((Schema.Field[])this.schema.getFields().toArray(EMPTY_FIELDS));
    this.fieldSetFlags = new boolean[paramRecordBuilderBase.fieldSetFlags.length];
    System.arraycopy(paramRecordBuilderBase.fieldSetFlags, 0, this.fieldSetFlags, 0, this.fieldSetFlags.length);
  }

  protected static boolean isValidValue(Schema.Field paramField, Object paramObject)
  {
    if (paramObject != null);
    Schema localSchema;
    Schema.Type localType;
    do
    {
      return true;
      localSchema = paramField.schema();
      localType = localSchema.getType();
    }
    while (localType == Schema.Type.NULL);
    if (localType == Schema.Type.UNION)
    {
      Iterator localIterator = localSchema.getTypes().iterator();
      while (localIterator.hasNext())
        if (((Schema)localIterator.next()).getType() == Schema.Type.NULL)
          return true;
    }
    return false;
  }

  protected final GenericData data()
  {
    return this.data;
  }

  protected Object defaultValue(Schema.Field paramField)
    throws IOException
  {
    JsonNode localJsonNode = paramField.defaultValue();
    if (localJsonNode == null)
      throw new AvroRuntimeException("Field " + paramField + " not set and has no default value");
    if ((localJsonNode.isNull()) && ((paramField.schema().getType() == Schema.Type.NULL) || ((paramField.schema().getType() == Schema.Type.UNION) && (((Schema)paramField.schema().getTypes().get(0)).getType() == Schema.Type.NULL))))
      return null;
    ConcurrentMap localConcurrentMap = (ConcurrentMap)DEFAULT_VALUE_CACHE.get(this.schema.getFullName());
    if (localConcurrentMap == null)
    {
      DEFAULT_VALUE_CACHE.putIfAbsent(this.schema.getFullName(), new ConcurrentHashMap(this.fields.length));
      localConcurrentMap = (ConcurrentMap)DEFAULT_VALUE_CACHE.get(this.schema.getFullName());
    }
    Object localObject = localConcurrentMap.get(Integer.valueOf(paramField.pos()));
    if (localObject == null)
    {
      ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
      this.encoder = EncoderFactory.get().binaryEncoder(localByteArrayOutputStream, this.encoder);
      ResolvingGrammarGenerator.encode(this.encoder, paramField.schema(), localJsonNode);
      this.encoder.flush();
      this.decoder = DecoderFactory.get().binaryDecoder(localByteArrayOutputStream.toByteArray(), this.decoder);
      localObject = this.data.createDatumReader(paramField.schema()).read(null, this.decoder);
      localConcurrentMap.putIfAbsent(Integer.valueOf(paramField.pos()), localObject);
    }
    return this.data.deepCopy(paramField.schema(), localObject);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    RecordBuilderBase localRecordBuilderBase;
    do
    {
      do
      {
        return true;
        if (paramObject == null)
          return false;
        if (getClass() != paramObject.getClass())
          return false;
        localRecordBuilderBase = (RecordBuilderBase)paramObject;
        if (!Arrays.equals(this.fieldSetFlags, localRecordBuilderBase.fieldSetFlags))
          return false;
        if (this.schema != null)
          break;
      }
      while (localRecordBuilderBase.schema == null);
      return false;
    }
    while (this.schema.equals(localRecordBuilderBase.schema));
    return false;
  }

  protected final boolean[] fieldSetFlags()
  {
    return this.fieldSetFlags;
  }

  protected final Schema.Field[] fields()
  {
    return this.fields;
  }

  public int hashCode()
  {
    int i = 31 * (31 + Arrays.hashCode(this.fieldSetFlags));
    if (this.schema == null);
    for (int j = 0; ; j = this.schema.hashCode())
      return i + j;
  }

  protected final Schema schema()
  {
    return this.schema;
  }

  protected void validate(Schema.Field paramField, Object paramObject)
  {
    if (isValidValue(paramField, paramObject));
    while (paramField.defaultValue() != null)
      return;
    throw new AvroRuntimeException("Field " + paramField + " does not accept null values");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.data.RecordBuilderBase
 * JD-Core Version:    0.6.2
 */