package com.flurry.android;

import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import android.webkit.WebChromeClient;

final class o
  implements DialogInterface.OnDismissListener
{
  o(cs paramcs)
  {
  }

  public final void onDismiss(DialogInterface paramDialogInterface)
  {
    if ((bn.l(this.I.dW) != null) && (bn.m(this.I.dW) != null))
      bn.m(this.I.dW).onHideCustomView();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.o
 * JD-Core Version:    0.6.2
 */