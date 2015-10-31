package com.crashlytics.android;

import android.content.Context;
import android.os.AsyncTask;
import java.io.File;

final class t extends AsyncTask<Void, Void, Void>
{
  t(Crashlytics paramCrashlytics, Context paramContext, float paramFloat, File paramFile)
  {
  }

  protected final void onPreExecute()
  {
    super.onPreExecute();
    Crashlytics.b(this.d).g();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.t
 * JD-Core Version:    0.6.2
 */