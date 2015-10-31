package co.vine.android;

import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import co.vine.android.recorder.RecordingFile;
import co.vine.android.util.SonyUtil;
import com.crashlytics.android.Crashlytics;
import com.sonymobile.camera.addon.capturingmode.CapturingModeSelector;
import com.sonymobile.camera.addon.capturingmode.CapturingModeSelector.OnModeFinishListener;
import com.sonymobile.camera.addon.capturingmode.CapturingModeSelector.OnModeSelectListener;

public class SonyRecordingActivity extends AbstractRecordingActivity
{
  private static final String MODE_NAME = "vine";
  private CapturingModeSelector mSonyCapturingModeSelector;
  private int mSonyFilterColor;
  private String mSonyModeName;
  private ImageView mSonyModeSelectorButton;

  private void onHideSonyOverlay()
  {
    View localView1 = findViewById(2131362079);
    View localView2 = findViewById(2131362077);
    View localView3 = findViewById(2131361924);
    if (localView1 != null)
      localView1.setVisibility(0);
    if (localView2 != null)
      localView2.setVisibility(0);
    if (localView3 != null)
      localView3.setVisibility(0);
  }

  private void onShowSonyOverlay()
  {
    View localView1 = findViewById(2131362079);
    View localView2 = findViewById(2131362077);
    View localView3 = findViewById(2131361924);
    if (localView1 != null)
      localView1.setVisibility(4);
    if (localView2 != null)
      localView2.setVisibility(4);
    if (localView3 != null)
      localView3.setVisibility(4);
  }

  private void showSonyOverlay()
  {
    this.mSonyCapturingModeSelector.open(this.mSonyModeName);
    this.mSonyModeSelectorButton.setVisibility(4);
    this.mSonyModeSelectorButton.clearColorFilter();
    onShowSonyOverlay();
  }

  protected RecordingFragment createRecordingFragment()
  {
    return new SonyRecordingFragment();
  }

  protected RecordingPreviewFragment createRecordingPreviewFragment(RecordingFile paramRecordingFile, String paramString)
  {
    return RecordingPreviewFragment.newInstance(paramRecordingFile.getVideoPath(), this.mUploadFile, paramString, true);
  }

  public void onBackPressed()
  {
    if ((this.mSonyCapturingModeSelector != null) && (this.mSonyCapturingModeSelector.isOpened()))
    {
      this.mSonyCapturingModeSelector.close();
      this.mSonyModeSelectorButton.setVisibility(0);
      onHideSonyOverlay();
      return;
    }
    super.onBackPressed();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mSonyFilterColor = getResources().getColor(2131296359);
    this.mSonyModeName = "vine";
    SonyUtil.startSession(this);
  }

  protected void onDestroy()
  {
    if (this.mSonyModeSelectorButton != null)
    {
      this.mSonyModeSelectorButton.setOnClickListener(null);
      this.mSonyModeSelectorButton.setOnTouchListener(null);
    }
    super.onDestroy();
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
      super.onDialogDone(paramDialogInterface, paramInt1, paramInt2);
      return;
    case 0:
    }
    switch (paramInt2)
    {
    default:
      if (currentlyHoldsRecordingFragment())
        ((RecordingFragment)this.mCurrentFragment).saveSession();
      showSonyOverlay();
      return;
    case -3:
    case -2:
    }
    if (currentlyHoldsRecordingFragment())
      ((RecordingFragment)this.mCurrentFragment).setDiscardChangesOnStop();
    discardUpload();
    showSonyOverlay();
  }

  protected void onPause()
  {
    if (this.mSonyCapturingModeSelector != null)
    {
      this.mSonyCapturingModeSelector.release();
      this.mSonyCapturingModeSelector = null;
    }
    super.onPause();
  }

  protected void onResume()
  {
    super.onResume();
    setupSonyOverlay();
  }

  public void setupSonyOverlay()
  {
    ViewGroup localViewGroup = (ViewGroup)findViewById(2131362087);
    this.mSonyModeSelectorButton = ((ImageView)findViewById(2131362086));
    if ((this.mSonyModeSelectorButton == null) || (localViewGroup == null))
      return;
    this.mSonyModeSelectorButton.setVisibility(0);
    this.mSonyModeSelectorButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        RecordingFragment localRecordingFragment;
        boolean bool;
        if (SonyRecordingActivity.this.mSonyCapturingModeSelector != null)
        {
          localRecordingFragment = (RecordingFragment)SonyRecordingActivity.this.mCurrentFragment;
          bool = localRecordingFragment.isEditing();
          if ((!bool) && (!localRecordingFragment.isSessionModified()))
          {
            localRecordingFragment.setDiscardChangesOnStop();
            SonyRecordingActivity.this.showSonyOverlay();
          }
        }
        else
        {
          return;
        }
        if ((bool) && (!localRecordingFragment.isEditingDirty()))
        {
          localRecordingFragment.discardEditing();
          SonyRecordingActivity.this.showSonyOverlay();
          return;
        }
        SonyRecordingActivity.this.showUnSavedChangesDialog(0, localRecordingFragment);
      }
    });
    this.mSonyModeSelectorButton.setOnTouchListener(new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        SonyRecordingActivity.this.mSonyModeSelectorButton.onTouchEvent(paramAnonymousMotionEvent);
        if (SonyRecordingActivity.this.mSonyModeSelectorButton.isPressed())
          SonyRecordingActivity.this.mSonyModeSelectorButton.setColorFilter(SonyRecordingActivity.this.mSonyFilterColor);
        while (true)
        {
          return true;
          SonyRecordingActivity.this.mSonyModeSelectorButton.clearColorFilter();
        }
      }
    });
    try
    {
      this.mSonyCapturingModeSelector = new CapturingModeSelector(this, localViewGroup);
      if (this.mSonyCapturingModeSelector != null)
      {
        this.mSonyCapturingModeSelector.setOnModeSelectListener(new CapturingModeSelector.OnModeSelectListener()
        {
          public void onModeSelect(String paramAnonymousString)
          {
            if (SonyRecordingActivity.this.mSonyCapturingModeSelector != null)
              SonyRecordingActivity.this.mSonyCapturingModeSelector.close();
            SonyRecordingActivity.this.finish();
          }
        });
        this.mSonyCapturingModeSelector.setOnModeFinishListener(new CapturingModeSelector.OnModeFinishListener()
        {
          public void onModeFinish()
          {
            if (SonyRecordingActivity.this.mSonyCapturingModeSelector != null)
            {
              SonyRecordingActivity.this.mSonyCapturingModeSelector.close();
              SonyRecordingActivity.this.mSonyModeSelectorButton.setVisibility(0);
            }
          }
        });
        this.mSonyModeSelectorButton.setVisibility(0);
        return;
      }
    }
    catch (NoClassDefFoundError localNoClassDefFoundError)
    {
      while (true)
        Crashlytics.logException(new VineException("Unable to create Sony Capture Mode selector."));
      this.mSonyModeSelectorButton.setVisibility(8);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SonyRecordingActivity
 * JD-Core Version:    0.6.2
 */