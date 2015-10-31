package co.vine.android;

import android.app.ProgressDialog;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.view.ActionMode;
import android.support.v7.view.ActionMode.Callback;
import android.text.Editable;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.EditText;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import co.vine.android.api.VineTag;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.provider.Vine.Comments;
import co.vine.android.provider.VineDatabaseSQL.CommentsQuery;
import co.vine.android.provider.VineSuggestionsProvider;
import co.vine.android.service.PendingAction;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widget.ConversationList;
import co.vine.android.widget.ConversationList.GetMoreListener;
import co.vine.android.widget.PopupEditText;
import co.vine.android.widget.PopupEditText.PopupEditTextListener;
import co.vine.android.widget.SpanClickListener;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

public class CommentsFragment extends BaseListFragment
  implements SpanClickListener, View.OnClickListener, AdapterView.OnItemLongClickListener, AdapterView.OnItemClickListener, TextView.OnEditorActionListener, Filterable, PopupEditText.PopupEditTextListener, ConversationList.GetMoreListener
{
  public static final String ARG_HIDE_KEYBOARD = "hide_keyboard";
  public static final String ARG_POST_AUTHOR_ID = "post_author_id";
  public static final String ARG_POST_ID = "post_id";
  public static final int DEFAULT_PAGE_SIZE = 20;
  private static final String EVENT_SOURCE_TITLE = "Comments List";
  private static final int MAX_CHARS = 140;
  private static final String STATE_FETCHED = "fetched";
  private static ActionMode mActionMode;
  private static String mSelectedCommentId;
  private final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat();
  private final ActionMode.Callback mActionModeCallback = new ActionMode.Callback()
  {
    public boolean onActionItemClicked(ActionMode paramAnonymousActionMode, MenuItem paramAnonymousMenuItem)
    {
      CommentsFragment.this.addRequest(CommentsFragment.this.mAppController.deleteComment(CommentsFragment.this.mPostId, CommentsFragment.mSelectedCommentId));
      paramAnonymousActionMode.finish();
      return true;
    }

    public boolean onCreateActionMode(ActionMode paramAnonymousActionMode, Menu paramAnonymousMenu)
    {
      paramAnonymousActionMode.getMenuInflater().inflate(2131755008, paramAnonymousMenu);
      return true;
    }

    public void onDestroyActionMode(ActionMode paramAnonymousActionMode)
    {
      if (CommentsFragment.this.mSelectedView != null)
        CommentsFragment.this.mSelectedView.setSelected(false);
      CommentsFragment.access$302(null);
    }

    public boolean onPrepareActionMode(ActionMode paramAnonymousActionMode, Menu paramAnonymousMenu)
    {
      return false;
    }
  };
  private PopupEditText mEdit;
  private boolean mFetched;
  private Filter mFilter;
  private long mLastTopItemId = -1L;
  private int mLastTopItemPixelOffset = 0;
  private long mPostAuthorId;
  private long mPostId;
  private View mSelectedView;
  private TagsAutoCompleteAdapter mTagsAdapter;
  private ComposeTokenizer mTokenizer;
  private CursorAdapter mTypeaheadAdapter;
  private UsersAutoCompleteAdapter mUsersAdapter;

  private int editTextLength()
  {
    return this.mEdit.getText().toString().trim().length();
  }

  private void fetchContent(int paramInt)
  {
    if (hasPendingRequest())
      return;
    this.mFetched = true;
    switch (paramInt)
    {
    case 2:
    default:
      return;
    case 1:
      showProgress(1);
      addRequest(this.mAppController.fetchComments(this.mPostId, 3, 20));
      return;
    case 3:
    }
    showProgress(3);
    addRequest(this.mAppController.fetchComments(this.mPostId, 1, 20));
  }

  private void insertText(String paramString)
  {
    if (this.mEdit != null)
    {
      int i = this.mEdit.getSelectionStart();
      int j = this.mEdit.getSelectionEnd();
      if ((this.mEdit.getText() != null) && (i >= 0) && (j <= this.mEdit.length()))
        this.mEdit.getText().replace(i, j, paramString);
    }
  }

  private void saveTopItemInfo()
  {
    if (this.mCursorAdapter.getCount() == 0);
    View localView;
    do
    {
      return;
      this.mLastTopItemId = this.mCursorAdapter.getItemId(this.mListView.getFirstVisiblePosition());
      localView = this.mListView.getChildAt(this.mListView.getFirstVisiblePosition() + this.mListView.getHeaderViewsCount());
    }
    while (localView == null);
    this.mLastTopItemPixelOffset = localView.getTop();
  }

  private void sendComment()
  {
    if (editTextLength() > 140)
    {
      Util.showTopToast(getActivity(), 2131624029);
      return;
    }
    postComment(this.mEdit);
    Util.setSoftInputVisibility(getActivity(), this.mEdit, false);
    this.mEdit.clearFocus();
  }

  private boolean validate(EditText paramEditText)
  {
    return (paramEditText != null) && (paramEditText.length() > 0);
  }

  public Filter getFilter()
  {
    if (this.mFilter == null)
      this.mFilter = new ComposeFilter(this, this.mAppController.getActiveId());
    return this.mFilter;
  }

  public void getMore()
  {
    fetchContent(1);
  }

  public CursorAdapter getPopupAdapter()
  {
    return this.mTypeaheadAdapter;
  }

  public void hideProgress(int paramInt)
  {
    super.hideProgress(paramInt);
    if (paramInt == 1)
      ((ConversationList)this.mListView).hideProgress();
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (!getArguments().getBoolean("hide_keyboard", false))
    {
      this.mEdit.requestFocus();
      Util.setSoftInputVisibility(getActivity(), this.mEdit, true);
    }
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      CommentViewHolder localCommentViewHolder = (CommentViewHolder)paramView.getTag();
      ProfileActivity.start(getActivity(), localCommentViewHolder.userId, "Comments List");
      return;
    case 2131361891:
    }
    sendComment();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.DATE_FORMAT.applyPattern(getResources().getString(2131624073));
    if ((paramBundle != null) && (paramBundle.containsKey("fetched")))
      this.mFetched = paramBundle.getBoolean("fetched");
    this.mAppSessionListener = new CommentsAppSessionListener();
    this.mUsersAdapter = new UsersAutoCompleteAdapter(getActivity(), this.mAppController);
    this.mTagsAdapter = new TagsAutoCompleteAdapter(getActivity(), this.mAppController);
    this.mTypeaheadAdapter = this.mTagsAdapter;
    setHasOptionsMenu(true);
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    FragmentActivity localFragmentActivity = getActivity();
    Uri localUri = Vine.Comments.CONTENT_URI;
    String[] arrayOfString1 = VineDatabaseSQL.CommentsQuery.PROJECTION;
    String[] arrayOfString2 = new String[1];
    arrayOfString2[0] = String.valueOf(this.mPostId);
    return new CursorLoader(localFragmentActivity, localUri, arrayOfString1, "post_id=?", arrayOfString2, null);
  }

  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenuInflater.inflate(2131755009, paramMenu);
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return createView(paramLayoutInflater, 2130903073, paramViewGroup);
  }

  public void onDestroy()
  {
    super.onDestroy();
    VineSuggestionsProvider.clearRealtimeUserSuggestions();
    VineSuggestionsProvider.clearRealtimeTagSuggestions();
  }

  public boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    switch (paramTextView.getId())
    {
    default:
      return false;
    case 2131361892:
    }
    if (paramInt == 4)
      sendComment();
    return true;
  }

  public void onFiltering(CharSequence paramCharSequence)
  {
    int i = 1;
    String str1;
    String str3;
    String str2;
    if (!TextUtils.isEmpty(paramCharSequence))
    {
      str1 = paramCharSequence.toString();
      if (!str1.startsWith("@"))
        break label120;
      str3 = "mention";
      str2 = str1.substring(i, str1.length());
      int j = this.mAppController.getTypeaheadFetchThreshold(str3);
      if ((!TextUtils.isEmpty(str2)) && (str2.length() >= j))
      {
        if (!"mention".equals(str3))
          break label163;
        if (VineSuggestionsProvider.getRealtimeUserSuggestions(str2) != null)
          break label158;
        label90: if (i != 0)
        {
          if (!"mention".equals(str3))
            break label195;
          addRequest(this.mAppController.fetchUserTypeahead(str2));
        }
      }
    }
    label120: 
    while (!"tag".equals(str3))
    {
      return;
      if (str1.startsWith("#"))
      {
        str3 = "tag";
        str2 = str1.substring(i, str1.length());
        break;
      }
      str2 = null;
      str3 = null;
      break;
      i = 0;
      break label90;
      if ("tag".equals(str3))
      {
        if (VineSuggestionsProvider.getRealtimeTagSuggestions(str2) == null)
          break label90;
        while (true)
          i = 0;
      }
      i = 0;
      break label90;
    }
    label158: label163: label195: addRequest(this.mAppController.fetchTagTypeahead(str2));
  }

  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    CommentViewHolder localCommentViewHolder = (CommentViewHolder)paramView.getTag();
    ProfileActivity.start(getActivity(), localCommentViewHolder.userId, "Comments List");
  }

  public boolean onItemLongClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (mActionMode != null);
    CommentViewHolder localCommentViewHolder;
    long l;
    do
    {
      do
        return false;
      while (!(paramView.getTag() instanceof CommentViewHolder));
      localCommentViewHolder = (CommentViewHolder)paramView.getTag();
      l = this.mAppController.getActiveId();
    }
    while ((l != localCommentViewHolder.userId) && (l != this.mPostAuthorId));
    this.mSelectedView = paramView;
    this.mSelectedView.setSelected(true);
    mSelectedCommentId = ((CommentViewHolder)paramView.getTag()).commentId;
    mActionMode = ((ActionBarActivity)getActivity()).startSupportActionMode(this.mActionModeCallback);
    return true;
  }

  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    super.onListItemClick(paramListView, paramView, paramInt, paramLong);
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    saveTopItemInfo();
    super.onLoadFinished(paramLoader, paramCursor);
    if (!this.mFetched)
      fetchContent(3);
    while (true)
    {
      if (((CommentsAdapter)this.mCursorAdapter).atLastPage())
        ((ConversationList)this.mListView).deactivateRefresh();
      return;
      hideProgress(3);
      if (this.mCursorAdapter.isEmpty())
      {
        showSadface(true, false);
      }
      else
      {
        showSadface(false);
        this.mListView.setSelectionFromTop(((CommentsAdapter)this.mCursorAdapter).getPositionForId(this.mLastTopItemId) + this.mListView.getHeaderViewsCount(), this.mLastTopItemPixelOffset);
      }
    }
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131362187:
      insertText("@");
    case 2131362188:
    }
    while (true)
    {
      return true;
      insertText("#");
    }
  }

  public void onPopupItemSelected(int paramInt1, int paramInt2, CharSequence paramCharSequence, long paramLong)
  {
  }

  public void onPopupShown()
  {
  }

  public void onResume()
  {
    super.onResume();
    if (this.mCursorAdapter.getCursor() == null)
      initLoader();
    while ((!this.mCursorAdapter.isEmpty()) || (this.mFetched))
      return;
    fetchContent(3);
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putBoolean("fetched", this.mFetched);
  }

  public void onSpanClicked(View paramView, int paramInt, Object paramObject)
  {
    switch (paramInt)
    {
    case 2:
    default:
      return;
    case 1:
      ProfileActivity.start(getActivity(), ((Long)paramObject).longValue(), "Comments List");
      return;
    case 3:
    }
    HashtagActivity.start(getActivity(), (String)paramObject);
  }

  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    PopupEditText localPopupEditText = (PopupEditText)paramView.findViewById(2131361892);
    localPopupEditText.setOnEditorActionListener(this);
    localPopupEditText.setAdapter(this.mTypeaheadAdapter);
    this.mTokenizer = new ComposeTokenizer(this);
    localPopupEditText.setTokenizer(this.mTokenizer, this, this.mAppController.getTypeaheadThrottle());
    localPopupEditText.setPopupEditTextListener(this);
    this.mEdit = localPopupEditText;
    Bundle localBundle = getArguments();
    this.mPostId = localBundle.getLong("post_id");
    this.mPostAuthorId = localBundle.getLong("post_author_id");
    paramView.findViewById(2131361891).setOnClickListener(this);
    this.mListView.setOnItemLongClickListener(this);
    this.mListView.setOnItemClickListener(this);
    this.mCursorAdapter = new CommentsAdapter(getActivity(), this.mAppController, this);
    ((ConversationList)this.mListView).setGetMoreListener(this);
    this.mListView.setAdapter(this.mCursorAdapter);
  }

  public void postComment(EditText paramEditText)
  {
    if (validate(paramEditText))
    {
      ProgressDialog localProgressDialog = new ProgressDialog(getActivity(), 2131689512);
      localProgressDialog.setMessage(getString(2131624032));
      localProgressDialog.setProgressStyle(0);
      localProgressDialog.show();
      this.mProgressDialog = localProgressDialog;
      addRequest(this.mAppController.postComment(this.mPostId, this.mAppController.getActiveSession(), paramEditText.getText().toString(), this.mEdit.getEntities()));
      paramEditText.getText().clear();
    }
  }

  public void setPopupAdapter(String paramString)
  {
    if ("users_adapter".equals(paramString))
      this.mTypeaheadAdapter = this.mUsersAdapter;
    while (true)
    {
      this.mEdit.setAdapter(this.mTypeaheadAdapter);
      return;
      if ("tags_adapter".equals(paramString))
        this.mTypeaheadAdapter = this.mTagsAdapter;
    }
  }

  public void showProgress(int paramInt)
  {
    super.showProgress(paramInt);
    if ((paramInt == 1) && (!((CommentsAdapter)this.mCursorAdapter).atLastPage()))
      ((ConversationList)this.mListView).showProgress();
  }

  class CommentsAppSessionListener extends AppSessionListener
  {
    CommentsAppSessionListener()
    {
    }

    public void onCaptchaRequired(String paramString1, String paramString2, PendingAction paramPendingAction)
    {
      if (CommentsFragment.this.removeRequest(paramString1) != null)
      {
        CommentsFragment.this.mPendingCaptchaRequest = new PendingCaptchaRequest(paramString1, paramPendingAction.actionCode, paramPendingAction.bundle);
        CommentsFragment.this.showCaptcha(paramString1, paramString2);
      }
    }

    public void onGetCommentsComplete(String paramString1, int paramInt1, String paramString2, long paramLong, int paramInt2)
    {
      if ((CommentsFragment.this.removeRequest(paramString1) != null) && (paramLong == CommentsFragment.this.mPostId))
      {
        CommentsFragment.this.hideProgress(3);
        if (!CommentsFragment.this.mCursorAdapter.isEmpty())
          break label87;
        CommentsFragment.this.showSadface(true, false);
        ((ConversationList)CommentsFragment.this.mListView).deactivateRefresh();
      }
      while (true)
      {
        if (paramInt2 == 4)
          ((ConversationList)CommentsFragment.this.mListView).reactivateRefresh();
        return;
        label87: CommentsFragment.this.showSadface(false);
      }
    }

    public void onGetTagTypeAheadComplete(String paramString1, int paramInt, String paramString2, String paramString3, ArrayList<VineTag> paramArrayList)
    {
      if ((CommentsFragment.this.removeRequest(paramString1) != null) && (paramInt == 200) && (!paramArrayList.isEmpty()))
      {
        VineSuggestionsProvider.addRealtimeTagSuggestions(paramString3, paramArrayList);
        CommentsFragment.this.mEdit.performFilter(false);
      }
    }

    public void onGetUserTypeAheadComplete(String paramString1, int paramInt, String paramString2, String paramString3, ArrayList<VineUser> paramArrayList)
    {
      if ((CommentsFragment.this.removeRequest(paramString1) != null) && (paramInt == 200) && (!paramArrayList.isEmpty()))
      {
        VineSuggestionsProvider.addRealtimeUserSuggestions(paramString3, paramArrayList);
        CommentsFragment.this.mEdit.performFilter(false);
      }
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      super.onPhotoImageLoaded(paramHashMap);
      ((CommentsAdapter)CommentsFragment.this.mCursorAdapter).updateProfileImages(paramHashMap);
      CommentsFragment.this.mUsersAdapter.setUserImages(paramHashMap);
    }

    public void onPostCommentComplete(String paramString1, int paramInt, String paramString2, long paramLong, String paramString3)
    {
      CommentsFragment.this.dismissDialog();
      if ((CommentsFragment.this.removeRequest(paramString1) != null) && (paramLong == CommentsFragment.this.mPostId))
      {
        final ListView localListView = CommentsFragment.this.mListView;
        localListView.post(new Runnable()
        {
          public void run()
          {
            localListView.setSelection(-1 + localListView.getCount());
          }
        });
        if (paramInt != 200)
          CommentsFragment.this.mEdit.setText(paramString3);
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.CommentsFragment
 * JD-Core Version:    0.6.2
 */