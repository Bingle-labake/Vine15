package co.vine.android.api;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import java.io.IOException;
import java.util.ArrayList;

public class VineUploadParsers
{
  public static VineUpload.PostInfo parsePostInfo(JsonParser paramJsonParser)
    throws IOException
  {
    JsonToken localJsonToken1 = paramJsonParser.nextToken();
    String str1 = "";
    String str2 = "";
    boolean bool1 = false;
    boolean bool2 = false;
    long l1 = -1L;
    ArrayList localArrayList = null;
    long l2 = 0L;
    if ((localJsonToken1 != null) && (localJsonToken1 != JsonToken.END_OBJECT))
    {
      switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[localJsonToken1.ordinal()])
      {
      default:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      }
      while (true)
      {
        localJsonToken1 = paramJsonParser.nextToken();
        break;
        if ("description".equals(paramJsonParser.getCurrentName()))
          str1 = paramJsonParser.getText();
        if ("message".equals(paramJsonParser.getCurrentName()))
        {
          str2 = paramJsonParser.getText();
          continue;
          if ("postToTwitter".equals(paramJsonParser.getCurrentName()))
          {
            bool1 = paramJsonParser.getBooleanValue();
          }
          else if ("postToFacebook".equals(paramJsonParser.getCurrentName()))
          {
            bool2 = paramJsonParser.getBooleanValue();
            continue;
            if ("channelId".equals(paramJsonParser.getCurrentName()))
            {
              l1 = paramJsonParser.getLongValue();
            }
            else if ("created".equals(paramJsonParser.getCurrentName()))
            {
              l2 = paramJsonParser.getLongValue();
              continue;
              if ("entities".equals(paramJsonParser.getCurrentName()))
                for (JsonToken localJsonToken2 = paramJsonParser.nextToken(); (localJsonToken2 != null) && (localJsonToken2 != JsonToken.END_ARRAY); localJsonToken2 = paramJsonParser.nextToken())
                {
                  VineEntity localVineEntity = VineParsers.parseEntity(paramJsonParser);
                  if (localArrayList == null)
                    localArrayList = new ArrayList();
                  if (localVineEntity != null)
                    localArrayList.add(localVineEntity);
                }
              else
                paramJsonParser.skipChildren();
            }
          }
        }
      }
    }
    return new VineUpload.PostInfo(str1, bool1, bool2, l1, localArrayList, str2, l2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineUploadParsers
 * JD-Core Version:    0.6.2
 */