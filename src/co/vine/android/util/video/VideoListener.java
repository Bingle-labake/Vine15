package co.vine.android.util.video;

import co.vine.android.network.HttpResult;
import java.util.HashMap;

public abstract interface VideoListener
{
  public abstract void onVideoPathError(VideoCache paramVideoCache, VideoKey paramVideoKey, HttpResult paramHttpResult);

  public abstract void onVideoPathObtained(VideoCache paramVideoCache, HashMap<VideoKey, UrlVideo> paramHashMap);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.video.VideoListener
 * JD-Core Version:    0.6.2
 */