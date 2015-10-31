package com.flurry.org.apache.avro.reflect;

import com.flurry.org.apache.avro.AvroRemoteException;
import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.AvroTypeException;
import com.flurry.org.apache.avro.Protocol;
import com.flurry.org.apache.avro.Protocol.Message;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import com.flurry.org.apache.avro.Schema.Type;
import com.flurry.org.apache.avro.generic.GenericContainer;
import com.flurry.org.apache.avro.generic.GenericFixed;
import com.flurry.org.apache.avro.generic.IndexedRecord;
import com.flurry.org.apache.avro.io.BinaryData;
import com.flurry.org.apache.avro.io.DatumReader;
import com.flurry.org.apache.avro.specific.FixedSize;
import com.flurry.org.apache.avro.specific.SpecificData;
import com.flurry.org.codehaus.jackson.node.NullNode;
import com.thoughtworks.paranamer.CachingParanamer;
import com.thoughtworks.paranamer.Paranamer;
import java.lang.annotation.Annotation;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ReflectData extends SpecificData
{
  private static final Class BYTES_CLASS = new byte[0].getClass();
  static final String CLASS_PROP = "java-class";
  static final String ELEMENT_PROP = "java-element-class";
  private static final Map<Class, Map<String, Field>> FIELD_CACHE;
  private static final ReflectData INSTANCE = new ReflectData();
  private static final Schema THROWABLE_MESSAGE = makeNullable(Schema.create(Schema.Type.STRING));
  private final Paranamer paranamer = new CachingParanamer();

  static
  {
    FIELD_CACHE = new ConcurrentHashMap();
  }

  private static Field findField(Class paramClass, String paramString)
  {
    Class localClass = paramClass;
    do
      try
      {
        Field localField = localClass.getDeclaredField(paramString);
        localField.setAccessible(true);
        return localField;
      }
      catch (NoSuchFieldException localNoSuchFieldException)
      {
        localClass = localClass.getSuperclass();
      }
    while (localClass != null);
    throw new AvroRuntimeException("No field named " + paramString + " in: " + paramClass);
  }

  public static ReflectData get()
  {
    return INSTANCE;
  }

  private Schema getAnnotatedUnion(Union paramUnion, Map<String, Schema> paramMap)
  {
    ArrayList localArrayList = new ArrayList();
    Class[] arrayOfClass = paramUnion.value();
    int i = arrayOfClass.length;
    for (int j = 0; j < i; j++)
      localArrayList.add(createSchema(arrayOfClass[j], paramMap));
    return Schema.createUnion(localArrayList);
  }

  static Class getClassProp(Schema paramSchema, String paramString)
  {
    String str = paramSchema.getProp(paramString);
    if (str == null)
      return null;
    try
    {
      Class localClass = Class.forName(str);
      return localClass;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new AvroRuntimeException(localClassNotFoundException);
    }
  }

  private static Field getField(Class paramClass, String paramString)
  {
    Object localObject = (Map)FIELD_CACHE.get(paramClass);
    if (localObject == null)
    {
      localObject = new ConcurrentHashMap();
      FIELD_CACHE.put(paramClass, localObject);
    }
    Field localField = (Field)((Map)localObject).get(paramString);
    if (localField == null)
    {
      localField = findField(paramClass, paramString);
      ((Map)localObject).put(paramString, localField);
    }
    return localField;
  }

  private Collection<Field> getFields(Class paramClass)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    Class localClass = paramClass;
    if ((localClass.getPackage() != null) && (localClass.getPackage().getName().startsWith("java.")));
    while (true)
    {
      return localLinkedHashMap.values();
      for (Field localField : localClass.getDeclaredFields())
        if (((0x88 & localField.getModifiers()) == 0) && (localLinkedHashMap.put(localField.getName(), localField) != null))
          throw new AvroTypeException(localClass + " contains two fields named: " + localField);
      localClass = localClass.getSuperclass();
      if (localClass != null)
        break;
    }
  }

  private Protocol.Message getMessage(Method paramMethod, Protocol paramProtocol, Map<String, Schema> paramMap)
  {
    ArrayList localArrayList1 = new ArrayList();
    String[] arrayOfString = this.paranamer.lookupParameterNames(paramMethod);
    Type[] arrayOfType1 = paramMethod.getGenericParameterTypes();
    Annotation[][] arrayOfAnnotation = paramMethod.getParameterAnnotations();
    int i = 0;
    if (i < arrayOfType1.length)
    {
      Schema localSchema4 = getSchema(arrayOfType1[i], paramMap);
      int m = 0;
      int n = arrayOfAnnotation[i].length;
      if (m < n)
      {
        if ((arrayOfAnnotation[i][m] instanceof Union))
          localSchema4 = getAnnotatedUnion((Union)arrayOfAnnotation[i][m], paramMap);
        while (true)
        {
          m++;
          break;
          if ((arrayOfAnnotation[i][m] instanceof Nullable))
            localSchema4 = makeNullable(localSchema4);
        }
      }
      if (arrayOfString.length == arrayOfType1.length);
      for (String str = arrayOfString[i]; ; str = localSchema4.getName() + i)
      {
        localArrayList1.add(new Schema.Field(str, localSchema4, null, null));
        i++;
        break;
      }
    }
    Schema localSchema1 = Schema.createRecord(localArrayList1);
    Union localUnion = (Union)paramMethod.getAnnotation(Union.class);
    if (localUnion == null);
    ArrayList localArrayList2;
    for (Schema localSchema2 = getSchema(paramMethod.getGenericReturnType(), paramMap); ; localSchema2 = getAnnotatedUnion(localUnion, paramMap))
    {
      if (paramMethod.isAnnotationPresent(Nullable.class))
        localSchema2 = makeNullable(localSchema2);
      localArrayList2 = new ArrayList();
      localArrayList2.add(Protocol.SYSTEM_ERROR);
      for (Type localType : paramMethod.getGenericExceptionTypes())
        if (localType != AvroRemoteException.class)
          localArrayList2.add(getSchema(localType, paramMap));
    }
    Schema localSchema3 = Schema.createUnion(localArrayList2);
    return paramProtocol.createMessage(paramMethod.getName(), null, localSchema1, localSchema2, localSchema3);
  }

  private Schema getSchema(Type paramType, Map<String, Schema> paramMap)
  {
    try
    {
      Schema localSchema = createSchema(paramType, paramMap);
      return localSchema;
    }
    catch (AvroTypeException localAvroTypeException)
    {
      throw new AvroTypeException("Error getting schema for " + paramType + ": " + localAvroTypeException.getMessage(), localAvroTypeException);
    }
  }

  public static Schema makeNullable(Schema paramSchema)
  {
    Schema[] arrayOfSchema = new Schema[2];
    arrayOfSchema[0] = Schema.create(Schema.Type.NULL);
    arrayOfSchema[1] = paramSchema;
    return Schema.createUnion(Arrays.asList(arrayOfSchema));
  }

  private void setElement(Schema paramSchema, Type paramType)
  {
    if (!(paramType instanceof Class));
    Class localClass;
    do
    {
      return;
      localClass = (Class)paramType;
    }
    while ((Union)localClass.getAnnotation(Union.class) == null);
    paramSchema.addProp("java-element-class", localClass.getName());
  }

  protected int compare(Object paramObject1, Object paramObject2, Schema paramSchema, boolean paramBoolean)
  {
    switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    case 2:
    default:
    case 1:
    case 3:
    }
    label130: 
    do
    {
      int i;
      do
      {
        i = super.compare(paramObject1, paramObject2, paramSchema, paramBoolean);
        return i;
      }
      while (!paramObject1.getClass().isArray());
      Schema localSchema = paramSchema.getElementType();
      int j = Array.getLength(paramObject1);
      int k = Array.getLength(paramObject2);
      int m = Math.min(j, k);
      for (int n = 0; ; n++)
      {
        if (n >= m)
          break label130;
        i = compare(Array.get(paramObject1, n), Array.get(paramObject2, n), localSchema, paramBoolean);
        if (i != 0)
          break;
      }
      return j - k;
    }
    while (!paramObject1.getClass().isArray());
    byte[] arrayOfByte1 = (byte[])paramObject1;
    byte[] arrayOfByte2 = (byte[])paramObject2;
    return BinaryData.compareBytes(arrayOfByte1, 0, arrayOfByte1.length, arrayOfByte2, 0, arrayOfByte2.length);
  }

  public DatumReader createDatumReader(Schema paramSchema)
  {
    return new ReflectDatumReader(paramSchema, paramSchema, this);
  }

  protected Schema createFieldSchema(Field paramField, Map<String, Schema> paramMap)
  {
    Schema localSchema = createSchema(paramField.getGenericType(), paramMap);
    if (paramField.isAnnotationPresent(Nullable.class))
      localSchema = makeNullable(localSchema);
    return localSchema;
  }

  protected Schema createSchema(Type paramType, Map<String, Schema> paramMap)
  {
    if ((paramType instanceof GenericArrayType))
    {
      Type localType7 = ((GenericArrayType)paramType).getGenericComponentType();
      if (localType7 == Byte.TYPE)
        return Schema.create(Schema.Type.BYTES);
      Schema localSchema8 = Schema.createArray(createSchema(localType7, paramMap));
      setElement(localSchema8, localType7);
      return localSchema8;
    }
    if ((paramType instanceof ParameterizedType))
    {
      ParameterizedType localParameterizedType = (ParameterizedType)paramType;
      Class localClass3 = (Class)localParameterizedType.getRawType();
      Type[] arrayOfType = localParameterizedType.getActualTypeArguments();
      if (Map.class.isAssignableFrom(localClass3))
      {
        Type localType5 = arrayOfType[0];
        Type localType6 = arrayOfType[1];
        if (localType5 != String.class)
          throw new AvroTypeException("Map key class not String: " + localType5);
        return Schema.createMap(createSchema(localType6, paramMap));
      }
      if (Collection.class.isAssignableFrom(localClass3))
      {
        if (arrayOfType.length != 1)
          throw new AvroTypeException("No array type specified.");
        Schema localSchema7 = Schema.createArray(createSchema(arrayOfType[0], paramMap));
        localSchema7.addProp("java-class", localClass3.getName());
        return localSchema7;
      }
    }
    else
    {
      if ((paramType == Byte.class) || (paramType == Byte.TYPE))
      {
        Schema localSchema1 = Schema.create(Schema.Type.INT);
        localSchema1.addProp("java-class", Byte.class.getName());
        return localSchema1;
      }
      if ((paramType == Short.class) || (paramType == Short.TYPE))
      {
        Schema localSchema2 = Schema.create(Schema.Type.INT);
        localSchema2.addProp("java-class", Short.class.getName());
        return localSchema2;
      }
      if ((paramType instanceof Class))
      {
        Class localClass1 = (Class)paramType;
        if ((localClass1.isPrimitive()) || (Number.class.isAssignableFrom(localClass1)) || (localClass1 == Void.class) || (localClass1 == Boolean.class))
          return super.createSchema(paramType, paramMap);
        if (localClass1.isArray())
        {
          Class localClass2 = localClass1.getComponentType();
          if (localClass2 == Byte.TYPE)
            return Schema.create(Schema.Type.BYTES);
          Schema localSchema6 = Schema.createArray(createSchema(localClass2, paramMap));
          setElement(localSchema6, localClass2);
          return localSchema6;
        }
        if (CharSequence.class.isAssignableFrom(localClass1))
          return Schema.create(Schema.Type.STRING);
        if (ByteBuffer.class.isAssignableFrom(localClass1))
          return Schema.create(Schema.Type.BYTES);
        if (Collection.class.isAssignableFrom(localClass1))
          throw new AvroRuntimeException("Can't find element type of Collection");
        String str1 = localClass1.getName();
        Schema localSchema3 = (Schema)paramMap.get(str1);
        String str2;
        String str3;
        if (localSchema3 == null)
        {
          str2 = localClass1.getSimpleName();
          if (localClass1.getPackage() == null);
          for (str3 = ""; ; str3 = localClass1.getPackage().getName())
          {
            if (localClass1.getEnclosingClass() != null)
              str3 = localClass1.getEnclosingClass().getName() + "$";
            Union localUnion = (Union)localClass1.getAnnotation(Union.class);
            if (localUnion == null)
              break;
            return getAnnotatedUnion(localUnion, paramMap);
          }
          if (localClass1.isAnnotationPresent(Stringable.class))
          {
            Schema localSchema5 = Schema.create(Schema.Type.STRING);
            localSchema5.addProp("java-class", localClass1.getName());
            return localSchema5;
          }
          if (!localClass1.isEnum())
            break label699;
          ArrayList localArrayList1 = new ArrayList();
          Enum[] arrayOfEnum = (Enum[])localClass1.getEnumConstants();
          for (int i = 0; i < arrayOfEnum.length; i++)
            localArrayList1.add(arrayOfEnum[i].name());
          localSchema3 = Schema.createEnum(str2, null, str3, localArrayList1);
        }
        while (true)
        {
          paramMap.put(str1, localSchema3);
          return localSchema3;
          label699: if (GenericFixed.class.isAssignableFrom(localClass1))
          {
            int j = ((FixedSize)localClass1.getAnnotation(FixedSize.class)).value();
            localSchema3 = Schema.createFixed(str2, null, str3, j);
          }
          else
          {
            if (IndexedRecord.class.isAssignableFrom(localClass1))
              return super.createSchema(paramType, paramMap);
            ArrayList localArrayList2 = new ArrayList();
            boolean bool = Throwable.class.isAssignableFrom(localClass1);
            localSchema3 = Schema.createRecord(str2, null, str3, bool);
            paramMap.put(localClass1.getName(), localSchema3);
            Iterator localIterator = getFields(localClass1).iterator();
            while (localIterator.hasNext())
            {
              Field localField = (Field)localIterator.next();
              if ((0x88 & localField.getModifiers()) == 0)
              {
                Schema localSchema4 = createFieldSchema(localField, paramMap);
                Schema.Type localType1 = localSchema4.getType();
                Schema.Type localType2 = Schema.Type.UNION;
                NullNode localNullNode = null;
                if (localType1 == localType2)
                {
                  Schema.Type localType3 = ((Schema)localSchema4.getTypes().get(0)).getType();
                  Schema.Type localType4 = Schema.Type.NULL;
                  localNullNode = null;
                  if (localType3 == localType4)
                    localNullNode = NullNode.getInstance();
                }
                Schema.Field localField1 = new Schema.Field(localField.getName(), localSchema4, null, localNullNode);
                localArrayList2.add(localField1);
              }
            }
            if (bool)
              localArrayList2.add(new Schema.Field("detailMessage", THROWABLE_MESSAGE, null, null));
            localSchema3.setFields(localArrayList2);
          }
        }
      }
    }
    return super.createSchema(paramType, paramMap);
  }

  public Class getClass(Schema paramSchema)
  {
    switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
    case 1:
    case 2:
    case 3:
    case 4:
    }
    String str;
    do
    {
      Class localClass = super.getClass(paramSchema);
      do
      {
        return localClass;
        localClass = getClassProp(paramSchema, "java-class");
      }
      while (localClass != null);
      return Array.newInstance(getClass(paramSchema.getElementType()), 0).getClass();
      return String.class;
      return BYTES_CLASS;
      str = paramSchema.getProp("java-class");
      if (Byte.class.getName().equals(str))
        return Byte.TYPE;
    }
    while (!Short.class.getName().equals(str));
    return Short.TYPE;
  }

  public Object getField(Object paramObject, String paramString, int paramInt)
  {
    if ((paramObject instanceof IndexedRecord))
      return super.getField(paramObject, paramString, paramInt);
    try
    {
      Object localObject = getField(paramObject.getClass(), paramString).get(paramObject);
      return localObject;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new AvroRuntimeException(localIllegalAccessException);
    }
  }

  public Protocol getProtocol(Class paramClass)
  {
    String str1 = paramClass.getSimpleName();
    String str2;
    Protocol localProtocol;
    LinkedHashMap localLinkedHashMap;
    Map localMap;
    Method[] arrayOfMethod;
    int i;
    if (paramClass.getPackage() == null)
    {
      str2 = "";
      localProtocol = new Protocol(str1, str2);
      localLinkedHashMap = new LinkedHashMap();
      localMap = localProtocol.getMessages();
      arrayOfMethod = paramClass.getMethods();
      i = arrayOfMethod.length;
    }
    for (int j = 0; ; j++)
    {
      if (j >= i)
        break label167;
      Method localMethod = arrayOfMethod[j];
      if ((0x8 & localMethod.getModifiers()) == 0)
      {
        String str3 = localMethod.getName();
        if (localMap.containsKey(str3))
        {
          throw new AvroTypeException("Two methods with same name: " + str3);
          str2 = paramClass.getPackage().getName();
          break;
        }
        localMap.put(str3, getMessage(localMethod, localProtocol, localLinkedHashMap));
      }
    }
    label167: ArrayList localArrayList = new ArrayList();
    localArrayList.addAll(localLinkedHashMap.values());
    Collections.reverse(localArrayList);
    localProtocol.setTypes(localArrayList);
    return localProtocol;
  }

  protected Schema getRecordSchema(Object paramObject)
  {
    if ((paramObject instanceof GenericContainer))
      return super.getRecordSchema(paramObject);
    return getSchema(paramObject.getClass());
  }

  protected boolean isArray(Object paramObject)
  {
    if (paramObject == null);
    while ((!(paramObject instanceof Collection)) && (!paramObject.getClass().isArray()))
      return false;
    return true;
  }

  protected boolean isBytes(Object paramObject)
  {
    boolean bool = true;
    if (paramObject == null)
      bool = false;
    Class localClass;
    do
    {
      do
        return bool;
      while (super.isBytes(paramObject));
      localClass = paramObject.getClass();
    }
    while ((localClass.isArray()) && (localClass.getComponentType() == Byte.TYPE));
    return false;
  }

  protected boolean isRecord(Object paramObject)
  {
    boolean bool = true;
    if (paramObject == null);
    do
    {
      return false;
      if (super.isRecord(paramObject))
        return bool;
    }
    while ((paramObject instanceof Collection));
    if (getSchema(paramObject.getClass()).getType() == Schema.Type.RECORD);
    while (true)
    {
      return bool;
      bool = false;
    }
  }

  public void setField(Object paramObject1, String paramString, int paramInt, Object paramObject2)
  {
    if ((paramObject1 instanceof IndexedRecord))
    {
      super.setField(paramObject1, paramString, paramInt, paramObject2);
      return;
    }
    try
    {
      getField(paramObject1.getClass(), paramString).set(paramObject1, paramObject2);
      return;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new AvroRuntimeException(localIllegalAccessException);
    }
  }

  public boolean validate(Schema paramSchema, Object paramObject)
  {
    switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
      return super.validate(paramSchema, paramObject);
    case 1:
    }
    if (!paramObject.getClass().isArray())
      return super.validate(paramSchema, paramObject);
    int i = Array.getLength(paramObject);
    for (int j = 0; j < i; j++)
      if (!validate(paramSchema.getElementType(), Array.get(paramObject, j)))
        return false;
    return true;
  }

  public static class AllowNull extends ReflectData
  {
    private static final AllowNull INSTANCE = new AllowNull();

    public static AllowNull get()
    {
      return INSTANCE;
    }

    protected Schema createFieldSchema(Field paramField, Map<String, Schema> paramMap)
    {
      return makeNullable(super.createFieldSchema(paramField, paramMap));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.reflect.ReflectData
 * JD-Core Version:    0.6.2
 */