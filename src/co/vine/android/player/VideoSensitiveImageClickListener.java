package co.vine.android.player;

import android.view.View;
import java.util.HashSet;

public class VideoSensitiveImageClickListener extends SensitiveImageClickListener
{
  private HasVideoPlayerAdapter mAdapter;

  public VideoSensitiveImageClickListener(HasVideoPlayerAdapter paramHasVideoPlayerAdapter, HashSet<Integer> paramHashSet)
  {
    super(paramHashSet);
    this.mAdapter = paramHasVideoPlayerAdapter;
  }

  public void onClick(View paramView)
  {
    SdkVideoView localSdkVideoView = this.mAdapter.getPlayer(this.mPosition, false);
    if (this.mAdapter.getLastPlayer() != localSdkVideoView)
      this.mAdapter.pauseCurrentPlayer();
    if (localSdkVideoView.hasStarted())
    {
      if (this.mPosition == localSdkVideoView.getPlayingPosition())
      {
        if (localSdkVideoView.isPaused())
        {
          localSdkVideoView.resume();
          return;
        }
        localSdkVideoView.pause();
        return;
      }
      this.mExplicitDismissed.add(Integer.valueOf(this.mPosition));
      this.mAdapter.playFile(this.mPosition);
      return;
    }
    this.mExplicitDismissed.add(Integer.valueOf(this.mPosition));
    this.mAdapter.play(this.mPosition);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.VideoSensitiveImageClickListener
 * JD-Core Version:    0.6.2
 */