package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.internal.ed;
import com.google.android.gms.internal.ef;
import java.util.HashSet;
import java.util.Set;

public abstract interface Moment extends Freezable<Moment>
{
  public abstract String getId();

  public abstract ItemScope getResult();

  public abstract String getStartDate();

  public abstract ItemScope getTarget();

  public abstract String getType();

  public abstract boolean hasId();

  public abstract boolean hasResult();

  public abstract boolean hasStartDate();

  public abstract boolean hasTarget();

  public abstract boolean hasType();

  public static class Builder
  {
    private final Set<Integer> hS = new HashSet();
    private String iH;
    private String iN;
    private ed iQ;
    private ed iR;
    private String iw;

    public Moment build()
    {
      return new ef(this.hS, this.iw, this.iQ, this.iH, this.iR, this.iN);
    }

    public Builder setId(String paramString)
    {
      this.iw = paramString;
      this.hS.add(Integer.valueOf(2));
      return this;
    }

    public Builder setResult(ItemScope paramItemScope)
    {
      this.iQ = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(4));
      return this;
    }

    public Builder setStartDate(String paramString)
    {
      this.iH = paramString;
      this.hS.add(Integer.valueOf(5));
      return this;
    }

    public Builder setTarget(ItemScope paramItemScope)
    {
      this.iR = ((ed)paramItemScope);
      this.hS.add(Integer.valueOf(6));
      return this;
    }

    public Builder setType(String paramString)
    {
      this.iN = paramString;
      this.hS.add(Integer.valueOf(7));
      return this;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.plus.model.moments.Moment
 * JD-Core Version:    0.6.2
 */