package co.vine.android;

import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.support.v4.widget.CursorAdapter;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import co.vine.android.client.AppController;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import co.vine.android.widget.UserViewHolder;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class UsersAdapter extends CursorAdapter
{
  protected final AppController mAppController;
  private boolean mFollow;
  private Friendships mFriendships;
  private View.OnClickListener mListener;
  long mLoggedInUserId;
  protected final ArrayList<WeakReference<UserViewHolder>> mViewHolders;

  public UsersAdapter(Context paramContext, AppController paramAppController, boolean paramBoolean, View.OnClickListener paramOnClickListener, Friendships paramFriendships, int paramInt)
  {
    super(paramContext, null, paramInt);
    this.mAppController = paramAppController;
    this.mLoggedInUserId = paramAppController.getActiveId();
    this.mFollow = paramBoolean;
    this.mListener = paramOnClickListener;
    this.mFriendships = paramFriendships;
    this.mViewHolders = new ArrayList();
  }

  private void setUserImage(UserViewHolder paramUserViewHolder, Bitmap paramBitmap)
  {
    if (paramBitmap != null)
    {
      paramUserViewHolder.image.setImageDrawable(new RecyclableBitmapDrawable(this.mContext.getResources(), paramBitmap));
      return;
    }
    paramUserViewHolder.image.setImageBitmap(null);
    paramUserViewHolder.image.setBackgroundColor(this.mContext.getResources().getColor(2131296357));
  }

  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    UserViewHolder localUserViewHolder = (UserViewHolder)paramView.getTag();
    localUserViewHolder.username.setText(paramCursor.getString(13));
    localUserViewHolder.userId = paramCursor.getLong(1);
    String str1 = paramCursor.getString(5);
    label110: ImageButton localImageButton;
    label131: boolean bool;
    if (!TextUtils.isEmpty(str1))
    {
      localUserViewHolder.bio.setText(str1);
      localUserViewHolder.bio.setVisibility(0);
      String str2 = paramCursor.getString(6);
      if (TextUtils.isEmpty(str2))
        break label312;
      localUserViewHolder.location.setText(str2);
      localUserViewHolder.location.setVisibility(0);
      if (paramCursor.getInt(14) != 1)
        break label335;
      localUserViewHolder.verified.setVisibility(0);
      localImageButton = localUserViewHolder.followButton;
      if ((!this.mFollow) || (localUserViewHolder.userId == this.mAppController.getActiveId()))
        break label406;
      localImageButton.setVisibility(0);
      Friendships localFriendships = this.mFriendships;
      long l = paramCursor.getLong(1);
      if (localFriendships == null)
        break label372;
      if (!localFriendships.contains(l))
        break label348;
      bool = localFriendships.isFollowing(l);
      localImageButton.setTag(new FollowButtonViewHolder(l, bool));
      if (!bool)
        break label396;
      localImageButton.setBackgroundResource(2130837643);
    }
    ImageKey localImageKey;
    while (true)
    {
      String str3 = paramCursor.getString(2);
      if (TextUtils.isEmpty(str3))
        break label439;
      localImageKey = new ImageKey(str3);
      if (!Util.isDefaultAvatarUrl(str3))
        break label416;
      Util.safeSetDefaultAvatar(localUserViewHolder.image);
      localUserViewHolder.image.setImageResource(2130837601);
      return;
      localUserViewHolder.bio.setText("");
      localUserViewHolder.bio.setVisibility(8);
      break;
      label312: localUserViewHolder.location.setText("");
      localUserViewHolder.location.setVisibility(8);
      break label110;
      label335: localUserViewHolder.verified.setVisibility(8);
      break label131;
      label348: if (paramCursor.getInt(10) == 1);
      for (bool = true; ; bool = false)
        break;
      label372: if (paramCursor.getInt(10) == 1);
      for (bool = true; ; bool = false)
        break;
      label396: localImageButton.setBackgroundResource(2130837642);
      continue;
      label406: localImageButton.setVisibility(8);
    }
    label416: localUserViewHolder.avatarUrl = localImageKey;
    setUserImage(localUserViewHolder, this.mAppController.getPhotoBitmap(localImageKey));
    return;
    label439: setUserImage(localUserViewHolder, null);
  }

  public long getItemId(int paramInt)
  {
    Cursor localCursor = (Cursor)super.getItem(paramInt);
    if (localCursor != null)
      return localCursor.getLong(1);
    return 0L;
  }

  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    View localView = LayoutInflater.from(paramContext).inflate(2130903152, paramViewGroup, false);
    UserViewHolder localUserViewHolder = new UserViewHolder(localView);
    if (this.mFollow)
      localUserViewHolder.followButton.setOnClickListener(this.mListener);
    while (true)
    {
      this.mViewHolders.add(new WeakReference(localUserViewHolder));
      localView.setTag(localUserViewHolder);
      return localView;
      localUserViewHolder.followButton.setVisibility(8);
    }
  }

  public void setUserImages(HashMap<ImageKey, UrlImage> paramHashMap)
  {
    ArrayList localArrayList;
    while (true)
    {
      UserViewHolder localUserViewHolder;
      try
      {
        localArrayList = new ArrayList();
        Iterator localIterator1 = this.mViewHolders.iterator();
        if (!localIterator1.hasNext())
          break;
        WeakReference localWeakReference2 = (WeakReference)localIterator1.next();
        localUserViewHolder = (UserViewHolder)localWeakReference2.get();
        if (localUserViewHolder == null)
        {
          localArrayList.add(localWeakReference2);
          continue;
        }
      }
      finally
      {
      }
      UrlImage localUrlImage = (UrlImage)paramHashMap.get(localUserViewHolder.avatarUrl);
      if ((localUrlImage != null) && (localUrlImage.isValid()))
        setUserImage(localUserViewHolder, localUrlImage.bitmap);
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
 * Qualified Name:     co.vine.android.UsersAdapter
 * JD-Core Version:    0.6.2
 */