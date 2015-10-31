package co.vine.android;

import android.content.ContentUris;
import android.content.res.Resources;
import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.widget.TextView;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.provider.Vine.PostCommentsLikesView;
import co.vine.android.provider.VineDatabaseSQL.PostCommentsLikesQuery;
import co.vine.android.util.Util;
import co.vine.android.widget.SpanClickListener;
import co.vine.android.widget.StyledClickableSpan;

public class SingleFragmentWrapper
{
  public static final String ARG_LOCKED = "locked";
  public static final String ARG_POST_ID = "post_id";
  public static final String ARG_SHARE_ID = "post_share_id";
  public static final String ARG_TAKE_FOCUS = "take_focus";
  public static final String ARG_USERNAME = "username";
  public static final String ARG_USER_ID = "userId";
  private AppController mAppController;
  private BaseControllerFragment mFragment;
  private boolean mLocked;
  private long mPostId;
  private String mShareId;
  private AppSessionListener mSinglePostListener;
  private long mUserId;
  private String mUsername;

  public String fetchPostContent()
  {
    return this.mAppController.fetchPost(this.mAppController.getActiveSession(), this.mPostId);
  }

  public String fetchPostId()
  {
    return this.mAppController.fetchPostId(this.mAppController.getActiveSession(), this.mShareId);
  }

  public long getPostId()
  {
    return this.mPostId;
  }

  public String getSharedId()
  {
    return this.mShareId;
  }

  public boolean isLocked()
  {
    return this.mLocked;
  }

  public boolean onCreate(BaseControllerFragment paramBaseControllerFragment, AppSessionListener paramAppSessionListener)
  {
    this.mFragment = paramBaseControllerFragment;
    this.mAppController = this.mFragment.getAppController();
    Bundle localBundle = paramBaseControllerFragment.getArguments();
    this.mLocked = localBundle.getBoolean("locked", false);
    if (!this.mLocked)
    {
      this.mPostId = localBundle.getLong("post_id");
      this.mShareId = localBundle.getString("post_share_id");
      boolean bool1 = localBundle.getBoolean("take_focus", false);
      this.mSinglePostListener = paramAppSessionListener;
      boolean bool2 = false;
      if (bool1)
        bool2 = true;
      return bool2;
    }
    this.mUsername = localBundle.getString("username");
    this.mUserId = localBundle.getLong("userId");
    return false;
  }

  public Loader<Cursor> onCreateLoader()
  {
    if (this.mLocked)
      return null;
    return new CursorLoader(this.mFragment.getActivity(), ContentUris.withAppendedId(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_SINGLE, this.mPostId), VineDatabaseSQL.PostCommentsLikesQuery.PROJECTION, null, null, null);
  }

  public View onCreateLockedView(View paramView, SpanClickListener paramSpanClickListener)
  {
    TextView localTextView = (TextView)paramView.findViewById(2131361979);
    localTextView.setMovementMethod(LinkMovementMethod.getInstance());
    StyledClickableSpan localStyledClickableSpan = new StyledClickableSpan(1, Long.valueOf(this.mUserId), paramSpanClickListener);
    localStyledClickableSpan.setColor(this.mFragment.getResources().getColor(2131296374));
    Object[] arrayOfObject1 = { localStyledClickableSpan };
    BaseControllerFragment localBaseControllerFragment = this.mFragment;
    Object[] arrayOfObject2 = new Object[1];
    arrayOfObject2[0] = this.mUsername;
    localTextView.setText(Util.getSpannedText(arrayOfObject1, localBaseControllerFragment.getString(2131624222, arrayOfObject2), '"'));
    return paramView;
  }

  public void onGetPostIdComplete(long paramLong)
  {
    this.mPostId = paramLong;
  }

  public void onPause()
  {
    if (this.mSinglePostListener != null)
      this.mAppController.removeListener(this.mSinglePostListener);
  }

  public boolean onResume()
  {
    if (isLocked())
      return false;
    if (this.mSinglePostListener != null)
      this.mAppController.addListener(this.mSinglePostListener);
    return true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SingleFragmentWrapper
 * JD-Core Version:    0.6.2
 */