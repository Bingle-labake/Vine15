package co.vine.android.api;

import android.util.Log;
import co.vine.android.network.HttpOperationReader;
import co.vine.android.network.HttpResult;
import java.io.IOException;
import java.io.InputStream;

public class VineParserReader
  implements HttpOperationReader
{
  public static final boolean LOGGABLE = false;
  public static final String TAG = "VineParserReader";
  public static final int TYPE_ACTIVITY = 9;
  public static final int TYPE_BLOCKED_USERS = 17;
  public static final int TYPE_CHANNELS = 18;
  public static final int TYPE_CLIENT_PROFILE = 13;
  public static final int TYPE_COMMENT = 7;
  public static final int TYPE_COMMENTS = 6;
  public static final int TYPE_EDITIONS = 21;
  public static final int TYPE_GENERAL = 1;
  public static final int TYPE_LIKE = 10;
  public static final int TYPE_LIKES = 11;
  public static final int TYPE_LOGIN = 4;
  public static final int TYPE_PENDING_NOTIF_COUNT = 20;
  public static final int TYPE_POSTS = 8;
  public static final int TYPE_POST_RESPONSE = 12;
  public static final int TYPE_REVINE = 19;
  public static final int TYPE_SERVER_STATUS = 15;
  public static final int TYPE_SIGN_UP = 5;
  public static final int TYPE_TAGS = 14;
  public static final int TYPE_UPLOAD = 16;
  public static final int TYPE_USER = 2;
  public static final int TYPE_USERS = 3;
  private Object mParsedObject;
  private final int mType;

  private VineParserReader(int paramInt)
  {
    this.mType = paramInt;
  }

  public static VineParserReader createLoginReader()
  {
    return new VineParserReader(4);
  }

  public static VineParserReader createParserReader(int paramInt)
  {
    return new VineParserReader(paramInt);
  }

  public <T> T getParsedObject()
  {
    return this.mParsedObject;
  }

  public void onHandleError(HttpResult paramHttpResult)
  {
  }

  public void readInput(int paramInt1, int paramInt2, InputStream paramInputStream)
    throws IOException
  {
    if (paramInt1 == 200)
      switch (this.mType)
      {
      default:
        this.mParsedObject = VineParsers.parseVineResponse(VineParsers.createParser(paramInputStream), this.mType);
      case 4:
      }
    do
    {
      return;
      this.mParsedObject = VineParsers.parseLogin(VineParsers.createParser(paramInputStream));
      return;
      this.mParsedObject = VineParsers.parseError(VineParsers.createParser(paramInputStream));
    }
    while (!LOGGABLE);
    Log.d("VineParserReader", "ERROR: Response with " + paramInt1);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineParserReader
 * JD-Core Version:    0.6.2
 */