package com.google.android.gms.common.images;

import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.ResultReceiver;
import android.util.Log;
import android.widget.ImageView;
import com.google.android.gms.internal.af;
import com.google.android.gms.internal.ba;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public final class ImageManager
{
  private static ImageManager ai;
  private final af<Uri, WeakReference<Drawable.ConstantState>> aj;
  private final Map<ListenerHolder, ImageReceiver> ak;
  private final Map<Uri, ImageReceiver> al;
  private final Context mContext;

  private ImageManager(Context paramContext)
  {
    this.mContext = paramContext.getApplicationContext();
    this.aj = new af(50);
    if (ba.ad())
      this.mContext.registerComponentCallbacks(new c(this.aj));
    this.ak = new HashMap();
    this.al = new HashMap();
  }

  private void a(ListenerHolder paramListenerHolder, Uri paramUri)
  {
    if (paramUri != null)
    {
      WeakReference localWeakReference = (WeakReference)this.aj.get(paramUri);
      if (localWeakReference != null)
      {
        Drawable.ConstantState localConstantState = (Drawable.ConstantState)localWeakReference.get();
        if (localConstantState != null)
          paramListenerHolder.handleCachedDrawable(paramUri, localConstantState.newDrawable());
      }
    }
    while (!paramListenerHolder.shouldLoadImage(paramUri))
      return;
    ImageReceiver localImageReceiver = (ImageReceiver)this.al.get(paramUri);
    if (localImageReceiver == null)
    {
      localImageReceiver = new ImageReceiver(paramUri);
      this.al.put(paramUri, localImageReceiver);
    }
    localImageReceiver.addOnImageLoadedListenerHolder(paramListenerHolder);
    this.ak.put(paramListenerHolder, localImageReceiver);
    Intent localIntent = new Intent("com.google.android.gms.common.images.LOAD_IMAGE");
    localIntent.putExtra("com.google.android.gms.extras.uri", paramUri);
    localIntent.putExtra("com.google.android.gms.extras.resultReceiver", localImageReceiver);
    localIntent.putExtra("com.google.android.gms.extras.priority", 3);
    this.mContext.sendBroadcast(localIntent);
  }

  public static ImageManager create(Context paramContext)
  {
    if (ai == null)
      ai = new ImageManager(paramContext);
    return ai;
  }

  public void loadImage(ImageView paramImageView, int paramInt)
  {
    loadImage(paramImageView, null, paramInt);
  }

  public void loadImage(ImageView paramImageView, Uri paramUri)
  {
    loadImage(paramImageView, paramUri, 0);
  }

  public void loadImage(ImageView paramImageView, Uri paramUri, int paramInt)
  {
    a(new b(paramImageView, paramInt, null), paramUri);
  }

  public void loadImage(OnImageLoadedListener paramOnImageLoadedListener, Uri paramUri)
  {
    loadImage(paramOnImageLoadedListener, paramUri, 0);
  }

  public void loadImage(OnImageLoadedListener paramOnImageLoadedListener, Uri paramUri, int paramInt)
  {
    a(new a(paramOnImageLoadedListener, paramInt, null), paramUri);
  }

  public final class ImageReceiver extends ResultReceiver
  {
    private final ArrayList<ImageManager.ListenerHolder> ao;
    private final Uri mUri;

    ImageReceiver(Uri arg2)
    {
      super();
      Object localObject;
      this.mUri = localObject;
      this.ao = new ArrayList();
    }

    public void addOnImageLoadedListenerHolder(ImageManager.ListenerHolder paramListenerHolder)
    {
      this.ao.add(paramListenerHolder);
    }

    public Uri getUri()
    {
      return this.mUri;
    }

    public void onReceiveResult(int paramInt, Bundle paramBundle)
    {
      ParcelFileDescriptor localParcelFileDescriptor = (ParcelFileDescriptor)paramBundle.getParcelable("com.google.android.gms.extra.fileDescriptor");
      Object localObject = null;
      Bitmap localBitmap;
      if (localParcelFileDescriptor != null)
        localBitmap = BitmapFactory.decodeFileDescriptor(localParcelFileDescriptor.getFileDescriptor());
      try
      {
        localParcelFileDescriptor.close();
        BitmapDrawable localBitmapDrawable = new BitmapDrawable(ImageManager.a(ImageManager.this).getResources(), localBitmap);
        ImageManager.b(ImageManager.this).put(this.mUri, new WeakReference(localBitmapDrawable.getConstantState()));
        localObject = localBitmapDrawable;
        ImageManager.c(ImageManager.this).remove(this.mUri);
        int i = this.ao.size();
        for (int j = 0; j < i; j++)
          ((ImageManager.ListenerHolder)this.ao.get(j)).onImageLoaded(this.mUri, localObject);
      }
      catch (IOException localIOException)
      {
        while (true)
          Log.e("ImageManager", "closed failed", localIOException);
      }
    }

    public void removeOnImageLoadedListenerHolder(ImageManager.ListenerHolder paramListenerHolder)
    {
      this.ao.remove(paramListenerHolder);
    }
  }

  abstract class ListenerHolder
    implements ImageManager.OnImageLoadedListener
  {
    protected final int mDefaultResId;
    protected final int mHashCode;

    private ListenerHolder(int paramInt1, int arg3)
    {
      this.mHashCode = paramInt1;
      int i;
      this.mDefaultResId = i;
    }

    public abstract void handleCachedDrawable(Uri paramUri, Drawable paramDrawable);

    public int hashCode()
    {
      return this.mHashCode;
    }

    public abstract void onImageLoaded(Uri paramUri, Drawable paramDrawable);

    public abstract boolean shouldLoadImage(Uri paramUri);
  }

  public static abstract interface OnImageLoadedListener
  {
    public abstract void onImageLoaded(Uri paramUri, Drawable paramDrawable);
  }

  final class a extends ImageManager.ListenerHolder
  {
    private final WeakReference<ImageManager.OnImageLoadedListener> am;

    private a(ImageManager.OnImageLoadedListener paramInt, int arg3)
    {
      super(paramInt.hashCode(), i, null);
      this.am = new WeakReference(paramInt);
    }

    public boolean equals(Object paramObject)
    {
      boolean bool1 = paramObject instanceof a;
      boolean bool2 = false;
      if (bool1)
      {
        a locala = (a)paramObject;
        WeakReference localWeakReference1 = this.am;
        bool2 = false;
        if (localWeakReference1 != null)
        {
          WeakReference localWeakReference2 = locala.am;
          bool2 = false;
          if (localWeakReference2 != null)
          {
            int i = this.mHashCode;
            int j = locala.mHashCode;
            bool2 = false;
            if (i == j)
              bool2 = true;
          }
        }
      }
      return bool2;
    }

    public void handleCachedDrawable(Uri paramUri, Drawable paramDrawable)
    {
      ImageManager.OnImageLoadedListener localOnImageLoadedListener = (ImageManager.OnImageLoadedListener)this.am.get();
      if (localOnImageLoadedListener != null)
        localOnImageLoadedListener.onImageLoaded(paramUri, paramDrawable);
    }

    public void onImageLoaded(Uri paramUri, Drawable paramDrawable)
    {
      ((ImageManager.ImageReceiver)ImageManager.d(ImageManager.this).remove(this));
      ImageManager.OnImageLoadedListener localOnImageLoadedListener = (ImageManager.OnImageLoadedListener)this.am.get();
      if (localOnImageLoadedListener != null)
        localOnImageLoadedListener.onImageLoaded(paramUri, paramDrawable);
    }

    public boolean shouldLoadImage(Uri paramUri)
    {
      if (paramUri == null)
      {
        ImageManager.OnImageLoadedListener localOnImageLoadedListener = (ImageManager.OnImageLoadedListener)this.am.get();
        if (localOnImageLoadedListener != null)
        {
          if (this.mDefaultResId != 0)
            break label36;
          localOnImageLoadedListener.onImageLoaded(paramUri, null);
        }
        while (true)
        {
          return false;
          label36: localOnImageLoadedListener.onImageLoaded(paramUri, ImageManager.a(ImageManager.this).getResources().getDrawable(this.mDefaultResId));
        }
      }
      return true;
    }
  }

  final class b extends ImageManager.ListenerHolder
  {
    private final WeakReference<ImageView> ap;

    private b(ImageView paramInt, int arg3)
    {
      super(paramInt.hashCode(), i, null);
      this.ap = new WeakReference(paramInt);
    }

    public boolean equals(Object paramObject)
    {
      boolean bool1 = paramObject instanceof b;
      boolean bool2 = false;
      if (bool1)
      {
        b localb = (b)paramObject;
        WeakReference localWeakReference1 = this.ap;
        bool2 = false;
        if (localWeakReference1 != null)
        {
          WeakReference localWeakReference2 = localb.ap;
          bool2 = false;
          if (localWeakReference2 != null)
          {
            int i = this.mHashCode;
            int j = localb.mHashCode;
            bool2 = false;
            if (i == j)
              bool2 = true;
          }
        }
      }
      return bool2;
    }

    public void handleCachedDrawable(Uri paramUri, Drawable paramDrawable)
    {
      ImageView localImageView = (ImageView)this.ap.get();
      if (localImageView != null)
        localImageView.setImageDrawable(paramDrawable);
      ImageManager.ImageReceiver localImageReceiver = (ImageManager.ImageReceiver)ImageManager.d(ImageManager.this).remove(this);
      if (localImageReceiver != null)
        localImageReceiver.removeOnImageLoadedListenerHolder(this);
    }

    public void onImageLoaded(Uri paramUri, Drawable paramDrawable)
    {
      ImageManager.ImageReceiver localImageReceiver = (ImageManager.ImageReceiver)ImageManager.d(ImageManager.this).remove(this);
      ImageView localImageView = (ImageView)this.ap.get();
      if (localImageView == null);
      while ((localImageReceiver == null) || (!localImageReceiver.getUri().equals(paramUri)))
        return;
      localImageView.setImageDrawable(paramDrawable);
    }

    public boolean shouldLoadImage(Uri paramUri)
    {
      ImageView localImageView = (ImageView)this.ap.get();
      if (localImageView != null)
      {
        if (this.mDefaultResId != 0)
          break label59;
        localImageView.setImageDrawable(null);
      }
      while (paramUri == null)
      {
        ImageManager.ImageReceiver localImageReceiver = (ImageManager.ImageReceiver)ImageManager.d(ImageManager.this).remove(this);
        if (localImageReceiver != null)
          localImageReceiver.removeOnImageLoadedListenerHolder(this);
        return false;
        label59: localImageView.setImageResource(this.mDefaultResId);
      }
      return true;
    }
  }

  static final class c
    implements ComponentCallbacks2
  {
    private final af<Uri, WeakReference<Drawable.ConstantState>> aq;

    public c(af<Uri, WeakReference<Drawable.ConstantState>> paramaf)
    {
      this.aq = paramaf;
    }

    public void onConfigurationChanged(Configuration paramConfiguration)
    {
    }

    public void onLowMemory()
    {
      this.aq.evictAll();
    }

    public void onTrimMemory(int paramInt)
    {
      if (paramInt >= 60)
        this.aq.evictAll();
      while (paramInt < 40)
        return;
      this.aq.trimToSize(this.aq.size() / 2);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.common.images.ImageManager
 * JD-Core Version:    0.6.2
 */