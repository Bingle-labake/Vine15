package com.facebook;

import android.os.Bundle;

public class NonCachingTokenCachingStrategy extends TokenCachingStrategy
{
  public void clear()
  {
  }

  public Bundle load()
  {
    return null;
  }

  public void save(Bundle paramBundle)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.facebook.NonCachingTokenCachingStrategy
 * JD-Core Version:    0.6.2
 */