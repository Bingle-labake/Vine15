package com.google.android.gms.maps;

import android.location.Location;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.internal.bc;
import com.google.android.gms.internal.bd;
import com.google.android.gms.internal.ck;
import com.google.android.gms.internal.ck.a;
import com.google.android.gms.internal.cm.a;
import com.google.android.gms.internal.cn.a;
import com.google.android.gms.internal.co.a;
import com.google.android.gms.internal.cp;
import com.google.android.gms.internal.cq.a;
import com.google.android.gms.internal.cr.a;
import com.google.android.gms.internal.cs.a;
import com.google.android.gms.internal.ct.a;
import com.google.android.gms.internal.cu.a;
import com.google.android.gms.internal.dl;
import com.google.android.gms.internal.dm;
import com.google.android.gms.internal.do;
import com.google.android.gms.internal.x;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.ILocationSourceDelegate.a;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.Circle;
import com.google.android.gms.maps.model.CircleOptions;
import com.google.android.gms.maps.model.GroundOverlay;
import com.google.android.gms.maps.model.GroundOverlayOptions;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.Polygon;
import com.google.android.gms.maps.model.PolygonOptions;
import com.google.android.gms.maps.model.Polyline;
import com.google.android.gms.maps.model.PolylineOptions;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import com.google.android.gms.maps.model.TileOverlay;
import com.google.android.gms.maps.model.TileOverlayOptions;

public final class GoogleMap
{
  public static final int MAP_TYPE_HYBRID = 4;
  public static final int MAP_TYPE_NONE = 0;
  public static final int MAP_TYPE_NORMAL = 1;
  public static final int MAP_TYPE_SATELLITE = 2;
  public static final int MAP_TYPE_TERRAIN = 3;
  private final IGoogleMapDelegate eT;
  private UiSettings eU;

  protected GoogleMap(IGoogleMapDelegate paramIGoogleMapDelegate)
  {
    this.eT = ((IGoogleMapDelegate)x.d(paramIGoogleMapDelegate));
  }

  IGoogleMapDelegate aF()
  {
    return this.eT;
  }

  public final Circle addCircle(CircleOptions paramCircleOptions)
  {
    try
    {
      Circle localCircle = new Circle(this.eT.addCircle(paramCircleOptions));
      return localCircle;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final GroundOverlay addGroundOverlay(GroundOverlayOptions paramGroundOverlayOptions)
  {
    try
    {
      dl localdl = this.eT.addGroundOverlay(paramGroundOverlayOptions);
      if (localdl != null)
      {
        GroundOverlay localGroundOverlay = new GroundOverlay(localdl);
        return localGroundOverlay;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final Marker addMarker(MarkerOptions paramMarkerOptions)
  {
    try
    {
      dm localdm = this.eT.addMarker(paramMarkerOptions);
      if (localdm != null)
      {
        Marker localMarker = new Marker(localdm);
        return localMarker;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final Polygon addPolygon(PolygonOptions paramPolygonOptions)
  {
    try
    {
      Polygon localPolygon = new Polygon(this.eT.addPolygon(paramPolygonOptions));
      return localPolygon;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final Polyline addPolyline(PolylineOptions paramPolylineOptions)
  {
    try
    {
      Polyline localPolyline = new Polyline(this.eT.addPolyline(paramPolylineOptions));
      return localPolyline;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final TileOverlay addTileOverlay(TileOverlayOptions paramTileOverlayOptions)
  {
    try
    {
      do localdo = this.eT.addTileOverlay(paramTileOverlayOptions);
      if (localdo != null)
      {
        TileOverlay localTileOverlay = new TileOverlay(localdo);
        return localTileOverlay;
      }
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void animateCamera(CameraUpdate paramCameraUpdate)
  {
    try
    {
      this.eT.animateCamera(paramCameraUpdate.aD());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void animateCamera(CameraUpdate paramCameraUpdate, int paramInt, CancelableCallback paramCancelableCallback)
  {
    try
    {
      IGoogleMapDelegate localIGoogleMapDelegate = this.eT;
      bc localbc = paramCameraUpdate.aD();
      if (paramCancelableCallback == null);
      for (Object localObject = null; ; localObject = new a(paramCancelableCallback))
      {
        localIGoogleMapDelegate.animateCameraWithDurationAndCallback(localbc, paramInt, (ck)localObject);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void animateCamera(CameraUpdate paramCameraUpdate, CancelableCallback paramCancelableCallback)
  {
    try
    {
      IGoogleMapDelegate localIGoogleMapDelegate = this.eT;
      bc localbc = paramCameraUpdate.aD();
      if (paramCancelableCallback == null);
      for (Object localObject = null; ; localObject = new a(paramCancelableCallback))
      {
        localIGoogleMapDelegate.animateCameraWithCallback(localbc, (ck)localObject);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void clear()
  {
    try
    {
      this.eT.clear();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final CameraPosition getCameraPosition()
  {
    try
    {
      CameraPosition localCameraPosition = this.eT.getCameraPosition();
      return localCameraPosition;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final int getMapType()
  {
    try
    {
      int i = this.eT.getMapType();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final float getMaxZoomLevel()
  {
    try
    {
      float f = this.eT.getMaxZoomLevel();
      return f;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final float getMinZoomLevel()
  {
    try
    {
      float f = this.eT.getMinZoomLevel();
      return f;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final Location getMyLocation()
  {
    try
    {
      Location localLocation = this.eT.getMyLocation();
      return localLocation;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final Projection getProjection()
  {
    try
    {
      Projection localProjection = new Projection(this.eT.getProjection());
      return localProjection;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final UiSettings getUiSettings()
  {
    try
    {
      if (this.eU == null)
        this.eU = new UiSettings(this.eT.getUiSettings());
      UiSettings localUiSettings = this.eU;
      return localUiSettings;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final boolean isIndoorEnabled()
  {
    try
    {
      boolean bool = this.eT.isIndoorEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final boolean isMyLocationEnabled()
  {
    try
    {
      boolean bool = this.eT.isMyLocationEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final boolean isTrafficEnabled()
  {
    try
    {
      boolean bool = this.eT.isTrafficEnabled();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void moveCamera(CameraUpdate paramCameraUpdate)
  {
    try
    {
      this.eT.moveCamera(paramCameraUpdate.aD());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final boolean setIndoorEnabled(boolean paramBoolean)
  {
    try
    {
      boolean bool = this.eT.setIndoorEnabled(paramBoolean);
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setInfoWindowAdapter(final InfoWindowAdapter paramInfoWindowAdapter)
  {
    if (paramInfoWindowAdapter == null);
    try
    {
      this.eT.setInfoWindowAdapter(null);
      return;
      this.eT.setInfoWindowAdapter(new cm.a()
      {
        public bc f(dm paramAnonymousdm)
        {
          return bd.f(paramInfoWindowAdapter.getInfoWindow(new Marker(paramAnonymousdm)));
        }

        public bc g(dm paramAnonymousdm)
        {
          return bd.f(paramInfoWindowAdapter.getInfoContents(new Marker(paramAnonymousdm)));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setLocationSource(final LocationSource paramLocationSource)
  {
    if (paramLocationSource == null);
    try
    {
      this.eT.setLocationSource(null);
      return;
      this.eT.setLocationSource(new ILocationSourceDelegate.a()
      {
        public void activate(final cp paramAnonymouscp)
        {
          paramLocationSource.activate(new LocationSource.OnLocationChangedListener()
          {
            public void onLocationChanged(Location paramAnonymous2Location)
            {
              try
              {
                paramAnonymouscp.e(bd.f(paramAnonymous2Location));
                return;
              }
              catch (RemoteException localRemoteException)
              {
                throw new RuntimeRemoteException(localRemoteException);
              }
            }
          });
        }

        public void deactivate()
        {
          paramLocationSource.deactivate();
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setMapType(int paramInt)
  {
    try
    {
      this.eT.setMapType(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setMyLocationEnabled(boolean paramBoolean)
  {
    try
    {
      this.eT.setMyLocationEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnCameraChangeListener(final OnCameraChangeListener paramOnCameraChangeListener)
  {
    if (paramOnCameraChangeListener == null);
    try
    {
      this.eT.setOnCameraChangeListener(null);
      return;
      this.eT.setOnCameraChangeListener(new cn.a()
      {
        public void onCameraChange(CameraPosition paramAnonymousCameraPosition)
        {
          paramOnCameraChangeListener.onCameraChange(paramAnonymousCameraPosition);
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnInfoWindowClickListener(final OnInfoWindowClickListener paramOnInfoWindowClickListener)
  {
    if (paramOnInfoWindowClickListener == null);
    try
    {
      this.eT.setOnInfoWindowClickListener(null);
      return;
      this.eT.setOnInfoWindowClickListener(new co.a()
      {
        public void e(dm paramAnonymousdm)
        {
          paramOnInfoWindowClickListener.onInfoWindowClick(new Marker(paramAnonymousdm));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMapClickListener(final OnMapClickListener paramOnMapClickListener)
  {
    if (paramOnMapClickListener == null);
    try
    {
      this.eT.setOnMapClickListener(null);
      return;
      this.eT.setOnMapClickListener(new cq.a()
      {
        public void onMapClick(LatLng paramAnonymousLatLng)
        {
          paramOnMapClickListener.onMapClick(paramAnonymousLatLng);
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMapLongClickListener(final OnMapLongClickListener paramOnMapLongClickListener)
  {
    if (paramOnMapLongClickListener == null);
    try
    {
      this.eT.setOnMapLongClickListener(null);
      return;
      this.eT.setOnMapLongClickListener(new cr.a()
      {
        public void onMapLongClick(LatLng paramAnonymousLatLng)
        {
          paramOnMapLongClickListener.onMapLongClick(paramAnonymousLatLng);
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMarkerClickListener(final OnMarkerClickListener paramOnMarkerClickListener)
  {
    if (paramOnMarkerClickListener == null);
    try
    {
      this.eT.setOnMarkerClickListener(null);
      return;
      this.eT.setOnMarkerClickListener(new cs.a()
      {
        public boolean a(dm paramAnonymousdm)
        {
          return paramOnMarkerClickListener.onMarkerClick(new Marker(paramAnonymousdm));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMarkerDragListener(final OnMarkerDragListener paramOnMarkerDragListener)
  {
    if (paramOnMarkerDragListener == null);
    try
    {
      this.eT.setOnMarkerDragListener(null);
      return;
      this.eT.setOnMarkerDragListener(new ct.a()
      {
        public void b(dm paramAnonymousdm)
        {
          paramOnMarkerDragListener.onMarkerDragStart(new Marker(paramAnonymousdm));
        }

        public void c(dm paramAnonymousdm)
        {
          paramOnMarkerDragListener.onMarkerDragEnd(new Marker(paramAnonymousdm));
        }

        public void d(dm paramAnonymousdm)
        {
          paramOnMarkerDragListener.onMarkerDrag(new Marker(paramAnonymousdm));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setOnMyLocationChangeListener(final OnMyLocationChangeListener paramOnMyLocationChangeListener)
  {
    if (paramOnMyLocationChangeListener == null);
    try
    {
      this.eT.setOnMyLocationChangeListener(null);
      return;
      this.eT.setOnMyLocationChangeListener(new cu.a()
      {
        public void b(bc paramAnonymousbc)
        {
          paramOnMyLocationChangeListener.onMyLocationChange((Location)bd.a(paramAnonymousbc));
        }
      });
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void setTrafficEnabled(boolean paramBoolean)
  {
    try
    {
      this.eT.setTrafficEnabled(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void stopAnimation()
  {
    try
    {
      this.eT.stopAnimation();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public static abstract interface CancelableCallback
  {
    public abstract void onCancel();

    public abstract void onFinish();
  }

  public static abstract interface InfoWindowAdapter
  {
    public abstract View getInfoContents(Marker paramMarker);

    public abstract View getInfoWindow(Marker paramMarker);
  }

  public static abstract interface OnCameraChangeListener
  {
    public abstract void onCameraChange(CameraPosition paramCameraPosition);
  }

  public static abstract interface OnInfoWindowClickListener
  {
    public abstract void onInfoWindowClick(Marker paramMarker);
  }

  public static abstract interface OnMapClickListener
  {
    public abstract void onMapClick(LatLng paramLatLng);
  }

  public static abstract interface OnMapLongClickListener
  {
    public abstract void onMapLongClick(LatLng paramLatLng);
  }

  public static abstract interface OnMarkerClickListener
  {
    public abstract boolean onMarkerClick(Marker paramMarker);
  }

  public static abstract interface OnMarkerDragListener
  {
    public abstract void onMarkerDrag(Marker paramMarker);

    public abstract void onMarkerDragEnd(Marker paramMarker);

    public abstract void onMarkerDragStart(Marker paramMarker);
  }

  public static abstract interface OnMyLocationChangeListener
  {
    public abstract void onMyLocationChange(Location paramLocation);
  }

  static final class a extends ck.a
  {
    private final GoogleMap.CancelableCallback fh;

    a(GoogleMap.CancelableCallback paramCancelableCallback)
    {
      this.fh = paramCancelableCallback;
    }

    public void onCancel()
    {
      this.fh.onCancel();
    }

    public void onFinish()
    {
      this.fh.onFinish();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.GoogleMap
 * JD-Core Version:    0.6.2
 */