package com.crashlytics.android;

public enum SettingsController$CacheBehavior
{
  static
  {
    SKIP_CACHE_LOOKUP = new CacheBehavior("SKIP_CACHE_LOOKUP", 1);
    IGNORE_CACHE_EXPIRATION = new CacheBehavior("IGNORE_CACHE_EXPIRATION", 2);
    CacheBehavior[] arrayOfCacheBehavior = new CacheBehavior[3];
    arrayOfCacheBehavior[0] = USE_CACHE;
    arrayOfCacheBehavior[1] = SKIP_CACHE_LOOKUP;
    arrayOfCacheBehavior[2] = IGNORE_CACHE_EXPIRATION;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.SettingsController.CacheBehavior
 * JD-Core Version:    0.6.2
 */