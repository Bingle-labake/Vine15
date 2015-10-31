package android.support.v8.renderscript;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.graphics.Bitmap;
import android.os.Build.VERSION;
import android.os.SystemProperties;
import android.util.Log;
import java.io.File;

public class RenderScript
{
  private static final String CACHE_PATH = "com.android.renderscript.cache";
  static final boolean DEBUG = false;
  static final boolean LOG_ENABLED = false;
  static final String LOG_TAG = "RenderScript_jni";
  static boolean isNative = false;
  static Object lock = new Object();
  static String mCachePath;
  static boolean sInitialized;
  private static int thunk = 0;
  private Context mApplicationContext;
  int mContext;
  int mDev;
  Element mElement_ALLOCATION;
  Element mElement_A_8;
  Element mElement_BOOLEAN;
  Element mElement_CHAR_2;
  Element mElement_CHAR_3;
  Element mElement_CHAR_4;
  Element mElement_DOUBLE_2;
  Element mElement_DOUBLE_3;
  Element mElement_DOUBLE_4;
  Element mElement_ELEMENT;
  Element mElement_F32;
  Element mElement_F64;
  Element mElement_FLOAT_2;
  Element mElement_FLOAT_3;
  Element mElement_FLOAT_4;
  Element mElement_I16;
  Element mElement_I32;
  Element mElement_I64;
  Element mElement_I8;
  Element mElement_INT_2;
  Element mElement_INT_3;
  Element mElement_INT_4;
  Element mElement_LONG_2;
  Element mElement_LONG_3;
  Element mElement_LONG_4;
  Element mElement_MATRIX_2X2;
  Element mElement_MATRIX_3X3;
  Element mElement_MATRIX_4X4;
  Element mElement_RGBA_4444;
  Element mElement_RGBA_5551;
  Element mElement_RGBA_8888;
  Element mElement_RGB_565;
  Element mElement_RGB_888;
  Element mElement_SAMPLER;
  Element mElement_SCRIPT;
  Element mElement_SHORT_2;
  Element mElement_SHORT_3;
  Element mElement_SHORT_4;
  Element mElement_TYPE;
  Element mElement_U16;
  Element mElement_U32;
  Element mElement_U64;
  Element mElement_U8;
  Element mElement_UCHAR_2;
  Element mElement_UCHAR_3;
  Element mElement_UCHAR_4;
  Element mElement_UINT_2;
  Element mElement_UINT_3;
  Element mElement_UINT_4;
  Element mElement_ULONG_2;
  Element mElement_ULONG_3;
  Element mElement_ULONG_4;
  Element mElement_USHORT_2;
  Element mElement_USHORT_3;
  Element mElement_USHORT_4;
  RSErrorHandler mErrorCallback = null;
  RSMessageHandler mMessageCallback = null;
  MessageThread mMessageThread;
  Sampler mSampler_CLAMP_LINEAR;
  Sampler mSampler_CLAMP_LINEAR_MIP_LINEAR;
  Sampler mSampler_CLAMP_NEAREST;
  Sampler mSampler_MIRRORED_REPEAT_LINEAR;
  Sampler mSampler_MIRRORED_REPEAT_LINEAR_MIP_LINEAR;
  Sampler mSampler_MIRRORED_REPEAT_NEAREST;
  Sampler mSampler_WRAP_LINEAR;
  Sampler mSampler_WRAP_LINEAR_MIP_LINEAR;
  Sampler mSampler_WRAP_NEAREST;

  RenderScript(Context paramContext)
  {
    if (paramContext != null)
      this.mApplicationContext = paramContext.getApplicationContext();
  }

  public static RenderScript create(Context paramContext)
  {
    return create(paramContext, ContextType.NORMAL);
  }

  public static RenderScript create(Context paramContext, int paramInt)
  {
    return create(paramContext, paramInt, ContextType.NORMAL);
  }

  public static RenderScript create(Context paramContext, int paramInt, ContextType paramContextType)
  {
    RenderScript localRenderScript = new RenderScript(paramContext);
    if (shouldThunk())
    {
      Log.v("RenderScript_jni", "RS native mode");
      return RenderScriptThunker.create(paramContext, paramInt);
    }
    synchronized (lock)
    {
      boolean bool = sInitialized;
      if (!bool);
      try
      {
        System.loadLibrary("RSSupport");
        System.loadLibrary("rsjni");
        sInitialized = true;
        Log.v("RenderScript_jni", "RS compat mode");
        localRenderScript.mDev = localRenderScript.nDeviceCreate();
        localRenderScript.mContext = localRenderScript.nContextCreate(localRenderScript.mDev, 0, paramInt, paramContextType.mID);
        if (localRenderScript.mContext == 0)
          throw new RSDriverException("Failed to create RS context.");
      }
      catch (UnsatisfiedLinkError localUnsatisfiedLinkError)
      {
        Log.e("RenderScript_jni", "Error loading RS jni library: " + localUnsatisfiedLinkError);
        throw new RSRuntimeException("Error loading RS jni library: " + localUnsatisfiedLinkError);
      }
    }
    localRenderScript.mMessageThread = new MessageThread(localRenderScript);
    localRenderScript.mMessageThread.start();
    return localRenderScript;
  }

  public static RenderScript create(Context paramContext, ContextType paramContextType)
  {
    return create(paramContext, paramContext.getApplicationInfo().targetSdkVersion, paramContextType);
  }

  public static void setupDiskCache(File paramFile)
  {
    File localFile = new File(paramFile, "com.android.renderscript.cache");
    mCachePath = localFile.getAbsolutePath();
    localFile.mkdirs();
  }

  static boolean shouldThunk()
  {
    if (thunk == 0)
      if ((Build.VERSION.SDK_INT < 18) || (SystemProperties.getInt("debug.rs.forcecompat", 0) != 0))
        break label36;
    label36: for (thunk = 1; thunk == 1; thunk = -1)
      return true;
    return false;
  }

  public void contextDump()
  {
    validate();
    nContextDump(0);
  }

  public void destroy()
  {
    validate();
    nContextDeinitToClient(this.mContext);
    this.mMessageThread.mRun = false;
    try
    {
      this.mMessageThread.join();
      label27: nContextDestroy();
      this.mContext = 0;
      nDeviceDestroy(this.mDev);
      this.mDev = 0;
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      break label27;
    }
  }

  public void finish()
  {
    nContextFinish();
  }

  public final Context getApplicationContext()
  {
    return this.mApplicationContext;
  }

  public RSErrorHandler getErrorHandler()
  {
    return this.mErrorCallback;
  }

  public RSMessageHandler getMessageHandler()
  {
    return this.mMessageCallback;
  }

  boolean isAlive()
  {
    return this.mContext != 0;
  }

  void nAllocationCopyFromBitmap(int paramInt, Bitmap paramBitmap)
  {
    try
    {
      validate();
      rsnAllocationCopyFromBitmap(this.mContext, paramInt, paramBitmap);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationCopyToBitmap(int paramInt, Bitmap paramBitmap)
  {
    try
    {
      validate();
      rsnAllocationCopyToBitmap(this.mContext, paramInt, paramBitmap);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nAllocationCreateBitmapBackedAllocation(int paramInt1, int paramInt2, Bitmap paramBitmap, int paramInt3)
  {
    try
    {
      validate();
      int i = rsnAllocationCreateBitmapBackedAllocation(this.mContext, paramInt1, paramInt2, paramBitmap, paramInt3);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nAllocationCreateBitmapRef(int paramInt, Bitmap paramBitmap)
  {
    try
    {
      validate();
      int i = rsnAllocationCreateBitmapRef(this.mContext, paramInt, paramBitmap);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nAllocationCreateFromAssetStream(int paramInt1, int paramInt2, int paramInt3)
  {
    try
    {
      validate();
      int i = rsnAllocationCreateFromAssetStream(this.mContext, paramInt1, paramInt2, paramInt3);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nAllocationCreateFromBitmap(int paramInt1, int paramInt2, Bitmap paramBitmap, int paramInt3)
  {
    try
    {
      validate();
      int i = rsnAllocationCreateFromBitmap(this.mContext, paramInt1, paramInt2, paramBitmap, paramInt3);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nAllocationCreateTyped(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    try
    {
      validate();
      int i = rsnAllocationCreateTyped(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nAllocationCubeCreateFromBitmap(int paramInt1, int paramInt2, Bitmap paramBitmap, int paramInt3)
  {
    try
    {
      validate();
      int i = rsnAllocationCubeCreateFromBitmap(this.mContext, paramInt1, paramInt2, paramBitmap, paramInt3);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, byte[] paramArrayOfByte, int paramInt5)
  {
    try
    {
      validate();
      rsnAllocationData1D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramArrayOfByte, paramInt5);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, float[] paramArrayOfFloat, int paramInt5)
  {
    try
    {
      validate();
      rsnAllocationData1D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramArrayOfFloat, paramInt5);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int[] paramArrayOfInt, int paramInt5)
  {
    try
    {
      validate();
      rsnAllocationData1D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramArrayOfInt, paramInt5);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, short[] paramArrayOfShort, int paramInt5)
  {
    try
    {
      validate();
      rsnAllocationData1D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramArrayOfShort, paramInt5);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11, int paramInt12)
  {
    try
    {
      validate();
      rsnAllocationData2D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10, paramInt11, paramInt12);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, byte[] paramArrayOfByte, int paramInt8)
  {
    try
    {
      validate();
      rsnAllocationData2D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramArrayOfByte, paramInt8);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, float[] paramArrayOfFloat, int paramInt8)
  {
    try
    {
      validate();
      rsnAllocationData2D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramArrayOfFloat, paramInt8);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int[] paramArrayOfInt, int paramInt8)
  {
    try
    {
      validate();
      rsnAllocationData2D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramArrayOfInt, paramInt8);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, short[] paramArrayOfShort, int paramInt8)
  {
    try
    {
      validate();
      rsnAllocationData2D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramArrayOfShort, paramInt8);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, Bitmap paramBitmap)
  {
    try
    {
      validate();
      rsnAllocationData2D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramBitmap);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11, int paramInt12, int paramInt13)
  {
    try
    {
      validate();
      rsnAllocationData3D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10, paramInt11, paramInt12, paramInt13);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, byte[] paramArrayOfByte, int paramInt9)
  {
    try
    {
      validate();
      rsnAllocationData3D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramArrayOfByte, paramInt9);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, float[] paramArrayOfFloat, int paramInt9)
  {
    try
    {
      validate();
      rsnAllocationData3D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramArrayOfFloat, paramInt9);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int[] paramArrayOfInt, int paramInt9)
  {
    try
    {
      validate();
      rsnAllocationData3D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramArrayOfInt, paramInt9);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, short[] paramArrayOfShort, int paramInt9)
  {
    try
    {
      validate();
      rsnAllocationData3D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramArrayOfShort, paramInt9);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationElementData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, byte[] paramArrayOfByte, int paramInt5)
  {
    try
    {
      validate();
      rsnAllocationElementData1D(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramArrayOfByte, paramInt5);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationGenerateMipmaps(int paramInt)
  {
    try
    {
      validate();
      rsnAllocationGenerateMipmaps(this.mContext, paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nAllocationGetType(int paramInt)
  {
    try
    {
      validate();
      int i = rsnAllocationGetType(this.mContext, paramInt);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationIoReceive(int paramInt)
  {
    try
    {
      validate();
      rsnAllocationIoReceive(this.mContext, paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationIoSend(int paramInt)
  {
    try
    {
      validate();
      rsnAllocationIoSend(this.mContext, paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationRead(int paramInt, byte[] paramArrayOfByte)
  {
    try
    {
      validate();
      rsnAllocationRead(this.mContext, paramInt, paramArrayOfByte);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationRead(int paramInt, float[] paramArrayOfFloat)
  {
    try
    {
      validate();
      rsnAllocationRead(this.mContext, paramInt, paramArrayOfFloat);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationRead(int paramInt, int[] paramArrayOfInt)
  {
    try
    {
      validate();
      rsnAllocationRead(this.mContext, paramInt, paramArrayOfInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationRead(int paramInt, short[] paramArrayOfShort)
  {
    try
    {
      validate();
      rsnAllocationRead(this.mContext, paramInt, paramArrayOfShort);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationResize1D(int paramInt1, int paramInt2)
  {
    try
    {
      validate();
      rsnAllocationResize1D(this.mContext, paramInt1, paramInt2);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationResize2D(int paramInt1, int paramInt2, int paramInt3)
  {
    try
    {
      validate();
      rsnAllocationResize2D(this.mContext, paramInt1, paramInt2, paramInt3);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nAllocationSyncAll(int paramInt1, int paramInt2)
  {
    try
    {
      validate();
      rsnAllocationSyncAll(this.mContext, paramInt1, paramInt2);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nContextCreate(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    try
    {
      int i = rsnContextCreate(paramInt1, paramInt2, paramInt3, paramInt4);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  native void nContextDeinitToClient(int paramInt);

  void nContextDestroy()
  {
    try
    {
      validate();
      rsnContextDestroy(this.mContext);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nContextDump(int paramInt)
  {
    try
    {
      validate();
      rsnContextDump(this.mContext, paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nContextFinish()
  {
    try
    {
      validate();
      rsnContextFinish(this.mContext);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  native String nContextGetErrorMessage(int paramInt);

  native int nContextGetUserMessage(int paramInt, int[] paramArrayOfInt);

  native void nContextInitToClient(int paramInt);

  native int nContextPeekMessage(int paramInt, int[] paramArrayOfInt);

  void nContextSendMessage(int paramInt, int[] paramArrayOfInt)
  {
    try
    {
      validate();
      rsnContextSendMessage(this.mContext, paramInt, paramArrayOfInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nContextSetPriority(int paramInt)
  {
    try
    {
      validate();
      rsnContextSetPriority(this.mContext, paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  native int nDeviceCreate();

  native void nDeviceDestroy(int paramInt);

  native void nDeviceSetConfig(int paramInt1, int paramInt2, int paramInt3);

  int nElementCreate(int paramInt1, int paramInt2, boolean paramBoolean, int paramInt3)
  {
    try
    {
      validate();
      int i = rsnElementCreate(this.mContext, paramInt1, paramInt2, paramBoolean, paramInt3);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nElementCreate2(int[] paramArrayOfInt1, String[] paramArrayOfString, int[] paramArrayOfInt2)
  {
    try
    {
      validate();
      int i = rsnElementCreate2(this.mContext, paramArrayOfInt1, paramArrayOfString, paramArrayOfInt2);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nElementGetNativeData(int paramInt, int[] paramArrayOfInt)
  {
    try
    {
      validate();
      rsnElementGetNativeData(this.mContext, paramInt, paramArrayOfInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nElementGetSubElements(int paramInt, int[] paramArrayOfInt1, String[] paramArrayOfString, int[] paramArrayOfInt2)
  {
    try
    {
      validate();
      rsnElementGetSubElements(this.mContext, paramInt, paramArrayOfInt1, paramArrayOfString, paramArrayOfInt2);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nObjDestroy(int paramInt)
  {
    try
    {
      if (this.mContext != 0)
        rsnObjDestroy(this.mContext, paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nSamplerCreate(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, float paramFloat)
  {
    try
    {
      validate();
      int i = rsnSamplerCreate(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramFloat);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptBindAllocation(int paramInt1, int paramInt2, int paramInt3)
  {
    try
    {
      validate();
      rsnScriptBindAllocation(this.mContext, paramInt1, paramInt2, paramInt3);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nScriptCCreate(String paramString1, String paramString2, byte[] paramArrayOfByte, int paramInt)
  {
    try
    {
      validate();
      int i = rsnScriptCCreate(this.mContext, paramString1, paramString2, paramArrayOfByte, paramInt);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nScriptFieldIDCreate(int paramInt1, int paramInt2)
  {
    try
    {
      validate();
      int i = rsnScriptFieldIDCreate(this.mContext, paramInt1, paramInt2);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptForEach(int paramInt1, int paramInt2, int paramInt3, int paramInt4, byte[] paramArrayOfByte)
  {
    try
    {
      validate();
      if (paramArrayOfByte == null)
        rsnScriptForEach(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4);
      while (true)
      {
        return;
        rsnScriptForEach(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramArrayOfByte);
      }
    }
    finally
    {
    }
  }

  void nScriptForEachClipped(int paramInt1, int paramInt2, int paramInt3, int paramInt4, byte[] paramArrayOfByte, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10)
  {
    try
    {
      validate();
      if (paramArrayOfByte == null)
        rsnScriptForEachClipped(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10);
      while (true)
      {
        return;
        rsnScriptForEachClipped(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramArrayOfByte, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10);
      }
    }
    finally
    {
    }
  }

  int nScriptGroupCreate(int[] paramArrayOfInt1, int[] paramArrayOfInt2, int[] paramArrayOfInt3, int[] paramArrayOfInt4, int[] paramArrayOfInt5)
  {
    try
    {
      validate();
      int i = rsnScriptGroupCreate(this.mContext, paramArrayOfInt1, paramArrayOfInt2, paramArrayOfInt3, paramArrayOfInt4, paramArrayOfInt5);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptGroupExecute(int paramInt)
  {
    try
    {
      validate();
      rsnScriptGroupExecute(this.mContext, paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptGroupSetInput(int paramInt1, int paramInt2, int paramInt3)
  {
    try
    {
      validate();
      rsnScriptGroupSetInput(this.mContext, paramInt1, paramInt2, paramInt3);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptGroupSetOutput(int paramInt1, int paramInt2, int paramInt3)
  {
    try
    {
      validate();
      rsnScriptGroupSetOutput(this.mContext, paramInt1, paramInt2, paramInt3);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nScriptIntrinsicCreate(int paramInt1, int paramInt2)
  {
    try
    {
      validate();
      int i = rsnScriptIntrinsicCreate(this.mContext, paramInt1, paramInt2);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptInvoke(int paramInt1, int paramInt2)
  {
    try
    {
      validate();
      rsnScriptInvoke(this.mContext, paramInt1, paramInt2);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptInvokeV(int paramInt1, int paramInt2, byte[] paramArrayOfByte)
  {
    try
    {
      validate();
      rsnScriptInvokeV(this.mContext, paramInt1, paramInt2, paramArrayOfByte);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nScriptKernelIDCreate(int paramInt1, int paramInt2, int paramInt3)
  {
    try
    {
      validate();
      int i = rsnScriptKernelIDCreate(this.mContext, paramInt1, paramInt2, paramInt3);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptSetTimeZone(int paramInt, byte[] paramArrayOfByte)
  {
    try
    {
      validate();
      rsnScriptSetTimeZone(this.mContext, paramInt, paramArrayOfByte);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptSetVarD(int paramInt1, int paramInt2, double paramDouble)
  {
    try
    {
      validate();
      rsnScriptSetVarD(this.mContext, paramInt1, paramInt2, paramDouble);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptSetVarF(int paramInt1, int paramInt2, float paramFloat)
  {
    try
    {
      validate();
      rsnScriptSetVarF(this.mContext, paramInt1, paramInt2, paramFloat);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptSetVarI(int paramInt1, int paramInt2, int paramInt3)
  {
    try
    {
      validate();
      rsnScriptSetVarI(this.mContext, paramInt1, paramInt2, paramInt3);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptSetVarJ(int paramInt1, int paramInt2, long paramLong)
  {
    try
    {
      validate();
      rsnScriptSetVarJ(this.mContext, paramInt1, paramInt2, paramLong);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptSetVarObj(int paramInt1, int paramInt2, int paramInt3)
  {
    try
    {
      validate();
      rsnScriptSetVarObj(this.mContext, paramInt1, paramInt2, paramInt3);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptSetVarV(int paramInt1, int paramInt2, byte[] paramArrayOfByte)
  {
    try
    {
      validate();
      rsnScriptSetVarV(this.mContext, paramInt1, paramInt2, paramArrayOfByte);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nScriptSetVarVE(int paramInt1, int paramInt2, byte[] paramArrayOfByte, int paramInt3, int[] paramArrayOfInt)
  {
    try
    {
      validate();
      rsnScriptSetVarVE(this.mContext, paramInt1, paramInt2, paramArrayOfByte, paramInt3, paramArrayOfInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int nTypeCreate(int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean1, boolean paramBoolean2, int paramInt5)
  {
    try
    {
      validate();
      int i = rsnTypeCreate(this.mContext, paramInt1, paramInt2, paramInt3, paramInt4, paramBoolean1, paramBoolean2, paramInt5);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void nTypeGetNativeData(int paramInt, int[] paramArrayOfInt)
  {
    try
    {
      validate();
      rsnTypeGetNativeData(this.mContext, paramInt, paramArrayOfInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  native void rsnAllocationCopyFromBitmap(int paramInt1, int paramInt2, Bitmap paramBitmap);

  native void rsnAllocationCopyToBitmap(int paramInt1, int paramInt2, Bitmap paramBitmap);

  native int rsnAllocationCreateBitmapBackedAllocation(int paramInt1, int paramInt2, int paramInt3, Bitmap paramBitmap, int paramInt4);

  native int rsnAllocationCreateBitmapRef(int paramInt1, int paramInt2, Bitmap paramBitmap);

  native int rsnAllocationCreateFromAssetStream(int paramInt1, int paramInt2, int paramInt3, int paramInt4);

  native int rsnAllocationCreateFromBitmap(int paramInt1, int paramInt2, int paramInt3, Bitmap paramBitmap, int paramInt4);

  native int rsnAllocationCreateTyped(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5);

  native int rsnAllocationCubeCreateFromBitmap(int paramInt1, int paramInt2, int paramInt3, Bitmap paramBitmap, int paramInt4);

  native void rsnAllocationData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, byte[] paramArrayOfByte, int paramInt6);

  native void rsnAllocationData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, float[] paramArrayOfFloat, int paramInt6);

  native void rsnAllocationData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int[] paramArrayOfInt, int paramInt6);

  native void rsnAllocationData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, short[] paramArrayOfShort, int paramInt6);

  native void rsnAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11, int paramInt12, int paramInt13);

  native void rsnAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, byte[] paramArrayOfByte, int paramInt9);

  native void rsnAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, float[] paramArrayOfFloat, int paramInt9);

  native void rsnAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int[] paramArrayOfInt, int paramInt9);

  native void rsnAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, short[] paramArrayOfShort, int paramInt9);

  native void rsnAllocationData2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, Bitmap paramBitmap);

  native void rsnAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11, int paramInt12, int paramInt13, int paramInt14);

  native void rsnAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, byte[] paramArrayOfByte, int paramInt10);

  native void rsnAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, float[] paramArrayOfFloat, int paramInt10);

  native void rsnAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int[] paramArrayOfInt, int paramInt10);

  native void rsnAllocationData3D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, short[] paramArrayOfShort, int paramInt10);

  native void rsnAllocationElementData1D(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, byte[] paramArrayOfByte, int paramInt6);

  native void rsnAllocationGenerateMipmaps(int paramInt1, int paramInt2);

  native int rsnAllocationGetType(int paramInt1, int paramInt2);

  native void rsnAllocationIoReceive(int paramInt1, int paramInt2);

  native void rsnAllocationIoSend(int paramInt1, int paramInt2);

  native void rsnAllocationRead(int paramInt1, int paramInt2, byte[] paramArrayOfByte);

  native void rsnAllocationRead(int paramInt1, int paramInt2, float[] paramArrayOfFloat);

  native void rsnAllocationRead(int paramInt1, int paramInt2, int[] paramArrayOfInt);

  native void rsnAllocationRead(int paramInt1, int paramInt2, short[] paramArrayOfShort);

  native void rsnAllocationResize1D(int paramInt1, int paramInt2, int paramInt3);

  native void rsnAllocationResize2D(int paramInt1, int paramInt2, int paramInt3, int paramInt4);

  native void rsnAllocationSyncAll(int paramInt1, int paramInt2, int paramInt3);

  native int rsnContextCreate(int paramInt1, int paramInt2, int paramInt3, int paramInt4);

  native void rsnContextDestroy(int paramInt);

  native void rsnContextDump(int paramInt1, int paramInt2);

  native void rsnContextFinish(int paramInt);

  native void rsnContextSendMessage(int paramInt1, int paramInt2, int[] paramArrayOfInt);

  native void rsnContextSetPriority(int paramInt1, int paramInt2);

  native int rsnElementCreate(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4);

  native int rsnElementCreate2(int paramInt, int[] paramArrayOfInt1, String[] paramArrayOfString, int[] paramArrayOfInt2);

  native void rsnElementGetNativeData(int paramInt1, int paramInt2, int[] paramArrayOfInt);

  native void rsnElementGetSubElements(int paramInt1, int paramInt2, int[] paramArrayOfInt1, String[] paramArrayOfString, int[] paramArrayOfInt2);

  native void rsnObjDestroy(int paramInt1, int paramInt2);

  native int rsnSamplerCreate(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, float paramFloat);

  native void rsnScriptBindAllocation(int paramInt1, int paramInt2, int paramInt3, int paramInt4);

  native int rsnScriptCCreate(int paramInt1, String paramString1, String paramString2, byte[] paramArrayOfByte, int paramInt2);

  native int rsnScriptFieldIDCreate(int paramInt1, int paramInt2, int paramInt3);

  native void rsnScriptForEach(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5);

  native void rsnScriptForEach(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, byte[] paramArrayOfByte);

  native void rsnScriptForEachClipped(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11);

  native void rsnScriptForEachClipped(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, byte[] paramArrayOfByte, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11);

  native int rsnScriptGroupCreate(int paramInt, int[] paramArrayOfInt1, int[] paramArrayOfInt2, int[] paramArrayOfInt3, int[] paramArrayOfInt4, int[] paramArrayOfInt5);

  native void rsnScriptGroupExecute(int paramInt1, int paramInt2);

  native void rsnScriptGroupSetInput(int paramInt1, int paramInt2, int paramInt3, int paramInt4);

  native void rsnScriptGroupSetOutput(int paramInt1, int paramInt2, int paramInt3, int paramInt4);

  native int rsnScriptIntrinsicCreate(int paramInt1, int paramInt2, int paramInt3);

  native void rsnScriptInvoke(int paramInt1, int paramInt2, int paramInt3);

  native void rsnScriptInvokeV(int paramInt1, int paramInt2, int paramInt3, byte[] paramArrayOfByte);

  native int rsnScriptKernelIDCreate(int paramInt1, int paramInt2, int paramInt3, int paramInt4);

  native void rsnScriptSetTimeZone(int paramInt1, int paramInt2, byte[] paramArrayOfByte);

  native void rsnScriptSetVarD(int paramInt1, int paramInt2, int paramInt3, double paramDouble);

  native void rsnScriptSetVarF(int paramInt1, int paramInt2, int paramInt3, float paramFloat);

  native void rsnScriptSetVarI(int paramInt1, int paramInt2, int paramInt3, int paramInt4);

  native void rsnScriptSetVarJ(int paramInt1, int paramInt2, int paramInt3, long paramLong);

  native void rsnScriptSetVarObj(int paramInt1, int paramInt2, int paramInt3, int paramInt4);

  native void rsnScriptSetVarV(int paramInt1, int paramInt2, int paramInt3, byte[] paramArrayOfByte);

  native void rsnScriptSetVarVE(int paramInt1, int paramInt2, int paramInt3, byte[] paramArrayOfByte, int paramInt4, int[] paramArrayOfInt);

  native int rsnTypeCreate(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, boolean paramBoolean1, boolean paramBoolean2, int paramInt6);

  native void rsnTypeGetNativeData(int paramInt1, int paramInt2, int[] paramArrayOfInt);

  int safeID(BaseObj paramBaseObj)
  {
    if (paramBaseObj != null)
      return paramBaseObj.getID(this);
    return 0;
  }

  public void sendMessage(int paramInt, int[] paramArrayOfInt)
  {
    nContextSendMessage(paramInt, paramArrayOfInt);
  }

  public void setErrorHandler(RSErrorHandler paramRSErrorHandler)
  {
    this.mErrorCallback = paramRSErrorHandler;
    if (isNative)
    {
      RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)this;
      android.renderscript.RenderScript.RSErrorHandler local2 = new android.renderscript.RenderScript.RSErrorHandler()
      {
        public void run()
        {
          RenderScript.this.mErrorCallback.mErrorMessage = this.mErrorMessage;
          RenderScript.this.mErrorCallback.mErrorNum = this.mErrorNum;
          RenderScript.this.mErrorCallback.run();
        }
      };
      localRenderScriptThunker.mN.setErrorHandler(local2);
    }
  }

  public void setMessageHandler(RSMessageHandler paramRSMessageHandler)
  {
    this.mMessageCallback = paramRSMessageHandler;
    if (isNative)
    {
      RenderScriptThunker localRenderScriptThunker = (RenderScriptThunker)this;
      android.renderscript.RenderScript.RSMessageHandler local1 = new android.renderscript.RenderScript.RSMessageHandler()
      {
        public void run()
        {
          RenderScript.this.mMessageCallback.mData = this.mData;
          RenderScript.this.mMessageCallback.mID = this.mID;
          RenderScript.this.mMessageCallback.mLength = this.mLength;
          RenderScript.this.mMessageCallback.run();
        }
      };
      localRenderScriptThunker.mN.setMessageHandler(local1);
    }
  }

  public void setPriority(Priority paramPriority)
  {
    validate();
    nContextSetPriority(paramPriority.mID);
  }

  void validate()
  {
    if (this.mContext == 0)
      throw new RSInvalidStateException("Calling RS with no Context active.");
  }

  public static enum ContextType
  {
    int mID;

    static
    {
      DEBUG = new ContextType("DEBUG", 1, 1);
      PROFILE = new ContextType("PROFILE", 2, 2);
      ContextType[] arrayOfContextType = new ContextType[3];
      arrayOfContextType[0] = NORMAL;
      arrayOfContextType[1] = DEBUG;
      arrayOfContextType[2] = PROFILE;
    }

    private ContextType(int paramInt)
    {
      this.mID = paramInt;
    }
  }

  static class MessageThread extends Thread
  {
    static final int RS_ERROR_FATAL_UNKNOWN = 4096;
    static final int RS_MESSAGE_TO_CLIENT_ERROR = 3;
    static final int RS_MESSAGE_TO_CLIENT_EXCEPTION = 1;
    static final int RS_MESSAGE_TO_CLIENT_NONE = 0;
    static final int RS_MESSAGE_TO_CLIENT_RESIZE = 2;
    static final int RS_MESSAGE_TO_CLIENT_USER = 4;
    int[] mAuxData = new int[2];
    RenderScript mRS;
    boolean mRun = true;

    MessageThread(RenderScript paramRenderScript)
    {
      super();
      this.mRS = paramRenderScript;
    }

    public void run()
    {
      int[] arrayOfInt = new int[16];
      this.mRS.nContextInitToClient(this.mRS.mContext);
      while (this.mRun)
      {
        arrayOfInt[0] = 0;
        int i = this.mRS.nContextPeekMessage(this.mRS.mContext, this.mAuxData);
        int j = this.mAuxData[1];
        int k = this.mAuxData[0];
        if (i == 4)
        {
          if (j >> 2 >= arrayOfInt.length)
            arrayOfInt = new int[j + 3 >> 2];
          if (this.mRS.nContextGetUserMessage(this.mRS.mContext, arrayOfInt) != 4)
            throw new RSDriverException("Error processing message from RenderScript.");
          if (this.mRS.mMessageCallback != null)
          {
            this.mRS.mMessageCallback.mData = arrayOfInt;
            this.mRS.mMessageCallback.mID = k;
            this.mRS.mMessageCallback.mLength = j;
            this.mRS.mMessageCallback.run();
          }
          else
          {
            throw new RSInvalidStateException("Received a message from the script with no message handler installed.");
          }
        }
        else if (i == 3)
        {
          String str = this.mRS.nContextGetErrorMessage(this.mRS.mContext);
          if (k >= 4096)
            throw new RSRuntimeException("Fatal error " + k + ", details: " + str);
          if (this.mRS.mErrorCallback != null)
          {
            this.mRS.mErrorCallback.mErrorMessage = str;
            this.mRS.mErrorCallback.mErrorNum = k;
            this.mRS.mErrorCallback.run();
          }
          else
          {
            Log.e("RenderScript_jni", "non fatal RS error, " + str);
          }
        }
        else
        {
          try
          {
            sleep(1L, 0);
          }
          catch (InterruptedException localInterruptedException)
          {
          }
        }
      }
    }
  }

  public static enum Priority
  {
    int mID;

    static
    {
      Priority[] arrayOfPriority = new Priority[2];
      arrayOfPriority[0] = LOW;
      arrayOfPriority[1] = NORMAL;
    }

    private Priority(int paramInt)
    {
      this.mID = paramInt;
    }
  }

  public static class RSErrorHandler
    implements Runnable
  {
    protected String mErrorMessage;
    protected int mErrorNum;

    public void run()
    {
    }
  }

  public static class RSMessageHandler
    implements Runnable
  {
    protected int[] mData;
    protected int mID;
    protected int mLength;

    public void run()
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     android.support.v8.renderscript.RenderScript
 * JD-Core Version:    0.6.2
 */