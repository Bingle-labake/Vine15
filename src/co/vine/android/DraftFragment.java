package co.vine.android;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnInfoListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import co.vine.android.player.SdkVideoView;
import co.vine.android.player.SdkVideoView.SurfaceReadyListener;
import co.vine.android.recorder.ProgressView;
import java.io.File;

public class DraftFragment extends BaseFragment
  implements MediaPlayer.OnPreparedListener, MediaPlayer.OnInfoListener, MediaPlayer.OnErrorListener, SdkVideoView.SurfaceReadyListener
{
  private static final int VISIBILITY_DELAY = 100;
  private Bitmap mBitmap;
  public boolean mCanUnhide = true;
  private int mDimen;
  private boolean mExpired;
  private Animation mFadeIn;
  private File mFolder;
  private DraftPageViewHolder mHolder;
  private int mIndex;
  private View.OnClickListener mListener;
  private int mProgress;
  private Animation mQuickFadeOut;
  private boolean mSelected;
  private final Runnable mStartPlayingRunnable = new Runnable()
  {
    public void run()
    {
      if ((DraftFragment.this.mVideoView.getVisibility() != 0) && (DraftFragment.this.mCanUnhide))
        DraftFragment.this.mVideoView.setVisibility(0);
    }
  };
  private String mThumbUrl;
  private String mVideoUrl;
  private SdkVideoView mVideoView;

  public DraftFragment()
  {
  }

  public DraftFragment(boolean paramBoolean, int paramInt1, String paramString1, String paramString2, File paramFile, int paramInt2, int paramInt3)
  {
    this.mIndex = paramInt1;
    this.mSelected = paramBoolean;
    this.mVideoUrl = paramString1;
    this.mFolder = paramFile;
    this.mProgress = paramInt2;
    this.mThumbUrl = paramString2;
    this.mDimen = paramInt3;
    this.mExpired = false;
  }

  private void onSelected()
  {
    resumePlayer();
  }

  private void onUnselected()
  {
    this.mVideoView.pause();
  }

  public View getProgressView()
  {
    return this.mHolder.progressView;
  }

  public View getThumbnailView()
  {
    return this.mHolder.thumb;
  }

  public boolean isExpired()
  {
    return this.mExpired;
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    Resources localResources = getResources();
    View localView1 = paramLayoutInflater.inflate(2130903081, paramViewGroup, false);
    DraftPageViewHolder localDraftPageViewHolder = new DraftPageViewHolder(localView1, this.mVideoUrl);
    int i = localResources.getDimensionPixelOffset(2131427394);
    int j = localResources.getDimensionPixelOffset(2131427358);
    RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)localDraftPageViewHolder.draftContainer.getLayoutParams();
    localLayoutParams.topMargin = (i + j);
    localDraftPageViewHolder.draftContainer.setLayoutParams(localLayoutParams);
    RelativeLayout localRelativeLayout = (RelativeLayout)localView1.findViewById(2131361921);
    localRelativeLayout.setDrawingCacheEnabled(true);
    ViewGroup.LayoutParams localLayoutParams1 = localRelativeLayout.getLayoutParams();
    localLayoutParams1.height = this.mDimen;
    localLayoutParams1.width = this.mDimen;
    localRelativeLayout.setLayoutParams(localLayoutParams1);
    localRelativeLayout.setTag(this.mFolder);
    localRelativeLayout.setOnClickListener(this.mListener);
    ViewGroup.LayoutParams localLayoutParams2 = localDraftPageViewHolder.progressView.getLayoutParams();
    localDraftPageViewHolder.progressView.shouldBeWidth = ((int)(this.mProgress / 6000.0F * this.mDimen));
    localLayoutParams2.width = this.mDimen;
    localDraftPageViewHolder.progressView.setLayoutParams(localLayoutParams2);
    localDraftPageViewHolder.progressView.invalidate();
    View localView2 = localView1.findViewById(2131361919);
    ViewGroup.LayoutParams localLayoutParams3 = localView2.getLayoutParams();
    localLayoutParams3.width = this.mDimen;
    localLayoutParams3.height = ((AbstractRecordingActivity)getActivity()).getScreenSize().y;
    localView2.setLayoutParams(localLayoutParams3);
    this.mBitmap = BitmapFactory.decodeFile(this.mThumbUrl);
    ViewGroup.LayoutParams localLayoutParams4 = localDraftPageViewHolder.thumb.getLayoutParams();
    localLayoutParams4.height = this.mDimen;
    localLayoutParams4.width = this.mDimen;
    localDraftPageViewHolder.thumb.setLayoutParams(localLayoutParams4);
    localDraftPageViewHolder.thumb.setImageBitmap(this.mBitmap);
    localDraftPageViewHolder.thumb.setVisibility(0);
    this.mHolder = localDraftPageViewHolder;
    this.mVideoView = localDraftPageViewHolder.videoView;
    ((AbstractRecordingActivity)getActivity()).addPlayerToPool(this.mVideoView);
    this.mVideoView.setOnPreparedListener(this);
    this.mVideoView.setKeepScreenOn(true);
    this.mVideoView.setLooping(true);
    this.mVideoView.setOnInfoListener(this);
    this.mVideoView.setOnErrorListener(this);
    this.mVideoView.setSurfaceReadyListener(this);
    this.mFadeIn = AnimationUtils.loadAnimation(getActivity(), 2130968589);
    this.mQuickFadeOut = AnimationUtils.loadAnimation(getActivity(), 2130968593);
    localView1.setDrawingCacheEnabled(true);
    localView1.setDrawingCacheQuality(1048576);
    return localView1;
  }

  public void onDestroyView()
  {
    super.onDestroyView();
    if (this.mBitmap != null)
      this.mBitmap.recycle();
    if (this.mVideoView != null)
      this.mVideoView.suspend();
  }

  public boolean onError(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    AbstractRecordingActivity localAbstractRecordingActivity = (AbstractRecordingActivity)getActivity();
    if (localAbstractRecordingActivity != null)
    {
      localAbstractRecordingActivity.releaseOtherPlayers(this.mVideoView);
      this.mVideoView.retryOpenVideo(false);
    }
    return true;
  }

  public boolean onInfo(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    return false;
  }

  public void onPause()
  {
    super.onPause();
    if (this.mVideoView != null)
      this.mVideoView.pause();
  }

  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    if ((this.mSelected) && (!paramMediaPlayer.isPlaying()))
    {
      paramMediaPlayer.start();
      this.mVideoView.postDelayed(this.mStartPlayingRunnable, 100L);
    }
  }

  public void onSurfaceTextureAvailable(SdkVideoView paramSdkVideoView)
  {
    paramSdkVideoView.setVisibility(4);
    this.mVideoView.startOpenVideo();
  }

  public void pausePlayer()
  {
    if ((this.mSelected) && (this.mVideoView.canPause()))
      this.mVideoView.pause();
  }

  public void release()
  {
    this.mVideoView.suspend();
  }

  public void resumePlayer()
  {
    if ((this.mVideoView.isInPlaybackState()) && (this.mVideoView.isPathPlaying(this.mVideoUrl)))
    {
      this.mVideoView.start();
      return;
    }
    if (this.mVideoView.isSurfaceReady())
    {
      this.mVideoView.setVisibility(4);
      this.mVideoView.setVideoPath(this.mVideoUrl);
      return;
    }
    this.mVideoView.setVideoPath(this.mVideoUrl);
    this.mVideoView.setVisibility(0);
  }

  public void setExpired(boolean paramBoolean)
  {
    this.mExpired = paramBoolean;
  }

  public void setListener(View.OnClickListener paramOnClickListener)
  {
    this.mListener = paramOnClickListener;
  }

  public void setSelected(boolean paramBoolean)
  {
    this.mSelected = paramBoolean;
    if (paramBoolean)
    {
      onSelected();
      return;
    }
    onUnselected();
  }

  public void showImage()
  {
    this.mHolder.thumb.setVisibility(0);
    this.mHolder.videoView.setVisibility(8);
  }

  public static class DraftPageViewHolder
  {
    public ViewGroup containerView;
    public RelativeLayout draftContainer;
    public ProgressView progressView;
    public ImageView thumb;
    public String videoUrl;
    public SdkVideoView videoView;

    public DraftPageViewHolder(View paramView, String paramString)
    {
      this.videoView = ((SdkVideoView)paramView.findViewById(2131361878));
      this.videoUrl = paramString;
      this.containerView = ((ViewGroup)paramView.findViewById(2131361921));
      this.progressView = ((ProgressView)paramView.findViewById(2131361924));
      this.thumb = ((ImageView)paramView.findViewById(2131361923));
      this.draftContainer = ((RelativeLayout)paramView.findViewById(2131361920));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.DraftFragment
 * JD-Core Version:    0.6.2
 */