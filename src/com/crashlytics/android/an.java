package com.crashlytics.android;

import android.content.Context;

final class an
  implements Runnable
{
  private final Context a;
  private final float b;

  an(al paramal, Context paramContext, float paramFloat)
  {
    this.a = paramContext;
    this.b = paramFloat;
  }

  // ERROR //
  public final void run()
  {
    // Byte code:
    //   0: new 30	java/lang/StringBuilder
    //   3: dup
    //   4: ldc 32
    //   6: invokespecial 35	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   9: aload_0
    //   10: getfield 23	com/crashlytics/android/an:b	F
    //   13: invokevirtual 39	java/lang/StringBuilder:append	(F)Ljava/lang/StringBuilder;
    //   16: ldc 41
    //   18: invokevirtual 44	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   21: invokevirtual 48	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   24: invokestatic 52	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   27: aload_0
    //   28: getfield 23	com/crashlytics/android/an:b	F
    //   31: fstore_3
    //   32: fload_3
    //   33: fconst_0
    //   34: fcmpl
    //   35: ifle +14 -> 49
    //   38: ldc 53
    //   40: aload_0
    //   41: getfield 23	com/crashlytics/android/an:b	F
    //   44: fmul
    //   45: f2l
    //   46: invokestatic 59	java/lang/Thread:sleep	(J)V
    //   49: invokestatic 65	com/crashlytics/android/Crashlytics:getInstance	()Lcom/crashlytics/android/Crashlytics;
    //   52: astore 4
    //   54: aload 4
    //   56: invokevirtual 69	com/crashlytics/android/Crashlytics:m	()Lcom/crashlytics/android/E;
    //   59: astore 5
    //   61: aload_0
    //   62: getfield 16	com/crashlytics/android/an:c	Lcom/crashlytics/android/al;
    //   65: invokevirtual 74	com/crashlytics/android/al:a	()Ljava/util/List;
    //   68: astore 6
    //   70: aload 5
    //   72: invokevirtual 79	com/crashlytics/android/E:a	()Z
    //   75: ifne +98 -> 173
    //   78: aload 6
    //   80: invokeinterface 84 1 0
    //   85: ifne +308 -> 393
    //   88: aload 4
    //   90: aload_0
    //   91: getfield 21	com/crashlytics/android/an:a	Landroid/content/Context;
    //   94: invokevirtual 87	com/crashlytics/android/Crashlytics:a	(Landroid/content/Context;)Z
    //   97: ifne +296 -> 393
    //   100: new 30	java/lang/StringBuilder
    //   103: dup
    //   104: ldc 89
    //   106: invokespecial 35	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   109: aload 6
    //   111: invokeinterface 93 1 0
    //   116: invokevirtual 96	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   119: ldc 98
    //   121: invokevirtual 44	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   124: invokevirtual 48	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   127: invokestatic 52	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   130: aload 6
    //   132: invokeinterface 102 1 0
    //   137: astore 18
    //   139: aload 18
    //   141: invokeinterface 107 1 0
    //   146: ifeq +27 -> 173
    //   149: aload 18
    //   151: invokeinterface 111 1 0
    //   156: checkcast 113	com/crashlytics/android/ak
    //   159: invokevirtual 114	com/crashlytics/android/ak:a	()Z
    //   162: pop
    //   163: goto -24 -> 139
    //   166: astore_1
    //   167: ldc 116
    //   169: aload_1
    //   170: invokestatic 119	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   173: aload_0
    //   174: getfield 16	com/crashlytics/android/an:c	Lcom/crashlytics/android/al;
    //   177: aconst_null
    //   178: invokestatic 122	com/crashlytics/android/al:a	(Lcom/crashlytics/android/al;Ljava/lang/Thread;)Ljava/lang/Thread;
    //   181: pop
    //   182: return
    //   183: astore 20
    //   185: invokestatic 126	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   188: invokevirtual 129	java/lang/Thread:interrupt	()V
    //   191: goto -18 -> 173
    //   194: aload 6
    //   196: invokeinterface 84 1 0
    //   201: ifne -28 -> 173
    //   204: invokestatic 65	com/crashlytics/android/Crashlytics:getInstance	()Lcom/crashlytics/android/Crashlytics;
    //   207: invokevirtual 69	com/crashlytics/android/Crashlytics:m	()Lcom/crashlytics/android/E;
    //   210: invokevirtual 79	com/crashlytics/android/E:a	()Z
    //   213: ifne -40 -> 173
    //   216: new 30	java/lang/StringBuilder
    //   219: dup
    //   220: ldc 131
    //   222: invokespecial 35	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   225: aload 6
    //   227: invokeinterface 93 1 0
    //   232: invokevirtual 96	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   235: ldc 133
    //   237: invokevirtual 44	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   240: invokevirtual 48	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   243: invokestatic 52	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   246: aload 6
    //   248: invokeinterface 102 1 0
    //   253: astore 8
    //   255: aload 8
    //   257: invokeinterface 107 1 0
    //   262: ifeq +28 -> 290
    //   265: aload 8
    //   267: invokeinterface 111 1 0
    //   272: checkcast 113	com/crashlytics/android/ak
    //   275: astore 16
    //   277: aload_0
    //   278: getfield 16	com/crashlytics/android/an:c	Lcom/crashlytics/android/al;
    //   281: aload 16
    //   283: invokevirtual 136	com/crashlytics/android/al:a	(Lcom/crashlytics/android/ak;)Z
    //   286: pop
    //   287: goto -32 -> 255
    //   290: aload_0
    //   291: getfield 16	com/crashlytics/android/an:c	Lcom/crashlytics/android/al;
    //   294: invokevirtual 74	com/crashlytics/android/al:a	()Ljava/util/List;
    //   297: astore 6
    //   299: aload 6
    //   301: invokeinterface 84 1 0
    //   306: ifne -112 -> 194
    //   309: invokestatic 139	com/crashlytics/android/al:b	()[S
    //   312: astore 9
    //   314: iload 7
    //   316: iconst_1
    //   317: iadd
    //   318: istore 10
    //   320: aload 9
    //   322: iload 7
    //   324: iconst_m1
    //   325: invokestatic 139	com/crashlytics/android/al:b	()[S
    //   328: arraylength
    //   329: iadd
    //   330: invokestatic 145	java/lang/Math:min	(II)I
    //   333: saload
    //   334: i2l
    //   335: lstore 11
    //   337: new 30	java/lang/StringBuilder
    //   340: dup
    //   341: ldc 147
    //   343: invokespecial 35	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   346: lload 11
    //   348: invokevirtual 150	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   351: ldc 152
    //   353: invokevirtual 44	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   356: invokevirtual 48	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   359: invokestatic 52	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   362: lload 11
    //   364: ldc2_w 153
    //   367: lmul
    //   368: lstore 13
    //   370: lload 13
    //   372: invokestatic 59	java/lang/Thread:sleep	(J)V
    //   375: iload 10
    //   377: istore 7
    //   379: goto -185 -> 194
    //   382: astore 15
    //   384: invokestatic 126	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   387: invokevirtual 129	java/lang/Thread:interrupt	()V
    //   390: goto -217 -> 173
    //   393: iconst_0
    //   394: istore 7
    //   396: goto -202 -> 194
    //
    // Exception table:
    //   from	to	target	type
    //   0	32	166	java/lang/Exception
    //   38	49	166	java/lang/Exception
    //   49	139	166	java/lang/Exception
    //   139	163	166	java/lang/Exception
    //   185	191	166	java/lang/Exception
    //   194	255	166	java/lang/Exception
    //   255	287	166	java/lang/Exception
    //   290	314	166	java/lang/Exception
    //   320	362	166	java/lang/Exception
    //   370	375	166	java/lang/Exception
    //   384	390	166	java/lang/Exception
    //   38	49	183	java/lang/InterruptedException
    //   370	375	382	java/lang/InterruptedException
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.an
 * JD-Core Version:    0.6.2
 */