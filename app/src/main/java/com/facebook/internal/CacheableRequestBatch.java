package com.facebook.internal;

import com.facebook.Request;
import com.facebook.RequestBatch;

public class CacheableRequestBatch extends RequestBatch
{
  private String cacheKey;
  private boolean forceRoundTrip;

  public CacheableRequestBatch()
  {
  }

  public CacheableRequestBatch(Request[] paramArrayOfRequest)
  {
    super(paramArrayOfRequest);
  }

  public final String getCacheKeyOverride()
  {
    return this.cacheKey;
  }

  public final boolean getForceRoundTrip()
  {
    return this.forceRoundTrip;
  }

  public final void setCacheKeyOverride(String paramString)
  {
    this.cacheKey = paramString;
  }

  public final void setForceRoundTrip(boolean paramBoolean)
  {
    this.forceRoundTrip = paramBoolean;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.facebook.internal.CacheableRequestBatch
 * JD-Core Version:    0.6.2
 */