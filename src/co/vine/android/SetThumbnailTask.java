package co.vine.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import android.util.DisplayMetrics;
import co.vine.android.util.image.ImageUtils;
import java.lang.ref.WeakReference;

public class SetThumbnailTask extends AsyncTask<Uri, Void, Bitmap>
{
  private final WeakReference<android.app.Fragment> mFragmentRef;
  private final WeakReference<android.support.v4.app.Fragment> mSupportFragmentRef;

  public SetThumbnailTask(android.app.Fragment paramFragment)
  {
    this.mFragmentRef = new WeakReference(paramFragment);
    this.mSupportFragmentRef = null;
  }

  public SetThumbnailTask(android.support.v4.app.Fragment paramFragment)
  {
    this.mSupportFragmentRef = new WeakReference(paramFragment);
    this.mFragmentRef = null;
  }

  protected Bitmap doInBackground(Uri[] paramArrayOfUri)
  {
    Activity localActivity;
    if (this.mSupportFragmentRef != null)
    {
      localActivity = getSupportFragmentActivity();
      if (localActivity != null)
        break label37;
    }
    label37: Uri localUri;
    Bitmap localBitmap;
    do
    {
      return null;
      WeakReference localWeakReference = this.mFragmentRef;
      localActivity = null;
      if (localWeakReference == null)
        break;
      localActivity = getFragmentActivity();
      break;
      localUri = paramArrayOfUri[0];
      Resources localResources = localActivity.getResources();
      float f = localResources.getDimensionPixelSize(2131427419) * localResources.getDisplayMetrics().density;
      localBitmap = ImageUtils.resizeBitmap(localActivity, localUri, f, f, 0);
    }
    while (localBitmap == null);
    return ImageUtils.adjustRotation(localActivity, localUri, localBitmap);
  }

  @TargetApi(11)
  protected Activity getFragmentActivity()
  {
    android.app.Fragment localFragment = (android.app.Fragment)this.mFragmentRef.get();
    if (localFragment == null)
      return null;
    return localFragment.getActivity();
  }

  protected Activity getSupportFragmentActivity()
  {
    android.support.v4.app.Fragment localFragment = (android.support.v4.app.Fragment)this.mSupportFragmentRef.get();
    if (localFragment == null)
      return null;
    return localFragment.getActivity();
  }

  protected void onPostExecute(Bitmap paramBitmap)
  {
    Object localObject;
    if (this.mSupportFragmentRef != null)
      localObject = this.mSupportFragmentRef.get();
    while (true)
    {
      if (localObject != null)
        ((SetThumbnailListener)localObject).setThumbnailImage(paramBitmap);
      return;
      WeakReference localWeakReference = this.mFragmentRef;
      localObject = null;
      if (localWeakReference != null)
        localObject = this.mFragmentRef.get();
    }
  }

  public static abstract interface SetThumbnailListener
  {
    public abstract void setThumbnailImage(Bitmap paramBitmap);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SetThumbnailTask
 * JD-Core Version:    0.6.2
 */