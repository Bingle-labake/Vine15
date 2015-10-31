package co.vine.android.player;

import android.view.View;
import android.view.View.OnClickListener;
import com.edisonwang.android.slog.SLog;
import java.lang.ref.WeakReference;

public class OnSingleVideoClickedListener
  implements View.OnClickListener
{
  private int mState;
  private final WeakReference<VideoViewInterface> mViewPlayer;

  public OnSingleVideoClickedListener(VideoViewInterface paramVideoViewInterface)
  {
    this.mViewPlayer = new WeakReference(paramVideoViewInterface);
  }

  public void onClick()
  {
    VideoViewInterface localVideoViewInterface = (VideoViewInterface)this.mViewPlayer.get();
    if ((localVideoViewInterface != null) && (localVideoViewInterface.hasStarted()))
    {
      SLog.d("Change player state.");
      if (localVideoViewInterface.isPaused())
      {
        localVideoViewInterface.resume();
        this.mState = 1;
        return;
      }
      localVideoViewInterface.pause();
      this.mState = 0;
      return;
    }
    SLog.d("Ignore because it is not in playing state.");
    this.mState = -1;
  }

  public void onClick(View paramView)
  {
    onClick();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.OnSingleVideoClickedListener
 * JD-Core Version:    0.6.2
 */