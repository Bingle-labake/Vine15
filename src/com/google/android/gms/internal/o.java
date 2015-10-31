package com.google.android.gms.internal;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.util.Log;

public class o
  implements DialogInterface.OnClickListener
{
  private final Activity ar;
  private final int as;
  private final Intent mIntent;

  public o(Activity paramActivity, Intent paramIntent, int paramInt)
  {
    this.ar = paramActivity;
    this.mIntent = paramIntent;
    this.as = paramInt;
  }

  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    try
    {
      if (this.mIntent != null)
        this.ar.startActivityForResult(this.mIntent, this.as);
      paramDialogInterface.dismiss();
      return;
    }
    catch (ActivityNotFoundException localActivityNotFoundException)
    {
      Log.e("SettingsRedirect", "Can't redirect to app settings for Google Play services");
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.o
 * JD-Core Version:    0.6.2
 */