package com.flurry.android;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import java.util.List;

abstract class az
  implements bq, k
{
  private static final String d = az.class.getSimpleName();

  private static boolean a(av paramav)
  {
    boolean bool1 = false;
    if (paramav == null);
    while (true)
    {
      return bool1;
      try
      {
        boolean bool2 = TextUtils.isEmpty(paramav.H());
        bool1 = false;
        if (!bool2)
        {
          Class.forName(paramav.H());
          bool1 = true;
        }
        if (bool1)
          continue;
        db.d(d, "Please consider to add to the project the library: " + paramav.F() + " version: " + paramav.G() + " or higher");
        return bool1;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        while (true)
        {
          db.a(6, d, "failed to find third party ad network api with exception: ", localClassNotFoundException);
          bool1 = false;
        }
      }
      catch (ExceptionInInitializerError localExceptionInInitializerError)
      {
        while (true)
        {
          db.a(6, d, "failed to initialize third party ad network api with exception: ", localExceptionInInitializerError);
          bool1 = false;
        }
      }
      catch (LinkageError localLinkageError)
      {
        while (true)
        {
          db.a(6, d, "failed to link third party ad network api with exception: ", localLinkageError);
          bool1 = false;
        }
      }
    }
  }

  protected abstract Bundle a(Context paramContext);

  public final ao a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit)
  {
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdUnit == null));
    Bundle localBundle;
    do
    {
      av localav;
      do
      {
        return null;
        localav = b();
      }
      while ((localav == null) || (!a(localav)));
      localBundle = a(paramContext);
    }
    while (localBundle == null);
    return a(paramContext, paramFlurryAds, paramcz, paramAdUnit, localBundle);
  }

  protected abstract ao a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit, Bundle paramBundle);

  protected abstract p a(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdCreative paramAdCreative, Bundle paramBundle);

  protected abstract av b();

  public final p b(Context paramContext, FlurryAds paramFlurryAds, cz paramcz, AdUnit paramAdUnit)
  {
    if ((paramContext == null) || (paramFlurryAds == null) || (paramcz == null) || (paramAdUnit == null))
      return null;
    av localav = c();
    if (localav == null)
      return null;
    if (!a(localav))
      return null;
    Bundle localBundle = a(paramContext);
    if (localBundle == null)
      return null;
    AdCreative localAdCreative;
    if (paramAdUnit == null)
      localAdCreative = null;
    while (localAdCreative == null)
    {
      return null;
      List localList = paramAdUnit.getAdFrames();
      if ((localList == null) || (localList.isEmpty()))
      {
        localAdCreative = null;
      }
      else
      {
        AdFrame localAdFrame = (AdFrame)localList.get(0);
        if (localAdFrame == null)
        {
          localAdCreative = null;
        }
        else
        {
          AdSpaceLayout localAdSpaceLayout = localAdFrame.getAdSpaceLayout();
          if (localAdSpaceLayout == null)
            localAdCreative = null;
          else
            localAdCreative = cx.b(localAdSpaceLayout);
        }
      }
    }
    return a(paramContext, paramFlurryAds, paramcz, localAdCreative, localBundle);
  }

  protected abstract av c();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.az
 * JD-Core Version:    0.6.2
 */