package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.dynamic.LifecycleDelegate;
import java.util.Iterator;
import java.util.LinkedList;

public abstract class bb<T extends LifecycleDelegate>
{
  private T bQ;
  private Bundle bR;
  private LinkedList<a> bS;
  private final be<T> bT = new be()
  {
    public void a(T paramAnonymousT)
    {
      bb.a(bb.this, paramAnonymousT);
      Iterator localIterator = bb.a(bb.this).iterator();
      while (localIterator.hasNext())
        ((bb.a)localIterator.next()).b(bb.b(bb.this));
      bb.a(bb.this).clear();
      bb.a(bb.this, null);
    }
  };

  private void a(Bundle paramBundle, a parama)
  {
    if (this.bQ != null)
    {
      parama.b(this.bQ);
      return;
    }
    if (this.bS == null)
      this.bS = new LinkedList();
    this.bS.add(parama);
    if (paramBundle != null)
    {
      if (this.bR != null)
        break label76;
      this.bR = ((Bundle)paramBundle.clone());
    }
    while (true)
    {
      a(this.bT);
      return;
      label76: this.bR.putAll(paramBundle);
    }
  }

  private void u(int paramInt)
  {
    while ((!this.bS.isEmpty()) && (((a)this.bS.getLast()).getState() >= paramInt))
      this.bS.removeLast();
  }

  public void a(FrameLayout paramFrameLayout)
  {
    final Context localContext = paramFrameLayout.getContext();
    final int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(localContext);
    String str1 = GooglePlayServicesUtil.b(localContext, i, -1);
    String str2 = GooglePlayServicesUtil.a(localContext, i);
    LinearLayout localLinearLayout = new LinearLayout(paramFrameLayout.getContext());
    localLinearLayout.setOrientation(1);
    localLinearLayout.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
    paramFrameLayout.addView(localLinearLayout);
    TextView localTextView = new TextView(paramFrameLayout.getContext());
    localTextView.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
    localTextView.setText(str1);
    localLinearLayout.addView(localTextView);
    if (str2 != null)
    {
      Button localButton = new Button(localContext);
      localButton.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
      localButton.setText(str2);
      localLinearLayout.addView(localButton);
      localButton.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          localContext.startActivity(GooglePlayServicesUtil.a(localContext, i, -1));
        }
      });
    }
  }

  protected abstract void a(be<T> parambe);

  public T ag()
  {
    return this.bQ;
  }

  public void onCreate(final Bundle paramBundle)
  {
    a(paramBundle, new a()
    {
      public void b(LifecycleDelegate paramAnonymousLifecycleDelegate)
      {
        bb.b(bb.this).onCreate(paramBundle);
      }

      public int getState()
      {
        return 1;
      }
    });
  }

  public View onCreateView(final LayoutInflater paramLayoutInflater, final ViewGroup paramViewGroup, final Bundle paramBundle)
  {
    final FrameLayout localFrameLayout = new FrameLayout(paramLayoutInflater.getContext());
    a(paramBundle, new a()
    {
      public void b(LifecycleDelegate paramAnonymousLifecycleDelegate)
      {
        localFrameLayout.removeAllViews();
        localFrameLayout.addView(bb.b(bb.this).onCreateView(paramLayoutInflater, paramViewGroup, paramBundle));
      }

      public int getState()
      {
        return 2;
      }
    });
    if (this.bQ == null)
      a(localFrameLayout);
    return localFrameLayout;
  }

  public void onDestroy()
  {
    if (this.bQ != null)
    {
      this.bQ.onDestroy();
      return;
    }
    u(1);
  }

  public void onDestroyView()
  {
    if (this.bQ != null)
    {
      this.bQ.onDestroyView();
      return;
    }
    u(2);
  }

  public void onInflate(final Activity paramActivity, final Bundle paramBundle1, final Bundle paramBundle2)
  {
    a(paramBundle2, new a()
    {
      public void b(LifecycleDelegate paramAnonymousLifecycleDelegate)
      {
        bb.b(bb.this).onInflate(paramActivity, paramBundle1, paramBundle2);
      }

      public int getState()
      {
        return 0;
      }
    });
  }

  public void onLowMemory()
  {
    if (this.bQ != null)
      this.bQ.onLowMemory();
  }

  public void onPause()
  {
    if (this.bQ != null)
    {
      this.bQ.onPause();
      return;
    }
    u(3);
  }

  public void onResume()
  {
    a(null, new a()
    {
      public void b(LifecycleDelegate paramAnonymousLifecycleDelegate)
      {
        bb.b(bb.this).onResume();
      }

      public int getState()
      {
        return 3;
      }
    });
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (this.bQ != null)
      this.bQ.onSaveInstanceState(paramBundle);
    while (this.bR == null)
      return;
    paramBundle.putAll(this.bR);
  }

  static abstract interface a
  {
    public abstract void b(LifecycleDelegate paramLifecycleDelegate);

    public abstract int getState();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.bb
 * JD-Core Version:    0.6.2
 */