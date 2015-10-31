package co.vine.android.util;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.Transformation;

public class ViewUtil
{
  public static Animation makeResizeAnimation(ResizeAnimationType paramResizeAnimationType, View paramView, int paramInt)
  {
    return makeResizeAnimation(paramResizeAnimationType, paramView, paramInt, -1, null);
  }

  public static Animation makeResizeAnimation(ResizeAnimationType paramResizeAnimationType, View paramView, int paramInt1, int paramInt2)
  {
    return makeResizeAnimation(paramResizeAnimationType, paramView, paramInt1, paramInt2, null);
  }

  public static Animation makeResizeAnimation(ResizeAnimationType paramResizeAnimationType, final View paramView, final int paramInt1, int paramInt2, Animation.AnimationListener paramAnimationListener)
  {
    final ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    final boolean bool;
    int i;
    if ((paramResizeAnimationType == ResizeAnimationType.EXPAND_WIDTH) || (paramResizeAnimationType == ResizeAnimationType.COLLAPSE_WIDTH))
    {
      bool = true;
      if ((paramResizeAnimationType != ResizeAnimationType.EXPAND_WIDTH) && (paramResizeAnimationType != ResizeAnimationType.EXPAND_HEIGHT))
        break label103;
      i = 1;
      label40: if (i == 0)
        break label118;
      if (!bool)
        break label109;
      localLayoutParams.width = 0;
    }
    Object localObject;
    while (true)
    {
      paramView.setVisibility(0);
      localObject = new Animation()
      {
        protected void applyTransformation(float paramAnonymousFloat, Transformation paramAnonymousTransformation)
        {
          if (this.val$typeWidth)
          {
            ViewGroup.LayoutParams localLayoutParams2 = localLayoutParams;
            if (paramAnonymousFloat == 1.0F);
            for (int j = paramInt1; ; j = (int)(paramAnonymousFloat * paramInt1))
            {
              localLayoutParams2.width = j;
              paramView.requestLayout();
              return;
            }
          }
          ViewGroup.LayoutParams localLayoutParams1 = localLayoutParams;
          if (paramAnonymousFloat == 1.0F);
          for (int i = paramInt1; ; i = (int)(paramAnonymousFloat * paramInt1))
          {
            localLayoutParams1.height = i;
            break;
          }
        }

        public boolean willChangeBounds()
        {
          return true;
        }
      };
      if (paramInt2 > 0)
        ((Animation)localObject).setDuration(paramInt2);
      ((Animation)localObject).setAnimationListener(paramAnimationListener);
      return localObject;
      bool = false;
      break;
      label103: i = 0;
      break label40;
      label109: localLayoutParams.height = 0;
    }
    label118: if (bool);
    for (final int j = paramView.getMeasuredWidth(); ; j = paramView.getMeasuredHeight())
    {
      localObject = new Animation()
      {
        protected void applyTransformation(float paramAnonymousFloat, Transformation paramAnonymousTransformation)
        {
          if (paramAnonymousFloat == 1.0F)
          {
            this.val$v.setVisibility(8);
            return;
          }
          if (bool)
            localLayoutParams.width = (j - (int)(paramAnonymousFloat * j));
          while (true)
          {
            this.val$v.requestLayout();
            return;
            localLayoutParams.height = (j - (int)(paramAnonymousFloat * j));
          }
        }

        public boolean willChangeBounds()
        {
          return true;
        }
      };
      break;
    }
  }

  public static void setBackground(Resources paramResources, View paramView, Bitmap paramBitmap)
  {
    setBackground(paramView, new BitmapDrawable(paramResources, paramBitmap));
  }

  public static void setBackground(View paramView, Drawable paramDrawable)
  {
    if (Build.VERSION.SDK_INT >= 16)
    {
      paramView.setBackground(paramDrawable);
      return;
    }
    paramView.setBackgroundDrawable(paramDrawable);
  }

  public static enum ResizeAnimationType
  {
    static
    {
      EXPAND_HEIGHT = new ResizeAnimationType("EXPAND_HEIGHT", 1);
      COLLAPSE_WIDTH = new ResizeAnimationType("COLLAPSE_WIDTH", 2);
      COLLAPSE_HEIGHT = new ResizeAnimationType("COLLAPSE_HEIGHT", 3);
      ResizeAnimationType[] arrayOfResizeAnimationType = new ResizeAnimationType[4];
      arrayOfResizeAnimationType[0] = EXPAND_WIDTH;
      arrayOfResizeAnimationType[1] = EXPAND_HEIGHT;
      arrayOfResizeAnimationType[2] = COLLAPSE_WIDTH;
      arrayOfResizeAnimationType[3] = COLLAPSE_HEIGHT;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.ViewUtil
 * JD-Core Version:    0.6.2
 */