package com.flurry.org.apache.avro.specific;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.AvroTypeException;
import com.flurry.org.apache.avro.Protocol;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Type;
import com.flurry.org.apache.avro.generic.GenericData;
import com.flurry.org.apache.avro.io.DatumReader;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.nio.ByteBuffer;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

public class SpecificData extends GenericData
{
  private static final Map<Class, Constructor> CTOR_CACHE = new ConcurrentHashMap();
  private static final SpecificData INSTANCE = new SpecificData();
  private static final Class<?>[] NO_ARG = new Class[0];
  private static final Class NO_CLASS = new Object()
  {
  }
  .getClass();
  private static final Schema NULL_SCHEMA = Schema.create(Schema.Type.NULL);
  private static final Class<?>[] SCHEMA_ARG = { Schema.class };
  private Map<String, Class> classCache = new ConcurrentHashMap();
  private final ClassLoader classLoader;
  private final WeakHashMap<Type, Schema> schemaCache = new WeakHashMap();

  protected SpecificData()
  {
    this(SpecificData.class.getClassLoader());
  }

  public SpecificData(ClassLoader paramClassLoader)
  {
    this.classLoader = paramClassLoader;
  }

  public static SpecificData get()
  {
    return INSTANCE;
  }

  public static String getClassName(Schema paramSchema)
  {
    String str1 = paramSchema.getNamespace();
    String str2 = paramSchema.getName();
    if ((str1 == null) || ("".equals(str1)))
      return str2;
    if (str1.endsWith("$"));
    for (String str3 = ""; ; str3 = ".")
      return str1 + str3 + str2;
  }

  public static Object newInstance(Class paramClass, Schema paramSchema)
  {
    boolean bool = SchemaConstructable.class.isAssignableFrom(paramClass);
    try
    {
      Constructor localConstructor = (Constructor)CTOR_CACHE.get(paramClass);
      Class[] arrayOfClass;
      if (localConstructor == null)
      {
        if (bool)
        {
          arrayOfClass = SCHEMA_ARG;
          localConstructor = paramClass.getDeclaredConstructor(arrayOfClass);
          localConstructor.setAccessible(true);
          CTOR_CACHE.put(paramClass, localConstructor);
        }
      }
      else
        if (!bool)
          break label91;
      label91: for (Object[] arrayOfObject = { paramSchema }; ; arrayOfObject = (Object[])null)
      {
        return localConstructor.newInstance(arrayOfObject);
        arrayOfClass = NO_ARG;
        break;
      }
    }
    catch (Exception localException)
    {
      throw new RuntimeException(localException);
    }
  }

  protected int compare(Object paramObject1, Object paramObject2, Schema paramSchema, boolean paramBoolean)
  {
    switch (2.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
    case 3:
    }
    do
      return super.compare(paramObject1, paramObject2, paramSchema, paramBoolean);
    while (!(paramObject1 instanceof Enum));
    return ((Enum)paramObject1).ordinal() - ((Enum)paramObject2).ordinal();
  }

  public DatumReader createDatumReader(Schema paramSchema)
  {
    return new SpecificDatumReader(paramSchema, paramSchema, this);
  }

  public Object createFixed(Object paramObject, Schema paramSchema)
  {
    Class localClass = get().getClass(paramSchema);
    if (localClass == null)
      paramObject = super.createFixed(paramObject, paramSchema);
    while (localClass.isInstance(paramObject))
      return paramObject;
    return newInstance(localClass, paramSchema);
  }

  protected Schema createSchema(Type paramType, Map<String, Schema> paramMap)
  {
    if (((paramType instanceof Class)) && (CharSequence.class.isAssignableFrom((Class)paramType)))
      return Schema.create(Schema.Type.STRING);
    if (paramType == ByteBuffer.class)
      return Schema.create(Schema.Type.BYTES);
    if ((paramType == Integer.class) || (paramType == Integer.TYPE))
      return Schema.create(Schema.Type.INT);
    if ((paramType == Long.class) || (paramType == Long.TYPE))
      return Schema.create(Schema.Type.LONG);
    if ((paramType == Float.class) || (paramType == Float.TYPE))
      return Schema.create(Schema.Type.FLOAT);
    if ((paramType == Double.class) || (paramType == Double.TYPE))
      return Schema.create(Schema.Type.DOUBLE);
    if ((paramType == Boolean.class) || (paramType == Boolean.TYPE))
      return Schema.create(Schema.Type.BOOLEAN);
    if ((paramType == Void.class) || (paramType == Void.TYPE))
      return Schema.create(Schema.Type.NULL);
    if ((paramType instanceof ParameterizedType))
    {
      ParameterizedType localParameterizedType = (ParameterizedType)paramType;
      Class localClass2 = (Class)localParameterizedType.getRawType();
      Type[] arrayOfType = localParameterizedType.getActualTypeArguments();
      if (Collection.class.isAssignableFrom(localClass2))
      {
        if (arrayOfType.length != 1)
          throw new AvroTypeException("No array type specified.");
        return Schema.createArray(createSchema(arrayOfType[0], paramMap));
      }
      if (Map.class.isAssignableFrom(localClass2))
      {
        Type localType1 = arrayOfType[0];
        Type localType2 = arrayOfType[1];
        if ((!(paramType instanceof Class)) || (!CharSequence.class.isAssignableFrom((Class)paramType)))
          throw new AvroTypeException("Map key class not CharSequence: " + localType1);
        return Schema.createMap(createSchema(localType2, paramMap));
      }
      return createSchema(localClass2, paramMap);
    }
    if ((paramType instanceof Class))
    {
      Class localClass1 = (Class)paramType;
      String str = localClass1.getName();
      Object localObject = (Schema)paramMap.get(str);
      if (localObject == null);
      try
      {
        localObject = (Schema)localClass1.getDeclaredField("SCHEMA$").get(null);
        if (!str.equals(getClassName((Schema)localObject)))
        {
          Schema localSchema = Schema.parse(((Schema)localObject).toString().replace(((Schema)localObject).getNamespace(), localClass1.getPackage().getName()));
          localObject = localSchema;
        }
        paramMap.put(str, localObject);
        return localObject;
      }
      catch (NoSuchFieldException localNoSuchFieldException)
      {
        throw new AvroRuntimeException("Not a Specific class: " + localClass1);
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        throw new AvroRuntimeException(localIllegalAccessException);
      }
    }
    throw new AvroTypeException("Unknown type: " + paramType);
  }

  public Class getClass(Schema paramSchema)
  {
    switch (2.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
      throw new AvroRuntimeException("Unknown type: " + paramSchema);
    case 1:
    case 2:
    case 3:
      String str = paramSchema.getFullName();
      if (str == null)
        return null;
      Object localObject = (Class)this.classCache.get(str);
      if (localObject == null);
      try
      {
        Class localClass = this.classLoader.loadClass(getClassName(paramSchema));
        localObject = localClass;
        this.classCache.put(str, localObject);
        if (localObject == NO_CLASS)
          localObject = null;
        return localObject;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        while (true)
          localObject = NO_CLASS;
      }
    case 4:
      return List.class;
    case 5:
      return Map.class;
    case 6:
      List localList = paramSchema.getTypes();
      if ((localList.size() == 2) && (localList.contains(NULL_SCHEMA)))
      {
        if (((Schema)localList.get(0)).equals(NULL_SCHEMA));
        for (int i = 1; ; i = 0)
          return getClass((Schema)localList.get(i));
      }
      return Object.class;
    case 7:
      if ("String".equals(paramSchema.getProp("avro.java.string")))
        return String.class;
      return CharSequence.class;
    case 8:
      return ByteBuffer.class;
    case 9:
      return Integer.TYPE;
    case 10:
      return Long.TYPE;
    case 11:
      return Float.TYPE;
    case 12:
      return Double.TYPE;
    case 13:
      return Boolean.TYPE;
    case 14:
    }
    return Void.TYPE;
  }

  protected Schema getEnumSchema(Object paramObject)
  {
    if ((paramObject instanceof Enum))
      return getSchema(paramObject.getClass());
    return super.getEnumSchema(paramObject);
  }

  public Protocol getProtocol(Class paramClass)
  {
    try
    {
      Object localObject = (Protocol)paramClass.getDeclaredField("PROTOCOL").get(null);
      if (!((Protocol)localObject).getNamespace().equals(paramClass.getPackage().getName()))
      {
        Protocol localProtocol = Protocol.parse(((Protocol)localObject).toString().replace(((Protocol)localObject).getNamespace(), paramClass.getPackage().getName()));
        localObject = localProtocol;
      }
      return localObject;
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      throw new AvroRuntimeException("Not a Specific protocol: " + paramClass);
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new AvroRuntimeException(localIllegalAccessException);
    }
  }

  public Schema getSchema(Type paramType)
  {
    Schema localSchema = (Schema)this.schemaCache.get(paramType);
    if (localSchema == null)
    {
      localSchema = createSchema(paramType, new LinkedHashMap());
      this.schemaCache.put(paramType, localSchema);
    }
    return localSchema;
  }

  protected boolean isEnum(Object paramObject)
  {
    return ((paramObject instanceof Enum)) || (super.isEnum(paramObject));
  }

  public Object newRecord(Object paramObject, Schema paramSchema)
  {
    Class localClass = get().getClass(paramSchema);
    if (localClass == null)
      paramObject = super.newRecord(paramObject, paramSchema);
    while (localClass.isInstance(paramObject))
      return paramObject;
    return newInstance(localClass, paramSchema);
  }

  public static abstract interface SchemaConstructable
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.specific.SpecificData
 * JD-Core Version:    0.6.2
 */