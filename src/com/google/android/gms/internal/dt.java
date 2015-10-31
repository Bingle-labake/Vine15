package com.google.android.gms.internal;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import android.widget.ImageView;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.plus.PlusClient;
import com.google.android.gms.plus.PlusClient.a;
import java.io.IOException;

public class dt extends ImageView
  implements GooglePlayServicesClient.ConnectionCallbacks, PlusClient.a
{
  private int gU;
  private boolean gV;
  private boolean gW;
  private Bitmap gX;
  private PlusClient gY;
  private Uri mUri;

  public dt(Context paramContext)
  {
    super(paramContext);
  }

  private static Bitmap a(Bitmap paramBitmap, int paramInt)
  {
    double d1 = paramBitmap.getWidth();
    double d2 = paramBitmap.getHeight();
    if (d1 > d2);
    for (double d3 = paramInt / d1; ; d3 = paramInt / d2)
      return Bitmap.createScaledBitmap(paramBitmap, (int)(0.5D + d1 * d3), (int)(0.5D + d3 * d2), true);
  }

  private void bc()
  {
    int i;
    if ((this.mUri != null) && ("android.resource".equals(this.mUri.getScheme())))
    {
      i = 1;
      if (this.gW)
        break label37;
    }
    label37: 
    do
    {
      return;
      i = 0;
      break;
      if (this.mUri == null)
      {
        setImageBitmap(null);
        return;
      }
    }
    while ((i == 0) && ((this.gY == null) || (!this.gY.isConnected())));
    if (i != 0)
      setImageURI(this.mUri);
    while (true)
    {
      this.gW = false;
      return;
      this.gY.a(this, this.mUri, this.gU);
    }
  }

  public void a(Uri paramUri, int paramInt)
  {
    boolean bool;
    if (this.mUri == null)
      if (paramUri == null)
        bool = true;
    while (true)
    {
      int i = this.gU;
      int j = 0;
      if (i == paramInt)
        j = 1;
      if ((!bool) || (j == 0))
        break;
      return;
      bool = false;
      continue;
      bool = this.mUri.equals(paramUri);
    }
    this.mUri = paramUri;
    this.gU = paramInt;
    this.gW = true;
    bc();
  }

  public void a(ConnectionResult paramConnectionResult, ParcelFileDescriptor paramParcelFileDescriptor)
  {
    if (!paramConnectionResult.isSuccess());
    do
    {
      return;
      this.gW = false;
    }
    while (paramParcelFileDescriptor == null);
    new a(this.gU).execute(new ParcelFileDescriptor[] { paramParcelFileDescriptor });
  }

  public void a(PlusClient paramPlusClient)
  {
    if (paramPlusClient != this.gY)
    {
      if ((this.gY != null) && (this.gY.isConnectionCallbacksRegistered(this)))
        this.gY.unregisterConnectionCallbacks(this);
      this.gY = paramPlusClient;
      this.gY.registerConnectionCallbacks(this);
    }
  }

  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    this.gV = true;
    if ((this.gY != null) && (!this.gY.isConnectionCallbacksRegistered(this)))
      this.gY.registerConnectionCallbacks(this);
    if (this.gX != null)
      setImageBitmap(this.gX);
  }

  public void onConnected(Bundle paramBundle)
  {
    bc();
  }

  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    this.gV = false;
    if ((this.gY != null) && (this.gY.isConnectionCallbacksRegistered(this)))
      this.gY.unregisterConnectionCallbacks(this);
  }

  public void onDisconnected()
  {
  }

  class a extends AsyncTask<ParcelFileDescriptor, Void, Bitmap>
  {
    private final int gU;

    a(int arg2)
    {
      int i;
      this.gU = i;
    }

    protected Bitmap a(ParcelFileDescriptor[] paramArrayOfParcelFileDescriptor)
    {
      ParcelFileDescriptor localParcelFileDescriptor = paramArrayOfParcelFileDescriptor[0];
      try
      {
        Bitmap localBitmap1 = BitmapFactory.decodeFileDescriptor(localParcelFileDescriptor.getFileDescriptor());
        if (this.gU > 0)
        {
          Bitmap localBitmap2 = dt.b(localBitmap1, this.gU);
          try
          {
            localParcelFileDescriptor.close();
            return localBitmap2;
          }
          catch (IOException localIOException3)
          {
            Log.e("PlusImageView", "closed failed", localIOException3);
            return localBitmap2;
          }
        }
        try
        {
          localParcelFileDescriptor.close();
          return localBitmap1;
        }
        catch (IOException localIOException2)
        {
          Log.e("PlusImageView", "closed failed", localIOException2);
          return localBitmap1;
        }
      }
      finally
      {
      }
      try
      {
        localParcelFileDescriptor.close();
        throw localObject;
      }
      catch (IOException localIOException1)
      {
        while (true)
          Log.e("PlusImageView", "closed failed", localIOException1);
      }
    }

    protected void b(Bitmap paramBitmap)
    {
      dt.a(dt.this, paramBitmap);
      if (dt.a(dt.this))
        dt.this.setImageBitmap(dt.b(dt.this));
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.dt
 * JD-Core Version:    0.6.2
 */