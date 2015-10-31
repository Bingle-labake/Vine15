package co.vine.android.player;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;

@TargetApi(14)
public class StaticSizeVideoView extends SdkVideoView
{
  private int mHeight = 0;
  private int mWidth = 0;

  public StaticSizeVideoView(Context paramContext)
  {
    super(paramContext);
  }

  public StaticSizeVideoView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  public StaticSizeVideoView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    setMeasuredDimension(this.mWidth, this.mHeight);
  }

  public void setSize(int paramInt1, int paramInt2)
  {
    this.mWidth = paramInt1;
    this.mHeight = paramInt2;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.StaticSizeVideoView
 * JD-Core Version:    0.6.2
 */