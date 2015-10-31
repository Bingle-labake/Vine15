package com.fasterxml.jackson.core.io;

public final class NumberInput
{
  static final long L_BILLION = 1000000000L;
  static final String MAX_LONG_STR = String.valueOf(9223372036854775807L);
  static final String MIN_LONG_STR_NO_SIGN = String.valueOf(-9223372036854775808L).substring(1);
  public static final String NASTY_SMALL_DOUBLE = "2.2250738585072012e-308";

  public static boolean inLongRange(String paramString, boolean paramBoolean)
  {
    String str;
    int i;
    int j;
    if (paramBoolean)
    {
      str = MIN_LONG_STR_NO_SIGN;
      i = str.length();
      j = paramString.length();
      if (j >= i)
        break label34;
    }
    while (true)
    {
      return true;
      str = MAX_LONG_STR;
      break;
      label34: if (j > i)
        return false;
      for (int k = 0; k < i; k++)
      {
        int m = paramString.charAt(k) - str.charAt(k);
        if (m != 0)
        {
          if (m < 0);
          for (boolean bool = true; ; bool = false)
            return bool;
        }
      }
    }
  }

  public static boolean inLongRange(char[] paramArrayOfChar, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    String str;
    int i;
    if (paramBoolean)
    {
      str = MIN_LONG_STR_NO_SIGN;
      i = str.length();
      if (paramInt2 >= i)
        break label32;
    }
    while (true)
    {
      return true;
      str = MAX_LONG_STR;
      break;
      label32: if (paramInt2 > i)
        return false;
      for (int j = 0; j < i; j++)
      {
        int k = paramArrayOfChar[(paramInt1 + j)] - str.charAt(j);
        if (k != 0)
        {
          if (k < 0);
          for (boolean bool = true; ; bool = false)
            return bool;
        }
      }
    }
  }

  public static double parseAsDouble(String paramString, double paramDouble)
  {
    if (paramString == null);
    String str;
    do
    {
      return paramDouble;
      str = paramString.trim();
    }
    while (str.length() == 0);
    try
    {
      double d = parseDouble(str);
      return d;
    }
    catch (NumberFormatException localNumberFormatException)
    {
    }
    return paramDouble;
  }

  // ERROR //
  public static int parseAsInt(String paramString, int paramInt)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_2
    //   2: aload_0
    //   3: ifnonnull +5 -> 8
    //   6: iload_1
    //   7: ireturn
    //   8: aload_0
    //   9: invokevirtual 56	java/lang/String:trim	()Ljava/lang/String;
    //   12: astore_3
    //   13: aload_3
    //   14: invokevirtual 43	java/lang/String:length	()I
    //   17: istore 4
    //   19: iload 4
    //   21: ifeq -15 -> 6
    //   24: iload 4
    //   26: ifge +113 -> 139
    //   29: aload_3
    //   30: iconst_0
    //   31: invokevirtual 47	java/lang/String:charAt	(I)C
    //   34: istore 13
    //   36: iload 13
    //   38: bipush 43
    //   40: if_icmpne +56 -> 96
    //   43: aload_3
    //   44: iconst_1
    //   45: invokevirtual 28	java/lang/String:substring	(I)Ljava/lang/String;
    //   48: astore 6
    //   50: aload 6
    //   52: invokevirtual 43	java/lang/String:length	()I
    //   55: istore 5
    //   57: iload_2
    //   58: iload 5
    //   60: if_icmpge +61 -> 121
    //   63: aload 6
    //   65: iload_2
    //   66: invokevirtual 47	java/lang/String:charAt	(I)C
    //   69: istore 9
    //   71: iload 9
    //   73: bipush 57
    //   75: if_icmpgt +10 -> 85
    //   78: iload 9
    //   80: bipush 48
    //   82: if_icmpge +33 -> 115
    //   85: aload 6
    //   87: invokestatic 60	com/fasterxml/jackson/core/io/NumberInput:parseDouble	(Ljava/lang/String;)D
    //   90: dstore 11
    //   92: dload 11
    //   94: d2i
    //   95: ireturn
    //   96: iload 13
    //   98: bipush 45
    //   100: if_icmpne +39 -> 139
    //   103: iconst_1
    //   104: istore_2
    //   105: iload 4
    //   107: istore 5
    //   109: aload_3
    //   110: astore 6
    //   112: goto -55 -> 57
    //   115: iinc 2 1
    //   118: goto -61 -> 57
    //   121: aload 6
    //   123: invokestatic 68	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   126: istore 8
    //   128: iload 8
    //   130: ireturn
    //   131: astore 10
    //   133: iload_1
    //   134: ireturn
    //   135: astore 7
    //   137: iload_1
    //   138: ireturn
    //   139: iload 4
    //   141: istore 5
    //   143: aload_3
    //   144: astore 6
    //   146: iconst_0
    //   147: istore_2
    //   148: goto -91 -> 57
    //
    // Exception table:
    //   from	to	target	type
    //   85	92	131	java/lang/NumberFormatException
    //   121	128	135	java/lang/NumberFormatException
  }

  // ERROR //
  public static long parseAsLong(String paramString, long paramLong)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_3
    //   2: aload_0
    //   3: ifnonnull +5 -> 8
    //   6: lload_1
    //   7: lreturn
    //   8: aload_0
    //   9: invokevirtual 56	java/lang/String:trim	()Ljava/lang/String;
    //   12: astore 4
    //   14: aload 4
    //   16: invokevirtual 43	java/lang/String:length	()I
    //   19: istore 5
    //   21: iload 5
    //   23: ifeq -17 -> 6
    //   26: iload 5
    //   28: ifge +116 -> 144
    //   31: aload 4
    //   33: iconst_0
    //   34: invokevirtual 47	java/lang/String:charAt	(I)C
    //   37: istore 15
    //   39: iload 15
    //   41: bipush 43
    //   43: if_icmpne +57 -> 100
    //   46: aload 4
    //   48: iconst_1
    //   49: invokevirtual 28	java/lang/String:substring	(I)Ljava/lang/String;
    //   52: astore 7
    //   54: aload 7
    //   56: invokevirtual 43	java/lang/String:length	()I
    //   59: istore 6
    //   61: iload_3
    //   62: iload 6
    //   64: if_icmpge +62 -> 126
    //   67: aload 7
    //   69: iload_3
    //   70: invokevirtual 47	java/lang/String:charAt	(I)C
    //   73: istore 11
    //   75: iload 11
    //   77: bipush 57
    //   79: if_icmpgt +10 -> 89
    //   82: iload 11
    //   84: bipush 48
    //   86: if_icmpge +34 -> 120
    //   89: aload 7
    //   91: invokestatic 60	com/fasterxml/jackson/core/io/NumberInput:parseDouble	(Ljava/lang/String;)D
    //   94: dstore 13
    //   96: dload 13
    //   98: d2l
    //   99: lreturn
    //   100: iload 15
    //   102: bipush 45
    //   104: if_icmpne +40 -> 144
    //   107: iconst_1
    //   108: istore_3
    //   109: iload 5
    //   111: istore 6
    //   113: aload 4
    //   115: astore 7
    //   117: goto -56 -> 61
    //   120: iinc 3 1
    //   123: goto -62 -> 61
    //   126: aload 7
    //   128: invokestatic 76	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   131: lstore 9
    //   133: lload 9
    //   135: lreturn
    //   136: astore 12
    //   138: lload_1
    //   139: lreturn
    //   140: astore 8
    //   142: lload_1
    //   143: lreturn
    //   144: iload 5
    //   146: istore 6
    //   148: aload 4
    //   150: astore 7
    //   152: iconst_0
    //   153: istore_3
    //   154: goto -93 -> 61
    //
    // Exception table:
    //   from	to	target	type
    //   89	96	136	java/lang/NumberFormatException
    //   126	133	140	java/lang/NumberFormatException
  }

  public static double parseDouble(String paramString)
    throws NumberFormatException
  {
    if ("2.2250738585072012e-308".equals(paramString))
      return 4.9E-324D;
    return Double.parseDouble(paramString);
  }

  public static int parseInt(String paramString)
  {
    int i = 1;
    int j = paramString.charAt(0);
    int k = paramString.length();
    int m;
    if (j == 45)
      m = i;
    while (m != 0)
      if ((k == i) || (k > 10))
      {
        n = Integer.parseInt(paramString);
        return n;
        m = 0;
      }
      else
      {
        j = paramString.charAt(i);
        i = 2;
      }
    while ((j > 57) || (j < 48))
    {
      return Integer.parseInt(paramString);
      if (k > 9)
        return Integer.parseInt(paramString);
    }
    int n = j - 48;
    int i3;
    if (i < k)
    {
      int i1 = i + 1;
      int i2 = paramString.charAt(i);
      if ((i2 > 57) || (i2 < 48))
        return Integer.parseInt(paramString);
      n = n * 10 + (i2 - 48);
      if (i1 < k)
      {
        i3 = i1 + 1;
        int i4 = paramString.charAt(i1);
        if ((i4 > 57) || (i4 < 48))
          return Integer.parseInt(paramString);
        n = n * 10 + (i4 - 48);
        if (i3 >= k);
      }
    }
    while (true)
    {
      int i5 = i3 + 1;
      int i6 = paramString.charAt(i3);
      if ((i6 > 57) || (i6 < 48))
        return Integer.parseInt(paramString);
      n = n * 10 + (i6 - 48);
      if (i5 >= k)
      {
        if (m == 0)
          break;
        return -n;
      }
      i3 = i5;
    }
  }

  public static int parseInt(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    int i = '\0*0' + paramArrayOfChar[paramInt1];
    int j = paramInt2 + paramInt1;
    int k = paramInt1 + 1;
    if (k < j)
    {
      i = i * 10 + ('\0*0' + paramArrayOfChar[k]);
      int m = k + 1;
      if (m < j)
      {
        i = i * 10 + ('\0*0' + paramArrayOfChar[m]);
        int n = m + 1;
        if (n < j)
        {
          i = i * 10 + ('\0*0' + paramArrayOfChar[n]);
          int i1 = n + 1;
          if (i1 < j)
          {
            i = i * 10 + ('\0*0' + paramArrayOfChar[i1]);
            int i2 = i1 + 1;
            if (i2 < j)
            {
              i = i * 10 + ('\0*0' + paramArrayOfChar[i2]);
              int i3 = i2 + 1;
              if (i3 < j)
              {
                i = i * 10 + ('\0*0' + paramArrayOfChar[i3]);
                int i4 = i3 + 1;
                if (i4 < j)
                {
                  i = i * 10 + ('\0*0' + paramArrayOfChar[i4]);
                  int i5 = i4 + 1;
                  if (i5 < j)
                    i = i * 10 + ('\0*0' + paramArrayOfChar[i5]);
                }
              }
            }
          }
        }
      }
    }
    return i;
  }

  public static long parseLong(String paramString)
  {
    if (paramString.length() <= 9)
      return parseInt(paramString);
    return Long.parseLong(paramString);
  }

  public static long parseLong(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    int i = paramInt2 - 9;
    return 1000000000L * parseInt(paramArrayOfChar, paramInt1, i) + parseInt(paramArrayOfChar, i + paramInt1, 9);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.io.NumberInput
 * JD-Core Version:    0.6.2
 */