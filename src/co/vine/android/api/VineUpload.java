package co.vine.android.api;

import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.edisonwang.android.slog.SLog;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.map.ObjectMapper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class VineUpload
  implements Parcelable
{
  public static final Parcelable.Creator<VineUpload> CREATOR = new Parcelable.Creator()
  {
    public VineUpload createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VineUpload(paramAnonymousParcel);
    }

    public VineUpload[] newArray(int paramAnonymousInt)
    {
      return new VineUpload[paramAnonymousInt];
    }
  };
  public String captchaUrl;
  public String hash;
  public long id;
  public String path;
  public String postInfo;
  public String reference;
  public int status;
  public String thumbnailPath;
  public String thumbnailUrl;
  public long uploadTime;
  public String videoUrl;

  public VineUpload(Parcel paramParcel)
  {
    this.status = paramParcel.readInt();
    this.id = paramParcel.readLong();
    this.uploadTime = paramParcel.readLong();
    this.path = paramParcel.readString();
    this.hash = paramParcel.readString();
    this.postInfo = paramParcel.readString();
    this.thumbnailPath = paramParcel.readString();
    this.thumbnailUrl = paramParcel.readString();
    this.reference = paramParcel.readString();
    this.captchaUrl = paramParcel.readString();
  }

  public VineUpload(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8, int paramInt, String paramString9)
  {
    this.path = paramString1;
    this.hash = paramString2;
    this.postInfo = paramString3;
    this.videoUrl = paramString4;
    this.thumbnailPath = paramString5;
    this.thumbnailUrl = paramString6;
    this.reference = paramString8;
    this.status = paramInt;
    if (!TextUtils.isEmpty(paramString7));
    for (this.uploadTime = Long.parseLong(paramString7); ; this.uploadTime = 0L)
    {
      this.captchaUrl = paramString9;
      return;
    }
  }

  public static VineUpload fromCursor(String paramString, Cursor paramCursor)
  {
    try
    {
      VineUpload localVineUpload = new VineUpload(paramString, paramCursor.getString(2), paramCursor.getString(4), paramCursor.getString(5), paramCursor.getString(6), paramCursor.getString(7), paramCursor.getString(8), paramCursor.getString(9), paramCursor.getInt(3), paramCursor.getString(11));
      return localVineUpload;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public PostInfo getPostInfo()
  {
    SLog.d("Post info: {}.", this.postInfo);
    if (TextUtils.isEmpty(this.postInfo))
      return null;
    return PostInfo.fromJsonString(this.postInfo);
  }

  public String[] getUris()
  {
    String[] arrayOfString = new String[2];
    arrayOfString[0] = this.videoUrl;
    arrayOfString[1] = this.thumbnailUrl;
    return arrayOfString;
  }

  public boolean isExpired()
  {
    return System.currentTimeMillis() - this.uploadTime > 86400000L;
  }

  public void setCaptchaUrl(String paramString)
  {
    this.captchaUrl = paramString;
  }

  public void setUris(String[] paramArrayOfString)
  {
    this.videoUrl = paramArrayOfString[0];
    this.thumbnailUrl = paramArrayOfString[1];
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(this.status);
    paramParcel.writeLong(this.id);
    paramParcel.writeLong(this.uploadTime);
    paramParcel.writeString(this.path);
    paramParcel.writeString(this.hash);
    paramParcel.writeString(this.postInfo);
    paramParcel.writeString(this.thumbnailPath);
    paramParcel.writeString(this.thumbnailUrl);
    paramParcel.writeString(this.reference);
    paramParcel.writeString(this.captchaUrl);
  }

  public static class PostInfo
  {
    public final String caption;
    public final long channelId;
    public long created;
    public final ArrayList<VineEntity> entities;
    public final String message;
    public final boolean postToFacebook;
    public final boolean postToTwitter;

    public PostInfo(String paramString1, boolean paramBoolean1, boolean paramBoolean2, long paramLong1, ArrayList<VineEntity> paramArrayList, String paramString2, long paramLong2)
    {
      if (paramString1 == null)
        paramString1 = "";
      this.caption = paramString1;
      this.postToTwitter = paramBoolean1;
      this.postToFacebook = paramBoolean2;
      this.entities = paramArrayList;
      this.channelId = paramLong1;
      this.message = paramString2;
      this.created = paramLong2;
    }

    public static ArrayList<HashMap<String, Object>> entitiesToMaps(ArrayList<VineEntity> paramArrayList)
    {
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = paramArrayList.iterator();
      while (localIterator.hasNext())
        localArrayList.add(((VineEntity)localIterator.next()).toMap());
      return localArrayList;
    }

    public static PostInfo fromJsonString(String paramString)
    {
      try
      {
        PostInfo localPostInfo = VineUploadParsers.parsePostInfo(VineParsers.createParser(paramString));
        return localPostInfo;
      }
      catch (IOException localIOException)
      {
        throw new RuntimeException("This should never happen.", localIOException);
      }
    }

    private JsonNode toJson()
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("description", this.caption);
      localHashMap.put("postToTwitter", Boolean.valueOf(this.postToTwitter));
      localHashMap.put("postToFacebook", Boolean.valueOf(this.postToFacebook));
      localHashMap.put("channelId", Long.valueOf(this.channelId));
      if ((this.entities != null) && (!this.entities.isEmpty()))
        localHashMap.put("entities", entitiesToMaps(this.entities));
      localHashMap.put("message", this.message);
      localHashMap.put("created", Long.valueOf(this.created));
      return new ObjectMapper().valueToTree(localHashMap);
    }

    public String toString()
    {
      return toJson().toString();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineUpload
 * JD-Core Version:    0.6.2
 */