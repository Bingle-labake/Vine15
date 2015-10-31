package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ac;
import com.google.android.gms.internal.ac.a;
import com.google.android.gms.internal.ad;

public class DetectedActivityCreator
  implements Parcelable.Creator<DetectedActivity>
{
  public static final int CONTENT_DESCRIPTION;

  static void a(DetectedActivity paramDetectedActivity, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.c(paramParcel, 1, paramDetectedActivity.eq);
    ad.c(paramParcel, 1000, paramDetectedActivity.T);
    ad.c(paramParcel, 2, paramDetectedActivity.er);
    ad.C(paramParcel, i);
  }

  public DetectedActivity createFromParcel(Parcel paramParcel)
  {
    DetectedActivity localDetectedActivity = new DetectedActivity();
    int i = ac.c(paramParcel);
    while (paramParcel.dataPosition() < i)
    {
      int j = ac.b(paramParcel);
      switch (ac.j(j))
      {
      default:
        ac.b(paramParcel, j);
        break;
      case 1:
        localDetectedActivity.eq = ac.f(paramParcel, j);
        break;
      case 1000:
        localDetectedActivity.T = ac.f(paramParcel, j);
        break;
      case 2:
        localDetectedActivity.er = ac.f(paramParcel, j);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return localDetectedActivity;
  }

  public DetectedActivity[] newArray(int paramInt)
  {
    return new DetectedActivity[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.location.DetectedActivityCreator
 * JD-Core Version:    0.6.2
 */