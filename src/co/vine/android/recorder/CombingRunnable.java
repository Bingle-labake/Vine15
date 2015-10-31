package co.vine.android.recorder;

import android.graphics.Bitmap;
import com.googlecode.javacv.cpp.opencv_core.IplImage;
import java.io.File;
import java.util.ArrayList;

public class CombingRunnable
  implements Runnable
{
  private int errorCount = 0;
  private boolean hasLoggedException;
  private final VineRecorder.FinishProcessTask mAsyncTask;
  private final short[] mAudioArray;
  private Bitmap mBitmap;
  private final File mFolder;
  private final ArrayList<Integer> mFrameNumbers;
  private String mLastFrameOnlyModePath = null;
  private ArrayList<RecordSegment> mSegments;
  private boolean mSingleSegment;
  private opencv_core.IplImage mTempFrame;
  private String mThumbnailPath;
  private long mTimeOffset;
  private final byte[] mVideoArray;
  private String mVideoPath;
  private final VineFFmpegFrameRecorder mVideoRecorder;

  public CombingRunnable(RecordingFile paramRecordingFile, RecordSegment paramRecordSegment, VineFFmpegFrameRecorder paramVineFFmpegFrameRecorder, VineRecorder.FinishProcessTask paramFinishProcessTask, Bitmap paramBitmap, opencv_core.IplImage paramIplImage, boolean paramBoolean)
  {
    this(paramRecordingFile, true, paramRecordingFile.getSession().getAudioData(), paramRecordingFile.getSession().getVideoData(), paramVineFFmpegFrameRecorder, paramFinishProcessTask, paramBitmap, paramIplImage);
    this.mSegments = new ArrayList();
    this.mSegments.add(paramRecordSegment);
    this.mSingleSegment = true;
    this.mVideoPath = paramRecordingFile.getSegmentVideoPath();
    paramRecordSegment.videoPath = this.mVideoPath;
    this.mThumbnailPath = paramRecordingFile.getSegmentThumbnailPath();
    if (paramBoolean)
      this.mLastFrameOnlyModePath = paramRecordingFile.getPreviewThumbnailPath();
  }

  private CombingRunnable(RecordingFile paramRecordingFile, boolean paramBoolean, short[] paramArrayOfShort, byte[] paramArrayOfByte, VineFFmpegFrameRecorder paramVineFFmpegFrameRecorder, VineRecorder.FinishProcessTask paramFinishProcessTask, Bitmap paramBitmap, opencv_core.IplImage paramIplImage)
  {
    this.mAudioArray = paramArrayOfShort;
    this.mVideoArray = paramArrayOfByte;
    this.mBitmap = paramBitmap;
    this.mTempFrame = paramIplImage;
    this.mFolder = paramRecordingFile.folder;
    if (!paramBoolean);
    for (this.mFrameNumbers = new ArrayList(); ; this.mFrameNumbers = null)
    {
      this.mVideoRecorder = paramVineFFmpegFrameRecorder;
      this.mTimeOffset = 0L;
      this.mAsyncTask = paramFinishProcessTask;
      return;
    }
  }

  public CombingRunnable(RecordingFile paramRecordingFile, boolean paramBoolean, short[] paramArrayOfShort, byte[] paramArrayOfByte, ArrayList<RecordSegment> paramArrayList, VineFFmpegFrameRecorder paramVineFFmpegFrameRecorder, VineRecorder.FinishProcessTask paramFinishProcessTask, Bitmap paramBitmap, opencv_core.IplImage paramIplImage)
  {
    this(paramRecordingFile, paramBoolean, paramArrayOfShort, paramArrayOfByte, paramVineFFmpegFrameRecorder, paramFinishProcessTask, paramBitmap, paramIplImage);
    this.mSegments = paramArrayList;
    String str1;
    if (paramBoolean)
    {
      str1 = paramRecordingFile.getPreviewVideoPath();
      this.mVideoPath = str1;
      if (!paramBoolean)
        break label65;
    }
    label65: for (String str2 = paramRecordingFile.getPreviewThumbnailPath(); ; str2 = paramRecordingFile.getThumbnailPath())
    {
      this.mThumbnailPath = str2;
      return;
      str1 = paramRecordingFile.getVideoPath();
      break;
    }
  }

  // ERROR //
  public void run()
  {
    // Byte code:
    //   0: bipush 248
    //   2: invokestatic 142	android/os/Process:setThreadPriority	(I)V
    //   5: aload_0
    //   6: getfield 64	co/vine/android/recorder/CombingRunnable:mSegments	Ljava/util/ArrayList;
    //   9: astore_1
    //   10: aload_1
    //   11: invokevirtual 146	java/util/ArrayList:size	()I
    //   14: istore_2
    //   15: lconst_0
    //   16: lstore_3
    //   17: lconst_0
    //   18: lstore 5
    //   20: iconst_0
    //   21: istore 7
    //   23: ldc 148
    //   25: iload_2
    //   26: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   29: invokestatic 160	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   32: lconst_0
    //   33: lstore 8
    //   35: lconst_0
    //   36: lstore 10
    //   38: iload_2
    //   39: ifle +1020 -> 1059
    //   42: aload_0
    //   43: getfield 96	co/vine/android/recorder/CombingRunnable:mAudioArray	[S
    //   46: astore 12
    //   48: iconst_0
    //   49: istore 13
    //   51: iload 13
    //   53: iload_2
    //   54: if_icmpge +711 -> 765
    //   57: aload_1
    //   58: iload 13
    //   60: invokevirtual 164	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   63: checkcast 78	co/vine/android/recorder/RecordSegment
    //   66: astore 33
    //   68: invokestatic 170	java/lang/System:currentTimeMillis	()J
    //   71: lstore 34
    //   73: aload 33
    //   75: invokevirtual 174	co/vine/android/recorder/RecordSegment:getCombinedAudioData	()Lco/vine/android/recorder/AudioData;
    //   78: astore 36
    //   80: aload 36
    //   82: getfield 178	co/vine/android/recorder/AudioData:size	I
    //   85: ifle +89 -> 174
    //   88: aload 12
    //   90: aload 36
    //   92: getfield 181	co/vine/android/recorder/AudioData:start	I
    //   95: aload 36
    //   97: getfield 178	co/vine/android/recorder/AudioData:size	I
    //   100: invokestatic 187	java/nio/ShortBuffer:wrap	([SII)Ljava/nio/ShortBuffer;
    //   103: astore 59
    //   105: aload_0
    //   106: getfield 70	co/vine/android/recorder/CombingRunnable:mSingleSegment	Z
    //   109: ifeq +182 -> 291
    //   112: aload 36
    //   114: getfield 178	co/vine/android/recorder/AudioData:size	I
    //   117: newarray short
    //   119: astore 62
    //   121: aload 59
    //   123: aload 62
    //   125: invokevirtual 190	java/nio/ShortBuffer:get	([S)Ljava/nio/ShortBuffer;
    //   128: pop
    //   129: aload 62
    //   131: invokestatic 192	java/nio/ShortBuffer:wrap	([S)Ljava/nio/ShortBuffer;
    //   134: astore 60
    //   136: ldc 194
    //   138: aload 36
    //   140: getfield 181	co/vine/android/recorder/AudioData:start	I
    //   143: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   146: aload 36
    //   148: getfield 178	co/vine/android/recorder/AudioData:size	I
    //   151: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   154: invokestatic 197	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   157: aload_0
    //   158: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   161: iconst_1
    //   162: anewarray 199	java/nio/Buffer
    //   165: dup
    //   166: iconst_0
    //   167: aload 60
    //   169: aastore
    //   170: invokevirtual 205	co/vine/android/recorder/VineFFmpegFrameRecorder:record	([Ljava/nio/Buffer;)Z
    //   173: pop
    //   174: lload 5
    //   176: invokestatic 170	java/lang/System:currentTimeMillis	()J
    //   179: lload 34
    //   181: lsub
    //   182: ladd
    //   183: lstore 5
    //   185: aload 33
    //   187: invokevirtual 208	co/vine/android/recorder/RecordSegment:getVideoData	()Ljava/util/ArrayList;
    //   190: astore 38
    //   192: aload_0
    //   193: getfield 98	co/vine/android/recorder/CombingRunnable:mVideoArray	[B
    //   196: astore 39
    //   198: invokestatic 170	java/lang/System:currentTimeMillis	()J
    //   201: lstore 40
    //   203: aload 33
    //   205: invokevirtual 212	co/vine/android/recorder/RecordSegment:getCameraSetting	()Lco/vine/android/recorder/CameraSetting;
    //   208: getfield 217	co/vine/android/recorder/CameraSetting:frameRate	I
    //   211: istore 42
    //   213: aload 38
    //   215: invokevirtual 146	java/util/ArrayList:size	()I
    //   218: istore 43
    //   220: lconst_0
    //   221: lstore 44
    //   223: iconst_0
    //   224: istore 46
    //   226: iload 46
    //   228: iload 43
    //   230: if_icmpge +431 -> 661
    //   233: aload 38
    //   235: iload 46
    //   237: invokevirtual 164	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   240: checkcast 219	co/vine/android/recorder/VideoData
    //   243: astore 47
    //   245: aload_0
    //   246: getfield 70	co/vine/android/recorder/CombingRunnable:mSingleSegment	Z
    //   249: ifeq +28 -> 277
    //   252: iload 46
    //   254: ifne +10 -> 264
    //   257: aload 47
    //   259: getfield 222	co/vine/android/recorder/VideoData:timestamp	J
    //   262: lstore 44
    //   264: aload 47
    //   266: aload 47
    //   268: getfield 222	co/vine/android/recorder/VideoData:timestamp	J
    //   271: lload 44
    //   273: lsub
    //   274: putfield 222	co/vine/android/recorder/VideoData:timestamp	J
    //   277: aload 47
    //   279: getfield 223	co/vine/android/recorder/VideoData:size	I
    //   282: ifge +44 -> 326
    //   285: iinc 46 1
    //   288: goto -62 -> 226
    //   291: aload 59
    //   293: astore 60
    //   295: goto -159 -> 136
    //   298: astore 37
    //   300: aload_0
    //   301: getfield 225	co/vine/android/recorder/CombingRunnable:hasLoggedException	Z
    //   304: ifeq +9 -> 313
    //   307: getstatic 228	com/edisonwang/android/slog/SLog:sLogsOn	Z
    //   310: ifeq -136 -> 174
    //   313: aload_0
    //   314: iconst_1
    //   315: putfield 225	co/vine/android/recorder/CombingRunnable:hasLoggedException	Z
    //   318: aload 37
    //   320: invokestatic 234	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;)V
    //   323: goto -149 -> 174
    //   326: aload_0
    //   327: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   330: iload 42
    //   332: i2d
    //   333: invokevirtual 238	co/vine/android/recorder/VineFFmpegFrameRecorder:setFrameRate	(D)V
    //   336: aload 47
    //   338: getfield 222	co/vine/android/recorder/VideoData:timestamp	J
    //   341: lconst_0
    //   342: lcmp
    //   343: ifne +14 -> 357
    //   346: aload_0
    //   347: aload_0
    //   348: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   351: invokevirtual 241	co/vine/android/recorder/VineFFmpegFrameRecorder:getTimestamp	()J
    //   354: putfield 113	co/vine/android/recorder/CombingRunnable:mTimeOffset	J
    //   357: aload 47
    //   359: getfield 222	co/vine/android/recorder/VideoData:timestamp	J
    //   362: aload_0
    //   363: getfield 113	co/vine/android/recorder/CombingRunnable:mTimeOffset	J
    //   366: ladd
    //   367: lstore 48
    //   369: aload_0
    //   370: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   373: invokevirtual 244	co/vine/android/recorder/VineFFmpegFrameRecorder:getFrameNumber	()I
    //   376: istore 50
    //   378: aload_0
    //   379: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   382: invokevirtual 241	co/vine/android/recorder/VineFFmpegFrameRecorder:getTimestamp	()J
    //   385: lstore 51
    //   387: lload 48
    //   389: lload 51
    //   391: lsub
    //   392: ldc 245
    //   394: iload 42
    //   396: idiv
    //   397: i2l
    //   398: lcmp
    //   399: ifle +80 -> 479
    //   402: ldc 247
    //   404: invokestatic 250	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   407: aload_0
    //   408: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   411: lload 48
    //   413: invokevirtual 254	co/vine/android/recorder/VineFFmpegFrameRecorder:setTimestampAndGetFrameNumber	(J)I
    //   416: istore 50
    //   418: aload_0
    //   419: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   422: aload 39
    //   424: aload 47
    //   426: getfield 255	co/vine/android/recorder/VideoData:start	I
    //   429: aload 47
    //   431: getfield 223	co/vine/android/recorder/VideoData:size	I
    //   434: invokevirtual 259	co/vine/android/recorder/VineFFmpegFrameRecorder:writeEncodedImage	([BII)V
    //   437: iinc 7 1
    //   440: ldc_w 261
    //   443: lload 48
    //   445: invokestatic 266	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   448: iload 50
    //   450: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   453: invokestatic 197	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   456: aload_0
    //   457: getfield 109	co/vine/android/recorder/CombingRunnable:mFrameNumbers	Ljava/util/ArrayList;
    //   460: ifnull -175 -> 285
    //   463: aload_0
    //   464: getfield 109	co/vine/android/recorder/CombingRunnable:mFrameNumbers	Ljava/util/ArrayList;
    //   467: iload 50
    //   469: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   472: invokevirtual 68	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   475: pop
    //   476: goto -191 -> 285
    //   479: lload 51
    //   481: lstore 48
    //   483: goto -65 -> 418
    //   486: astore 53
    //   488: ldc_w 268
    //   491: lload 48
    //   493: invokestatic 266	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   496: iload 50
    //   498: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   501: invokestatic 271	com/edisonwang/android/slog/SLog:e	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   504: aload_0
    //   505: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   508: aload 39
    //   510: aload 47
    //   512: getfield 255	co/vine/android/recorder/VideoData:start	I
    //   515: aload 47
    //   517: getfield 223	co/vine/android/recorder/VideoData:size	I
    //   520: invokevirtual 259	co/vine/android/recorder/VineFFmpegFrameRecorder:writeEncodedImage	([BII)V
    //   523: iinc 7 1
    //   526: ldc_w 273
    //   529: iload 50
    //   531: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   534: invokestatic 160	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   537: goto -81 -> 456
    //   540: astore 54
    //   542: ldc_w 275
    //   545: iload 50
    //   547: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   550: invokestatic 277	com/edisonwang/android/slog/SLog:e	(Ljava/lang/String;Ljava/lang/Object;)V
    //   553: lload 48
    //   555: ldc2_w 278
    //   558: iload 42
    //   560: i2l
    //   561: ldiv
    //   562: ladd
    //   563: lstore 55
    //   565: lload 55
    //   567: iload 42
    //   569: i2l
    //   570: lmul
    //   571: ldc2_w 278
    //   574: ldiv
    //   575: l2f
    //   576: invokestatic 285	java/lang/Math:round	(F)I
    //   579: istore 50
    //   581: aload_0
    //   582: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   585: lload 55
    //   587: invokevirtual 289	co/vine/android/recorder/VineFFmpegFrameRecorder:setTimestamp	(J)V
    //   590: aload 47
    //   592: lload 55
    //   594: putfield 222	co/vine/android/recorder/VideoData:timestamp	J
    //   597: aload_0
    //   598: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   601: aload 39
    //   603: aload 47
    //   605: getfield 255	co/vine/android/recorder/VideoData:start	I
    //   608: aload 47
    //   610: getfield 223	co/vine/android/recorder/VideoData:size	I
    //   613: invokevirtual 259	co/vine/android/recorder/VineFFmpegFrameRecorder:writeEncodedImage	([BII)V
    //   616: iinc 7 1
    //   619: ldc_w 291
    //   622: iload 50
    //   624: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   627: invokestatic 160	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   630: goto -174 -> 456
    //   633: astore 57
    //   635: aload_0
    //   636: iconst_1
    //   637: aload_0
    //   638: getfield 94	co/vine/android/recorder/CombingRunnable:errorCount	I
    //   641: iadd
    //   642: putfield 94	co/vine/android/recorder/CombingRunnable:errorCount	I
    //   645: ldc_w 293
    //   648: aload_0
    //   649: getfield 94	co/vine/android/recorder/CombingRunnable:errorCount	I
    //   652: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   655: invokestatic 277	com/edisonwang/android/slog/SLog:e	(Ljava/lang/String;Ljava/lang/Object;)V
    //   658: goto -202 -> 456
    //   661: lload_3
    //   662: invokestatic 170	java/lang/System:currentTimeMillis	()J
    //   665: lload 40
    //   667: lsub
    //   668: ladd
    //   669: lstore_3
    //   670: aload_0
    //   671: getfield 115	co/vine/android/recorder/CombingRunnable:mAsyncTask	Lco/vine/android/recorder/VineRecorder$FinishProcessTask;
    //   674: ifnull +20 -> 694
    //   677: aload_0
    //   678: getfield 115	co/vine/android/recorder/CombingRunnable:mAsyncTask	Lco/vine/android/recorder/VineRecorder$FinishProcessTask;
    //   681: bipush 90
    //   683: iload 13
    //   685: bipush 10
    //   687: imul
    //   688: iload_2
    //   689: idiv
    //   690: iadd
    //   691: invokevirtual 298	co/vine/android/recorder/VineRecorder$FinishProcessTask:publish	(I)V
    //   694: getstatic 228	com/edisonwang/android/slog/SLog:sLogsOn	Z
    //   697: ifeq +62 -> 759
    //   700: lload 10
    //   702: aload 36
    //   704: invokevirtual 301	co/vine/android/recorder/AudioData:getDurationNs	()J
    //   707: ldc2_w 278
    //   710: ldiv
    //   711: ladd
    //   712: lstore 10
    //   714: lload 8
    //   716: iload 43
    //   718: sipush 1000
    //   721: iload 42
    //   723: idiv
    //   724: imul
    //   725: i2l
    //   726: ladd
    //   727: lstore 8
    //   729: ldc_w 303
    //   732: aload 36
    //   734: invokevirtual 301	co/vine/android/recorder/AudioData:getDurationNs	()J
    //   737: ldc2_w 278
    //   740: ldiv
    //   741: invokestatic 266	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   744: iload 43
    //   746: sipush 1000
    //   749: iload 42
    //   751: idiv
    //   752: imul
    //   753: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   756: invokestatic 197	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   759: iinc 13 1
    //   762: goto -711 -> 51
    //   765: ldc_w 305
    //   768: lload 10
    //   770: invokestatic 266	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   773: lload 8
    //   775: invokestatic 266	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   778: invokestatic 197	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   781: aload_0
    //   782: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   785: invokevirtual 308	co/vine/android/recorder/VineFFmpegFrameRecorder:stop	()V
    //   788: new 310	java/io/File
    //   791: dup
    //   792: aload_0
    //   793: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   796: invokevirtual 313	co/vine/android/recorder/VineFFmpegFrameRecorder:getFilename	()Ljava/lang/String;
    //   799: invokespecial 315	java/io/File:<init>	(Ljava/lang/String;)V
    //   802: new 310	java/io/File
    //   805: dup
    //   806: aload_0
    //   807: getfield 76	co/vine/android/recorder/CombingRunnable:mVideoPath	Ljava/lang/String;
    //   810: invokespecial 315	java/io/File:<init>	(Ljava/lang/String;)V
    //   813: invokevirtual 319	java/io/File:renameTo	(Ljava/io/File;)Z
    //   816: pop
    //   817: aload_0
    //   818: getfield 86	co/vine/android/recorder/CombingRunnable:mThumbnailPath	Ljava/lang/String;
    //   821: ifnull +220 -> 1041
    //   824: aload_0
    //   825: getfield 111	co/vine/android/recorder/CombingRunnable:mVideoRecorder	Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    //   828: invokevirtual 323	co/vine/android/recorder/VineFFmpegFrameRecorder:hasData	()Z
    //   831: ifeq +210 -> 1041
    //   834: new 325	co/vine/android/recorder/VineFrameGrabber
    //   837: dup
    //   838: aload_0
    //   839: getfield 76	co/vine/android/recorder/CombingRunnable:mVideoPath	Ljava/lang/String;
    //   842: invokespecial 326	co/vine/android/recorder/VineFrameGrabber:<init>	(Ljava/lang/String;)V
    //   845: astore 19
    //   847: aload 19
    //   849: invokevirtual 328	co/vine/android/recorder/VineFrameGrabber:start	()V
    //   852: iconst_0
    //   853: istore 20
    //   855: aload 19
    //   857: invokevirtual 332	co/vine/android/recorder/VineFrameGrabber:grab	()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    //   860: astore 21
    //   862: aload 21
    //   864: ifnull +86 -> 950
    //   867: iinc 20 1
    //   870: iload 20
    //   872: iconst_2
    //   873: if_icmpeq +9 -> 882
    //   876: iload 7
    //   878: iconst_1
    //   879: if_icmpne +57 -> 936
    //   882: aload 21
    //   884: aload_0
    //   885: getfield 102	co/vine/android/recorder/CombingRunnable:mTempFrame	Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    //   888: iconst_2
    //   889: invokestatic 338	com/googlecode/javacv/cpp/opencv_imgproc:cvCvtColor	(Lcom/googlecode/javacv/cpp/opencv_core$CvArr;Lcom/googlecode/javacv/cpp/opencv_core$CvArr;I)V
    //   892: aload_0
    //   893: getfield 100	co/vine/android/recorder/CombingRunnable:mBitmap	Landroid/graphics/Bitmap;
    //   896: aload_0
    //   897: getfield 102	co/vine/android/recorder/CombingRunnable:mTempFrame	Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    //   900: invokevirtual 344	com/googlecode/javacv/cpp/opencv_core$IplImage:getByteBuffer	()Ljava/nio/ByteBuffer;
    //   903: invokevirtual 350	android/graphics/Bitmap:copyPixelsFromBuffer	(Ljava/nio/Buffer;)V
    //   906: aload_0
    //   907: getfield 100	co/vine/android/recorder/CombingRunnable:mBitmap	Landroid/graphics/Bitmap;
    //   910: getstatic 356	android/graphics/Bitmap$CompressFormat:JPEG	Landroid/graphics/Bitmap$CompressFormat;
    //   913: bipush 75
    //   915: new 358	java/io/FileOutputStream
    //   918: dup
    //   919: aload_0
    //   920: getfield 86	co/vine/android/recorder/CombingRunnable:mThumbnailPath	Ljava/lang/String;
    //   923: invokespecial 359	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   926: invokevirtual 363	android/graphics/Bitmap:compress	(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    //   929: pop
    //   930: ldc_w 365
    //   933: invokestatic 368	com/edisonwang/android/slog/SLog:i	(Ljava/lang/String;)V
    //   936: aload_0
    //   937: getfield 70	co/vine/android/recorder/CombingRunnable:mSingleSegment	Z
    //   940: ifeq +168 -> 1108
    //   943: aload_0
    //   944: getfield 91	co/vine/android/recorder/CombingRunnable:mLastFrameOnlyModePath	Ljava/lang/String;
    //   947: ifnonnull +161 -> 1108
    //   950: aload 19
    //   952: invokevirtual 369	co/vine/android/recorder/VineFrameGrabber:stop	()V
    //   955: aload 19
    //   957: invokevirtual 372	co/vine/android/recorder/VineFrameGrabber:release	()V
    //   960: new 310	java/io/File
    //   963: dup
    //   964: aload_0
    //   965: getfield 86	co/vine/android/recorder/CombingRunnable:mThumbnailPath	Ljava/lang/String;
    //   968: invokespecial 315	java/io/File:<init>	(Ljava/lang/String;)V
    //   971: invokevirtual 375	java/io/File:exists	()Z
    //   974: ifne +67 -> 1041
    //   977: ldc_w 377
    //   980: invokestatic 380	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;)V
    //   983: aload_0
    //   984: getfield 76	co/vine/android/recorder/CombingRunnable:mVideoPath	Ljava/lang/String;
    //   987: iconst_1
    //   988: newarray long
    //   990: dup
    //   991: iconst_0
    //   992: lconst_0
    //   993: lastore
    //   994: invokestatic 386	co/vine/android/util/MediaUtil:getVideoFrames	(Ljava/lang/String;[J)[Landroid/graphics/Bitmap;
    //   997: astore 23
    //   999: aload 23
    //   1001: ifnull +254 -> 1255
    //   1004: aload 23
    //   1006: arraylength
    //   1007: iconst_1
    //   1008: if_icmpne +247 -> 1255
    //   1011: aload 23
    //   1013: iconst_0
    //   1014: aaload
    //   1015: getstatic 356	android/graphics/Bitmap$CompressFormat:JPEG	Landroid/graphics/Bitmap$CompressFormat;
    //   1018: bipush 75
    //   1020: new 358	java/io/FileOutputStream
    //   1023: dup
    //   1024: aload_0
    //   1025: getfield 86	co/vine/android/recorder/CombingRunnable:mThumbnailPath	Ljava/lang/String;
    //   1028: invokespecial 359	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   1031: invokevirtual 363	android/graphics/Bitmap:compress	(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    //   1034: pop
    //   1035: ldc_w 365
    //   1038: invokestatic 368	com/edisonwang/android/slog/SLog:i	(Ljava/lang/String;)V
    //   1041: aload_0
    //   1042: getfield 109	co/vine/android/recorder/CombingRunnable:mFrameNumbers	Ljava/util/ArrayList;
    //   1045: ifnull +14 -> 1059
    //   1048: aload_0
    //   1049: getfield 107	co/vine/android/recorder/CombingRunnable:mFolder	Ljava/io/File;
    //   1052: aload_0
    //   1053: getfield 109	co/vine/android/recorder/CombingRunnable:mFrameNumbers	Ljava/util/ArrayList;
    //   1056: invokestatic 392	co/vine/android/recorder/RecordSessionManager:writeFrameInfo	(Ljava/io/File;Ljava/util/ArrayList;)V
    //   1059: aload_0
    //   1060: getfield 115	co/vine/android/recorder/CombingRunnable:mAsyncTask	Lco/vine/android/recorder/VineRecorder$FinishProcessTask;
    //   1063: ifnull +12 -> 1075
    //   1066: aload_0
    //   1067: getfield 115	co/vine/android/recorder/CombingRunnable:mAsyncTask	Lco/vine/android/recorder/VineRecorder$FinishProcessTask;
    //   1070: bipush 99
    //   1072: invokevirtual 298	co/vine/android/recorder/VineRecorder$FinishProcessTask:publish	(I)V
    //   1075: ldc_w 394
    //   1078: aload_0
    //   1079: getfield 94	co/vine/android/recorder/CombingRunnable:errorCount	I
    //   1082: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1085: invokestatic 160	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   1088: ldc_w 396
    //   1091: lload_3
    //   1092: invokestatic 266	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   1095: lload 5
    //   1097: invokestatic 266	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   1100: iload_2
    //   1101: invokestatic 154	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1104: invokestatic 399	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    //   1107: return
    //   1108: iload 7
    //   1110: iload 20
    //   1112: if_icmpgt -257 -> 855
    //   1115: iload 20
    //   1117: iconst_1
    //   1118: if_icmpeq -263 -> 855
    //   1121: aload 21
    //   1123: aload_0
    //   1124: getfield 102	co/vine/android/recorder/CombingRunnable:mTempFrame	Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    //   1127: iconst_2
    //   1128: invokestatic 338	com/googlecode/javacv/cpp/opencv_imgproc:cvCvtColor	(Lcom/googlecode/javacv/cpp/opencv_core$CvArr;Lcom/googlecode/javacv/cpp/opencv_core$CvArr;I)V
    //   1131: aload_0
    //   1132: getfield 100	co/vine/android/recorder/CombingRunnable:mBitmap	Landroid/graphics/Bitmap;
    //   1135: aload_0
    //   1136: getfield 102	co/vine/android/recorder/CombingRunnable:mTempFrame	Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    //   1139: invokevirtual 344	com/googlecode/javacv/cpp/opencv_core$IplImage:getByteBuffer	()Ljava/nio/ByteBuffer;
    //   1142: invokevirtual 350	android/graphics/Bitmap:copyPixelsFromBuffer	(Ljava/nio/Buffer;)V
    //   1145: aload_0
    //   1146: getfield 100	co/vine/android/recorder/CombingRunnable:mBitmap	Landroid/graphics/Bitmap;
    //   1149: astore 26
    //   1151: getstatic 356	android/graphics/Bitmap$CompressFormat:JPEG	Landroid/graphics/Bitmap$CompressFormat;
    //   1154: astore 27
    //   1156: aload_0
    //   1157: getfield 91	co/vine/android/recorder/CombingRunnable:mLastFrameOnlyModePath	Ljava/lang/String;
    //   1160: ifnonnull +76 -> 1236
    //   1163: aload_0
    //   1164: getfield 86	co/vine/android/recorder/CombingRunnable:mThumbnailPath	Ljava/lang/String;
    //   1167: astore 29
    //   1169: aload_0
    //   1170: getfield 109	co/vine/android/recorder/CombingRunnable:mFrameNumbers	Ljava/util/ArrayList;
    //   1173: ifnonnull +76 -> 1249
    //   1176: iconst_1
    //   1177: istore 30
    //   1179: new 358	java/io/FileOutputStream
    //   1182: dup
    //   1183: aload 29
    //   1185: iload 30
    //   1187: invokestatic 403	co/vine/android/recorder/RecordingFile:getLastFramePathThumbnailFromThumbnailPath	(Ljava/lang/String;Z)Ljava/lang/String;
    //   1190: invokespecial 359	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   1193: astore 31
    //   1195: aload 26
    //   1197: aload 27
    //   1199: bipush 75
    //   1201: aload 31
    //   1203: invokevirtual 363	android/graphics/Bitmap:compress	(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    //   1206: pop
    //   1207: ldc_w 405
    //   1210: invokestatic 368	com/edisonwang/android/slog/SLog:i	(Ljava/lang/String;)V
    //   1213: goto -358 -> 855
    //   1216: astore 17
    //   1218: ldc_w 407
    //   1221: iconst_1
    //   1222: anewarray 4	java/lang/Object
    //   1225: dup
    //   1226: iconst_0
    //   1227: aload 17
    //   1229: aastore
    //   1230: invokestatic 410	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1233: goto -192 -> 1041
    //   1236: aload_0
    //   1237: getfield 91	co/vine/android/recorder/CombingRunnable:mLastFrameOnlyModePath	Ljava/lang/String;
    //   1240: astore 28
    //   1242: aload 28
    //   1244: astore 29
    //   1246: goto -77 -> 1169
    //   1249: iconst_0
    //   1250: istore 30
    //   1252: goto -73 -> 1179
    //   1255: new 412	java/lang/IllegalStateException
    //   1258: dup
    //   1259: invokespecial 413	java/lang/IllegalStateException:<init>	()V
    //   1262: athrow
    //   1263: astore 22
    //   1265: ldc_w 415
    //   1268: invokestatic 380	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;)V
    //   1271: goto -230 -> 1041
    //   1274: astore 16
    //   1276: ldc_w 417
    //   1279: iconst_1
    //   1280: anewarray 4	java/lang/Object
    //   1283: dup
    //   1284: iconst_0
    //   1285: aload 16
    //   1287: aastore
    //   1288: invokestatic 410	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1291: goto -250 -> 1041
    //   1294: astore 14
    //   1296: ldc_w 419
    //   1299: iconst_1
    //   1300: anewarray 4	java/lang/Object
    //   1303: dup
    //   1304: iconst_0
    //   1305: aload 14
    //   1307: aastore
    //   1308: invokestatic 410	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1311: goto -270 -> 1041
    //   1314: astore 15
    //   1316: aload 15
    //   1318: invokestatic 234	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;)V
    //   1321: goto -262 -> 1059
    //
    // Exception table:
    //   from	to	target	type
    //   80	136	298	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   136	174	298	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   418	437	486	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   440	456	486	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   504	523	540	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   526	537	540	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   597	616	633	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   619	630	633	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   781	852	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   855	862	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   882	936	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   936	950	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   950	960	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   960	999	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   1004	1041	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   1121	1169	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   1169	1176	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   1179	1213	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   1236	1242	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   1255	1263	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   1265	1271	1216	co/vine/android/recorder/VineFFmpegFrameRecorder$Exception
    //   960	999	1263	java/lang/Exception
    //   1004	1041	1263	java/lang/Exception
    //   1255	1263	1263	java/lang/Exception
    //   781	852	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   855	862	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   882	936	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   936	950	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   950	960	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   960	999	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   1004	1041	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   1121	1169	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   1169	1176	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   1179	1213	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   1236	1242	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   1255	1263	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   1265	1271	1274	co/vine/android/recorder/VineFrameGrabber$Exception
    //   781	852	1294	java/io/FileNotFoundException
    //   855	862	1294	java/io/FileNotFoundException
    //   882	936	1294	java/io/FileNotFoundException
    //   936	950	1294	java/io/FileNotFoundException
    //   950	960	1294	java/io/FileNotFoundException
    //   960	999	1294	java/io/FileNotFoundException
    //   1004	1041	1294	java/io/FileNotFoundException
    //   1121	1169	1294	java/io/FileNotFoundException
    //   1169	1176	1294	java/io/FileNotFoundException
    //   1179	1213	1294	java/io/FileNotFoundException
    //   1236	1242	1294	java/io/FileNotFoundException
    //   1255	1263	1294	java/io/FileNotFoundException
    //   1265	1271	1294	java/io/FileNotFoundException
    //   1048	1059	1314	java/io/IOException
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.CombingRunnable
 * JD-Core Version:    0.6.2
 */