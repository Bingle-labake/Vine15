package co.vine.android;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.view.Window;
import android.view.WindowManager;
import android.widget.RelativeLayout.LayoutParams;
import co.vine.android.client.AppController;
import co.vine.android.player.OnSingleVideoClickedListener;
import co.vine.android.player.SdkVideoView;
import co.vine.android.player.StaticSizeVideoView;
import co.vine.android.recorder.RecordConfigUtils;
import co.vine.android.recorder.RecordingFile;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.UploadManager;
import co.vine.android.util.Util;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;
import java.io.File;

public class RecordingPreviewFragment extends BaseFragment
  implements View.OnClickListener, PromptDialogSupportFragment.OnDialogDoneListener
{
  public static final String AG_THUMBNAIL_PATH = "pic_path";
  public static final String AG_UPLOAD_PATH = "upload_path";
  public static final String AG_VIDEO_PATH = "video_path";
  public static final String ARG_FROM_SONY = "f_s";
  private static final int DIALOG_MUST_LOGIN = 1;
  private static final int REQUEST_CODE_LOGIN_TO_POST = 12345;
  public static final int REQUEST_POST = 1990;
  private static final long TRANSITION_DURATION = 250L;
  private RecordingFile mFinalFile;
  private boolean mIsFromSony;
  private View mNextButton;
  private View mPreviewButtons;
  private String mThumbnailPath;
  private String mUploadPath;
  private String mVideoPath;
  private SdkVideoView mVideoPlayer;

  private void animateInViews()
  {
    this.mNextButton.setAlpha(0.0F);
    this.mNextButton.setVisibility(0);
    this.mNextButton.animate().setDuration(250L).alpha(1.0F).start();
    this.mPreviewButtons.setAlpha(0.0F);
    this.mPreviewButtons.setVisibility(0);
    this.mPreviewButtons.animate().setDuration(250L).alpha(1.0F).start();
  }

  private void animateOutViews()
  {
    this.mNextButton.animate().setDuration(250L).alpha(0.0F).start();
    this.mPreviewButtons.animate().setDuration(250L).alpha(0.0F).start();
  }

  public static RecordingPreviewFragment newInstance(String paramString1, String paramString2, String paramString3, boolean paramBoolean)
  {
    RecordingPreviewFragment localRecordingPreviewFragment = new RecordingPreviewFragment();
    Bundle localBundle = new Bundle();
    localBundle.putString("video_path", paramString1);
    localBundle.putString("pic_path", paramString3);
    localBundle.putString("upload_path", paramString2);
    localBundle.putBoolean("f_s", paramBoolean);
    localRecordingPreviewFragment.setArguments(localBundle);
    return localRecordingPreviewFragment;
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    Bundle localBundle = getArguments();
    this.mVideoPath = localBundle.getString("video_path");
    this.mThumbnailPath = localBundle.getString("pic_path");
    this.mUploadPath = localBundle.getString("upload_path");
    this.mIsFromSony = localBundle.getBoolean("f_s", false);
    RecordConfigUtils.deletePreProcess(getActivity().getFilesDir());
    this.mVideoPlayer.setVideoPath(this.mVideoPath);
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = this.mVideoPath;
    CrashUtil.log("Preview: {}", arrayOfObject);
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    default:
      super.onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
    case 12345:
      switch (paramInt2)
      {
      default:
        return;
      case -1:
      }
      uploadAndToPost();
      return;
    case 1990:
    }
    switch (paramInt2)
    {
    default:
      return;
    case 32:
    }
    getActivity().finish();
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return;
    case 2131362041:
      if (!AppController.getInstance(getActivity()).isLoggedIn())
      {
        PromptDialogSupportFragment localPromptDialogSupportFragment = PromptDialogSupportFragment.newInstance(1);
        localPromptDialogSupportFragment.setMessage(2131624338);
        localPromptDialogSupportFragment.setPositiveButton(17039370);
        localPromptDialogSupportFragment.setNeutralButton(17039360);
        localPromptDialogSupportFragment.setListener(this);
        localPromptDialogSupportFragment.setTargetFragment(this, 0);
        localPromptDialogSupportFragment.show(getFragmentManager());
        return;
      }
      toPost();
      FlurryUtils.trackPreviewAction("post");
      return;
    case 2131362039:
      animateOutViews();
      previewToRecord((AbstractRecordingActivity)getActivity(), false);
      FlurryUtils.trackPreviewAction("capture");
      return;
    case 2131362040:
    }
    animateOutViews();
    previewToRecord((AbstractRecordingActivity)getActivity(), true);
    FlurryUtils.trackPreviewAction("edit");
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView1 = paramLayoutInflater.inflate(2130903117, paramViewGroup, false);
    Point localPoint = Util.getDisplaySize(getActivity().getWindowManager().getDefaultDisplay());
    this.mPreviewButtons = localView1.findViewById(2131362038);
    View localView2 = this.mPreviewButtons;
    View.OnTouchListener local1 = new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        return true;
      }
    };
    localView2.setOnTouchListener(local1);
    this.mNextButton = localView1.findViewById(2131362041);
    this.mNextButton.setOnClickListener(this);
    localView1.findViewById(2131362039).setOnClickListener(this);
    localView1.findViewById(2131362040).setOnClickListener(this);
    this.mVideoPlayer = ((SdkVideoView)localView1.findViewById(2131362036));
    this.mVideoPlayer.setVisibility(0);
    this.mVideoPlayer.setAutoPlayOnPrepared(true);
    this.mVideoPlayer.setKeepScreenOn(true);
    View localView3 = localView1.findViewById(2131361921);
    int i = getResources().getDimensionPixelSize(2131427350);
    ((StaticSizeVideoView)this.mVideoPlayer).setSize(localPoint.x, localPoint.x);
    this.mVideoPlayer.setLooping(true);
    localView3.setOnClickListener(new OnSingleVideoClickedListener(this.mVideoPlayer));
    Rect localRect = new Rect();
    Window localWindow = getActivity().getWindow();
    localWindow.getDecorView().getWindowVisibleDisplayFrame(localRect);
    localWindow.setSoftInputMode(16);
    View localView4 = localView1.findViewById(2131362041);
    RelativeLayout.LayoutParams localLayoutParams1 = (RelativeLayout.LayoutParams)localView4.getLayoutParams();
    int j = getResources().getDimensionPixelSize(2131427391);
    localLayoutParams1.setMargins(0, 0, 0, (localRect.bottom - localRect.top - localPoint.x - i - j) / 2);
    localView4.setLayoutParams(localLayoutParams1);
    View localView5 = localView1.findViewById(2131362037);
    int k = localRect.bottom - localRect.top - i - localPoint.x;
    RelativeLayout.LayoutParams localLayoutParams2 = (RelativeLayout.LayoutParams)localView5.getLayoutParams();
    localLayoutParams2.height = k;
    localView5.setLayoutParams(localLayoutParams2);
    View.OnTouchListener local2 = new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        return true;
      }
    };
    localView5.setOnTouchListener(local2);
    animateInViews();
    return localView1;
  }

  public void onDestroy()
  {
    super.onDestroy();
    this.mFinalFile = null;
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
      return;
    case 1:
    }
    switch (paramInt2)
    {
    default:
      return;
    case -1:
    }
    FragmentActivity localFragmentActivity = getActivity();
    Intent localIntent = new Intent(localFragmentActivity, SonyStartActivity.class);
    localIntent.putExtra("login_request", true);
    ((AbstractRecordingActivity)localFragmentActivity).setWaitingForLogin(true);
    localFragmentActivity.startActivityForResult(localIntent, 12345);
  }

  public void onPause()
  {
    super.onPause();
    if (this.mVideoPlayer.canPause())
      this.mVideoPlayer.pause();
  }

  public void onResume()
  {
    super.onResume();
    animateInViews();
    if (this.mVideoPlayer.mCurrentState == 4)
      this.mVideoPlayer.start();
  }

  public void previewToRecord(AbstractRecordingActivity paramAbstractRecordingActivity, boolean paramBoolean)
  {
    if (paramAbstractRecordingActivity != null)
      paramAbstractRecordingActivity.toRecord(false, paramBoolean, this.mFinalFile);
  }

  public void setFinalFile(RecordingFile paramRecordingFile)
  {
    this.mFinalFile = paramRecordingFile;
  }

  public void toPost()
  {
    Intent localIntent = PostActivity.getIntent(getActivity(), this.mUploadPath, this.mThumbnailPath, this.mVideoPath, false, this.mIsFromSony);
    getActivity().startActivityForResult(localIntent, 1990);
  }

  public void uploadAndToPost()
  {
    try
    {
      this.mUploadPath = UploadManager.addToUploadQueue(getActivity(), this.mFinalFile, this.mThumbnailPath, this.mFinalFile.folder.getName());
      toPost();
      return;
    }
    catch (Exception localException)
    {
      CrashUtil.logException(localException);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.RecordingPreviewFragment
 * JD-Core Version:    0.6.2
 */