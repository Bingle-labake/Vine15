package co.vine.android.player;

import android.view.View;
import android.view.View.OnClickListener;

public class OnListVideoClickListener
  implements View.OnClickListener
{
  private final HasVideoPlayerAdapter mAdapter;
  private int mPosition;

  public OnListVideoClickListener(HasVideoPlayerAdapter paramHasVideoPlayerAdapter)
  {
    this.mAdapter = paramHasVideoPlayerAdapter;
  }

  public int getPosition()
  {
    return this.mPosition;
  }

  public void onClick(View paramView)
  {
    SdkVideoView localSdkVideoView = this.mAdapter.getPlayer(this.mPosition, false);
    if (this.mAdapter.getLastPlayer() != localSdkVideoView)
      this.mAdapter.pauseCurrentPlayer();
    if ((localSdkVideoView != null) && (localSdkVideoView.hasStarted()))
    {
      if (this.mPosition == localSdkVideoView.getPlayingPosition())
      {
        if (localSdkVideoView.isPaused())
          localSdkVideoView.resume();
      }
      else
        return;
      localSdkVideoView.pause();
      return;
    }
    this.mAdapter.play(this.mPosition);
  }

  public void setPosition(int paramInt)
  {
    this.mPosition = paramInt;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.OnListVideoClickListener
 * JD-Core Version:    0.6.2
 */