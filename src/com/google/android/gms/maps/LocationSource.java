package com.google.android.gms.maps;

import android.location.Location;

public abstract interface LocationSource
{
  public abstract void activate(OnLocationChangedListener paramOnLocationChangedListener);

  public abstract void deactivate();

  public static abstract interface OnLocationChangedListener
  {
    public abstract void onLocationChanged(Location paramLocation);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.LocationSource
 * JD-Core Version:    0.6.2
 */