package co.vine.android;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.support.v4.widget.CursorAdapter;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.TextView;
import co.vine.android.api.VineTypeAhead;
import co.vine.android.client.AppController;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class UsersAutoCompleteAdapter extends CursorAdapter
{
  private AppController mAppController;
  protected final ArrayList<WeakReference<UserDropDownViewHolder>> mViewHolders;

  public UsersAutoCompleteAdapter(Activity paramActivity, AppController paramAppController)
  {
    super(paramActivity, null, true);
    this.mAppController = paramAppController;
    this.mViewHolders = new ArrayList();
  }

  private void setUserImage(UserDropDownViewHolder paramUserDropDownViewHolder, Bitmap paramBitmap)
  {
    if (paramBitmap != null)
    {
      paramUserDropDownViewHolder.image.setImageDrawable(new RecyclableBitmapDrawable(this.mContext.getResources(), paramBitmap));
      return;
    }
    paramUserDropDownViewHolder.image.setImageBitmap(null);
    paramUserDropDownViewHolder.image.setBackgroundColor(this.mContext.getResources().getColor(2131296357));
  }

  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    UserDropDownViewHolder localUserDropDownViewHolder = (UserDropDownViewHolder)paramView.getTag();
    localUserDropDownViewHolder.userId = paramCursor.getLong(1);
    String str = paramCursor.getString(3);
    ImageKey localImageKey;
    if (!TextUtils.isEmpty(str))
    {
      localImageKey = new ImageKey(str);
      if (Util.isDefaultAvatarUrl(str))
        Util.safeSetDefaultAvatar(localUserDropDownViewHolder.image);
    }
    while (true)
    {
      localUserDropDownViewHolder.userNameView.setText("@" + paramCursor.getString(2));
      return;
      localUserDropDownViewHolder.avatarUrl = localImageKey;
      setUserImage(localUserDropDownViewHolder, this.mAppController.getPhotoBitmap(localImageKey));
      continue;
      setUserImage(localUserDropDownViewHolder, null);
    }
  }

  public Object getItem(int paramInt)
  {
    Cursor localCursor = (Cursor)super.getItem(paramInt);
    long l;
    if (localCursor != null)
      l = localCursor.getLong(1);
    for (String str = localCursor.getString(2); ; str = new String())
    {
      return new VineTypeAhead("mention", str, l);
      l = 0L;
    }
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
    View localView = LayoutInflater.from(paramContext).inflate(2130903149, null);
    UserDropDownViewHolder localUserDropDownViewHolder = new UserDropDownViewHolder(localView);
    localUserDropDownViewHolder.image.setScaleType(ImageView.ScaleType.FIT_CENTER);
    this.mViewHolders.add(new WeakReference(localUserDropDownViewHolder));
    localView.setTag(localUserDropDownViewHolder);
    return localView;
  }

  public void setUserImages(HashMap<ImageKey, UrlImage> paramHashMap)
  {
    ArrayList localArrayList;
    while (true)
    {
      UserDropDownViewHolder localUserDropDownViewHolder;
      try
      {
        localArrayList = new ArrayList();
        Iterator localIterator1 = this.mViewHolders.iterator();
        if (!localIterator1.hasNext())
          break;
        WeakReference localWeakReference2 = (WeakReference)localIterator1.next();
        localUserDropDownViewHolder = (UserDropDownViewHolder)localWeakReference2.get();
        if (localUserDropDownViewHolder == null)
        {
          localArrayList.add(localWeakReference2);
          continue;
        }
      }
      finally
      {
      }
      UrlImage localUrlImage = (UrlImage)paramHashMap.get(localUserDropDownViewHolder.avatarUrl);
      if ((localUrlImage != null) && (localUrlImage.isValid()))
        setUserImage(localUserDropDownViewHolder, localUrlImage.bitmap);
    }
    Iterator localIterator2 = localArrayList.iterator();
    while (localIterator2.hasNext())
    {
      WeakReference localWeakReference1 = (WeakReference)localIterator2.next();
      this.mViewHolders.remove(localWeakReference1);
    }
  }

  private class UserDropDownViewHolder
  {
    public ImageKey avatarUrl;
    public final ImageView image;
    public long userId;
    public final TextView userNameView;

    public UserDropDownViewHolder(View arg2)
    {
      Object localObject;
      this.image = ((ImageView)localObject.findViewById(2131361873));
      this.userNameView = ((TextView)localObject.findViewById(2131361962));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.UsersAutoCompleteAdapter
 * JD-Core Version:    0.6.2
 */