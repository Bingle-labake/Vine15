package co.vine.android.util;

public abstract class UrlResource<V>
{
  protected static final int NO_REQUEST_NEEDED;
  public long nextRequestTime;
  public final String url;
  public V value;

  public UrlResource(String paramString)
  {
    this.url = paramString;
    this.nextRequestTime = 0L;
  }

  public boolean isValid()
  {
    return (this.value != null) && (this.nextRequestTime == 0L);
  }

  public abstract int originalSize();

  public abstract int size();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.UrlResource
 * JD-Core Version:    0.6.2
 */