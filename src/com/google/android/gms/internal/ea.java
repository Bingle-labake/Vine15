package com.google.android.gms.internal;

import android.content.Context;
import android.graphics.Paint;
import android.net.Uri;
import android.view.View.MeasureSpec;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.TextView;

public class ea extends FrameLayout
{
  private String[] hL = null;
  private final ImageView hM;
  private final TextView hN;

  public ea(Context paramContext)
  {
    super(paramContext);
    this.hM = new ImageView(paramContext);
    addView(this.hM, new FrameLayout.LayoutParams(-2, -2, 17));
    this.hN = new TextView(paramContext);
    addView(this.hN, new FrameLayout.LayoutParams(-2, -2, 17));
    bringChildToFront(this.hN);
  }

  public void a(Uri paramUri)
  {
    this.hM.setImageURI(paramUri);
  }

  public void f(String[] paramArrayOfString)
  {
    this.hL = paramArrayOfString;
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getSize(paramInt1);
    Paint localPaint = new Paint();
    localPaint.setTextSize(this.hN.getTextSize());
    localPaint.setTypeface(this.hN.getTypeface());
    int j;
    int k;
    int m;
    String str;
    if (this.hL != null)
    {
      j = this.hL.length;
      k = 0;
      m = 0;
      str = null;
      label62: if (k >= j)
        break label135;
      if (this.hL[k] != null)
        break label91;
    }
    while (true)
    {
      k++;
      break label62;
      j = 0;
      break;
      label91: int n = (int)localPaint.measureText(this.hL[k]);
      if ((n <= i) && (n >= m))
      {
        str = this.hL[k];
        m = n;
      }
    }
    label135: if ((str == null) || (!str.equals(this.hN.getText())))
      this.hN.setText(str);
    super.onMeasure(paramInt1, paramInt2);
  }

  public void setGravity(int paramInt)
  {
    this.hN.setGravity(paramInt);
  }

  public void setSingleLine()
  {
    this.hN.setSingleLine();
  }

  public void setTextColor(int paramInt)
  {
    this.hN.setTextColor(paramInt);
  }

  public void setTextSize(int paramInt, float paramFloat)
  {
    this.hN.setTextSize(paramInt, paramFloat);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ea
 * JD-Core Version:    0.6.2
 */