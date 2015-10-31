package co.vine.android;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.network.HttpResult;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import java.util.HashMap;

public class ImageFragment extends BaseControllerFragment
  implements View.OnTouchListener
{
  public static final String ARG_IMAGE_URL = "image_url";
  public static final String STATE_IMAGE_BITMAP = "state_image_bitmap";
  private long mFirstTouch;
  private Bitmap mImageBitmap;
  private ImageKey mImageKey;
  private ImageView mImageView;
  private ProgressBar mProgress;

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (paramBundle == null)
    {
      String str = getArguments().getString("image_url");
      if (!TextUtils.isEmpty(str))
      {
        this.mImageKey = new ImageKey(str);
        Bitmap localBitmap = this.mAppController.getPhotoBitmap(this.mImageKey);
        if (localBitmap == null)
          break label68;
        this.mImageBitmap = localBitmap;
      }
      while (true)
      {
        this.mImageView.setOnTouchListener(this);
        return;
        label68: this.mProgress.setVisibility(0);
      }
    }
    this.mImageBitmap = ((Bitmap)paramBundle.getParcelable("state_image_bitmap"));
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mAppSessionListener = new ImageSessionListener(null);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = paramLayoutInflater.inflate(2130903097, paramViewGroup, false);
    this.mImageView = ((ImageView)localView.findViewById(2131361840));
    this.mProgress = ((ProgressBar)localView.findViewById(2131361821));
    return localView;
  }

  public void onResume()
  {
    super.onResume();
    Bitmap localBitmap = this.mImageBitmap;
    if (localBitmap != null)
      this.mImageView.setImageDrawable(new RecyclableBitmapDrawable(getResources(), localBitmap));
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (this.mImageBitmap != null)
      paramBundle.putParcelable("state_image_bitmap", this.mImageBitmap);
  }

  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getAction() != 1)
      return false;
    long l = System.currentTimeMillis();
    if (l - this.mFirstTouch < 400L)
    {
      getActivity().finish();
      return true;
    }
    this.mFirstTouch = l;
    return true;
  }

  private class ImageSessionListener extends AppSessionListener
  {
    private ImageSessionListener()
    {
    }

    private void finishFailed()
    {
      Util.showCenteredToast(ImageFragment.this.getActivity(), 2131624150);
      ImageFragment.this.getActivity().finish();
    }

    public void onPhotoImageError(ImageKey paramImageKey, HttpResult paramHttpResult)
    {
      if (paramImageKey.equals(ImageFragment.this.mImageKey))
        finishFailed();
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      UrlImage localUrlImage = (UrlImage)paramHashMap.get(ImageFragment.this.mImageKey);
      if ((localUrlImage != null) && (localUrlImage.isValid()))
      {
        ImageFragment.this.mProgress.setVisibility(8);
        ImageFragment.this.mImageView.setImageDrawable(new RecyclableBitmapDrawable(ImageFragment.this.mImageView.getResources(), localUrlImage.bitmap));
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ImageFragment
 * JD-Core Version:    0.6.2
 */