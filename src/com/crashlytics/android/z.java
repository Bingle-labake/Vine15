package com.crashlytics.android;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

final class z
  implements DialogInterface.OnClickListener
{
  z(Crashlytics paramCrashlytics, C paramC)
  {
  }

  public final void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    this.a.a(false);
    paramDialogInterface.dismiss();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.z
 * JD-Core Version:    0.6.2
 */