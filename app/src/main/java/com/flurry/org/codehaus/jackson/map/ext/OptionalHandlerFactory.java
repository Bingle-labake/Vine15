package com.flurry.org.codehaus.jackson.map.ext;

import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.DeserializerProvider;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.SerializationConfig;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer;
import com.flurry.org.codehaus.jackson.map.util.Provider;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;

public class OptionalHandlerFactory
{
  private static final String CLASS_NAME_DOM_DOCUMENT = "org.w3c.dom.Node";
  private static final String CLASS_NAME_DOM_NODE = "org.w3c.dom.Node";
  private static final String DESERIALIZERS_FOR_JAVAX_XML = "com.flurry.org.codehaus.jackson.map.ext.CoreXMLDeserializers";
  private static final String DESERIALIZERS_FOR_JODA_DATETIME = "com.flurry.org.codehaus.jackson.map.ext.JodaDeserializers";
  private static final String DESERIALIZER_FOR_DOM_DOCUMENT = "com.flurry.org.codehaus.jackson.map.ext.DOMDeserializer$DocumentDeserializer";
  private static final String DESERIALIZER_FOR_DOM_NODE = "com.flurry.org.codehaus.jackson.map.ext.DOMDeserializer$NodeDeserializer";
  private static final String PACKAGE_PREFIX_JAVAX_XML = "javax.xml.";
  private static final String PACKAGE_PREFIX_JODA_DATETIME = "org.joda.time.";
  private static final String SERIALIZERS_FOR_JAVAX_XML = "com.flurry.org.codehaus.jackson.map.ext.CoreXMLSerializers";
  private static final String SERIALIZERS_FOR_JODA_DATETIME = "com.flurry.org.codehaus.jackson.map.ext.JodaSerializers";
  private static final String SERIALIZER_FOR_DOM_NODE = "com.flurry.org.codehaus.jackson.map.ext.DOMSerializer";
  public static final OptionalHandlerFactory instance = new OptionalHandlerFactory();

  private boolean doesImplement(Class<?> paramClass, String paramString)
  {
    for (Object localObject = paramClass; localObject != null; localObject = ((Class)localObject).getSuperclass())
    {
      if (((Class)localObject).getName().equals(paramString));
      while (hasInterface((Class)localObject, paramString))
        return true;
    }
    return false;
  }

  private boolean hasInterface(Class<?> paramClass, String paramString)
  {
    Class[] arrayOfClass = paramClass.getInterfaces();
    int i = arrayOfClass.length;
    for (int j = 0; j < i; j++)
      if (arrayOfClass[j].getName().equals(paramString))
        return true;
    int k = arrayOfClass.length;
    for (int m = 0; ; m++)
    {
      if (m >= k)
        break label73;
      if (hasInterface(arrayOfClass[m], paramString))
        break;
    }
    label73: return false;
  }

  private boolean hasInterfaceStartingWith(Class<?> paramClass, String paramString)
  {
    Class[] arrayOfClass = paramClass.getInterfaces();
    int i = arrayOfClass.length;
    for (int j = 0; j < i; j++)
      if (arrayOfClass[j].getName().startsWith(paramString))
        return true;
    int k = arrayOfClass.length;
    for (int m = 0; ; m++)
    {
      if (m >= k)
        break label73;
      if (hasInterfaceStartingWith(arrayOfClass[m], paramString))
        break;
    }
    label73: return false;
  }

  private boolean hasSupertypeStartingWith(Class<?> paramClass, String paramString)
  {
    for (Class localClass = paramClass.getSuperclass(); localClass != null; localClass = localClass.getSuperclass())
      if (localClass.getName().startsWith(paramString))
        return true;
    for (Object localObject = paramClass; ; localObject = ((Class)localObject).getSuperclass())
    {
      if (localObject == null)
        break label58;
      if (hasInterfaceStartingWith((Class)localObject, paramString))
        break;
    }
    label58: return false;
  }

  private Object instantiate(String paramString)
  {
    try
    {
      Object localObject = Class.forName(paramString).newInstance();
      return localObject;
    }
    catch (Exception localException)
    {
      return null;
    }
    catch (LinkageError localLinkageError)
    {
      label13: break label13;
    }
  }

  public JsonDeserializer<?> findDeserializer(JavaType paramJavaType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider)
  {
    Class localClass = paramJavaType.getRawClass();
    String str1 = localClass.getName();
    String str2;
    Object localObject;
    if (str1.startsWith("org.joda.time."))
    {
      str2 = "com.flurry.org.codehaus.jackson.map.ext.JodaDeserializers";
      localObject = instantiate(str2);
      if (localObject != null)
        break label112;
    }
    label112: StdDeserializer localStdDeserializer1;
    do
    {
      Iterator localIterator2;
      while (!localIterator2.hasNext())
      {
        do
        {
          return null;
          if ((str1.startsWith("javax.xml.")) || (hasSupertypeStartingWith(localClass, "javax.xml.")))
          {
            str2 = "com.flurry.org.codehaus.jackson.map.ext.CoreXMLDeserializers";
            break;
          }
          if (doesImplement(localClass, "org.w3c.dom.Node"))
            return (JsonDeserializer)instantiate("com.flurry.org.codehaus.jackson.map.ext.DOMDeserializer$DocumentDeserializer");
        }
        while (!doesImplement(localClass, "org.w3c.dom.Node"));
        return (JsonDeserializer)instantiate("com.flurry.org.codehaus.jackson.map.ext.DOMDeserializer$NodeDeserializer");
        Collection localCollection = ((Provider)localObject).provide();
        Iterator localIterator1 = localCollection.iterator();
        while (localIterator1.hasNext())
        {
          StdDeserializer localStdDeserializer2 = (StdDeserializer)localIterator1.next();
          if (localClass == localStdDeserializer2.getValueClass())
            return localStdDeserializer2;
        }
        localIterator2 = localCollection.iterator();
      }
      localStdDeserializer1 = (StdDeserializer)localIterator2.next();
    }
    while (!localStdDeserializer1.getValueClass().isAssignableFrom(localClass));
    return localStdDeserializer1;
  }

  public JsonSerializer<?> findSerializer(SerializationConfig paramSerializationConfig, JavaType paramJavaType)
  {
    Class localClass = paramJavaType.getRawClass();
    String str1 = localClass.getName();
    if (str1.startsWith("org.joda.time."));
    Object localObject;
    for (String str2 = "com.flurry.org.codehaus.jackson.map.ext.JodaSerializers"; ; str2 = "com.flurry.org.codehaus.jackson.map.ext.CoreXMLSerializers")
    {
      localObject = instantiate(str2);
      if (localObject != null)
        break label89;
      return null;
      if ((!str1.startsWith("javax.xml.")) && (!hasSupertypeStartingWith(localClass, "javax.xml.")))
        break;
    }
    if (doesImplement(localClass, "org.w3c.dom.Node"))
      return (JsonSerializer)instantiate("com.flurry.org.codehaus.jackson.map.ext.DOMSerializer");
    return null;
    label89: Collection localCollection = ((Provider)localObject).provide();
    Iterator localIterator1 = localCollection.iterator();
    while (localIterator1.hasNext())
    {
      Map.Entry localEntry2 = (Map.Entry)localIterator1.next();
      if (localClass == localEntry2.getKey())
        return (JsonSerializer)localEntry2.getValue();
    }
    Iterator localIterator2 = localCollection.iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry1 = (Map.Entry)localIterator2.next();
      if (((Class)localEntry1.getKey()).isAssignableFrom(localClass))
        return (JsonSerializer)localEntry1.getValue();
    }
    return null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ext.OptionalHandlerFactory
 * JD-Core Version:    0.6.2
 */