package com.google.android.gms.internal;

import com.google.android.gms.common.data.DataBuffer;
import java.util.ArrayList;

public abstract class m<T> extends DataBuffer<T>
{
  private boolean ag = false;
  private ArrayList<Integer> ah;

  public m(k paramk)
  {
    super(paramk);
  }

  private int g(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < this.ah.size()));
    for (boolean bool = true; ; bool = false)
    {
      n.a(bool, "Position " + paramInt + " is out of bounds for this buffer");
      return ((Integer)this.ah.get(paramInt)).intValue();
    }
  }

  private int h(int paramInt)
  {
    if ((paramInt < 0) || (paramInt == this.ah.size()))
      return 0;
    if (paramInt == -1 + this.ah.size())
      return this.O.getCount() - ((Integer)this.ah.get(paramInt)).intValue();
    return ((Integer)this.ah.get(paramInt + 1)).intValue() - ((Integer)this.ah.get(paramInt)).intValue();
  }

  private void i()
  {
    while (true)
    {
      int k;
      try
      {
        if (!this.ag)
        {
          int i = this.O.getCount();
          this.ah = new ArrayList();
          if (i > 0)
          {
            this.ah.add(Integer.valueOf(0));
            String str = getPrimaryDataMarkerColumn();
            int j = this.O.d(0);
            localObject2 = this.O.c(str, 0, j);
            k = 1;
            if (k < i)
            {
              int m = this.O.d(k);
              localObject3 = this.O.c(str, k, m);
              if (((String)localObject3).equals(localObject2))
                break label148;
              this.ah.add(Integer.valueOf(k));
              break label152;
            }
          }
          this.ag = true;
        }
        else
        {
          return;
        }
      }
      finally
      {
      }
      label148: Object localObject3 = localObject2;
      label152: k++;
      Object localObject2 = localObject3;
    }
  }

  protected abstract T a(int paramInt1, int paramInt2);

  public final T get(int paramInt)
  {
    i();
    return a(g(paramInt), h(paramInt));
  }

  public int getCount()
  {
    i();
    return this.ah.size();
  }

  protected abstract String getPrimaryDataMarkerColumn();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.m
 * JD-Core Version:    0.6.2
 */