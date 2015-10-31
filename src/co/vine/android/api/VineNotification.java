package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;

public class VineNotification
  implements Parcelable
{
  public static final int FOLLOWING = 1;
  public static final int FOLLOW_REQUESTED = 2;
  public static final int PRIVATE = 4;
  public String avatarUrl;
  public String comment;
  public long createdAt;
  public ArrayList<VineEntity> entities;
  public int followStatus;
  public long notificationId;
  public int notificationType;
  public long postId;
  public String thumbnailUrl;
  public long userId;
  public String username;
  public boolean verified;

  public VineNotification(Parcel paramParcel)
  {
    this.avatarUrl = paramParcel.readString();
    this.username = paramParcel.readString();
    this.thumbnailUrl = paramParcel.readString();
    this.comment = paramParcel.readString();
    this.notificationId = paramParcel.readLong();
    this.userId = paramParcel.readLong();
    this.postId = paramParcel.readLong();
    this.createdAt = paramParcel.readLong();
    if (paramParcel.readInt() == i);
    while (true)
    {
      this.verified = i;
      this.notificationType = paramParcel.readInt();
      this.entities = ((ArrayList)paramParcel.readSerializable());
      this.followStatus = paramParcel.readInt();
      return;
      i = 0;
    }
  }

  public VineNotification(String paramString1, String paramString2, String paramString3, String paramString4, long paramLong1, long paramLong2, long paramLong3, long paramLong4, boolean paramBoolean, int paramInt, ArrayList<VineEntity> paramArrayList)
  {
    this.avatarUrl = paramString1;
    this.username = paramString2;
    this.thumbnailUrl = paramString3;
    this.comment = paramString4;
    this.notificationId = paramLong1;
    this.userId = paramLong2;
    this.postId = paramLong3;
    this.createdAt = paramLong4;
    this.verified = paramBoolean;
    this.notificationType = paramInt;
    this.entities = paramArrayList;
  }

  public static boolean isLocked(int paramInt)
  {
    return ((paramInt & 0x4) >= 1) && (((paramInt & 0x2) >= 1) || ((paramInt & 0x1) < 1));
  }

  public int describeContents()
  {
    return 0;
  }

  public void setFollowRequested()
  {
    this.followStatus = (0x2 | this.followStatus);
  }

  public void setFollowing()
  {
    this.followStatus = (0x1 | this.followStatus);
  }

  public void setPrivate()
  {
    this.followStatus = (0x4 | this.followStatus);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.avatarUrl);
    paramParcel.writeString(this.username);
    paramParcel.writeString(this.thumbnailUrl);
    paramParcel.writeString(this.comment);
    paramParcel.writeLong(this.notificationId);
    paramParcel.writeLong(this.userId);
    paramParcel.writeLong(this.postId);
    paramParcel.writeLong(this.createdAt);
    if (this.verified);
    for (int i = 1; ; i = 0)
    {
      paramParcel.writeInt(i);
      paramParcel.writeInt(this.notificationType);
      paramParcel.writeSerializable(this.entities);
      paramParcel.writeInt(this.followStatus);
      return;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineNotification
 * JD-Core Version:    0.6.2
 */