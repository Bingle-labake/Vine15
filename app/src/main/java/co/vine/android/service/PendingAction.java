package co.vine.android.service;

import android.os.Bundle;

public class PendingAction
{
  public final int actionCode;
  public final Bundle bundle;
  public final VineServiceResponder responder;

  public PendingAction(int paramInt, Bundle paramBundle, VineServiceResponder paramVineServiceResponder)
  {
    if (paramBundle == null)
      throw new IllegalArgumentException("Bundle cannot be null.");
    this.actionCode = paramInt;
    this.bundle = paramBundle;
    this.responder = paramVineServiceResponder;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.PendingAction
 * JD-Core Version:    0.6.2
 */