package com.google.android.gms.maps.model;

import android.os.RemoteException;
import com.google.android.gms.internal.dm;
import com.google.android.gms.internal.x;

public final class Marker
{
  private final dm gj;

  public Marker(dm paramdm)
  {
    this.gj = ((dm)x.d(paramdm));
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof Marker))
      return false;
    try
    {
      boolean bool = this.gj.h(((Marker)paramObject).gj);
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public String getId()
  {
    try
    {
      String str = this.gj.getId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public LatLng getPosition()
  {
    try
    {
      LatLng localLatLng = this.gj.getPosition();
      return localLatLng;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public String getSnippet()
  {
    try
    {
      String str = this.gj.getSnippet();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public String getTitle()
  {
    try
    {
      String str = this.gj.getTitle();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public int hashCode()
  {
    try
    {
      int i = this.gj.hashCodeRemote();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void hideInfoWindow()
  {
    try
    {
      this.gj.hideInfoWindow();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isDraggable()
  {
    try
    {
      boolean bool = this.gj.isDraggable();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isInfoWindowShown()
  {
    try
    {
      boolean bool = this.gj.isInfoWindowShown();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isVisible()
  {
    try
    {
      boolean bool = this.gj.isVisible();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void remove()
  {
    try
    {
      this.gj.remove();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setAnchor(float paramFloat1, float paramFloat2)
  {
    try
    {
      this.gj.setAnchor(paramFloat1, paramFloat2);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setDraggable(boolean paramBoolean)
  {
    try
    {
      this.gj.setDraggable(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setIcon(BitmapDescriptor paramBitmapDescriptor)
  {
    try
    {
      this.gj.f(paramBitmapDescriptor.aD());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setPosition(LatLng paramLatLng)
  {
    try
    {
      this.gj.setPosition(paramLatLng);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setSnippet(String paramString)
  {
    try
    {
      this.gj.setSnippet(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setTitle(String paramString)
  {
    try
    {
      this.gj.setTitle(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setVisible(boolean paramBoolean)
  {
    try
    {
      this.gj.setVisible(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void showInfoWindow()
  {
    try
    {
      this.gj.showInfoWindow();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.model.Marker
 * JD-Core Version:    0.6.2
 */