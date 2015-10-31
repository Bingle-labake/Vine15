package com.google.android.gms.common;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.IntentSender.SendIntentException;
import com.google.android.gms.internal.w;
import com.google.android.gms.internal.w.a;

public final class ConnectionResult
{
  public static final ConnectionResult B = new ConnectionResult(0, null);
  public static final int DEVELOPER_ERROR = 10;
  public static final int INTERNAL_ERROR = 8;
  public static final int INVALID_ACCOUNT = 5;
  public static final int LICENSE_CHECK_FAILED = 11;
  public static final int NETWORK_ERROR = 7;
  public static final int RESOLUTION_REQUIRED = 6;
  public static final int SERVICE_DISABLED = 3;
  public static final int SERVICE_INVALID = 9;
  public static final int SERVICE_MISSING = 1;
  public static final int SERVICE_VERSION_UPDATE_REQUIRED = 2;
  public static final int SIGN_IN_REQUIRED = 4;
  public static final int SUCCESS;
  private final PendingIntent mPendingIntent;
  private final int p;

  public ConnectionResult(int paramInt, PendingIntent paramPendingIntent)
  {
    this.p = paramInt;
    this.mPendingIntent = paramPendingIntent;
  }

  private String e()
  {
    switch (this.p)
    {
    default:
      return "unknown status code " + this.p;
    case 0:
      return "SUCCESS";
    case 1:
      return "SERVICE_MISSING";
    case 2:
      return "SERVICE_VERSION_UPDATE_REQUIRED";
    case 3:
      return "SERVICE_DISABLED";
    case 4:
      return "SIGN_IN_REQUIRED";
    case 5:
      return "INVALID_ACCOUNT";
    case 6:
      return "RESOLUTION_REQUIRED";
    case 7:
      return "NETWORK_ERROR";
    case 8:
      return "INTERNAL_ERROR";
    case 9:
      return "SERVICE_INVALID";
    case 10:
    }
    return "DEVELOPER_ERROR";
  }

  public int getErrorCode()
  {
    return this.p;
  }

  public PendingIntent getResolution()
  {
    return this.mPendingIntent;
  }

  public boolean hasResolution()
  {
    return (this.p != 0) && (this.mPendingIntent != null);
  }

  public boolean isSuccess()
  {
    return this.p == 0;
  }

  public void startResolutionForResult(Activity paramActivity, int paramInt)
    throws IntentSender.SendIntentException
  {
    if (!hasResolution())
      return;
    paramActivity.startIntentSenderForResult(this.mPendingIntent.getIntentSender(), paramInt, null, 0, 0, 0);
  }

  public String toString()
  {
    return w.c(this).a("statusCode", e()).a("resolution", this.mPendingIntent).toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.common.ConnectionResult
 * JD-Core Version:    0.6.2
 */