package co.vine.android.recorder;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.support.v8.renderscript.RenderScript;
import co.vine.android.util.CrashUtil;
import com.edisonwang.android.slog.SLog;
import java.nio.IntBuffer;

public class PictureConverter
{
  private static final int A = -16777216;
  public final int[] LOCK = new int[0];
  private int lastH;
  private int lastW;
  private int mCurrentFrameSize;
  private RsYuv mFilterYuv;
  private IntBuffer mIntBuffer;
  private int mLastDegree = -99999;
  private boolean mLastFront;
  private boolean mLastMirrored = false;
  private final Matrix mMatrix;
  private final Paint mPaint;
  private RenderScript mRS;
  private ScaleStep mScaleStep;
  private final int mTargetSize;
  private Bitmap srcBmp;

  public PictureConverter(RenderScript paramRenderScript, int paramInt, CameraSetting paramCameraSetting)
  {
    this.mRS = paramRenderScript;
    this.mMatrix = new Matrix();
    this.mTargetSize = paramInt;
    this.mPaint = new Paint();
    setCameraSetting(paramCameraSetting);
  }

  private void allocate(int paramInt1, int paramInt2, int paramInt3)
  {
    this.mFilterYuv = new RsYuv(this.mRS, paramInt2, paramInt3);
  }

  private void convertUsingRenderScript(CameraSetting paramCameraSetting, VideoData paramVideoData, boolean paramBoolean)
  {
    if (paramVideoData.data == null)
      CrashUtil.log("Data is null.");
    if ((this.mRS != null) && ((this.mFilterYuv == null) || (paramBoolean)))
      this.mFilterYuv = new RsYuv(this.mRS, paramCameraSetting.originalW, paramCameraSetting.originalH);
    this.mFilterYuv.execute(paramVideoData.data, this.srcBmp);
  }

  private void giveMatrixNewValuesWithScaleIfDegreeHasChanged(int paramInt, boolean paramBoolean)
  {
    int i;
    int j;
    label41: float f1;
    float f4;
    float f5;
    if ((this.mLastDegree != paramInt) || (this.mLastMirrored != paramBoolean))
    {
      if (this.mScaleStep != null)
        break label186;
      i = this.lastW;
      if (this.mScaleStep != null)
        break label197;
      j = this.lastH;
      this.mMatrix.reset();
      f1 = Math.max(this.mTargetSize / i, this.mTargetSize / j);
      float f2 = f1 * i;
      float f3 = f1 * j;
      f4 = -(f2 - this.mTargetSize) / 2.0F;
      f5 = -(f3 - this.mTargetSize) / 2.0F;
      this.mMatrix.postRotate(paramInt, i / 2, j / 2);
      SLog.d("Creating with mirrored {}.", Boolean.valueOf(paramBoolean));
      if (!paramBoolean)
        break label209;
      this.mMatrix.postScale(-f1, f1);
      this.mMatrix.postTranslate(-f4 + this.mTargetSize, f5);
    }
    while (true)
    {
      this.mLastMirrored = paramBoolean;
      this.mLastDegree = paramInt;
      return;
      label186: i = this.mScaleStep.scaledW;
      break;
      label197: j = this.mScaleStep.scaledH;
      break label41;
      label209: this.mMatrix.postScale(f1, f1);
      this.mMatrix.postTranslate(f4, f5);
    }
  }

  private void setCameraSetting(CameraSetting paramCameraSetting)
  {
    this.srcBmp = Bitmap.createBitmap(paramCameraSetting.originalW, paramCameraSetting.originalH, RecordConfigUtils.DEFAULT_BITMAP_CONFIG);
    this.mCurrentFrameSize = (paramCameraSetting.originalW * paramCameraSetting.originalH);
    this.lastH = paramCameraSetting.originalH;
    this.lastW = paramCameraSetting.originalW;
    this.mLastFront = paramCameraSetting.frontFacing;
    if ((paramCameraSetting.frontFacing) && (paramCameraSetting.frontFacingAspectRatio > 0.0F))
      this.mScaleStep = new ScaleStep(paramCameraSetting.frontFacingAspectRatio, null);
    while (true)
    {
      giveMatrixNewValuesWithScaleIfDegreeHasChanged(paramCameraSetting.degrees, false);
      allocate(this.mCurrentFrameSize, paramCameraSetting.originalW, paramCameraSetting.originalH);
      return;
      if (paramCameraSetting.backFacingAspectRatio > 0.0F)
        this.mScaleStep = new ScaleStep(paramCameraSetting.backFacingAspectRatio, null);
      else
        this.mScaleStep = null;
    }
  }

  public boolean convert(CameraSetting paramCameraSetting, VideoData paramVideoData, boolean paramBoolean)
  {
    try
    {
      convertUsingRenderScript(paramCameraSetting, paramVideoData, paramBoolean);
      return true;
    }
    catch (android.renderscript.RSInvalidStateException localRSInvalidStateException1)
    {
      return false;
    }
    catch (android.support.v8.renderscript.RSInvalidStateException localRSInvalidStateException)
    {
    }
    return false;
  }

  public void draw(Canvas paramCanvas)
  {
    if (this.mScaleStep == null)
    {
      paramCanvas.drawBitmap(this.srcBmp, this.mMatrix, this.mPaint);
      return;
    }
    this.mScaleStep.scale();
    paramCanvas.drawBitmap(this.mScaleStep.mPreScaleBitmap, this.mMatrix, this.mPaint);
  }

  public void drawGeneric(Canvas paramCanvas, Bitmap paramBitmap, Matrix paramMatrix)
  {
    paramCanvas.drawBitmap(paramBitmap, paramMatrix, this.mPaint);
  }

  public void giveMatrixNewValuesWithScaleIfDegreeHasChangedWithKnownConfigs(int paramInt, boolean paramBoolean)
  {
    giveMatrixNewValuesWithScaleIfDegreeHasChanged(paramInt, paramBoolean);
  }

  public boolean updateSettingsIfNeeded(CameraSetting paramCameraSetting)
  {
    if ((this.lastW != paramCameraSetting.originalW) || (this.lastH != paramCameraSetting.originalH) || (paramCameraSetting.frontFacing != this.mLastFront));
    for (boolean bool = true; ; bool = false)
    {
      if ((this.srcBmp == null) || (bool))
        setCameraSetting(paramCameraSetting);
      return bool;
    }
  }

  public class ScaleStep
  {
    private final Bitmap mPreScaleBitmap;
    private final Canvas mPreScaleCanvas;
    private final Matrix mPreScaleMatrix = new Matrix();
    private final int scaledH;
    private final int scaledW;

    private ScaleStep(float arg2)
    {
      Object localObject;
      this.scaledW = ((int)(localObject * PictureConverter.this.lastH));
      this.scaledH = PictureConverter.this.lastH;
      this.mPreScaleMatrix.setScale(this.scaledW / PictureConverter.this.lastW, 1.0F);
      this.mPreScaleBitmap = Bitmap.createBitmap(this.scaledW, this.scaledH, RecordConfigUtils.DEFAULT_BITMAP_CONFIG);
      this.mPreScaleCanvas = new Canvas(this.mPreScaleBitmap);
    }

    private void scale()
    {
      this.mPreScaleCanvas.drawBitmap(PictureConverter.this.srcBmp, this.mPreScaleMatrix, PictureConverter.this.mPaint);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.PictureConverter
 * JD-Core Version:    0.6.2
 */