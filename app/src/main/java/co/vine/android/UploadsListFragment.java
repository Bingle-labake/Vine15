package co.vine.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.LoaderManager;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import co.vine.android.api.VineUpload;
import co.vine.android.provider.VineUploads.Uploads;
import co.vine.android.provider.VineUploadsDatabaseSQL.UploadsQuery;
import co.vine.android.recorder.RecordSessionManager;
import co.vine.android.service.VineUploadService;
import co.vine.android.util.Util;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;
import com.edisonwang.android.slog.SLog;
import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;

public class UploadsListFragment extends BaseListFragment
  implements View.OnClickListener, AdapterView.OnItemLongClickListener, PromptDialogSupportFragment.OnDialogDoneListener
{
  public static final String ARG_TAKE_FOCUS = "take_focus";
  private static final int DIALOG_CONFIRM_DELETE = 1;
  private String mPath;
  private String mReference;
  private WeakReference<ImageView> mRetryView;
  private RecordSessionManager mRsm;
  private WeakReference<ProgressBar> mSpinnerView;
  private WeakReference<TextView> mStatusMessage;
  private BroadcastReceiver mUploadCompleteReceiver;

  private void handleRetryPost(Cursor paramCursor, boolean paramBoolean)
  {
    this.mPath = paramCursor.getString(1);
    int i = paramCursor.getInt(3);
    VineUpload localVineUpload = VineUpload.fromCursor(this.mPath, paramCursor);
    if (i == 0)
    {
      Intent localIntent4 = VineUploadService.getUploadIntent(getActivity(), localVineUpload);
      getActivity().startService(localIntent4);
      return;
    }
    if (TextUtils.isEmpty(localVineUpload.postInfo))
    {
      Intent localIntent3 = PostActivity.getIntent(getActivity(), localVineUpload.path, localVineUpload.thumbnailPath, null, true, false);
      getActivity().startActivity(localIntent3);
      return;
    }
    if ((TextUtils.isEmpty(localVineUpload.captchaUrl)) || (paramBoolean))
    {
      Intent localIntent1 = VineUploadService.getPostIntent(getActivity(), localVineUpload, true);
      getActivity().startService(localIntent1);
      return;
    }
    Intent localIntent2 = CaptchaActivity.getIntent(getActivity(), localVineUpload.captchaUrl, this.mPath);
    this.mPendingCaptchaRequest = new PendingCaptchaRequest(this.mPath, 0, null);
    getActivity().startActivityForResult(localIntent2, 11);
  }

  protected void handlePendingCaptchaRequest()
  {
    if (this.mPendingCaptchaRequest != null)
    {
      if (this.mPendingCaptchaRequest.state != 3)
        break label134;
      if ((this.mListView != null) && (this.mListView.getChildCount() > this.mListView.getHeaderViewsCount()))
      {
        View localView = this.mListView.getChildAt(this.mListView.getHeaderViewsCount());
        if (localView != null)
        {
          ProgressBar localProgressBar = (ProgressBar)localView.findViewById(2131361821);
          if (localProgressBar != null)
          {
            localProgressBar.setVisibility(8);
            this.mSpinnerView = new WeakReference(localProgressBar);
          }
          ImageView localImageView = (ImageView)localView.findViewById(2131362175);
          if (localImageView != null)
          {
            localImageView.setVisibility(0);
            this.mRetryView = new WeakReference(localImageView);
          }
        }
      }
    }
    while (true)
    {
      this.mPendingCaptchaRequest = null;
      return;
      label134: if (this.mPendingCaptchaRequest.state == 2)
      {
        Cursor localCursor = this.mCursorAdapter.getCursor();
        if (localCursor.moveToFirst())
          handleRetryPost(localCursor, true);
      }
    }
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    FragmentActivity localFragmentActivity = getActivity();
    if (this.mCursorAdapter == null)
      this.mCursorAdapter = new UploadsAdapter(localFragmentActivity, this.mAppController, 0);
    try
    {
      this.mRsm = RecordSessionManager.getInstance(localFragmentActivity);
      View localView = LayoutInflater.from(localFragmentActivity).inflate(2130903147, this.mListView, false);
      ((TextView)localView.findViewById(2131361844)).setText(2131624399);
      ListView localListView = this.mListView;
      localListView.addHeaderView(localView, null, false);
      localListView.setBackgroundColor(getResources().getColor(2131296371));
      localListView.setDividerHeight(0);
      localListView.setOnItemLongClickListener(this);
      localListView.setAdapter(this.mCursorAdapter);
      return;
    }
    catch (IOException localIOException)
    {
      while (true)
      {
        Util.showCenteredToast(localFragmentActivity, 2131624369);
        localFragmentActivity.finish();
      }
    }
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt1)
    {
    default:
    case 11:
    }
    String str;
    do
    {
      do
        return;
      while ((this.mPendingCaptchaRequest == null) || (paramIntent == null));
      str = paramIntent.getStringExtra("rid");
      if ((paramInt2 == -1) && (str.equals(this.mPendingCaptchaRequest.reqId)))
      {
        this.mPendingCaptchaRequest.state = 2;
        getLoaderManager().restartLoader(0, null, this);
        return;
      }
    }
    while ((paramInt2 != 2) || (!str.equals(this.mPendingCaptchaRequest.reqId)));
    this.mPendingCaptchaRequest.state = 3;
  }

  public void onClick(View paramView)
  {
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mUploadCompleteReceiver = new BroadcastReceiver()
    {
      public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
      {
        if ((UploadsListFragment.this.mRetryView != null) && (UploadsListFragment.this.mRetryView.get() != null))
          ((ImageView)UploadsListFragment.this.mRetryView.get()).setVisibility(0);
        if ((UploadsListFragment.this.mSpinnerView != null) && (UploadsListFragment.this.mSpinnerView.get() != null))
          ((ProgressBar)UploadsListFragment.this.mSpinnerView.get()).setVisibility(8);
        int i = paramAnonymousIntent.getIntExtra("upload_status", 1);
        SLog.d("UploadsListFragment.onReceive status={}", Integer.valueOf(i));
        TextView localTextView;
        if ((UploadsListFragment.this.mStatusMessage != null) && (UploadsListFragment.this.mStatusMessage.get() != null))
          localTextView = (TextView)UploadsListFragment.this.mStatusMessage.get();
        switch (i)
        {
        default:
          return;
        case 0:
          localTextView.setText(2131624403);
          return;
        case 2:
          localTextView.setText(2131624402);
          return;
        case 1:
          localTextView.setText(2131624401);
          return;
        case 3:
        }
        String str1 = paramAnonymousIntent.getStringExtra("path");
        String str2 = paramAnonymousIntent.getStringExtra("thumbnail");
        UploadsListFragment.this.startActivity(PostActivity.getIntent(UploadsListFragment.this.getActivity(), str1, str2, null, true, false));
      }
    };
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    String[] arrayOfString = new String[1];
    arrayOfString[0] = String.valueOf(2);
    return new CursorLoader(getActivity(), VineUploads.Uploads.CONTENT_URI, VineUploadsDatabaseSQL.UploadsQuery.PROJECTION, "status=?", arrayOfString, "_id ASC");
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
    case -2:
    default:
      return;
    case -1:
    }
    Context localContext = getActivity().getApplicationContext();
    try
    {
      File localFile = this.mRsm.getFolderFromName(this.mReference);
      if ((localFile != null) && (localFile.exists()))
        RecordSessionManager.deleteSession(localFile, "Upload List Deleted.");
      getActivity().startService(VineUploadService.getDiscardIntent(localContext, this.mPath));
      return;
    }
    catch (IOException localIOException)
    {
      while (true)
        SLog.e("Failed to delete session.");
    }
  }

  public boolean onItemLongClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    Cursor localCursor = this.mCursorAdapter.getCursor();
    if (localCursor.moveToPosition(paramInt - ((ListView)paramAdapterView).getHeaderViewsCount()))
    {
      this.mPath = localCursor.getString(1);
      this.mReference = localCursor.getString(9);
      PromptDialogSupportFragment localPromptDialogSupportFragment = PromptDialogSupportFragment.newInstance(1);
      localPromptDialogSupportFragment.setListener(this);
      localPromptDialogSupportFragment.setMessage(2131624080);
      localPromptDialogSupportFragment.setPositiveButton(2131624428);
      localPromptDialogSupportFragment.setNegativeButton(2131624018);
      localPromptDialogSupportFragment.show(getChildFragmentManager());
      return true;
    }
    return false;
  }

  public void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    Cursor localCursor = this.mCursorAdapter.getCursor();
    if ((paramInt - paramListView.getHeaderViewsCount() == 0) && (localCursor.moveToFirst()))
    {
      ImageView localImageView = (ImageView)paramView.findViewById(2131362175);
      localImageView.setVisibility(8);
      this.mRetryView = new WeakReference(localImageView);
      ProgressBar localProgressBar = (ProgressBar)paramView.findViewById(2131361821);
      localProgressBar.setVisibility(0);
      this.mSpinnerView = new WeakReference(localProgressBar);
      TextView localTextView = (TextView)paramView.findViewById(2131362174);
      localTextView.setText(getString(2131624404).toUpperCase());
      this.mStatusMessage = new WeakReference(localTextView);
      handleRetryPost(localCursor, false);
    }
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    super.onLoadFinished(paramLoader, paramCursor);
    hideProgress(3);
    if (isEmpty())
    {
      showSadface(true, false);
      return;
    }
    showSadface(false);
  }

  public void onPause()
  {
    super.onPause();
    getActivity().unregisterReceiver(this.mUploadCompleteReceiver);
  }

  public void onResume()
  {
    super.onResume();
    if (this.mCursorAdapter.getCursor() == null)
      initLoader();
    IntentFilter localIntentFilter = new IntentFilter("co.vine.android.UPLOAD_RESULT");
    getActivity().registerReceiver(this.mUploadCompleteReceiver, localIntentFilter);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.UploadsListFragment
 * JD-Core Version:    0.6.2
 */