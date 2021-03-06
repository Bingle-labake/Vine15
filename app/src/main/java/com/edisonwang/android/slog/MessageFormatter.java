package com.edisonwang.android.slog;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

public final class MessageFormatter
{
  static final char DELIM_START = '{';
  static final char DELIM_STOP = '}';
  static final String DELIM_STR = "{}";
  private static final char ESCAPE_CHAR = '\\';

  public static FormattingTuple arrayFormat(String paramString, Object[] paramArrayOfObject)
  {
    Throwable localThrowable = getThrowableCandidate(paramArrayOfObject);
    if (paramString == null)
      return new FormattingTuple(null, paramArrayOfObject, localThrowable);
    if (paramArrayOfObject == null)
      return new FormattingTuple(paramString);
    int i = 0;
    StringBuffer localStringBuffer = new StringBuffer(50 + paramString.length());
    int j = 0;
    if (j < paramArrayOfObject.length)
    {
      int k = paramString.indexOf("{}", i);
      if (k == -1)
      {
        if (i == 0)
          return new FormattingTuple(paramString, paramArrayOfObject, localThrowable);
        localStringBuffer.append(paramString.substring(i, paramString.length()));
        return new FormattingTuple(localStringBuffer.toString(), paramArrayOfObject, localThrowable);
      }
      if (isEscapedDelimeter(paramString, k))
        if (!isDoubleEscaped(paramString, k))
        {
          j--;
          localStringBuffer.append(paramString.substring(i, k - 1));
          localStringBuffer.append('{');
          i = k + 1;
        }
      while (true)
      {
        j++;
        break;
        localStringBuffer.append(paramString.substring(i, k - 1));
        deeplyAppendParameter(localStringBuffer, paramArrayOfObject[j], new HashMap());
        i = k + 2;
        continue;
        localStringBuffer.append(paramString.substring(i, k));
        deeplyAppendParameter(localStringBuffer, paramArrayOfObject[j], new HashMap());
        i = k + 2;
      }
    }
    localStringBuffer.append(paramString.substring(i, paramString.length()));
    if (j < -1 + paramArrayOfObject.length)
      return new FormattingTuple(localStringBuffer.toString(), paramArrayOfObject, localThrowable);
    return new FormattingTuple(localStringBuffer.toString(), paramArrayOfObject, null);
  }

  private static void booleanArrayAppend(StringBuffer paramStringBuffer, boolean[] paramArrayOfBoolean)
  {
    paramStringBuffer.append('[');
    int i = paramArrayOfBoolean.length;
    for (int j = 0; j < i; j++)
    {
      paramStringBuffer.append(paramArrayOfBoolean[j]);
      if (j != i - 1)
        paramStringBuffer.append(", ");
    }
    paramStringBuffer.append(']');
  }

  private static void byteArrayAppend(StringBuffer paramStringBuffer, byte[] paramArrayOfByte)
  {
    paramStringBuffer.append('[');
    int i = paramArrayOfByte.length;
    for (int j = 0; j < i; j++)
    {
      paramStringBuffer.append(paramArrayOfByte[j]);
      if (j != i - 1)
        paramStringBuffer.append(", ");
    }
    paramStringBuffer.append(']');
  }

  private static void charArrayAppend(StringBuffer paramStringBuffer, char[] paramArrayOfChar)
  {
    paramStringBuffer.append('[');
    int i = paramArrayOfChar.length;
    for (int j = 0; j < i; j++)
    {
      paramStringBuffer.append(paramArrayOfChar[j]);
      if (j != i - 1)
        paramStringBuffer.append(", ");
    }
    paramStringBuffer.append(']');
  }

  private static void deeplyAppendParameter(StringBuffer paramStringBuffer, Object paramObject, Map paramMap)
  {
    if (paramObject == null)
    {
      paramStringBuffer.append("null");
      return;
    }
    if (!paramObject.getClass().isArray())
    {
      safeObjectAppend(paramStringBuffer, paramObject);
      return;
    }
    if ((paramObject instanceof boolean[]))
    {
      booleanArrayAppend(paramStringBuffer, (boolean[])paramObject);
      return;
    }
    if ((paramObject instanceof byte[]))
    {
      byteArrayAppend(paramStringBuffer, (byte[])paramObject);
      return;
    }
    if ((paramObject instanceof char[]))
    {
      charArrayAppend(paramStringBuffer, (char[])paramObject);
      return;
    }
    if ((paramObject instanceof short[]))
    {
      shortArrayAppend(paramStringBuffer, (short[])paramObject);
      return;
    }
    if ((paramObject instanceof int[]))
    {
      intArrayAppend(paramStringBuffer, (int[])paramObject);
      return;
    }
    if ((paramObject instanceof long[]))
    {
      longArrayAppend(paramStringBuffer, (long[])paramObject);
      return;
    }
    if ((paramObject instanceof float[]))
    {
      floatArrayAppend(paramStringBuffer, (float[])paramObject);
      return;
    }
    if ((paramObject instanceof double[]))
    {
      doubleArrayAppend(paramStringBuffer, (double[])paramObject);
      return;
    }
    objectArrayAppend(paramStringBuffer, (Object[])paramObject, paramMap);
  }

  private static void doubleArrayAppend(StringBuffer paramStringBuffer, double[] paramArrayOfDouble)
  {
    paramStringBuffer.append('[');
    int i = paramArrayOfDouble.length;
    for (int j = 0; j < i; j++)
    {
      paramStringBuffer.append(paramArrayOfDouble[j]);
      if (j != i - 1)
        paramStringBuffer.append(", ");
    }
    paramStringBuffer.append(']');
  }

  private static void floatArrayAppend(StringBuffer paramStringBuffer, float[] paramArrayOfFloat)
  {
    paramStringBuffer.append('[');
    int i = paramArrayOfFloat.length;
    for (int j = 0; j < i; j++)
    {
      paramStringBuffer.append(paramArrayOfFloat[j]);
      if (j != i - 1)
        paramStringBuffer.append(", ");
    }
    paramStringBuffer.append(']');
  }

  public static FormattingTuple format(String paramString, Object paramObject)
  {
    return arrayFormat(paramString, new Object[] { paramObject });
  }

  public static FormattingTuple format(String paramString, Object paramObject1, Object paramObject2)
  {
    return arrayFormat(paramString, new Object[] { paramObject1, paramObject2 });
  }

  public static FormattingTuple format(String paramString, Object paramObject1, Object paramObject2, Object paramObject3)
  {
    return arrayFormat(paramString, new Object[] { paramObject1, paramObject2, paramObject3 });
  }

  public static FormattingTuple format(String paramString, Object[] paramArrayOfObject)
  {
    return arrayFormat(paramString, paramArrayOfObject);
  }

  private static Throwable getThrowableCandidate(Object[] paramArrayOfObject)
  {
    if ((paramArrayOfObject == null) || (paramArrayOfObject.length == 0))
      return null;
    Object localObject = paramArrayOfObject[(-1 + paramArrayOfObject.length)];
    if ((localObject instanceof Throwable))
      return (Throwable)localObject;
    return null;
  }

  private static void intArrayAppend(StringBuffer paramStringBuffer, int[] paramArrayOfInt)
  {
    paramStringBuffer.append('[');
    int i = paramArrayOfInt.length;
    for (int j = 0; j < i; j++)
    {
      paramStringBuffer.append(paramArrayOfInt[j]);
      if (j != i - 1)
        paramStringBuffer.append(", ");
    }
    paramStringBuffer.append(']');
  }

  private static boolean isDoubleEscaped(String paramString, int paramInt)
  {
    return (paramInt >= 2) && (paramString.charAt(paramInt - 2) == '\\');
  }

  private static boolean isEscapedDelimeter(String paramString, int paramInt)
  {
    if (paramInt == 0);
    while (paramString.charAt(paramInt - 1) != '\\')
      return false;
    return true;
  }

  private static void longArrayAppend(StringBuffer paramStringBuffer, long[] paramArrayOfLong)
  {
    paramStringBuffer.append('[');
    int i = paramArrayOfLong.length;
    for (int j = 0; j < i; j++)
    {
      paramStringBuffer.append(paramArrayOfLong[j]);
      if (j != i - 1)
        paramStringBuffer.append(", ");
    }
    paramStringBuffer.append(']');
  }

  private static void objectArrayAppend(StringBuffer paramStringBuffer, Object[] paramArrayOfObject, Map paramMap)
  {
    paramStringBuffer.append('[');
    if (!paramMap.containsKey(paramArrayOfObject))
    {
      paramMap.put(paramArrayOfObject, null);
      int i = paramArrayOfObject.length;
      for (int j = 0; j < i; j++)
      {
        deeplyAppendParameter(paramStringBuffer, paramArrayOfObject[j], paramMap);
        if (j != i - 1)
          paramStringBuffer.append(", ");
      }
      paramMap.remove(paramArrayOfObject);
    }
    while (true)
    {
      paramStringBuffer.append(']');
      return;
      paramStringBuffer.append("...");
    }
  }

  private static void safeObjectAppend(StringBuffer paramStringBuffer, Object paramObject)
  {
    try
    {
      paramStringBuffer.append(paramObject.toString());
      return;
    }
    catch (Throwable localThrowable)
    {
      System.err.println("SLF4J: Failed toString() invocation on an object of type [" + paramObject.getClass().getName() + "]");
      localThrowable.printStackTrace();
      paramStringBuffer.append("[FAILED toString()]");
    }
  }

  private static void shortArrayAppend(StringBuffer paramStringBuffer, short[] paramArrayOfShort)
  {
    paramStringBuffer.append('[');
    int i = paramArrayOfShort.length;
    for (int j = 0; j < i; j++)
    {
      paramStringBuffer.append(paramArrayOfShort[j]);
      if (j != i - 1)
        paramStringBuffer.append(", ");
    }
    paramStringBuffer.append(']');
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.edisonwang.android.slog.MessageFormatter
 * JD-Core Version:    0.6.2
 */