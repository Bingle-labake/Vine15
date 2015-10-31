package com.flurry.org.apache.avro.generic;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.AvroTypeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import com.flurry.org.apache.avro.Schema.Field.Order;
import com.flurry.org.apache.avro.Schema.Type;
import com.flurry.org.apache.avro.UnresolvedUnionException;
import com.flurry.org.apache.avro.io.BinaryData;
import com.flurry.org.apache.avro.io.DatumReader;
import com.flurry.org.apache.avro.util.Utf8;
import java.nio.ByteBuffer;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class GenericData
{
  private static final GenericData INSTANCE = new GenericData();
  private static final Schema STRINGS = Schema.create(Schema.Type.STRING);
  protected static final String STRING_PROP = "avro.java.string";
  protected static final String STRING_TYPE_STRING = "String";

  public static GenericData get()
  {
    return INSTANCE;
  }

  public static void setStringType(Schema paramSchema, StringType paramStringType)
  {
    if (paramStringType == StringType.String)
      paramSchema.addProp("avro.java.string", "String");
  }

  private void writeEscapedString(String paramString, StringBuilder paramStringBuilder)
  {
    int i = 0;
    if (i < paramString.length())
    {
      int j = paramString.charAt(i);
      int k;
      switch (j)
      {
      default:
        if (((j >= 0) && (j <= 31)) || ((j >= 127) && (j <= 159)) || ((j >= 8192) && (j <= 8447)))
        {
          Integer.toHexString(j);
          paramStringBuilder.append("\\u");
          k = 0;
        }
        break;
      case 34:
        while (k < 4 - paramStringBuilder.length())
        {
          paramStringBuilder.append('0');
          k++;
          continue;
          paramStringBuilder.append("\\\"");
        }
      case 92:
      case 8:
      case 12:
      case 10:
      case 13:
      case 9:
      case 47:
      }
      while (true)
      {
        i++;
        break;
        paramStringBuilder.append("\\\\");
        continue;
        paramStringBuilder.append("\\b");
        continue;
        paramStringBuilder.append("\\f");
        continue;
        paramStringBuilder.append("\\n");
        continue;
        paramStringBuilder.append("\\r");
        continue;
        paramStringBuilder.append("\\t");
        continue;
        paramStringBuilder.append("\\/");
        continue;
        paramStringBuilder.append(paramString.toUpperCase());
        continue;
        paramStringBuilder.append(j);
      }
    }
  }

  public int compare(Object paramObject1, Object paramObject2, Schema paramSchema)
  {
    return compare(paramObject1, paramObject2, paramSchema, false);
  }

  protected int compare(Object paramObject1, Object paramObject2, Schema paramSchema, boolean paramBoolean)
  {
    if (paramObject1 == paramObject2)
      return 0;
    switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    default:
      return ((Comparable)paramObject1).compareTo(paramObject2);
    case 1:
      Iterator localIterator3 = paramSchema.getFields().iterator();
      while (localIterator3.hasNext())
      {
        Schema.Field localField = (Schema.Field)localIterator3.next();
        if (localField.order() != Schema.Field.Order.IGNORE)
        {
          int m = localField.pos();
          String str2 = localField.name();
          int n = compare(getField(paramObject1, str2, m), getField(paramObject2, str2, m), localField.schema(), paramBoolean);
          if (n != 0)
          {
            if (localField.order() == Schema.Field.Order.DESCENDING)
              n = -n;
            return n;
          }
        }
      }
      return 0;
    case 2:
      return paramSchema.getEnumOrdinal(paramObject1.toString()) - paramSchema.getEnumOrdinal(paramObject2.toString());
    case 3:
      Collection localCollection1 = (Collection)paramObject1;
      Collection localCollection2 = (Collection)paramObject2;
      Iterator localIterator1 = localCollection1.iterator();
      Iterator localIterator2 = localCollection2.iterator();
      Schema localSchema = paramSchema.getElementType();
      while ((localIterator1.hasNext()) && (localIterator2.hasNext()))
      {
        int k = compare(localIterator1.next(), localIterator2.next(), localSchema, paramBoolean);
        if (k != 0)
          return k;
      }
      if (localIterator1.hasNext())
        return 1;
      if (localIterator2.hasNext())
        return -1;
      return 0;
    case 4:
      if (paramBoolean)
      {
        if (((Map)paramObject1).equals(paramObject2))
          return 0;
        return 1;
      }
      throw new AvroRuntimeException("Can't compare maps!");
    case 5:
      int i = resolveUnion(paramSchema, paramObject1);
      int j = resolveUnion(paramSchema, paramObject2);
      if (i == j)
        return compare(paramObject1, paramObject2, (Schema)paramSchema.getTypes().get(i), paramBoolean);
      return i - j;
    case 14:
      return 0;
    case 7:
    }
    Utf8 localUtf81;
    if ((paramObject1 instanceof Utf8))
    {
      localUtf81 = (Utf8)paramObject1;
      if (!(paramObject2 instanceof Utf8))
        break label486;
    }
    label486: for (Utf8 localUtf82 = (Utf8)paramObject2; ; localUtf82 = new Utf8(paramObject2.toString()))
    {
      return localUtf81.compareTo(localUtf82);
      String str1 = paramObject1.toString();
      localUtf81 = new Utf8(str1);
      break;
    }
  }

  public DatumReader createDatumReader(Schema paramSchema)
  {
    return new GenericDatumReader(paramSchema, paramSchema, this);
  }

  public Object createFixed(Object paramObject, Schema paramSchema)
  {
    if (((paramObject instanceof GenericFixed)) && (((GenericFixed)paramObject).bytes().length == paramSchema.getFixedSize()))
      return paramObject;
    return new Fixed(paramSchema);
  }

  public Object createFixed(Object paramObject, byte[] paramArrayOfByte, Schema paramSchema)
  {
    GenericFixed localGenericFixed = (GenericFixed)createFixed(paramObject, paramSchema);
    System.arraycopy(paramArrayOfByte, 0, localGenericFixed.bytes(), 0, paramSchema.getFixedSize());
    return localGenericFixed;
  }

  public Object deepCopy(Schema paramSchema, Object paramObject)
  {
    if (paramObject == null)
      paramObject = null;
    do
    {
      return paramObject;
      switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
      {
      case 2:
      default:
        throw new AvroRuntimeException("Deep copy failed for schema \"" + paramSchema + "\" and value \"" + paramObject + "\"");
      case 3:
        List localList = (List)paramObject;
        Array localArray = new Array(localList.size(), paramSchema);
        Iterator localIterator3 = localList.iterator();
        while (localIterator3.hasNext())
        {
          Object localObject = localIterator3.next();
          localArray.add(deepCopy(paramSchema.getElementType(), localObject));
        }
        return localArray;
      case 13:
        return new Boolean(((Boolean)paramObject).booleanValue());
      case 8:
        ByteBuffer localByteBuffer = (ByteBuffer)paramObject;
        byte[] arrayOfByte = new byte[localByteBuffer.capacity()];
        localByteBuffer.rewind();
        localByteBuffer.get(arrayOfByte);
        localByteBuffer.rewind();
        return ByteBuffer.wrap(arrayOfByte);
      case 12:
        return new Double(((Double)paramObject).doubleValue());
      case 6:
        return createFixed(null, ((GenericFixed)paramObject).bytes(), paramSchema);
      case 11:
        return new Float(((Float)paramObject).floatValue());
      case 9:
        return new Integer(((Integer)paramObject).intValue());
      case 10:
        return new Long(((Long)paramObject).longValue());
      case 4:
        Map localMap = (Map)paramObject;
        HashMap localHashMap = new HashMap(localMap.size());
        Iterator localIterator2 = localMap.entrySet().iterator();
        while (localIterator2.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator2.next();
          localHashMap.put((CharSequence)deepCopy(STRINGS, localEntry.getKey()), deepCopy(paramSchema.getValueType(), localEntry.getValue()));
        }
        return localHashMap;
      case 14:
        return null;
      case 1:
        IndexedRecord localIndexedRecord1 = (IndexedRecord)paramObject;
        IndexedRecord localIndexedRecord2 = (IndexedRecord)newRecord(null, paramSchema);
        Iterator localIterator1 = paramSchema.getFields().iterator();
        while (localIterator1.hasNext())
        {
          Schema.Field localField = (Schema.Field)localIterator1.next();
          localIndexedRecord2.put(localField.pos(), deepCopy(localField.schema(), localIndexedRecord1.get(localField.pos())));
        }
        return localIndexedRecord2;
      case 7:
      case 5:
      }
    }
    while ((paramObject instanceof String));
    if ((paramObject instanceof Utf8))
      return new Utf8((Utf8)paramObject);
    return new Utf8(paramObject.toString());
    return deepCopy((Schema)paramSchema.getTypes().get(resolveUnion(paramSchema, paramObject)), paramObject);
  }

  protected Schema getEnumSchema(Object paramObject)
  {
    return ((GenericContainer)paramObject).getSchema();
  }

  public Object getField(Object paramObject, String paramString, int paramInt)
  {
    return ((IndexedRecord)paramObject).get(paramInt);
  }

  protected Object getField(Object paramObject1, String paramString, int paramInt, Object paramObject2)
  {
    return getField(paramObject1, paramString, paramInt);
  }

  protected Schema getFixedSchema(Object paramObject)
  {
    return ((GenericContainer)paramObject).getSchema();
  }

  protected Schema getRecordSchema(Object paramObject)
  {
    return ((GenericContainer)paramObject).getSchema();
  }

  protected Object getRecordState(Object paramObject, Schema paramSchema)
  {
    return null;
  }

  protected String getSchemaName(Object paramObject)
  {
    if (paramObject == null)
      return Schema.Type.NULL.getName();
    if (isRecord(paramObject))
      return getRecordSchema(paramObject).getFullName();
    if (isEnum(paramObject))
      return getEnumSchema(paramObject).getFullName();
    if (isArray(paramObject))
      return Schema.Type.ARRAY.getName();
    if (isMap(paramObject))
      return Schema.Type.MAP.getName();
    if (isFixed(paramObject))
      return getFixedSchema(paramObject).getFullName();
    if (isString(paramObject))
      return Schema.Type.STRING.getName();
    if (isBytes(paramObject))
      return Schema.Type.BYTES.getName();
    if ((paramObject instanceof Integer))
      return Schema.Type.INT.getName();
    if ((paramObject instanceof Long))
      return Schema.Type.LONG.getName();
    if ((paramObject instanceof Float))
      return Schema.Type.FLOAT.getName();
    if ((paramObject instanceof Double))
      return Schema.Type.DOUBLE.getName();
    if ((paramObject instanceof Boolean))
      return Schema.Type.BOOLEAN.getName();
    throw new AvroRuntimeException("Unknown datum type: " + paramObject);
  }

  public int hashCode(Object paramObject, Schema paramSchema)
  {
    if (paramObject == null)
    {
      i = 0;
      return i;
    }
    int i = 1;
    switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    case 4:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    default:
      return paramObject.hashCode();
    case 1:
      Iterator localIterator2 = paramSchema.getFields().iterator();
      while (localIterator2.hasNext())
      {
        Schema.Field localField = (Schema.Field)localIterator2.next();
        if (localField.order() != Schema.Field.Order.IGNORE)
          i = hashCodeAdd(i, getField(paramObject, localField.name(), localField.pos()), localField.schema());
      }
    case 3:
      Collection localCollection = (Collection)paramObject;
      Schema localSchema = paramSchema.getElementType();
      Iterator localIterator1 = localCollection.iterator();
      while (localIterator1.hasNext())
        i = hashCodeAdd(i, localIterator1.next(), localSchema);
    case 5:
      return hashCode(paramObject, (Schema)paramSchema.getTypes().get(resolveUnion(paramSchema, paramObject)));
    case 2:
      return paramSchema.getEnumOrdinal(paramObject.toString());
    case 14:
      return 0;
    case 7:
    }
    if ((paramObject instanceof Utf8));
    while (true)
    {
      return paramObject.hashCode();
      paramObject = new Utf8(paramObject.toString());
    }
  }

  protected int hashCodeAdd(int paramInt, Object paramObject, Schema paramSchema)
  {
    return paramInt * 31 + hashCode(paramObject, paramSchema);
  }

  public Schema induce(Object paramObject)
  {
    if (isRecord(paramObject))
      return getRecordSchema(paramObject);
    if ((paramObject instanceof Collection))
    {
      Schema localSchema2 = null;
      Iterator localIterator2 = ((Collection)paramObject).iterator();
      while (localIterator2.hasNext())
      {
        Object localObject = localIterator2.next();
        if (localSchema2 == null)
          localSchema2 = induce(localObject);
        else if (!localSchema2.equals(induce(localObject)))
          throw new AvroTypeException("No mixed type arrays.");
      }
      if (localSchema2 == null)
        throw new AvroTypeException("Empty array: " + paramObject);
      return Schema.createArray(localSchema2);
    }
    if ((paramObject instanceof Map))
    {
      Map localMap = (Map)paramObject;
      Schema localSchema1 = null;
      Iterator localIterator1 = localMap.entrySet().iterator();
      while (localIterator1.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator1.next();
        if (localSchema1 == null)
          localSchema1 = induce(localEntry.getValue());
        else if (!localSchema1.equals(induce(localEntry.getValue())))
          throw new AvroTypeException("No mixed type map values.");
      }
      if (localSchema1 == null)
        throw new AvroTypeException("Empty map: " + paramObject);
      return Schema.createMap(localSchema1);
    }
    if ((paramObject instanceof GenericFixed))
      return Schema.createFixed(null, null, null, ((GenericFixed)paramObject).bytes().length);
    if ((paramObject instanceof CharSequence))
      return Schema.create(Schema.Type.STRING);
    if ((paramObject instanceof ByteBuffer))
      return Schema.create(Schema.Type.BYTES);
    if ((paramObject instanceof Integer))
      return Schema.create(Schema.Type.INT);
    if ((paramObject instanceof Long))
      return Schema.create(Schema.Type.LONG);
    if ((paramObject instanceof Float))
      return Schema.create(Schema.Type.FLOAT);
    if ((paramObject instanceof Double))
      return Schema.create(Schema.Type.DOUBLE);
    if ((paramObject instanceof Boolean))
      return Schema.create(Schema.Type.BOOLEAN);
    if (paramObject == null)
      return Schema.create(Schema.Type.NULL);
    throw new AvroTypeException("Can't create schema for: " + paramObject);
  }

  protected boolean instanceOf(Schema paramSchema, Object paramObject)
  {
    boolean bool = true;
    switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    case 5:
    default:
      throw new AvroRuntimeException("Unexpected type: " + paramSchema);
    case 1:
      if (isRecord(paramObject))
        break;
    case 2:
    case 3:
    case 4:
    case 6:
      do
      {
        do
        {
          return false;
          if (paramSchema.getFullName() == null)
            if (getRecordSchema(paramObject).getFullName() != null);
          while (true)
          {
            return bool;
            bool = false;
            continue;
            bool = paramSchema.getFullName().equals(getRecordSchema(paramObject).getFullName());
          }
        }
        while (!isEnum(paramObject));
        return paramSchema.getFullName().equals(getEnumSchema(paramObject).getFullName());
        return isArray(paramObject);
        return isMap(paramObject);
      }
      while (!isFixed(paramObject));
      return paramSchema.getFullName().equals(getFixedSchema(paramObject).getFullName());
    case 7:
      return isString(paramObject);
    case 8:
      return isBytes(paramObject);
    case 9:
      return paramObject instanceof Integer;
    case 10:
      return paramObject instanceof Long;
    case 11:
      return paramObject instanceof Float;
    case 12:
      return paramObject instanceof Double;
    case 13:
      return paramObject instanceof Boolean;
    case 14:
    }
    if (paramObject == null);
    while (true)
    {
      return bool;
      bool = false;
    }
  }

  protected boolean isArray(Object paramObject)
  {
    return paramObject instanceof Collection;
  }

  protected boolean isBytes(Object paramObject)
  {
    return paramObject instanceof ByteBuffer;
  }

  protected boolean isEnum(Object paramObject)
  {
    return paramObject instanceof GenericEnumSymbol;
  }

  protected boolean isFixed(Object paramObject)
  {
    return paramObject instanceof GenericFixed;
  }

  protected boolean isMap(Object paramObject)
  {
    return paramObject instanceof Map;
  }

  protected boolean isRecord(Object paramObject)
  {
    return paramObject instanceof IndexedRecord;
  }

  protected boolean isString(Object paramObject)
  {
    return paramObject instanceof CharSequence;
  }

  public Object newRecord(Object paramObject, Schema paramSchema)
  {
    if ((paramObject instanceof IndexedRecord))
    {
      IndexedRecord localIndexedRecord = (IndexedRecord)paramObject;
      if (localIndexedRecord.getSchema() == paramSchema)
        return localIndexedRecord;
    }
    return new Record(paramSchema);
  }

  public int resolveUnion(Schema paramSchema, Object paramObject)
  {
    Integer localInteger = paramSchema.getIndexNamed(getSchemaName(paramObject));
    if (localInteger != null)
      return localInteger.intValue();
    throw new UnresolvedUnionException(paramSchema, paramObject);
  }

  public void setField(Object paramObject1, String paramString, int paramInt, Object paramObject2)
  {
    ((IndexedRecord)paramObject1).put(paramInt, paramObject2);
  }

  protected void setField(Object paramObject1, String paramString, int paramInt, Object paramObject2, Object paramObject3)
  {
    setField(paramObject1, paramString, paramInt, paramObject2);
  }

  public String toString(Object paramObject)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    toString(paramObject, localStringBuilder);
    return localStringBuilder.toString();
  }

  protected void toString(Object paramObject, StringBuilder paramStringBuilder)
  {
    if (isRecord(paramObject))
    {
      paramStringBuilder.append("{");
      int n = 0;
      Schema localSchema = getRecordSchema(paramObject);
      Iterator localIterator3 = localSchema.getFields().iterator();
      while (localIterator3.hasNext())
      {
        Schema.Field localField = (Schema.Field)localIterator3.next();
        toString(localField.name(), paramStringBuilder);
        paramStringBuilder.append(": ");
        toString(getField(paramObject, localField.name(), localField.pos()), paramStringBuilder);
        n++;
        if (n < localSchema.getFields().size())
          paramStringBuilder.append(", ");
      }
      paramStringBuilder.append("}");
      return;
    }
    if ((paramObject instanceof Collection))
    {
      Collection localCollection = (Collection)paramObject;
      paramStringBuilder.append("[");
      long l = -1 + localCollection.size();
      int k = 0;
      Iterator localIterator2 = localCollection.iterator();
      while (localIterator2.hasNext())
      {
        toString(localIterator2.next(), paramStringBuilder);
        int m = k + 1;
        if (k < l)
          paramStringBuilder.append(", ");
        k = m;
      }
      paramStringBuilder.append("]");
      return;
    }
    if ((paramObject instanceof Map))
    {
      paramStringBuilder.append("{");
      int j = 0;
      Map localMap = (Map)paramObject;
      Iterator localIterator1 = localMap.entrySet().iterator();
      while (localIterator1.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator1.next();
        toString(localEntry.getKey(), paramStringBuilder);
        paramStringBuilder.append(": ");
        toString(localEntry.getValue(), paramStringBuilder);
        j++;
        if (j < localMap.size())
          paramStringBuilder.append(", ");
      }
      paramStringBuilder.append("}");
      return;
    }
    if (((paramObject instanceof CharSequence)) || ((paramObject instanceof GenericEnumSymbol)))
    {
      paramStringBuilder.append("\"");
      writeEscapedString(paramObject.toString(), paramStringBuilder);
      paramStringBuilder.append("\"");
      return;
    }
    if ((paramObject instanceof ByteBuffer))
    {
      paramStringBuilder.append("{\"bytes\": \"");
      ByteBuffer localByteBuffer = (ByteBuffer)paramObject;
      for (int i = localByteBuffer.position(); i < localByteBuffer.limit(); i++)
        paramStringBuilder.append((char)localByteBuffer.get(i));
      paramStringBuilder.append("\"}");
      return;
    }
    paramStringBuilder.append(paramObject);
  }

  public boolean validate(Schema paramSchema, Object paramObject)
  {
    boolean bool = true;
    switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
    case 1:
    case 2:
    case 3:
    case 4:
      do
      {
        do
        {
          do
            return false;
          while (!isRecord(paramObject));
          Iterator localIterator4 = paramSchema.getFields().iterator();
          while (localIterator4.hasNext())
          {
            Schema.Field localField = (Schema.Field)localIterator4.next();
            if (!validate(localField.schema(), getField(paramObject, localField.name(), localField.pos())))
              return false;
          }
          return bool;
          return paramSchema.getEnumSymbols().contains(paramObject.toString());
        }
        while (!(paramObject instanceof Collection));
        Iterator localIterator3 = ((Collection)paramObject).iterator();
        while (localIterator3.hasNext())
        {
          Object localObject = localIterator3.next();
          if (!validate(paramSchema.getElementType(), localObject))
            return false;
        }
        return bool;
      }
      while (!(paramObject instanceof Map));
      Iterator localIterator2 = ((Map)paramObject).entrySet().iterator();
      while (localIterator2.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator2.next();
        if (!validate(paramSchema.getValueType(), localEntry.getValue()))
          return false;
      }
      return bool;
    case 5:
      Iterator localIterator1 = paramSchema.getTypes().iterator();
      do
        if (!localIterator1.hasNext())
          break;
      while (!validate((Schema)localIterator1.next(), paramObject));
      return bool;
    case 6:
      if (((paramObject instanceof GenericFixed)) && (((GenericFixed)paramObject).bytes().length == paramSchema.getFixedSize()));
      while (true)
      {
        return bool;
        bool = false;
      }
    case 7:
      return isString(paramObject);
    case 8:
      return isBytes(paramObject);
    case 9:
      return paramObject instanceof Integer;
    case 10:
      return paramObject instanceof Long;
    case 11:
      return paramObject instanceof Float;
    case 12:
      return paramObject instanceof Double;
    case 13:
      return paramObject instanceof Boolean;
    case 14:
    }
    if (paramObject == null);
    while (true)
    {
      return bool;
      bool = false;
    }
  }

  public static class Array<T> extends AbstractList<T>
    implements GenericArray<T>, Comparable<GenericArray<T>>
  {
    private static final Object[] EMPTY = new Object[0];
    private Object[] elements = EMPTY;
    private final Schema schema;
    private int size;

    public Array(int paramInt, Schema paramSchema)
    {
      if ((paramSchema == null) || (!Schema.Type.ARRAY.equals(paramSchema.getType())))
        throw new AvroRuntimeException("Not an array schema: " + paramSchema);
      this.schema = paramSchema;
      if (paramInt != 0)
        this.elements = new Object[paramInt];
    }

    public Array(Schema paramSchema, Collection<T> paramCollection)
    {
      if ((paramSchema == null) || (!Schema.Type.ARRAY.equals(paramSchema.getType())))
        throw new AvroRuntimeException("Not an array schema: " + paramSchema);
      this.schema = paramSchema;
      if (paramCollection != null)
      {
        this.elements = new Object[paramCollection.size()];
        addAll(paramCollection);
      }
    }

    public void add(int paramInt, T paramT)
    {
      if ((paramInt > this.size) || (paramInt < 0))
        throw new IndexOutOfBoundsException("Index " + paramInt + " out of bounds.");
      if (this.size == this.elements.length)
      {
        Object[] arrayOfObject = new Object[1 + 3 * this.size / 2];
        System.arraycopy(this.elements, 0, arrayOfObject, 0, this.size);
        this.elements = arrayOfObject;
      }
      System.arraycopy(this.elements, paramInt, this.elements, paramInt + 1, this.size - paramInt);
      this.elements[paramInt] = paramT;
      this.size = (1 + this.size);
    }

    public boolean add(T paramT)
    {
      if (this.size == this.elements.length)
      {
        Object[] arrayOfObject2 = new Object[1 + 3 * this.size / 2];
        System.arraycopy(this.elements, 0, arrayOfObject2, 0, this.size);
        this.elements = arrayOfObject2;
      }
      Object[] arrayOfObject1 = this.elements;
      int i = this.size;
      this.size = (i + 1);
      arrayOfObject1[i] = paramT;
      return true;
    }

    public void clear()
    {
      this.size = 0;
    }

    public int compareTo(GenericArray<T> paramGenericArray)
    {
      return GenericData.get().compare(this, paramGenericArray, getSchema());
    }

    public T get(int paramInt)
    {
      if (paramInt >= this.size)
        throw new IndexOutOfBoundsException("Index " + paramInt + " out of bounds.");
      return this.elements[paramInt];
    }

    public Schema getSchema()
    {
      return this.schema;
    }

    public Iterator<T> iterator()
    {
      return new Iterator()
      {
        private int position = 0;

        public boolean hasNext()
        {
          return this.position < GenericData.Array.this.size;
        }

        public T next()
        {
          Object[] arrayOfObject = GenericData.Array.this.elements;
          int i = this.position;
          this.position = (i + 1);
          return arrayOfObject[i];
        }

        public void remove()
        {
          throw new UnsupportedOperationException();
        }
      };
    }

    public T peek()
    {
      if (this.size < this.elements.length)
        return this.elements[this.size];
      return null;
    }

    public T remove(int paramInt)
    {
      if (paramInt >= this.size)
        throw new IndexOutOfBoundsException("Index " + paramInt + " out of bounds.");
      Object localObject = this.elements[paramInt];
      this.size = (-1 + this.size);
      System.arraycopy(this.elements, paramInt + 1, this.elements, paramInt, this.size - paramInt);
      this.elements[this.size] = null;
      return localObject;
    }

    public void reverse()
    {
      int i = 0;
      for (int j = -1 + this.elements.length; i < j; j--)
      {
        Object localObject = this.elements[i];
        this.elements[i] = this.elements[j];
        this.elements[j] = localObject;
        i++;
      }
    }

    public T set(int paramInt, T paramT)
    {
      if (paramInt >= this.size)
        throw new IndexOutOfBoundsException("Index " + paramInt + " out of bounds.");
      Object localObject = this.elements[paramInt];
      this.elements[paramInt] = paramT;
      return localObject;
    }

    public int size()
    {
      return this.size;
    }

    public String toString()
    {
      StringBuffer localStringBuffer = new StringBuffer();
      localStringBuffer.append("[");
      int i = 0;
      Iterator localIterator = iterator();
      if (localIterator.hasNext())
      {
        Object localObject = localIterator.next();
        if (localObject == null);
        for (String str = "null"; ; str = localObject.toString())
        {
          localStringBuffer.append(str);
          i++;
          if (i >= size())
            break;
          localStringBuffer.append(", ");
          break;
        }
      }
      localStringBuffer.append("]");
      return localStringBuffer.toString();
    }
  }

  public static class EnumSymbol
    implements GenericEnumSymbol
  {
    private Schema schema;
    private String symbol;

    public EnumSymbol(Schema paramSchema, String paramString)
    {
      this.schema = paramSchema;
      this.symbol = paramString;
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      while (((paramObject instanceof GenericEnumSymbol)) && (this.symbol.equals(paramObject.toString())))
        return true;
      return false;
    }

    public Schema getSchema()
    {
      return this.schema;
    }

    public int hashCode()
    {
      return this.symbol.hashCode();
    }

    public String toString()
    {
      return this.symbol;
    }
  }

  public static class Fixed
    implements GenericFixed, Comparable<Fixed>
  {
    private byte[] bytes;
    private Schema schema;

    protected Fixed()
    {
    }

    public Fixed(Schema paramSchema)
    {
      setSchema(paramSchema);
    }

    public Fixed(Schema paramSchema, byte[] paramArrayOfByte)
    {
      this.schema = paramSchema;
      this.bytes = paramArrayOfByte;
    }

    public void bytes(byte[] paramArrayOfByte)
    {
      this.bytes = paramArrayOfByte;
    }

    public byte[] bytes()
    {
      return this.bytes;
    }

    public int compareTo(Fixed paramFixed)
    {
      return BinaryData.compareBytes(this.bytes, 0, this.bytes.length, paramFixed.bytes, 0, paramFixed.bytes.length);
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      while (((paramObject instanceof GenericFixed)) && (Arrays.equals(this.bytes, ((GenericFixed)paramObject).bytes())))
        return true;
      return false;
    }

    public Schema getSchema()
    {
      return this.schema;
    }

    public int hashCode()
    {
      return Arrays.hashCode(this.bytes);
    }

    protected void setSchema(Schema paramSchema)
    {
      this.schema = paramSchema;
      this.bytes = new byte[paramSchema.getFixedSize()];
    }

    public String toString()
    {
      return Arrays.toString(this.bytes);
    }
  }

  public static class Record
    implements GenericRecord, Comparable<Record>
  {
    private final Schema schema;
    private final Object[] values;

    public Record(Schema paramSchema)
    {
      if ((paramSchema == null) || (!Schema.Type.RECORD.equals(paramSchema.getType())))
        throw new AvroRuntimeException("Not a record schema: " + paramSchema);
      this.schema = paramSchema;
      this.values = new Object[paramSchema.getFields().size()];
    }

    public Record(Record paramRecord, boolean paramBoolean)
    {
      this.schema = paramRecord.schema;
      this.values = new Object[this.schema.getFields().size()];
      if (paramBoolean)
        for (int i = 0; i < this.values.length; i++)
          this.values[i] = GenericData.INSTANCE.deepCopy(((Schema.Field)this.schema.getFields().get(i)).schema(), paramRecord.values[i]);
      System.arraycopy(paramRecord.values, 0, this.values, 0, paramRecord.values.length);
    }

    public int compareTo(Record paramRecord)
    {
      return GenericData.get().compare(this, paramRecord, this.schema);
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      Record localRecord;
      do
      {
        return true;
        if (!(paramObject instanceof Record))
          return false;
        localRecord = (Record)paramObject;
        if (!this.schema.getFullName().equals(localRecord.schema.getFullName()))
          return false;
      }
      while (GenericData.get().compare(this, localRecord, this.schema, true) == 0);
      return false;
    }

    public Object get(int paramInt)
    {
      return this.values[paramInt];
    }

    public Object get(String paramString)
    {
      Schema.Field localField = this.schema.getField(paramString);
      if (localField == null)
        return null;
      return this.values[localField.pos()];
    }

    public Schema getSchema()
    {
      return this.schema;
    }

    public int hashCode()
    {
      return GenericData.get().hashCode(this, this.schema);
    }

    public void put(int paramInt, Object paramObject)
    {
      this.values[paramInt] = paramObject;
    }

    public void put(String paramString, Object paramObject)
    {
      Schema.Field localField = this.schema.getField(paramString);
      if (localField == null)
        throw new AvroRuntimeException("Not a valid schema field: " + paramString);
      this.values[localField.pos()] = paramObject;
    }

    public String toString()
    {
      return GenericData.get().toString(this);
    }
  }

  public static enum StringType
  {
    static
    {
      StringType[] arrayOfStringType = new StringType[3];
      arrayOfStringType[0] = CharSequence;
      arrayOfStringType[1] = String;
      arrayOfStringType[2] = Utf8;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.generic.GenericData
 * JD-Core Version:    0.6.2
 */