package com.flurry.org.apache.avro.generic;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import com.flurry.org.apache.avro.io.DatumReader;
import com.flurry.org.apache.avro.io.Decoder;
import com.flurry.org.apache.avro.io.DecoderFactory;
import com.flurry.org.apache.avro.io.ResolvingDecoder;
import com.flurry.org.apache.avro.util.Utf8;
import com.flurry.org.apache.avro.util.WeakIdentityHashMap;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class GenericDatumReader<D>
  implements DatumReader<D>
{
  private static final ThreadLocal<Map<Schema, Map<Schema, ResolvingDecoder>>> RESOLVER_CACHE = new ThreadLocal()
  {
    protected Map<Schema, Map<Schema, ResolvingDecoder>> initialValue()
    {
      return new WeakIdentityHashMap();
    }
  };
  private Schema actual;
  private final Thread creator;
  private ResolvingDecoder creatorResolver = null;
  private final GenericData data;
  private Schema expected;

  public GenericDatumReader()
  {
    this(null, null, GenericData.get());
  }

  public GenericDatumReader(Schema paramSchema)
  {
    this(paramSchema, paramSchema, GenericData.get());
  }

  public GenericDatumReader(Schema paramSchema1, Schema paramSchema2)
  {
    this(paramSchema1, paramSchema2, GenericData.get());
  }

  protected GenericDatumReader(Schema paramSchema1, Schema paramSchema2, GenericData paramGenericData)
  {
    this.actual = paramSchema1;
    this.expected = paramSchema2;
    this.data = paramGenericData;
    this.creator = Thread.currentThread();
  }

  public static void skip(Schema paramSchema, Decoder paramDecoder)
    throws IOException
  {
    Iterator localIterator;
    switch (2.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
      throw new RuntimeException("Unknown type: " + paramSchema);
    case 1:
      localIterator = paramSchema.getFields().iterator();
    case 2:
      while (localIterator.hasNext())
      {
        skip(((Schema.Field)localIterator.next()).schema(), paramDecoder);
        continue;
        paramDecoder.readInt();
      }
    case 14:
      return;
    case 3:
      Schema localSchema2 = paramSchema.getElementType();
      for (long l3 = paramDecoder.skipArray(); l3 > 0L; l3 = paramDecoder.skipArray())
        for (long l4 = 0L; l4 < l3; l4 += 1L)
          skip(localSchema2, paramDecoder);
    case 4:
      Schema localSchema1 = paramSchema.getValueType();
      for (long l1 = paramDecoder.skipMap(); l1 > 0L; l1 = paramDecoder.skipMap())
        for (long l2 = 0L; l2 < l1; l2 += 1L)
        {
          paramDecoder.skipString();
          skip(localSchema1, paramDecoder);
        }
    case 5:
      skip((Schema)paramSchema.getTypes().get(paramDecoder.readIndex()), paramDecoder);
      return;
    case 6:
      paramDecoder.skipFixed(paramSchema.getFixedSize());
      return;
    case 7:
      paramDecoder.skipString();
      return;
    case 8:
      paramDecoder.skipBytes();
      return;
    case 9:
      paramDecoder.readInt();
      return;
    case 10:
      paramDecoder.readLong();
      return;
    case 11:
      paramDecoder.readFloat();
      return;
    case 12:
      paramDecoder.readDouble();
      return;
    case 13:
    }
    paramDecoder.readBoolean();
  }

  protected void addToArray(Object paramObject1, long paramLong, Object paramObject2)
  {
    ((Collection)paramObject1).add(paramObject2);
  }

  protected void addToMap(Object paramObject1, Object paramObject2, Object paramObject3)
  {
    ((Map)paramObject1).put(paramObject2, paramObject3);
  }

  protected Object createBytes(byte[] paramArrayOfByte)
  {
    return ByteBuffer.wrap(paramArrayOfByte);
  }

  protected Object createEnum(String paramString, Schema paramSchema)
  {
    return new GenericData.EnumSymbol(paramSchema, paramString);
  }

  @Deprecated
  protected Object createFixed(Object paramObject, Schema paramSchema)
  {
    return this.data.createFixed(paramObject, paramSchema);
  }

  @Deprecated
  protected Object createFixed(Object paramObject, byte[] paramArrayOfByte, Schema paramSchema)
  {
    return this.data.createFixed(paramObject, paramArrayOfByte, paramSchema);
  }

  protected Object createString(String paramString)
  {
    return new Utf8(paramString);
  }

  public GenericData getData()
  {
    return this.data;
  }

  public Schema getExpected()
  {
    return this.expected;
  }

  protected final ResolvingDecoder getResolver(Schema paramSchema1, Schema paramSchema2)
    throws IOException
  {
    Thread localThread = Thread.currentThread();
    ResolvingDecoder localResolvingDecoder;
    if ((localThread == this.creator) && (this.creatorResolver != null))
      localResolvingDecoder = this.creatorResolver;
    do
    {
      return localResolvingDecoder;
      Object localObject = (Map)((Map)RESOLVER_CACHE.get()).get(paramSchema1);
      if (localObject == null)
      {
        localObject = new WeakIdentityHashMap();
        ((Map)RESOLVER_CACHE.get()).put(paramSchema1, localObject);
      }
      localResolvingDecoder = (ResolvingDecoder)((Map)localObject).get(paramSchema2);
      if (localResolvingDecoder == null)
      {
        localResolvingDecoder = DecoderFactory.get().resolvingDecoder(Schema.applyAliases(paramSchema1, paramSchema2), paramSchema2, null);
        ((Map)localObject).put(paramSchema2, localResolvingDecoder);
      }
    }
    while (localThread != this.creator);
    this.creatorResolver = localResolvingDecoder;
    return localResolvingDecoder;
  }

  public Schema getSchema()
  {
    return this.actual;
  }

  protected Object newArray(Object paramObject, int paramInt, Schema paramSchema)
  {
    if ((paramObject instanceof Collection))
    {
      ((Collection)paramObject).clear();
      return paramObject;
    }
    return new GenericData.Array(paramInt, paramSchema);
  }

  protected Object newMap(Object paramObject, int paramInt)
  {
    if ((paramObject instanceof Map))
    {
      ((Map)paramObject).clear();
      return paramObject;
    }
    return new HashMap(paramInt);
  }

  @Deprecated
  protected Object newRecord(Object paramObject, Schema paramSchema)
  {
    return this.data.newRecord(paramObject, paramSchema);
  }

  protected Object peekArray(Object paramObject)
  {
    if ((paramObject instanceof GenericArray))
      return ((GenericArray)paramObject).peek();
    return null;
  }

  protected Object read(Object paramObject, Schema paramSchema, ResolvingDecoder paramResolvingDecoder)
    throws IOException
  {
    switch (2.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
      throw new AvroRuntimeException("Unknown type: " + paramSchema);
    case 1:
      return readRecord(paramObject, paramSchema, paramResolvingDecoder);
    case 2:
      return readEnum(paramSchema, paramResolvingDecoder);
    case 3:
      return readArray(paramObject, paramSchema, paramResolvingDecoder);
    case 4:
      return readMap(paramObject, paramSchema, paramResolvingDecoder);
    case 5:
      return read(paramObject, (Schema)paramSchema.getTypes().get(paramResolvingDecoder.readIndex()), paramResolvingDecoder);
    case 6:
      return readFixed(paramObject, paramSchema, paramResolvingDecoder);
    case 7:
      return readString(paramObject, paramSchema, paramResolvingDecoder);
    case 8:
      return readBytes(paramObject, paramResolvingDecoder);
    case 9:
      return readInt(paramObject, paramSchema, paramResolvingDecoder);
    case 10:
      return Long.valueOf(paramResolvingDecoder.readLong());
    case 11:
      return Float.valueOf(paramResolvingDecoder.readFloat());
    case 12:
      return Double.valueOf(paramResolvingDecoder.readDouble());
    case 13:
      return Boolean.valueOf(paramResolvingDecoder.readBoolean());
    case 14:
    }
    paramResolvingDecoder.readNull();
    return null;
  }

  public D read(D paramD, Decoder paramDecoder)
    throws IOException
  {
    ResolvingDecoder localResolvingDecoder = getResolver(this.actual, this.expected);
    localResolvingDecoder.configure(paramDecoder);
    Object localObject = read(paramD, this.expected, localResolvingDecoder);
    localResolvingDecoder.drain();
    return localObject;
  }

  protected Object readArray(Object paramObject, Schema paramSchema, ResolvingDecoder paramResolvingDecoder)
    throws IOException
  {
    Schema localSchema = paramSchema.getElementType();
    long l1 = paramResolvingDecoder.readArrayStart();
    long l2 = 0L;
    if (l1 > 0L)
    {
      Object localObject = newArray(paramObject, (int)l1, paramSchema);
      do
      {
        for (long l3 = 0L; l3 < l1; l3 += 1L)
          addToArray(localObject, l2 + l3, read(peekArray(localObject), localSchema, paramResolvingDecoder));
        l2 += l1;
        l1 = paramResolvingDecoder.arrayNext();
      }
      while (l1 > 0L);
      return localObject;
    }
    return newArray(paramObject, 0, paramSchema);
  }

  protected Object readBytes(Object paramObject, Decoder paramDecoder)
    throws IOException
  {
    if ((paramObject instanceof ByteBuffer));
    for (ByteBuffer localByteBuffer = (ByteBuffer)paramObject; ; localByteBuffer = null)
      return paramDecoder.readBytes(localByteBuffer);
  }

  protected Object readEnum(Schema paramSchema, Decoder paramDecoder)
    throws IOException
  {
    return createEnum((String)paramSchema.getEnumSymbols().get(paramDecoder.readEnum()), paramSchema);
  }

  protected Object readFixed(Object paramObject, Schema paramSchema, Decoder paramDecoder)
    throws IOException
  {
    GenericFixed localGenericFixed = (GenericFixed)this.data.createFixed(paramObject, paramSchema);
    paramDecoder.readFixed(localGenericFixed.bytes(), 0, paramSchema.getFixedSize());
    return localGenericFixed;
  }

  protected Object readInt(Object paramObject, Schema paramSchema, Decoder paramDecoder)
    throws IOException
  {
    return Integer.valueOf(paramDecoder.readInt());
  }

  protected Object readMap(Object paramObject, Schema paramSchema, ResolvingDecoder paramResolvingDecoder)
    throws IOException
  {
    Schema localSchema = paramSchema.getValueType();
    long l = paramResolvingDecoder.readMapStart();
    Object localObject = newMap(paramObject, (int)l);
    if (l > 0L)
      do
      {
        for (int i = 0; i < l; i++)
          addToMap(localObject, readString(null, paramSchema, paramResolvingDecoder), read(null, localSchema, paramResolvingDecoder));
        l = paramResolvingDecoder.mapNext();
      }
      while (l > 0L);
    return localObject;
  }

  protected Object readRecord(Object paramObject, Schema paramSchema, ResolvingDecoder paramResolvingDecoder)
    throws IOException
  {
    Object localObject1 = this.data.newRecord(paramObject, paramSchema);
    Object localObject2 = this.data.getRecordState(localObject1, paramSchema);
    Schema.Field[] arrayOfField = paramResolvingDecoder.readFieldOrder();
    int i = arrayOfField.length;
    int j = 0;
    if (j < i)
    {
      Schema.Field localField = arrayOfField[j];
      int k = localField.pos();
      String str = localField.name();
      if (paramObject != null);
      for (Object localObject3 = this.data.getField(localObject1, str, k, localObject2); ; localObject3 = null)
      {
        this.data.setField(localObject1, str, k, read(localObject3, localField.schema(), paramResolvingDecoder), localObject2);
        j++;
        break;
      }
    }
    return localObject1;
  }

  protected Object readString(Object paramObject, Schema paramSchema, Decoder paramDecoder)
    throws IOException
  {
    if ("String".equals(paramSchema.getProp("avro.java.string")))
      return paramDecoder.readString();
    return readString(paramObject, paramDecoder);
  }

  protected Object readString(Object paramObject, Decoder paramDecoder)
    throws IOException
  {
    if ((paramObject instanceof Utf8));
    for (Utf8 localUtf8 = (Utf8)paramObject; ; localUtf8 = null)
      return paramDecoder.readString(localUtf8);
  }

  public void setExpected(Schema paramSchema)
  {
    this.expected = paramSchema;
    this.creatorResolver = null;
  }

  public void setSchema(Schema paramSchema)
  {
    this.actual = paramSchema;
    if (this.expected == null)
      this.expected = this.actual;
    this.creatorResolver = null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.generic.GenericDatumReader
 * JD-Core Version:    0.6.2
 */