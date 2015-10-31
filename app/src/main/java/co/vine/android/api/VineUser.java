package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class VineUser
  implements Parcelable
{
  public static final Parcelable.Creator<VineUser> CREATOR = new Parcelable.Creator()
  {
    public VineUser createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VineUser(paramAnonymousParcel);
    }

    public VineUser[] newArray(int paramAnonymousInt)
    {
      return new VineUser[paramAnonymousInt];
    }
  };
  public static final int FOLLOW_STATUS_APPROVAL_PENDING = 1;
  public static final int FOLLOW_STATUS_REQUESTED = 2;
  public int authoredPostCount;
  public String avatarUrl;
  public int blocked;
  public int blocking;
  public String description;
  public String edition;
  public String email;
  public int explicit;
  public int followStatus;
  public int followerCount;
  public int following;
  public int followingCount;
  public int includePromoted;
  public int likeCount;
  public String location;
  public long orderId;
  public String phoneNumber;
  public int postCount;
  public int privateAccount;
  public int repostsEnabled;
  public int twitterConnected;
  public long userId;
  public String username;
  public int verified;

  public VineUser()
  {
  }

  public VineUser(Parcel paramParcel)
  {
    this.username = paramParcel.readString();
    this.avatarUrl = paramParcel.readString();
    this.description = paramParcel.readString();
    this.location = paramParcel.readString();
    this.email = paramParcel.readString();
    this.phoneNumber = paramParcel.readString();
    this.userId = paramParcel.readLong();
    this.orderId = paramParcel.readLong();
    this.blocked = paramParcel.readInt();
    this.blocking = paramParcel.readInt();
    this.explicit = paramParcel.readInt();
    this.followerCount = paramParcel.readInt();
    this.followingCount = paramParcel.readInt();
    this.following = paramParcel.readInt();
    this.likeCount = paramParcel.readInt();
    this.postCount = paramParcel.readInt();
    this.verified = paramParcel.readInt();
    this.twitterConnected = paramParcel.readInt();
    this.includePromoted = paramParcel.readInt();
    this.privateAccount = paramParcel.readInt();
    this.followStatus = paramParcel.readInt();
    this.repostsEnabled = paramParcel.readInt();
    this.edition = paramParcel.readString();
    this.authoredPostCount = paramParcel.readInt();
  }

  public VineUser(String paramString1, String paramString2, String paramString3, String paramString4, long paramLong1, long paramLong2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, String paramString5, String paramString6, int paramInt10, int paramInt11, int paramInt12, int paramInt13, String paramString7, int paramInt14)
  {
    this.username = paramString1;
    this.avatarUrl = paramString2;
    this.description = paramString3;
    this.location = paramString4;
    this.userId = paramLong1;
    this.orderId = paramLong2;
    this.blocked = paramInt1;
    this.blocking = paramInt2;
    this.explicit = paramInt3;
    this.followerCount = paramInt4;
    this.followingCount = paramInt5;
    this.following = paramInt6;
    this.likeCount = paramInt7;
    this.postCount = paramInt8;
    this.verified = paramInt9;
    this.email = paramString5;
    this.phoneNumber = paramString6;
    this.twitterConnected = paramInt10;
    this.includePromoted = paramInt11;
    this.privateAccount = paramInt12;
    this.repostsEnabled = paramInt13;
    this.edition = paramString7;
    this.authoredPostCount = paramInt14;
  }

  public boolean areRepostsEnabled()
  {
    return this.repostsEnabled == 1;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VineUser localVineUser;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVineUser = (VineUser)paramObject;
      if (this.blocked != localVineUser.blocked)
        return false;
      if (this.blocking != localVineUser.blocking)
        return false;
      if (this.explicit != localVineUser.explicit)
        return false;
      if (this.followerCount != localVineUser.followerCount)
        return false;
      if (this.following != localVineUser.following)
        return false;
      if (this.followingCount != localVineUser.followingCount)
        return false;
      if (this.likeCount != localVineUser.likeCount)
        return false;
      if (this.orderId != localVineUser.orderId)
        return false;
      if (this.postCount != localVineUser.postCount)
        return false;
      if (this.twitterConnected != localVineUser.twitterConnected)
        return false;
      if (this.includePromoted != localVineUser.includePromoted)
        return false;
      if (this.userId != localVineUser.userId)
        return false;
      if (this.verified != localVineUser.verified)
        return false;
      if (this.privateAccount != localVineUser.privateAccount)
        return false;
      if (this.followStatus != localVineUser.followStatus)
        return false;
      if (this.avatarUrl != null)
      {
        if (this.avatarUrl.equals(localVineUser.avatarUrl));
      }
      else
        while (localVineUser.avatarUrl != null)
          return false;
      if (this.description != null)
      {
        if (this.description.equals(localVineUser.description));
      }
      else
        while (localVineUser.description != null)
          return false;
      if (this.email != null)
      {
        if (this.email.equals(localVineUser.email));
      }
      else
        while (localVineUser.email != null)
          return false;
      if (this.location != null)
      {
        if (this.location.equals(localVineUser.location));
      }
      else
        while (localVineUser.location != null)
          return false;
      if (this.phoneNumber != null)
      {
        if (this.phoneNumber.equals(localVineUser.phoneNumber));
      }
      else
        while (localVineUser.phoneNumber != null)
          return false;
      if (this.username != null)
      {
        if (this.username.equals(localVineUser.username));
      }
      else
        while (localVineUser.username != null)
          return false;
      if (this.repostsEnabled != localVineUser.repostsEnabled)
        return false;
      if (this.edition != null)
      {
        if (this.edition.equals(localVineUser.edition));
      }
      else
        while (localVineUser.edition != null)
          return false;
    }
    while (this.authoredPostCount == localVineUser.authoredPostCount);
    return false;
  }

  public boolean hasFollowApprovalPending()
  {
    return (0x1 & this.followStatus) != 0;
  }

  public boolean hasFollowRequested()
  {
    return (0x2 & this.followStatus) != 0;
  }

  public int hashCode()
  {
    int i;
    int k;
    label35: int n;
    label59: int i2;
    label85: int i4;
    label111: int i5;
    if (this.username != null)
    {
      i = this.username.hashCode();
      int j = i * 31;
      if (this.edition == null)
        break label327;
      k = this.edition.hashCode();
      int m = 31 * (j + k);
      if (this.avatarUrl == null)
        break label332;
      n = this.avatarUrl.hashCode();
      int i1 = 31 * (m + n);
      if (this.description == null)
        break label338;
      i2 = this.description.hashCode();
      int i3 = 31 * (i1 + i2);
      if (this.location == null)
        break label344;
      i4 = this.location.hashCode();
      i5 = 31 * (i3 + i4);
      if (this.phoneNumber == null)
        break label350;
    }
    label327: label332: label338: label344: label350: for (int i6 = this.phoneNumber.hashCode(); ; i6 = 0)
    {
      int i7 = 31 * (i5 + i6);
      String str = this.email;
      int i8 = 0;
      if (str != null)
        i8 = this.email.hashCode();
      return 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (i7 + i8) + (int)(this.userId ^ this.userId >>> 32)) + (int)(this.orderId ^ this.orderId >>> 32)) + this.blocked) + this.blocking) + this.explicit) + this.followerCount) + this.followingCount) + this.following) + this.likeCount) + this.postCount) + this.verified) + this.twitterConnected) + this.includePromoted) + this.privateAccount) + this.followStatus) + this.repostsEnabled;
      i = 0;
      break;
      k = 0;
      break label35;
      n = 0;
      break label59;
      i2 = 0;
      break label85;
      i4 = 0;
      break label111;
    }
  }

  public boolean isBlocked()
  {
    return this.blocked == 1;
  }

  public boolean isFollowing()
  {
    return this.following == 1;
  }

  public boolean isPrivate()
  {
    return this.privateAccount == 1;
  }

  public boolean isPrivateLocked()
  {
    return (isPrivate()) && ((!isFollowing()) || (hasFollowRequested()));
  }

  public boolean isVerified()
  {
    return this.verified == 1;
  }

  public void setApprovalPending()
  {
    this.followStatus = (0x1 | this.followStatus);
  }

  public void setFollowRequested()
  {
    this.followStatus = (0x2 | this.followStatus);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.username);
    paramParcel.writeString(this.avatarUrl);
    paramParcel.writeString(this.description);
    paramParcel.writeString(this.location);
    paramParcel.writeString(this.email);
    paramParcel.writeString(this.phoneNumber);
    paramParcel.writeLong(this.userId);
    paramParcel.writeLong(this.orderId);
    paramParcel.writeInt(this.blocked);
    paramParcel.writeInt(this.blocking);
    paramParcel.writeInt(this.explicit);
    paramParcel.writeInt(this.followerCount);
    paramParcel.writeInt(this.followingCount);
    paramParcel.writeInt(this.following);
    paramParcel.writeInt(this.likeCount);
    paramParcel.writeInt(this.postCount);
    paramParcel.writeInt(this.verified);
    paramParcel.writeInt(this.twitterConnected);
    paramParcel.writeInt(this.includePromoted);
    paramParcel.writeInt(this.privateAccount);
    paramParcel.writeInt(this.followStatus);
    paramParcel.writeInt(this.repostsEnabled);
    paramParcel.writeString(this.edition);
    paramParcel.writeInt(this.authoredPostCount);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineUser
 * JD-Core Version:    0.6.2
 */