package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.view.Display;
import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import java.lang.ref.WeakReference;

public class bn
{
  protected bj cs;
  protected a dh;

  private bn(bj parambj, int paramInt)
  {
    this.cs = parambj;
    this.dh = new a(paramInt, null);
  }

  public static bn a(bj parambj, int paramInt)
  {
    if (ba.ab())
      return new b(parambj, paramInt);
    return new bn(parambj, paramInt);
  }

  public void a(View paramView)
  {
  }

  public void am()
  {
    this.cs.a(this.dh.di, this.dh.ap());
  }

  public Bundle an()
  {
    return this.dh.ap();
  }

  public IBinder ao()
  {
    return this.dh.di;
  }

  public void setGravity(int paramInt)
  {
    this.dh.gravity = paramInt;
  }

  public static final class a
  {
    public int bottom = 0;
    public IBinder di = null;
    public int dj = -1;
    public int gravity;
    public int left = 0;
    public int right = 0;
    public int top = 0;

    private a(int paramInt)
    {
      this.gravity = paramInt;
      this.di = new Binder();
    }

    public Bundle ap()
    {
      Bundle localBundle = new Bundle();
      localBundle.putInt("popupLocationInfo.gravity", this.gravity);
      localBundle.putInt("popupLocationInfo.displayId", this.dj);
      localBundle.putInt("popupLocationInfo.left", this.left);
      localBundle.putInt("popupLocationInfo.top", this.top);
      localBundle.putInt("popupLocationInfo.right", this.right);
      localBundle.putInt("popupLocationInfo.bottom", this.bottom);
      return localBundle;
    }
  }

  static final class b extends bn
    implements View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener
  {
    private boolean cC = false;
    private WeakReference<View> dk;

    protected b(bj parambj, int paramInt)
    {
      super(paramInt, null);
    }

    private void b(View paramView)
    {
      int i = -1;
      if (ba.af())
        i = paramView.getDisplay().getDisplayId();
      IBinder localIBinder = paramView.getWindowToken();
      int[] arrayOfInt = new int[2];
      paramView.getLocationInWindow(arrayOfInt);
      int j = paramView.getWidth();
      int k = paramView.getHeight();
      this.dh.dj = i;
      this.dh.di = localIBinder;
      this.dh.left = arrayOfInt[0];
      this.dh.top = arrayOfInt[1];
      this.dh.right = (j + arrayOfInt[0]);
      this.dh.bottom = (k + arrayOfInt[1]);
      if (this.cC)
      {
        am();
        this.cC = false;
      }
    }

    public void a(View paramView)
    {
      ViewTreeObserver localViewTreeObserver;
      if (this.dk != null)
      {
        View localView2 = (View)this.dk.get();
        Context localContext2 = this.cs.getContext();
        if ((localView2 == null) && ((localContext2 instanceof Activity)))
          localView2 = ((Activity)localContext2).getWindow().getDecorView();
        if (localView2 != null)
        {
          localViewTreeObserver = localView2.getViewTreeObserver();
          if (!ba.ae())
            break label166;
          localViewTreeObserver.removeOnGlobalLayoutListener(this);
        }
      }
      while (true)
      {
        this.dk = null;
        Context localContext1 = this.cs.getContext();
        if ((paramView == null) && ((localContext1 instanceof Activity)))
        {
          View localView1 = ((Activity)localContext1).findViewById(16908290);
          if (localView1 == null)
            localView1 = ((Activity)localContext1).getWindow().getDecorView();
          bk.b("PopupManager", "You have not specified a View to use as content view for popups. Falling back to the Activity content view which may not work properly in future versions of the API. Use setViewForPopups() to set your content view.");
          paramView = localView1;
        }
        if (paramView == null)
          break;
        this.dk = new WeakReference(paramView);
        paramView.addOnAttachStateChangeListener(this);
        paramView.getViewTreeObserver().addOnGlobalLayoutListener(this);
        return;
        label166: localViewTreeObserver.removeGlobalOnLayoutListener(this);
      }
      bk.c("PopupManager", "No content view usable to display popups. Popups will not be displayed in response to this client's calls. Use setViewForPopups() to set your content view.");
    }

    public void am()
    {
      if (this.dh.di != null)
      {
        super.am();
        return;
      }
      if (this.dk != null);
      for (boolean bool = true; ; bool = false)
      {
        this.cC = bool;
        return;
      }
    }

    public void onGlobalLayout()
    {
      if (this.dk == null);
      View localView;
      do
      {
        return;
        localView = (View)this.dk.get();
      }
      while (localView == null);
      b(localView);
    }

    public void onViewAttachedToWindow(View paramView)
    {
      b(paramView);
    }

    public void onViewDetachedFromWindow(View paramView)
    {
      this.cs.aj();
      paramView.removeOnAttachStateChangeListener(this);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bn
 * JD-Core Version:    0.6.2
 */