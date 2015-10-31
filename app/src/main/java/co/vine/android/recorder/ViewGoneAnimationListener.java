package co.vine.android.recorder;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.view.View;
import android.view.ViewPropertyAnimator;

public class ViewGoneAnimationListener
  implements Animator.AnimatorListener
{
  private View mView;

  public ViewGoneAnimationListener(View paramView)
  {
    this.mView = paramView;
  }

  public void onAnimationCancel(Animator paramAnimator)
  {
  }

  public void onAnimationEnd(Animator paramAnimator)
  {
    if (this.mView != null)
    {
      this.mView.setVisibility(4);
      this.mView.animate().setListener(null);
      this.mView = null;
    }
  }

  public void onAnimationRepeat(Animator paramAnimator)
  {
  }

  public void onAnimationStart(Animator paramAnimator)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.ViewGoneAnimationListener
 * JD-Core Version:    0.6.2
 */