package com.flurry.android;

import android.content.Context;
import android.content.Intent;

final class cu extends bk
{
  cu(FlurryAds paramFlurryAds, String paramString, AdUnit paramAdUnit, Context paramContext, boolean paramBoolean)
  {
  }

  public final void a()
  {
    if (this.eS != null)
    {
      String str2 = this.eT.getAdSpace().toString();
      if (this.eS.startsWith("market://"))
        this.ee.a(this.eO, this.eS, this.eT);
      do
      {
        return;
        if (this.eS.startsWith("http"))
        {
          Intent localIntent = new Intent(this.eO, FlurryFullscreenTakeoverActivity.class);
          localIntent.putExtra("url", this.eS);
          if ((this.eU) && (bd.a(this.eO, localIntent)))
          {
            this.ee.a(this.eO, localIntent, str2);
            return;
          }
          db.d(FlurryAds.d, "Unable to launch FlurryFullscreenTakeoverActivity, falling back to browser. Fix by declaring this Activity in your AndroidManifest.xml");
          this.ee.b(this.eO, this.eS, str2);
          return;
        }
      }
      while (this.ee.b(this.eO, this.eS, str2));
      db.g(FlurryAds.d, "Failed to launch intent for:" + this.eS);
      return;
    }
    String str1 = "Unable to launch intent for: " + this.eS;
    db.g(FlurryAds.d, str1);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.cu
 * JD-Core Version:    0.6.2
 */