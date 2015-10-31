package co.vine.android;

import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.support.v4.widget.CursorAdapter;
import android.text.Editable;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import co.vine.android.api.VineEntity;
import co.vine.android.client.AppController;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widget.SpanClickListener;
import co.vine.android.widget.StyledClickableSpan;
import co.vine.android.widget.Typefaces;
import co.vine.android.widget.TypefacesSpan;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class CommentsAdapter extends CursorAdapter
{
  private static final int SPAN_FLAGS = 33;
  private AppController mAppController;
  private TypefacesSpan mBoldSpan;
  private HashMap<String, Editable> mCommentSbs = new HashMap();
  private HashMap<Long, Integer> mIdToPositionMap;
  final SpanClickListener mListener;
  final ArrayList<WeakReference<CommentViewHolder>> mViewHolders = new ArrayList();
  private int mVineGreen;

  public CommentsAdapter(Context paramContext, AppController paramAppController, SpanClickListener paramSpanClickListener)
  {
    super(paramContext, null, 2);
    this.mBoldSpan = new TypefacesSpan(null, Typefaces.get(paramContext).getContentTypeface(0, 3));
    this.mAppController = paramAppController;
    this.mListener = paramSpanClickListener;
    this.mVineGreen = paramContext.getResources().getColor(2131296374);
  }

  public boolean atLastPage()
  {
    if ((this.mCursor != null) && (this.mCursor.moveToFirst()))
      return this.mCursor.getInt(11) == 1;
    return false;
  }

  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    Resources localResources = paramContext.getResources();
    CommentViewHolder localCommentViewHolder = (CommentViewHolder)paramView.getTag();
    String str1 = paramCursor.getString(5);
    String str2 = paramCursor.getString(9);
    ArrayList localArrayList = (ArrayList)Util.fromByteArray(paramCursor.getBlob(10));
    if (str1 == null)
    {
      str1 = "";
      CrashUtil.logException(new VineException(), "Username is null for " + paramCursor.getString(0), new Object[0]);
    }
    localCommentViewHolder.content.setMovementMethod(LinkMovementMethod.getInstance());
    localCommentViewHolder.timestamp.setText(Util.getRelativeTimeString(localResources, paramCursor.getLong(6), false));
    localCommentViewHolder.commentId = paramCursor.getString(1);
    localCommentViewHolder.userId = paramCursor.getLong(4);
    Object localObject = (Editable)this.mCommentSbs.get(localCommentViewHolder.commentId);
    if (localObject == null)
    {
      SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder(str1);
      localObject = localSpannableStringBuilder.append(" ").append(str2);
      this.mCommentSbs.put(localCommentViewHolder.commentId, localObject);
      Util.safeSetSpan((Spannable)localObject, this.mBoldSpan, 0, str1.length(), 33);
      StyledClickableSpan localStyledClickableSpan1 = new StyledClickableSpan(1, Long.valueOf(localCommentViewHolder.userId), this.mListener);
      localStyledClickableSpan1.setColor(this.mVineGreen);
      Util.safeSetSpan((Spannable)localObject, localStyledClickableSpan1, 0, str1.length(), 33);
      if (localArrayList == null);
    }
    String str3;
    while (true)
    {
      VineEntity localVineEntity;
      try
      {
        Util.adjustEntities(localArrayList, (Editable)localObject, 1 + str1.length(), false);
        Iterator localIterator = localArrayList.iterator();
        if (localIterator.hasNext())
        {
          localVineEntity = (VineEntity)localIterator.next();
          if (!localVineEntity.isUserType())
            break label444;
          StyledClickableSpan localStyledClickableSpan2 = new StyledClickableSpan(1, Long.valueOf(localVineEntity.id), this.mListener);
          localStyledClickableSpan2.setColor(this.mVineGreen);
          Util.safeSetSpan((Spannable)localObject, localStyledClickableSpan2, localVineEntity.start, localVineEntity.end, 33);
          continue;
        }
      }
      catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
      {
        CrashUtil.logException(localIndexOutOfBoundsException);
      }
      localCommentViewHolder.content.setText((CharSequence)localObject);
      str3 = paramCursor.getString(3);
      if (!Util.isDefaultAvatarUrl(str3))
        break;
      Util.safeSetDefaultAvatar(localCommentViewHolder.profileImage);
      localCommentViewHolder.profileImage.setImageResource(2130837601);
      return;
      label444: if (localVineEntity.isTagType())
      {
        StyledClickableSpan localStyledClickableSpan3 = new StyledClickableSpan(3, localVineEntity.title, this.mListener);
        localStyledClickableSpan3.setColor(this.mVineGreen);
        Util.safeSetSpan((Spannable)localObject, localStyledClickableSpan3, localVineEntity.start, localVineEntity.end, 33);
      }
    }
    ImageKey localImageKey = new ImageKey(str3);
    localCommentViewHolder.imageKey = localImageKey;
    Bitmap localBitmap = this.mAppController.getPhotoBitmap(localImageKey);
    ImageView localImageView = localCommentViewHolder.profileImage;
    RecyclableBitmapDrawable localRecyclableBitmapDrawable = new RecyclableBitmapDrawable(this.mContext.getResources(), localBitmap);
    localImageView.setImageDrawable(localRecyclableBitmapDrawable);
  }

  public long getItemId(int paramInt)
  {
    if ((this.mCursor != null) && (this.mCursor.moveToPosition(paramInt)))
      return this.mCursor.getLong(1);
    return -1L;
  }

  public int getPositionForId(long paramLong)
  {
    if ((this.mIdToPositionMap != null) && (this.mIdToPositionMap.get(Long.valueOf(paramLong)) != null))
      return ((Integer)this.mIdToPositionMap.get(Long.valueOf(paramLong))).intValue();
    return -1;
  }

  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    RelativeLayout localRelativeLayout = (RelativeLayout)LayoutInflater.from(paramContext).inflate(2130903072, paramViewGroup, false);
    CommentViewHolder localCommentViewHolder = new CommentViewHolder();
    localCommentViewHolder.profileImage = ((ImageView)localRelativeLayout.findViewById(2131361883));
    localCommentViewHolder.content = ((TextView)localRelativeLayout.findViewById(2131361884));
    localCommentViewHolder.content.setMovementMethod(LinkMovementMethod.getInstance());
    localCommentViewHolder.timestamp = ((TextView)localRelativeLayout.findViewById(2131361885));
    localRelativeLayout.setTag(localCommentViewHolder);
    this.mViewHolders.add(new WeakReference(localCommentViewHolder));
    return localRelativeLayout;
  }

  public Cursor swapCursor(Cursor paramCursor)
  {
    Cursor localCursor = super.swapCursor(paramCursor);
    this.mIdToPositionMap = new HashMap();
    if ((paramCursor != null) && (paramCursor.getCount() != 0))
    {
      paramCursor.moveToPosition(-1);
      while (paramCursor.moveToNext())
        this.mIdToPositionMap.put(Long.valueOf(paramCursor.getLong(1)), Integer.valueOf(paramCursor.getPosition()));
    }
    return localCursor;
  }

  public void updateProfileImages(HashMap<ImageKey, UrlImage> paramHashMap)
  {
    ArrayList localArrayList = new ArrayList();
    int i = -1 + this.mViewHolders.size();
    if (i >= 0)
    {
      WeakReference localWeakReference2 = (WeakReference)this.mViewHolders.get(i);
      CommentViewHolder localCommentViewHolder = (CommentViewHolder)localWeakReference2.get();
      if (localCommentViewHolder == null)
        localArrayList.add(localWeakReference2);
      while (true)
      {
        i--;
        break;
        if (localCommentViewHolder.imageKey != null)
        {
          UrlImage localUrlImage = (UrlImage)paramHashMap.get(localCommentViewHolder.imageKey);
          if (localUrlImage != null)
            localCommentViewHolder.profileImage.setImageDrawable(new RecyclableBitmapDrawable(this.mContext.getResources(), localUrlImage.bitmap));
        }
      }
    }
    Iterator localIterator = localArrayList.iterator();
    while (localIterator.hasNext())
    {
      WeakReference localWeakReference1 = (WeakReference)localIterator.next();
      this.mViewHolders.remove(localWeakReference1);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.CommentsAdapter
 * JD-Core Version:    0.6.2
 */