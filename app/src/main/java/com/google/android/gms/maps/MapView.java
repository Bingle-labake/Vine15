package com.google.android.gms.maps;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.dynamic.LifecycleDelegate;
import com.google.android.gms.internal.bb;
import com.google.android.gms.internal.bd;
import com.google.android.gms.internal.be;
import com.google.android.gms.internal.cl;
import com.google.android.gms.internal.cw;
import com.google.android.gms.internal.x;
import com.google.android.gms.maps.internal.IMapViewDelegate;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public class MapView extends FrameLayout
{
  private GoogleMap ft;
  private final b fx;

  public MapView(Context paramContext)
  {
    super(paramContext);
    this.fx = new b(this, paramContext, null);
  }

  public MapView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.fx = new b(this, paramContext, GoogleMapOptions.createFromAttributes(paramContext, paramAttributeSet));
  }

  public MapView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.fx = new b(this, paramContext, GoogleMapOptions.createFromAttributes(paramContext, paramAttributeSet));
  }

  public MapView(Context paramContext, GoogleMapOptions paramGoogleMapOptions)
  {
    super(paramContext);
    this.fx = new b(this, paramContext, paramGoogleMapOptions);
  }

  public final GoogleMap getMap()
  {
    if (this.ft != null)
      return this.ft;
    this.fx.aP();
    if (this.fx.ag() == null)
      return null;
    try
    {
      this.ft = new GoogleMap(((a)this.fx.ag()).aQ().getMap());
      return this.ft;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public final void onCreate(Bundle paramBundle)
  {
    this.fx.onCreate(paramBundle);
    if (this.fx.ag() == null)
      this.fx.a(this);
  }

  public final void onDestroy()
  {
    this.fx.onDestroy();
  }

  public final void onLowMemory()
  {
    this.fx.onLowMemory();
  }

  public final void onPause()
  {
    this.fx.onPause();
  }

  public final void onResume()
  {
    this.fx.onResume();
  }

  public final void onSaveInstanceState(Bundle paramBundle)
  {
    this.fx.onSaveInstanceState(paramBundle);
  }

  static class a
    implements LifecycleDelegate
  {
    private View fA;
    private final ViewGroup fy;
    private final IMapViewDelegate fz;

    public a(ViewGroup paramViewGroup, IMapViewDelegate paramIMapViewDelegate)
    {
      this.fz = ((IMapViewDelegate)x.d(paramIMapViewDelegate));
      this.fy = ((ViewGroup)x.d(paramViewGroup));
    }

    public IMapViewDelegate aQ()
    {
      return this.fz;
    }

    public void onCreate(Bundle paramBundle)
    {
      try
      {
        this.fz.onCreate(paramBundle);
        this.fA = ((View)bd.a(this.fz.getView()));
        this.fy.removeAllViews();
        this.fy.addView(this.fA);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      throw new UnsupportedOperationException("onCreateView not allowed on MapViewDelegate");
    }

    public void onDestroy()
    {
      try
      {
        this.fz.onDestroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onDestroyView()
    {
      throw new UnsupportedOperationException("onDestroyView not allowed on MapViewDelegate");
    }

    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      throw new UnsupportedOperationException("onInflate not allowed on MapViewDelegate");
    }

    public void onLowMemory()
    {
      try
      {
        this.fz.onLowMemory();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onPause()
    {
      try
      {
        this.fz.onPause();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onResume()
    {
      try
      {
        this.fz.onResume();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onSaveInstanceState(Bundle paramBundle)
    {
      try
      {
        this.fz.onSaveInstanceState(paramBundle);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }

  static class b extends bb<MapView.a>
  {
    private final ViewGroup fB;
    private final GoogleMapOptions fC;
    protected be<MapView.a> fw;
    private final Context mContext;

    b(ViewGroup paramViewGroup, Context paramContext, GoogleMapOptions paramGoogleMapOptions)
    {
      this.fB = paramViewGroup;
      this.mContext = paramContext;
      this.fC = paramGoogleMapOptions;
    }

    protected void a(be<MapView.a> parambe)
    {
      this.fw = parambe;
      aP();
    }

    public void aP()
    {
      if ((this.fw != null) && (ag() == null));
      try
      {
        IMapViewDelegate localIMapViewDelegate = cw.g(this.mContext).a(bd.f(this.mContext), this.fC);
        this.fw.a(new MapView.a(this.fB, localIMapViewDelegate));
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
      {
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.maps.MapView
 * JD-Core Version:    0.6.2
 */