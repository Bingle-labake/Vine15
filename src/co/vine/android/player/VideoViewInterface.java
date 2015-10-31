package co.vine.android.player;

import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;

public abstract interface VideoViewInterface
{
  public abstract int getCurrentPosition();

  public abstract boolean hasStarted();

  public abstract boolean isPaused();

  public abstract boolean isPlaying();

  public abstract void onPrepared();

  public abstract void pause();

  public abstract void resume();

  public abstract void seekTo(int paramInt);

  public abstract void setAutoPlayOnPrepared(boolean paramBoolean);

  public abstract void setKeepScreenOn(boolean paramBoolean);

  public abstract void setLooping(boolean paramBoolean);

  public abstract void setOnErrorListener(MediaPlayer.OnErrorListener paramOnErrorListener);

  public abstract void setOnPreparedListener(MediaPlayer.OnPreparedListener paramOnPreparedListener);

  public abstract void setVideoPath(String paramString);

  public abstract void setVideoPathDirect(String paramString);

  public abstract void start();

  public abstract void suspend();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.VideoViewInterface
 * JD-Core Version:    0.6.2
 */