package com.google.android.gms.internal;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;

public class du
{
  Bundle dq;

  public du(Bundle paramBundle)
  {
    this.dq = paramBundle;
  }

  public boolean bd()
  {
    return this.dq.getBoolean("has_plus_one", false);
  }

  public String be()
  {
    return this.dq.getString("bubble_text");
  }

  public String[] bf()
  {
    return this.dq.getStringArray("inline_annotations");
  }

  public Uri[] bg()
  {
    Parcelable[] arrayOfParcelable = this.dq.getParcelableArray("profile_photo_uris");
    if (arrayOfParcelable == null)
      return null;
    Uri[] arrayOfUri = new Uri[arrayOfParcelable.length];
    System.arraycopy(arrayOfParcelable, 0, arrayOfUri, 0, arrayOfParcelable.length);
    return arrayOfUri;
  }

  public Intent getIntent()
  {
    return (Intent)this.dq.getParcelable("intent");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.du
 * JD-Core Version:    0.6.2
 */