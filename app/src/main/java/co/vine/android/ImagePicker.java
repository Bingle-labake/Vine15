package co.vine.android;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ContentValues;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.net.Uri;
import android.provider.MediaStore.Images.Media;
import android.widget.Toast;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageUtils;
import com.edisonwang.android.slog.SLog;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;

public class ImagePicker
{
  private long mActiveUserId;
  private Activity mActivity;
  private Listener mListener;
  private Uri mSavedImageUri;

  public ImagePicker(Activity paramActivity, Listener paramListener, long paramLong)
  {
    this.mActivity = paramActivity;
    this.mActiveUserId = paramLong;
    this.mListener = paramListener;
  }

  public void captureImage(int paramInt)
  {
    File localFile = ImageUtils.getTempPic(this.mActivity, false, this.mActiveUserId);
    if ((localFile == null) || (!ImageUtils.hasEnoughExternalStorageForNewPhoto(this.mActivity)))
    {
      Toast.makeText(this.mActivity, 2131624016, 0).show();
      return;
    }
    String str = this.mActivity.getString(2131624247);
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("title", str);
    localContentValues.put("description", str);
    Uri localUri = Uri.fromFile(localFile);
    this.mListener.setAvatarUrl(localUri);
    Intent localIntent = new Intent("android.media.action.IMAGE_CAPTURE").putExtra("output", localUri);
    try
    {
      this.mActivity.startActivityForResult(localIntent, paramInt);
      return;
    }
    catch (ActivityNotFoundException localActivityNotFoundException)
    {
      Util.showCenteredToast(this.mActivity, 2131624395);
      ImageUtils.deleteTempPic(localUri);
      this.mListener.setAvatarUrl(null);
    }
  }

  public void chooseImage(int paramInt)
  {
    Intent localIntent = new Intent("android.intent.action.PICK", MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
    try
    {
      this.mActivity.startActivityForResult(localIntent, paramInt);
      return;
    }
    catch (ActivityNotFoundException localActivityNotFoundException)
    {
      Util.showCenteredToast(this.mActivity, 2131624395);
    }
  }

  public Uri getSavedImageUri()
  {
    return this.mSavedImageUri;
  }

  public void saveProfileImage(Bitmap paramBitmap)
  {
    File localFile = new File(Util.getExternalCacheDir(this.mActivity), "twitter_profile.jpg");
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    paramBitmap.compress(Bitmap.CompressFormat.JPEG, 100, localByteArrayOutputStream);
    byte[] arrayOfByte = localByteArrayOutputStream.toByteArray();
    try
    {
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      localFileOutputStream.write(arrayOfByte);
      localFileOutputStream.close();
      this.mSavedImageUri = Uri.fromFile(localFile);
      SLog.d("Pending Uri for profile photo is {}.", this.mSavedImageUri);
      this.mListener.setAvatarUrl(this.mSavedImageUri);
      return;
    }
    catch (Exception localException)
    {
      if (this.mActivity != null)
        this.mActivity.runOnUiThread(new Runnable()
        {
          public void run()
          {
            Toast.makeText(ImagePicker.this.mActivity, 2131624234, 0).show();
          }
        });
      this.mListener.setAvatarUrl(null);
    }
  }

  public static abstract interface Listener
  {
    public abstract void setAvatarUrl(Uri paramUri);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ImagePicker
 * JD-Core Version:    0.6.2
 */