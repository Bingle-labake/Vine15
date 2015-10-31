package co.vine.android;

import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.support.v4.widget.CursorAdapter;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import co.vine.android.api.VineEntity;
import co.vine.android.api.VineNotification;
import co.vine.android.client.AppController;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widget.ActivityViewHolder;
import co.vine.android.widget.SpanClickListener;
import co.vine.android.widget.StyledClickableSpan;
import co.vine.android.widget.Typefaces;
import co.vine.android.widget.TypefacesSpan;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class ActivityAdapter extends CursorAdapter
{
  public static final int NUM_VIEW_TYPES = 4;
  private static final int SPAN_FLAGS = 33;
  public static final int VIEW_TYPE_FOLLOW_REQUEST = 3;
  public static final int VIEW_TYPE_NO_IMAGES = 2;
  public static final int VIEW_TYPE_ONE_IMAGE = 0;
  public static final int VIEW_TYPE_TWO_IMAGES = 1;
  private AppController mAppController;
  private SpanClickListener mListener;
  private View.OnClickListener mViewClickListener;
  private ArrayList<WeakReference<ActivityViewHolder>> mViewHolders;
  private int mVineGreen;

  public ActivityAdapter(Context paramContext, AppController paramAppController, SpanClickListener paramSpanClickListener, View.OnClickListener paramOnClickListener, int paramInt)
  {
    super(paramContext, null, paramInt);
    this.mAppController = paramAppController;
    this.mViewHolders = new ArrayList();
    this.mListener = paramSpanClickListener;
    this.mViewClickListener = paramOnClickListener;
    this.mVineGreen = paramContext.getResources().getColor(2131296374);
  }

  private void setAvatar(ActivityViewHolder paramActivityViewHolder, String paramString)
  {
    if (Util.isDefaultAvatarUrl(paramString))
      Util.safeSetDefaultAvatar(paramActivityViewHolder.userImage);
    while (true)
    {
      paramActivityViewHolder.userImage.setOnClickListener(this.mViewClickListener);
      paramActivityViewHolder.userImage.setTag(Long.valueOf(paramActivityViewHolder.userId));
      return;
      ImageKey localImageKey = new ImageKey(paramString);
      paramActivityViewHolder.userImageKey = localImageKey;
      setImage(paramActivityViewHolder.userImage, this.mAppController.getPhotoBitmap(localImageKey));
    }
  }

  private void setImage(ImageView paramImageView, Bitmap paramBitmap)
  {
    if (paramImageView == null)
      return;
    if (paramBitmap == null)
    {
      paramImageView.setBackgroundColor(this.mContext.getResources().getColor(2131296357));
      paramImageView.setImageBitmap(null);
      return;
    }
    paramImageView.setImageDrawable(new RecyclableBitmapDrawable(this.mContext.getResources(), paramBitmap));
  }

  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    ActivityViewHolder localActivityViewHolder = (ActivityViewHolder)paramView.getTag();
    localActivityViewHolder.userId = paramCursor.getLong(3);
    localActivityViewHolder.postId = paramCursor.getLong(4);
    localActivityViewHolder.byline.setText(Util.getRelativeTimeString(paramContext.getResources(), paramCursor.getLong(7), false));
    localActivityViewHolder.type = paramCursor.getInt(2);
    boolean bool;
    String str1;
    int i;
    label147: int j;
    label163: ImageKey localImageKey;
    label223: label230: SpannableStringBuilder localSpannableStringBuilder;
    TextView localTextView;
    Iterator localIterator;
    if ((VineNotification.isLocked(paramCursor.getInt(11))) && ((localActivityViewHolder.type == 11) || (localActivityViewHolder.type == 10)))
    {
      bool = true;
      localActivityViewHolder.isLocked = bool;
      localActivityViewHolder.username = paramCursor.getString(9);
      str1 = paramCursor.getString(6);
      if (TextUtils.isEmpty(str1))
        break label436;
      i = 1;
      if (TextUtils.isEmpty(paramCursor.getString(5)))
        break label442;
      j = 1;
      if ((i == 0) || (j == 0))
        break label469;
      setAvatar(localActivityViewHolder, str1);
      localImageKey = new ImageKey(paramCursor.getString(5));
      if (!localActivityViewHolder.isLocked)
        break label448;
      if (localActivityViewHolder.targetUserImage != null)
        localActivityViewHolder.targetUserImage.setImageResource(2130837603);
      localActivityViewHolder.targetImageKey = localImageKey;
      ArrayList localArrayList = (ArrayList)Util.fromByteArray(paramCursor.getBlob(10));
      String str2 = paramCursor.getString(8);
      localSpannableStringBuilder = new SpannableStringBuilder(str2);
      if ((localArrayList == null) || (TextUtils.isEmpty(str2)))
        break label661;
      Util.adjustEntities(localArrayList, localSpannableStringBuilder, 0, true);
      localTextView = localActivityViewHolder.contentLine;
      localIterator = localArrayList.iterator();
    }
    while (true)
    {
      if (!localIterator.hasNext())
        break label654;
      VineEntity localVineEntity = (VineEntity)localIterator.next();
      TypefacesSpan localTypefacesSpan = new TypefacesSpan(null, Typefaces.get(paramContext).getContentTypeface(0, 3));
      if ("user".equals(localVineEntity.type))
      {
        StyledClickableSpan localStyledClickableSpan1 = new StyledClickableSpan(1, Long.valueOf(localActivityViewHolder.userId), this.mListener);
        localStyledClickableSpan1.setColor(this.mVineGreen);
        Util.safeSetSpan(localSpannableStringBuilder, localStyledClickableSpan1, localVineEntity.start, localVineEntity.end, 33);
        Util.safeSetSpan(localSpannableStringBuilder, localTypefacesSpan, localVineEntity.start, localVineEntity.end, 33);
        continue;
        bool = false;
        break;
        label436: i = 0;
        break label147;
        label442: j = 0;
        break label163;
        label448: setImage(localActivityViewHolder.targetUserImage, this.mAppController.getPhotoBitmap(localImageKey));
        break label223;
        label469: if (i == 0)
          break label230;
        setAvatar(localActivityViewHolder, str1);
        break label230;
      }
      if ("mention".equals(localVineEntity.type))
      {
        StyledClickableSpan localStyledClickableSpan2 = new StyledClickableSpan(1, Long.valueOf(localVineEntity.id), this.mListener);
        localStyledClickableSpan2.setColor(this.mVineGreen);
        Util.safeSetSpan(localSpannableStringBuilder, localStyledClickableSpan2, localVineEntity.start, localVineEntity.end, 33);
        Util.safeSetSpan(localSpannableStringBuilder, localTypefacesSpan, localVineEntity.start, localVineEntity.end, 33);
      }
      else if ("tag".equals(localVineEntity.type))
      {
        StyledClickableSpan localStyledClickableSpan3 = new StyledClickableSpan(3, localVineEntity.title, this.mListener);
        localStyledClickableSpan3.setColor(this.mVineGreen);
        Util.safeSetSpan(localSpannableStringBuilder, localStyledClickableSpan3, localVineEntity.start, localVineEntity.end, 33);
        Util.safeSetSpan(localSpannableStringBuilder, localTypefacesSpan, localVineEntity.start, localVineEntity.end, 33);
      }
    }
    label654: localTextView.setText(localSpannableStringBuilder);
    label661: if (localActivityViewHolder.userImageOverlay != null);
    switch (localActivityViewHolder.type)
    {
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    default:
      localActivityViewHolder.userImageOverlay.setVisibility(8);
      return;
    case 4:
      localActivityViewHolder.userImageOverlay.setVisibility(0);
      localActivityViewHolder.userImageOverlay.setImageResource(2130837753);
      return;
    case 1:
    case 13:
      localActivityViewHolder.userImageOverlay.setVisibility(0);
      localActivityViewHolder.userImageOverlay.setImageResource(2130837751);
      return;
    case 3:
    case 10:
    case 11:
    case 12:
      localActivityViewHolder.userImageOverlay.setVisibility(0);
      localActivityViewHolder.userImageOverlay.setImageResource(2130837750);
      return;
    case 2:
    }
    localActivityViewHolder.userImageOverlay.setVisibility(0);
    localActivityViewHolder.userImageOverlay.setImageResource(2130837752);
  }

  public int getItemViewType(int paramInt)
  {
    int i = 1;
    Cursor localCursor = (Cursor)getItem(paramInt);
    if (13 == localCursor.getInt(2))
      i = 3;
    label83: label87: 
    while (true)
    {
      return i;
      int j;
      if (!TextUtils.isEmpty(localCursor.getString(6)))
      {
        j = i;
        if (TextUtils.isEmpty(localCursor.getString(5)))
          break label83;
      }
      for (int k = i; ; k = 0)
      {
        if ((j != 0) && (k != 0))
          break label87;
        if (j == 0)
          break label89;
        return 0;
        j = 0;
        break;
      }
    }
    label89: return 2;
  }

  public int getViewTypeCount()
  {
    return 4;
  }

  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    int i;
    int j;
    label33: View localView;
    if (!TextUtils.isEmpty(paramCursor.getString(6)))
    {
      i = 1;
      if (TextUtils.isEmpty(paramCursor.getString(5)))
        break label114;
      j = 1;
      if (paramCursor.getInt(2) != 13)
        break label120;
      localView = LayoutInflater.from(paramContext).inflate(2130903067, paramViewGroup, false);
    }
    while (true)
    {
      ActivityViewHolder localActivityViewHolder = new ActivityViewHolder(localView);
      localActivityViewHolder.contentLine.setMovementMethod(LinkMovementMethod.getInstance());
      localView.setTag(localActivityViewHolder);
      this.mViewHolders.add(new WeakReference(localActivityViewHolder));
      return localView;
      i = 0;
      break;
      label114: j = 0;
      break label33;
      label120: if ((i != 0) && (j != 0))
        localView = LayoutInflater.from(paramContext).inflate(2130903065, paramViewGroup, false);
      else if (i != 0)
        localView = LayoutInflater.from(paramContext).inflate(2130903066, paramViewGroup, false);
      else
        localView = LayoutInflater.from(paramContext).inflate(2130903064, paramViewGroup, false);
    }
  }

  public void setUserImages(HashMap<ImageKey, UrlImage> paramHashMap)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator1 = this.mViewHolders.iterator();
    while (localIterator1.hasNext())
    {
      WeakReference localWeakReference2 = (WeakReference)localIterator1.next();
      ActivityViewHolder localActivityViewHolder = (ActivityViewHolder)localWeakReference2.get();
      if (localActivityViewHolder == null)
      {
        localArrayList.add(localWeakReference2);
      }
      else
      {
        if (localActivityViewHolder.userImageKey != null)
        {
          UrlImage localUrlImage2 = (UrlImage)paramHashMap.get(localActivityViewHolder.userImageKey);
          if ((localUrlImage2 != null) && (localUrlImage2.isValid()))
            setImage(localActivityViewHolder.userImage, localUrlImage2.bitmap);
        }
        if (localActivityViewHolder.targetImageKey != null)
        {
          UrlImage localUrlImage1 = (UrlImage)paramHashMap.get(localActivityViewHolder.targetImageKey);
          if ((localUrlImage1 != null) && (localUrlImage1.isValid()))
            setImage(localActivityViewHolder.targetUserImage, localUrlImage1.bitmap);
        }
      }
    }
    Iterator localIterator2 = localArrayList.iterator();
    while (localIterator2.hasNext())
    {
      WeakReference localWeakReference1 = (WeakReference)localIterator2.next();
      this.mViewHolders.remove(localWeakReference1);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ActivityAdapter
 * JD-Core Version:    0.6.2
 */