package com.flurry.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.net.Uri;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.webkit.WebChromeClient;
import android.webkit.WebChromeClient.CustomViewCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.MediaController;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

final class bn extends p
  implements DialogInterface.OnKeyListener, MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener, bm
{
  private ProgressDialog B;
  private Context J;
  private FlurryAds Q;
  private aj cJ;
  private final String d = getClass().getSimpleName();
  private int dA;
  private Dialog dB;
  private FrameLayout dC;
  private boolean dD;
  private boolean dE;
  private AlertDialog dF;
  private List<AdFrame> dG;
  private boolean dH;
  private Map<String, AdUnit> dI;
  private Map<String, cz> dJ;
  private Activity dK;
  private String dL = null;
  private List<String> dM;
  private View dh;
  private int di;
  private FrameLayout dk;
  private ce dt;
  private WebView du;
  private boolean dv;
  private WebViewClient dw;
  private WebChromeClient dx;
  private WebChromeClient.CustomViewCallback dy;
  private Dialog dz;

  bn(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit, int paramInt)
  {
    super(paramContext, paramFlurryAds, paramcz);
    this.J = paramContext;
    if ((paramContext instanceof Activity))
      this.dK = ((Activity)paramContext);
    setClickable(i);
    this.M = paramAdUnit;
    this.N = paramInt;
    this.L = paramcz;
    if (this.M != null)
    {
      this.dG = this.M.getAdFrames();
      if (this.M.getCombinable().intValue() != i)
        break label228;
    }
    while (true)
    {
      this.dH = i;
      if (this.dH)
      {
        this.dJ = new HashMap();
        this.dI = new HashMap();
        this.dJ.put(paramcz.at(), paramcz);
        this.dI.put(((AdFrame)paramAdUnit.getAdFrames().get(0)).getAdGuid().toString(), paramAdUnit);
      }
      this.Q = paramFlurryAds;
      this.cJ = this.Q.cJ;
      this.M = this.M;
      this.L = this.L;
      this.dM = new LinkedList();
      return;
      label228: int j = 0;
    }
  }

  private void a(int paramInt1, int paramInt2)
  {
    if (this.dB == null)
      return;
    new StringBuilder().append("collapse(").append(paramInt1).append(",").append(paramInt2).append(")").toString();
    if ((this.dB != null) && (this.dB.isShowing()))
    {
      this.dB.hide();
      this.dB.setOnDismissListener(null);
      this.dB.dismiss();
    }
    this.dB = null;
    ax.a(this.dK, this.dA);
    if (this.dC != null)
    {
      if ((this.du != null) && (-1 != this.dC.indexOfChild(this.du)))
        this.dC.removeView(this.du);
      this.dC = null;
    }
    if ((this.du != null) && (this.du.getParent() == null))
      addView(this.du);
    this.K.j(this.M.getAdSpace().toString());
  }

  private void ac()
  {
    if (ag());
    try
    {
      ((Activity)this.J).finish();
      return;
    }
    catch (ClassCastException localClassCastException)
    {
      new StringBuilder().append("caught class cast exception: ").append(localClassCastException).toString();
    }
  }

  private String ae()
  {
    return ah().getDisplay().toString();
  }

  private String af()
  {
    return ah().getAdSpaceLayout().getFormat().toString();
  }

  private AdFrame ah()
  {
    return (AdFrame)this.dG.get(this.N);
  }

  private List<AdUnit> b(int paramInt1, int paramInt2)
  {
    List localList = this.cJ.b(this.M.getAdSpace().toString(), paramInt2);
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      AdUnit localAdUnit = (AdUnit)localIterator.next();
      if (localAdUnit.getAdFrames().size() > 0)
        this.dI.put(((AdFrame)localAdUnit.getAdFrames().get(0)).getAdGuid().toString(), localAdUnit);
    }
    return localList;
  }

  private static String f(List<AdUnit> paramList)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("'{\"adComponents\":[");
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      localStringBuilder.append(bd.s(((AdFrame)((AdUnit)localIterator.next()).getAdFrames().get(0)).getContent().toString()));
      if (localIterator.hasNext())
        localStringBuilder.append(",");
    }
    localStringBuilder.append("]}'");
    return localStringBuilder.toString();
  }

  private cz u(String paramString)
  {
    cz localcz1;
    if (this.dJ == null)
      localcz1 = null;
    do
    {
      return localcz1;
      localcz1 = (cz)this.dJ.get(paramString);
    }
    while (localcz1 != null);
    cz localcz2 = cx.a(this.Q, paramString);
    this.dJ.put(paramString, localcz2);
    return localcz2;
  }

  private AdUnit v(String paramString)
  {
    if (this.dI == null)
      return null;
    return (AdUnit)this.dI.get(paramString);
  }

  final void a(String paramString, Map<String, String> paramMap, AdUnit paramAdUnit, cz paramcz, int paramInt1, int paramInt2)
  {
    new StringBuilder().append("fireEvent(event=").append(paramString).append(",params=").append(paramMap).append(")").toString();
    this.K.onEvent(new cw(paramString, paramMap, this.J, paramAdUnit, paramcz, paramInt1), this, paramInt2);
  }

  final boolean a(View paramView)
  {
    ViewParent localViewParent = paramView.getParent();
    return (localViewParent != null) && (localViewParent == this);
  }

  final int ad()
  {
    return ah().getBinding().intValue();
  }

  final boolean ag()
  {
    return af().equals("takeover");
  }

  public final void initLayout(Context paramContext)
  {
    new StringBuilder().append("initLayout: ad creative layout: {width = ").append(ah().getAdSpaceLayout().getAdWidth()).append(", height = ").append(ah().getAdSpaceLayout().getAdHeight()).append("}").toString();
    removeAllViews();
    setFocusable(true);
    setFocusableInTouchMode(true);
    switch (ad())
    {
    default:
      a("renderFailed", Collections.emptyMap(), this.M, this.L, this.N, 0);
      return;
    case 3:
      if (this.dt == null)
      {
        this.dt = new ce(paramContext);
        this.dt.setOnPreparedListener(this);
        this.dt.setOnCompletionListener(this);
        this.dt.setOnErrorListener(this);
        this.dt.setMediaController(new MediaController(paramContext));
      }
      this.dt.setVideoURI(Uri.parse(ae()));
      db.c(this.d, "URI: " + Uri.parse(ae()).toString());
      this.dt.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
      addView(this.dt);
      ((RelativeLayout)this.dt.getParent()).setGravity(17);
      this.B = new ProgressDialog(paramContext);
      this.B.setProgressStyle(0);
      this.B.setMessage("Loading...");
      this.B.setCancelable(true);
      this.B.setOnKeyListener(this);
      this.B.show();
      return;
    case 1:
    case 2:
    }
    if (this.du == null)
    {
      this.du = new WebView(paramContext);
      this.du.getSettings().setJavaScriptEnabled(true);
      this.du.setVerticalScrollBarEnabled(false);
      this.du.setHorizontalScrollBarEnabled(false);
      this.du.setBackgroundColor(0);
      this.du.clearCache(false);
      this.dx = new cs(this);
      this.du.setWebChromeClient(this.dx);
      this.dw = new bz(this);
      this.du.setWebViewClient(this.dw);
    }
    a("rendered", Collections.emptyMap(), this.M, this.L, this.N, 0);
    if (ad() == 1)
      if (this.dL != null)
        this.du.loadUrl(this.dL);
    while (true)
    {
      this.du.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
      return;
      String str = ae();
      this.du.loadUrl(str);
      continue;
      if (ad() == 2)
        this.du.loadDataWithBaseURL("base://url/", ae(), "text/html", "utf-8", "base://url/");
    }
  }

  public final void onCompletion(MediaPlayer paramMediaPlayer)
  {
    a("videoCompleted", Collections.emptyMap(), this.M, this.L, this.N, 0);
  }

  public final boolean onError(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    if ((this.B != null) && (this.B.isShowing()))
      this.B.dismiss();
    a("renderFailed", Collections.emptyMap(), this.M, this.L, this.N, 0);
    removeView(this.dt);
    return false;
  }

  public final boolean onKey(DialogInterface paramDialogInterface, int paramInt, KeyEvent paramKeyEvent)
  {
    new StringBuilder().append("onkey,keycode=").append(paramInt).append(",event=").append(paramKeyEvent.getAction()).toString();
    ProgressDialog localProgressDialog = this.B;
    boolean bool = false;
    if (paramDialogInterface == localProgressDialog)
    {
      bool = false;
      if (paramInt == 4)
      {
        int i = paramKeyEvent.getAction();
        bool = false;
        if (i == 0)
        {
          a("adWillClose", Collections.emptyMap(), this.M, this.L, this.N, 0);
          paramDialogInterface.dismiss();
          bool = true;
        }
      }
    }
    return bool;
  }

  public final void onPrepared(MediaPlayer paramMediaPlayer)
  {
    if (ad() == 3)
    {
      if (this.B.isShowing())
        this.B.dismiss();
      if ((this.dF == null) || (!this.dF.isShowing()))
        this.dt.start();
      a("rendered", Collections.emptyMap(), this.M, this.L, this.N, 0);
      a("videoStart", Collections.emptyMap(), this.M, this.L, this.N, 0);
    }
  }

  public final void performAction$3deb3ec3(af paramaf, FlurryAds paramFlurryAds, int paramInt)
  {
    String str1 = paramaf.bu;
    cw localcw = paramaf.bw;
    Map localMap = paramaf.bv;
    if (paramInt > 10)
    {
      new StringBuilder().append("Maximum depth for event/action loop exceeded when performing action:").append(str1).append(",").append(localMap).append(",triggered by:").append(localcw.eW).toString();
      return;
    }
    new StringBuilder().append("performAction(action=").append(str1).append(",params=").append(paramaf.bv).append(",triggering event=").append(localcw.eW).append(")").toString();
    if (str1.equals("nextAdUnit"));
    while (true)
    {
      try
      {
        while (true)
        {
          ac localac = (ac)getParent();
          if (localac != null);
          try
          {
            int i14 = Integer.parseInt((String)paramaf.bv.get("delay"));
            i13 = i14;
            long l = i13 * 1000;
            localac.a(l);
            label190: if ((!this.dM.contains(paramaf.bw.eW)) || (this.du == null))
              break;
            this.du.loadUrl("javascript:flurryadapter.callComplete('" + paramaf.bw.eW + "');");
            this.dM.remove(paramaf.bw.eW);
            return;
          }
          catch (NumberFormatException localNumberFormatException4)
          {
            while (true)
              int i13 = 0;
          }
        }
      }
      catch (ClassCastException localClassCastException3)
      {
        localClassCastException3.toString();
        ac();
        if (ag())
          continue;
        try
        {
          this.Q.d(this.J, this.M.getAdSpace().toString());
        }
        catch (Exception localException)
        {
          new StringBuilder().append("remove ad exception: ").append(localException).toString();
        }
        continue;
      }
      if (str1.equals("nextFrame"))
      {
        int i11 = 1 + this.N;
        String str6 = (String)localMap.get("offset");
        if (str6 != null)
        {
          if (!str6.equals("next"))
            break label584;
          i11 = 1 + this.N;
        }
        while (true)
        {
          a("clicked", Collections.emptyMap());
          if (this.dH)
            break label656;
          if ((i11 == this.N) || (i11 >= this.dG.size()))
            break label190;
          AdFrame localAdFrame = (AdFrame)this.M.getAdFrames().get(i11);
          String str8 = af();
          String str9 = localAdFrame.getAdSpaceLayout().getFormat().toString();
          if (str9.equals(str8))
            break label639;
          if (!str9.equals("takeover"))
            break label190;
          this.Q.b(this.L);
          this.Q.a(this.M);
          Intent localIntent = new Intent(this.J, FlurryFullscreenTakeoverActivity.class);
          localIntent.putExtra("frameIndex", i11);
          this.Q.a(this.J, localIntent, this.M.getAdSpace().toString());
          break label190;
          label584: if (str6.equals("current"))
            break;
          try
          {
            int i12 = Integer.parseInt(str6);
            i11 = i12;
          }
          catch (NumberFormatException localNumberFormatException3)
          {
            new StringBuilder().append("caught: ").append(localNumberFormatException3.getMessage()).toString();
          }
        }
        label639: this.N = i11;
        initLayout(this.J);
        continue;
        label656: String str7 = (String)paramaf.bw.bv.get("guid");
        if (str7 != null)
        {
          this.M = v(str7);
          this.dG = this.M.getAdFrames();
          this.L = paramaf.bw.L;
          if (ag())
          {
            this.Q.a(this.M);
            this.Q.b(this.L);
          }
          this.N = i11;
          this.dH = false;
          initLayout(this.J);
        }
      }
      else if (str1.equals("closeAd"))
      {
        ac();
      }
      else
      {
        if (str1.equals("notifyUser"))
        {
          AlertDialog.Builder localBuilder = new AlertDialog.Builder(this.J);
          String str2;
          String str3;
          if ((localMap.containsKey("message")) && (localMap.containsKey("confirmDisplay")) && (localMap.containsKey("cancelDisplay")))
          {
            str2 = (String)localMap.get("message");
            str3 = (String)localMap.get("confirmDisplay");
          }
          for (String str4 = (String)localMap.get("cancelDisplay"); ; str4 = "OK")
          {
            localBuilder.setMessage(str2).setCancelable(false).setPositiveButton(str4, new bx(this, localcw, paramInt)).setNegativeButton(str3, new bt(this, localcw, paramInt));
            this.dF = localBuilder.create();
            if ((this.dt != null) && (ad() == 3))
              this.dt.pause();
            this.dF.show();
            break;
            str2 = "Are you sure?";
            str3 = "Cancel";
          }
        }
        if (!str1.equals("loadAdComponents"))
          break label1353;
        int i8 = 1;
        int i9 = 3;
        if ((localMap.containsKey("min")) && (localMap.containsKey("max")));
        try
        {
          i8 = Integer.parseInt((String)localMap.get("min"));
          int i10 = Integer.parseInt((String)localMap.get("max"));
          i9 = i10;
          this.M.getAdSpace().toString();
          List localList = b(i8, i9);
          if (localList.size() <= 0)
            break label1327;
          this.M.getAdSpace().toString();
          String str5 = f(localList);
          if (this.du != null)
          {
            this.du.loadUrl("javascript:(function() {var multiadwraps=document.getElementsByClassName('multiAdWrap');if(multiadwraps.length>0){var template=document.getElementsByClassName('multiAdWrap')[0];var compiled=Hogan.compile(template.innerHTML);template.innerHTML='';template.innerHTML=compiled.render(JSON.parse(" + str5 + "));}})();");
            this.du.loadUrl("javascript:flurryadapter.callComplete();");
          }
          Iterator localIterator = localList.iterator();
          while (localIterator.hasNext())
          {
            AdUnit localAdUnit = (AdUnit)localIterator.next();
            HashMap localHashMap = new HashMap();
            localHashMap.put("guid", ((AdFrame)localAdUnit.getAdFrames().get(0)).getAdGuid().toString());
            a("rendered", localHashMap, localAdUnit, u(((AdFrame)localAdUnit.getAdFrames().get(0)).getAdGuid().toString()), 0, 0);
          }
        }
        catch (NumberFormatException localNumberFormatException2)
        {
          while (true)
          {
            i8 = 1;
            i9 = 3;
          }
        }
        if ((this.du != null) && (!a(this.du)))
        {
          addView(this.du);
          continue;
          label1327: a("renderFailed", Collections.emptyMap(), this.M, this.L, this.N, 0);
        }
      }
    }
    label1353: int n;
    int i1;
    if (str1.equals("doExpand"))
    {
      n = bd.l(this.J);
      i1 = bd.m(this.J);
      if ((!paramaf.bw.bv.containsKey("width")) || (!paramaf.bw.bv.containsKey("height")))
        break label2074;
    }
    while (true)
    {
      while (true)
      {
        try
        {
          while (true)
          {
            int i6 = bd.b(this.J, Integer.parseInt((String)paramaf.bw.bv.get("width")));
            int i7 = bd.b(this.J, Integer.parseInt((String)paramaf.bw.bv.get("height")));
            i2 = i6;
            i3 = i7;
            new StringBuilder().append("expand to width = ").append(i2).append(" height = ").append(i3).toString();
            try
            {
              if ((ac)getParent() != null)
              {
                a("clicked", Collections.emptyMap());
                if (this.dB == null)
                {
                  new StringBuilder().append("expand(").append(i2).append(",").append(i3).append(")").toString();
                  if ((this.du != null) && (-1 != indexOfChild(this.du)))
                    removeView(this.du);
                  this.dA = this.dK.getRequestedOrientation();
                  if (this.dC == null)
                  {
                    this.dC = new FrameLayout(this.J);
                    this.dC.setBackgroundColor(-16777216);
                    if ((this.du != null) && (this.du.getParent() == null))
                      this.dC.addView(this.du, new FrameLayout.LayoutParams(-1, -1, 17));
                  }
                  if (this.dB == null)
                  {
                    this.dB = new Dialog(this.J, 16973834);
                    x.a(this.dB.getWindow());
                    this.dB.setContentView(this.dC, new ViewGroup.LayoutParams(-1, -1));
                    this.dB.setOnDismissListener(new bv(this));
                    this.dB.setCancelable(true);
                    this.dB.show();
                  }
                  ax.a(this.dK, ax.I(), true);
                  this.K.b(this.M.getAdSpace().toString(), false);
                }
              }
              if (!paramaf.bw.bv.containsKey("url"))
                break;
              this.dL = ((String)paramaf.bw.bv.get("url"));
              initLayout(this.J);
            }
            catch (ClassCastException localClassCastException2)
            {
              localClassCastException2.getMessage();
            }
          }
        }
        catch (NumberFormatException localNumberFormatException1)
        {
          localNumberFormatException1.getMessage();
          int i4 = bd.l(this.J);
          int i5 = bd.m(this.J);
          i2 = i4;
          i3 = i5;
          continue;
        }
        if (!str1.equals("doCollapse"))
          break label2040;
        int i = ah().getAdSpaceLayout().getAdWidth().intValue();
        int j = ah().getAdSpaceLayout().getAdHeight().intValue();
        int k = bd.b(this.J, i);
        int m = bd.b(this.J, j);
        if (this.dL != null)
        {
          this.dL = null;
          initLayout(this.J);
        }
        try
        {
          if ((ac)getParent() == null)
            break;
          a(k, m);
        }
        catch (ClassCastException localClassCastException1)
        {
          new StringBuilder().append("action doCollapse failed:").append(localClassCastException1.getMessage()).toString();
        }
      }
      break;
      label2040: if (str1.equals("directOpen"))
        a("clicked", Collections.emptyMap());
      this.K.performAction$3deb3ec3(paramaf, paramFlurryAds, paramInt);
      break;
      label2074: int i2 = n;
      int i3 = i1;
    }
  }

  final boolean shouldRotate()
  {
    int i;
    if (this.dB != null)
    {
      i = 1;
      if (i != 0)
        break label38;
      if (this.dz == null)
        break label33;
    }
    label33: for (int j = 1; ; j = 0)
    {
      if (j != 0)
        break label38;
      return true;
      i = 0;
      break;
    }
    label38: return false;
  }

  public final void stop()
  {
    if (ad() == 3)
    {
      if ((this.B != null) && (this.B.isShowing()))
        this.B.dismiss();
      if ((this.dt != null) && (this.dt.isPlaying()))
        this.dt.stopPlayback();
    }
    if (this.du != null)
    {
      if ((this.dh != null) && (this.dx != null))
        this.dx.onHideCustomView();
      if (this.dB != null)
        a(0, 0);
      removeView(this.du);
      this.du.stopLoading();
      if (l.SDK_INT >= 11)
        this.du.onPause();
      this.du.destroy();
      this.du = null;
    }
    if (ag())
      a("adClosed", Collections.emptyMap(), this.M, this.L, this.N, 0);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bn
 * JD-Core Version:    0.6.2
 */