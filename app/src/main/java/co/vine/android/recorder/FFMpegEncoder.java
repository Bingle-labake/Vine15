package co.vine.android.recorder;

public class FFMpegEncoder
  implements EncoderManager.Encoder
{
  // ERROR //
  public void transcode(EncoderManager.EncoderBoss paramEncoderBoss, java.lang.String paramString1, java.lang.String paramString2, java.util.ArrayList<java.lang.Integer> paramArrayList)
    throws EncoderManager.EncodingException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 5
    //   3: aconst_null
    //   4: astore 6
    //   6: getstatic 26	co/vine/android/recorder/VineFFmpegFrameRecorder:LOCK	[I
    //   9: astore 12
    //   11: aload 12
    //   13: monitorenter
    //   14: new 28	co/vine/android/recorder/VineFrameGrabber
    //   17: dup
    //   18: aload_2
    //   19: invokespecial 31	co/vine/android/recorder/VineFrameGrabber:<init>	(Ljava/lang/String;)V
    //   22: astore 13
    //   24: aload 13
    //   26: invokevirtual 34	co/vine/android/recorder/VineFrameGrabber:start	()V
    //   29: aload 13
    //   31: invokevirtual 38	co/vine/android/recorder/VineFrameGrabber:getPixelFormat	()I
    //   34: istore 16
    //   36: new 22	co/vine/android/recorder/VineFFmpegFrameRecorder
    //   39: dup
    //   40: aload_3
    //   41: aload 13
    //   43: invokevirtual 41	co/vine/android/recorder/VineFrameGrabber:getImageWidth	()I
    //   46: aload 13
    //   48: invokevirtual 44	co/vine/android/recorder/VineFrameGrabber:getImageHeight	()I
    //   51: aload 13
    //   53: invokevirtual 47	co/vine/android/recorder/VineFrameGrabber:getAudioChannels	()I
    //   56: invokespecial 50	co/vine/android/recorder/VineFFmpegFrameRecorder:<init>	(Ljava/lang/String;III)V
    //   59: astore 17
    //   61: aload 17
    //   63: bipush 28
    //   65: invokevirtual 54	co/vine/android/recorder/VineFFmpegFrameRecorder:setVideoCodec	(I)V
    //   68: aload 17
    //   70: ldc 55
    //   72: invokevirtual 58	co/vine/android/recorder/VineFFmpegFrameRecorder:setAudioCodec	(I)V
    //   75: aload 17
    //   77: ldc 60
    //   79: invokevirtual 63	co/vine/android/recorder/VineFFmpegFrameRecorder:setFormat	(Ljava/lang/String;)V
    //   82: aload 17
    //   84: aload 13
    //   86: invokevirtual 67	co/vine/android/recorder/VineFrameGrabber:getFrameRate	()D
    //   89: invokevirtual 71	co/vine/android/recorder/VineFFmpegFrameRecorder:setFrameRate	(D)V
    //   92: aload 17
    //   94: aload 13
    //   96: invokevirtual 74	co/vine/android/recorder/VineFrameGrabber:getSampleFormat	()I
    //   99: invokevirtual 77	co/vine/android/recorder/VineFFmpegFrameRecorder:setSampleFormat	(I)V
    //   102: aload 17
    //   104: aload 13
    //   106: invokevirtual 80	co/vine/android/recorder/VineFrameGrabber:getSampleRate	()I
    //   109: invokevirtual 83	co/vine/android/recorder/VineFFmpegFrameRecorder:setSampleRate	(I)V
    //   112: aload 17
    //   114: invokevirtual 84	co/vine/android/recorder/VineFFmpegFrameRecorder:start	()V
    //   117: aload 13
    //   119: invokevirtual 87	co/vine/android/recorder/VineFrameGrabber:getLengthInFrames	()I
    //   122: istore 20
    //   124: ldc 89
    //   126: aload 13
    //   128: invokevirtual 93	co/vine/android/recorder/VineFrameGrabber:getLengthInTime	()J
    //   131: invokestatic 99	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   134: invokestatic 105	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   137: ldc 107
    //   139: iload 20
    //   141: invokestatic 112	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   144: iload 16
    //   146: invokestatic 112	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   149: aload 17
    //   151: invokevirtual 115	co/vine/android/recorder/VineFFmpegFrameRecorder:getVideoCodecPixFormat	()I
    //   154: invokestatic 112	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   157: invokestatic 118	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    //   160: aload 12
    //   162: monitorexit
    //   163: iconst_0
    //   164: istore 21
    //   166: aload 13
    //   168: invokevirtual 122	co/vine/android/recorder/VineFrameGrabber:grabFrame	()Lcom/googlecode/javacv/Frame;
    //   171: astore 22
    //   173: aload 22
    //   175: ifnull +63 -> 238
    //   178: ldc 124
    //   180: iload 21
    //   182: invokestatic 112	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   185: invokestatic 105	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   188: aload 22
    //   190: getfield 130	com/googlecode/javacv/Frame:image	Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    //   193: ifnull +29 -> 222
    //   196: aload 4
    //   198: ifnull +290 -> 488
    //   201: aload 17
    //   203: aload 4
    //   205: iload 21
    //   207: invokevirtual 136	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   210: checkcast 109	java/lang/Integer
    //   213: invokevirtual 139	java/lang/Integer:intValue	()I
    //   216: invokevirtual 142	co/vine/android/recorder/VineFFmpegFrameRecorder:setFrameNumber	(I)V
    //   219: goto +269 -> 488
    //   222: aload 17
    //   224: aload 22
    //   226: invokevirtual 146	co/vine/android/recorder/VineFFmpegFrameRecorder:record	(Lcom/googlecode/javacv/Frame;)V
    //   229: aload_1
    //   230: invokeinterface 152 1 0
    //   235: ifeq +180 -> 415
    //   238: aload_1
    //   239: iconst_0
    //   240: invokeinterface 155 2 0
    //   245: getstatic 26	co/vine/android/recorder/VineFFmpegFrameRecorder:LOCK	[I
    //   248: astore 23
    //   250: aload 23
    //   252: monitorenter
    //   253: aload 17
    //   255: ifnull +13 -> 268
    //   258: aload 17
    //   260: invokevirtual 158	co/vine/android/recorder/VineFFmpegFrameRecorder:stop	()V
    //   263: aload 17
    //   265: invokevirtual 161	co/vine/android/recorder/VineFFmpegFrameRecorder:release	()V
    //   268: aload 13
    //   270: ifnull +13 -> 283
    //   273: aload 13
    //   275: invokevirtual 162	co/vine/android/recorder/VineFrameGrabber:stop	()V
    //   278: aload 13
    //   280: invokevirtual 163	co/vine/android/recorder/VineFrameGrabber:release	()V
    //   283: aload 23
    //   285: monitorexit
    //   286: return
    //   287: astore 15
    //   289: new 14	co/vine/android/recorder/EncoderManager$EncodingException
    //   292: dup
    //   293: aload 15
    //   295: invokespecial 166	co/vine/android/recorder/EncoderManager$EncodingException:<init>	(Ljava/lang/Exception;)V
    //   298: athrow
    //   299: astore 14
    //   301: aload 13
    //   303: astore 5
    //   305: aload 12
    //   307: monitorexit
    //   308: aload 14
    //   310: athrow
    //   311: astore 11
    //   313: new 14	co/vine/android/recorder/EncoderManager$EncodingException
    //   316: dup
    //   317: aload 11
    //   319: invokespecial 166	co/vine/android/recorder/EncoderManager$EncodingException:<init>	(Ljava/lang/Exception;)V
    //   322: athrow
    //   323: astore 7
    //   325: getstatic 26	co/vine/android/recorder/VineFFmpegFrameRecorder:LOCK	[I
    //   328: astore 9
    //   330: aload 9
    //   332: monitorenter
    //   333: aload 6
    //   335: ifnull +13 -> 348
    //   338: aload 6
    //   340: invokevirtual 158	co/vine/android/recorder/VineFFmpegFrameRecorder:stop	()V
    //   343: aload 6
    //   345: invokevirtual 161	co/vine/android/recorder/VineFFmpegFrameRecorder:release	()V
    //   348: aload 5
    //   350: ifnull +13 -> 363
    //   353: aload 5
    //   355: invokevirtual 162	co/vine/android/recorder/VineFrameGrabber:stop	()V
    //   358: aload 5
    //   360: invokevirtual 163	co/vine/android/recorder/VineFrameGrabber:release	()V
    //   363: aload 9
    //   365: monitorexit
    //   366: aload 7
    //   368: athrow
    //   369: astore 8
    //   371: new 14	co/vine/android/recorder/EncoderManager$EncodingException
    //   374: dup
    //   375: aload 8
    //   377: invokespecial 166	co/vine/android/recorder/EncoderManager$EncodingException:<init>	(Ljava/lang/Exception;)V
    //   380: athrow
    //   381: astore 18
    //   383: aload 13
    //   385: invokevirtual 162	co/vine/android/recorder/VineFrameGrabber:stop	()V
    //   388: aload 13
    //   390: invokevirtual 163	co/vine/android/recorder/VineFrameGrabber:release	()V
    //   393: new 14	co/vine/android/recorder/EncoderManager$EncodingException
    //   396: dup
    //   397: aload 18
    //   399: invokespecial 166	co/vine/android/recorder/EncoderManager$EncodingException:<init>	(Ljava/lang/Exception;)V
    //   402: athrow
    //   403: astore 19
    //   405: new 14	co/vine/android/recorder/EncoderManager$EncodingException
    //   408: dup
    //   409: aload 19
    //   411: invokespecial 166	co/vine/android/recorder/EncoderManager$EncodingException:<init>	(Ljava/lang/Exception;)V
    //   414: athrow
    //   415: iload 21
    //   417: bipush 100
    //   419: imul
    //   420: istore 25
    //   422: aload_1
    //   423: iload 25
    //   425: iload 20
    //   427: idiv
    //   428: invokeinterface 169 2 0
    //   433: goto -267 -> 166
    //   436: astore 11
    //   438: aload 17
    //   440: astore 6
    //   442: aload 13
    //   444: astore 5
    //   446: goto -133 -> 313
    //   449: astore 24
    //   451: aload 23
    //   453: monitorexit
    //   454: aload 24
    //   456: athrow
    //   457: astore 8
    //   459: goto -88 -> 371
    //   462: astore 10
    //   464: aload 9
    //   466: monitorexit
    //   467: aload 10
    //   469: athrow
    //   470: astore 7
    //   472: aload 17
    //   474: astore 6
    //   476: aload 13
    //   478: astore 5
    //   480: goto -155 -> 325
    //   483: astore 14
    //   485: goto -180 -> 305
    //   488: iinc 21 1
    //   491: goto -269 -> 222
    //   494: astore 14
    //   496: aload 17
    //   498: astore 6
    //   500: aload 13
    //   502: astore 5
    //   504: goto -199 -> 305
    //
    // Exception table:
    //   from	to	target	type
    //   24	29	287	co/vine/android/recorder/VineFrameGrabber$Exception
    //   24	29	299	finally
    //   29	61	299	finally
    //   289	299	299	finally
    //   6	14	311	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   6	14	311	co/vine/android/recorder/VineFrameGrabber$Exception
    //   308	311	311	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   308	311	311	co/vine/android/recorder/VineFrameGrabber$Exception
    //   6	14	323	finally
    //   308	311	323	finally
    //   313	323	323	finally
    //   325	333	369	java/lang/Exception
    //   366	369	369	java/lang/Exception
    //   467	470	369	java/lang/Exception
    //   112	117	381	java/lang/Exception
    //   383	393	403	co/vine/android/recorder/VineFrameGrabber$Exception
    //   166	173	436	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   166	173	436	co/vine/android/recorder/VineFrameGrabber$Exception
    //   178	196	436	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   178	196	436	co/vine/android/recorder/VineFrameGrabber$Exception
    //   201	219	436	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   201	219	436	co/vine/android/recorder/VineFrameGrabber$Exception
    //   222	238	436	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   222	238	436	co/vine/android/recorder/VineFrameGrabber$Exception
    //   238	245	436	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   238	245	436	co/vine/android/recorder/VineFrameGrabber$Exception
    //   422	433	436	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   422	433	436	co/vine/android/recorder/VineFrameGrabber$Exception
    //   258	268	449	finally
    //   273	283	449	finally
    //   283	286	449	finally
    //   451	454	449	finally
    //   245	253	457	java/lang/Exception
    //   454	457	457	java/lang/Exception
    //   338	348	462	finally
    //   353	363	462	finally
    //   363	366	462	finally
    //   464	467	462	finally
    //   166	173	470	finally
    //   178	196	470	finally
    //   201	219	470	finally
    //   222	238	470	finally
    //   238	245	470	finally
    //   422	433	470	finally
    //   14	24	483	finally
    //   305	308	483	finally
    //   61	112	494	finally
    //   112	117	494	finally
    //   117	163	494	finally
    //   383	393	494	finally
    //   393	403	494	finally
    //   405	415	494	finally
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.FFMpegEncoder
 * JD-Core Version:    0.6.2
 */