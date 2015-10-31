package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.plus.PlusClient;
import com.google.android.gms.plus.PlusClient.b;
import com.google.android.gms.plus.PlusOneButton.OnPlusOneClickListener;

public class dz extends LinearLayout
  implements GooglePlayServicesClient.ConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener
{
  private static final int hr = Color.parseColor("#666666");
  private int K = 3;
  protected int bi = 1;
  protected PlusClient gY;
  private int hA = 2;
  private Uri[] hB;
  private String[] hC;
  private String[] hD;
  protected String hE;
  protected du hF;
  protected final Resources hG;
  protected final LayoutInflater hH;
  private b hI = new b();
  protected boolean hs;
  protected int ht = 0;
  protected final LinearLayout hu;
  protected final FrameLayout hv;
  protected final CompoundButton hw;
  private final ProgressBar hx;
  protected final ea hy;
  private final dt[] hz = new dt[4];

  public dz(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    x.b(paramContext, "Context must not be null.");
    if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramContext) != 0)
      this.hG = null;
    Point localPoint;
    Context localContext;
    for (this.hH = null; ; this.hH = ((LayoutInflater)localContext.getSystemService("layout_inflater")))
    {
      this.K = a(paramContext, paramAttributeSet);
      this.hA = b(paramContext, paramAttributeSet);
      localPoint = new Point();
      a(localPoint);
      if (!isInEditMode())
        break;
      TextView localTextView = new TextView(paramContext);
      localTextView.setGravity(17);
      localTextView.setText("[ +1 ]");
      addView(localTextView, new LinearLayout.LayoutParams(localPoint.x, localPoint.y));
      this.hy = null;
      this.hx = null;
      this.hw = null;
      this.hv = null;
      this.hu = null;
      return;
      localContext = k(paramContext);
      this.hG = localContext.getResources();
    }
    setFocusable(true);
    this.hu = new LinearLayout(paramContext);
    this.hu.setGravity(17);
    this.hu.setOrientation(0);
    addView(this.hu);
    this.hw = new c(paramContext);
    this.hw.setBackgroundDrawable(null);
    this.hy = n(paramContext);
    this.hv = l(paramContext);
    this.hv.addView(this.hw, new FrameLayout.LayoutParams(localPoint.x, localPoint.y, 17));
    b(localPoint);
    this.hx = m(paramContext);
    this.hx.setVisibility(4);
    this.hv.addView(this.hx, new FrameLayout.LayoutParams(localPoint.x, localPoint.y, 17));
    int i = this.hz.length;
    for (int j = 0; j < i; j++)
      this.hz[j] = o(getContext());
    bm();
  }

  private int a(Context paramContext, AttributeSet paramAttributeSet)
  {
    String str = ab.a("http://schemas.android.com/apk/lib/com.google.android.gms.plus", "size", paramContext, paramAttributeSet, true, false, "PlusOneButton");
    if ("SMALL".equalsIgnoreCase(str))
      return 0;
    if ("MEDIUM".equalsIgnoreCase(str))
      return 1;
    if ("TALL".equalsIgnoreCase(str))
      return 2;
    if ("STANDARD".equalsIgnoreCase(str))
      return 3;
    return 3;
  }

  private void a(Point paramPoint)
  {
    int i = 24;
    int j = 20;
    switch (this.K)
    {
    default:
      int k = i;
      i = 38;
      j = k;
    case 1:
    case 0:
    case 2:
    }
    while (true)
    {
      DisplayMetrics localDisplayMetrics = getResources().getDisplayMetrics();
      float f1 = TypedValue.applyDimension(1, i, localDisplayMetrics);
      float f2 = TypedValue.applyDimension(1, j, localDisplayMetrics);
      paramPoint.x = ((int)(0.5D + f1));
      paramPoint.y = ((int)(0.5D + f2));
      return;
      i = 32;
      continue;
      j = 14;
      continue;
      i = 50;
    }
  }

  private void a(Uri[] paramArrayOfUri)
  {
    this.hB = paramArrayOfUri;
    bq();
  }

  private int b(Context paramContext, AttributeSet paramAttributeSet)
  {
    boolean bool = true;
    String str = ab.a("http://schemas.android.com/apk/lib/com.google.android.gms.plus", "annotation", paramContext, paramAttributeSet, bool, false, "PlusOneButton");
    int i;
    if ("INLINE".equalsIgnoreCase(str))
      i = 2;
    do
    {
      return i;
      if ("NONE".equalsIgnoreCase(str))
        return 0;
    }
    while (!"BUBBLE".equalsIgnoreCase(str));
    return i;
  }

  private void b(Point paramPoint)
  {
    paramPoint.y = ((int)(paramPoint.y - TypedValue.applyDimension(1, 6.0F, getResources().getDisplayMetrics())));
    paramPoint.x = paramPoint.y;
  }

  private void bh()
  {
    int i = 1;
    int j = (int)TypedValue.applyDimension(i, 5.0F, getContext().getResources().getDisplayMetrics());
    int k = (int)TypedValue.applyDimension(i, 1.0F, getContext().getResources().getDisplayMetrics());
    int m = this.hz.length;
    int n = 0;
    while (n < m)
      if (this.hz[n].getVisibility() != 0)
      {
        n++;
      }
      else
      {
        LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(this.hz[n].getLayoutParams());
        if (i != 0)
        {
          localLayoutParams.setMargins(j, 0, k, 0);
          i = 0;
        }
        while (true)
        {
          this.hz[n].setLayoutParams(localLayoutParams);
          break;
          localLayoutParams.setMargins(k, 0, k, 0);
        }
      }
  }

  private LinearLayout.LayoutParams bj()
  {
    LinearLayout.LayoutParams localLayoutParams;
    int i;
    label50: int k;
    switch (this.hA)
    {
    default:
      localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
      if (this.K == 2)
      {
        i = 1;
        localLayoutParams.bottomMargin = i;
        int j = this.K;
        k = 0;
        if (j != 2)
          break label110;
      }
      break;
    case 2:
    case 1:
    }
    while (true)
    {
      localLayoutParams.leftMargin = k;
      return localLayoutParams;
      localLayoutParams = new LinearLayout.LayoutParams(-2, -1);
      break;
      localLayoutParams = new LinearLayout.LayoutParams(-2, -2);
      break;
      i = 0;
      break label50;
      label110: k = 1;
    }
  }

  private void bp()
  {
    switch (this.hA)
    {
    default:
      this.hy.f(null);
      this.hy.setVisibility(8);
      return;
    case 2:
      this.hy.f(this.hC);
      this.hy.setVisibility(0);
      return;
    case 1:
    }
    this.hy.f(this.hD);
    this.hy.setVisibility(0);
  }

  private void bq()
  {
    int i = 0;
    if ((this.hB != null) && (this.hA == 2))
    {
      Point localPoint = new Point();
      a(localPoint);
      localPoint.x = localPoint.y;
      int k = this.hz.length;
      int m = this.hB.length;
      int n = 0;
      if (n < k)
      {
        Uri localUri;
        if (n < m)
        {
          localUri = this.hB[n];
          label78: if (localUri != null)
            break label107;
          this.hz[n].setVisibility(8);
        }
        while (true)
        {
          n++;
          break;
          localUri = null;
          break label78;
          label107: this.hz[n].setLayoutParams(new LinearLayout.LayoutParams(localPoint.x, localPoint.y));
          this.hz[n].a(localUri, localPoint.y);
          this.hz[n].setVisibility(0);
        }
      }
    }
    else
    {
      int j = this.hz.length;
      while (i < j)
      {
        this.hz[i].setVisibility(8);
        i++;
      }
    }
    bh();
  }

  private Drawable br()
  {
    if (this.hG == null)
      return null;
    return this.hG.getDrawable(this.hG.getIdentifier(bs(), "drawable", "com.google.android.gms"));
  }

  private String bs()
  {
    switch (this.K)
    {
    default:
      return "ic_plusone_standard";
    case 0:
      return "ic_plusone_small";
    case 1:
      return "ic_plusone_medium";
    case 2:
    }
    return "ic_plusone_tall";
  }

  private Uri bt()
  {
    return y.i(bu());
  }

  private String bu()
  {
    switch (this.K)
    {
    default:
      return "global_count_bubble_standard";
    case 1:
      return "global_count_bubble_medium";
    case 0:
      return "global_count_bubble_small";
    case 2:
    }
    return "global_count_bubble_tall";
  }

  private void c(int paramInt1, int paramInt2)
  {
    this.bi = paramInt2;
    this.K = paramInt1;
    bi();
  }

  private void c(View paramView)
  {
    int i = (int)TypedValue.applyDimension(1, 3.0F, getContext().getResources().getDisplayMetrics());
    int j = (int)TypedValue.applyDimension(1, 5.0F, getContext().getResources().getDisplayMetrics());
    if (this.hA == 2)
      if ((this.K != 2) || (this.hA != 1))
        break label76;
    while (true)
    {
      paramView.setPadding(j, 0, 0, i);
      return;
      j = 0;
      break;
      label76: i = 0;
    }
  }

  private static int d(int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    case 1:
    default:
    case 2:
      do
        return 13;
      while (paramInt2 == 2);
      return 15;
    case 0:
    }
    return 11;
  }

  private void d(String[] paramArrayOfString)
  {
    this.hC = paramArrayOfString;
    bp();
  }

  private void e(String[] paramArrayOfString)
  {
    this.hD = paramArrayOfString;
    bp();
  }

  private Context k(Context paramContext)
  {
    try
    {
      Context localContext = getContext().createPackageContext("com.google.android.gms", 4);
      return localContext;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      if (Log.isLoggable("PlusOneButton", 5))
        Log.w("PlusOneButton", "Google Play services is not installed");
    }
    return null;
  }

  private FrameLayout l(Context paramContext)
  {
    FrameLayout localFrameLayout = new FrameLayout(paramContext);
    localFrameLayout.setFocusable(false);
    return localFrameLayout;
  }

  private ProgressBar m(Context paramContext)
  {
    ProgressBar localProgressBar = new ProgressBar(paramContext, null, 16843400);
    localProgressBar.setFocusable(false);
    localProgressBar.setIndeterminate(true);
    return localProgressBar;
  }

  private ea n(Context paramContext)
  {
    ea localea = new ea(paramContext);
    localea.setFocusable(false);
    localea.setGravity(17);
    localea.setSingleLine();
    localea.setTextSize(0, TypedValue.applyDimension(2, d(this.K, this.hA), paramContext.getResources().getDisplayMetrics()));
    localea.setTextColor(hr);
    localea.setVisibility(0);
    return localea;
  }

  private dt o(Context paramContext)
  {
    dt localdt = new dt(paramContext);
    localdt.setVisibility(8);
    return localdt;
  }

  protected void bc()
  {
    if (this.hF == null)
      return;
    d(this.hF.bf());
    String[] arrayOfString = new String[1];
    arrayOfString[0] = this.hF.be();
    e(arrayOfString);
    a(this.hF.bg());
    if (this.hF.bd())
    {
      bn();
      return;
    }
    bm();
  }

  protected void bi()
  {
    int i = 0;
    if (isInEditMode())
      return;
    this.hu.removeAllViews();
    Point localPoint = new Point();
    a(localPoint);
    this.hw.setLayoutParams(new FrameLayout.LayoutParams(localPoint.x, localPoint.y, 17));
    b(localPoint);
    this.hx.setLayoutParams(new FrameLayout.LayoutParams(localPoint.x, localPoint.y, 17));
    if (this.hA == 1)
    {
      this.hy.a(bt());
      bq();
      this.hy.setLayoutParams(bj());
      float f = TypedValue.applyDimension(2, d(this.K, this.hA), getContext().getResources().getDisplayMetrics());
      this.hy.setTextSize(0, f);
      c(this.hy);
      if ((this.K != 2) || (this.hA != 1))
        break label223;
      this.hu.setOrientation(1);
      this.hu.addView(this.hy);
      this.hu.addView(this.hv);
    }
    while (true)
    {
      requestLayout();
      return;
      this.hy.a(null);
      break;
      label223: this.hu.setOrientation(0);
      this.hu.addView(this.hv);
      int j = this.hz.length;
      while (i < j)
      {
        this.hu.addView(this.hz[i]);
        i++;
      }
      this.hu.addView(this.hy);
    }
  }

  public void bk()
  {
    setType(2);
    this.hx.setVisibility(0);
    bo();
  }

  public void bl()
  {
    setType(3);
    this.hx.setVisibility(4);
    bo();
  }

  protected void bm()
  {
    setType(1);
    this.hx.setVisibility(4);
    bo();
  }

  protected void bn()
  {
    setType(0);
    this.hx.setVisibility(4);
    bo();
  }

  protected void bo()
  {
    this.hw.setButtonDrawable(br());
    switch (this.bi)
    {
    default:
      this.hw.setEnabled(false);
      this.hw.setChecked(false);
      return;
    case 0:
      this.hw.setEnabled(true);
      this.hw.setChecked(true);
      return;
    case 1:
      this.hw.setEnabled(true);
      this.hw.setChecked(false);
      return;
    case 2:
    }
    this.hw.setEnabled(false);
    this.hw.setChecked(true);
  }

  public void initialize(PlusClient paramPlusClient, String paramString, int paramInt)
  {
    int i = 0;
    x.b(paramPlusClient, "Plus client must not be null.");
    x.b(paramString, "URL must not be null.");
    if ((paramInt >= 0) && (paramInt <= 65535));
    for (boolean bool = true; ; bool = false)
    {
      x.a(bool, "activityRequestCode must be an unsigned 16 bit integer.");
      this.ht = paramInt;
      this.hE = paramString;
      if (paramPlusClient == this.gY)
        break;
      if (this.gY != null)
      {
        this.gY.unregisterConnectionCallbacks(this);
        this.gY.unregisterConnectionFailedListener(this);
      }
      this.gY = paramPlusClient;
      this.gY.registerConnectionCallbacks(this);
      this.gY.registerConnectionFailedListener(this);
      int j = this.hz.length;
      while (i < j)
      {
        this.hz[i].a(paramPlusClient);
        i++;
      }
    }
    if (this.gY.isConnected())
      onConnected(null);
    bi();
  }

  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    if (this.gY != null)
    {
      if (!this.gY.isConnectionCallbacksRegistered(this))
        this.gY.registerConnectionCallbacks(this);
      if (!this.gY.isConnectionFailedListenerRegistered(this))
        this.gY.registerConnectionFailedListener(this);
    }
  }

  public void onConnected(Bundle paramBundle)
  {
    if (this.hE != null)
      this.gY.a(this.hI, this.hE);
  }

  public void onConnectionFailed(ConnectionResult paramConnectionResult)
  {
    bl();
  }

  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (this.gY != null)
    {
      if (this.gY.isConnectionCallbacksRegistered(this))
        this.gY.unregisterConnectionCallbacks(this);
      if (this.gY.isConnectionFailedListenerRegistered(this))
        this.gY.unregisterConnectionFailedListener(this);
    }
  }

  public void onDisconnected()
  {
  }

  public boolean performClick()
  {
    return this.hw.performClick();
  }

  public void setAnnotation(int paramInt)
  {
    x.b(Integer.valueOf(paramInt), "Annotation must not be null.");
    this.hA = paramInt;
    bp();
    bi();
  }

  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    this.hw.setOnClickListener(paramOnClickListener);
    this.hy.setOnClickListener(paramOnClickListener);
  }

  public void setOnPlusOneClickListener(PlusOneButton.OnPlusOneClickListener paramOnPlusOneClickListener)
  {
    setOnClickListener(new a(paramOnPlusOneClickListener));
  }

  public void setSize(int paramInt)
  {
    c(paramInt, this.bi);
  }

  public void setType(int paramInt)
  {
    c(this.K, paramInt);
  }

  class a
    implements View.OnClickListener, PlusOneButton.OnPlusOneClickListener
  {
    private final PlusOneButton.OnPlusOneClickListener hJ;

    public a(PlusOneButton.OnPlusOneClickListener arg2)
    {
      Object localObject;
      this.hJ = localObject;
    }

    public void onClick(View paramView)
    {
      if ((paramView == dz.this.hw) || (paramView == dz.this.hy))
        if (dz.this.hF != null)
          break label52;
      label52: for (Intent localIntent = null; this.hJ != null; localIntent = dz.this.hF.getIntent())
      {
        this.hJ.onPlusOneClick(localIntent);
        return;
      }
      onPlusOneClick(localIntent);
    }

    public void onPlusOneClick(Intent paramIntent)
    {
      Context localContext = dz.this.getContext();
      if (((localContext instanceof Activity)) && (paramIntent != null))
        ((Activity)localContext).startActivityForResult(paramIntent, dz.this.ht);
    }
  }

  public class b
    implements PlusClient.b
  {
    protected b()
    {
    }

    public void a(ConnectionResult paramConnectionResult, du paramdu)
    {
      if (dz.this.hs)
      {
        dz.this.hs = false;
        dz.this.hw.refreshDrawableState();
      }
      if ((paramConnectionResult.isSuccess()) && (paramdu != null))
      {
        dz.this.hF = paramdu;
        dz.this.bc();
        dz.this.bi();
        return;
      }
      dz.this.bl();
    }
  }

  class c extends CompoundButton
  {
    public c(Context arg2)
    {
      super();
    }

    public void toggle()
    {
      if (dz.this.hs)
      {
        super.toggle();
        return;
      }
      dz.this.hs = true;
      dz.this.bk();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.dz
 * JD-Core Version:    0.6.2
 */