package co.vine.android;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.UploadManager;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;
import com.edisonwang.android.slog.SLog;
import java.io.File;

public class PostActivity extends BaseControllerActionBarActivity
  implements PromptDialogSupportFragment.OnDialogDoneListener
{
  public static final String AG_FROM_SONY = "f_s";
  public static final String AG_IS_RETRY = "is_retry";
  public static final String AG_PREVIEW_PATH = "preview_path";
  public static final String AG_THUMBNAIL_PATH = "pic_path";
  private static final int DIALOG_UNSAVED_CHANGES = 292;
  private static final String POST_TAG = "post";
  private PostFragment mFrag;
  private String mVideoPath;

  public static Intent getIntent(Context paramContext, String paramString1, String paramString2, String paramString3, boolean paramBoolean1, boolean paramBoolean2)
  {
    Intent localIntent = new Intent(paramContext, PostActivity.class);
    if ((paramString1 == null) || (paramString2 == null))
      throw new IllegalStateException("Well, you should give two paths that are not null you know: " + paramString1 + " " + paramString2);
    localIntent.setData(Uri.fromFile(new File(paramString1)));
    localIntent.putExtra("pic_path", paramString2);
    localIntent.putExtra("preview_path", paramString3);
    localIntent.putExtra("is_retry", paramBoolean1);
    localIntent.putExtra("f_s", paramBoolean2);
    return localIntent;
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (this.mFrag == null)
      this.mFrag = ((PostFragment)getSupportFragmentManager().findFragmentByTag("post"));
    if (this.mFrag != null)
    {
      this.mFrag.onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
    }
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onBackPressed()
  {
    FlurryUtils.trackBackFromPostScreen();
    super.onBackPressed();
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    setRequestedOrientation(1);
    if (paramBundle == null)
    {
      setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624346), Boolean.valueOf(true));
      Intent localIntent = getIntent();
      this.mVideoPath = localIntent.getData().getPath();
      PostFragment localPostFragment = new PostFragment();
      Bundle localBundle = PostFragment.prepareArguments(localIntent, this.mVideoPath, localIntent.getStringExtra("pic_path"), localIntent.getStringExtra("preview_path"), localIntent.getBooleanExtra("is_retry", false));
      SLog.d("Post activity started for {}.", this.mVideoPath);
      localPostFragment.setArguments(localBundle);
      this.mFrag = localPostFragment;
      getSupportFragmentManager().beginTransaction().add(2131361953, localPostFragment, "post").commit();
    }
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
      return;
    case 292:
    }
    switch (paramInt2)
    {
    default:
      return;
    case -2:
      paramDialogInterface.dismiss();
      return;
    case -1:
    }
    FlurryUtils.trackAbandonedStage("post");
    UploadManager.removeFromUploadQueue(this, this.mVideoPath);
    finish();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.PostActivity
 * JD-Core Version:    0.6.2
 */