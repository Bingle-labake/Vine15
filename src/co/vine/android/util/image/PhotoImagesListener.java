package co.vine.android.util.image;

import co.vine.android.network.HttpResult;
import java.util.HashMap;

public abstract interface PhotoImagesListener
{
  public abstract void onPhotoImageError(PhotoImagesCache paramPhotoImagesCache, ImageKey paramImageKey, HttpResult paramHttpResult);

  public abstract void onPhotoImageLoaded(PhotoImagesCache paramPhotoImagesCache, HashMap<ImageKey, UrlImage> paramHashMap);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.image.PhotoImagesListener
 * JD-Core Version:    0.6.2
 */