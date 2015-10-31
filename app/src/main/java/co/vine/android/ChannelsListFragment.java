package co.vine.android;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.CursorAdapter;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.VineAPI;
import co.vine.android.drawable.RecyclableBitmapDrawable;
import co.vine.android.provider.Vine.Channels;
import co.vine.android.provider.VineDatabaseHelper;
import co.vine.android.provider.VineDatabaseSQL.ChannelsQuery;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class ChannelsListFragment extends BaseListFragment
  implements View.OnClickListener
{
  public static final String ARG_SELECTED_CHANNEL = "selected_channel";
  public static final String ARG_TAKE_FOCUS = "take_focus";
  private ChannelsListActivity mCallback;
  private VineDatabaseHelper mDbHelper;
  private boolean mFetched;
  private long mSelectedChannel;

  private void fetchContent(int paramInt)
  {
    if (hasPendingRequest(paramInt))
      return;
    int i;
    switch (paramInt)
    {
    default:
      i = 1;
    case 2:
    case 1:
    }
    while (true)
    {
      addRequest(this.mAppController.fetchChannels(i), paramInt);
      this.mFetched = true;
      return;
      i = 2;
      continue;
      i = 3;
    }
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (this.mCursorAdapter == null)
      this.mCursorAdapter = new ChannelsAdapter(getActivity(), this.mAppController, 0);
    ListView localListView = this.mListView;
    localListView.setBackgroundColor(getResources().getColor(2131296285));
    localListView.setAdapter(this.mCursorAdapter);
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    this.mCallback = ((ChannelsListActivity)paramActivity);
    this.mDbHelper = VineDatabaseHelper.getDatabaseHelper(paramActivity);
  }

  public void onClick(View paramView)
  {
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mAppSessionListener = new ChannelsListSessionListener();
    this.mSelectedChannel = getArguments().getLong("selected_channel");
  }

  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new CursorLoader(getActivity(), Vine.Channels.CONTENT_URI, VineDatabaseSQL.ChannelsQuery.PROJECTION, null, null, null);
  }

  public void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    Cursor localCursor = this.mCursorAdapter.getCursor();
    if ((localCursor != null) && (localCursor.moveToPosition(paramInt)))
    {
      long l = localCursor.getLong(1);
      String str = localCursor.getString(2);
      this.mCallback.onChannelSelected(l, str);
      this.mDbHelper.markChannelLastUsedTimestamp(l);
    }
  }

  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    super.onLoadFinished(paramLoader, paramCursor);
    if (this.mFetched)
    {
      hideProgress(3);
      if (this.mCursorAdapter.isEmpty())
        showSadface(true);
    }
    else
    {
      return;
    }
    showSadface(false);
  }

  public void onResume()
  {
    super.onResume();
    if (this.mCursorAdapter.getCursor() == null)
      initLoader();
    if (!this.mFetched)
      fetchContent(3);
  }

  protected void onScrollLastItem(Cursor paramCursor)
  {
    if ((this.mRefreshable) && (paramCursor.getInt(8) == 0))
      fetchContent(1);
  }

  private class ChannelViewHolder
  {
    public long channelId;
    public ImageView channelImage;
    public ImageKey channelImageKey;
    public TextView channelTitle;

    public ChannelViewHolder(View arg2)
    {
      Object localObject;
      this.channelImage = ((ImageView)localObject.findViewById(2131361880));
      this.channelTitle = ((TextView)localObject.findViewById(2131361881));
    }
  }

  private class ChannelsAdapter extends CursorAdapter
  {
    private final ArrayList<WeakReference<ChannelsListFragment.ChannelViewHolder>> mViewHolders;

    public ChannelsAdapter(Context paramAppController, AppController paramInt, int arg4)
    {
      super(null, i);
      ChannelsListFragment.this.mAppController = paramInt;
      this.mViewHolders = new ArrayList();
    }

    private void setChannelImage(ChannelsListFragment.ChannelViewHolder paramChannelViewHolder, Bitmap paramBitmap)
    {
      if (paramBitmap != null)
      {
        paramChannelViewHolder.channelImage.setImageDrawable(new RecyclableBitmapDrawable(this.mContext.getResources(), paramBitmap));
        return;
      }
      paramChannelViewHolder.channelImage.setImageBitmap(null);
      paramChannelViewHolder.channelImage.setBackgroundColor(this.mContext.getResources().getColor(2131296357));
    }

    public void bindView(View paramView, Context paramContext, Cursor paramCursor)
    {
      ChannelsListFragment.ChannelViewHolder localChannelViewHolder = (ChannelsListFragment.ChannelViewHolder)paramView.getTag();
      localChannelViewHolder.channelTitle.setText(paramCursor.getString(2));
      localChannelViewHolder.channelId = paramCursor.getLong(1);
      if (localChannelViewHolder.channelId == ChannelsListFragment.this.mSelectedChannel)
        paramView.setBackgroundColor(ChannelsListFragment.this.getResources().getColor(2131296323));
      while (true)
      {
        String str1 = paramCursor.getString(4);
        if (TextUtils.isEmpty(str1))
          break;
        String str2 = VineAPI.getInstance(ChannelsListFragment.this.getActivity()).getBaseCdnUrl();
        ImageKey localImageKey = new ImageKey(str2 + str1);
        localChannelViewHolder.channelImageKey = localImageKey;
        setChannelImage(localChannelViewHolder, ChannelsListFragment.this.mAppController.getPhotoBitmap(localImageKey));
        return;
        paramView.setBackgroundColor(ChannelsListFragment.this.getResources().getColor(2131296358));
      }
      setChannelImage(localChannelViewHolder, null);
    }

    public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
    {
      View localView = LayoutInflater.from(paramContext).inflate(2130903070, paramViewGroup, false);
      ChannelsListFragment.ChannelViewHolder localChannelViewHolder = new ChannelsListFragment.ChannelViewHolder(ChannelsListFragment.this, localView);
      this.mViewHolders.add(new WeakReference(localChannelViewHolder));
      localView.setTag(localChannelViewHolder);
      return localView;
    }

    public void setChannelImages(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      ArrayList localArrayList;
      while (true)
      {
        ChannelsListFragment.ChannelViewHolder localChannelViewHolder;
        try
        {
          localArrayList = new ArrayList();
          Iterator localIterator1 = this.mViewHolders.iterator();
          if (!localIterator1.hasNext())
            break;
          WeakReference localWeakReference2 = (WeakReference)localIterator1.next();
          localChannelViewHolder = (ChannelsListFragment.ChannelViewHolder)localWeakReference2.get();
          if (localChannelViewHolder == null)
          {
            localArrayList.add(localWeakReference2);
            continue;
          }
        }
        finally
        {
        }
        UrlImage localUrlImage = (UrlImage)paramHashMap.get(localChannelViewHolder.channelImageKey);
        if ((localUrlImage != null) && (localUrlImage.isValid()))
          setChannelImage(localChannelViewHolder, localUrlImage.bitmap);
      }
      Iterator localIterator2 = localArrayList.iterator();
      while (localIterator2.hasNext())
      {
        WeakReference localWeakReference1 = (WeakReference)localIterator2.next();
        this.mViewHolders.remove(localWeakReference1);
      }
    }
  }

  public class ChannelsListSessionListener extends AppSessionListener
  {
    public ChannelsListSessionListener()
    {
    }

    public void onGetChannelsComplete(String paramString1, int paramInt, String paramString2)
    {
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      ((ChannelsListFragment.ChannelsAdapter)ChannelsListFragment.this.mCursorAdapter).setChannelImages(paramHashMap);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ChannelsListFragment
 * JD-Core Version:    0.6.2
 */