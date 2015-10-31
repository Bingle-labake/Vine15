package com.google.android.gms.internal;

import com.google.android.gms.appstate.AppState;

public final class c extends j
  implements AppState
{
  public c(k paramk, int paramInt)
  {
    super(paramk, paramInt);
  }

  public AppState a()
  {
    return new b(this);
  }

  public boolean equals(Object paramObject)
  {
    return b.a(this, paramObject);
  }

  public byte[] getConflictData()
  {
    return getByteArray("conflict_data");
  }

  public String getConflictVersion()
  {
    return getString("conflict_version");
  }

  public int getKey()
  {
    return getInteger("key");
  }

  public byte[] getLocalData()
  {
    return getByteArray("local_data");
  }

  public String getLocalVersion()
  {
    return getString("local_version");
  }

  public boolean hasConflict()
  {
    return !d("conflict_version");
  }

  public int hashCode()
  {
    return b.a(this);
  }

  public String toString()
  {
    return b.b(this);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.c
 * JD-Core Version:    0.6.2
 */