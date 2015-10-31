package co.vine.android.api;

import co.vine.android.util.Util;
import java.util.Comparator;

public class VineComparatorFactory
{
  public static VineComparator<VinePost> get(int paramInt)
  {
    if (Util.isPopularTimeline(paramInt))
      return new VinePopularComparator(null);
    switch (paramInt)
    {
    default:
      return new DefaultComparator(null);
    case 1:
      return new HomeTimelineComparator(null);
    case 2:
    }
    return new ProfileTimelineComparator(null);
  }

  private static class DefaultComparator
    implements VineComparatorFactory.VineComparator<VinePost>
  {
    public int compare(VinePost paramVinePost1, VinePost paramVinePost2)
    {
      return Long.valueOf(getOrderId(paramVinePost2)).compareTo(Long.valueOf(getOrderId(paramVinePost1)));
    }

    public long getOrderId(VinePost paramVinePost)
    {
      return paramVinePost.postId;
    }
  }

  private static class HomeTimelineComparator
    implements VineComparatorFactory.VineComparator<VinePost>
  {
    public int compare(VinePost paramVinePost1, VinePost paramVinePost2)
    {
      return Long.valueOf(getOrderId(paramVinePost2)).compareTo(Long.valueOf(getOrderId(paramVinePost1)));
    }

    public long getOrderId(VinePost paramVinePost)
    {
      if ((paramVinePost.user != null) && (paramVinePost.user.isFollowing()))
        return paramVinePost.postId;
      if (paramVinePost.repost != null)
        return paramVinePost.repost.repostId;
      return paramVinePost.postId;
    }
  }

  private static class ProfileTimelineComparator
    implements VineComparatorFactory.VineComparator<VinePost>
  {
    public int compare(VinePost paramVinePost1, VinePost paramVinePost2)
    {
      return Long.valueOf(getOrderId(paramVinePost2)).compareTo(Long.valueOf(getOrderId(paramVinePost1)));
    }

    public long getOrderId(VinePost paramVinePost)
    {
      if (paramVinePost.repost != null)
        return paramVinePost.repost.repostId;
      return paramVinePost.postId;
    }
  }

  public static abstract interface VineComparator<VinePost> extends Comparator<VinePost>
  {
    public abstract long getOrderId(VinePost paramVinePost);
  }

  private static class VinePopularComparator
    implements VineComparatorFactory.VineComparator<VinePost>
  {
    public int compare(VinePost paramVinePost1, VinePost paramVinePost2)
    {
      return Long.valueOf(getOrderId(paramVinePost1)).compareTo(Long.valueOf(getOrderId(paramVinePost2)));
    }

    public long getOrderId(VinePost paramVinePost)
    {
      return Long.valueOf(paramVinePost.orderId).longValue();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineComparatorFactory
 * JD-Core Version:    0.6.2
 */