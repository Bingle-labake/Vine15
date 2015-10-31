package com.flurry.android;

import android.content.Context;
import android.os.Handler;

final class a extends bk
{
  a(FlurryAgent paramFlurryAgent, boolean paramBoolean, Context paramContext)
  {
  }

  public final void a()
  {
    FlurryAgent.b(this.c);
    FlurryAgent.c(this.c);
    if (!this.a)
      FlurryAgent.d(this.c).postDelayed(new s(this), FlurryAgent.y());
    if (FlurryAgent.n())
    {
      db.c("FlurryAgent", "Attempting to persist AdLogs");
      this.c.Q.S();
      db.c("FlurryAgent", "Attempting to persist FreqCap");
      this.c.Q.U();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.a
 * JD-Core Version:    0.6.2
 */