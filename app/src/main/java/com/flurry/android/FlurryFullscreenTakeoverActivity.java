package com.flurry.android;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.Configuration;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.webkit.MimeTypeMap;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.MediaController;
import android.widget.VideoView;
import java.util.Collections;

public final class FlurryFullscreenTakeoverActivity extends Activity
  implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener
{
  public static final String EXTRA_KEY_ADSPACENAME = "adSpaceName";
  public static final String EXTRA_KEY_FRAMEINDEX = "frameIndex";
  public static final String EXTRA_KEY_TARGETINTENT = "targetIntent";
  public static final String EXTRA_KEY_URL = "url";
  private static final String d = FlurryFullscreenTakeoverActivity.class.getSimpleName();
  private cl A;
  private ProgressDialog B;
  private VideoView C;
  private boolean D;
  private MediaController E;
  private boolean F;
  private Intent G;
  private String H;
  private bn y;
  private FrameLayout z;

  private static boolean a(String paramString)
  {
    boolean bool1 = TextUtils.isEmpty(paramString);
    boolean bool2 = false;
    if (!bool1)
    {
      String str = MimeTypeMap.getSingleton().getMimeTypeFromExtension(MimeTypeMap.getFileExtensionFromUrl(paramString));
      bool2 = false;
      if (str != null)
      {
        boolean bool3 = str.startsWith("video/");
        bool2 = false;
        if (bool3)
          bool2 = true;
      }
    }
    return bool2;
  }

  private void b(String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || (this.C == null) || (this.z == null));
    do
    {
      return;
      this.E = new MediaController(this);
      this.C.setOnPreparedListener(this);
      this.C.setOnCompletionListener(this);
      this.C.setOnErrorListener(this);
      this.C.setMediaController(this.E);
      this.C.setVideoURI(Uri.parse(paramString));
      this.z.addView(this.C, new FrameLayout.LayoutParams(-1, -1, 17));
      this.B = new ProgressDialog(this);
      this.B.setProgressStyle(0);
      this.B.setMessage("Loading...");
      this.B.setCancelable(true);
      this.B.show();
    }
    while (this.A == null);
    this.A.setVisibility(8);
  }

  private void e()
  {
    if (this.B != null)
    {
      if (this.B.isShowing())
        this.B.dismiss();
      this.B = null;
    }
    if (this.A != null)
      this.A.setVisibility(0);
    if (this.C != null)
    {
      if (this.C.isPlaying())
        this.C.stopPlayback();
      if (this.z != null)
        this.z.removeView(this.C);
      this.C = null;
    }
    this.D = false;
    this.E = null;
  }

  public final void onCompletion(MediaPlayer paramMediaPlayer)
  {
  }

  public final void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
  }

  public final void onCreate(Bundle paramBundle)
  {
    int i = -1;
    setTheme(16973831);
    super.onCreate(paramBundle);
    x.a(getWindow());
    Intent localIntent = getIntent();
    this.G = ((Intent)localIntent.getParcelableExtra("targetIntent"));
    this.H = localIntent.getStringExtra("adSpaceName");
    if (this.G != null);
    while (true)
    {
      boolean bool;
      try
      {
        startActivity(this.G);
        if (this.H != null)
        {
          FlurryAds localFlurryAds1 = FlurryAds.getInstance();
          String str2 = this.H;
          if (this.G == null)
            break label361;
          bool = true;
          localFlurryAds1.b(str2, bool);
        }
        return;
      }
      catch (ActivityNotFoundException localActivityNotFoundException)
      {
        db.b(d, "Cannot launch Activity", localActivityNotFoundException);
        this.G = null;
        finish();
        continue;
      }
      String str1 = localIntent.getStringExtra("url");
      if (str1 == null)
      {
        if (paramBundle == null);
        while (true)
        {
          if (i < 0)
            i = localIntent.getIntExtra("frameIndex", 0);
          FlurryAds localFlurryAds2 = FlurryAds.getInstance();
          if (localFlurryAds2.X() == null)
            break;
          this.y = new bn(this, localFlurryAds2, localFlurryAds2.W(), localFlurryAds2.X(), i);
          this.y.initLayout(this);
          if (i == 0)
            this.y.a("rendered", Collections.emptyMap());
          setContentView(this.y);
          break;
          i = paramBundle.getInt("frameIndex", i);
        }
      }
      this.z = new FrameLayout(this);
      setContentView(this.z);
      if (a(str1))
      {
        this.C = new ce(this);
        b(str1);
      }
      else
      {
        this.A = new cl(this, str1);
        this.A.a(new f(this));
        this.A.a(new y(this));
        this.A.a(new bh(this));
        this.z.addView(this.A);
        continue;
        label361: bool = false;
      }
    }
  }

  protected final void onDestroy()
  {
    e();
    if (this.A != null)
      this.A.destroy();
    if (this.y != null)
      this.y.stop();
    if ((isFinishing()) && (this.H != null))
      FlurryAds.getInstance().j(this.H);
    super.onDestroy();
  }

  public final boolean onError(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    db.d(d, "error occurs during video playback");
    if (this.A != null)
      if (this.D)
        if (this.A.canGoBack())
        {
          this.A.goBack();
          e();
        }
    while (true)
    {
      return true;
      finish();
      continue;
      e();
      continue;
      finish();
    }
  }

  public final boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4)
    {
      if (this.y != null)
      {
        this.y.a("adWillClose", Collections.emptyMap(), this.y.M, this.y.L, this.y.N, 0);
        return true;
      }
      if (this.C != null)
      {
        if (this.A != null)
          if (this.D)
          {
            if (this.A.canGoBack())
            {
              this.A.goBack();
              e();
              return true;
            }
          }
          else
          {
            e();
            return true;
          }
      }
      else if ((this.A != null) && (this.A.canGoBack()))
      {
        this.A.goBack();
        return true;
      }
    }
    return super.onKeyUp(paramInt, paramKeyEvent);
  }

  protected final void onPause()
  {
    super.onPause();
    this.F = false;
    if ((this.C != null) && (this.C.isPlaying()))
      this.C.pause();
  }

  public final void onPrepared(MediaPlayer paramMediaPlayer)
  {
    if ((this.B != null) && (this.B.isShowing()))
      this.B.dismiss();
    if ((this.C != null) && (this.F))
      this.C.start();
  }

  protected final void onRestart()
  {
    super.onRestart();
  }

  protected final void onResume()
  {
    super.onResume();
    this.F = true;
    if (this.E != null)
      this.E.show(0);
  }

  public final void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (this.y != null)
      paramBundle.putInt("frameIndex", this.y.N);
  }

  public final void onStart()
  {
    super.onStart();
    if (FlurryAgent.w() != null)
    {
      FlurryAgent.onStartSession(this, FlurryAgent.w());
      return;
    }
    finish();
  }

  public final void onStop()
  {
    FlurryAgent.onEndSession(this);
    super.onStop();
  }

  public final void onWindowFocusChanged(boolean paramBoolean)
  {
    new StringBuilder().append("onWindowFocusChanged hasFocus = ").append(paramBoolean).toString();
    if ((this.F) && (paramBoolean) && (this.G != null))
      finish();
    super.onWindowFocusChanged(paramBoolean);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.FlurryFullscreenTakeoverActivity
 * JD-Core Version:    0.6.2
 */