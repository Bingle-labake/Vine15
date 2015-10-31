package com.google.android.gms.internal;

import android.os.Parcel;
import java.util.ArrayList;

public class eb
  implements ae
{
  public static final ec CREATOR = new ec();
  private final int T;
  private final String ch;
  private final ArrayList<ag> hO;
  private final ArrayList<ag> hP;
  private final boolean hQ;

  public eb(int paramInt, String paramString, ArrayList<ag> paramArrayList1, ArrayList<ag> paramArrayList2, boolean paramBoolean)
  {
    this.T = paramInt;
    this.ch = paramString;
    this.hO = paramArrayList1;
    this.hP = paramArrayList2;
    this.hQ = paramBoolean;
  }

  public ArrayList<ag> bv()
  {
    return this.hO;
  }

  public ArrayList<ag> bw()
  {
    return this.hP;
  }

  public boolean bx()
  {
    return this.hQ;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getDescription()
  {
    return this.ch;
  }

  public int u()
  {
    return this.T;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ec.a(this, paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.eb
 * JD-Core Version:    0.6.2
 */