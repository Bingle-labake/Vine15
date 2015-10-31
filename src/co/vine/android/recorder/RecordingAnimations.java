package co.vine.android.recorder;

import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.ScaleAnimation;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import co.vine.android.animation.SimpleAnimationListener;

public class RecordingAnimations
{
  public static AnimationSet getFocusAnimationSet(final AlphaAnimation paramAlphaAnimation, ImageView paramImageView)
  {
    RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)paramImageView.getLayoutParams();
    if (localLayoutParams == null)
      throw new RuntimeException("XML is missing layout params for focus indicator. Wrong view?");
    final ScaleAnimation localScaleAnimation = new ScaleAnimation(1.0F, 0.85F, 1.0F, 0.85F, localLayoutParams.width / 2, localLayoutParams.height / 2);
    localScaleAnimation.setRepeatMode(2);
    localScaleAnimation.setRepeatCount(1);
    localScaleAnimation.setDuration(80L);
    localScaleAnimation.setFillAfter(true);
    localScaleAnimation.setAnimationListener(new SimpleAnimationListener()
    {
      public void onAnimationEnd(Animation paramAnonymousAnimation)
      {
        this.val$focusIndicator.startAnimation(paramAlphaAnimation);
      }
    });
    AnimationSet localAnimationSet = new AnimationSet(true);
    localAnimationSet.addAnimation(new AlphaAnimation(0.0F, 1.0F));
    localAnimationSet.addAnimation(new ScaleAnimation(0.5F, 1.0F, 0.5F, 1.0F, localLayoutParams.width / 2, localLayoutParams.height / 2));
    localAnimationSet.setFillAfter(true);
    localAnimationSet.setDuration(300L);
    localAnimationSet.setAnimationListener(new SimpleAnimationListener()
    {
      public void onAnimationEnd(Animation paramAnonymousAnimation)
      {
        this.val$focusIndicator.startAnimation(localScaleAnimation);
      }
    });
    return localAnimationSet;
  }

  public static AlphaAnimation getFocusDismissAnimation(ImageView paramImageView)
  {
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(1.0F, 0.0F);
    localAlphaAnimation.setDuration(300L);
    localAlphaAnimation.setFillAfter(true);
    localAlphaAnimation.setAnimationListener(new SimpleAnimationListener()
    {
      public void onAnimationEnd(Animation paramAnonymousAnimation)
      {
        if (this.val$focusIndicator != null)
          this.val$focusIndicator.setVisibility(4);
      }
    });
    return localAlphaAnimation;
  }

  public static AlphaAnimation getGridDimissAnimation(SimpleAnimationListener paramSimpleAnimationListener)
  {
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(1.0F, 0.0F);
    localAlphaAnimation.setDuration(200L);
    localAlphaAnimation.setFillAfter(true);
    localAlphaAnimation.setAnimationListener(paramSimpleAnimationListener);
    return localAlphaAnimation;
  }

  public static AlphaAnimation getShowGridAinimation(SimpleAnimationListener paramSimpleAnimationListener)
  {
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(0.0F, 1.0F);
    localAlphaAnimation.setDuration(200L);
    localAlphaAnimation.setFillAfter(true);
    localAlphaAnimation.setAnimationListener(paramSimpleAnimationListener);
    return localAlphaAnimation;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RecordingAnimations
 * JD-Core Version:    0.6.2
 */