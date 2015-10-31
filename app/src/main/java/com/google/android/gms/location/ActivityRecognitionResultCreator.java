package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ac;
import com.google.android.gms.internal.ac.a;
import com.google.android.gms.internal.ad;

public class ActivityRecognitionResultCreator
  implements Parcelable.Creator<ActivityRecognitionResult>
{
  public static final int CONTENT_DESCRIPTION;

  static void a(ActivityRecognitionResult paramActivityRecognitionResult, Parcel paramParcel, int paramInt)
  {
    int i = ad.d(paramParcel);
    ad.b(paramParcel, 1, paramActivityRecognitionResult.en, false);
    ad.c(paramParcel, 1000, paramActivityRecognitionResult.T);
    ad.a(paramParcel, 2, paramActivityRecognitionResult.eo);
    ad.a(paramParcel, 3, paramActivityRecognitionResult.ep);
    ad.C(paramParcel, i);
  }

  public ActivityRecognitionResult createFromParcel(Parcel paramParcel)
  {
    ActivityRecognitionResult localActivityRecognitionResult = new ActivityRecognitionResult();
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
        localActivityRecognitionResult.en = ac.c(paramParcel, j, DetectedActivity.CREATOR);
        break;
      case 1000:
        localActivityRecognitionResult.T = ac.f(paramParcel, j);
        break;
      case 2:
        localActivityRecognitionResult.eo = ac.g(paramParcel, j);
        break;
      case 3:
        localActivityRecognitionResult.ep = ac.g(paramParcel, j);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new ac.a("Overread allowed size end=" + i, paramParcel);
    return localActivityRecognitionResult;
  }

  public ActivityRecognitionResult[] newArray(int paramInt)
  {
    return new ActivityRecognitionResult[paramInt];
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.location.ActivityRecognitionResultCreator
 * JD-Core Version:    0.6.2
 */