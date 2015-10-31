package co.vine.android.util;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.view.View;
import android.widget.RelativeLayout.LayoutParams;

public class FloatingViewUtils
{
  public static Bitmap buildFloatingViewFor(Context paramContext, View paramView1, View paramView2, int paramInt1, int paramInt2, int paramInt3)
  {
    Resources localResources = paramContext.getResources();
    int i = paramView1.getMeasuredHeight();
    paramView1.setDrawingCacheQuality(1048576);
    paramView1.setDrawingCacheEnabled(true);
    Bitmap localBitmap = Bitmap.createBitmap(paramView1.getDrawingCache(true));
    paramView1.setDrawingCacheEnabled(false);
    ViewUtil.setBackground(paramView2, new BitmapDrawable(localResources, localBitmap));
    RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)paramView2.getLayoutParams();
    localLayoutParams.width = paramInt1;
    localLayoutParams.height = i;
    localLayoutParams.leftMargin = paramInt2;
    localLayoutParams.topMargin = paramInt3;
    paramView2.setLayoutParams(localLayoutParams);
    return localBitmap;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.FloatingViewUtils
 * JD-Core Version:    0.6.2
 */