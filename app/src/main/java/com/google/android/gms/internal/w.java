package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class w
{
  public static boolean a(Object paramObject1, Object paramObject2)
  {
    return (paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)));
  }

  public static a c(Object paramObject)
  {
    return new a(paramObject, null);
  }

  public static int hashCode(Object[] paramArrayOfObject)
  {
    return Arrays.hashCode(paramArrayOfObject);
  }

  public static final class a
  {
    private final List<String> aW;
    private final Object aX;

    private a(Object paramObject)
    {
      this.aX = x.d(paramObject);
      this.aW = new ArrayList();
    }

    public a a(String paramString, Object paramObject)
    {
      this.aW.add((String)x.d(paramString) + "=" + String.valueOf(paramObject));
      return this;
    }

    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder(100).append(this.aX.getClass().getSimpleName()).append('{');
      int i = this.aW.size();
      for (int j = 0; j < i; j++)
      {
        localStringBuilder.append((String)this.aW.get(j));
        if (j < i - 1)
          localStringBuilder.append(", ");
      }
      return '}';
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.w
 * JD-Core Version:    0.6.2
 */