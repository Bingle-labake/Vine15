package com.crashlytics.android;

class m
{
  // ERROR //
  public org.json.JSONObject a()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: ldc 14
    //   4: invokestatic 20	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   7: new 22	java/io/File
    //   10: dup
    //   11: invokestatic 28	com/crashlytics/android/Crashlytics:h	()Ljava/io/File;
    //   14: ldc 30
    //   16: invokespecial 33	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   19: astore_2
    //   20: aload_2
    //   21: invokevirtual 37	java/io/File:exists	()Z
    //   24: ifeq +41 -> 65
    //   27: new 39	java/io/FileInputStream
    //   30: dup
    //   31: aload_2
    //   32: invokespecial 42	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   35: astore 5
    //   37: new 44	org/json/JSONObject
    //   40: dup
    //   41: aload 5
    //   43: invokestatic 47	com/crashlytics/android/av:a	(Ljava/io/InputStream;)Ljava/lang/String;
    //   46: invokespecial 49	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   49: astore 6
    //   51: aload 5
    //   53: astore 7
    //   55: aload 7
    //   57: ldc 51
    //   59: invokestatic 54	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   62: aload 6
    //   64: areturn
    //   65: ldc 56
    //   67: invokestatic 20	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   70: aconst_null
    //   71: astore 6
    //   73: aconst_null
    //   74: astore 7
    //   76: goto -21 -> 55
    //   79: astore 4
    //   81: aconst_null
    //   82: astore 5
    //   84: ldc 58
    //   86: aload 4
    //   88: invokestatic 61	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   91: aload 5
    //   93: ldc 51
    //   95: invokestatic 54	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   98: aconst_null
    //   99: areturn
    //   100: astore_3
    //   101: aload_1
    //   102: ldc 51
    //   104: invokestatic 54	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   107: aload_3
    //   108: athrow
    //   109: astore_3
    //   110: aload 5
    //   112: astore_1
    //   113: goto -12 -> 101
    //   116: astore 4
    //   118: goto -34 -> 84
    //
    // Exception table:
    //   from	to	target	type
    //   7	37	79	java/lang/Exception
    //   65	70	79	java/lang/Exception
    //   7	37	100	finally
    //   65	70	100	finally
    //   37	51	109	finally
    //   84	91	109	finally
    //   37	51	116	java/lang/Exception
  }

  // ERROR //
  public void a(long paramLong, org.json.JSONObject paramJSONObject)
  {
    // Byte code:
    //   0: ldc 64
    //   2: invokestatic 20	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   5: aload_3
    //   6: ifnull +56 -> 62
    //   9: aconst_null
    //   10: astore 4
    //   12: aload_3
    //   13: ldc 66
    //   15: lload_1
    //   16: invokevirtual 70	org/json/JSONObject:put	(Ljava/lang/String;J)Lorg/json/JSONObject;
    //   19: pop
    //   20: new 72	java/io/FileWriter
    //   23: dup
    //   24: new 22	java/io/File
    //   27: dup
    //   28: invokestatic 28	com/crashlytics/android/Crashlytics:h	()Ljava/io/File;
    //   31: ldc 30
    //   33: invokespecial 33	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   36: invokespecial 73	java/io/FileWriter:<init>	(Ljava/io/File;)V
    //   39: astore 7
    //   41: aload 7
    //   43: aload_3
    //   44: invokevirtual 77	org/json/JSONObject:toString	()Ljava/lang/String;
    //   47: invokevirtual 80	java/io/FileWriter:write	(Ljava/lang/String;)V
    //   50: aload 7
    //   52: invokevirtual 83	java/io/FileWriter:flush	()V
    //   55: aload 7
    //   57: ldc 85
    //   59: invokestatic 54	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   62: return
    //   63: astore 6
    //   65: aconst_null
    //   66: astore 7
    //   68: ldc 87
    //   70: aload 6
    //   72: invokestatic 61	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   75: aload 7
    //   77: ldc 85
    //   79: invokestatic 54	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   82: return
    //   83: astore 5
    //   85: aload 4
    //   87: ldc 85
    //   89: invokestatic 54	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   92: aload 5
    //   94: athrow
    //   95: astore 5
    //   97: aload 7
    //   99: astore 4
    //   101: goto -16 -> 85
    //   104: astore 6
    //   106: goto -38 -> 68
    //
    // Exception table:
    //   from	to	target	type
    //   12	41	63	java/lang/Exception
    //   12	41	83	finally
    //   41	55	95	finally
    //   68	75	95	finally
    //   41	55	104	java/lang/Exception
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.m
 * JD-Core Version:    0.6.2
 */