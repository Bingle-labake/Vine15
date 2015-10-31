package co.vine.android;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.widget.Button;
import co.vine.android.widget.CroppableImageView;

public class EditProfileCropActivity extends CropActivity
{
  private Button mSaveButton;

  protected void onBitmapProcessingDone(Bitmap paramBitmap)
  {
    super.onBitmapProcessingDone(paramBitmap);
    this.mSaveButton.setEnabled(true);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903077);
    this.mSaveButton = ((Button)findViewById(2131361908));
    this.mSaveButton.setEnabled(false);
    this.mView.setCropType(2);
    setupActionBar(null, Boolean.valueOf(true), Integer.valueOf(2131624068), null);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.EditProfileCropActivity
 * JD-Core Version:    0.6.2
 */