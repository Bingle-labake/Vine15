package com.fasterxml.jackson.core.io;

public final class NumberOutput
{
  private static int BILLION;
  static final char[] FULL_TRIPLETS;
  static final byte[] FULL_TRIPLETS_B;
  static final char[] LEADING_TRIPLETS;
  private static long MAX_INT_AS_LONG;
  private static int MILLION = 1000000;
  private static long MIN_INT_AS_LONG;
  private static final char NULL_CHAR;
  static final String SMALLEST_LONG;
  private static long TEN_BILLION_L;
  private static long THOUSAND_L;
  static final String[] sSmallIntStrs = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };
  static final String[] sSmallIntStrs2 = { "-1", "-2", "-3", "-4", "-5", "-6", "-7", "-8", "-9", "-10" };

  static
  {
    BILLION = 1000000000;
    TEN_BILLION_L = 10000000000L;
    THOUSAND_L = 1000L;
    MIN_INT_AS_LONG = -2147483648L;
    MAX_INT_AS_LONG = 2147483647L;
    SMALLEST_LONG = String.valueOf(-9223372036854775808L);
    LEADING_TRIPLETS = new char[4000];
    FULL_TRIPLETS = new char[4000];
    int i = 0;
    int j = 0;
    while (i < 10)
    {
      int m = (char)(i + 48);
      int n;
      int i1;
      if (i == 0)
      {
        n = 0;
        i1 = 0;
      }
      while (true)
      {
        if (i1 >= 10)
          break label219;
        int i2 = (char)(i1 + 48);
        if ((i == 0) && (i1 == 0));
        int i4;
        for (int i3 = 0; ; i3 = i2)
        {
          i4 = j;
          for (int i5 = 0; i5 < 10; i5++)
          {
            int i6 = (char)(i5 + 48);
            LEADING_TRIPLETS[i4] = n;
            LEADING_TRIPLETS[(i4 + 1)] = i3;
            LEADING_TRIPLETS[(i4 + 2)] = i6;
            FULL_TRIPLETS[i4] = m;
            FULL_TRIPLETS[(i4 + 1)] = i2;
            FULL_TRIPLETS[(i4 + 2)] = i6;
            i4 += 4;
          }
          n = m;
          break;
        }
        i1++;
        j = i4;
      }
      label219: i++;
    }
    FULL_TRIPLETS_B = new byte[4000];
    for (int k = 0; k < 4000; k++)
      FULL_TRIPLETS_B[k] = ((byte)FULL_TRIPLETS[k]);
  }

  private static int calcLongStrLength(long paramLong)
  {
    int i = 10;
    for (long l = TEN_BILLION_L; ; l = (l << 3) + (l << 1))
    {
      if ((paramLong < l) || (i == 19))
        return i;
      i++;
    }
  }

  private static int outputFullTriplet(int paramInt1, byte[] paramArrayOfByte, int paramInt2)
  {
    int i = paramInt1 << 2;
    int j = paramInt2 + 1;
    byte[] arrayOfByte1 = FULL_TRIPLETS_B;
    int k = i + 1;
    paramArrayOfByte[paramInt2] = arrayOfByte1[i];
    int m = j + 1;
    byte[] arrayOfByte2 = FULL_TRIPLETS_B;
    int n = k + 1;
    paramArrayOfByte[j] = arrayOfByte2[k];
    int i1 = m + 1;
    paramArrayOfByte[m] = FULL_TRIPLETS_B[n];
    return i1;
  }

  private static int outputFullTriplet(int paramInt1, char[] paramArrayOfChar, int paramInt2)
  {
    int i = paramInt1 << 2;
    int j = paramInt2 + 1;
    char[] arrayOfChar1 = FULL_TRIPLETS;
    int k = i + 1;
    paramArrayOfChar[paramInt2] = arrayOfChar1[i];
    int m = j + 1;
    char[] arrayOfChar2 = FULL_TRIPLETS;
    int n = k + 1;
    paramArrayOfChar[j] = arrayOfChar2[k];
    int i1 = m + 1;
    paramArrayOfChar[m] = FULL_TRIPLETS[n];
    return i1;
  }

  public static int outputInt(int paramInt1, byte[] paramArrayOfByte, int paramInt2)
  {
    if (paramInt1 < 0)
    {
      if (paramInt1 == -2147483648)
        return outputLong(paramInt1, paramArrayOfByte, paramInt2);
      int i6 = paramInt2 + 1;
      paramArrayOfByte[paramInt2] = 45;
      paramInt1 = -paramInt1;
      paramInt2 = i6;
    }
    if (paramInt1 < MILLION)
    {
      if (paramInt1 < 1000)
      {
        if (paramInt1 < 10)
        {
          int i5 = paramInt2 + 1;
          paramArrayOfByte[paramInt2] = ((byte)(paramInt1 + 48));
          return i5;
        }
        return outputLeadingTriplet(paramInt1, paramArrayOfByte, paramInt2);
      }
      int i4 = paramInt1 / 1000;
      return outputFullTriplet(paramInt1 - i4 * 1000, paramArrayOfByte, outputLeadingTriplet(i4, paramArrayOfByte, paramInt2));
    }
    int i;
    label149: int k;
    int m;
    int n;
    if (paramInt1 >= BILLION)
    {
      i = 1;
      if (i != 0)
      {
        paramInt1 -= BILLION;
        if (paramInt1 < BILLION)
          break label218;
        paramInt1 -= BILLION;
        int i3 = paramInt2 + 1;
        paramArrayOfByte[paramInt2] = 50;
        paramInt2 = i3;
      }
      int j = paramInt1 / 1000;
      k = paramInt1 - j * 1000;
      m = j / 1000;
      n = j - m * 1000;
      if (i == 0)
        break label234;
    }
    label218: label234: for (int i1 = outputFullTriplet(m, paramArrayOfByte, paramInt2); ; i1 = outputLeadingTriplet(m, paramArrayOfByte, paramInt2))
    {
      return outputFullTriplet(k, paramArrayOfByte, outputFullTriplet(n, paramArrayOfByte, i1));
      i = 0;
      break;
      int i2 = paramInt2 + 1;
      paramArrayOfByte[paramInt2] = 49;
      paramInt2 = i2;
      break label149;
    }
  }

  public static int outputInt(int paramInt1, char[] paramArrayOfChar, int paramInt2)
  {
    if (paramInt1 < 0)
    {
      if (paramInt1 == -2147483648)
        return outputLong(paramInt1, paramArrayOfChar, paramInt2);
      int i6 = paramInt2 + 1;
      paramArrayOfChar[paramInt2] = '-';
      paramInt1 = -paramInt1;
      paramInt2 = i6;
    }
    if (paramInt1 < MILLION)
    {
      if (paramInt1 < 1000)
      {
        if (paramInt1 < 10)
        {
          int i5 = paramInt2 + 1;
          paramArrayOfChar[paramInt2] = ((char)(paramInt1 + 48));
          return i5;
        }
        return outputLeadingTriplet(paramInt1, paramArrayOfChar, paramInt2);
      }
      int i4 = paramInt1 / 1000;
      return outputFullTriplet(paramInt1 - i4 * 1000, paramArrayOfChar, outputLeadingTriplet(i4, paramArrayOfChar, paramInt2));
    }
    int i;
    label149: int k;
    int m;
    int n;
    if (paramInt1 >= BILLION)
    {
      i = 1;
      if (i != 0)
      {
        paramInt1 -= BILLION;
        if (paramInt1 < BILLION)
          break label218;
        paramInt1 -= BILLION;
        int i3 = paramInt2 + 1;
        paramArrayOfChar[paramInt2] = '2';
        paramInt2 = i3;
      }
      int j = paramInt1 / 1000;
      k = paramInt1 - j * 1000;
      m = j / 1000;
      n = j - m * 1000;
      if (i == 0)
        break label234;
    }
    label218: label234: for (int i1 = outputFullTriplet(m, paramArrayOfChar, paramInt2); ; i1 = outputLeadingTriplet(m, paramArrayOfChar, paramInt2))
    {
      return outputFullTriplet(k, paramArrayOfChar, outputFullTriplet(n, paramArrayOfChar, i1));
      i = 0;
      break;
      int i2 = paramInt2 + 1;
      paramArrayOfChar[paramInt2] = '1';
      paramInt2 = i2;
      break label149;
    }
  }

  private static int outputLeadingTriplet(int paramInt1, byte[] paramArrayOfByte, int paramInt2)
  {
    int i = paramInt1 << 2;
    char[] arrayOfChar1 = LEADING_TRIPLETS;
    int j = i + 1;
    int k = arrayOfChar1[i];
    if (k != 0)
    {
      int i3 = paramInt2 + 1;
      paramArrayOfByte[paramInt2] = ((byte)k);
      paramInt2 = i3;
    }
    char[] arrayOfChar2 = LEADING_TRIPLETS;
    int m = j + 1;
    int n = arrayOfChar2[j];
    if (n != 0)
    {
      int i2 = paramInt2 + 1;
      paramArrayOfByte[paramInt2] = ((byte)n);
      paramInt2 = i2;
    }
    int i1 = paramInt2 + 1;
    paramArrayOfByte[paramInt2] = ((byte)LEADING_TRIPLETS[m]);
    return i1;
  }

  private static int outputLeadingTriplet(int paramInt1, char[] paramArrayOfChar, int paramInt2)
  {
    int i = paramInt1 << 2;
    char[] arrayOfChar1 = LEADING_TRIPLETS;
    int j = i + 1;
    int k = arrayOfChar1[i];
    if (k != 0)
    {
      int i3 = paramInt2 + 1;
      paramArrayOfChar[paramInt2] = k;
      paramInt2 = i3;
    }
    char[] arrayOfChar2 = LEADING_TRIPLETS;
    int m = j + 1;
    int n = arrayOfChar2[j];
    if (n != 0)
    {
      int i2 = paramInt2 + 1;
      paramArrayOfChar[paramInt2] = n;
      paramInt2 = i2;
    }
    int i1 = paramInt2 + 1;
    paramArrayOfChar[paramInt2] = LEADING_TRIPLETS[m];
    return i1;
  }

  public static int outputLong(long paramLong, byte[] paramArrayOfByte, int paramInt)
  {
    if (paramLong < 0L)
    {
      if (paramLong > MIN_INT_AS_LONG)
        i6 = outputInt((int)paramLong, paramArrayOfByte, paramInt);
      while (true)
      {
        return i6;
        if (paramLong != -9223372036854775808L)
          break;
        i4 = SMALLEST_LONG.length();
        i5 = 0;
        for (i6 = paramInt; i5 < i4; i6 = i7)
        {
          i7 = i6 + 1;
          paramArrayOfByte[i6] = ((byte)SMALLEST_LONG.charAt(i5));
          i5++;
        }
      }
      i3 = paramInt + 1;
      paramArrayOfByte[paramInt] = 45;
      paramLong = -paramLong;
      paramInt = i3;
    }
    int i;
    int j;
    while (paramLong > MAX_INT_AS_LONG)
    {
      int i6;
      int i4;
      int i5;
      int i7;
      int i3;
      i = paramInt + calcLongStrLength(paramLong);
      j = i;
      while (paramLong > MAX_INT_AS_LONG)
      {
        j -= 3;
        long l = paramLong / THOUSAND_L;
        outputFullTriplet((int)(paramLong - l * THOUSAND_L), paramArrayOfByte, j);
        paramLong = l;
      }
    }
    return outputInt((int)paramLong, paramArrayOfByte, paramInt);
    int k = (int)paramLong;
    int m = j;
    int n = k;
    while (n >= 1000)
    {
      int i1 = m - 3;
      int i2 = n / 1000;
      outputFullTriplet(n - i2 * 1000, paramArrayOfByte, i1);
      n = i2;
      m = i1;
    }
    outputLeadingTriplet(n, paramArrayOfByte, paramInt);
    return i;
  }

  public static int outputLong(long paramLong, char[] paramArrayOfChar, int paramInt)
  {
    if (paramLong < 0L)
    {
      if (paramLong > MIN_INT_AS_LONG)
        return outputInt((int)paramLong, paramArrayOfChar, paramInt);
      if (paramLong == -9223372036854775808L)
      {
        i4 = SMALLEST_LONG.length();
        SMALLEST_LONG.getChars(0, i4, paramArrayOfChar, paramInt);
        return paramInt + i4;
      }
      i3 = paramInt + 1;
      paramArrayOfChar[paramInt] = '-';
      paramLong = -paramLong;
      paramInt = i3;
    }
    int i;
    int j;
    while (paramLong > MAX_INT_AS_LONG)
    {
      int i4;
      int i3;
      i = paramInt + calcLongStrLength(paramLong);
      j = i;
      while (paramLong > MAX_INT_AS_LONG)
      {
        j -= 3;
        long l = paramLong / THOUSAND_L;
        outputFullTriplet((int)(paramLong - l * THOUSAND_L), paramArrayOfChar, j);
        paramLong = l;
      }
    }
    return outputInt((int)paramLong, paramArrayOfChar, paramInt);
    int k = (int)paramLong;
    int m = j;
    int n = k;
    while (n >= 1000)
    {
      int i1 = m - 3;
      int i2 = n / 1000;
      outputFullTriplet(n - i2 * 1000, paramArrayOfChar, i1);
      n = i2;
      m = i1;
    }
    outputLeadingTriplet(n, paramArrayOfChar, paramInt);
    return i;
  }

  public static String toString(double paramDouble)
  {
    return Double.toString(paramDouble);
  }

  public static String toString(int paramInt)
  {
    if (paramInt < sSmallIntStrs.length)
    {
      if (paramInt >= 0)
        return sSmallIntStrs[paramInt];
      int i = -1 + -paramInt;
      if (i < sSmallIntStrs2.length)
        return sSmallIntStrs2[i];
    }
    return Integer.toString(paramInt);
  }

  public static String toString(long paramLong)
  {
    if ((paramLong <= 2147483647L) && (paramLong >= -2147483648L))
      return toString((int)paramLong);
    return Long.toString(paramLong);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.io.NumberOutput
 * JD-Core Version:    0.6.2
 */