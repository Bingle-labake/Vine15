package com.google.android.gms.appstate;

public abstract interface OnStateLoadedListener
{
  public abstract void onStateConflict(int paramInt, String paramString, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2);

  public abstract void onStateLoaded(int paramInt1, int paramInt2, byte[] paramArrayOfByte);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.appstate.OnStateLoadedListener
 * JD-Core Version:    0.6.2
 */