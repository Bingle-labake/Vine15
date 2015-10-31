package co.vine.android.client;

public class TwitterVineApp
{
  public static final String API_KEY = transform((byte)21, RAW_API_KEY);
  public static final byte API_MAGIC = 21;
  public static final String API_SECRET = transform((byte)21, RAW_API_SECRET);
  private static final byte[] RAW_API_KEY = { -79, -66, -66, -33, -65, -35, -84, -94, -97, -62, -50, -61, -55, -31, -92, -77, -48, -87, -93, -50, -98 };
  private static final byte[] RAW_API_SECRET = { -32, -54, -65, -34, -29, -31, -27, -33, -48, -50, -63, -62, -80, -56, -94, -52, -89, -91, -53, -29, -82, -51, -47, -44, -55, -30, -50, -84, -51, -84, -52, -60, -31, -89, -80, -77, -45, -85, -97, -76, -101, -94 };

  public static String transform(byte paramByte, byte[] paramArrayOfByte)
  {
    StringBuilder localStringBuilder = new StringBuilder(paramArrayOfByte.length);
    int i = paramArrayOfByte.length;
    for (int j = 0; j < i; j++)
      localStringBuilder.append((char)(paramByte - paramArrayOfByte[j]));
    return localStringBuilder.toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.client.TwitterVineApp
 * JD-Core Version:    0.6.2
 */