package co.vine.android.api;

import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.SpannableStringBuilder;
import co.vine.android.util.Util;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;

public class VinePost
  implements Parcelable
{
  public static final Parcelable.Creator<VinePost> CREATOR = new Parcelable.Creator()
  {
    public VinePost createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VinePost(paramAnonymousParcel);
    }

    public VinePost[] newArray(int paramAnonymousInt)
    {
      return new VinePost[paramAnonymousInt];
    }
  };
  public static final int FLAG_EXPLICIT = 4;
  public static final int FLAG_LIKED = 8;
  public static final int FLAG_POST_VERIFIED = 32;
  public static final int FLAG_PRIVATE = 64;
  public static final int FLAG_PROMOTED = 2;
  public static final int FLAG_REVINED = 16;
  public static final int FLAG_VERIFIED = 1;
  public String avatarUrl;
  public VinePagedData<VineComment> comments;
  public int commentsCount;
  public long created;
  public String description;
  public SpannableStringBuilder descriptionSb;
  public ArrayList<VineEntity> entities;
  public String foursquareVenueId;
  public boolean isLast;
  public VinePagedData<VineLike> likes;
  public int likesCount;
  public String location;
  public int metadataFlags;
  public long myRepostId;
  public String orderId;
  public int postFlags;
  public long postId;
  public VineRepost repost;
  public int revinersCount;
  public String shareUrl;
  public String tag;
  public ArrayList<VineTag> tags;
  public String thumbnailUrl;
  public ArrayList<VineEntity> transientEntities;
  public VineUser user;
  public long userId;
  public String username;
  public VineVenue venueData;
  public String videoLowURL;
  public String videoUrl;

  public VinePost()
  {
  }

  public VinePost(Parcel paramParcel)
  {
    ClassLoader localClassLoader = getClass().getClassLoader();
    this.created = paramParcel.readLong();
    this.metadataFlags = paramParcel.readInt();
    if (paramParcel.readInt() == i);
    while (true)
    {
      this.isLast = i;
      this.postFlags = paramParcel.readInt();
      this.likesCount = paramParcel.readInt();
      this.revinersCount = paramParcel.readInt();
      this.commentsCount = paramParcel.readInt();
      this.userId = paramParcel.readLong();
      this.postId = paramParcel.readLong();
      this.myRepostId = paramParcel.readLong();
      this.orderId = paramParcel.readString();
      this.tag = paramParcel.readString();
      this.foursquareVenueId = paramParcel.readString();
      this.description = paramParcel.readString();
      this.avatarUrl = paramParcel.readString();
      this.location = paramParcel.readString();
      this.videoLowURL = paramParcel.readString();
      this.videoUrl = paramParcel.readString();
      this.thumbnailUrl = paramParcel.readString();
      this.comments = ((VinePagedData)paramParcel.readParcelable(localClassLoader));
      this.likes = ((VinePagedData)paramParcel.readParcelable(localClassLoader));
      this.user = ((VineUser)paramParcel.readParcelable(localClassLoader));
      this.venueData = ((VineVenue)paramParcel.readSerializable());
      this.entities = ((ArrayList)paramParcel.readSerializable());
      this.repost = ((VineRepost)paramParcel.readSerializable());
      return;
      i = 0;
    }
  }

  public static VinePost from(Cursor paramCursor)
  {
    int i = 1;
    VinePost localVinePost = new VinePost();
    localVinePost.postId = paramCursor.getLong(i);
    localVinePost.orderId = paramCursor.getString(44);
    localVinePost.tag = paramCursor.getString(13);
    localVinePost.myRepostId = paramCursor.getLong(2);
    localVinePost.shareUrl = paramCursor.getString(5);
    localVinePost.videoUrl = paramCursor.getString(7);
    localVinePost.videoLowURL = paramCursor.getString(6);
    localVinePost.description = paramCursor.getString(8);
    localVinePost.foursquareVenueId = paramCursor.getString(9);
    localVinePost.metadataFlags = paramCursor.getInt(10);
    if (paramCursor.getInt(14) == i);
    while (true)
    {
      localVinePost.isLast = i;
      localVinePost.postFlags = paramCursor.getInt(11);
      localVinePost.likesCount = paramCursor.getInt(24);
      localVinePost.revinersCount = paramCursor.getInt(25);
      localVinePost.commentsCount = paramCursor.getInt(26);
      localVinePost.userId = paramCursor.getLong(16);
      localVinePost.created = paramCursor.getLong(17);
      localVinePost.avatarUrl = paramCursor.getString(15);
      localVinePost.location = paramCursor.getString(18);
      localVinePost.username = paramCursor.getString(19);
      localVinePost.thumbnailUrl = paramCursor.getString(4);
      localVinePost.comments = new VinePagedData();
      localVinePost.likes = new VinePagedData();
      localVinePost.venueData = ((VineVenue)Util.fromByteArray(paramCursor.getBlob(20)));
      localVinePost.entities = ((ArrayList)Util.fromByteArray(paramCursor.getBlob(21)));
      localVinePost.repost = ((VineRepost)Util.fromByteArray(paramCursor.getBlob(22)));
      return localVinePost;
      i = 0;
    }
  }

  public static VinePost fromExplore(Cursor paramCursor)
  {
    int i = 1;
    VinePost localVinePost = new VinePost();
    localVinePost.postId = paramCursor.getLong(i);
    localVinePost.orderId = paramCursor.getString(27);
    localVinePost.tag = paramCursor.getString(13);
    localVinePost.myRepostId = paramCursor.getLong(2);
    localVinePost.shareUrl = paramCursor.getString(5);
    localVinePost.videoUrl = paramCursor.getString(7);
    localVinePost.videoLowURL = paramCursor.getString(6);
    localVinePost.description = paramCursor.getString(8);
    localVinePost.foursquareVenueId = paramCursor.getString(9);
    localVinePost.metadataFlags = paramCursor.getInt(10);
    if (paramCursor.getInt(14) == i);
    while (true)
    {
      localVinePost.isLast = i;
      localVinePost.postFlags = paramCursor.getInt(11);
      localVinePost.likesCount = paramCursor.getInt(24);
      localVinePost.revinersCount = paramCursor.getInt(25);
      localVinePost.commentsCount = paramCursor.getInt(26);
      localVinePost.userId = paramCursor.getLong(16);
      localVinePost.created = paramCursor.getLong(17);
      localVinePost.avatarUrl = paramCursor.getString(15);
      localVinePost.location = paramCursor.getString(18);
      localVinePost.username = paramCursor.getString(19);
      localVinePost.thumbnailUrl = paramCursor.getString(4);
      localVinePost.comments = new VinePagedData();
      localVinePost.likes = new VinePagedData();
      localVinePost.venueData = ((VineVenue)Util.fromByteArray(paramCursor.getBlob(20)));
      localVinePost.entities = ((ArrayList)Util.fromByteArray(paramCursor.getBlob(21)));
      localVinePost.repost = ((VineRepost)Util.fromByteArray(paramCursor.getBlob(22)));
      return localVinePost;
      i = 0;
    }
  }

  public static byte[] getBytesFromTags(VinePost paramVinePost)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    ObjectOutputStream localObjectOutputStream = new ObjectOutputStream(localByteArrayOutputStream);
    Iterator localIterator = paramVinePost.tags.iterator();
    while (localIterator.hasNext())
    {
      VineTag localVineTag = (VineTag)localIterator.next();
      localObjectOutputStream.writeLong(localVineTag.tagId);
      localObjectOutputStream.writeObject(localVineTag.tagName);
    }
    localObjectOutputStream.flush();
    localObjectOutputStream.close();
    localByteArrayOutputStream.close();
    return localByteArrayOutputStream.toByteArray();
  }

  // ERROR //
  public static void setTagFromBytes(VinePost paramVinePost, byte[] paramArrayOfByte)
    throws java.lang.ClassNotFoundException, IOException
  {
    // Byte code:
    //   0: new 268	java/io/ByteArrayInputStream
    //   3: dup
    //   4: aload_1
    //   5: invokespecial 271	java/io/ByteArrayInputStream:<init>	([B)V
    //   8: astore_2
    //   9: new 273	java/io/ObjectInputStream
    //   12: dup
    //   13: aload_2
    //   14: invokespecial 276	java/io/ObjectInputStream:<init>	(Ljava/io/InputStream;)V
    //   17: astore_3
    //   18: aload_0
    //   19: new 164	java/util/ArrayList
    //   22: dup
    //   23: invokespecial 277	java/util/ArrayList:<init>	()V
    //   26: putfield 217	co/vine/android/api/VinePost:tags	Ljava/util/ArrayList;
    //   29: aload_3
    //   30: invokevirtual 278	java/io/ObjectInputStream:readLong	()J
    //   33: lstore 6
    //   35: aload_0
    //   36: getfield 217	co/vine/android/api/VinePost:tags	Ljava/util/ArrayList;
    //   39: new 233	co/vine/android/api/VineTag
    //   42: dup
    //   43: aload_3
    //   44: invokevirtual 281	java/io/ObjectInputStream:readObject	()Ljava/lang/Object;
    //   47: checkcast 283	java/lang/String
    //   50: lload 6
    //   52: invokespecial 286	co/vine/android/api/VineTag:<init>	(Ljava/lang/String;J)V
    //   55: invokevirtual 290	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   58: pop
    //   59: goto -30 -> 29
    //   62: astore 5
    //   64: aload_3
    //   65: invokevirtual 291	java/io/ObjectInputStream:close	()V
    //   68: aload_2
    //   69: invokevirtual 292	java/io/ByteArrayInputStream:close	()V
    //   72: aload 5
    //   74: athrow
    //   75: astore 4
    //   77: aload_3
    //   78: invokevirtual 291	java/io/ObjectInputStream:close	()V
    //   81: aload_2
    //   82: invokevirtual 292	java/io/ByteArrayInputStream:close	()V
    //   85: return
    //
    // Exception table:
    //   from	to	target	type
    //   29	35	62	finally
    //   35	59	62	finally
    //   29	35	75	java/io/EOFException
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VinePost localVinePost;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVinePost = (VinePost)paramObject;
      if (this.postId != localVinePost.postId)
        return false;
      if (this.myRepostId != localVinePost.myRepostId)
        return false;
      if (this.commentsCount != localVinePost.commentsCount)
        return false;
      if (this.created != localVinePost.created)
        return false;
      if (this.metadataFlags != localVinePost.metadataFlags)
        return false;
      if (this.isLast != localVinePost.isLast)
        return false;
      if (this.likesCount != localVinePost.likesCount)
        return false;
      if (this.revinersCount != localVinePost.revinersCount)
        return false;
      if (this.postFlags != localVinePost.postFlags)
        return false;
      if (this.userId != localVinePost.userId)
        return false;
      if (this.avatarUrl != null)
      {
        if (this.avatarUrl.equals(localVinePost.avatarUrl));
      }
      else
        while (localVinePost.avatarUrl != null)
          return false;
      if (this.comments != null)
      {
        if (this.comments.equals(localVinePost.comments));
      }
      else
        while (localVinePost.comments != null)
          return false;
      if (this.description != null)
      {
        if (this.description.equals(localVinePost.description));
      }
      else
        while (localVinePost.description != null)
          return false;
      if (this.entities != null)
      {
        if (this.entities.equals(localVinePost.entities));
      }
      else
        while (localVinePost.entities != null)
          return false;
      if (this.foursquareVenueId != null)
      {
        if (this.foursquareVenueId.equals(localVinePost.foursquareVenueId));
      }
      else
        while (localVinePost.foursquareVenueId != null)
          return false;
      if (this.likes != null)
      {
        if (this.likes.equals(localVinePost.likes));
      }
      else
        while (localVinePost.likes != null)
          return false;
      if (this.location != null)
      {
        if (this.location.equals(localVinePost.location));
      }
      else
        while (localVinePost.location != null)
          return false;
      if (this.orderId != null)
      {
        if (this.orderId.equals(localVinePost.orderId));
      }
      else
        while (localVinePost.orderId != null)
          return false;
      if (this.tag != null)
      {
        if (this.tag.equals(localVinePost.tag));
      }
      else
        while (localVinePost.tag != null)
          return false;
      if (this.shareUrl != null)
      {
        if (this.shareUrl.equals(localVinePost.shareUrl));
      }
      else
        while (localVinePost.shareUrl != null)
          return false;
      if (this.tags != null)
      {
        if (this.tags.equals(localVinePost.tags));
      }
      else
        while (localVinePost.tags != null)
          return false;
      if (this.thumbnailUrl != null)
      {
        if (this.thumbnailUrl.equals(localVinePost.thumbnailUrl));
      }
      else
        while (localVinePost.thumbnailUrl != null)
          return false;
      if (this.user != null)
      {
        if (this.user.equals(localVinePost.user));
      }
      else
        while (localVinePost.user != null)
          return false;
      if (this.username != null)
      {
        if (this.username.equals(localVinePost.username));
      }
      else
        while (localVinePost.username != null)
          return false;
      if (this.venueData != null)
      {
        if (this.venueData.equals(localVinePost.venueData));
      }
      else
        while (localVinePost.venueData != null)
          return false;
      if (this.videoLowURL != null)
      {
        if (this.videoLowURL.equals(localVinePost.videoLowURL));
      }
      else
        while (localVinePost.videoLowURL != null)
          return false;
      if (this.videoUrl != null)
      {
        if (this.videoUrl.equals(localVinePost.videoUrl));
      }
      else
        while (localVinePost.videoUrl != null)
          return false;
      if (this.repost == null)
        break;
    }
    while (this.repost.equals(localVinePost.repost));
    while (true)
    {
      return false;
      if (localVinePost.repost == null)
        break;
    }
  }

  public int hashCode()
  {
    int i = 31 * (31 * (int)(this.created ^ this.created >>> 32) + this.metadataFlags);
    int j;
    int m;
    label140: int i1;
    label165: int i3;
    label191: int i5;
    label217: int i7;
    label243: int i9;
    label269: int i11;
    label295: int i13;
    label321: int i15;
    label347: int i17;
    label373: int i19;
    label399: int i21;
    label425: int i23;
    label451: int i25;
    label477: int i27;
    label503: int i29;
    label529: int i30;
    if (this.isLast)
    {
      j = 1;
      int k = 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (i + j) + this.postFlags) + (int)(this.userId ^ this.userId >>> 32)) + (int)(this.postId ^ this.postId >>> 32)) + (int)(this.myRepostId ^ this.myRepostId >>> 32)) + this.likesCount) + this.revinersCount) + this.commentsCount);
      if (this.orderId == null)
        break label599;
      m = this.orderId.hashCode();
      int n = 31 * (k + m);
      if (this.tag == null)
        break label605;
      i1 = this.tag.hashCode();
      int i2 = 31 * (n + i1);
      if (this.foursquareVenueId == null)
        break label611;
      i3 = this.foursquareVenueId.hashCode();
      int i4 = 31 * (i2 + i3);
      if (this.description == null)
        break label617;
      i5 = this.description.hashCode();
      int i6 = 31 * (i4 + i5);
      if (this.avatarUrl == null)
        break label623;
      i7 = this.avatarUrl.hashCode();
      int i8 = 31 * (i6 + i7);
      if (this.location == null)
        break label629;
      i9 = this.location.hashCode();
      int i10 = 31 * (i8 + i9);
      if (this.videoLowURL == null)
        break label635;
      i11 = this.videoLowURL.hashCode();
      int i12 = 31 * (i10 + i11);
      if (this.videoUrl == null)
        break label641;
      i13 = this.videoUrl.hashCode();
      int i14 = 31 * (i12 + i13);
      if (this.username == null)
        break label647;
      i15 = this.username.hashCode();
      int i16 = 31 * (i14 + i15);
      if (this.shareUrl == null)
        break label653;
      i17 = this.shareUrl.hashCode();
      int i18 = 31 * (i16 + i17);
      if (this.thumbnailUrl == null)
        break label659;
      i19 = this.thumbnailUrl.hashCode();
      int i20 = 31 * (i18 + i19);
      if (this.tags == null)
        break label665;
      i21 = this.tags.hashCode();
      int i22 = 31 * (i20 + i21);
      if (this.entities == null)
        break label671;
      i23 = this.entities.hashCode();
      int i24 = 31 * (i22 + i23);
      if (this.comments == null)
        break label677;
      i25 = this.comments.hashCode();
      int i26 = 31 * (i24 + i25);
      if (this.likes == null)
        break label683;
      i27 = this.likes.hashCode();
      int i28 = 31 * (i26 + i27);
      if (this.user == null)
        break label689;
      i29 = this.user.hashCode();
      i30 = 31 * (i28 + i29);
      if (this.venueData == null)
        break label695;
    }
    label641: label647: label653: label659: label665: label671: label677: label683: label689: label695: for (int i31 = this.venueData.hashCode(); ; i31 = 0)
    {
      int i32 = 31 * (i30 + i31);
      VineRepost localVineRepost = this.repost;
      int i33 = 0;
      if (localVineRepost != null)
        i33 = this.repost.hashCode();
      return i32 + i33;
      j = 0;
      break;
      label599: m = 0;
      break label140;
      label605: i1 = 0;
      break label165;
      label611: i3 = 0;
      break label191;
      label617: i5 = 0;
      break label217;
      label623: i7 = 0;
      break label243;
      label629: i9 = 0;
      break label269;
      label635: i11 = 0;
      break label295;
      i13 = 0;
      break label321;
      i15 = 0;
      break label347;
      i17 = 0;
      break label373;
      i19 = 0;
      break label399;
      i21 = 0;
      break label425;
      i23 = 0;
      break label451;
      i25 = 0;
      break label477;
      i27 = 0;
      break label503;
      i29 = 0;
      break label529;
    }
  }

  public boolean isExplicit()
  {
    return (0x4 & this.metadataFlags) != 0;
  }

  public boolean isLiked()
  {
    return (0x8 & this.metadataFlags) != 0;
  }

  public boolean isPrivate()
  {
    return (0x40 & this.metadataFlags) != 0;
  }

  public boolean isPromoted()
  {
    return (0x2 & this.metadataFlags) != 0;
  }

  public boolean isRevined()
  {
    return (0x10 & this.metadataFlags) != 0;
  }

  public boolean isShareable()
  {
    return this.shareUrl != null;
  }

  public boolean isVerified()
  {
    return (0x1 & this.metadataFlags) != 0;
  }

  public void setFlagExplicit(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.metadataFlags = (0x4 | this.metadataFlags);
      return;
    }
    this.metadataFlags = (0xFFFFFFFB & this.metadataFlags);
  }

  public void setFlagLiked(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.metadataFlags = (0x8 | this.metadataFlags);
      return;
    }
    this.metadataFlags = (0xFFFFFFF7 & this.metadataFlags);
  }

  public void setFlagPostVerified(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.metadataFlags = (0x20 | this.metadataFlags);
      return;
    }
    this.metadataFlags = (0xFFFFFFDF & this.metadataFlags);
  }

  public void setFlagPrivate(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.metadataFlags = (0x40 | this.metadataFlags);
      return;
    }
    this.metadataFlags = (0xFFFFFFBF & this.metadataFlags);
  }

  public void setFlagPromoted(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.metadataFlags = (0x2 | this.metadataFlags);
      return;
    }
    this.metadataFlags = (0xFFFFFFFD & this.metadataFlags);
  }

  public void setFlagRevined(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.metadataFlags = (0x10 | this.metadataFlags);
      return;
    }
    this.metadataFlags = (0xFFFFFFEF & this.metadataFlags);
  }

  public void setFlagVerified(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.metadataFlags = (0x1 | this.metadataFlags);
      return;
    }
    this.metadataFlags = (0xFFFFFFFE & this.metadataFlags);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(this.created);
    paramParcel.writeInt(this.metadataFlags);
    if (this.isLast);
    for (int i = 1; ; i = 0)
    {
      paramParcel.writeInt(i);
      paramParcel.writeInt(this.postFlags);
      paramParcel.writeInt(this.likesCount);
      paramParcel.writeInt(this.revinersCount);
      paramParcel.writeInt(this.commentsCount);
      paramParcel.writeLong(this.userId);
      paramParcel.writeLong(this.postId);
      paramParcel.writeLong(this.myRepostId);
      paramParcel.writeString(this.orderId);
      paramParcel.writeString(this.tag);
      paramParcel.writeString(this.foursquareVenueId);
      paramParcel.writeString(this.description);
      paramParcel.writeString(this.avatarUrl);
      paramParcel.writeString(this.location);
      paramParcel.writeString(this.videoLowURL);
      paramParcel.writeString(this.videoUrl);
      paramParcel.writeString(this.username);
      paramParcel.writeString(this.shareUrl);
      paramParcel.writeString(this.thumbnailUrl);
      paramParcel.writeParcelable(this.comments, paramInt);
      paramParcel.writeParcelable(this.likes, paramInt);
      paramParcel.writeParcelable(this.user, paramInt);
      paramParcel.writeSerializable(this.venueData);
      paramParcel.writeSerializable(this.entities);
      paramParcel.writeSerializable(this.repost);
      return;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VinePost
 * JD-Core Version:    0.6.2
 */