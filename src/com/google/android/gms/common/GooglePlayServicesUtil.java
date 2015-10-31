package com.google.android.gms.common;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.util.Base64;
import android.util.Log;
import com.google.android.gms.R.string;
import com.google.android.gms.internal.ba;
import com.google.android.gms.internal.o;
import com.google.android.gms.internal.r;

public final class GooglePlayServicesUtil
{
  private static final byte[][] C;
  private static final byte[][] D;
  private static final byte[][] E;
  private static final byte[][] F;
  private static final byte[][] G = arrayOfByte4;
  public static final String GOOGLE_PLAY_SERVICES_PACKAGE = "com.google.android.gms";
  public static final int GOOGLE_PLAY_SERVICES_VERSION_CODE = 3136100;
  public static final String GOOGLE_PLAY_STORE_PACKAGE = "com.android.vending";
  static boolean H = false;
  static boolean I = false;
  static boolean J = false;

  static
  {
    byte[][] arrayOfByte1 = new byte[2][];
    arrayOfByte1[0] = Base64.decode("MIIEQzCCAyugAwIBAgIJAMLgh0ZkSjCNMA0GCSqGSIb3DQEBBAUAMHQxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtHb29nbGUgSW5jLjEQMA4GA1UECxMHQW5kcm9pZDEQMA4GA1UEAxMHQW5kcm9pZDAeFw0wODA4MjEyMzEzMzRaFw0zNjAxMDcyMzEzMzRaMHQxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtHb29nbGUgSW5jLjEQMA4GA1UECxMHQW5kcm9pZDEQMA4GA1UEAxMHQW5kcm9pZDCCASAwDQYJKoZIhvcNAQEBBQADggENADCCAQgCggEBAKtWLgDYO6IIrgqWbxJOKdoR8qtW0I9Y4sypEwPpt1TTcvZApxsdyxMJZ2JORland2qSGT2y5b+3JKkedxiLDmpHpDsz2WCbdxgxRczfey5YZnTJ4VZbH0xqWVW/8lGmPav5xVwnIiJS6HXk+BVKZF+JcWjAsb/GEuq/eFdpuzSqeYTcfi6idkyugwfYwXFU1+5fZKUaRKYCwkkFQVfcAs1fXA5V+++FGfvjJ/CxURaSxaBvGdGDhfXE28LWuT9ozCl5xw4Yq5OGazvV24mZVSoOO0yZ31j7kYvtwYK6NeADwbSxDdJEqO4k//0zOHKrUiGYXtqw/A0LFFtqoZKFjnkCAQOjgdkwgdYwHQYDVR0OBBYEFMd9jMIhF1Ylmn/Tgt9r45jk14alMIGmBgNVHSMEgZ4wgZuAFMd9jMIhF1Ylmn/Tgt9r45jk14aloXikdjB0MQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLR29vZ2xlIEluYy4xEDAOBgNVBAsTB0FuZHJvaWQxEDAOBgNVBAMTB0FuZHJvaWSCCQDC4IdGZEowjTAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBAUAA4IBAQBt0lLO74UwLDYKqs6Tm8/yzKkEu116FmH4rkaymUIE0P9KaMftGlMexFlaYjzmB2OxZyl6euNXEsQH8gjwyxCUKRJNexBiGcCEyj6z+a1fuHHvkiaai+KL8W1EyNmgjmyy8AW7P+LLlkR+ho5zEHatRbM/YAnqGcFh5iZBqpknHf1SKMXFh4dd239FJ1jWYfbMDMy3NS5CTMQ2XFI1MvcyUTdZPErjQfTbQe3aDQsQcafEQPD+nqActifKZ0Np0IS9L9kR/wbNvyz6ENwPiTrjV2KRkEjH78ZMcUQXg0L3BYHJ3lc69Vs5Ddf9uUGGMYldX3WfMBEmh/9iFBDAaTCK", 0);
    arrayOfByte1[1] = Base64.decode("MIIEqDCCA5CgAwIBAgIJANWFuGx90071MA0GCSqGSIb3DQEBBAUAMIGUMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEQMA4GA1UEChMHQW5kcm9pZDEQMA4GA1UECxMHQW5kcm9pZDEQMA4GA1UEAxMHQW5kcm9pZDEiMCAGCSqGSIb3DQEJARYTYW5kcm9pZEBhbmRyb2lkLmNvbTAeFw0wODA0MTUyMzM2NTZaFw0zNTA5MDEyMzM2NTZaMIGUMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEQMA4GA1UEChMHQW5kcm9pZDEQMA4GA1UECxMHQW5kcm9pZDEQMA4GA1UEAxMHQW5kcm9pZDEiMCAGCSqGSIb3DQEJARYTYW5kcm9pZEBhbmRyb2lkLmNvbTCCASAwDQYJKoZIhvcNAQEBBQADggENADCCAQgCggEBANbOLggKv+IxTdGNs8/TGFy0PTP6DHThvbbR24kT9ixcOd9W+EaBPWW+wPPKQmsHxajtWjmQwWfna8mZuSeJS48LIgAZlKkpFeVyxW0qMBujb8X8ETrWy550NaFtI6t9+u7hZeTfHwqNvacKhp1RbE6dBRGWynwMVX8XW8N1+UjFaq6GCJukT4qmpN2afb8sCjUigq0GuMwYXrFVee74bQgLHWGJwPmvmLHC69EH6kWr22ijx4OKXlSIx2xT1AsSHee70w5iDBiK4aph27yH3TxkXy9V89TDdexAcKk/cVHYNnDBapcavl7y0RiQ4biu8ymM8Ga/nmzhRKya6G0cGw8CAQOjgfwwgfkwHQYDVR0OBBYEFI0cxb6VTEM8YYY6FbBMvAPyT+CyMIHJBgNVHSMEgcEwgb6AFI0cxb6VTEM8YYY6FbBMvAPyT+CyoYGapIGXMIGUMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEQMA4GA1UEChMHQW5kcm9pZDEQMA4GA1UECxMHQW5kcm9pZDEQMA4GA1UEAxMHQW5kcm9pZDEiMCAGCSqGSIb3DQEJARYTYW5kcm9pZEBhbmRyb2lkLmNvbYIJANWFuGx90071MAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEEBQADggEBABnTDPEF+3iSP0wNfdIjIz1AlnrPzgAIHVvXxunW7SBrDhEglQZBbKJEk5kT0mtKoOD1JMrSu1xuTKEBahWRbqHsXclaXjoBADb0kkjVEJu/Lh5hgYZnOjvlba8Ld7HCKePCVePoTJBdI4fvugnL8TsgK05aIskyY0hKI9L8KfqfGTl1lzOv2KoWD0KWwtAWPoGChZxmQ+nBli+gwYMzM1vAkP+aayLe0a1EQimlOalO762r0GXO0ks+UeXde2Z4e+8S/pf7pITEI/tP+MxJTALw9QUWEv9lKTk+jkbqxbsh8nfBUapfKqYn0eidpwq2AzVp3juYl7//fKnaPhJD9gs=", 0);
    C = arrayOfByte1;
    byte[][] arrayOfByte2 = new byte[2][];
    arrayOfByte2[0] = Base64.decode("MIICUjCCAbsCBEk0mH4wDQYJKoZIhvcNAQEEBQAwcDELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtHb29nbGUsIEluYzEUMBIGA1UECxMLR29vZ2xlLCBJbmMxEDAOBgNVBAMTB1Vua25vd24wHhcNMDgxMjAyMDIwNzU4WhcNMzYwNDE5MDIwNzU4WjBwMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC0dvb2dsZSwgSW5jMRQwEgYDVQQLEwtHb29nbGUsIEluYzEQMA4GA1UEAxMHVW5rbm93bjCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAn0gDGZD5sUcmOE4EU9GPjAu/jcd7JQSksSB8TGxEurwArcZhD6a2qy2oDjPy7vFrJqP2uFua+sqQn/u+s/TJT36BIqeY4OunXO090in6c2X0FRZBWqnBYX3Vg84Zuuigu9iF/BeptL0mQIBRIarbk3fetAATOBQYiC7FIoL8WA0CAwEAATANBgkqhkiG9w0BAQQFAAOBgQBAhmae1jHaQ4Td0GHSJuBzuYzEuZ34teS+njy+l1Aeg98cb6lZwM5gXE/SrG0chM7eIEdsurGb6PIgOv93F61lLY/MiQcI0SFtqERXWSZJ4OnTxLtM9Y2hnbHU/EG8uVhPZOZfQQ0FKf1baIOMFB0Km9HbEZHLKg33kOoMsS2zpA==", 0);
    arrayOfByte2[1] = Base64.decode("MIIEqDCCA5CgAwIBAgIJAIR+T/LWtd6OMA0GCSqGSIb3DQEBBQUAMIGUMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEQMA4GA1UEChMHQW5kcm9pZDEQMA4GA1UECxMHQW5kcm9pZDEQMA4GA1UEAxMHQW5kcm9pZDEiMCAGCSqGSIb3DQEJARYTYW5kcm9pZEBhbmRyb2lkLmNvbTAeFw0xMDAxMjAwMTAxMzVaFw0zNzA2MDcwMTAxMzVaMIGUMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEQMA4GA1UEChMHQW5kcm9pZDEQMA4GA1UECxMHQW5kcm9pZDEQMA4GA1UEAxMHQW5kcm9pZDEiMCAGCSqGSIb3DQEJARYTYW5kcm9pZEBhbmRyb2lkLmNvbTCCASAwDQYJKoZIhvcNAQEBBQADggENADCCAQgCggEBANgocXw20RcP1E0Kew8HESboW7/fM7A0YABalMz7ZaXboLJD32Cxkb+dBt8dilwKM+LRY/UT3x0iU0HqPDN5IuhcAuw0ztlMuAcjpiP/S6/7tOXv5nc7PqK+uLyyAmfP54VRH4Mu+YerdZT+HinPvE0IOh8SUgB3c5byFltpewCjoME6zDCKk/IhY8FunD1KshSfNkxFwEMUMnA58doJYJPxs/wYtlYQlcYiX8cQK5h8bxOkXSTj4MVOhZ1n41tnCCcT0tbwV900V9GfxP6N3eyMOk8/lyMFGacKKDY0rDWBo0q9oX2EWgoJhfv4BgsDaid4YIFj+gw3uefyoQ52vHcCAQOjgfwwgfkwHQYDVR0OBBYEFLXH+RJveA06+8plc3M/9SJrmxc3MIHJBgNVHSMEgcEwgb6AFLXH+RJveA06+8plc3M/9SJrmxc3oYGapIGXMIGUMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEQMA4GA1UEChMHQW5kcm9pZDEQMA4GA1UECxMHQW5kcm9pZDEQMA4GA1UEAxMHQW5kcm9pZDEiMCAGCSqGSIb3DQEJARYTYW5kcm9pZEBhbmRyb2lkLmNvbYIJAIR+T/LWtd6OMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADggEBAEw+p2V9Jua71xEMjxnfH42hCX0zhg9p3r/K20ajfoflsw+7NHscdVW8uzyZVBSARpZfnHkqAtDb5aZHYbN5R6tr/7C6xqLBoM34Yvh3qWcN/W8GLkBuzhgGDGBJjfw2nycRcZjlb8uhUuYFjc6UzlkfxPSpmCszutgZbXdvVbfQGs8x3dcM7LeJeHYGZRD5SaVSSjExs8tlQc+LNUIOvMRSJVmWP0JmaQVyZmJPs5jP21IXiB0RHG4DRhb4USEY0KKmnRPXkvDNEdvVjiODWlSlSsJR59IsRGo/7hQSEOlER0tAYwe7JoQrT2vTVYIcc5ZR/6JgWwXiJJXXFdh6kfY=", 0);
    D = arrayOfByte2;
    byte[][] arrayOfByte3 = new byte[1][];
    arrayOfByte3[0] = Base64.decode("MIICpzCCAmWgAwIBAgIEUAV8QjALBgcqhkjOOAQDBQAwNzELMAkGA1UEBhMCVVMxEDAOBgNVBAoTB0FuZHJvaWQxFjAUBgNVBAMTDUFuZHJvaWQgRGVidWcwHhcNMTIwNzE3MTQ1MjUwWhcNMjIwNzE1MTQ1MjUwWjA3MQswCQYDVQQGEwJVUzEQMA4GA1UEChMHQW5kcm9pZDEWMBQGA1UEAxMNQW5kcm9pZCBEZWJ1ZzCCAbcwggEsBgcqhkjOOAQBMIIBHwKBgQD9f1OBHXUSKVLfSpwu7OTn9hG3UjzvRADDHj+AtlEmaUVdQCJR+1k9jVj6v8X1ujD2y5tVbNeBO4AdNG/yZmC3a5lQpaSfn+gEexAiwk+7qdf+t8Yb+DtX58aophUPBPuD9tPFHsMCNVQTWhaRMvZ1864rYdcq7/IiAxmd0UgBxwIVAJdgUI8VIwvMspK5gqLrhAvwWBz1AoGBAPfhoIXWmz3ey7yrXDa4V7l5lK+7+jrqgvlXTAs9B4JnUVlXjrrUWU/mcQcQgYC0SRZxI+hMKBYTt88JMozIpuE8FnqLVHyNKOCjrh4rs6Z1kW6jfwv6ITVi8ftiegEkO8yk8b6oUZCJqIPf4VrlnwaSi2ZegHtVJWQBTDv+z0kqA4GEAAKBgGrRG9fVZtJ69DnALkForP1FtL6FvJmMe5uOHHdUaT+MDUKKpPzhEISBOEJPpozRMFJO7/bxNzhjgi+mNymL/k1GoLhmZe7wQRc5AQNbHIBqoxgYDTA6qMyeWSPgam+r+nVoPEU7sgd3fPL958+xmxQwOBSqHfe0PVsiK1cGtIuUMAsGByqGSM44BAMFAAMvADAsAhQJ0tGwRwIptb7SkCZh0RLycMXmHQIUZ1ACBqeAULp4rscXTxYEf4Tqovc=", 0);
    E = arrayOfByte3;
    byte[][][] arrayOfByte = new byte[3][][];
    arrayOfByte[0] = C;
    arrayOfByte[1] = D;
    arrayOfByte[2] = E;
    F = a(arrayOfByte);
    byte[][] arrayOfByte4 = new byte[1][];
    arrayOfByte4[0] = Base64.decode("MIICXzCCAcigAwIBAgIESxmxnTANBgkqhkiG9w0BAQUFADB0MQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEVMBMGA1UEChMMR29vZ2xlLCBJbmMuMRAwDgYDVQQLEwdVbmtub3duMQ8wDQYDVQQDEwZCYXphYXIwHhcNMDkxMjA1MDEwNDI5WhcNMzcwNDIyMDEwNDI5WjB0MQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEVMBMGA1UEChMMR29vZ2xlLCBJbmMuMRAwDgYDVQQLEwdVbmtub3duMQ8wDQYDVQQDEwZCYXphYXIwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAKkIiN6W4zU0dwndSyUeeimoRzdrLly6W1vVBD6DiAECmBkUlBP6M6rlRDsDU0rOSq1vUJcSSdmOdqOafkzM4dcbp74+dWdNtfEHWphzcAFGSKfOcDwtx4g0iQWSEq+cbFsoq9VPg2QRyDGin1APKALRbObRhW+GcKr8omVBg3s5AgMBAAEwDQYJKoZIhvcNAQEFBQADgYEASYTG80FHASNiOidP6eE3PXUxzA386adq5n/7cFtATL0bwRaMqxi7EcN4lb+082zBTOwdLMVRag7O1AdOtWiCiVBkAK/43MjvVAQSAv3v8f2C4PMjEHL9zN5KNovgxsP5uLOqDWg8Or/amre7iDLpvl42GbqS3TrMA2qttaYZr1A=", 0);
  }

  public static Dialog a(int paramInt1, Activity paramActivity, int paramInt2, DialogInterface.OnCancelListener paramOnCancelListener, int paramInt3)
  {
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(paramActivity).setMessage(b(paramActivity, paramInt1, paramInt3));
    if (paramOnCancelListener != null)
      localBuilder.setOnCancelListener(paramOnCancelListener);
    o localo = new o(paramActivity, a(paramActivity, paramInt1, paramInt3), paramInt2);
    String str = a(paramActivity, paramInt1);
    if (str != null)
      localBuilder.setPositiveButton(str, localo);
    AlertDialog localAlertDialog = null;
    switch (paramInt1)
    {
    default:
      throw new IllegalArgumentException("Unexpected errorCode " + paramInt1);
    case 1:
      localAlertDialog = localBuilder.setTitle(R.string.common_google_play_services_install_title).create();
    case 0:
    case 4:
    case 6:
      return localAlertDialog;
    case 3:
      return localBuilder.setTitle(R.string.common_google_play_services_enable_title).create();
    case 2:
      return localBuilder.setTitle(R.string.common_google_play_services_update_title).create();
    case 9:
      Log.e("GooglePlayServicesUtil", "Google Play services is invalid. Cannot recover.");
      return localBuilder.setTitle(R.string.common_google_play_services_unsupported_title).create();
    case 7:
      Log.e("GooglePlayServicesUtil", "Network error occurred. Please retry request later.");
      return null;
    case 8:
      Log.e("GooglePlayServicesUtil", "Internal error occurred. Please see logs for detailed information");
      return null;
    case 10:
      Log.e("GooglePlayServicesUtil", "Developer error occurred. Please see logs for detailed information");
      return null;
    case 5:
      Log.e("GooglePlayServicesUtil", "An invalid account was specified when connecting. Please provide a valid account.");
      return null;
    case 11:
    }
    Log.e("GooglePlayServicesUtil", "The application is not licensed to the user.");
    return null;
  }

  public static Intent a(Context paramContext, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
      return null;
    case 1:
    case 2:
      if (b(paramInt2))
      {
        if (c(paramContext))
          return r.h("com.google.android.gms");
        return r.g("com.google.android.apps.bazaar");
      }
      return r.g("com.google.android.gms");
    case 3:
    }
    return r.e("com.google.android.gms");
  }

  public static String a(Context paramContext, int paramInt)
  {
    Resources localResources = paramContext.getResources();
    switch (paramInt)
    {
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    default:
      return null;
    case 1:
      return localResources.getString(R.string.common_google_play_services_install_button);
    case 3:
      return localResources.getString(R.string.common_google_play_services_enable_button);
    case 2:
      return localResources.getString(R.string.common_google_play_services_update_button);
    case 9:
    }
    return localResources.getString(17039370);
  }

  public static boolean a(Resources paramResources)
  {
    if ((0xF & paramResources.getConfiguration().screenLayout) > 3);
    for (int i = 1; ; i = 0)
    {
      boolean bool2;
      if ((!ba.aa()) || (i == 0))
      {
        boolean bool1 = b(paramResources);
        bool2 = false;
        if (!bool1);
      }
      else
      {
        bool2 = true;
      }
      return bool2;
    }
  }

  // ERROR //
  private static byte[] a(PackageInfo paramPackageInfo, byte[][] paramArrayOfByte)
  {
    // Byte code:
    //   0: ldc 234
    //   2: invokestatic 240	java/security/cert/CertificateFactory:getInstance	(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;
    //   5: astore 4
    //   7: aload_0
    //   8: getfield 246	android/content/pm/PackageInfo:signatures	[Landroid/content/pm/Signature;
    //   11: arraylength
    //   12: iconst_1
    //   13: if_icmpeq +24 -> 37
    //   16: ldc 144
    //   18: ldc 248
    //   20: invokestatic 251	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   23: pop
    //   24: aconst_null
    //   25: areturn
    //   26: astore_2
    //   27: ldc 144
    //   29: ldc 253
    //   31: invokestatic 251	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   34: pop
    //   35: aconst_null
    //   36: areturn
    //   37: new 255	java/io/ByteArrayInputStream
    //   40: dup
    //   41: aload_0
    //   42: getfield 246	android/content/pm/PackageInfo:signatures	[Landroid/content/pm/Signature;
    //   45: iconst_0
    //   46: aaload
    //   47: invokevirtual 261	android/content/pm/Signature:toByteArray	()[B
    //   50: invokespecial 264	java/io/ByteArrayInputStream:<init>	([B)V
    //   53: astore 5
    //   55: aload 4
    //   57: aload 5
    //   59: invokevirtual 268	java/security/cert/CertificateFactory:generateCertificate	(Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    //   62: checkcast 270	java/security/cert/X509Certificate
    //   65: astore 8
    //   67: aload 8
    //   69: invokevirtual 273	java/security/cert/X509Certificate:checkValidity	()V
    //   72: aload_0
    //   73: getfield 246	android/content/pm/PackageInfo:signatures	[Landroid/content/pm/Signature;
    //   76: iconst_0
    //   77: aaload
    //   78: invokevirtual 261	android/content/pm/Signature:toByteArray	()[B
    //   81: astore 13
    //   83: iconst_0
    //   84: istore 14
    //   86: iload 14
    //   88: aload_1
    //   89: arraylength
    //   90: if_icmpge +67 -> 157
    //   93: aload_1
    //   94: iload 14
    //   96: aaload
    //   97: astore 16
    //   99: aload 16
    //   101: aload 13
    //   103: invokestatic 279	java/util/Arrays:equals	([B[B)Z
    //   106: ifeq +45 -> 151
    //   109: aload 16
    //   111: areturn
    //   112: astore 6
    //   114: ldc 144
    //   116: ldc_w 281
    //   119: invokestatic 251	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   122: pop
    //   123: aconst_null
    //   124: areturn
    //   125: astore 11
    //   127: ldc 144
    //   129: ldc_w 283
    //   132: invokestatic 251	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   135: pop
    //   136: aconst_null
    //   137: areturn
    //   138: astore 9
    //   140: ldc 144
    //   142: ldc_w 285
    //   145: invokestatic 251	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   148: pop
    //   149: aconst_null
    //   150: areturn
    //   151: iinc 14 1
    //   154: goto -68 -> 86
    //   157: ldc 144
    //   159: iconst_2
    //   160: invokestatic 289	android/util/Log:isLoggable	(Ljava/lang/String;I)Z
    //   163: ifeq +34 -> 197
    //   166: ldc 144
    //   168: new 106	java/lang/StringBuilder
    //   171: dup
    //   172: invokespecial 107	java/lang/StringBuilder:<init>	()V
    //   175: ldc_w 291
    //   178: invokevirtual 113	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   181: aload 13
    //   183: iconst_0
    //   184: invokestatic 295	android/util/Base64:encodeToString	([BI)Ljava/lang/String;
    //   187: invokevirtual 113	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   190: invokevirtual 120	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   193: invokestatic 298	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   196: pop
    //   197: aconst_null
    //   198: areturn
    //
    // Exception table:
    //   from	to	target	type
    //   0	7	26	java/security/cert/CertificateException
    //   55	67	112	java/security/cert/CertificateException
    //   67	72	125	java/security/cert/CertificateExpiredException
    //   67	72	138	java/security/cert/CertificateNotYetValidException
  }

  private static byte[][] a(byte[][][] paramArrayOfByte)
  {
    int i = paramArrayOfByte.length;
    int j = 0;
    int k = 0;
    while (j < i)
    {
      k += paramArrayOfByte[j].length;
      j++;
    }
    byte[][] arrayOfByte = new byte[k][];
    int m = paramArrayOfByte.length;
    int n = 0;
    int i2;
    for (int i1 = 0; n < m; i1 = i2)
    {
      byte[][] arrayOfByte1 = paramArrayOfByte[n];
      i2 = i1;
      int i3 = 0;
      while (i3 < arrayOfByte1.length)
      {
        int i4 = i2 + 1;
        arrayOfByte[i2] = arrayOfByte1[i3];
        i3++;
        i2 = i4;
      }
      n++;
    }
    return arrayOfByte;
  }

  public static String b(Context paramContext, int paramInt1, int paramInt2)
  {
    Resources localResources = paramContext.getResources();
    String str = localResources.getString(R.string.common_google_play_services_unknown_issue);
    switch (paramInt1)
    {
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    default:
    case 1:
    case 3:
    case 2:
      do
      {
        return str;
        if (a(paramContext.getResources()));
        for (str = localResources.getString(R.string.common_google_play_services_install_text_tablet); b(paramInt2); str = localResources.getString(R.string.common_google_play_services_install_text_phone))
          return str + " (via Bazaar)";
        return localResources.getString(R.string.common_google_play_services_enable_text);
        str = localResources.getString(R.string.common_google_play_services_update_text);
      }
      while (!b(paramInt2));
      return str + " (via Bazaar)";
    case 9:
    }
    return localResources.getString(R.string.common_google_play_services_unsupported_text);
  }

  static boolean b(int paramInt)
  {
    boolean bool = true;
    switch (c(paramInt))
    {
    default:
      bool = false;
    case 1:
    case 0:
      do
        return bool;
      while (!f());
      return false;
    case 2:
    }
    return false;
  }

  private static boolean b(Resources paramResources)
  {
    Configuration localConfiguration = paramResources.getConfiguration();
    boolean bool1 = ba.ac();
    boolean bool2 = false;
    if (bool1)
    {
      int i = 0xF & localConfiguration.screenLayout;
      bool2 = false;
      if (i <= 3)
      {
        int j = localConfiguration.smallestScreenWidthDp;
        bool2 = false;
        if (j >= 600)
          bool2 = true;
      }
    }
    return bool2;
  }

  private static int c(int paramInt)
  {
    if (paramInt == -1)
      paramInt = 2;
    return paramInt;
  }

  private static boolean c(Context paramContext)
  {
    boolean bool;
    if (H)
      bool = J;
    while (true)
    {
      return bool;
      try
      {
        byte[] arrayOfByte = a(paramContext.getPackageManager().getPackageInfo("com.google.android.apps.bazaar", 64), G);
        bool = false;
        if (arrayOfByte != null)
          return true;
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
      }
    }
    return false;
  }

  private static boolean f()
  {
    if (H)
      return I;
    return "user".equals(Build.TYPE);
  }

  public static Dialog getErrorDialog(int paramInt1, Activity paramActivity, int paramInt2)
  {
    return a(paramInt1, paramActivity, paramInt2, null, -1);
  }

  public static Dialog getErrorDialog(int paramInt1, Activity paramActivity, int paramInt2, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    return a(paramInt1, paramActivity, paramInt2, paramOnCancelListener, -1);
  }

  public static PendingIntent getErrorPendingIntent(int paramInt1, Context paramContext, int paramInt2)
  {
    Intent localIntent = a(paramContext, paramInt1, -1);
    if (localIntent == null)
      return null;
    return PendingIntent.getActivity(paramContext, paramInt2, localIntent, 268435456);
  }

  public static String getErrorString(int paramInt)
  {
    switch (paramInt)
    {
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    default:
      return "UNKNOWN_ERROR_CODE";
    case 0:
      return "SUCCESS";
    case 1:
      return "SERVICE_MISSING";
    case 2:
      return "SERVICE_VERSION_UPDATE_REQUIRED";
    case 3:
      return "SERVICE_DISABLED";
    case 9:
    }
    return "SERVICE_INVALID";
  }

  // ERROR //
  public static String getOpenSourceSoftwareLicenseInfo(Context paramContext)
  {
    // Byte code:
    //   0: new 393	android/net/Uri$Builder
    //   3: dup
    //   4: invokespecial 394	android/net/Uri$Builder:<init>	()V
    //   7: ldc_w 396
    //   10: invokevirtual 400	android/net/Uri$Builder:scheme	(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   13: ldc 14
    //   15: invokevirtual 403	android/net/Uri$Builder:authority	(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   18: ldc_w 405
    //   21: invokevirtual 408	android/net/Uri$Builder:appendPath	(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   24: ldc_w 410
    //   27: invokevirtual 408	android/net/Uri$Builder:appendPath	(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   30: invokevirtual 414	android/net/Uri$Builder:build	()Landroid/net/Uri;
    //   33: astore_1
    //   34: aload_0
    //   35: invokevirtual 418	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   38: aload_1
    //   39: invokevirtual 424	android/content/ContentResolver:openInputStream	(Landroid/net/Uri;)Ljava/io/InputStream;
    //   42: astore 4
    //   44: new 426	java/util/Scanner
    //   47: dup
    //   48: aload 4
    //   50: invokespecial 429	java/util/Scanner:<init>	(Ljava/io/InputStream;)V
    //   53: ldc_w 431
    //   56: invokevirtual 435	java/util/Scanner:useDelimiter	(Ljava/lang/String;)Ljava/util/Scanner;
    //   59: invokevirtual 438	java/util/Scanner:next	()Ljava/lang/String;
    //   62: astore 7
    //   64: aload 7
    //   66: astore_3
    //   67: aload 4
    //   69: ifnull +43 -> 112
    //   72: aload 4
    //   74: invokevirtual 443	java/io/InputStream:close	()V
    //   77: aload_3
    //   78: areturn
    //   79: astore 6
    //   81: aload 4
    //   83: ifnull +31 -> 114
    //   86: aload 4
    //   88: invokevirtual 443	java/io/InputStream:close	()V
    //   91: goto +23 -> 114
    //   94: astore 5
    //   96: aload 4
    //   98: ifnull +8 -> 106
    //   101: aload 4
    //   103: invokevirtual 443	java/io/InputStream:close	()V
    //   106: aload 5
    //   108: athrow
    //   109: astore_2
    //   110: aconst_null
    //   111: astore_3
    //   112: aload_3
    //   113: areturn
    //   114: aconst_null
    //   115: areturn
    //
    // Exception table:
    //   from	to	target	type
    //   44	64	79	java/util/NoSuchElementException
    //   44	64	94	finally
    //   34	44	109	java/lang/Exception
    //   72	77	109	java/lang/Exception
    //   86	91	109	java/lang/Exception
    //   101	106	109	java/lang/Exception
    //   106	109	109	java/lang/Exception
  }

  public static Context getRemoteContext(Context paramContext)
  {
    try
    {
      Context localContext = paramContext.createPackageContext("com.google.android.gms", 3);
      return localContext;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
    }
    return null;
  }

  public static Resources getRemoteResource(Context paramContext)
  {
    try
    {
      Resources localResources = paramContext.getPackageManager().getResourcesForApplication("com.google.android.gms");
      return localResources;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
    }
    return null;
  }

  public static int isGooglePlayServicesAvailable(Context paramContext)
  {
    PackageManager localPackageManager = paramContext.getPackageManager();
    byte[] arrayOfByte;
    try
    {
      PackageInfo localPackageInfo1 = localPackageManager.getPackageInfo("com.android.vending", 64);
      arrayOfByte = a(localPackageInfo1, C);
      if (arrayOfByte == null)
      {
        Log.w("GooglePlayServicesUtil", "Google Play Store signature invalid.");
        return 9;
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException1)
    {
      Log.w("GooglePlayServicesUtil", "Google Play Store is missing.");
      return 1;
    }
    PackageInfo localPackageInfo2;
    try
    {
      localPackageInfo2 = localPackageManager.getPackageInfo("com.google.android.gms", 64);
      if (a(localPackageInfo2, new byte[][] { arrayOfByte }) == null)
      {
        Log.w("GooglePlayServicesUtil", "Google Play services signature invalid.");
        return 9;
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException2)
    {
      Log.w("GooglePlayServicesUtil", "Google Play services is missing.");
      return 1;
    }
    if (localPackageInfo2.versionCode < 3136100)
    {
      Log.w("GooglePlayServicesUtil", "Google Play services out of date.  Requires 3136100 but found " + localPackageInfo2.versionCode);
      return 2;
    }
    try
    {
      ApplicationInfo localApplicationInfo = localPackageManager.getApplicationInfo("com.google.android.gms", 0);
      if (!localApplicationInfo.enabled)
        return 3;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException3)
    {
      Log.wtf("GooglePlayServicesUtil", "Google Play services missing when getting application info.");
      localNameNotFoundException3.printStackTrace();
      return 1;
    }
    return 0;
  }

  public static boolean isUserRecoverableError(int paramInt)
  {
    switch (paramInt)
    {
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    default:
      return false;
    case 1:
    case 2:
    case 3:
    case 9:
    }
    return true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.common.GooglePlayServicesUtil
 * JD-Core Version:    0.6.2
 */