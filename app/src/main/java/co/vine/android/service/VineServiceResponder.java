package co.vine.android.service;

import android.os.Binder;
import android.os.Bundle;

public abstract class VineServiceResponder extends Binder
{
  public abstract void onServiceResponse(int paramInt1, int paramInt2, String paramString, Bundle paramBundle);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.VineServiceResponder
 * JD-Core Version:    0.6.2
 */