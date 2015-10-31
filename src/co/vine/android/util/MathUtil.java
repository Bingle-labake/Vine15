package co.vine.android.util;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;

public class MathUtil
{
  public static int clamp(int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt1 > paramInt3)
      return paramInt3;
    if (paramInt1 < paramInt2)
      return paramInt2;
    return paramInt1;
  }

  public static void prepareMatrix(Matrix paramMatrix, boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramBoolean);
    for (float f = -1.0F; ; f = 1.0F)
    {
      paramMatrix.setScale(f, 1.0F);
      paramMatrix.postRotate(paramInt1);
      paramMatrix.postScale(paramInt2 / 2000.0F, paramInt3 / 2000.0F);
      paramMatrix.postTranslate(paramInt2 / 2.0F, paramInt3 / 2.0F);
      return;
    }
  }

  public static void rectFToRect(RectF paramRectF, Rect paramRect)
  {
    paramRect.left = Math.round(paramRectF.left);
    paramRect.top = Math.round(paramRectF.top);
    paramRect.right = Math.round(paramRectF.right);
    paramRect.bottom = Math.round(paramRectF.bottom);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.MathUtil
 * JD-Core Version:    0.6.2
 */