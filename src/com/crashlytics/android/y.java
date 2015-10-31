package com.crashlytics.android;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

final class y
  implements DialogInterface.OnClickListener
{
  y(Crashlytics paramCrashlytics, C paramC)
  {
  }

  public final void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    this.a.a(true);
    paramDialogInterface.dismiss();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.y
 * JD-Core Version:    0.6.2
 */