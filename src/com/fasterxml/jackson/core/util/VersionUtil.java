package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.Versioned;
import java.io.PrintStream;
import java.util.regex.Pattern;

public class VersionUtil
{
  public static final String PACKAGE_VERSION_CLASS_NAME = "PackageVersion";

  @Deprecated
  public static final String VERSION_FILE = "VERSION.txt";
  private static final Pattern VERSION_SEPARATOR = Pattern.compile("[-_./;:]");
  private final Version _version;

  protected VersionUtil()
  {
    try
    {
      Version localVersion2 = versionFor(getClass());
      localVersion1 = localVersion2;
      if (localVersion1 == null)
        localVersion1 = Version.unknownVersion();
      this._version = localVersion1;
      return;
    }
    catch (Exception localException)
    {
      while (true)
      {
        System.err.println("ERROR: Failed to load Version information for bundle (via " + getClass().getName() + ").");
        Version localVersion1 = null;
      }
    }
  }

  // ERROR //
  private static Version doReadVersion(java.io.Reader paramReader)
  {
    // Byte code:
    //   0: new 87	java/io/BufferedReader
    //   3: dup
    //   4: aload_0
    //   5: invokespecial 90	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   8: astore_1
    //   9: aload_1
    //   10: invokevirtual 93	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   13: astore 10
    //   15: aload 10
    //   17: astore 6
    //   19: aload 6
    //   21: ifnull +156 -> 177
    //   24: aload_1
    //   25: invokevirtual 93	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   28: astore 16
    //   30: aload 16
    //   32: astore 5
    //   34: aconst_null
    //   35: astore 11
    //   37: aload 5
    //   39: ifnull +13 -> 52
    //   42: aload_1
    //   43: invokevirtual 93	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   46: astore 18
    //   48: aload 18
    //   50: astore 11
    //   52: aload_1
    //   53: invokevirtual 96	java/io/BufferedReader:close	()V
    //   56: aload 11
    //   58: astore 14
    //   60: aload 5
    //   62: astore 8
    //   64: aload 14
    //   66: astore 9
    //   68: aload 8
    //   70: ifnull +10 -> 80
    //   73: aload 8
    //   75: invokevirtual 101	java/lang/String:trim	()Ljava/lang/String;
    //   78: astore 8
    //   80: aload 9
    //   82: ifnull +10 -> 92
    //   85: aload 9
    //   87: invokevirtual 101	java/lang/String:trim	()Ljava/lang/String;
    //   90: astore 9
    //   92: aload 6
    //   94: aload 8
    //   96: aload 9
    //   98: invokestatic 105	com/fasterxml/jackson/core/util/VersionUtil:parseVersion	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/core/Version;
    //   101: areturn
    //   102: astore 12
    //   104: aload 11
    //   106: astore 13
    //   108: aload 5
    //   110: astore 8
    //   112: aload 13
    //   114: astore 9
    //   116: goto -48 -> 68
    //   119: astore 4
    //   121: aconst_null
    //   122: astore 5
    //   124: aconst_null
    //   125: astore 6
    //   127: aload_1
    //   128: invokevirtual 96	java/io/BufferedReader:close	()V
    //   131: aload 5
    //   133: astore 8
    //   135: aconst_null
    //   136: astore 9
    //   138: goto -70 -> 68
    //   141: astore 7
    //   143: aload 5
    //   145: astore 8
    //   147: aconst_null
    //   148: astore 9
    //   150: goto -82 -> 68
    //   153: astore_2
    //   154: aload_1
    //   155: invokevirtual 96	java/io/BufferedReader:close	()V
    //   158: aload_2
    //   159: athrow
    //   160: astore_3
    //   161: goto -3 -> 158
    //   164: astore 15
    //   166: aconst_null
    //   167: astore 5
    //   169: goto -42 -> 127
    //   172: astore 17
    //   174: goto -47 -> 127
    //   177: aconst_null
    //   178: astore 5
    //   180: aconst_null
    //   181: astore 11
    //   183: goto -131 -> 52
    //
    // Exception table:
    //   from	to	target	type
    //   52	56	102	java/io/IOException
    //   9	15	119	java/io/IOException
    //   127	131	141	java/io/IOException
    //   9	15	153	finally
    //   24	30	153	finally
    //   42	48	153	finally
    //   154	158	160	java/io/IOException
    //   24	30	164	java/io/IOException
    //   42	48	172	java/io/IOException
  }

  // ERROR //
  public static Version mavenVersionFor(java.lang.ClassLoader paramClassLoader, String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: new 57	java/lang/StringBuilder
    //   4: dup
    //   5: invokespecial 58	java/lang/StringBuilder:<init>	()V
    //   8: ldc 109
    //   10: invokevirtual 64	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   13: aload_1
    //   14: ldc 111
    //   16: ldc 113
    //   18: invokevirtual 117	java/lang/String:replaceAll	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   21: invokevirtual 64	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   24: ldc 113
    //   26: invokevirtual 64	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   29: aload_2
    //   30: invokevirtual 64	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   33: ldc 119
    //   35: invokevirtual 64	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: invokevirtual 75	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   41: invokevirtual 125	java/lang/ClassLoader:getResourceAsStream	(Ljava/lang/String;)Ljava/io/InputStream;
    //   44: astore_3
    //   45: aload_3
    //   46: ifnull +65 -> 111
    //   49: new 127	java/util/Properties
    //   52: dup
    //   53: invokespecial 128	java/util/Properties:<init>	()V
    //   56: astore 4
    //   58: aload 4
    //   60: aload_3
    //   61: invokevirtual 132	java/util/Properties:load	(Ljava/io/InputStream;)V
    //   64: aload 4
    //   66: ldc 134
    //   68: invokevirtual 138	java/util/Properties:getProperty	(Ljava/lang/String;)Ljava/lang/String;
    //   71: astore 9
    //   73: aload 4
    //   75: ldc 140
    //   77: invokevirtual 138	java/util/Properties:getProperty	(Ljava/lang/String;)Ljava/lang/String;
    //   80: astore 10
    //   82: aload 9
    //   84: aload 4
    //   86: ldc 142
    //   88: invokevirtual 138	java/util/Properties:getProperty	(Ljava/lang/String;)Ljava/lang/String;
    //   91: aload 10
    //   93: invokestatic 105	com/fasterxml/jackson/core/util/VersionUtil:parseVersion	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/core/Version;
    //   96: astore 11
    //   98: aload_3
    //   99: invokevirtual 145	java/io/InputStream:close	()V
    //   102: aload 11
    //   104: areturn
    //   105: astore 7
    //   107: aload_3
    //   108: invokevirtual 145	java/io/InputStream:close	()V
    //   111: invokestatic 47	com/fasterxml/jackson/core/Version:unknownVersion	()Lcom/fasterxml/jackson/core/Version;
    //   114: areturn
    //   115: astore 5
    //   117: aload_3
    //   118: invokevirtual 145	java/io/InputStream:close	()V
    //   121: aload 5
    //   123: athrow
    //   124: astore 12
    //   126: aload 11
    //   128: areturn
    //   129: astore 8
    //   131: goto -20 -> 111
    //   134: astore 6
    //   136: goto -15 -> 121
    //
    // Exception table:
    //   from	to	target	type
    //   49	98	105	java/io/IOException
    //   49	98	115	finally
    //   98	102	124	java/io/IOException
    //   107	111	129	java/io/IOException
    //   117	121	134	java/io/IOException
  }

  public static Version packageVersionFor(Class<?> paramClass)
  {
    try
    {
      Class localClass = Class.forName(paramClass.getPackage().getName() + "." + "PackageVersion", true, paramClass.getClassLoader());
      if (localClass == null)
        return null;
      Object localObject;
      try
      {
        localObject = localClass.newInstance();
        if (!(localObject instanceof Versioned))
          throw new IllegalArgumentException("Bad version class " + localClass.getName() + ": does not implement " + Versioned.class.getName());
      }
      catch (RuntimeException localRuntimeException)
      {
        throw localRuntimeException;
      }
      catch (Exception localException2)
      {
        throw new IllegalArgumentException("Failed to instantiate " + localClass.getName() + " to find version information, problem: " + localException2.getMessage(), localException2);
      }
      return ((Versioned)localObject).version();
    }
    catch (Exception localException1)
    {
    }
    return null;
  }

  @Deprecated
  public static Version parseVersion(String paramString)
  {
    return parseVersion(paramString, null, null);
  }

  public static Version parseVersion(String paramString1, String paramString2, String paramString3)
  {
    if (paramString1 == null);
    String str1;
    do
    {
      return null;
      str1 = paramString1.trim();
    }
    while (str1.length() == 0);
    String[] arrayOfString = VERSION_SEPARATOR.split(str1);
    int i = parseVersionPart(arrayOfString[0]);
    int j;
    if (arrayOfString.length > 1)
    {
      j = parseVersionPart(arrayOfString[1]);
      if (arrayOfString.length <= 2)
        break label112;
    }
    label112: for (int k = parseVersionPart(arrayOfString[2]); ; k = 0)
    {
      int m = arrayOfString.length;
      String str2 = null;
      if (m > 3)
        str2 = arrayOfString[3];
      return new Version(i, j, k, str2, paramString2, paramString3);
      j = 0;
      break;
    }
  }

  protected static int parseVersionPart(String paramString)
  {
    int i = 0;
    String str = paramString.toString();
    int j = str.length();
    int k = 0;
    while (true)
    {
      int m;
      if (i < j)
      {
        m = str.charAt(i);
        if ((m <= 57) && (m >= 48));
      }
      else
      {
        return k;
      }
      k = k * 10 + (m - 48);
      i++;
    }
  }

  public static final void throwInternal()
  {
    throw new RuntimeException("Internal error: this code path should never get executed");
  }

  // ERROR //
  public static Version versionFor(Class<?> paramClass)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokestatic 221	com/fasterxml/jackson/core/util/VersionUtil:packageVersionFor	(Ljava/lang/Class;)Lcom/fasterxml/jackson/core/Version;
    //   4: astore_1
    //   5: aload_1
    //   6: ifnull +5 -> 11
    //   9: aload_1
    //   10: areturn
    //   11: aload_0
    //   12: ldc 11
    //   14: invokevirtual 222	java/lang/Class:getResourceAsStream	(Ljava/lang/String;)Ljava/io/InputStream;
    //   17: astore_2
    //   18: aload_2
    //   19: ifnonnull +7 -> 26
    //   22: invokestatic 47	com/fasterxml/jackson/core/Version:unknownVersion	()Lcom/fasterxml/jackson/core/Version;
    //   25: areturn
    //   26: new 224	java/io/InputStreamReader
    //   29: dup
    //   30: aload_2
    //   31: ldc 226
    //   33: invokespecial 229	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;Ljava/lang/String;)V
    //   36: astore_3
    //   37: aload_3
    //   38: invokestatic 231	com/fasterxml/jackson/core/util/VersionUtil:doReadVersion	(Ljava/io/Reader;)Lcom/fasterxml/jackson/core/Version;
    //   41: astore 11
    //   43: aload_3
    //   44: invokevirtual 232	java/io/InputStreamReader:close	()V
    //   47: aload_2
    //   48: invokevirtual 145	java/io/InputStream:close	()V
    //   51: aload 11
    //   53: areturn
    //   54: astore 13
    //   56: new 148	java/lang/RuntimeException
    //   59: dup
    //   60: aload 13
    //   62: invokespecial 235	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   65: athrow
    //   66: astore 4
    //   68: aload_3
    //   69: invokevirtual 232	java/io/InputStreamReader:close	()V
    //   72: aload 4
    //   74: athrow
    //   75: astore 8
    //   77: invokestatic 47	com/fasterxml/jackson/core/Version:unknownVersion	()Lcom/fasterxml/jackson/core/Version;
    //   80: astore 9
    //   82: aload_2
    //   83: invokevirtual 145	java/io/InputStream:close	()V
    //   86: aload 9
    //   88: areturn
    //   89: astore 10
    //   91: new 148	java/lang/RuntimeException
    //   94: dup
    //   95: aload 10
    //   97: invokespecial 235	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   100: athrow
    //   101: astore 6
    //   103: aload_2
    //   104: invokevirtual 145	java/io/InputStream:close	()V
    //   107: aload 6
    //   109: athrow
    //   110: astore 7
    //   112: new 148	java/lang/RuntimeException
    //   115: dup
    //   116: aload 7
    //   118: invokespecial 235	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   121: athrow
    //   122: astore 12
    //   124: goto -77 -> 47
    //   127: astore 5
    //   129: goto -57 -> 72
    //
    // Exception table:
    //   from	to	target	type
    //   47	51	54	java/io/IOException
    //   37	43	66	finally
    //   26	37	75	java/io/UnsupportedEncodingException
    //   43	47	75	java/io/UnsupportedEncodingException
    //   68	72	75	java/io/UnsupportedEncodingException
    //   72	75	75	java/io/UnsupportedEncodingException
    //   82	86	89	java/io/IOException
    //   26	37	101	finally
    //   43	47	101	finally
    //   68	72	101	finally
    //   72	75	101	finally
    //   77	82	101	finally
    //   103	107	110	java/io/IOException
    //   43	47	122	java/io/IOException
    //   68	72	127	java/io/IOException
  }

  public Version version()
  {
    return this._version;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.util.VersionUtil
 * JD-Core Version:    0.6.2
 */