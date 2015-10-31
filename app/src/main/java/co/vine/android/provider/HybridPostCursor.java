package co.vine.android.provider;

import android.database.Cursor;
import android.os.Bundle;
import co.vine.android.api.VineComment;
import co.vine.android.api.VineComparatorFactory;
import co.vine.android.api.VineComparatorFactory.VineComparator;
import co.vine.android.api.VineLike;
import co.vine.android.api.VinePagedData;
import co.vine.android.api.VinePost;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class HybridPostCursor extends GroupCursor<VinePost>
{
  public static final String EXTRA_INCLUDE_LIST = "include_list";
  public static final String EXTRA_IS_LAST = "is_last";
  public static final String EXTRA_POST = "post";
  public static final String EXTRA_POSTS = "extra_posts";
  private boolean mIncludeList = false;

  public HybridPostCursor(Cursor paramCursor)
  {
    this(paramCursor, 20);
  }

  public HybridPostCursor(Cursor paramCursor, int paramInt)
  {
    super(paramCursor, paramInt);
    if ((BuildUtil.isLogsOn()) && (BuildUtil.isExplore()) && (getClass() == HybridPostCursor.class))
      throw new IllegalStateException("Constructed HybridPostCursor with explore app. Use HybridPostCursorExplore.");
  }

  public HybridPostCursor(ArrayList<VinePost> paramArrayList, int paramInt)
  {
    super(null);
    if ((BuildUtil.isLogsOn()) && (BuildUtil.isExplore()) && (getClass() == HybridPostCursor.class))
      throw new IllegalStateException("Constructed HybridPostCursor with explore app. Use HybridPostCursorExplore.");
    this.mList = paramArrayList;
    this.mLimit = paramInt;
  }

  public static ArrayList<VinePost> mergePosts(ArrayList<VinePost> paramArrayList1, ArrayList<VinePost> paramArrayList2, VineComparatorFactory.VineComparator<VinePost> paramVineComparator, boolean paramBoolean)
  {
    if (paramArrayList1 != null);
    while (true)
    {
      int j;
      VinePost localVinePost;
      try
      {
        if (paramArrayList1.isEmpty())
        {
          if ((paramArrayList2 != null) && (!paramArrayList2.isEmpty()))
          {
            sort(paramArrayList2, paramVineComparator);
            paramArrayList1 = paramArrayList2;
            return paramArrayList1;
          }
          paramArrayList1 = null;
          continue;
        }
        HashMap localHashMap = new HashMap(paramArrayList1.size());
        int i = 0;
        Iterator localIterator1 = paramArrayList1.iterator();
        if (localIterator1.hasNext())
        {
          localHashMap.put(Long.valueOf(((VinePost)localIterator1.next()).postId), Integer.valueOf(i));
          i++;
          continue;
        }
        j = 0;
        Iterator localIterator2 = paramArrayList2.iterator();
        if (!localIterator2.hasNext())
          break label197;
        localVinePost = (VinePost)localIterator2.next();
        Integer localInteger = (Integer)localHashMap.get(Long.valueOf(localVinePost.postId));
        if (localInteger != null)
        {
          paramArrayList1.set(localInteger.intValue(), localVinePost);
          continue;
        }
      }
      finally
      {
      }
      paramArrayList1.add(localVinePost);
      j++;
      continue;
      label197: if (paramBoolean)
        FlurryUtils.trackGraphTimelineRefreshNewCount(j);
      sort(paramArrayList1, paramVineComparator);
    }
  }

  private static void sort(ArrayList<VinePost> paramArrayList, VineComparatorFactory.VineComparator<VinePost> paramVineComparator)
  {
    if (paramVineComparator == null)
    {
      Collections.sort(paramArrayList, VineComparatorFactory.get(-1));
      return;
    }
    Collections.sort(paramArrayList, paramVineComparator);
  }

  public int getColumnIndexOrThrow(String paramString)
    throws IllegalArgumentException
  {
    int i = ((Integer)VineDatabaseSQL.PostCommentsLikesQuery.LOOKUP.get(paramString)).intValue();
    if (i >= 0)
      return i;
    return super.getColumnIndexOrThrow(paramString);
  }

  public Bundle getExtras()
  {
    Bundle localBundle2;
    try
    {
      Bundle localBundle3 = super.getExtras();
      localBundle1 = localBundle3;
      if (localBundle1 != null)
      {
        localBundle2 = new Bundle(localBundle1);
        if (!this.mIncludeList)
          break label61;
        localBundle2.putParcelableArrayList("extra_posts", (ArrayList)this.mList);
        return localBundle2;
      }
    }
    catch (NullPointerException localNullPointerException)
    {
      label61: VinePost localVinePost;
      do
      {
        while (true)
        {
          Bundle localBundle1 = null;
          continue;
          localBundle2 = new Bundle();
        }
        localVinePost = (VinePost)getItem();
      }
      while (localVinePost == null);
      localBundle2.putParcelable("post", localVinePost);
      localBundle2.putBoolean("is_last", localVinePost.isLast);
    }
    return localBundle2;
  }

  public void markLast()
  {
    if (this.mList != null)
      ((VinePost)this.mList.get(-1 + this.mList.size())).isLast = true;
  }

  public void onPrepare()
  {
    Cursor localCursor = this.mCursor;
    int i = 0;
    if ((localCursor != null) && (localCursor.moveToFirst()))
    {
      long l1 = 0L;
      Object localObject = null;
      this.mList = new ArrayList();
      while (true)
      {
        long l2 = localCursor.getLong(1);
        if (l2 != l1)
        {
          if (localObject != null)
          {
            this.mList.add(localObject);
            i++;
          }
          l1 = l2;
          localObject = VinePost.from(localCursor);
        }
        long l4;
        if (localObject != null)
        {
          long l3 = localCursor.getLong(34);
          l4 = localCursor.getLong(27);
          if (l3 <= 0L)
            break label202;
          VineComment localVineComment = VineComment.from(localCursor);
          if (((VinePost)localObject).comments.items == null)
            ((VinePost)localObject).comments.items = new ArrayList();
          ((VinePost)localObject).comments.items.add(localVineComment);
        }
        try
        {
          while (true)
          {
            boolean bool2 = localCursor.moveToNext();
            bool1 = bool2;
            if ((bool1) && (i < this.mLimit))
              break;
            if (localObject != null)
              this.mList.add(localObject);
            return;
            label202: if (l4 > 0L)
            {
              VineLike localVineLike = VineLike.from(localCursor);
              if (((VinePost)localObject).likes.items == null)
                ((VinePost)localObject).likes.items = new ArrayList();
              ((VinePost)localObject).likes.items.add(localVineLike);
            }
          }
        }
        catch (IllegalStateException localIllegalStateException)
        {
          while (true)
          {
            Object[] arrayOfObject = new Object[4];
            arrayOfObject[0] = Integer.valueOf(localCursor.getCount());
            arrayOfObject[1] = Integer.valueOf(i);
            arrayOfObject[2] = Integer.valueOf(this.mLimit);
            arrayOfObject[3] = Long.valueOf(l2);
            CrashUtil.log("Failed to get cursor's row id. total: {}, current: {}, limit: {}, postId: {}.", arrayOfObject);
            System.gc();
            boolean bool1 = localCursor.moveToNext();
          }
        }
      }
    }
    this.mList = null;
  }

  public Bundle respond(Bundle paramBundle)
  {
    this.mIncludeList = paramBundle.getBoolean("include_list", false);
    return paramBundle;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.HybridPostCursor
 * JD-Core Version:    0.6.2
 */