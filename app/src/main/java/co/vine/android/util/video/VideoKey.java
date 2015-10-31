package co.vine.android.util.video;

public class VideoKey
{
  public final String url;

  public VideoKey(String paramString)
  {
    this.url = paramString;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      if (this.url != null)
        return this.url.equals(((VideoKey)paramObject).url);
    }
    while (((VideoKey)paramObject).url == null);
    return false;
  }

  public int hashCode()
  {
    if (this.url != null)
      return 31 * this.url.hashCode();
    return 0;
  }

  public String toString()
  {
    return this.url;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.video.VideoKey
 * JD-Core Version:    0.6.2
 */