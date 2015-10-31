package co.vine.android.recorder;

import android.annotation.TargetApi;
import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.hardware.Camera.Area;
import android.hardware.Camera.AutoFocusCallback;
import android.hardware.Camera.CameraInfo;
import android.hardware.Camera.Parameters;
import android.hardware.Camera.Size;
import android.media.CamcorderProfile;
import android.os.Build.VERSION;
import android.view.Display;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.WindowManager;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.MathUtil;
import com.edisonwang.android.slog.SLog;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;

@TargetApi(14)
public class CameraManager
{
  private static CameraManager INSTANCE;
  private static boolean hasPreallocateBuffers;
  private static final Integer[] mBackFacing;
  private static final Integer[] mFrontFacing;
  private volatile boolean isPreviewing;
  private final ConcurrentLinkedQueue<byte[]> mAddArray = new ConcurrentLinkedQueue();
  private final Set<byte[]> mAddedBufferArray = Collections.newSetFromMap(new ConcurrentHashMap());
  private final ConcurrentLinkedQueue<byte[]> mBufferArray = new ConcurrentLinkedQueue();
  private Camera mCamera;
  private CameraSetting mCameraSetting;
  private int mCurrentCamera = -1;
  private int mFixedDegrees;
  private ArrayList<Camera.Area> mFocusArea;
  private int mFrameSize;
  private boolean mIsCurrentFront = false;
  private final int[] mLOCK = new int[0];
  private final Matrix mMatrix = new Matrix();
  private int mMaxZoom;
  private RecordController mPreviewCallback;
  private int mPreviewHeight;
  private int mPreviewWidth;
  private volatile boolean mRunAddBufferThraed;
  private ByteBuffer mSharedByteBuffer;
  private int mZoom;

  static
  {
    Camera.CameraInfo localCameraInfo = new Camera.CameraInfo();
    int i = Camera.getNumberOfCameras();
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    for (int j = 0; ; j++)
      if (j < i)
      {
        try
        {
          Camera.getCameraInfo(j, localCameraInfo);
          if (localCameraInfo.facing == 1)
            localArrayList1.add(Integer.valueOf(j));
          else if (localCameraInfo.facing == 0)
            localArrayList2.add(Integer.valueOf(j));
        }
        catch (Exception localException)
        {
          Object[] arrayOfObject = new Object[1];
          arrayOfObject[0] = Integer.valueOf(j);
          CrashUtil.logException(localException, "Cannot get camera info for camera #{}.", arrayOfObject);
        }
      }
      else
      {
        mFrontFacing = (Integer[])localArrayList1.toArray(new Integer[localArrayList1.size()]);
        mBackFacing = (Integer[])localArrayList2.toArray(new Integer[localArrayList2.size()]);
        return;
      }
  }

  private void calculateTapArea(int paramInt1, int paramInt2, float paramFloat, int paramInt3, int paramInt4, int paramInt5, int paramInt6, Rect paramRect)
  {
    int i = (int)(paramFloat * paramInt1);
    int j = (int)(paramFloat * paramInt2);
    int k = MathUtil.clamp(paramInt3 - i / 2, 0, paramInt5 - i);
    int m = MathUtil.clamp(paramInt4 - j / 2, 0, paramInt6 - j);
    RectF localRectF = new RectF(k, m, k + i, m + j);
    this.mMatrix.mapRect(localRectF);
    MathUtil.rectFToRect(localRectF, paramRect);
  }

  @TargetApi(15)
  private void disableVideoStab(Camera.Parameters paramParameters)
  {
    if ((Build.VERSION.SDK_INT >= 15) && (paramParameters.isVideoStabilizationSupported()))
      paramParameters.setVideoStabilization(false);
  }

  public static int getCameraDisplayOrientation(int paramInt1, int paramInt2)
  {
    Camera.CameraInfo localCameraInfo = new Camera.CameraInfo();
    Camera.getCameraInfo(paramInt2, localCameraInfo);
    SLog.d("Set rotation to {} degrees", Integer.valueOf(paramInt1));
    if (localCameraInfo.facing == 1)
      return (360 - (paramInt1 + localCameraInfo.orientation) % 360) % 360;
    return (360 + (localCameraInfo.orientation - paramInt1)) % 360;
  }

  public static int getCameraRotation(Activity paramActivity)
  {
    switch (paramActivity.getWindowManager().getDefaultDisplay().getRotation())
    {
    case 0:
    default:
      return 0;
    case 1:
      return 90;
    case 2:
      return 180;
    case 3:
    }
    return 270;
  }

  public static CameraManager getInstance()
  {
    if (INSTANCE == null)
      INSTANCE = new CameraManager();
    return INSTANCE;
  }

  public static boolean hasBackFacingCamera()
  {
    return mBackFacing.length > 0;
  }

  public static boolean hasCamera()
  {
    return (hasBackFacingCamera()) || (hasFrontFacingCamera());
  }

  public static boolean hasFrontFacingCamera()
  {
    return mFrontFacing.length > 0;
  }

  private void initializeFocusAreas(int paramInt1, int paramInt2)
  {
    if (this.mFocusArea == null)
    {
      this.mFocusArea = new ArrayList();
      this.mFocusArea.add(new Camera.Area(new Rect(), 1));
    }
    calculateTapArea(100, 100, 1.0F, paramInt1, paramInt2, this.mCameraSetting.originalW, this.mCameraSetting.originalH, ((Camera.Area)this.mFocusArea.get(0)).rect);
  }

  // ERROR //
  private CameraSetting safeCameraOpen(RecordConfigUtils.RecordConfig paramRecordConfig, boolean paramBoolean1, int paramInt1, int paramInt2, boolean paramBoolean2)
  {
    // Byte code:
    //   0: iload_3
    //   1: iconst_m1
    //   2: if_icmpne +5 -> 7
    //   5: aconst_null
    //   6: areturn
    //   7: aload_0
    //   8: getfield 105	co/vine/android/recorder/CameraManager:mLOCK	[I
    //   11: astore 6
    //   13: aload 6
    //   15: monitorenter
    //   16: iload 5
    //   18: ifne +11 -> 29
    //   21: aload_0
    //   22: getfield 109	co/vine/android/recorder/CameraManager:mCurrentCamera	I
    //   25: iload_3
    //   26: if_icmpeq +7 -> 33
    //   29: aload_0
    //   30: invokevirtual 263	co/vine/android/recorder/CameraManager:releaseCameraAndPreview	()V
    //   33: iload 5
    //   35: ifne +18 -> 53
    //   38: aload_0
    //   39: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   42: ifnull +11 -> 53
    //   45: aload_0
    //   46: getfield 109	co/vine/android/recorder/CameraManager:mCurrentCamera	I
    //   49: iload_3
    //   50: if_icmpeq +110 -> 160
    //   53: aload_0
    //   54: iload_3
    //   55: invokestatic 267	android/hardware/Camera:open	(I)Landroid/hardware/Camera;
    //   58: putfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   61: aload_0
    //   62: aconst_null
    //   63: putfield 240	co/vine/android/recorder/CameraManager:mCameraSetting	Lco/vine/android/recorder/CameraSetting;
    //   66: aload_0
    //   67: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   70: invokevirtual 271	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   73: astore 9
    //   75: aload 9
    //   77: iconst_1
    //   78: invokevirtual 274	android/hardware/Camera$Parameters:setRecordingHint	(Z)V
    //   81: aload_0
    //   82: aload 9
    //   84: invokevirtual 277	android/hardware/Camera$Parameters:getMaxZoom	()I
    //   87: putfield 279	co/vine/android/recorder/CameraManager:mMaxZoom	I
    //   90: aload_0
    //   91: iconst_1
    //   92: putfield 281	co/vine/android/recorder/CameraManager:mZoom	I
    //   95: aload_0
    //   96: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   99: aload 9
    //   101: invokevirtual 284	android/hardware/Camera:setParameters	(Landroid/hardware/Camera$Parameters;)V
    //   104: aload_0
    //   105: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   108: ifnull +68 -> 176
    //   111: ldc_w 286
    //   114: invokestatic 289	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   117: aload_0
    //   118: iload_3
    //   119: putfield 109	co/vine/android/recorder/CameraManager:mCurrentCamera	I
    //   122: aload_0
    //   123: iload_2
    //   124: putfield 107	co/vine/android/recorder/CameraManager:mIsCurrentFront	Z
    //   127: aload_0
    //   128: aload_0
    //   129: aload_1
    //   130: aload 9
    //   132: iload 4
    //   134: invokevirtual 292	co/vine/android/recorder/CameraManager:getCameraInfo	(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;Landroid/hardware/Camera$Parameters;I)Lco/vine/android/recorder/CameraSetting;
    //   137: putfield 240	co/vine/android/recorder/CameraManager:mCameraSetting	Lco/vine/android/recorder/CameraSetting;
    //   140: aload_0
    //   141: getfield 240	co/vine/android/recorder/CameraManager:mCameraSetting	Lco/vine/android/recorder/CameraSetting;
    //   144: astore 10
    //   146: aload 6
    //   148: monitorexit
    //   149: aload 10
    //   151: areturn
    //   152: astore 7
    //   154: aload 6
    //   156: monitorexit
    //   157: aload 7
    //   159: athrow
    //   160: ldc_w 294
    //   163: invokestatic 289	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   166: goto -105 -> 61
    //   169: astore 8
    //   171: aload 8
    //   173: invokestatic 297	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;)V
    //   176: aload 6
    //   178: monitorexit
    //   179: aconst_null
    //   180: areturn
    //
    // Exception table:
    //   from	to	target	type
    //   21	29	152	finally
    //   29	33	152	finally
    //   38	53	152	finally
    //   53	61	152	finally
    //   61	146	152	finally
    //   146	149	152	finally
    //   154	157	152	finally
    //   160	166	152	finally
    //   171	176	152	finally
    //   176	179	152	finally
    //   38	53	169	java/lang/Exception
    //   53	61	169	java/lang/Exception
    //   61	146	169	java/lang/Exception
    //   160	166	169	java/lang/Exception
  }

  // ERROR //
  private void startPreview(Surface paramSurface, SurfaceTexture paramSurfaceTexture, boolean paramBoolean1, boolean paramBoolean2, int paramInt1, int paramInt2, int paramInt3)
    throws CameraManager.InvalidPreviewSizeException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 305	co/vine/android/recorder/CameraManager:isPreviewing	Z
    //   6: ifeq +12 -> 18
    //   9: ldc_w 307
    //   12: invokestatic 289	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   15: aload_0
    //   16: monitorexit
    //   17: return
    //   18: aload_0
    //   19: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   22: ifnull -7 -> 15
    //   25: ldc_w 309
    //   28: invokestatic 289	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   31: aload_1
    //   32: ifnull +361 -> 393
    //   35: aload_0
    //   36: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   39: astore 11
    //   41: new 311	co/vine/android/recorder/CameraManager$DummySurfaceHolder
    //   44: dup
    //   45: aload_1
    //   46: invokespecial 314	co/vine/android/recorder/CameraManager$DummySurfaceHolder:<init>	(Landroid/view/Surface;)V
    //   49: astore 12
    //   51: aload 11
    //   53: aload 12
    //   55: invokevirtual 318	android/hardware/Camera:setPreviewDisplay	(Landroid/view/SurfaceHolder;)V
    //   58: aload_0
    //   59: iconst_1
    //   60: putfield 305	co/vine/android/recorder/CameraManager:isPreviewing	Z
    //   63: aload_0
    //   64: aload_0
    //   65: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   68: invokevirtual 271	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   71: iload 6
    //   73: iload_3
    //   74: iload 4
    //   76: invokevirtual 322	co/vine/android/recorder/CameraManager:enableFancyCameraFeatures	(Landroid/hardware/Camera$Parameters;IZZ)Z
    //   79: istore 13
    //   81: aload_0
    //   82: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   85: invokevirtual 271	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   88: astore 14
    //   90: aload 14
    //   92: aload_0
    //   93: getfield 324	co/vine/android/recorder/CameraManager:mPreviewWidth	I
    //   96: aload_0
    //   97: getfield 326	co/vine/android/recorder/CameraManager:mPreviewHeight	I
    //   100: invokevirtual 329	android/hardware/Camera$Parameters:setPreviewSize	(II)V
    //   103: aload 14
    //   105: aload_0
    //   106: getfield 324	co/vine/android/recorder/CameraManager:mPreviewWidth	I
    //   109: aload_0
    //   110: getfield 326	co/vine/android/recorder/CameraManager:mPreviewHeight	I
    //   113: invokevirtual 332	android/hardware/Camera$Parameters:setPictureSize	(II)V
    //   116: aload 14
    //   118: ldc_w 334
    //   121: new 336	java/lang/StringBuilder
    //   124: dup
    //   125: invokespecial 337	java/lang/StringBuilder:<init>	()V
    //   128: aload_0
    //   129: getfield 324	co/vine/android/recorder/CameraManager:mPreviewWidth	I
    //   132: invokestatic 341	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   135: invokevirtual 345	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   138: ldc_w 347
    //   141: invokevirtual 345	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   144: aload_0
    //   145: getfield 326	co/vine/android/recorder/CameraManager:mPreviewHeight	I
    //   148: invokestatic 341	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   151: invokevirtual 345	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   154: invokevirtual 350	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   157: invokevirtual 354	android/hardware/Camera$Parameters:set	(Ljava/lang/String;Ljava/lang/String;)V
    //   160: iconst_3
    //   161: anewarray 4	java/lang/Object
    //   164: astore 15
    //   166: aload 15
    //   168: iconst_0
    //   169: aload_0
    //   170: getfield 324	co/vine/android/recorder/CameraManager:mPreviewWidth	I
    //   173: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   176: aastore
    //   177: aload 15
    //   179: iconst_1
    //   180: aload_0
    //   181: getfield 326	co/vine/android/recorder/CameraManager:mPreviewHeight	I
    //   184: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   187: aastore
    //   188: aload 15
    //   190: iconst_2
    //   191: iload 13
    //   193: invokestatic 359	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   196: aastore
    //   197: ldc_w 361
    //   200: aload 15
    //   202: invokestatic 365	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   205: aload 14
    //   207: bipush 17
    //   209: invokevirtual 369	android/hardware/Camera$Parameters:setPreviewFormat	(I)V
    //   212: aload_0
    //   213: aload 14
    //   215: invokespecial 371	co/vine/android/recorder/CameraManager:disableVideoStab	(Landroid/hardware/Camera$Parameters;)V
    //   218: aload_0
    //   219: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   222: aload 14
    //   224: invokevirtual 284	android/hardware/Camera:setParameters	(Landroid/hardware/Camera$Parameters;)V
    //   227: aload_0
    //   228: aload 14
    //   230: invokevirtual 374	android/hardware/Camera$Parameters:getPreviewFormat	()I
    //   233: invokestatic 380	android/graphics/ImageFormat:getBitsPerPixel	(I)I
    //   236: aload_0
    //   237: getfield 324	co/vine/android/recorder/CameraManager:mPreviewWidth	I
    //   240: aload_0
    //   241: getfield 326	co/vine/android/recorder/CameraManager:mPreviewHeight	I
    //   244: imul
    //   245: imul
    //   246: bipush 8
    //   248: idiv
    //   249: putfield 382	co/vine/android/recorder/CameraManager:mFrameSize	I
    //   252: new 384	co/vine/android/recorder/CameraManager$AddBufferThread
    //   255: dup
    //   256: aload_0
    //   257: invokespecial 387	co/vine/android/recorder/CameraManager$AddBufferThread:<init>	(Lco/vine/android/recorder/CameraManager;)V
    //   260: astore 17
    //   262: aload_0
    //   263: getfield 389	co/vine/android/recorder/CameraManager:mPreviewCallback	Lco/vine/android/recorder/RecordController;
    //   266: ifnull +633 -> 899
    //   269: aload_0
    //   270: getfield 389	co/vine/android/recorder/CameraManager:mPreviewCallback	Lco/vine/android/recorder/RecordController;
    //   273: getfield 395	co/vine/android/recorder/RecordController:mParent	Lco/vine/android/recorder/VineRecorder;
    //   276: invokevirtual 401	co/vine/android/recorder/VineRecorder:getConfig	()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    //   279: astore 18
    //   281: aload 18
    //   283: getfield 406	co/vine/android/recorder/RecordConfigUtils$RecordConfig:maxDuration	I
    //   286: istore 19
    //   288: aload 18
    //   290: getfield 409	co/vine/android/recorder/RecordConfigUtils$RecordConfig:bufferCount	I
    //   293: iload 5
    //   295: aload 18
    //   297: getfield 412	co/vine/android/recorder/RecordConfigUtils$RecordConfig:targetFrameRate	I
    //   300: idiv
    //   301: imul
    //   302: i2f
    //   303: iload 19
    //   305: iload 7
    //   307: isub
    //   308: i2f
    //   309: iload 19
    //   311: i2f
    //   312: fdiv
    //   313: fmul
    //   314: f2i
    //   315: bipush 30
    //   317: invokestatic 417	java/lang/Math:max	(II)I
    //   320: istore 20
    //   322: iconst_1
    //   323: anewarray 4	java/lang/Object
    //   326: astore 21
    //   328: aload 21
    //   330: iconst_0
    //   331: iload 20
    //   333: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   336: aastore
    //   337: ldc_w 419
    //   340: aload 21
    //   342: invokestatic 365	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   345: aload_0
    //   346: getfield 120	co/vine/android/recorder/CameraManager:mAddedBufferArray	Ljava/util/Set;
    //   349: invokeinterface 425 1 0
    //   354: astore 22
    //   356: aload 22
    //   358: invokeinterface 430 1 0
    //   363: ifeq +120 -> 483
    //   366: aload 22
    //   368: invokeinterface 434 1 0
    //   373: checkcast 436	[B
    //   376: astore 40
    //   378: aload_0
    //   379: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   382: aload 40
    //   384: invokevirtual 440	android/hardware/Camera:addCallbackBuffer	([B)V
    //   387: iinc 20 255
    //   390: goto -34 -> 356
    //   393: aload_2
    //   394: ifnull +65 -> 459
    //   397: aload_0
    //   398: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   401: aload_2
    //   402: invokevirtual 444	android/hardware/Camera:setPreviewTexture	(Landroid/graphics/SurfaceTexture;)V
    //   405: goto -347 -> 58
    //   408: astore 9
    //   410: aload_0
    //   411: iconst_0
    //   412: putfield 305	co/vine/android/recorder/CameraManager:isPreviewing	Z
    //   415: iconst_1
    //   416: anewarray 4	java/lang/Object
    //   419: astore 10
    //   421: aload 10
    //   423: iconst_0
    //   424: aload 9
    //   426: invokevirtual 447	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   429: aastore
    //   430: ldc_w 449
    //   433: aload 10
    //   435: invokestatic 365	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   438: aload 9
    //   440: instanceof 301
    //   443: ifeq -428 -> 15
    //   446: aload 9
    //   448: checkcast 301	co/vine/android/recorder/CameraManager$InvalidPreviewSizeException
    //   451: athrow
    //   452: astore 8
    //   454: aload_0
    //   455: monitorexit
    //   456: aload 8
    //   458: athrow
    //   459: ldc_w 451
    //   462: invokestatic 289	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   465: goto -450 -> 15
    //   468: astore 16
    //   470: new 301	co/vine/android/recorder/CameraManager$InvalidPreviewSizeException
    //   473: dup
    //   474: aload 16
    //   476: invokevirtual 447	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   479: invokespecial 453	co/vine/android/recorder/CameraManager$InvalidPreviewSizeException:<init>	(Ljava/lang/String;)V
    //   482: athrow
    //   483: iconst_1
    //   484: anewarray 4	java/lang/Object
    //   487: astore 23
    //   489: aload 23
    //   491: iconst_0
    //   492: iload 20
    //   494: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   497: aastore
    //   498: ldc_w 455
    //   501: aload 23
    //   503: invokestatic 365	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   506: aload_0
    //   507: getfield 125	co/vine/android/recorder/CameraManager:mBufferArray	Ljava/util/concurrent/ConcurrentLinkedQueue;
    //   510: invokevirtual 456	java/util/concurrent/ConcurrentLinkedQueue:iterator	()Ljava/util/Iterator;
    //   513: astore 24
    //   515: aload 24
    //   517: invokeinterface 430 1 0
    //   522: ifeq +23 -> 545
    //   525: aload_0
    //   526: aload 24
    //   528: invokeinterface 434 1 0
    //   533: checkcast 436	[B
    //   536: invokevirtual 457	co/vine/android/recorder/CameraManager:addCallbackBuffer	([B)V
    //   539: iinc 20 255
    //   542: goto -27 -> 515
    //   545: iconst_1
    //   546: anewarray 4	java/lang/Object
    //   549: astore 25
    //   551: aload 25
    //   553: iconst_0
    //   554: iload 20
    //   556: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   559: aastore
    //   560: ldc_w 459
    //   563: aload 25
    //   565: invokestatic 365	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   568: invokestatic 465	java/lang/System:currentTimeMillis	()J
    //   571: lstore 26
    //   573: aload_0
    //   574: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   577: aload_0
    //   578: getfield 389	co/vine/android/recorder/CameraManager:mPreviewCallback	Lco/vine/android/recorder/RecordController;
    //   581: invokevirtual 469	android/hardware/Camera:setPreviewCallbackWithBuffer	(Landroid/hardware/Camera$PreviewCallback;)V
    //   584: invokestatic 472	java/lang/System:gc	()V
    //   587: aload 18
    //   589: getfield 475	co/vine/android/recorder/RecordConfigUtils$RecordConfig:preAllocateBuffer	Z
    //   592: istore 28
    //   594: iconst_0
    //   595: istore 29
    //   597: iload 28
    //   599: ifeq +116 -> 715
    //   602: getstatic 477	co/vine/android/recorder/CameraManager:hasPreallocateBuffers	Z
    //   605: istore 30
    //   607: iconst_0
    //   608: istore 29
    //   610: iload 30
    //   612: ifne +103 -> 715
    //   615: aload_0
    //   616: getfield 382	co/vine/android/recorder/CameraManager:mFrameSize	I
    //   619: iload 20
    //   621: aload_0
    //   622: getfield 125	co/vine/android/recorder/CameraManager:mBufferArray	Ljava/util/concurrent/ConcurrentLinkedQueue;
    //   625: invokevirtual 478	java/util/concurrent/ConcurrentLinkedQueue:size	()I
    //   628: isub
    //   629: imul
    //   630: i2d
    //   631: aload 18
    //   633: getfield 482	co/vine/android/recorder/RecordConfigUtils$RecordConfig:preAllocRatio	D
    //   636: dmul
    //   637: d2i
    //   638: istore 31
    //   640: iconst_2
    //   641: anewarray 4	java/lang/Object
    //   644: astore 32
    //   646: aload 32
    //   648: iconst_0
    //   649: aload 18
    //   651: getfield 482	co/vine/android/recorder/RecordConfigUtils$RecordConfig:preAllocRatio	D
    //   654: invokestatic 487	java/lang/Double:valueOf	(D)Ljava/lang/Double;
    //   657: aastore
    //   658: aload 32
    //   660: iconst_1
    //   661: iload 31
    //   663: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   666: aastore
    //   667: ldc_w 489
    //   670: aload 32
    //   672: invokestatic 365	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   675: iconst_1
    //   676: putstatic 477	co/vine/android/recorder/CameraManager:hasPreallocateBuffers	Z
    //   679: iload 31
    //   681: newarray byte
    //   683: astore 35
    //   685: aload_0
    //   686: aload_0
    //   687: getfield 382	co/vine/android/recorder/CameraManager:mFrameSize	I
    //   690: newarray byte
    //   692: invokestatic 495	java/nio/ByteBuffer:wrap	([B)Ljava/nio/ByteBuffer;
    //   695: putfield 497	co/vine/android/recorder/CameraManager:mSharedByteBuffer	Ljava/nio/ByteBuffer;
    //   698: aload 35
    //   700: ifnull +8 -> 708
    //   703: aload 35
    //   705: iconst_0
    //   706: iconst_1
    //   707: bastore
    //   708: iconst_0
    //   709: newarray byte
    //   711: pop
    //   712: invokestatic 472	java/lang/System:gc	()V
    //   715: aload_0
    //   716: getfield 497	co/vine/android/recorder/CameraManager:mSharedByteBuffer	Ljava/nio/ByteBuffer;
    //   719: ifnonnull +16 -> 735
    //   722: aload_0
    //   723: aload_0
    //   724: getfield 382	co/vine/android/recorder/CameraManager:mFrameSize	I
    //   727: newarray byte
    //   729: invokestatic 495	java/nio/ByteBuffer:wrap	([B)Ljava/nio/ByteBuffer;
    //   732: putfield 497	co/vine/android/recorder/CameraManager:mSharedByteBuffer	Ljava/nio/ByteBuffer;
    //   735: iload 29
    //   737: ifeq +23 -> 760
    //   740: aload 18
    //   742: getfield 482	co/vine/android/recorder/RecordConfigUtils$RecordConfig:preAllocRatio	D
    //   745: dconst_1
    //   746: dcmpg
    //   747: ifgt +13 -> 760
    //   750: ldc2_w 498
    //   753: iload 20
    //   755: i2d
    //   756: dmul
    //   757: d2i
    //   758: istore 20
    //   760: aload_0
    //   761: iconst_1
    //   762: putfield 136	co/vine/android/recorder/CameraManager:mRunAddBufferThraed	Z
    //   765: aload 17
    //   767: invokevirtual 502	co/vine/android/recorder/CameraManager$AddBufferThread:start	()V
    //   770: iconst_0
    //   771: istore 37
    //   773: iload 37
    //   775: iload 20
    //   777: if_icmpge +84 -> 861
    //   780: iload 37
    //   782: bipush 15
    //   784: irem
    //   785: iconst_1
    //   786: if_icmpne +26 -> 812
    //   789: iconst_1
    //   790: anewarray 4	java/lang/Object
    //   793: astore 39
    //   795: aload 39
    //   797: iconst_0
    //   798: iload 37
    //   800: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   803: aastore
    //   804: ldc_w 504
    //   807: aload 39
    //   809: invokestatic 365	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   812: aload_0
    //   813: aconst_null
    //   814: iconst_0
    //   815: invokevirtual 508	co/vine/android/recorder/CameraManager:addBuffer	([BZ)V
    //   818: iinc 37 1
    //   821: goto -48 -> 773
    //   824: astore 33
    //   826: iconst_1
    //   827: istore 29
    //   829: iconst_1
    //   830: anewarray 4	java/lang/Object
    //   833: astore 34
    //   835: aload 34
    //   837: iconst_0
    //   838: aload 18
    //   840: getfield 482	co/vine/android/recorder/RecordConfigUtils$RecordConfig:preAllocRatio	D
    //   843: invokestatic 487	java/lang/Double:valueOf	(D)Ljava/lang/Double;
    //   846: aastore
    //   847: ldc_w 510
    //   850: aload 34
    //   852: invokestatic 365	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   855: aconst_null
    //   856: astore 35
    //   858: goto -173 -> 685
    //   861: ldc_w 512
    //   864: invokestatic 289	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   867: aload_0
    //   868: iconst_0
    //   869: putfield 136	co/vine/android/recorder/CameraManager:mRunAddBufferThraed	Z
    //   872: iconst_1
    //   873: anewarray 4	java/lang/Object
    //   876: astore 38
    //   878: aload 38
    //   880: iconst_0
    //   881: invokestatic 465	java/lang/System:currentTimeMillis	()J
    //   884: lload 26
    //   886: lsub
    //   887: invokestatic 517	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   890: aastore
    //   891: ldc_w 519
    //   894: aload 38
    //   896: invokestatic 365	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   899: aload 17
    //   901: invokevirtual 522	co/vine/android/recorder/CameraManager$AddBufferThread:join	()V
    //   904: aload_0
    //   905: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   908: ifnull -893 -> 15
    //   911: aload_0
    //   912: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   915: invokevirtual 524	android/hardware/Camera:startPreview	()V
    //   918: goto -903 -> 15
    //
    // Exception table:
    //   from	to	target	type
    //   2	15	408	java/lang/Exception
    //   18	31	408	java/lang/Exception
    //   35	58	408	java/lang/Exception
    //   58	218	408	java/lang/Exception
    //   227	356	408	java/lang/Exception
    //   356	387	408	java/lang/Exception
    //   397	405	408	java/lang/Exception
    //   459	465	408	java/lang/Exception
    //   470	483	408	java/lang/Exception
    //   483	515	408	java/lang/Exception
    //   515	539	408	java/lang/Exception
    //   545	594	408	java/lang/Exception
    //   602	607	408	java/lang/Exception
    //   615	679	408	java/lang/Exception
    //   679	685	408	java/lang/Exception
    //   685	698	408	java/lang/Exception
    //   703	708	408	java/lang/Exception
    //   708	715	408	java/lang/Exception
    //   715	735	408	java/lang/Exception
    //   740	750	408	java/lang/Exception
    //   760	770	408	java/lang/Exception
    //   789	812	408	java/lang/Exception
    //   812	818	408	java/lang/Exception
    //   829	855	408	java/lang/Exception
    //   861	899	408	java/lang/Exception
    //   899	918	408	java/lang/Exception
    //   2	15	452	finally
    //   18	31	452	finally
    //   35	58	452	finally
    //   58	218	452	finally
    //   218	227	452	finally
    //   227	356	452	finally
    //   356	387	452	finally
    //   397	405	452	finally
    //   410	452	452	finally
    //   459	465	452	finally
    //   470	483	452	finally
    //   483	515	452	finally
    //   515	539	452	finally
    //   545	594	452	finally
    //   602	607	452	finally
    //   615	679	452	finally
    //   679	685	452	finally
    //   685	698	452	finally
    //   703	708	452	finally
    //   708	715	452	finally
    //   715	735	452	finally
    //   740	750	452	finally
    //   760	770	452	finally
    //   789	812	452	finally
    //   812	818	452	finally
    //   829	855	452	finally
    //   861	899	452	finally
    //   899	918	452	finally
    //   218	227	468	java/lang/Exception
    //   679	685	824	java/lang/OutOfMemoryError
  }

  public void addBuffer(byte[] paramArrayOfByte, boolean paramBoolean)
  {
    int[] arrayOfInt = this.mLOCK;
    if (paramBoolean);
    while (true)
    {
      try
      {
        this.mBufferArray.offer(paramArrayOfByte);
        return;
        if (this.mCamera == null)
          break label75;
        if (paramArrayOfByte == null)
          paramArrayOfByte = new byte[this.mFrameSize];
        if (!this.mRunAddBufferThraed)
        {
          addCallbackBuffer(paramArrayOfByte);
          continue;
        }
      }
      finally
      {
      }
      this.mAddArray.offer(paramArrayOfByte);
      continue;
      label75: if (paramArrayOfByte != null)
        this.mBufferArray.offer(paramArrayOfByte);
    }
  }

  public void addCallbackBuffer(byte[] paramArrayOfByte)
  {
    synchronized (this.mLOCK)
    {
      if (this.mCamera != null)
      {
        this.mCamera.addCallbackBuffer(paramArrayOfByte);
        this.mAddedBufferArray.add(paramArrayOfByte);
        return;
      }
      SLog.e("Buffer couldn't be added.");
    }
  }

  public boolean allowSetFocus(Camera.Parameters paramParameters)
  {
    String str = "";
    List localList = paramParameters.getSupportedFocusModes();
    SLog.d("Has galaxy problem: {}", Boolean.valueOf(RecordConfigUtils.RecordConfig.HAS_GALAXY_FOCUS_PROBLEM));
    if (localList != null)
    {
      if ((localList.contains("auto")) || (RecordConfigUtils.RecordConfig.HAS_GALAXY_FOCUS_PROBLEM))
      {
        str = "auto";
        SLog.d("Focus Mode: FOCUS_MODE_AUTO");
      }
      while (!str.equals(""))
      {
        paramParameters.setFocusMode(str);
        this.mCamera.setParameters(paramParameters);
        return true;
        if (localList.contains("continuous-picture"))
        {
          str = "continuous-picture";
          SLog.d("Focus Mode: FOCUS_MODE_CONTINUOUS_PICTURE");
        }
      }
    }
    return false;
  }

  public boolean autoFocus(Camera.AutoFocusCallback paramAutoFocusCallback)
  {
    try
    {
      this.mCamera.autoFocus(paramAutoFocusCallback);
      return true;
    }
    catch (Exception localException)
    {
      CrashUtil.logException(localException, "Failed to autoFocus.", new Object[0]);
    }
    return false;
  }

  public boolean canChangeFocus()
  {
    try
    {
      Camera localCamera = this.mCamera;
      boolean bool = false;
      if (localCamera != null)
      {
        int i = this.mCamera.getParameters().getMaxNumFocusAreas();
        bool = false;
        if (i > 0)
          bool = true;
      }
      return bool;
    }
    catch (Exception localException)
    {
    }
    return false;
  }

  public void changeFlashState(boolean paramBoolean)
  {
    Camera.Parameters localParameters = this.mCamera.getParameters();
    if (paramBoolean);
    for (String str = "torch"; ; str = "off")
    {
      localParameters.setFlashMode(str);
      this.mCamera.setParameters(localParameters);
      return;
    }
  }

  public boolean enableFancyCameraFeatures(Camera.Parameters paramParameters, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = fixOrientation(paramInt);
    if (paramBoolean2)
      startContinuousAutoFocus(paramParameters);
    if (paramBoolean1)
      changeFlashState(true);
    return (i == 90) || (i == 270);
  }

  public int fixOrientation(int paramInt)
  {
    synchronized (this.mLOCK)
    {
      if (this.mCamera != null)
      {
        this.mFixedDegrees = getCameraDisplayOrientation(paramInt, this.mCurrentCamera);
        this.mCamera.setDisplayOrientation(this.mFixedDegrees);
        SLog.d("Fixed orientation: {}", Integer.valueOf(this.mFixedDegrees));
        if ((this.mPreviewWidth != 0) && (this.mPreviewHeight != 0))
        {
          Matrix localMatrix = new Matrix();
          MathUtil.prepareMatrix(localMatrix, this.mIsCurrentFront, this.mFixedDegrees, this.mPreviewWidth, this.mPreviewHeight);
          localMatrix.invert(this.mMatrix);
        }
      }
      return this.mFixedDegrees;
    }
  }

  public Camera getCamera()
  {
    return this.mCamera;
  }

  public CameraSetting getCameraInfo(RecordConfigUtils.RecordConfig paramRecordConfig, Camera.Parameters paramParameters, int paramInt)
  {
    label188: CameraSetting localCameraSetting;
    try
    {
      List localList5 = paramParameters.getSupportedPreviewFormats();
      localList1 = localList5;
      i = 17;
      if (localList1 != null)
      {
        Iterator localIterator4 = localList1.iterator();
        while (localIterator4.hasNext())
        {
          Integer localInteger2 = (Integer)localIterator4.next();
          SLog.d("Supported format: {}", localInteger2);
          if (localInteger2.intValue() == 4)
            i = localInteger2.intValue();
        }
        if (i == 17)
        {
          Iterator localIterator5 = localList1.iterator();
          while (localIterator5.hasNext())
          {
            Integer localInteger1 = (Integer)localIterator5.next();
            if (localInteger1.intValue() == 256)
              i = localInteger1.intValue();
          }
        }
      }
      SLog.d("Selected format: {}.", Integer.valueOf(i));
      j = getFixedDegrees(false, paramInt);
      if (isCurrentFront())
        j = -j;
    }
    catch (NullPointerException localNullPointerException)
    {
      try
      {
        List localList1;
        int i;
        int j;
        Object localObject;
        if (CamcorderProfile.hasProfile(this.mCurrentCamera, 4))
        {
          localObject = CamcorderProfile.get(this.mCurrentCamera, 4);
          CrashUtil.log("Use default profile");
          SLog.d("Preferred FrameRate: {}.", Integer.valueOf(((CamcorderProfile)localObject).videoFrameRate));
          if (((CamcorderProfile)localObject).videoFrameRate >= paramRecordConfig.targetFrameRate)
            ((CamcorderProfile)localObject).videoFrameRate = paramRecordConfig.targetFrameRate;
          Object[] arrayOfObject3 = new Object[2];
          arrayOfObject3[0] = Integer.valueOf(((CamcorderProfile)localObject).videoFrameWidth);
          arrayOfObject3[1] = Integer.valueOf(((CamcorderProfile)localObject).videoFrameHeight);
          CrashUtil.log("Original Width * Height: {}/{}", arrayOfObject3);
          ((CamcorderProfile)localObject).videoFrameWidth = paramRecordConfig.previewWidth;
          if (((CamcorderProfile)localObject).videoFrameHeight > ((CamcorderProfile)localObject).videoFrameWidth)
            if (!paramRecordConfig.highQuality)
              break label680;
        }
        label680: for (int i1 = 480; ; i1 = 240)
        {
          ((CamcorderProfile)localObject).videoFrameHeight = i1;
          Object[] arrayOfObject4 = new Object[5];
          arrayOfObject4[0] = Integer.valueOf(((CamcorderProfile)localObject).videoFrameWidth);
          arrayOfObject4[1] = Integer.valueOf(((CamcorderProfile)localObject).videoFrameHeight);
          arrayOfObject4[2] = Integer.valueOf(((CamcorderProfile)localObject).videoCodec);
          arrayOfObject4[3] = Integer.valueOf(((CamcorderProfile)localObject).videoBitRate);
          arrayOfObject4[4] = Integer.valueOf(((CamcorderProfile)localObject).videoFrameRate);
          SLog.d("Video: {}*{} codec: {} bitRate:{} frameRate:{}.", arrayOfObject4);
          Object[] arrayOfObject5 = new Object[4];
          arrayOfObject5[0] = Integer.valueOf(((CamcorderProfile)localObject).audioBitRate);
          arrayOfObject5[1] = Integer.valueOf(((CamcorderProfile)localObject).audioChannels);
          arrayOfObject5[2] = Integer.valueOf(((CamcorderProfile)localObject).audioCodec);
          arrayOfObject5[3] = Integer.valueOf(((CamcorderProfile)localObject).audioSampleRate);
          SLog.d("Audio: bitRate:{} channels: {} codec: {} sampleRate: {} ", arrayOfObject5);
          m = ((CamcorderProfile)localObject).videoFrameWidth;
          k = ((CamcorderProfile)localObject).videoFrameHeight;
          n = ((CamcorderProfile)localObject).videoFrameRate;
          SLog.d("FFC OR: {}.", Float.valueOf(paramRecordConfig.frontFacingAspectRatioOverride));
          SLog.d("BFC OR: {}.", Float.valueOf(paramRecordConfig.backFacingAspectRatioOverride));
          if ((m == 640) && (k != 480))
          {
            CrashUtil.log("Force 480 with 480p.");
            k = 480;
          }
          localCameraSetting = new CameraSetting(m, k, j, n, i, this.mIsCurrentFront, paramRecordConfig.frontFacingAspectRatioOverride, paramRecordConfig.backFacingAspectRatioOverride);
          if (!SLog.sLogsOn)
            break label1056;
          Camera.Size localSize1 = paramParameters.getPreferredPreviewSizeForVideo();
          if (localSize1 != null)
            SLog.d("Preferred Width * Height: {}/{}.", Integer.valueOf(localSize1.width), Integer.valueOf(localSize1.height));
          List localList3 = paramParameters.getSupportedVideoSizes();
          if (localList3 == null)
            break label915;
          Iterator localIterator2 = localList3.iterator();
          while (localIterator2.hasNext())
          {
            Camera.Size localSize3 = (Camera.Size)localIterator2.next();
            SLog.d("Supported Video Width * Height: {}/{}.", Integer.valueOf(localSize3.width), Integer.valueOf(localSize3.height));
          }
          localNullPointerException = localNullPointerException;
          CrashUtil.log("This device sucks, it cannot return params properly.");
          localList1 = null;
          break;
          CamcorderProfile localCamcorderProfile = CamcorderProfile.get(this.mCurrentCamera, 1);
          localObject = localCamcorderProfile;
          break label188;
        }
      }
      catch (Exception localException)
      {
        int m;
        int k;
        int n;
        List localList2 = paramParameters.getSupportedPreviewSizes();
        HashSet localHashSet = new HashSet();
        if (localList2 != null)
        {
          Iterator localIterator3 = localList2.iterator();
          while (localIterator3.hasNext())
          {
            Camera.Size localSize4 = (Camera.Size)localIterator3.next();
            Object[] arrayOfObject2 = new Object[2];
            arrayOfObject2[0] = Integer.valueOf(localSize4.width);
            arrayOfObject2[1] = Integer.valueOf(localSize4.height);
            CrashUtil.log("Supported width and height: {}, {}.", arrayOfObject2);
            if (localSize4.height == paramRecordConfig.targetSize)
              localHashSet.add(Integer.valueOf(localSize4.width));
          }
          if (localHashSet.isEmpty())
          {
            CrashUtil.log("Edison: Target size is not supported.");
            k = paramRecordConfig.previewHeight;
            m = paramRecordConfig.previewWidth;
          }
        }
        while (true)
        {
          n = paramRecordConfig.targetFrameRate;
          break;
          if (localHashSet.contains(Integer.valueOf(paramRecordConfig.previewWidth)))
          {
            k = paramRecordConfig.previewHeight;
            m = paramRecordConfig.previewWidth;
          }
          else
          {
            CrashUtil.log("Edison: Target width is not supported.");
            k = paramRecordConfig.previewHeight;
            m = paramRecordConfig.previewWidth;
            continue;
            k = paramRecordConfig.previewHeight;
            m = paramRecordConfig.previewWidth;
          }
        }
        label915: List localList4 = paramParameters.getSupportedPreviewSizes();
        if (localList4 != null)
        {
          Iterator localIterator1 = localList4.iterator();
          while (localIterator1.hasNext())
          {
            Camera.Size localSize2 = (Camera.Size)localIterator1.next();
            SLog.d("Supported Preview Width * Height: {}/{}.", Integer.valueOf(localSize2.width), Integer.valueOf(localSize2.height));
          }
        }
        Object[] arrayOfObject1 = new Object[5];
        arrayOfObject1[0] = Integer.valueOf(localCameraSetting.originalW);
        arrayOfObject1[1] = Integer.valueOf(localCameraSetting.originalH);
        arrayOfObject1[2] = Integer.valueOf(localCameraSetting.frameRate);
        arrayOfObject1[3] = Integer.valueOf(getCurrentPreviewFormat(paramParameters));
        arrayOfObject1[4] = Integer.valueOf(localCameraSetting.degrees);
        SLog.d("Camera w/h/f/p/d: {}/{}/{}/{}/{}", arrayOfObject1);
      }
    }
    label1056: return localCameraSetting;
  }

  public CameraSetting getCameraSetting()
  {
    return this.mCameraSetting;
  }

  public int getCurrentPreviewFormat(Camera.Parameters paramParameters)
  {
    return paramParameters.getPreviewFormat();
  }

  public int getFixedDegrees(boolean paramBoolean, int paramInt)
  {
    if (paramBoolean)
      return this.mFixedDegrees;
    return getCameraDisplayOrientation(paramInt, this.mCurrentCamera);
  }

  public Camera.Parameters getParameters()
  {
    if (this.mCamera != null)
      return this.mCamera.getParameters();
    return null;
  }

  public ByteBuffer getSharedByteBuffer()
  {
    return this.mSharedByteBuffer;
  }

  public List<Integer> getSupportedPreviewFormat(Camera.Parameters paramParameters)
  {
    return paramParameters.getSupportedPreviewFormats();
  }

  public boolean isCameraReady()
  {
    return (this.mCamera != null) && (this.mCameraSetting != null);
  }

  public boolean isCurrentFront()
  {
    return this.mIsCurrentFront;
  }

  public boolean isFlashSupported()
  {
    boolean bool = true;
    List localList = this.mCamera.getParameters().getSupportedFlashModes();
    if ((localList == null) || (localList.size() == 0))
    {
      bool = false;
      return bool;
    }
    Iterator localIterator = localList.iterator();
    while (true)
      if (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        if ("on".equals(str))
          break;
        if ("torch".equals(str))
          return bool;
      }
    return false;
  }

  public boolean isPreviewing()
  {
    return this.isPreviewing;
  }

  protected void lock()
  {
    SLog.d("5d. Lock Camera");
    this.mCamera.lock();
  }

  public int modifyZoom(boolean paramBoolean)
  {
    synchronized (this.mLOCK)
    {
      Camera localCamera = this.mCamera;
      if (localCamera != null);
      try
      {
        Camera.Parameters localParameters = this.mCamera.getParameters();
        if (paramBoolean)
          if (this.mZoom < this.mMaxZoom)
          {
            this.mZoom = (1 + this.mZoom);
            localParameters.setZoom(this.mZoom);
            this.mCamera.setParameters(localParameters);
          }
        while (true)
        {
          return this.mZoom;
          if (this.mZoom > 2)
          {
            this.mZoom = (-1 + this.mZoom);
            localParameters.setZoom(this.mZoom);
            this.mCamera.setParameters(localParameters);
          }
        }
      }
      catch (Exception localException)
      {
        while (true)
          SLog.d("It just didn't work.");
      }
    }
  }

  public CameraSetting openDefaultCamera(Activity paramActivity, RecordConfigUtils.RecordConfig paramRecordConfig)
  {
    boolean bool = true;
    try
    {
      if (!hasBackFacingCamera());
      while (true)
      {
        CameraSetting localCameraSetting = openDefaultCamera(paramRecordConfig, bool, getCameraRotation(paramActivity), true);
        return localCameraSetting;
        bool = false;
      }
    }
    finally
    {
    }
  }

  public CameraSetting openDefaultCamera(RecordConfigUtils.RecordConfig paramRecordConfig, boolean paramBoolean1, int paramInt, boolean paramBoolean2)
  {
    int i = -1;
    if (paramBoolean1);
    try
    {
      if (hasFrontFacingCamera())
        i = mFrontFacing[0].intValue();
      while (true)
      {
        if ((i == this.mCurrentCamera) && (paramBoolean2))
          releaseCameraAndPreview();
        CameraSetting localCameraSetting = safeCameraOpen(paramRecordConfig, paramBoolean1, i, paramInt, paramBoolean2);
        return localCameraSetting;
        if (hasBackFacingCamera())
        {
          int j = mBackFacing[0].intValue();
          i = j;
        }
      }
    }
    finally
    {
    }
  }

  public void releaseCameraAndPreview()
  {
    synchronized (this.mLOCK)
    {
      if (this.mCamera != null)
      {
        SLog.d("6,7 RELEASE Camera and STOP Preview.");
        if (isPreviewing())
          stopPreview();
        CrashUtil.log("Camera was released.");
        this.mCamera.setPreviewCallback(null);
        this.mCamera.release();
        this.mCamera = null;
        this.mCameraSetting = null;
        this.mCurrentCamera = -1;
      }
      return;
    }
  }

  public void releaseCameraResources()
  {
    this.mBufferArray.clear();
    this.mAddedBufferArray.clear();
    System.gc();
  }

  public void removeBufferFromAvailableQueue(byte[] paramArrayOfByte)
  {
    this.mAddedBufferArray.remove(paramArrayOfByte);
  }

  public boolean setFocusAreas(int paramInt1, int paramInt2)
  {
    try
    {
      initializeFocusAreas(paramInt1, paramInt2);
      Camera.Parameters localParameters = this.mCamera.getParameters();
      localParameters.setFocusAreas(this.mFocusArea);
      this.mCamera.setParameters(localParameters);
      return true;
    }
    catch (Exception localException)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = this.mMatrix;
      arrayOfObject[1] = ((Camera.Area)this.mFocusArea.get(0)).rect;
      CrashUtil.logException(localException, "Failed to set focus areas {}, {}.", arrayOfObject);
    }
    return false;
  }

  // ERROR //
  public int setFrameRate(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 105	co/vine/android/recorder/CameraManager:mLOCK	[I
    //   4: astore_2
    //   5: aload_2
    //   6: monitorenter
    //   7: aload_0
    //   8: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   11: astore 4
    //   13: aload 4
    //   15: ifnull +566 -> 581
    //   18: aload_0
    //   19: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   22: invokevirtual 271	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   25: astore 30
    //   27: aload 30
    //   29: iload_1
    //   30: sipush 1000
    //   33: imul
    //   34: iload_1
    //   35: sipush 1000
    //   38: imul
    //   39: invokevirtual 844	android/hardware/Camera$Parameters:setPreviewFpsRange	(II)V
    //   42: ldc_w 846
    //   45: invokestatic 289	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   48: aload_0
    //   49: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   52: aload 30
    //   54: invokevirtual 284	android/hardware/Camera:setParameters	(Landroid/hardware/Camera$Parameters;)V
    //   57: aload_2
    //   58: monitorexit
    //   59: iload_1
    //   60: ireturn
    //   61: astore 5
    //   63: aload_0
    //   64: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   67: invokevirtual 271	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   70: astore 29
    //   72: aload 29
    //   74: iload_1
    //   75: invokevirtual 849	android/hardware/Camera$Parameters:setPreviewFrameRate	(I)V
    //   78: aload_0
    //   79: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   82: aload 29
    //   84: invokevirtual 284	android/hardware/Camera:setParameters	(Landroid/hardware/Camera$Parameters;)V
    //   87: ldc_w 851
    //   90: invokestatic 289	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   93: aload_2
    //   94: monitorexit
    //   95: iload_1
    //   96: ireturn
    //   97: astore 6
    //   99: aload_0
    //   100: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   103: invokevirtual 271	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   106: astore 8
    //   108: aload 8
    //   110: invokevirtual 854	android/hardware/Camera$Parameters:getSupportedPreviewFpsRange	()Ljava/util/List;
    //   113: astore 10
    //   115: aload 10
    //   117: ifnonnull +25 -> 142
    //   120: ldc_w 856
    //   123: invokestatic 646	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;)V
    //   126: aload_2
    //   127: monitorexit
    //   128: iload_1
    //   129: ireturn
    //   130: astore 7
    //   132: aload_2
    //   133: monitorexit
    //   134: bipush 30
    //   136: ireturn
    //   137: astore_3
    //   138: aload_2
    //   139: monitorexit
    //   140: aload_3
    //   141: athrow
    //   142: iload_1
    //   143: sipush 1000
    //   146: imul
    //   147: istore 11
    //   149: iconst_0
    //   150: istore 12
    //   152: iconst_0
    //   153: istore 13
    //   155: iconst_m1
    //   156: istore 14
    //   158: iconst_m1
    //   159: aload 10
    //   161: invokeinterface 785 1 0
    //   166: iadd
    //   167: istore 15
    //   169: iconst_0
    //   170: istore 16
    //   172: aload 10
    //   174: invokeinterface 785 1 0
    //   179: istore 17
    //   181: aconst_null
    //   182: astore 18
    //   184: iload 16
    //   186: iload 17
    //   188: if_icmpge +38 -> 226
    //   191: aload 10
    //   193: iload 16
    //   195: invokeinterface 857 2 0
    //   200: checkcast 858	[I
    //   203: astore 19
    //   205: ldc_w 860
    //   208: aload 19
    //   210: invokestatic 192	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   213: aload 19
    //   215: iconst_0
    //   216: iaload
    //   217: iload 11
    //   219: if_icmpne +92 -> 311
    //   222: aload 19
    //   224: astore 18
    //   226: aload 18
    //   228: ifnonnull +23 -> 251
    //   231: iload 14
    //   233: iconst_m1
    //   234: if_icmpeq +160 -> 394
    //   237: aload 10
    //   239: iload 14
    //   241: invokeinterface 857 2 0
    //   246: checkcast 858	[I
    //   249: astore 18
    //   251: aload 18
    //   253: iconst_1
    //   254: iaload
    //   255: istore 20
    //   257: iload 20
    //   259: iload 11
    //   261: if_icmplt +278 -> 539
    //   264: ldc_w 862
    //   267: iload 12
    //   269: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   272: iload 11
    //   274: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   277: invokestatic 730	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   280: aload 8
    //   282: iload 12
    //   284: iload 11
    //   286: invokevirtual 844	android/hardware/Camera$Parameters:setPreviewFpsRange	(II)V
    //   289: aload_0
    //   290: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   293: aload 8
    //   295: invokevirtual 284	android/hardware/Camera:setParameters	(Landroid/hardware/Camera$Parameters;)V
    //   298: iload 11
    //   300: sipush 1000
    //   303: idiv
    //   304: istore 28
    //   306: aload_2
    //   307: monitorexit
    //   308: iload 28
    //   310: ireturn
    //   311: aload 19
    //   313: iconst_1
    //   314: iaload
    //   315: iload 11
    //   317: if_icmpne +40 -> 357
    //   320: iload 12
    //   322: aload 19
    //   324: iconst_0
    //   325: iaload
    //   326: if_icmpge +13 -> 339
    //   329: aload 19
    //   331: iconst_0
    //   332: iaload
    //   333: istore 12
    //   335: iload 16
    //   337: istore 14
    //   339: iload 13
    //   341: aload 19
    //   343: iconst_1
    //   344: iaload
    //   345: if_icmpgt +241 -> 586
    //   348: aload 19
    //   350: iconst_1
    //   351: iaload
    //   352: istore 13
    //   354: goto +232 -> 586
    //   357: iload 12
    //   359: aload 19
    //   361: iconst_0
    //   362: iaload
    //   363: if_icmpgt +223 -> 586
    //   366: aload 19
    //   368: iconst_0
    //   369: iaload
    //   370: istore 12
    //   372: iload 13
    //   374: aload 19
    //   376: iconst_1
    //   377: iaload
    //   378: if_icmpgt +208 -> 586
    //   381: aload 19
    //   383: iconst_1
    //   384: iaload
    //   385: istore 13
    //   387: iload 16
    //   389: istore 15
    //   391: goto +195 -> 586
    //   394: aload 10
    //   396: iload 15
    //   398: invokeinterface 857 2 0
    //   403: checkcast 858	[I
    //   406: astore 18
    //   408: goto -157 -> 251
    //   411: astore 22
    //   413: aload_0
    //   414: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   417: invokevirtual 271	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   420: astore 26
    //   422: ldc_w 864
    //   425: iload 11
    //   427: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   430: invokestatic 192	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   433: aload 26
    //   435: iload 11
    //   437: sipush 1000
    //   440: idiv
    //   441: invokevirtual 849	android/hardware/Camera$Parameters:setPreviewFrameRate	(I)V
    //   444: aload_0
    //   445: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   448: aload 26
    //   450: invokevirtual 284	android/hardware/Camera:setParameters	(Landroid/hardware/Camera$Parameters;)V
    //   453: iload 11
    //   455: sipush 1000
    //   458: idiv
    //   459: istore 27
    //   461: aload_2
    //   462: monitorexit
    //   463: iload 27
    //   465: ireturn
    //   466: astore 23
    //   468: aload_0
    //   469: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   472: invokevirtual 271	android/hardware/Camera:getParameters	()Landroid/hardware/Camera$Parameters;
    //   475: astore 24
    //   477: ldc_w 866
    //   480: aload 18
    //   482: iconst_0
    //   483: iaload
    //   484: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   487: aload 18
    //   489: iconst_1
    //   490: iaload
    //   491: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   494: iload 11
    //   496: invokestatic 78	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   499: invokestatic 869	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    //   502: aload 24
    //   504: aload 18
    //   506: iconst_0
    //   507: iaload
    //   508: aload 18
    //   510: iconst_1
    //   511: iaload
    //   512: invokevirtual 844	android/hardware/Camera$Parameters:setPreviewFpsRange	(II)V
    //   515: aload_0
    //   516: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   519: aload 24
    //   521: invokevirtual 284	android/hardware/Camera:setParameters	(Landroid/hardware/Camera$Parameters;)V
    //   524: aload 18
    //   526: iconst_1
    //   527: iaload
    //   528: sipush 1000
    //   531: idiv
    //   532: istore 25
    //   534: aload_2
    //   535: monitorexit
    //   536: iload 25
    //   538: ireturn
    //   539: ldc_w 871
    //   542: invokestatic 289	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   545: iload 11
    //   547: sipush 1000
    //   550: idiv
    //   551: istore 21
    //   553: aload 8
    //   555: iload 21
    //   557: invokevirtual 849	android/hardware/Camera$Parameters:setPreviewFrameRate	(I)V
    //   560: aload_0
    //   561: getfield 140	co/vine/android/recorder/CameraManager:mCamera	Landroid/hardware/Camera;
    //   564: aload 8
    //   566: invokevirtual 284	android/hardware/Camera:setParameters	(Landroid/hardware/Camera$Parameters;)V
    //   569: aload_2
    //   570: monitorexit
    //   571: iload 21
    //   573: ireturn
    //   574: astore 9
    //   576: aload_2
    //   577: monitorexit
    //   578: bipush 30
    //   580: ireturn
    //   581: aload_2
    //   582: monitorexit
    //   583: bipush 30
    //   585: ireturn
    //   586: iinc 16 1
    //   589: goto -417 -> 172
    //
    // Exception table:
    //   from	to	target	type
    //   18	57	61	java/lang/Exception
    //   63	93	97	java/lang/Exception
    //   99	108	130	java/lang/Exception
    //   7	13	137	finally
    //   18	57	137	finally
    //   57	59	137	finally
    //   63	93	137	finally
    //   93	95	137	finally
    //   99	108	137	finally
    //   108	115	137	finally
    //   120	126	137	finally
    //   126	128	137	finally
    //   132	134	137	finally
    //   138	140	137	finally
    //   158	169	137	finally
    //   172	181	137	finally
    //   191	222	137	finally
    //   237	251	137	finally
    //   251	257	137	finally
    //   264	306	137	finally
    //   306	308	137	finally
    //   311	335	137	finally
    //   339	354	137	finally
    //   357	387	137	finally
    //   394	408	137	finally
    //   413	461	137	finally
    //   461	463	137	finally
    //   468	534	137	finally
    //   534	536	137	finally
    //   539	569	137	finally
    //   569	571	137	finally
    //   576	578	137	finally
    //   581	583	137	finally
    //   264	306	411	java/lang/Exception
    //   413	461	466	java/lang/Exception
    //   108	115	574	java/lang/Exception
    //   120	126	574	java/lang/Exception
    //   158	169	574	java/lang/Exception
    //   172	181	574	java/lang/Exception
    //   191	222	574	java/lang/Exception
    //   237	251	574	java/lang/Exception
    //   251	257	574	java/lang/Exception
    //   311	335	574	java/lang/Exception
    //   339	354	574	java/lang/Exception
    //   357	387	574	java/lang/Exception
    //   394	408	574	java/lang/Exception
    //   468	534	574	java/lang/Exception
    //   539	569	574	java/lang/Exception
  }

  public void setPreviewCallback(RecordController paramRecordController)
  {
    this.mPreviewCallback = paramRecordController;
  }

  public void setPreviewHeight(int paramInt)
  {
    this.mPreviewHeight = paramInt;
  }

  public void setPreviewWidth(int paramInt)
  {
    this.mPreviewWidth = paramInt;
  }

  public boolean startContinuousAutoFocus(Camera.Parameters paramParameters)
  {
    String str = "";
    List localList = paramParameters.getSupportedFocusModes();
    if (localList == null);
    while (true)
    {
      return false;
      if (RecordConfigUtils.RecordConfig.HAS_GALAXY_FOCUS_PROBLEM)
      {
        str = "auto";
        SLog.d("Focus Mode: AUTO");
      }
      try
      {
        while (!str.equals(""))
        {
          paramParameters.setFocusMode(str);
          this.mCamera.setParameters(paramParameters);
          return true;
          if (localList.contains("continuous-video"))
          {
            str = "continuous-video";
            SLog.d("Focus Mode: CONTINUOUS VIDEO");
          }
          else if (localList.contains("infinity"))
          {
            str = "infinity";
            SLog.d("Focus Mode: INFINITY");
          }
        }
      }
      catch (Exception localException)
      {
        CrashUtil.logException(localException, "Continuous Auto Focus is not supported on this device.", new Object[0]);
      }
    }
    return false;
  }

  public void startPreview(SurfaceTexture paramSurfaceTexture, boolean paramBoolean1, boolean paramBoolean2, int paramInt1, int paramInt2, int paramInt3)
    throws CameraManager.InvalidPreviewSizeException
  {
    startPreview(null, paramSurfaceTexture, paramBoolean1, paramBoolean2, paramInt1, paramInt2, paramInt3);
  }

  public void startPreview(Surface paramSurface, boolean paramBoolean1, boolean paramBoolean2, int paramInt1, int paramInt2, int paramInt3)
    throws CameraManager.InvalidPreviewSizeException
  {
    startPreview(paramSurface, null, paramBoolean1, paramBoolean2, paramInt1, paramInt2, paramInt3);
  }

  public void stopPreview()
  {
    synchronized (this.mLOCK)
    {
      SLog.d("6. Stop Preview.");
      this.mCamera.stopPreview();
      this.isPreviewing = false;
      return;
    }
  }

  private class AddBufferThread extends Thread
  {
    public AddBufferThread()
    {
      super();
    }

    public void run()
    {
      byte[] arrayOfByte2;
      while (true)
        if (CameraManager.this.mRunAddBufferThraed)
        {
          if (CameraManager.this.mCamera == null)
            continue;
          arrayOfByte2 = (byte[])CameraManager.this.mAddArray.poll();
          if (arrayOfByte2 != null)
            break label98;
          try
          {
            Thread.sleep(50L);
          }
          catch (InterruptedException localInterruptedException)
          {
          }
        }
      ArrayList localArrayList = new ArrayList();
      while (true)
      {
        byte[] arrayOfByte1 = (byte[])CameraManager.this.mAddArray.poll();
        if (arrayOfByte1 == null)
          break label119;
        if (CameraManager.this.mCamera != null)
        {
          CameraManager.this.addCallbackBuffer(arrayOfByte1);
          continue;
          label98: CameraManager.this.addCallbackBuffer(arrayOfByte2);
          break;
        }
        localArrayList.add(arrayOfByte1);
      }
      label119: CameraManager.this.mBufferArray.addAll(localArrayList);
    }
  }

  private static class DummySurfaceHolder
    implements SurfaceHolder
  {
    private final Surface mSurface;

    public DummySurfaceHolder(Surface paramSurface)
    {
      this.mSurface = paramSurface;
    }

    public void addCallback(SurfaceHolder.Callback paramCallback)
    {
    }

    public Surface getSurface()
    {
      return this.mSurface;
    }

    public Rect getSurfaceFrame()
    {
      return null;
    }

    public boolean isCreating()
    {
      return false;
    }

    public Canvas lockCanvas()
    {
      return null;
    }

    public Canvas lockCanvas(Rect paramRect)
    {
      return null;
    }

    public void removeCallback(SurfaceHolder.Callback paramCallback)
    {
    }

    public void setFixedSize(int paramInt1, int paramInt2)
    {
    }

    public void setFormat(int paramInt)
    {
    }

    public void setKeepScreenOn(boolean paramBoolean)
    {
    }

    public void setSizeFromLayout()
    {
    }

    public void setType(int paramInt)
    {
    }

    public void unlockCanvasAndPost(Canvas paramCanvas)
    {
    }
  }

  public static class InvalidPreviewSizeException extends Exception
  {
    public InvalidPreviewSizeException(String paramString)
    {
      super();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.CameraManager
 * JD-Core Version:    0.6.2
 */