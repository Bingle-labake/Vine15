package com.flurry.android;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import java.util.HashMap;
import java.util.Map;

final class bt
  implements DialogInterface.OnClickListener
{
  bt(bn parambn, cw paramcw, int paramInt)
  {
  }

  public final void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("sourceEvent", this.dU.eW);
    this.dW.a("userCanceled", localHashMap, this.dW.M, this.dW.L, this.dW.N, 1 + this.dV);
    paramDialogInterface.dismiss();
    if ((bn.s(this.dW) != null) && (this.dW.ad() == 3))
      bn.s(this.dW).start();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.bt
 * JD-Core Version:    0.6.2
 */