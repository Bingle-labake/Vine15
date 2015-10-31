package com.flurry.android;

import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.webkit.WebView;

final class bv
  implements DialogInterface.OnDismissListener
{
  bv(bn parambn)
  {
  }

  public final void onDismiss(DialogInterface paramDialogInterface)
  {
    if (bn.b(this.dW) != null)
      bn.b(this.dW).loadUrl("javascript:if(window.mraid){window.mraid.close();};");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bv
 * JD-Core Version:    0.6.2
 */