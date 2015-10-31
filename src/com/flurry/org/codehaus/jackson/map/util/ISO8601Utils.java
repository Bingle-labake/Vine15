package com.flurry.org.codehaus.jackson.map.util;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

public class ISO8601Utils
{
  private static final String GMT_ID = "GMT";
  private static final TimeZone TIMEZONE_GMT = TimeZone.getTimeZone("GMT");

  private static void checkOffset(String paramString, int paramInt, char paramChar)
    throws IndexOutOfBoundsException
  {
    char c = paramString.charAt(paramInt);
    if (c != paramChar)
      throw new IndexOutOfBoundsException("Expected '" + paramChar + "' character but found '" + c + "'");
  }

  public static String format(Date paramDate)
  {
    return format(paramDate, false, TIMEZONE_GMT);
  }

  public static String format(Date paramDate, boolean paramBoolean)
  {
    return format(paramDate, paramBoolean, TIMEZONE_GMT);
  }

  public static String format(Date paramDate, boolean paramBoolean, TimeZone paramTimeZone)
  {
    GregorianCalendar localGregorianCalendar = new GregorianCalendar(paramTimeZone, Locale.US);
    localGregorianCalendar.setTime(paramDate);
    int i = "yyyy-MM-ddThh:mm:ss".length();
    int j;
    int m;
    label56: StringBuilder localStringBuilder;
    char c;
    if (paramBoolean)
    {
      j = ".sss".length();
      int k = i + j;
      if (paramTimeZone.getRawOffset() != 0)
        break label335;
      m = "Z".length();
      localStringBuilder = new StringBuilder(k + m);
      padInt(localStringBuilder, localGregorianCalendar.get(1), "yyyy".length());
      localStringBuilder.append('-');
      padInt(localStringBuilder, 1 + localGregorianCalendar.get(2), "MM".length());
      localStringBuilder.append('-');
      padInt(localStringBuilder, localGregorianCalendar.get(5), "dd".length());
      localStringBuilder.append('T');
      padInt(localStringBuilder, localGregorianCalendar.get(11), "hh".length());
      localStringBuilder.append(':');
      padInt(localStringBuilder, localGregorianCalendar.get(12), "mm".length());
      localStringBuilder.append(':');
      padInt(localStringBuilder, localGregorianCalendar.get(13), "ss".length());
      if (paramBoolean)
      {
        localStringBuilder.append('.');
        padInt(localStringBuilder, localGregorianCalendar.get(14), "sss".length());
      }
      int n = paramTimeZone.getOffset(localGregorianCalendar.getTimeInMillis());
      if (n == 0)
        break label352;
      int i1 = Math.abs(n / 60000 / 60);
      int i2 = Math.abs(n / 60000 % 60);
      if (n >= 0)
        break label345;
      c = '-';
      label283: localStringBuilder.append(c);
      padInt(localStringBuilder, i1, "hh".length());
      localStringBuilder.append(':');
      padInt(localStringBuilder, i2, "mm".length());
    }
    while (true)
    {
      return localStringBuilder.toString();
      j = 0;
      break;
      label335: m = "+hh:mm".length();
      break label56;
      label345: c = '+';
      break label283;
      label352: localStringBuilder.append('Z');
    }
  }

  private static void padInt(StringBuilder paramStringBuilder, int paramInt1, int paramInt2)
  {
    String str = Integer.toString(paramInt1);
    for (int i = paramInt2 - str.length(); i > 0; i--)
      paramStringBuilder.append('0');
    paramStringBuilder.append(str);
  }

  // ERROR //
  public static Date parse(String paramString)
  {
    // Byte code:
    //   0: iconst_0
    //   1: iconst_4
    //   2: iadd
    //   3: istore_1
    //   4: aload_0
    //   5: iconst_0
    //   6: iload_1
    //   7: invokestatic 148	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:parseInt	(Ljava/lang/String;II)I
    //   10: istore 11
    //   12: aload_0
    //   13: iload_1
    //   14: bipush 45
    //   16: invokestatic 150	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:checkOffset	(Ljava/lang/String;IC)V
    //   19: iload_1
    //   20: iconst_1
    //   21: iadd
    //   22: istore 12
    //   24: iload 12
    //   26: iconst_2
    //   27: iadd
    //   28: istore_1
    //   29: aload_0
    //   30: iload 12
    //   32: iload_1
    //   33: invokestatic 148	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:parseInt	(Ljava/lang/String;II)I
    //   36: istore 13
    //   38: aload_0
    //   39: iload_1
    //   40: bipush 45
    //   42: invokestatic 150	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:checkOffset	(Ljava/lang/String;IC)V
    //   45: iload_1
    //   46: iconst_1
    //   47: iadd
    //   48: istore 14
    //   50: iload 14
    //   52: iconst_2
    //   53: iadd
    //   54: istore_1
    //   55: aload_0
    //   56: iload 14
    //   58: iload_1
    //   59: invokestatic 148	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:parseInt	(Ljava/lang/String;II)I
    //   62: istore 15
    //   64: aload_0
    //   65: iload_1
    //   66: bipush 84
    //   68: invokestatic 150	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:checkOffset	(Ljava/lang/String;IC)V
    //   71: iload_1
    //   72: iconst_1
    //   73: iadd
    //   74: istore 16
    //   76: iload 16
    //   78: iconst_2
    //   79: iadd
    //   80: istore_1
    //   81: aload_0
    //   82: iload 16
    //   84: iload_1
    //   85: invokestatic 148	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:parseInt	(Ljava/lang/String;II)I
    //   88: istore 17
    //   90: aload_0
    //   91: iload_1
    //   92: bipush 58
    //   94: invokestatic 150	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:checkOffset	(Ljava/lang/String;IC)V
    //   97: iload_1
    //   98: iconst_1
    //   99: iadd
    //   100: istore 18
    //   102: iload 18
    //   104: iconst_2
    //   105: iadd
    //   106: istore_1
    //   107: aload_0
    //   108: iload 18
    //   110: iload_1
    //   111: invokestatic 148	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:parseInt	(Ljava/lang/String;II)I
    //   114: istore 19
    //   116: aload_0
    //   117: iload_1
    //   118: bipush 58
    //   120: invokestatic 150	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:checkOffset	(Ljava/lang/String;IC)V
    //   123: iload_1
    //   124: iconst_1
    //   125: iadd
    //   126: istore 20
    //   128: iload 20
    //   130: iconst_2
    //   131: iadd
    //   132: istore_1
    //   133: aload_0
    //   134: iload 20
    //   136: iload_1
    //   137: invokestatic 148	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:parseInt	(Ljava/lang/String;II)I
    //   140: istore 21
    //   142: aload_0
    //   143: iload_1
    //   144: invokevirtual 33	java/lang/String:charAt	(I)C
    //   147: bipush 46
    //   149: if_icmpne +366 -> 515
    //   152: aload_0
    //   153: iload_1
    //   154: bipush 46
    //   156: invokestatic 150	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:checkOffset	(Ljava/lang/String;IC)V
    //   159: iload_1
    //   160: iconst_1
    //   161: iadd
    //   162: istore 29
    //   164: iload 29
    //   166: iconst_3
    //   167: iadd
    //   168: istore_1
    //   169: aload_0
    //   170: iload 29
    //   172: iload_1
    //   173: invokestatic 148	com/flurry/org/codehaus/jackson/map/util/ISO8601Utils:parseInt	(Ljava/lang/String;II)I
    //   176: istore 30
    //   178: iload 30
    //   180: istore 23
    //   182: iload_1
    //   183: istore 22
    //   185: aload_0
    //   186: iload 22
    //   188: invokevirtual 33	java/lang/String:charAt	(I)C
    //   191: istore 24
    //   193: iload 24
    //   195: bipush 43
    //   197: if_icmpeq +10 -> 207
    //   200: iload 24
    //   202: bipush 45
    //   204: if_icmpne +90 -> 294
    //   207: new 35	java/lang/StringBuilder
    //   210: dup
    //   211: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   214: ldc 8
    //   216: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   219: aload_0
    //   220: iload 22
    //   222: invokevirtual 153	java/lang/String:substring	(I)Ljava/lang/String;
    //   225: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   228: invokevirtual 53	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   231: astore 25
    //   233: aload 25
    //   235: invokestatic 18	java/util/TimeZone:getTimeZone	(Ljava/lang/String;)Ljava/util/TimeZone;
    //   238: astore 26
    //   240: aload 26
    //   242: invokevirtual 156	java/util/TimeZone:getID	()Ljava/lang/String;
    //   245: aload 25
    //   247: invokevirtual 160	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   250: ifne +121 -> 371
    //   253: new 27	java/lang/IndexOutOfBoundsException
    //   256: dup
    //   257: invokespecial 161	java/lang/IndexOutOfBoundsException:<init>	()V
    //   260: athrow
    //   261: astore_2
    //   262: new 144	java/lang/IllegalArgumentException
    //   265: dup
    //   266: new 35	java/lang/StringBuilder
    //   269: dup
    //   270: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   273: ldc 163
    //   275: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   278: aload_0
    //   279: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   282: invokevirtual 53	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   285: aload_2
    //   286: invokespecial 166	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   289: astore 4
    //   291: aload 4
    //   293: athrow
    //   294: iload 24
    //   296: bipush 90
    //   298: if_icmpne +10 -> 308
    //   301: ldc 8
    //   303: astore 25
    //   305: goto -72 -> 233
    //   308: new 27	java/lang/IndexOutOfBoundsException
    //   311: dup
    //   312: new 35	java/lang/StringBuilder
    //   315: dup
    //   316: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   319: ldc 168
    //   321: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   324: iload 24
    //   326: invokevirtual 45	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   329: invokevirtual 53	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   332: invokespecial 56	java/lang/IndexOutOfBoundsException:<init>	(Ljava/lang/String;)V
    //   335: athrow
    //   336: astore 5
    //   338: new 144	java/lang/IllegalArgumentException
    //   341: dup
    //   342: new 35	java/lang/StringBuilder
    //   345: dup
    //   346: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   349: ldc 163
    //   351: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   354: aload_0
    //   355: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   358: invokevirtual 53	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   361: aload 5
    //   363: invokespecial 166	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   366: astore 7
    //   368: aload 7
    //   370: athrow
    //   371: new 64	java/util/GregorianCalendar
    //   374: dup
    //   375: aload 26
    //   377: invokespecial 171	java/util/GregorianCalendar:<init>	(Ljava/util/TimeZone;)V
    //   380: astore 27
    //   382: aload 27
    //   384: iconst_0
    //   385: invokevirtual 175	java/util/Calendar:setLenient	(Z)V
    //   388: aload 27
    //   390: iconst_1
    //   391: iload 11
    //   393: invokevirtual 179	java/util/Calendar:set	(II)V
    //   396: aload 27
    //   398: iconst_2
    //   399: iload 13
    //   401: iconst_1
    //   402: isub
    //   403: invokevirtual 179	java/util/Calendar:set	(II)V
    //   406: aload 27
    //   408: iconst_5
    //   409: iload 15
    //   411: invokevirtual 179	java/util/Calendar:set	(II)V
    //   414: aload 27
    //   416: bipush 11
    //   418: iload 17
    //   420: invokevirtual 179	java/util/Calendar:set	(II)V
    //   423: aload 27
    //   425: bipush 12
    //   427: iload 19
    //   429: invokevirtual 179	java/util/Calendar:set	(II)V
    //   432: aload 27
    //   434: bipush 13
    //   436: iload 21
    //   438: invokevirtual 179	java/util/Calendar:set	(II)V
    //   441: aload 27
    //   443: bipush 14
    //   445: iload 23
    //   447: invokevirtual 179	java/util/Calendar:set	(II)V
    //   450: aload 27
    //   452: invokevirtual 183	java/util/Calendar:getTime	()Ljava/util/Date;
    //   455: astore 28
    //   457: aload 28
    //   459: areturn
    //   460: astore 8
    //   462: iload_1
    //   463: pop
    //   464: new 144	java/lang/IllegalArgumentException
    //   467: dup
    //   468: new 35	java/lang/StringBuilder
    //   471: dup
    //   472: invokespecial 36	java/lang/StringBuilder:<init>	()V
    //   475: ldc 163
    //   477: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   480: aload_0
    //   481: invokevirtual 42	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   484: invokevirtual 53	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   487: aload 8
    //   489: invokespecial 166	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   492: astore 10
    //   494: aload 10
    //   496: athrow
    //   497: astore 8
    //   499: goto -35 -> 464
    //   502: astore 5
    //   504: iload_1
    //   505: pop
    //   506: goto -168 -> 338
    //   509: astore_2
    //   510: iload_1
    //   511: pop
    //   512: goto -250 -> 262
    //   515: iload_1
    //   516: istore 22
    //   518: iconst_0
    //   519: istore 23
    //   521: goto -336 -> 185
    //
    // Exception table:
    //   from	to	target	type
    //   185	193	261	java/lang/IndexOutOfBoundsException
    //   207	233	261	java/lang/IndexOutOfBoundsException
    //   233	261	261	java/lang/IndexOutOfBoundsException
    //   308	336	261	java/lang/IndexOutOfBoundsException
    //   371	457	261	java/lang/IndexOutOfBoundsException
    //   185	193	336	java/lang/NumberFormatException
    //   207	233	336	java/lang/NumberFormatException
    //   233	261	336	java/lang/NumberFormatException
    //   308	336	336	java/lang/NumberFormatException
    //   371	457	336	java/lang/NumberFormatException
    //   4	19	460	java/lang/IllegalArgumentException
    //   29	45	460	java/lang/IllegalArgumentException
    //   55	71	460	java/lang/IllegalArgumentException
    //   81	97	460	java/lang/IllegalArgumentException
    //   107	123	460	java/lang/IllegalArgumentException
    //   133	159	460	java/lang/IllegalArgumentException
    //   169	178	460	java/lang/IllegalArgumentException
    //   185	193	497	java/lang/IllegalArgumentException
    //   207	233	497	java/lang/IllegalArgumentException
    //   233	261	497	java/lang/IllegalArgumentException
    //   308	336	497	java/lang/IllegalArgumentException
    //   371	457	497	java/lang/IllegalArgumentException
    //   4	19	502	java/lang/NumberFormatException
    //   29	45	502	java/lang/NumberFormatException
    //   55	71	502	java/lang/NumberFormatException
    //   81	97	502	java/lang/NumberFormatException
    //   107	123	502	java/lang/NumberFormatException
    //   133	159	502	java/lang/NumberFormatException
    //   169	178	502	java/lang/NumberFormatException
    //   4	19	509	java/lang/IndexOutOfBoundsException
    //   29	45	509	java/lang/IndexOutOfBoundsException
    //   55	71	509	java/lang/IndexOutOfBoundsException
    //   81	97	509	java/lang/IndexOutOfBoundsException
    //   107	123	509	java/lang/IndexOutOfBoundsException
    //   133	159	509	java/lang/IndexOutOfBoundsException
    //   169	178	509	java/lang/IndexOutOfBoundsException
  }

  private static int parseInt(String paramString, int paramInt1, int paramInt2)
    throws NumberFormatException
  {
    if ((paramInt1 < 0) || (paramInt2 > paramString.length()) || (paramInt1 > paramInt2))
      throw new NumberFormatException(paramString);
    int i;
    int j;
    if (paramInt1 < paramInt2)
    {
      i = paramInt1 + 1;
      int n = Character.digit(paramString.charAt(paramInt1), 10);
      if (n < 0)
        throw new NumberFormatException("Invalid number: " + paramString);
      j = -n;
    }
    while (true)
      if (i < paramInt2)
      {
        int k = i + 1;
        int m = Character.digit(paramString.charAt(i), 10);
        if (m < 0)
          throw new NumberFormatException("Invalid number: " + paramString);
        j = j * 10 - m;
        i = k;
      }
      else
      {
        return -j;
        i = paramInt1;
        j = 0;
      }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.util.ISO8601Utils
 * JD-Core Version:    0.6.2
 */