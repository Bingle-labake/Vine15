package co.vine.android.util.image;

public class ImageKey
{
  public final int height;
  public final boolean requestResize;
  public final String url;
  public final int width;

  public ImageKey(String paramString)
  {
    this(paramString, 0, 0);
    if (paramString == null)
      throw new IllegalStateException("Tried to create Image key with null url.");
  }

  public ImageKey(String paramString, int paramInt1, int paramInt2)
  {
    this.url = paramString;
    this.width = paramInt1;
    this.height = paramInt2;
    if ((paramInt1 > 0) && (paramInt2 > 0));
    for (boolean bool = true; ; bool = false)
    {
      this.requestResize = bool;
      return;
    }
  }

  public boolean equals(Object paramObject)
  {
    boolean bool1 = true;
    boolean bool2;
    if (this == paramObject)
      bool2 = bool1;
    ImageKey localImageKey;
    int k;
    int m;
    do
    {
      int i;
      int j;
      do
      {
        Class localClass1;
        Class localClass2;
        do
        {
          do
          {
            return bool2;
            bool2 = false;
          }
          while (paramObject == null);
          localClass1 = getClass();
          localClass2 = paramObject.getClass();
          bool2 = false;
        }
        while (localClass1 != localClass2);
        localImageKey = (ImageKey)paramObject;
        i = this.height;
        j = localImageKey.height;
        bool2 = false;
      }
      while (i != j);
      k = this.width;
      m = localImageKey.width;
      bool2 = false;
    }
    while (k != m);
    if (this.url != null)
      return this.url.equals(localImageKey.url);
    if (localImageKey.url == null);
    while (true)
    {
      return bool1;
      bool1 = false;
    }
  }

  public int hashCode()
  {
    if (this.url != null);
    for (int i = this.url.hashCode(); ; i = 0)
      return 31 * (i * 31 + this.width) + this.height;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.image.ImageKey
 * JD-Core Version:    0.6.2
 */