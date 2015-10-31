package co.vine.android.player;

public abstract interface HasVideoPlayerAdapter
{
  public abstract SdkVideoView getLastPlayer();

  public abstract SdkVideoView getPlayer(int paramInt, boolean paramBoolean);

  public abstract void pauseCurrentPlayer();

  public abstract void play(int paramInt);

  public abstract void playCurrentPosition();

  public abstract void playFile(int paramInt);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.HasVideoPlayerAdapter
 * JD-Core Version:    0.6.2
 */