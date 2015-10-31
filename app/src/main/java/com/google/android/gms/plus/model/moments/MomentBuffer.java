package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.internal.eh;
import com.google.android.gms.internal.k;

public final class MomentBuffer extends DataBuffer<Moment>
{
  public MomentBuffer(k paramk)
  {
    super(paramk);
  }

  public Moment get(int paramInt)
  {
    return new eh(this.O, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.plus.model.moments.MomentBuffer
 * JD-Core Version:    0.6.2
 */