package com.google.android.gms.internal;

import android.os.Parcel;

public class ai
  implements ae
{
  public static final aj CREATOR = new aj();
  private final int T;
  private final ak bo;

  ai(int paramInt, ak paramak)
  {
    this.T = paramInt;
    this.bo = paramak;
  }

  private ai(ak paramak)
  {
    this.T = 1;
    this.bo = paramak;
  }

  public static ai a(an.b<?, ?> paramb)
  {
    if ((paramb instanceof ak))
      return new ai((ak)paramb);
    throw new IllegalArgumentException("Unsupported safe parcelable field converter class.");
  }

  ak B()
  {
    return this.bo;
  }

  public an.b<?, ?> C()
  {
    if (this.bo != null)
      return this.bo;
    throw new IllegalStateException("There was no converter wrapped in this ConverterWrapper.");
  }

  public int describeContents()
  {
    return 0;
  }

  int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    aj.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.ai
 * JD-Core Version:    0.6.2
 */