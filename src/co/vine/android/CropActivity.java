package co.vine.android;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;
import co.vine.android.client.AppController;
import co.vine.android.util.image.ImageUtils;
import co.vine.android.util.image.ImageUtils.BitmapInfo;
import co.vine.android.widget.CroppableImageView;
import java.io.ByteArrayOutputStream;
import java.lang.ref.WeakReference;

public class CropActivity extends BaseControllerActionBarActivity
  implements DialogInterface.OnCancelListener
{
  private static final int DIALOG_CROPPING_PROGRESS_ID = 0;
  private static final int DIALOG_LOADING_PROGRESS_ID = 1;
  public static final String EXTRA_CROP_RECT = "cropped_rect";
  public static final String EXTRA_CROP_TYPE = "crop_type";
  public static final String EXTRA_URI = "uri";
  private static final String STATE_DEGREES = "degrees";
  int mBitmapHeight;
  int mBitmapHeightOffset;
  protected boolean mBitmapLoaded;
  int mBitmapWidth;
  int mBitmapWidthOffset;
  protected CropImageTask mCropTask;
  private int mCurrDegrees;
  int mFileToViewScale;
  protected Uri mUri;
  protected CroppableImageView mView;

  protected void doCrop()
  {
    if (!this.mBitmapLoaded)
      return;
    if (this.mCropTask != null)
      this.mCropTask.detachActivity();
    this.mCropTask = new CropImageTask(this);
    this.mCropTask.execute(new Void[0]);
  }

  protected void onBitmapProcessingDone(Bitmap paramBitmap)
  {
    this.mView.setVisibility(0);
    this.mView.setImageBitmap(paramBitmap);
  }

  public void onCancel(DialogInterface paramDialogInterface)
  {
    setResult(0);
    finish();
  }

  public void onClickHandler(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return;
    case 2131361908:
      doCrop();
      return;
    case 2131361907:
    }
    setResult(0);
    finish();
  }

  protected void onCreate(Bundle paramBundle, int paramInt)
  {
    super.onCreate(paramBundle, paramInt, false);
    this.mUri = ((Uri)getIntent().getParcelableExtra("uri"));
    this.mView = ((CroppableImageView)findViewById(2131361840));
    this.mView.setVisibility(4);
    if (paramBundle != null);
    for (this.mCurrDegrees = paramBundle.getInt("degrees", 0); ; this.mCurrDegrees = 0)
    {
      this.mCropTask = ((CropImageTask)getLastCustomNonConfigurationInstance());
      if (this.mCropTask != null)
        break;
      new LoadImageTask(this).execute(new Void[0]);
      return;
    }
    this.mCropTask.attachActivity(this);
  }

  protected Dialog onCreateDialog(int paramInt)
  {
    ProgressDialog localProgressDialog = new ProgressDialog(this, 2131689512);
    localProgressDialog.setProgressStyle(0);
    localProgressDialog.setCanceledOnTouchOutside(false);
    localProgressDialog.setOnCancelListener(this);
    switch (paramInt)
    {
    default:
      return super.onCreateDialog(paramInt);
    case 0:
      localProgressDialog.setMessage(getString(2131624069));
      return localProgressDialog;
    case 1:
    }
    localProgressDialog.setMessage(getString(2131624152));
    return localProgressDialog;
  }

  public void onCropDone(boolean paramBoolean, Intent paramIntent)
  {
    if (paramBoolean)
      setResult(-1, paramIntent);
    while (true)
    {
      finish();
      return;
      Toast.makeText(this, 2131624070, 1).show();
      setResult(0);
    }
  }

  protected void onPause()
  {
    super.onPause();
    removeDialog(0);
    removeDialog(1);
  }

  public Object onRetainCustomNonConfigurationInstance()
  {
    if (this.mCropTask != null)
      this.mCropTask.detachActivity();
    return this.mCropTask;
  }

  protected void onSaveInstanceState(Bundle paramBundle)
  {
    paramBundle.putInt("degrees", this.mCurrDegrees);
  }

  public boolean onSearchRequested()
  {
    return false;
  }

  private static class CropImageTask extends AsyncTask<Void, Void, Boolean>
  {
    CropActivity mActivity;
    final int mBitmapHeight;
    final int mBitmapHeightOffset;
    final int mBitmapWidth;
    final int mBitmapWidthOffset;
    final Context mContext;
    final Rect mCropRect;
    final int mFileToViewScale;
    final Intent mIntent;
    final Uri mUri;
    ImageView mView;
    Bitmap mViewBitmap;

    CropImageTask(CropActivity paramCropActivity)
    {
      this.mActivity = paramCropActivity;
      this.mContext = paramCropActivity.getApplicationContext();
      this.mFileToViewScale = paramCropActivity.mFileToViewScale;
      this.mBitmapWidthOffset = paramCropActivity.mBitmapWidthOffset;
      this.mBitmapHeightOffset = paramCropActivity.mBitmapHeightOffset;
      this.mBitmapHeight = paramCropActivity.mBitmapHeight;
      this.mBitmapWidth = paramCropActivity.mBitmapWidth;
      this.mUri = paramCropActivity.mUri;
      this.mIntent = new Intent();
      this.mView = paramCropActivity.mView;
      RectF localRectF = ((CroppableImageView)this.mView).getCropRect();
      this.mCropRect = new Rect((int)localRectF.left, (int)localRectF.top, (int)localRectF.right, (int)localRectF.bottom);
    }

    private Boolean basicCrop()
    {
      Context localContext = this.mContext;
      Rect localRect1 = this.mCropRect;
      Bitmap localBitmap1 = this.mViewBitmap;
      if (localBitmap1 == null)
        return Boolean.FALSE;
      Rect localRect2 = new Rect(0, 0, localBitmap1.getWidth(), localBitmap1.getHeight());
      int i = localRect1.height();
      if ((localRect1.width() <= 1) || (i <= 1))
        return Boolean.FALSE;
      if (localRect2.contains(localRect1))
      {
        Bitmap localBitmap2 = ImageUtils.createBitmap(localContext, localBitmap1, localRect1.left, localRect1.top, localRect1.width(), localRect1.height());
        if (localBitmap2 != null)
        {
          ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
          localBitmap2.compress(Bitmap.CompressFormat.JPEG, 100, localByteArrayOutputStream);
          ImageUtils.BitmapInfo localBitmapInfo = ImageUtils.resizeBitmap(localContext, localByteArrayOutputStream.toByteArray(), 200, 200);
          if ((localBitmapInfo != null) && (localBitmapInfo.bitmap != null))
          {
            long l = AppController.getInstance(localContext).getActiveId();
            Uri localUri = ImageUtils.writePicToFile(localContext, localBitmapInfo.bitmap, l);
            if (localUri != null)
            {
              int j = this.mFileToViewScale;
              localRect1.set(j * localRect1.left, j * localRect1.top, j * (localRect1.right - this.mBitmapWidthOffset), j * (localRect1.bottom - this.mBitmapHeightOffset));
              this.mIntent.putExtra("cropped_rect", localRect1);
              this.mIntent.putExtra("uri", localUri);
              return Boolean.TRUE;
            }
          }
        }
      }
      return Boolean.FALSE;
    }

    public void attachActivity(CropActivity paramCropActivity)
    {
      this.mActivity = paramCropActivity;
    }

    public void detachActivity()
    {
      this.mActivity = null;
      this.mView = null;
    }

    protected Boolean doInBackground(Void[] paramArrayOfVoid)
    {
      return basicCrop();
    }

    protected void onPostExecute(Boolean paramBoolean)
    {
      if (this.mActivity != null)
      {
        this.mActivity.removeDialog(0);
        this.mActivity.onCropDone(paramBoolean.booleanValue(), this.mIntent);
      }
    }

    protected void onPreExecute()
    {
      ImageView localImageView = this.mView;
      if ((this.mActivity != null) && (localImageView != null) && (localImageView.getDrawable() != null))
      {
        this.mViewBitmap = ((BitmapDrawable)localImageView.getDrawable()).getBitmap();
        this.mActivity.showDialog(0);
      }
    }
  }

  class LoadImageTask extends AsyncTask<Void, Void, Bitmap>
  {
    private final WeakReference<CropActivity> mActivity;

    LoadImageTask(CropActivity arg2)
    {
      Object localObject;
      this.mActivity = new WeakReference(localObject);
      CropActivity.this.mBitmapLoaded = false;
    }

    protected Bitmap doInBackground(Void[] paramArrayOfVoid)
    {
      DisplayMetrics localDisplayMetrics = CropActivity.this.getResources().getDisplayMetrics();
      ImageUtils.BitmapInfo localBitmapInfo = ImageUtils.safeDecode(CropActivity.this, CropActivity.this.mUri, localDisplayMetrics.widthPixels, localDisplayMetrics.heightPixels, true);
      if (localBitmapInfo != null)
      {
        int i = localBitmapInfo.scale;
        CropActivity.this.mBitmapWidth = localBitmapInfo.origWidth;
        CropActivity.this.mBitmapHeight = localBitmapInfo.origHeight;
        CropActivity.this.mBitmapWidthOffset = (localBitmapInfo.origWidth % i);
        CropActivity.this.mBitmapHeightOffset = (localBitmapInfo.origHeight % i);
        CropActivity.this.mFileToViewScale = i;
        return localBitmapInfo.bitmap;
      }
      return null;
    }

    protected void onPostExecute(Bitmap paramBitmap)
    {
      CropActivity localCropActivity = (CropActivity)this.mActivity.get();
      if (localCropActivity == null)
        return;
      if (paramBitmap != null)
      {
        localCropActivity.mBitmapLoaded = true;
        localCropActivity.onBitmapProcessingDone(paramBitmap);
      }
      while (true)
      {
        CropActivity.this.removeDialog(1);
        return;
        Toast.makeText(CropActivity.this, 2131624150, 1).show();
        CropActivity.this.removeDialog(1);
        CropActivity.this.setResult(0);
        CropActivity.this.finish();
      }
    }

    protected void onPreExecute()
    {
      CropActivity.this.showDialog(1);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.CropActivity
 * JD-Core Version:    0.6.2
 */