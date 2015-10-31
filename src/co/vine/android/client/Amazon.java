package co.vine.android.client;

import android.content.Context;
import co.vine.android.util.BuildUtil;
import java.util.Locale;

public class Amazon
{
  public static final String ACCESS_KEY = TwitterVineApp.transform((byte)21, RAW_ACCESS_KEY);
  public static final String ACCESS_SECRET = TwitterVineApp.transform((byte)21, RAW_ACCESS_SECRET);
  public static final String PICTURE_BUCKET = "avatars";
  public static final byte[] RAW_ACCESS_KEY = { -44, -54, -52, -44, -53, -55, -29, -62, -62, -58, -61, -63, -69, -32, -44, -54, -33, -47, -31, -44 };
  public static final byte[] RAW_ACCESS_SECRET = { -52, -57, -27, -88, -57, -86, -29, -98, -80, -31, -60, -92, -89, -49, -76, -47, -64, -64, -80, -46, -34, -47, -68, -101, -45, -47, -36, -45, -61, -46, -98, -61, -68, -89, -63, -96, -95, -90, -99, -85 };

  public static String getBucket(Context paramContext)
  {
    return BuildUtil.get(paramContext).getAmazonBucket().toLowerCase(Locale.US);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.client.Amazon
 * JD-Core Version:    0.6.2
 */