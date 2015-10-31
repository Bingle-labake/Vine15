package co.vine.android.provider;

import android.database.Cursor;
import co.vine.android.VineException;
import co.vine.android.api.VinePost;
import co.vine.android.util.CrashUtil;
import java.util.ArrayList;
import java.util.List;

public class HybridPostCursorExplore extends HybridPostCursor
{
  public HybridPostCursorExplore(Cursor paramCursor)
  {
    this(paramCursor, 20);
  }

  public HybridPostCursorExplore(Cursor paramCursor, int paramInt)
  {
    super(paramCursor, paramInt);
  }

  public HybridPostCursorExplore(ArrayList<VinePost> paramArrayList, int paramInt)
  {
    super(paramArrayList, paramInt);
  }

  public void onPrepare()
  {
    Cursor localCursor = this.mCursor;
    int i = 0;
    int j = 0;
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
          localObject = VinePost.fromExplore(localCursor);
        }
        try
        {
          boolean bool = localCursor.moveToNext();
          j = bool;
          if ((j == 0) || (i >= this.mLimit))
          {
            if (localObject != null)
              this.mList.add(localObject);
            return;
          }
        }
        catch (IllegalStateException localIllegalStateException)
        {
          while (true)
          {
            VineException localVineException = new VineException();
            Object[] arrayOfObject = new Object[4];
            arrayOfObject[0] = Integer.valueOf(localCursor.getCount());
            arrayOfObject[1] = Integer.valueOf(i);
            arrayOfObject[2] = Integer.valueOf(this.mLimit);
            arrayOfObject[3] = Long.valueOf(l2);
            CrashUtil.logException(localVineException, "Failed to get cursor's row id. total: {}, current: {}, limit: {}, postId: {}.", arrayOfObject);
          }
        }
      }
    }
    this.mList = null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.HybridPostCursorExplore
 * JD-Core Version:    0.6.2
 */