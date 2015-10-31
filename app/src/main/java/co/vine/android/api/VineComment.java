package co.vine.android.api;

import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.SpannableStringBuilder;
import co.vine.android.util.Util;
import java.util.ArrayList;

public class VineComment
  implements Parcelable
{
  public static final Parcelable.Creator<VineComment> CREATOR = new Parcelable.Creator()
  {
    public VineComment createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VineComment(paramAnonymousParcel);
    }

    public VineComment[] newArray(int paramAnonymousInt)
    {
      return new VineComment[paramAnonymousInt];
    }
  };
  public String avatarUrl;
  public String comment;
  public long commentId;
  public SpannableStringBuilder commentSb;
  public ArrayList<VineEntity> entities;
  public boolean isLast;
  public String location;
  public long postId;
  public long timestamp;
  public ArrayList<VineEntity> transientEntities;
  public VineUser user;
  public long userId;
  public String username;
  public boolean verified;

  public VineComment(long paramLong1, String paramString1, String paramString2, VineUser paramVineUser, long paramLong2, String paramString3, long paramLong3, String paramString4, boolean paramBoolean1, long paramLong4, ArrayList<VineEntity> paramArrayList, boolean paramBoolean2)
  {
    this.commentId = paramLong1;
    this.avatarUrl = paramString2;
    this.comment = paramString1;
    this.user = paramVineUser;
    this.timestamp = paramLong2;
    this.location = paramString3;
    this.userId = paramLong3;
    this.username = paramString4;
    this.verified = paramBoolean1;
    this.postId = paramLong4;
    this.entities = paramArrayList;
    this.isLast = paramBoolean2;
  }

  public VineComment(Parcel paramParcel)
  {
    this.commentId = paramParcel.readLong();
    this.comment = paramParcel.readString();
    this.avatarUrl = paramParcel.readString();
    this.user = ((VineUser)paramParcel.readParcelable(ClassLoader.getSystemClassLoader()));
    this.timestamp = paramParcel.readLong();
    this.location = paramParcel.readString();
    this.userId = paramParcel.readLong();
    this.username = paramParcel.readString();
    int j;
    if (paramParcel.readInt() == i)
    {
      j = i;
      this.verified = j;
      this.postId = paramParcel.readLong();
      this.entities = ((ArrayList)paramParcel.readSerializable());
      if (paramParcel.readInt() != i)
        break label129;
    }
    while (true)
    {
      this.isLast = i;
      return;
      j = 0;
      break;
      label129: i = 0;
    }
  }

  public static VineComment from(Cursor paramCursor)
  {
    long l1 = paramCursor.getLong(34);
    String str1 = paramCursor.getString(35);
    String str2 = paramCursor.getString(36);
    long l2 = paramCursor.getLong(38);
    String str3 = paramCursor.getString(39);
    long l3 = paramCursor.getLong(37);
    String str4 = paramCursor.getString(40);
    boolean bool1;
    long l4;
    ArrayList localArrayList;
    if (paramCursor.getInt(41) == 1)
    {
      bool1 = true;
      l4 = paramCursor.getLong(1);
      localArrayList = (ArrayList)Util.fromByteArray(paramCursor.getBlob(43));
      if (paramCursor.getInt(42) != 1)
        break label158;
    }
    label158: for (boolean bool2 = true; ; bool2 = false)
    {
      return new VineComment(l1, str1, str2, null, l2, str3, l3, str4, bool1, l4, localArrayList, bool2);
      bool1 = false;
      break;
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VineComment localVineComment;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVineComment = (VineComment)paramObject;
      if (this.commentId != localVineComment.commentId)
        return false;
      if (this.postId != localVineComment.postId)
        return false;
      if (this.timestamp != localVineComment.timestamp)
        return false;
      if (this.userId != localVineComment.userId)
        return false;
      if (this.verified != localVineComment.verified)
        return false;
      if (this.avatarUrl != null)
      {
        if (this.avatarUrl.equals(localVineComment.avatarUrl));
      }
      else
        while (localVineComment.avatarUrl != null)
          return false;
      if (this.comment != null)
      {
        if (this.comment.equals(localVineComment.comment));
      }
      else
        while (localVineComment.comment != null)
          return false;
      if (this.entities != null)
      {
        if (this.entities.equals(localVineComment.entities));
      }
      else
        while (localVineComment.entities != null)
          return false;
      if (this.location != null)
      {
        if (this.location.equals(localVineComment.location));
      }
      else
        while (localVineComment.location != null)
          return false;
      if (this.user != null)
      {
        if (this.user.equals(localVineComment.user));
      }
      else
        while (localVineComment.user != null)
          return false;
      if (this.username != null)
      {
        if (this.username.equals(localVineComment.username));
      }
      else
        while (localVineComment.username != null)
          return false;
    }
    while (this.isLast == localVineComment.isLast);
    return false;
  }

  public int hashCode()
  {
    int i = 1;
    int j = 31 * (int)(this.commentId ^ this.commentId >>> 32);
    int k;
    int n;
    label58: int i2;
    label84: int i4;
    label127: int i6;
    label170: int i8;
    label190: int i10;
    label233: int i11;
    if (this.comment != null)
    {
      k = this.comment.hashCode();
      int m = 31 * (j + k);
      if (this.avatarUrl == null)
        break label260;
      n = this.avatarUrl.hashCode();
      int i1 = 31 * (m + n);
      if (this.user == null)
        break label266;
      i2 = this.user.hashCode();
      int i3 = 31 * (31 * (i1 + i2) + (int)(this.timestamp ^ this.timestamp >>> 32));
      if (this.location == null)
        break label272;
      i4 = this.location.hashCode();
      int i5 = 31 * (31 * (i3 + i4) + (int)(this.userId ^ this.userId >>> 32));
      if (this.username == null)
        break label278;
      i6 = this.username.hashCode();
      int i7 = 31 * (i5 + i6);
      if (!this.verified)
        break label284;
      i8 = i;
      int i9 = 31 * (31 * (i7 + i8) + (int)(this.postId ^ this.postId >>> 32));
      if (this.entities == null)
        break label290;
      i10 = this.entities.hashCode();
      i11 = 31 * (i9 + i10);
      if (!this.verified)
        break label296;
    }
    while (true)
    {
      return i11 + i;
      k = 0;
      break;
      label260: n = 0;
      break label58;
      label266: i2 = 0;
      break label84;
      label272: i4 = 0;
      break label127;
      label278: i6 = 0;
      break label170;
      label284: i8 = 0;
      break label190;
      label290: i10 = 0;
      break label233;
      label296: i = 0;
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(this.commentId);
    paramParcel.writeString(this.comment);
    paramParcel.writeString(this.avatarUrl);
    paramParcel.writeParcelable(this.user, paramInt);
    paramParcel.writeLong(this.timestamp);
    paramParcel.writeString(this.location);
    paramParcel.writeLong(this.userId);
    paramParcel.writeString(this.username);
    int i;
    if (this.verified)
    {
      i = 1;
      paramParcel.writeInt(i);
      paramParcel.writeLong(this.postId);
      paramParcel.writeSerializable(this.entities);
      if (!this.isLast)
        break label117;
    }
    label117: for (long l = 1L; ; l = 0L)
    {
      paramParcel.writeLong(l);
      return;
      i = 0;
      break;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineComment
 * JD-Core Version:    0.6.2
 */