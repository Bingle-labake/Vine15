package com.google.android.gms.maps;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.util.AttributeSet;
import com.google.android.gms.R.styleable;
import com.google.android.gms.internal.ae;
import com.google.android.gms.internal.ci;
import com.google.android.gms.internal.cj;
import com.google.android.gms.internal.cx;
import com.google.android.gms.maps.model.CameraPosition;

public final class GoogleMapOptions
  implements ae
{
  public static final GoogleMapOptionsCreator CREATOR = new GoogleMapOptionsCreator();
  private final int T;
  private Boolean fi;
  private Boolean fj;
  private int fk = -1;
  private CameraPosition fl;
  private Boolean fm;
  private Boolean fn;
  private Boolean fo;
  private Boolean fp;
  private Boolean fq;
  private Boolean fr;

  public GoogleMapOptions()
  {
    this.T = 1;
  }

  GoogleMapOptions(int paramInt1, byte paramByte1, byte paramByte2, int paramInt2, CameraPosition paramCameraPosition, byte paramByte3, byte paramByte4, byte paramByte5, byte paramByte6, byte paramByte7, byte paramByte8)
  {
    this.T = paramInt1;
    this.fi = cj.a(paramByte1);
    this.fj = cj.a(paramByte2);
    this.fk = paramInt2;
    this.fl = paramCameraPosition;
    this.fm = cj.a(paramByte3);
    this.fn = cj.a(paramByte4);
    this.fo = cj.a(paramByte5);
    this.fp = cj.a(paramByte6);
    this.fq = cj.a(paramByte7);
    this.fr = cj.a(paramByte8);
  }

  public static GoogleMapOptions createFromAttributes(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null)
      return null;
    TypedArray localTypedArray = paramContext.getResources().obtainAttributes(paramAttributeSet, R.styleable.MapAttrs);
    GoogleMapOptions localGoogleMapOptions = new GoogleMapOptions();
    if (localTypedArray.hasValue(0))
      localGoogleMapOptions.mapType(localTypedArray.getInt(0, -1));
    if (localTypedArray.hasValue(13))
      localGoogleMapOptions.zOrderOnTop(localTypedArray.getBoolean(13, false));
    if (localTypedArray.hasValue(12))
      localGoogleMapOptions.useViewLifecycleInFragment(localTypedArray.getBoolean(12, false));
    if (localTypedArray.hasValue(6))
      localGoogleMapOptions.compassEnabled(localTypedArray.getBoolean(6, true));
    if (localTypedArray.hasValue(7))
      localGoogleMapOptions.rotateGesturesEnabled(localTypedArray.getBoolean(7, true));
    if (localTypedArray.hasValue(8))
      localGoogleMapOptions.scrollGesturesEnabled(localTypedArray.getBoolean(8, true));
    if (localTypedArray.hasValue(9))
      localGoogleMapOptions.tiltGesturesEnabled(localTypedArray.getBoolean(9, true));
    if (localTypedArray.hasValue(11))
      localGoogleMapOptions.zoomGesturesEnabled(localTypedArray.getBoolean(11, true));
    if (localTypedArray.hasValue(10))
      localGoogleMapOptions.zoomControlsEnabled(localTypedArray.getBoolean(10, true));
    localGoogleMapOptions.camera(CameraPosition.createFromAttributes(paramContext, paramAttributeSet));
    localTypedArray.recycle();
    return localGoogleMapOptions;
  }

  public byte aG()
  {
    return cj.b(this.fi);
  }

  public byte aH()
  {
    return cj.b(this.fj);
  }

  public byte aI()
  {
    return cj.b(this.fm);
  }

  public byte aJ()
  {
    return cj.b(this.fn);
  }

  public byte aK()
  {
    return cj.b(this.fo);
  }

  public byte aL()
  {
    return cj.b(this.fp);
  }

  public byte aM()
  {
    return cj.b(this.fq);
  }

  public byte aN()
  {
    return cj.b(this.fr);
  }

  public GoogleMapOptions camera(CameraPosition paramCameraPosition)
  {
    this.fl = paramCameraPosition;
    return this;
  }

  public GoogleMapOptions compassEnabled(boolean paramBoolean)
  {
    this.fn = Boolean.valueOf(paramBoolean);
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public CameraPosition getCamera()
  {
    return this.fl;
  }

  public Boolean getCompassEnabled()
  {
    return this.fn;
  }

  public int getMapType()
  {
    return this.fk;
  }

  public Boolean getRotateGesturesEnabled()
  {
    return this.fr;
  }

  public Boolean getScrollGesturesEnabled()
  {
    return this.fo;
  }

  public Boolean getTiltGesturesEnabled()
  {
    return this.fq;
  }

  public Boolean getUseViewLifecycleInFragment()
  {
    return this.fj;
  }

  public Boolean getZOrderOnTop()
  {
    return this.fi;
  }

  public Boolean getZoomControlsEnabled()
  {
    return this.fm;
  }

  public Boolean getZoomGesturesEnabled()
  {
    return this.fp;
  }

  public GoogleMapOptions mapType(int paramInt)
  {
    this.fk = paramInt;
    return this;
  }

  public GoogleMapOptions rotateGesturesEnabled(boolean paramBoolean)
  {
    this.fr = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions scrollGesturesEnabled(boolean paramBoolean)
  {
    this.fo = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions tiltGesturesEnabled(boolean paramBoolean)
  {
    this.fq = Boolean.valueOf(paramBoolean);
    return this;
  }

  public int u()
  {
    return this.T;
  }

  public GoogleMapOptions useViewLifecycleInFragment(boolean paramBoolean)
  {
    this.fj = Boolean.valueOf(paramBoolean);
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (cx.aV())
    {
      ci.a(this, paramParcel, paramInt);
      return;
    }
    GoogleMapOptionsCreator.a(this, paramParcel, paramInt);
  }

  public GoogleMapOptions zOrderOnTop(boolean paramBoolean)
  {
    this.fi = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions zoomControlsEnabled(boolean paramBoolean)
  {
    this.fm = Boolean.valueOf(paramBoolean);
    return this;
  }

  public GoogleMapOptions zoomGesturesEnabled(boolean paramBoolean)
  {
    this.fp = Boolean.valueOf(paramBoolean);
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.GoogleMapOptions
 * JD-Core Version:    0.6.2
 */