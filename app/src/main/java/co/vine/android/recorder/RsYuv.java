package co.vine.android.recorder;

import android.graphics.Bitmap;
import android.support.v8.renderscript.Allocation;
import android.support.v8.renderscript.Element;
import android.support.v8.renderscript.RenderScript;
import android.support.v8.renderscript.ScriptIntrinsicYuvToRGB;
import android.support.v8.renderscript.Type.Builder;

public class RsYuv
{
  private Allocation mAllocationIn;
  private Allocation mAllocationOut;
  private ScriptIntrinsicYuvToRGB mYuv;

  public RsYuv(RenderScript paramRenderScript, int paramInt1, int paramInt2)
  {
    this.mYuv = ScriptIntrinsicYuvToRGB.create(paramRenderScript, Element.RGBA_8888(paramRenderScript));
    Type.Builder localBuilder = new Type.Builder(paramRenderScript, Element.RGBA_8888(paramRenderScript));
    localBuilder.setX(paramInt1);
    localBuilder.setY(paramInt2);
    this.mAllocationOut = Allocation.createTyped(paramRenderScript, localBuilder.create());
    this.mAllocationIn = Allocation.createSized(paramRenderScript, Element.U8(paramRenderScript), paramInt2 * paramInt1 + 2 * (paramInt2 / 2 * (paramInt1 / 2)));
    this.mYuv.setInput(this.mAllocationIn);
  }

  public void execute(byte[] paramArrayOfByte, Bitmap paramBitmap)
  {
    this.mAllocationIn.copyFrom(paramArrayOfByte);
    this.mYuv.forEach(this.mAllocationOut);
    this.mAllocationOut.copyTo(paramBitmap);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RsYuv
 * JD-Core Version:    0.6.2
 */