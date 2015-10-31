package com.crashlytics.android;

class SettingsController
{
  private aq a;
  private final ap b;
  private final Z c;
  private final m d;
  private final as e;

  public SettingsController(aq paramaq, Z paramZ, ap paramap, m paramm, as paramas)
  {
    this.a = paramaq;
    this.c = paramZ;
    this.b = paramap;
    this.d = paramm;
    this.e = paramas;
  }

  // ERROR //
  private ao b(SettingsController.CacheBehavior paramCacheBehavior)
  {
    // Byte code:
    //   0: getstatic 38	com/crashlytics/android/SettingsController$CacheBehavior:SKIP_CACHE_LOOKUP	Lcom/crashlytics/android/SettingsController$CacheBehavior;
    //   3: aload_1
    //   4: invokevirtual 42	com/crashlytics/android/SettingsController$CacheBehavior:equals	(Ljava/lang/Object;)Z
    //   7: ifne +156 -> 163
    //   10: aload_0
    //   11: getfield 27	com/crashlytics/android/SettingsController:d	Lcom/crashlytics/android/m;
    //   14: invokevirtual 47	com/crashlytics/android/m:a	()Lorg/json/JSONObject;
    //   17: astore 5
    //   19: aload 5
    //   21: ifnull +114 -> 135
    //   24: aload_0
    //   25: getfield 25	com/crashlytics/android/SettingsController:b	Lcom/crashlytics/android/ap;
    //   28: aload_0
    //   29: getfield 23	com/crashlytics/android/SettingsController:c	Lcom/crashlytics/android/Z;
    //   32: aload 5
    //   34: invokevirtual 52	com/crashlytics/android/ap:a	(Lcom/crashlytics/android/Z;Lorg/json/JSONObject;)Lcom/crashlytics/android/ao;
    //   37: astore_3
    //   38: aload_3
    //   39: ifnull +88 -> 127
    //   42: new 54	java/lang/StringBuilder
    //   45: dup
    //   46: ldc 56
    //   48: invokespecial 59	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   51: aload 5
    //   53: invokevirtual 65	org/json/JSONObject:toString	()Ljava/lang/String;
    //   56: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: invokevirtual 70	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   62: invokestatic 74	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   65: aload_0
    //   66: getfield 23	com/crashlytics/android/SettingsController:c	Lcom/crashlytics/android/Z;
    //   69: invokevirtual 79	com/crashlytics/android/Z:a	()J
    //   72: lstore 6
    //   74: getstatic 82	com/crashlytics/android/SettingsController$CacheBehavior:IGNORE_CACHE_EXPIRATION	Lcom/crashlytics/android/SettingsController$CacheBehavior;
    //   77: aload_1
    //   78: invokevirtual 42	com/crashlytics/android/SettingsController$CacheBehavior:equals	(Ljava/lang/Object;)Z
    //   81: ifne +25 -> 106
    //   84: aload_3
    //   85: invokevirtual 85	com/crashlytics/android/ao:a	()J
    //   88: lstore 8
    //   90: lload 8
    //   92: lload 6
    //   94: lcmp
    //   95: ifge +18 -> 113
    //   98: iconst_1
    //   99: istore 10
    //   101: iload 10
    //   103: ifne +16 -> 119
    //   106: ldc 87
    //   108: invokestatic 74	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   111: aload_3
    //   112: areturn
    //   113: iconst_0
    //   114: istore 10
    //   116: goto -15 -> 101
    //   119: ldc 89
    //   121: invokestatic 74	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   124: goto +39 -> 163
    //   127: ldc 91
    //   129: aconst_null
    //   130: invokestatic 94	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   133: aconst_null
    //   134: areturn
    //   135: ldc 96
    //   137: invokestatic 74	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   140: goto +23 -> 163
    //   143: astore_2
    //   144: aconst_null
    //   145: astore_3
    //   146: aload_2
    //   147: astore 4
    //   149: ldc 98
    //   151: aload 4
    //   153: invokestatic 94	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   156: aload_3
    //   157: areturn
    //   158: astore 4
    //   160: goto -11 -> 149
    //   163: aconst_null
    //   164: areturn
    //
    // Exception table:
    //   from	to	target	type
    //   0	19	143	java/lang/Exception
    //   24	38	143	java/lang/Exception
    //   42	90	143	java/lang/Exception
    //   119	124	143	java/lang/Exception
    //   127	133	143	java/lang/Exception
    //   135	140	143	java/lang/Exception
    //   106	111	158	java/lang/Exception
  }

  public ao a()
  {
    return a(SettingsController.CacheBehavior.USE_CACHE);
  }

  // ERROR //
  public ao a(SettingsController.CacheBehavior paramCacheBehavior)
  {
    // Byte code:
    //   0: invokestatic 110	com/crashlytics/android/Crashlytics:getInstance	()Lcom/crashlytics/android/Crashlytics;
    //   3: invokevirtual 114	com/crashlytics/android/Crashlytics:getDebugMode	()Z
    //   6: istore 5
    //   8: aconst_null
    //   9: astore 6
    //   11: iload 5
    //   13: ifne +14 -> 27
    //   16: aload_0
    //   17: aload_1
    //   18: invokespecial 116	com/crashlytics/android/SettingsController:b	(Lcom/crashlytics/android/SettingsController$CacheBehavior;)Lcom/crashlytics/android/ao;
    //   21: astore 7
    //   23: aload 7
    //   25: astore 6
    //   27: aload 6
    //   29: ifnonnull +75 -> 104
    //   32: aload_0
    //   33: getfield 29	com/crashlytics/android/SettingsController:e	Lcom/crashlytics/android/as;
    //   36: aload_0
    //   37: getfield 21	com/crashlytics/android/SettingsController:a	Lcom/crashlytics/android/aq;
    //   40: invokeinterface 121 2 0
    //   45: astore 10
    //   47: aload 10
    //   49: ifnull +55 -> 104
    //   52: aload_0
    //   53: getfield 25	com/crashlytics/android/SettingsController:b	Lcom/crashlytics/android/ap;
    //   56: aload_0
    //   57: getfield 23	com/crashlytics/android/SettingsController:c	Lcom/crashlytics/android/Z;
    //   60: aload 10
    //   62: invokevirtual 52	com/crashlytics/android/ap:a	(Lcom/crashlytics/android/Z;Lorg/json/JSONObject;)Lcom/crashlytics/android/ao;
    //   65: astore 6
    //   67: aload_0
    //   68: getfield 27	com/crashlytics/android/SettingsController:d	Lcom/crashlytics/android/m;
    //   71: aload 6
    //   73: invokevirtual 85	com/crashlytics/android/ao:a	()J
    //   76: aload 10
    //   78: invokevirtual 124	com/crashlytics/android/m:a	(JLorg/json/JSONObject;)V
    //   81: new 54	java/lang/StringBuilder
    //   84: dup
    //   85: ldc 126
    //   87: invokespecial 59	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   90: aload 10
    //   92: invokevirtual 65	org/json/JSONObject:toString	()Ljava/lang/String;
    //   95: invokevirtual 69	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   98: invokevirtual 70	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   101: invokestatic 74	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   104: aload 6
    //   106: astore_3
    //   107: aload_3
    //   108: ifnonnull +15 -> 123
    //   111: aload_0
    //   112: getstatic 82	com/crashlytics/android/SettingsController$CacheBehavior:IGNORE_CACHE_EXPIRATION	Lcom/crashlytics/android/SettingsController$CacheBehavior;
    //   115: invokespecial 116	com/crashlytics/android/SettingsController:b	(Lcom/crashlytics/android/SettingsController$CacheBehavior;)Lcom/crashlytics/android/ao;
    //   118: astore 8
    //   120: aload 8
    //   122: astore_3
    //   123: aload_3
    //   124: areturn
    //   125: astore_2
    //   126: aconst_null
    //   127: astore_3
    //   128: aload_2
    //   129: astore 4
    //   131: ldc 128
    //   133: aload 4
    //   135: invokestatic 94	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   138: aload_3
    //   139: areturn
    //   140: astore 9
    //   142: aload 6
    //   144: astore_3
    //   145: aload 9
    //   147: astore 4
    //   149: goto -18 -> 131
    //   152: astore 4
    //   154: goto -23 -> 131
    //
    // Exception table:
    //   from	to	target	type
    //   0	8	125	java/lang/Exception
    //   16	23	125	java/lang/Exception
    //   32	47	140	java/lang/Exception
    //   52	104	140	java/lang/Exception
    //   111	120	152	java/lang/Exception
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.SettingsController
 * JD-Core Version:    0.6.2
 */