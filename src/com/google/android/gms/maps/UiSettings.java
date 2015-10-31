package com.google.android.gms.maps;

import android.os.RemoteException;
import com.google.android.gms.maps.internal.IUiSettingsDelegate;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public final class UiSettings
{
  private final IUiSettingsDelegate fG;

  UiSettings(IUiSettingsDelegate paramIUiSettingsDelegate)
  {
    this.fG = paramIUiSettingsDelegate;
  }

  public boolean isCompassEnabled()
  {
    try
    {
      boolean bool = this.fG.isCompassEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isMyLocationButtonEnabled()
  {
    try
    {
      boolean bool = this.fG.isMyLocationButtonEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isRotateGesturesEnabled()
  {
    try
    {
      boolean bool = this.fG.isRotateGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isScrollGesturesEnabled()
  {
    try
    {
      boolean bool = this.fG.isScrollGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isTiltGesturesEnabled()
  {
    try
    {
      boolean bool = this.fG.isTiltGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isZoomControlsEnabled()
  {
    try
    {
      boolean bool = this.fG.isZoomControlsEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isZoomGesturesEnabled()
  {
    try
    {
      boolean bool = this.fG.isZoomGesturesEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setAllGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.fG.setAllGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setCompassEnabled(boolean paramBoolean)
  {
    try
    {
      this.fG.setCompassEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setMyLocationButtonEnabled(boolean paramBoolean)
  {
    try
    {
      this.fG.setMyLocationButtonEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setRotateGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.fG.setRotateGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setScrollGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.fG.setScrollGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setTiltGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.fG.setTiltGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setZoomControlsEnabled(boolean paramBoolean)
  {
    try
    {
      this.fG.setZoomControlsEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public void setZoomGesturesEnabled(boolean paramBoolean)
  {
    try
    {
      this.fG.setZoomGesturesEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.UiSettings
 * JD-Core Version:    0.6.2
 */