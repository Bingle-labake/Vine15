package com.googlecode.javacpp;

import com.googlecode.javacpp.annotation.Platform;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URL;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.MissingResourceException;
import java.util.Set;
import java.util.WeakHashMap;

public class Loader
{
  static boolean loadLibraries;
  static Map<java.lang.String, java.lang.String> loadedLibraries;
  static WeakHashMap<Class<? extends Pointer>, HashMap<java.lang.String, Integer>> memberOffsets;
  private static final java.lang.String platformName;
  private static java.util.Properties platformProperties = null;
  static File tempDir;

  static
  {
    java.lang.String str1 = System.getProperty("java.vm.name").toLowerCase();
    java.lang.String str2 = System.getProperty("os.name").toLowerCase();
    java.lang.String str3 = System.getProperty("os.arch").toLowerCase();
    if ((str1.startsWith("dalvik")) && (str2.startsWith("linux")))
    {
      str2 = "android";
      if ((!str3.equals("i386")) && (!str3.equals("i486")) && (!str3.equals("i586")) && (!str3.equals("i686")))
        break label209;
      str3 = "x86";
    }
    while (true)
    {
      platformName = str2 + "-" + str3;
      tempDir = null;
      loadLibraries = true;
      loadedLibraries = Collections.synchronizedMap(new HashMap());
      if (getPlatformName().startsWith("windows"))
        Runtime.getRuntime().addShutdownHook(new Thread()
        {
          public void run()
          {
            if (Loader.tempDir == null)
              return;
            try
            {
              LinkedList localLinkedList = new LinkedList();
              localLinkedList.add(System.getProperty("java.home") + "/bin/java");
              localLinkedList.add("-classpath");
              localLinkedList.add(System.getProperty("java.class.path"));
              localLinkedList.add(Loader.class.getName());
              localLinkedList.add(Loader.tempDir.getAbsolutePath());
              new ProcessBuilder(localLinkedList).start();
              return;
            }
            catch (IOException localIOException)
            {
              throw new RuntimeException(localIOException);
            }
          }
        });
      memberOffsets = new WeakHashMap();
      return;
      if (str2.startsWith("mac os x"))
      {
        str2 = "macosx";
        break;
      }
      int i = str2.indexOf(' ');
      if (i <= 0)
        break;
      str2 = str2.substring(0, i);
      break;
      label209: if ((str3.equals("amd64")) || (str3.equals("x86-64")) || (str3.equals("x64")))
        str3 = "x86_64";
      else if (str3.startsWith("arm"))
        str3 = "arm";
    }
  }

  public static File extractResource(Class paramClass, java.lang.String paramString1, File paramFile, java.lang.String paramString2, java.lang.String paramString3)
    throws IOException
  {
    return extractResource(paramClass.getResource(paramString1), paramFile, paramString2, paramString3);
  }

  public static File extractResource(java.lang.String paramString1, File paramFile, java.lang.String paramString2, java.lang.String paramString3)
    throws IOException
  {
    return extractResource(getCallerClass(2), paramString1, paramFile, paramString2, paramString3);
  }

  // ERROR //
  public static File extractResource(URL paramURL, File paramFile, java.lang.String paramString1, java.lang.String paramString2)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: ifnull +16 -> 17
    //   4: aload_0
    //   5: invokevirtual 167	java/net/URL:openStream	()Ljava/io/InputStream;
    //   8: astore 4
    //   10: aload 4
    //   12: ifnonnull +11 -> 23
    //   15: aconst_null
    //   16: areturn
    //   17: aconst_null
    //   18: astore 4
    //   20: goto -10 -> 10
    //   23: aconst_null
    //   24: astore 5
    //   26: iconst_0
    //   27: istore 6
    //   29: aload_2
    //   30: ifnonnull +130 -> 160
    //   33: aload_3
    //   34: ifnonnull +126 -> 160
    //   37: aload_1
    //   38: ifnonnull +16 -> 54
    //   41: new 169	java/io/File
    //   44: dup
    //   45: ldc 171
    //   47: invokestatic 30	java/lang/System:getProperty	(Ljava/lang/String;)Ljava/lang/String;
    //   50: invokespecial 174	java/io/File:<init>	(Ljava/lang/String;)V
    //   53: astore_1
    //   54: new 169	java/io/File
    //   57: dup
    //   58: aload_1
    //   59: new 169	java/io/File
    //   62: dup
    //   63: aload_0
    //   64: invokevirtual 177	java/net/URL:getPath	()Ljava/lang/String;
    //   67: invokespecial 174	java/io/File:<init>	(Ljava/lang/String;)V
    //   70: invokevirtual 180	java/io/File:getName	()Ljava/lang/String;
    //   73: invokespecial 183	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   76: astore 12
    //   78: aload 12
    //   80: invokevirtual 187	java/io/File:exists	()Z
    //   83: istore 13
    //   85: iload 13
    //   87: istore 6
    //   89: aload 12
    //   91: astore 5
    //   93: new 189	java/io/FileOutputStream
    //   96: dup
    //   97: aload 5
    //   99: invokespecial 192	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   102: astore 7
    //   104: sipush 1024
    //   107: newarray byte
    //   109: astore 10
    //   111: aload 4
    //   113: aload 10
    //   115: invokevirtual 198	java/io/InputStream:read	([B)I
    //   118: istore 11
    //   120: iload 11
    //   122: iconst_m1
    //   123: if_icmpeq +51 -> 174
    //   126: aload 7
    //   128: aload 10
    //   130: iconst_0
    //   131: iload 11
    //   133: invokevirtual 202	java/io/FileOutputStream:write	([BII)V
    //   136: goto -25 -> 111
    //   139: astore 8
    //   141: aload 5
    //   143: ifnull +14 -> 157
    //   146: iload 6
    //   148: ifne +9 -> 157
    //   151: aload 5
    //   153: invokevirtual 205	java/io/File:delete	()Z
    //   156: pop
    //   157: aload 8
    //   159: athrow
    //   160: aload_2
    //   161: aload_3
    //   162: aload_1
    //   163: invokestatic 209	java/io/File:createTempFile	(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    //   166: astore 5
    //   168: iconst_0
    //   169: istore 6
    //   171: goto -78 -> 93
    //   174: aload 4
    //   176: invokevirtual 212	java/io/InputStream:close	()V
    //   179: aload 7
    //   181: invokevirtual 213	java/io/FileOutputStream:close	()V
    //   184: aload 5
    //   186: areturn
    //   187: astore 8
    //   189: aload 12
    //   191: astore 5
    //   193: iconst_0
    //   194: istore 6
    //   196: goto -55 -> 141
    //
    // Exception table:
    //   from	to	target	type
    //   41	54	139	java/io/IOException
    //   54	78	139	java/io/IOException
    //   93	111	139	java/io/IOException
    //   111	120	139	java/io/IOException
    //   126	136	139	java/io/IOException
    //   160	168	139	java/io/IOException
    //   174	184	139	java/io/IOException
    //   78	85	187	java/io/IOException
  }

  public static URL[] findLibrary(Class paramClass, ClassProperties paramClassProperties, java.lang.String paramString)
  {
    java.lang.String[] arrayOfString1 = paramString.split("@");
    java.lang.String str1 = arrayOfString1[0];
    java.lang.String str2;
    if (arrayOfString1.length > 1)
      str2 = arrayOfString1[(-1 + arrayOfString1.length)];
    while (true)
    {
      java.lang.String str3 = (java.lang.String)loadedLibraries.get(paramString);
      if (str3 != null)
        try
        {
          URL[] arrayOfURL2 = new URL[1];
          File localFile2 = new File(str3);
          arrayOfURL2[0] = localFile2.toURI().toURL();
          return arrayOfURL2;
          str2 = "";
        }
        catch (IOException localIOException2)
        {
          return new URL[0];
        }
    }
    java.lang.String str4 = paramClassProperties.getProperty("platform.name") + '/';
    java.lang.String str5 = paramClassProperties.getProperty("library.prefix", "") + str1;
    java.lang.String str6 = paramClassProperties.getProperty("library.suffix", "");
    java.lang.String[] arrayOfString2 = new java.lang.String[3];
    arrayOfString2[0] = (str5 + str6 + str2);
    arrayOfString2[1] = (str5 + str2 + str6);
    arrayOfString2[2] = (str5 + str6);
    LinkedList localLinkedList = new LinkedList();
    localLinkedList.addAll(paramClassProperties.get("loader.preloadpath"));
    localLinkedList.addAll(paramClassProperties.get("compiler.linkpath"));
    URL[] arrayOfURL1 = new URL[arrayOfString2.length * (1 + localLinkedList.size())];
    int i = 0;
    int j = 0;
    int i1;
    if ((paramClass != null) && (i < arrayOfString2.length))
    {
      URL localURL = paramClass.getResource(str4 + arrayOfString2[i]);
      if (localURL == null)
        break label500;
      i1 = j + 1;
      arrayOfURL1[j] = localURL;
    }
    while (true)
    {
      i++;
      j = i1;
      break;
      int k = 0;
      int m = j;
      while ((localLinkedList.size() > 0) && (k < arrayOfString2.length))
      {
        Iterator localIterator = localLinkedList.iterator();
        while (localIterator.hasNext())
        {
          File localFile1 = new File((java.lang.String)localIterator.next(), arrayOfString2[k]);
          if (localFile1.exists())
          {
            int n = m + 1;
            try
            {
              arrayOfURL1[m] = localFile1.toURI().toURL();
              m = n;
            }
            catch (IOException localIOException1)
            {
              RuntimeException localRuntimeException = new RuntimeException(localIOException1);
              throw localRuntimeException;
            }
          }
        }
        k++;
      }
      return (URL[])Arrays.copyOf(arrayOfURL1, m);
      label500: i1 = j;
    }
  }

  public static Class getCallerClass(int paramInt)
  {
    Class[] arrayOfClass = new SecurityManager()
    {
      public Class[] getClassContext()
      {
        return super.getClassContext();
      }
    }
    .getClassContext();
    if (arrayOfClass != null)
      for (int j = 0; j < arrayOfClass.length; j++)
        if (arrayOfClass[j] == Loader.class)
          return arrayOfClass[(paramInt + j)];
    try
    {
      StackTraceElement[] arrayOfStackTraceElement = Thread.currentThread().getStackTrace();
      for (int i = 0; i < arrayOfStackTraceElement.length; i++)
        if (Class.forName(arrayOfStackTraceElement[i].getClassName()) == Loader.class)
        {
          Class localClass = Class.forName(arrayOfStackTraceElement[(paramInt + i)].getClassName());
          return localClass;
        }
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
    }
    return null;
  }

  public static Class getEnclosingClass(Class paramClass)
  {
    for (Class localClass = paramClass; ; localClass = localClass.getDeclaringClass())
    {
      if ((localClass.getDeclaringClass() == null) || (localClass.isAnnotationPresent(com.googlecode.javacpp.annotation.Properties.class)));
      Platform localPlatform;
      do
      {
        return localClass;
        if (!localClass.isAnnotationPresent(Platform.class))
          break;
        localPlatform = (Platform)localClass.getAnnotation(Platform.class);
      }
      while ((localPlatform.define().length > 0) || (localPlatform.include().length > 0) || (localPlatform.cinclude().length > 0) || (localPlatform.includepath().length > 0) || (localPlatform.options().length > 0) || (localPlatform.linkpath().length > 0) || (localPlatform.link().length > 0) || (localPlatform.framework().length > 0) || (localPlatform.preloadpath().length > 0) || (localPlatform.preload().length > 0) || (localPlatform.library().length() > 0));
    }
  }

  public static java.lang.String getPlatformName()
  {
    return System.getProperty("com.googlecode.javacpp.platform.name", platformName);
  }

  public static File getTempDir()
  {
    File localFile1;
    if (tempDir == null)
      localFile1 = new File(System.getProperty("java.io.tmpdir"));
    for (int i = 0; ; i++)
      if (i < 1000)
      {
        File localFile2 = new File(localFile1, "javacpp" + System.nanoTime());
        if (localFile2.mkdir())
        {
          tempDir = localFile2;
          tempDir.deleteOnExit();
        }
      }
      else
      {
        return tempDir;
      }
  }

  public static boolean isLoadLibraries()
  {
    return loadLibraries;
  }

  public static java.lang.String load()
  {
    return load(getCallerClass(2));
  }

  public static java.lang.String load(Class paramClass)
  {
    if ((!loadLibraries) || (paramClass == null))
      return null;
    Class localClass1 = getEnclosingClass(paramClass);
    Class localClass2;
    ClassProperties localClassProperties;
    Object localObject;
    try
    {
      localClass2 = Class.forName(localClass1.getName(), true, localClass1.getClassLoader());
      localClassProperties = loadProperties(localClass2, loadProperties(), true);
      LinkedList localLinkedList = new LinkedList();
      localLinkedList.addAll(localClassProperties.get("loader.preload"));
      localLinkedList.addAll(localClassProperties.get("compiler.link"));
      localObject = null;
      Iterator localIterator = localLinkedList.iterator();
      while (localIterator.hasNext())
      {
        java.lang.String str3 = (java.lang.String)localIterator.next();
        try
        {
          loadLibrary(findLibrary(localClass2, localClassProperties, str3), str3);
        }
        catch (UnsatisfiedLinkError localUnsatisfiedLinkError2)
        {
          localObject = localUnsatisfiedLinkError2;
        }
      }
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      NoClassDefFoundError localNoClassDefFoundError = new NoClassDefFoundError(localClassNotFoundException.toString());
      localNoClassDefFoundError.initCause(localClassNotFoundException);
      throw localNoClassDefFoundError;
    }
    try
    {
      java.lang.String str1 = localClassProperties.getProperty("loader.library");
      java.lang.String str2 = loadLibrary(findLibrary(localClass2, localClassProperties, str1), str1);
      return str2;
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError1)
    {
      if (localObject != null)
        localUnsatisfiedLinkError1.initCause(localObject);
      throw localUnsatisfiedLinkError1;
    }
  }

  // ERROR //
  public static java.lang.String loadLibrary(URL[] paramArrayOfURL, java.lang.String paramString)
  {
    // Byte code:
    //   0: getstatic 84	com/googlecode/javacpp/Loader:loadLibraries	Z
    //   3: istore_2
    //   4: aconst_null
    //   5: astore_3
    //   6: iload_2
    //   7: ifne +5 -> 12
    //   10: aload_3
    //   11: areturn
    //   12: getstatic 95	com/googlecode/javacpp/Loader:loadedLibraries	Ljava/util/Map;
    //   15: aload_1
    //   16: invokeinterface 227 2 0
    //   21: checkcast 32	java/lang/String
    //   24: astore_3
    //   25: aload_3
    //   26: ifnonnull -16 -> 10
    //   29: aconst_null
    //   30: astore 4
    //   32: aconst_null
    //   33: astore 5
    //   35: aload_0
    //   36: arraylength
    //   37: istore 15
    //   39: iconst_0
    //   40: istore 16
    //   42: iload 16
    //   44: iload 15
    //   46: if_icmpge +139 -> 185
    //   49: aload_0
    //   50: iload 16
    //   52: aaload
    //   53: astore 17
    //   55: new 169	java/io/File
    //   58: dup
    //   59: aload 17
    //   61: invokevirtual 454	java/net/URL:toURI	()Ljava/net/URI;
    //   64: invokespecial 457	java/io/File:<init>	(Ljava/net/URI;)V
    //   67: astore 18
    //   69: aload 18
    //   71: ifnull +263 -> 334
    //   74: aload 18
    //   76: invokevirtual 187	java/io/File:exists	()Z
    //   79: ifeq +255 -> 334
    //   82: aload 18
    //   84: invokevirtual 460	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   87: astore 19
    //   89: aload 19
    //   91: astore_3
    //   92: getstatic 95	com/googlecode/javacpp/Loader:loadedLibraries	Ljava/util/Map;
    //   95: aload_1
    //   96: aload_3
    //   97: invokeinterface 464 3 0
    //   102: pop
    //   103: aload_3
    //   104: invokestatic 466	java/lang/System:load	(Ljava/lang/String;)V
    //   107: aload 4
    //   109: ifnull -99 -> 10
    //   112: aload 4
    //   114: invokevirtual 187	java/io/File:exists	()Z
    //   117: ifeq -107 -> 10
    //   120: aload 4
    //   122: invokevirtual 404	java/io/File:deleteOnExit	()V
    //   125: aload_3
    //   126: areturn
    //   127: astore 23
    //   129: aload 4
    //   131: ifnull +16 -> 147
    //   134: aload 4
    //   136: invokevirtual 187	java/io/File:exists	()Z
    //   139: ifeq +8 -> 147
    //   142: aload 4
    //   144: invokevirtual 404	java/io/File:deleteOnExit	()V
    //   147: aload 17
    //   149: invokestatic 468	com/googlecode/javacpp/Loader:getTempDir	()Ljava/io/File;
    //   152: aconst_null
    //   153: aconst_null
    //   154: invokestatic 154	com/googlecode/javacpp/Loader:extractResource	(Ljava/net/URL;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    //   157: astore 4
    //   159: aload 4
    //   161: astore 18
    //   163: goto -94 -> 69
    //   166: astore 20
    //   168: aload 20
    //   170: astore 5
    //   172: getstatic 95	com/googlecode/javacpp/Loader:loadedLibraries	Ljava/util/Map;
    //   175: aload_1
    //   176: invokeinterface 471 2 0
    //   181: pop
    //   182: goto +152 -> 334
    //   185: aload_1
    //   186: ldc 217
    //   188: invokevirtual 221	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   191: iconst_0
    //   192: aaload
    //   193: astore 24
    //   195: getstatic 95	com/googlecode/javacpp/Loader:loadedLibraries	Ljava/util/Map;
    //   198: aload_1
    //   199: aload 24
    //   201: invokeinterface 464 3 0
    //   206: pop
    //   207: aload 24
    //   209: invokestatic 473	java/lang/System:loadLibrary	(Ljava/lang/String;)V
    //   212: aload 4
    //   214: ifnull +16 -> 230
    //   217: aload 4
    //   219: invokevirtual 187	java/io/File:exists	()Z
    //   222: ifeq +8 -> 230
    //   225: aload 4
    //   227: invokevirtual 404	java/io/File:deleteOnExit	()V
    //   230: aload 24
    //   232: areturn
    //   233: astore 12
    //   235: getstatic 95	com/googlecode/javacpp/Loader:loadedLibraries	Ljava/util/Map;
    //   238: aload_1
    //   239: invokeinterface 471 2 0
    //   244: pop
    //   245: aload 5
    //   247: ifnull +11 -> 258
    //   250: aload 12
    //   252: aload 5
    //   254: invokevirtual 451	java/lang/UnsatisfiedLinkError:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   257: pop
    //   258: aload 12
    //   260: athrow
    //   261: astore 11
    //   263: aload 4
    //   265: ifnull +16 -> 281
    //   268: aload 4
    //   270: invokevirtual 187	java/io/File:exists	()Z
    //   273: ifeq +8 -> 281
    //   276: aload 4
    //   278: invokevirtual 404	java/io/File:deleteOnExit	()V
    //   281: aload 11
    //   283: athrow
    //   284: astore 6
    //   286: getstatic 95	com/googlecode/javacpp/Loader:loadedLibraries	Ljava/util/Map;
    //   289: aload_1
    //   290: invokeinterface 471 2 0
    //   295: pop
    //   296: aload 5
    //   298: ifnull +11 -> 309
    //   301: aload 6
    //   303: aload 5
    //   305: invokevirtual 474	java/io/IOException:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   308: pop
    //   309: new 411	java/lang/UnsatisfiedLinkError
    //   312: dup
    //   313: aload 6
    //   315: invokevirtual 475	java/io/IOException:toString	()Ljava/lang/String;
    //   318: invokespecial 476	java/lang/UnsatisfiedLinkError:<init>	(Ljava/lang/String;)V
    //   321: astore 9
    //   323: aload 9
    //   325: aload 6
    //   327: invokevirtual 448	java/lang/Error:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   330: pop
    //   331: aload 9
    //   333: athrow
    //   334: iinc 16 1
    //   337: goto -295 -> 42
    //
    // Exception table:
    //   from	to	target	type
    //   55	69	127	java/lang/Exception
    //   92	107	166	java/lang/UnsatisfiedLinkError
    //   35	39	233	java/lang/UnsatisfiedLinkError
    //   49	55	233	java/lang/UnsatisfiedLinkError
    //   55	69	233	java/lang/UnsatisfiedLinkError
    //   74	89	233	java/lang/UnsatisfiedLinkError
    //   134	147	233	java/lang/UnsatisfiedLinkError
    //   147	159	233	java/lang/UnsatisfiedLinkError
    //   172	182	233	java/lang/UnsatisfiedLinkError
    //   185	212	233	java/lang/UnsatisfiedLinkError
    //   35	39	261	finally
    //   49	55	261	finally
    //   55	69	261	finally
    //   74	89	261	finally
    //   92	107	261	finally
    //   134	147	261	finally
    //   147	159	261	finally
    //   172	182	261	finally
    //   185	212	261	finally
    //   235	245	261	finally
    //   250	258	261	finally
    //   258	261	261	finally
    //   286	296	261	finally
    //   301	309	261	finally
    //   309	334	261	finally
    //   35	39	284	java/io/IOException
    //   49	55	284	java/io/IOException
    //   55	69	284	java/io/IOException
    //   74	89	284	java/io/IOException
    //   92	107	284	java/io/IOException
    //   134	147	284	java/io/IOException
    //   147	159	284	java/io/IOException
    //   172	182	284	java/io/IOException
    //   185	212	284	java/io/IOException
  }

  public static ClassProperties loadProperties(Class paramClass, java.util.Properties paramProperties, boolean paramBoolean)
  {
    ClassProperties localClassProperties = new ClassProperties(paramProperties);
    localClassProperties.load(paramClass, paramBoolean);
    return localClassProperties;
  }

  public static ClassProperties loadProperties(Class[] paramArrayOfClass, java.util.Properties paramProperties, boolean paramBoolean)
  {
    ClassProperties localClassProperties = new ClassProperties(paramProperties);
    int i = paramArrayOfClass.length;
    for (int j = 0; j < i; j++)
      localClassProperties.load(paramArrayOfClass[j], paramBoolean);
    return localClassProperties;
  }

  public static java.util.Properties loadProperties()
  {
    java.lang.String str = getPlatformName();
    if ((platformProperties != null) && (str.equals(platformProperties.getProperty("platform.name"))))
      return platformProperties;
    java.util.Properties localProperties = loadProperties(str);
    platformProperties = localProperties;
    return localProperties;
  }

  public static java.util.Properties loadProperties(java.lang.String paramString)
  {
    java.util.Properties localProperties = new java.util.Properties();
    localProperties.put("platform.name", paramString);
    InputStream localInputStream1 = Loader.class.getResourceAsStream("properties/" + paramString + ".properties");
    try
    {
      localProperties.load(new InputStreamReader(localInputStream1));
      return localProperties;
    }
    catch (NoSuchMethodError localNoSuchMethodError2)
    {
      localProperties.load(localInputStream1);
      return localProperties;
    }
    catch (Exception localException1)
    {
      InputStream localInputStream2 = Loader.class.getResourceAsStream("properties/generic.properties");
      try
      {
        localProperties.load(new InputStreamReader(localInputStream2));
        return localProperties;
      }
      catch (NoSuchMethodError localNoSuchMethodError1)
      {
        localProperties.load(localInputStream2);
        return localProperties;
      }
      catch (Exception localException2)
      {
        throw new MissingResourceException("Could not even get generic properties: " + localException2.getMessage(), Loader.class.getName(), "properties/generic.properties");
      }
    }
  }

  public static void main(java.lang.String[] paramArrayOfString)
  {
    File localFile1 = new File(System.getProperty("java.io.tmpdir"));
    File localFile2 = new File(paramArrayOfString[0]);
    if ((!localFile1.equals(localFile2.getParentFile())) || (!localFile2.getName().startsWith("javacpp")))
      return;
    for (File localFile3 : localFile2.listFiles())
      while ((localFile3.exists()) && (!localFile3.delete()))
        try
        {
          Thread.sleep(100L);
        }
        catch (InterruptedException localInterruptedException)
        {
        }
    localFile2.delete();
  }

  public static int offsetof(Class<? extends Pointer> paramClass, java.lang.String paramString)
  {
    return ((Integer)((HashMap)memberOffsets.get(paramClass)).get(paramString)).intValue();
  }

  static void putMemberOffset(Class<? extends Pointer> paramClass, java.lang.String paramString, int paramInt)
  {
    try
    {
      HashMap localHashMap = (HashMap)memberOffsets.get(paramClass);
      if (localHashMap == null)
      {
        WeakHashMap localWeakHashMap = memberOffsets;
        localHashMap = new HashMap();
        localWeakHashMap.put(paramClass, localHashMap);
      }
      localHashMap.put(paramString, Integer.valueOf(paramInt));
      return;
    }
    finally
    {
    }
  }

  static void putMemberOffset(java.lang.String paramString1, java.lang.String paramString2, int paramInt)
    throws ClassNotFoundException
  {
    putMemberOffset(Class.forName(paramString1.replace('/', '.'), false, Loader.class.getClassLoader()).asSubclass(Pointer.class), paramString2, paramInt);
  }

  public static int sizeof(Class<? extends Pointer> paramClass)
  {
    return ((Integer)((HashMap)memberOffsets.get(paramClass)).get("sizeof")).intValue();
  }

  public static class ClassProperties extends HashMap<java.lang.String, LinkedList<java.lang.String>>
  {
    java.lang.String pathSeparator;
    java.lang.String platformName;
    java.lang.String platformRoot;

    public ClassProperties()
    {
    }

    public ClassProperties(java.util.Properties paramProperties)
    {
      this.platformName = paramProperties.getProperty("platform.name");
      this.platformRoot = paramProperties.getProperty("platform.root");
      this.pathSeparator = paramProperties.getProperty("path.separator");
      if ((this.platformRoot == null) || (this.platformRoot.length() == 0))
        this.platformRoot = ".";
      if (!this.platformRoot.endsWith(File.separator))
        this.platformRoot += File.separator;
      Iterator localIterator = paramProperties.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        java.lang.String str1 = (java.lang.String)localEntry.getKey();
        java.lang.String str2 = (java.lang.String)localEntry.getValue();
        if ((str2 != null) && (str2.length() != 0))
          if ((str1.equals("compiler.includepath")) || (str1.equals("compiler.include")) || (str1.equals("compiler.linkpath")) || (str1.equals("compiler.link")) || (str1.equals("compiler.framework")))
            addAll(str1, str2.split(this.pathSeparator));
          else
            setProperty(str1, str2);
      }
    }

    public void addAll(java.lang.String paramString, Collection<java.lang.String> paramCollection)
    {
      if (paramCollection != null)
      {
        java.lang.String str1;
        if ((!paramString.equals("compiler.path")) && (!paramString.equals("compiler.sysroot")) && (!paramString.equals("compiler.includepath")))
        {
          boolean bool = paramString.equals("compiler.linkpath");
          str1 = null;
          if (!bool);
        }
        else
        {
          str1 = this.platformRoot;
        }
        LinkedList localLinkedList = get(paramString);
        Iterator localIterator = paramCollection.iterator();
        while (localIterator.hasNext())
        {
          java.lang.String str2 = (java.lang.String)localIterator.next();
          if ((str2 != null) && (!localLinkedList.contains(str2)))
          {
            if ((str1 != null) && (!new File(str2).isAbsolute()) && (new File(str1 + str2).exists()))
              str2 = str1 + str2;
            localLinkedList.add(str2);
          }
        }
      }
    }

    public void addAll(java.lang.String paramString, java.lang.String[] paramArrayOfString)
    {
      if (paramArrayOfString != null)
        addAll(paramString, Arrays.asList(paramArrayOfString));
    }

    public LinkedList<java.lang.String> get(java.lang.String paramString)
    {
      LinkedList localLinkedList = (LinkedList)super.get(paramString);
      if (localLinkedList == null)
      {
        localLinkedList = new LinkedList();
        put(paramString, localLinkedList);
      }
      return localLinkedList;
    }

    LinkedList<File> getHeaderFiles()
    {
      LinkedList localLinkedList1 = get("compiler.includepath");
      LinkedList localLinkedList2 = new LinkedList();
      localLinkedList2.addAll(get("generator.include"));
      localLinkedList2.addAll(get("generator.cinclude"));
      LinkedList localLinkedList3 = new LinkedList();
      Iterator localIterator1 = localLinkedList2.iterator();
      while (true)
      {
        label52: if (!localIterator1.hasNext())
          break label195;
        java.lang.String str = (java.lang.String)localIterator1.next();
        if ((str.startsWith("<")) && (str.endsWith(">")))
          str = str.substring(1, -1 + str.length());
        File localFile1;
        do
        {
          Iterator localIterator2 = localLinkedList1.iterator();
          if (!localIterator2.hasNext())
            break label52;
          File localFile2 = new File((java.lang.String)localIterator2.next(), str);
          if (!localFile2.exists())
            break;
          localLinkedList3.add(localFile2);
          break label52;
          localFile1 = new File(str);
        }
        while (!localFile1.exists());
        localLinkedList3.add(localFile1);
      }
      label195: return localLinkedList3;
    }

    public java.lang.String getProperty(java.lang.String paramString)
    {
      return getProperty(paramString, null);
    }

    public java.lang.String getProperty(java.lang.String paramString1, java.lang.String paramString2)
    {
      LinkedList localLinkedList = get(paramString1);
      if (localLinkedList.isEmpty())
        return paramString2;
      return (java.lang.String)localLinkedList.get(0);
    }

    public void load(Class paramClass, boolean paramBoolean)
    {
      for (Class localClass = Loader.getEnclosingClass(paramClass); (!localClass.isAnnotationPresent(com.googlecode.javacpp.annotation.Properties.class)) && (!localClass.isAnnotationPresent(Platform.class)) && (localClass.getSuperclass() != null); localClass = localClass.getSuperclass());
      com.googlecode.javacpp.annotation.Properties localProperties = (com.googlecode.javacpp.annotation.Properties)localClass.getAnnotation(com.googlecode.javacpp.annotation.Properties.class);
      Platform[] arrayOfPlatform1;
      java.lang.String[] arrayOfString1;
      java.lang.String[] arrayOfString2;
      java.lang.String[] arrayOfString3;
      java.lang.String[] arrayOfString4;
      java.lang.String[] arrayOfString5;
      java.lang.String[] arrayOfString6;
      java.lang.String[] arrayOfString7;
      java.lang.String[] arrayOfString8;
      java.lang.String[] arrayOfString9;
      java.lang.String[] arrayOfString10;
      java.lang.String str2;
      Platform[] arrayOfPlatform2;
      int i;
      if (localProperties == null)
      {
        Platform localPlatform2 = (Platform)localClass.getAnnotation(Platform.class);
        if (localPlatform2 == null)
          return;
        arrayOfPlatform1 = new Platform[1];
        arrayOfPlatform1[0] = localPlatform2;
        arrayOfString1 = new java.lang.String[0];
        arrayOfString2 = new java.lang.String[0];
        arrayOfString3 = new java.lang.String[0];
        arrayOfString4 = new java.lang.String[0];
        arrayOfString5 = new java.lang.String[0];
        arrayOfString6 = new java.lang.String[0];
        arrayOfString7 = new java.lang.String[0];
        arrayOfString8 = new java.lang.String[0];
        arrayOfString9 = new java.lang.String[0];
        arrayOfString10 = new java.lang.String[0];
        str2 = "jni" + localClass.getSimpleName();
        arrayOfPlatform2 = arrayOfPlatform1;
        i = arrayOfPlatform2.length;
      }
      for (int j = 0; ; j++)
      {
        if (j >= i)
          break label660;
        Platform localPlatform1 = arrayOfPlatform2[j];
        java.lang.String[][] arrayOfString; = new java.lang.String[2][];
        arrayOfString;[0] = localPlatform1.value();
        arrayOfString;[1] = localPlatform1.not();
        boolean[] arrayOfBoolean = { 0, 0 };
        int k = 0;
        label239: if (k < arrayOfString;.length)
        {
          [Ljava.lang.String localString; = arrayOfString;[k];
          int m = localString;.length;
          for (int n = 0; ; n++)
            if (n < m)
            {
              java.lang.String str3 = localString;[n];
              if (this.platformName.startsWith(str3))
                arrayOfBoolean[k] = true;
            }
            else
            {
              k++;
              break label239;
              Class[] arrayOfClass = localProperties.inherit();
              if ((paramBoolean) && (arrayOfClass != null))
              {
                int i1 = arrayOfClass.length;
                for (int i2 = 0; i2 < i1; i2++)
                  load(arrayOfClass[i2], paramBoolean);
              }
              java.lang.String str1 = localProperties.target();
              if (str1.length() > 0)
                addAll("parser.target", new java.lang.String[] { str1 });
              arrayOfPlatform1 = localProperties.value();
              if (arrayOfPlatform1 != null)
                break;
              return;
            }
        }
        if (((arrayOfString;[0].length == 0) || (arrayOfBoolean[0] != 0)) && ((arrayOfString;[1].length == 0) || (arrayOfBoolean[1] == 0)))
        {
          if (localPlatform1.define().length > 0)
            arrayOfString1 = localPlatform1.define();
          if (localPlatform1.include().length > 0)
            arrayOfString2 = localPlatform1.include();
          if (localPlatform1.cinclude().length > 0)
            arrayOfString3 = localPlatform1.cinclude();
          if (localPlatform1.includepath().length > 0)
            arrayOfString4 = localPlatform1.includepath();
          if (localPlatform1.options().length > 0)
            arrayOfString5 = localPlatform1.options();
          if (localPlatform1.linkpath().length > 0)
            arrayOfString6 = localPlatform1.linkpath();
          if (localPlatform1.link().length > 0)
            arrayOfString7 = localPlatform1.link();
          if (localPlatform1.framework().length > 0)
            arrayOfString8 = localPlatform1.framework();
          if (localPlatform1.preloadpath().length > 0)
            arrayOfString9 = localPlatform1.preloadpath();
          if (localPlatform1.preload().length > 0)
            arrayOfString10 = localPlatform1.preload();
          if (localPlatform1.library().length() > 0)
            str2 = localPlatform1.library();
        }
      }
      label660: addAll("generator.define", arrayOfString1);
      addAll("generator.include", arrayOfString2);
      addAll("generator.cinclude", arrayOfString3);
      addAll("compiler.includepath", arrayOfString4);
      addAll("compiler.options", arrayOfString5);
      addAll("compiler.linkpath", arrayOfString6);
      addAll("compiler.link", arrayOfString7);
      addAll("compiler.framework", arrayOfString8);
      addAll("loader.preloadpath", arrayOfString9);
      addAll("loader.preload", arrayOfString10);
      setProperty("loader.library", str2);
    }

    public java.lang.String setProperty(java.lang.String paramString1, java.lang.String paramString2)
    {
      LinkedList localLinkedList = get(paramString1);
      if (localLinkedList.isEmpty());
      for (java.lang.String str = null; ; str = (java.lang.String)localLinkedList.get(0))
      {
        localLinkedList.clear();
        addAll(paramString1, new java.lang.String[] { paramString2 });
        return str;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.Loader
 * JD-Core Version:    0.6.2
 */