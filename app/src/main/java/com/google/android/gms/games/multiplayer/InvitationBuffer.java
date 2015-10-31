package com.google.android.gms.games.multiplayer;

import com.google.android.gms.internal.bw;
import com.google.android.gms.internal.k;
import com.google.android.gms.internal.m;

public final class InvitationBuffer extends m<Invitation>
{
  public InvitationBuffer(k paramk)
  {
    super(paramk);
  }

  protected Invitation getEntry(int paramInt1, int paramInt2)
  {
    return new bw(this.O, paramInt1, paramInt2);
  }

  protected String getPrimaryDataMarkerColumn()
  {
    return "external_invitation_id";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.multiplayer.InvitationBuffer
 * JD-Core Version:    0.6.2
 */