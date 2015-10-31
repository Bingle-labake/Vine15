package com.google.android.gms.maps;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.dynamic.LifecycleDelegate;
import com.google.android.gms.internal.bb;
import com.google.android.gms.internal.bc;
import com.google.android.gms.internal.bd;
import com.google.android.gms.internal.be;
import com.google.android.gms.internal.cl;
import com.google.android.gms.internal.cv;
import com.google.android.gms.internal.cw;
import com.google.android.gms.internal.x;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.IMapFragmentDelegate;
import com.google.android.gms.maps.model.RuntimeRemoteException;

public class MapFragment extends Fragment
{
  private final b fs = new b(this);
  private GoogleMap ft;

  public static MapFragment newInstance()
  {
    return new MapFragment();
  }

  public static MapFragment newInstance(GoogleMapOptions paramGoogleMapOptions)
  {
    MapFragment localMapFragment = new MapFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("MapOptions", paramGoogleMapOptions);
    localMapFragment.setArguments(localBundle);
    return localMapFragment;
  }

  protected IMapFragmentDelegate aO()
  {
    this.fs.aP();
    if (this.fs.ag() == null)
      return null;
    return ((a)this.fs.ag()).aO();
  }

  public final GoogleMap getMap()
  {
    IMapFragmentDelegate localIMapFragmentDelegate = aO();
    if (localIMapFragmentDelegate == null);
    while (true)
    {
      return null;
      try
      {
        IGoogleMapDelegate localIGoogleMapDelegate = localIMapFragmentDelegate.getMap();
        if (localIGoogleMapDelegate == null)
          continue;
        if ((this.ft == null) || (this.ft.aF().asBinder() != localIGoogleMapDelegate.asBinder()))
          this.ft = new GoogleMap(localIGoogleMapDelegate);
        return this.ft;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    b.a(this.fs, paramActivity);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.fs.onCreate(paramBundle);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return this.fs.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }

  public void onDestroy()
  {
    this.fs.onDestroy();
    super.onDestroy();
  }

  public void onDestroyView()
  {
    this.fs.onDestroyView();
    super.onDestroyView();
  }

  public void onInflate(Activity paramActivity, AttributeSet paramAttributeSet, Bundle paramBundle)
  {
    super.onInflate(paramActivity, paramAttributeSet, paramBundle);
    b.a(this.fs, paramActivity);
    GoogleMapOptions localGoogleMapOptions = GoogleMapOptions.createFromAttributes(paramActivity, paramAttributeSet);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("MapOptions", localGoogleMapOptions);
    this.fs.onInflate(paramActivity, localBundle, paramBundle);
  }

  public void onLowMemory()
  {
    this.fs.onLowMemory();
    super.onLowMemory();
  }

  public void onPause()
  {
    this.fs.onPause();
    super.onPause();
  }

  public void onResume()
  {
    super.onResume();
    this.fs.onResume();
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    this.fs.onSaveInstanceState(paramBundle);
    super.onSaveInstanceState(paramBundle);
  }

  public void setArguments(Bundle paramBundle)
  {
    super.setArguments(paramBundle);
  }

  static class a
    implements LifecycleDelegate
  {
    private final Fragment fu;
    private final IMapFragmentDelegate fv;

    public a(Fragment paramFragment, IMapFragmentDelegate paramIMapFragmentDelegate)
    {
      this.fv = ((IMapFragmentDelegate)x.d(paramIMapFragmentDelegate));
      this.fu = ((Fragment)x.d(paramFragment));
    }

    public IMapFragmentDelegate aO()
    {
      return this.fv;
    }

    public void onCreate(Bundle paramBundle)
    {
      if (paramBundle == null);
      try
      {
        paramBundle = new Bundle();
        Bundle localBundle = this.fu.getArguments();
        if ((localBundle != null) && (localBundle.containsKey("MapOptions")))
          cv.a(paramBundle, "MapOptions", localBundle.getParcelable("MapOptions"));
        this.fv.onCreate(paramBundle);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      try
      {
        bc localbc = this.fv.onCreateView(bd.f(paramLayoutInflater), bd.f(paramViewGroup), paramBundle);
        return (View)bd.a(localbc);
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onDestroy()
    {
      try
      {
        this.fv.onDestroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onDestroyView()
    {
      try
      {
        this.fv.onDestroyView();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      GoogleMapOptions localGoogleMapOptions = (GoogleMapOptions)paramBundle1.getParcelable("MapOptions");
      try
      {
        this.fv.onInflate(bd.f(paramActivity), localGoogleMapOptions, paramBundle2);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }

    public void onLowMemory()
    {
      try
      {
        this.fv.onLowMemory();
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
        this.fv.onPause();
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
        this.fv.onResume();
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
        this.fv.onSaveInstanceState(paramBundle);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }

  static class b extends bb<MapFragment.a>
  {
    private Activity ar;
    private final Fragment fu;
    protected be<MapFragment.a> fw;

    b(Fragment paramFragment)
    {
      this.fu = paramFragment;
    }

    private void setActivity(Activity paramActivity)
    {
      this.ar = paramActivity;
      aP();
    }

    protected void a(be<MapFragment.a> parambe)
    {
      this.fw = parambe;
      aP();
    }

    public void aP()
    {
      if ((this.ar != null) && (this.fw != null) && (ag() == null));
      try
      {
        MapsInitializer.initialize(this.ar);
        IMapFragmentDelegate localIMapFragmentDelegate = cw.g(this.ar).d(bd.f(this.ar));
        this.fw.a(new MapFragment.a(this.fu, localIMapFragmentDelegate));
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
 * Qualified Name:     com.google.android.gms.maps.MapFragment
 * JD-Core Version:    0.6.2
 */