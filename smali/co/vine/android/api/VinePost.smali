.class public Lco/vine/android/api/VinePost;
.super Ljava/lang/Object;
.source "VinePost.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;"
        }
    .end annotation
.end field

.field public static final FLAG_EXPLICIT:I = 0x4

.field public static final FLAG_LIKED:I = 0x8

.field public static final FLAG_POST_VERIFIED:I = 0x20

.field public static final FLAG_PRIVATE:I = 0x40

.field public static final FLAG_PROMOTED:I = 0x2

.field public static final FLAG_REVINED:I = 0x10

.field public static final FLAG_VERIFIED:I = 0x1


# instance fields
.field public avatarUrl:Ljava/lang/String;

.field public comments:Lco/vine/android/api/VinePagedData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/vine/android/api/VinePagedData",
            "<",
            "Lco/vine/android/api/VineComment;",
            ">;"
        }
    .end annotation
.end field

.field public commentsCount:I

.field public created:J

.field public description:Ljava/lang/String;

.field public descriptionSb:Landroid/text/SpannableStringBuilder;

.field public entities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;"
        }
    .end annotation
.end field

.field public foursquareVenueId:Ljava/lang/String;

.field public isLast:Z

.field public likes:Lco/vine/android/api/VinePagedData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/vine/android/api/VinePagedData",
            "<",
            "Lco/vine/android/api/VineLike;",
            ">;"
        }
    .end annotation
.end field

.field public likesCount:I

.field public location:Ljava/lang/String;

.field public metadataFlags:I

.field public myRepostId:J

.field public orderId:Ljava/lang/String;

.field public postFlags:I

.field public postId:J

.field public repost:Lco/vine/android/api/VineRepost;

.field public revinersCount:I

.field public shareUrl:Ljava/lang/String;

.field public tag:Ljava/lang/String;

.field public tags:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineTag;",
            ">;"
        }
    .end annotation
.end field

.field public thumbnailUrl:Ljava/lang/String;

.field public transientEntities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;"
        }
    .end annotation
.end field

.field public user:Lco/vine/android/api/VineUser;

.field public userId:J

.field public username:Ljava/lang/String;

.field public venueData:Lco/vine/android/api/VineVenue;

.field public videoLowURL:Ljava/lang/String;

.field public videoUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 438
    new-instance v0, Lco/vine/android/api/VinePost$1;

    invoke-direct {v0}, Lco/vine/android/api/VinePost$1;-><init>()V

    sput-object v0, Lco/vine/android/api/VinePost;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 4
    .parameter "in"

    .prologue
    const/4 v1, 0x1

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 80
    .local v0, cl:Ljava/lang/ClassLoader;
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lco/vine/android/api/VinePost;->created:J

    .line 81
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 82
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-ne v2, v1, :cond_0

    :goto_0
    iput-boolean v1, p0, Lco/vine/android/api/VinePost;->isLast:Z

    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lco/vine/android/api/VinePost;->postFlags:I

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lco/vine/android/api/VinePost;->likesCount:I

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lco/vine/android/api/VinePost;->revinersCount:I

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lco/vine/android/api/VinePost;->commentsCount:I

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VinePost;->userId:J

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VinePost;->postId:J

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VinePost;->myRepostId:J

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    .line 99
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VinePagedData;

    iput-object v1, p0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    .line 100
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VinePagedData;

    iput-object v1, p0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    .line 101
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineUser;

    iput-object v1, p0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    .line 102
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineVenue;

    iput-object v1, p0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    .line 103
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iput-object v1, p0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    .line 104
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineRepost;

    iput-object v1, p0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    .line 105
    return-void

    .line 82
    :cond_0
    const/4 v1, 0x0

    goto/16 :goto_0
.end method

.method public static from(Landroid/database/Cursor;)Lco/vine/android/api/VinePost;
    .locals 4
    .parameter "c"

    .prologue
    const/4 v1, 0x1

    .line 117
    new-instance v0, Lco/vine/android/api/VinePost;

    invoke-direct {v0}, Lco/vine/android/api/VinePost;-><init>()V

    .line 118
    .local v0, p:Lco/vine/android/api/VinePost;
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v0, Lco/vine/android/api/VinePost;->postId:J

    .line 119
    const/16 v2, 0x2c

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    .line 120
    const/16 v2, 0xd

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    .line 121
    const/4 v2, 0x2

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v0, Lco/vine/android/api/VinePost;->myRepostId:J

    .line 122
    const/4 v2, 0x5

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    .line 123
    const/4 v2, 0x7

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    .line 124
    const/4 v2, 0x6

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    .line 125
    const/16 v2, 0x8

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    .line 126
    const/16 v2, 0x9

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    .line 127
    const/16 v2, 0xa

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 128
    const/16 v2, 0xe

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-ne v2, v1, :cond_0

    :goto_0
    iput-boolean v1, v0, Lco/vine/android/api/VinePost;->isLast:Z

    .line 129
    const/16 v1, 0xb

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lco/vine/android/api/VinePost;->postFlags:I

    .line 130
    const/16 v1, 0x18

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lco/vine/android/api/VinePost;->likesCount:I

    .line 131
    const/16 v1, 0x19

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lco/vine/android/api/VinePost;->revinersCount:I

    .line 132
    const/16 v1, 0x1a

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    .line 133
    const/16 v1, 0x10

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lco/vine/android/api/VinePost;->userId:J

    .line 134
    const/16 v1, 0x11

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lco/vine/android/api/VinePost;->created:J

    .line 135
    const/16 v1, 0xf

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    .line 136
    const/16 v1, 0x12

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    .line 137
    const/16 v1, 0x13

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    .line 138
    const/4 v1, 0x4

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    .line 139
    new-instance v1, Lco/vine/android/api/VinePagedData;

    invoke-direct {v1}, Lco/vine/android/api/VinePagedData;-><init>()V

    iput-object v1, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    .line 140
    new-instance v1, Lco/vine/android/api/VinePagedData;

    invoke-direct {v1}, Lco/vine/android/api/VinePagedData;-><init>()V

    iput-object v1, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    .line 141
    const/16 v1, 0x14

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->fromByteArray([B)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineVenue;

    iput-object v1, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    .line 143
    const/16 v1, 0x15

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->fromByteArray([B)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iput-object v1, v0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    .line 145
    const/16 v1, 0x16

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->fromByteArray([B)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineRepost;

    iput-object v1, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    .line 147
    return-object v0

    .line 128
    :cond_0
    const/4 v1, 0x0

    goto/16 :goto_0
.end method

.method public static fromExplore(Landroid/database/Cursor;)Lco/vine/android/api/VinePost;
    .locals 4
    .parameter "c"

    .prologue
    const/4 v1, 0x1

    .line 160
    new-instance v0, Lco/vine/android/api/VinePost;

    invoke-direct {v0}, Lco/vine/android/api/VinePost;-><init>()V

    .line 162
    .local v0, p:Lco/vine/android/api/VinePost;
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v0, Lco/vine/android/api/VinePost;->postId:J

    .line 163
    const/16 v2, 0x1b

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    .line 164
    const/16 v2, 0xd

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    .line 165
    const/4 v2, 0x2

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v0, Lco/vine/android/api/VinePost;->myRepostId:J

    .line 166
    const/4 v2, 0x5

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    .line 167
    const/4 v2, 0x7

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    .line 168
    const/4 v2, 0x6

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    .line 169
    const/16 v2, 0x8

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    .line 170
    const/16 v2, 0x9

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    .line 171
    const/16 v2, 0xa

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 172
    const/16 v2, 0xe

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-ne v2, v1, :cond_0

    :goto_0
    iput-boolean v1, v0, Lco/vine/android/api/VinePost;->isLast:Z

    .line 173
    const/16 v1, 0xb

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lco/vine/android/api/VinePost;->postFlags:I

    .line 174
    const/16 v1, 0x18

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lco/vine/android/api/VinePost;->likesCount:I

    .line 175
    const/16 v1, 0x19

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lco/vine/android/api/VinePost;->revinersCount:I

    .line 176
    const/16 v1, 0x1a

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    .line 177
    const/16 v1, 0x10

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lco/vine/android/api/VinePost;->userId:J

    .line 178
    const/16 v1, 0x11

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lco/vine/android/api/VinePost;->created:J

    .line 179
    const/16 v1, 0xf

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    .line 180
    const/16 v1, 0x12

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    .line 181
    const/16 v1, 0x13

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    .line 182
    const/4 v1, 0x4

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    .line 183
    new-instance v1, Lco/vine/android/api/VinePagedData;

    invoke-direct {v1}, Lco/vine/android/api/VinePagedData;-><init>()V

    iput-object v1, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    .line 184
    new-instance v1, Lco/vine/android/api/VinePagedData;

    invoke-direct {v1}, Lco/vine/android/api/VinePagedData;-><init>()V

    iput-object v1, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    .line 185
    const/16 v1, 0x14

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->fromByteArray([B)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineVenue;

    iput-object v1, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    .line 187
    const/16 v1, 0x15

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->fromByteArray([B)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iput-object v1, v0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    .line 189
    const/16 v1, 0x16

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->fromByteArray([B)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineRepost;

    iput-object v1, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    .line 191
    return-object v0

    .line 172
    :cond_0
    const/4 v1, 0x0

    goto/16 :goto_0
.end method

.method public static getBytesFromTags(Lco/vine/android/api/VinePost;)[B
    .locals 6
    .parameter "post"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 196
    .local v0, bos:Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 197
    .local v2, out:Ljava/io/ObjectOutput;
    iget-object v4, p0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/api/VineTag;

    .line 198
    .local v3, tag:Lco/vine/android/api/VineTag;
    iget-wide v4, v3, Lco/vine/android/api/VineTag;->tagId:J

    invoke-interface {v2, v4, v5}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 199
    iget-object v4, v3, Lco/vine/android/api/VineTag;->tagName:Ljava/lang/String;

    invoke-interface {v2, v4}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 201
    .end local v3           #tag:Lco/vine/android/api/VineTag;
    :cond_0
    invoke-interface {v2}, Ljava/io/ObjectOutput;->flush()V

    .line 202
    invoke-interface {v2}, Ljava/io/ObjectOutput;->close()V

    .line 203
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 204
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    return-object v4
.end method

.method public static setTagFromBytes(Lco/vine/android/api/VinePost;[B)V
    .locals 8
    .parameter "post"
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 210
    .local v0, byteArrayInputStream:Ljava/io/ByteArrayInputStream;
    new-instance v2, Ljava/io/ObjectInputStream;

    invoke-direct {v2, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 211
    .local v2, ins:Ljava/io/ObjectInputStream;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    .line 216
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readLong()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v3

    .line 220
    .local v3, tagId:J
    :try_start_1
    iget-object v6, p0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    new-instance v7, Lco/vine/android/api/VineTag;

    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v7, v5, v3, v4}, Lco/vine/android/api/VineTag;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 223
    .end local v3           #tagId:J
    :catchall_0
    move-exception v5

    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    .line 224
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V

    throw v5

    .line 217
    :catch_0
    move-exception v1

    .line 223
    .local v1, e:Ljava/io/EOFException;
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    .line 224
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V

    .line 226
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 230
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 266
    if-ne p0, p1, :cond_1

    .line 318
    :cond_0
    :goto_0
    return v1

    .line 267
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 269
    check-cast v0, Lco/vine/android/api/VinePost;

    .line 271
    .local v0, vinePost:Lco/vine/android/api/VinePost;
    iget-wide v3, p0, Lco/vine/android/api/VinePost;->postId:J

    iget-wide v5, v0, Lco/vine/android/api/VinePost;->postId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_0

    .line 272
    :cond_4
    iget-wide v3, p0, Lco/vine/android/api/VinePost;->myRepostId:J

    iget-wide v5, v0, Lco/vine/android/api/VinePost;->myRepostId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_5

    move v1, v2

    goto :goto_0

    .line 273
    :cond_5
    iget v3, p0, Lco/vine/android/api/VinePost;->commentsCount:I

    iget v4, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    if-eq v3, v4, :cond_6

    move v1, v2

    goto :goto_0

    .line 274
    :cond_6
    iget-wide v3, p0, Lco/vine/android/api/VinePost;->created:J

    iget-wide v5, v0, Lco/vine/android/api/VinePost;->created:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_7

    move v1, v2

    goto :goto_0

    .line 275
    :cond_7
    iget v3, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    iget v4, v0, Lco/vine/android/api/VinePost;->metadataFlags:I

    if-eq v3, v4, :cond_8

    move v1, v2

    goto :goto_0

    .line 276
    :cond_8
    iget-boolean v3, p0, Lco/vine/android/api/VinePost;->isLast:Z

    iget-boolean v4, v0, Lco/vine/android/api/VinePost;->isLast:Z

    if-eq v3, v4, :cond_9

    move v1, v2

    goto :goto_0

    .line 277
    :cond_9
    iget v3, p0, Lco/vine/android/api/VinePost;->likesCount:I

    iget v4, v0, Lco/vine/android/api/VinePost;->likesCount:I

    if-eq v3, v4, :cond_a

    move v1, v2

    goto :goto_0

    .line 278
    :cond_a
    iget v3, p0, Lco/vine/android/api/VinePost;->revinersCount:I

    iget v4, v0, Lco/vine/android/api/VinePost;->revinersCount:I

    if-eq v3, v4, :cond_b

    move v1, v2

    goto :goto_0

    .line 279
    :cond_b
    iget v3, p0, Lco/vine/android/api/VinePost;->postFlags:I

    iget v4, v0, Lco/vine/android/api/VinePost;->postFlags:I

    if-eq v3, v4, :cond_c

    move v1, v2

    goto :goto_0

    .line 280
    :cond_c
    iget-wide v3, p0, Lco/vine/android/api/VinePost;->userId:J

    iget-wide v5, v0, Lco/vine/android/api/VinePost;->userId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_d

    move v1, v2

    goto :goto_0

    .line 281
    :cond_d
    iget-object v3, p0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    if-eqz v3, :cond_f

    iget-object v3, p0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10

    :cond_e
    move v1, v2

    .line 282
    goto :goto_0

    .line 281
    :cond_f
    iget-object v3, v0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    if-nez v3, :cond_e

    .line 283
    :cond_10
    iget-object v3, p0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    if-eqz v3, :cond_12

    iget-object v3, p0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    :cond_11
    move v1, v2

    .line 284
    goto/16 :goto_0

    .line 283
    :cond_12
    iget-object v3, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    if-nez v3, :cond_11

    .line 285
    :cond_13
    iget-object v3, p0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    if-eqz v3, :cond_15

    iget-object v3, p0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_16

    :cond_14
    move v1, v2

    .line 287
    goto/16 :goto_0

    .line 285
    :cond_15
    iget-object v3, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    if-nez v3, :cond_14

    .line 288
    :cond_16
    iget-object v3, p0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    if-eqz v3, :cond_18

    iget-object v3, p0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_19

    :cond_17
    move v1, v2

    .line 289
    goto/16 :goto_0

    .line 288
    :cond_18
    iget-object v3, v0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    if-nez v3, :cond_17

    .line 290
    :cond_19
    iget-object v3, p0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    if-eqz v3, :cond_1b

    iget-object v3, p0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c

    :cond_1a
    move v1, v2

    .line 292
    goto/16 :goto_0

    .line 290
    :cond_1b
    iget-object v3, v0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    if-nez v3, :cond_1a

    .line 293
    :cond_1c
    iget-object v3, p0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    if-eqz v3, :cond_1e

    iget-object v3, p0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f

    :cond_1d
    move v1, v2

    goto/16 :goto_0

    :cond_1e
    iget-object v3, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    if-nez v3, :cond_1d

    .line 294
    :cond_1f
    iget-object v3, p0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    if-eqz v3, :cond_21

    iget-object v3, p0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    :cond_20
    move v1, v2

    .line 295
    goto/16 :goto_0

    .line 294
    :cond_21
    iget-object v3, v0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 296
    :cond_22
    iget-object v3, p0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    if-eqz v3, :cond_24

    iget-object v3, p0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_25

    :cond_23
    move v1, v2

    .line 297
    goto/16 :goto_0

    .line 296
    :cond_24
    iget-object v3, v0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    if-nez v3, :cond_23

    .line 298
    :cond_25
    iget-object v3, p0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    if-eqz v3, :cond_27

    iget-object v3, p0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28

    :cond_26
    move v1, v2

    .line 299
    goto/16 :goto_0

    .line 298
    :cond_27
    iget-object v3, v0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    if-nez v3, :cond_26

    .line 300
    :cond_28
    iget-object v3, p0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    if-eqz v3, :cond_2a

    iget-object v3, p0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2b

    :cond_29
    move v1, v2

    .line 301
    goto/16 :goto_0

    .line 300
    :cond_2a
    iget-object v3, v0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    if-nez v3, :cond_29

    .line 302
    :cond_2b
    iget-object v3, p0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    if-eqz v3, :cond_2d

    iget-object v3, p0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    :cond_2c
    move v1, v2

    goto/16 :goto_0

    :cond_2d
    iget-object v3, v0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    if-nez v3, :cond_2c

    .line 303
    :cond_2e
    iget-object v3, p0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    if-eqz v3, :cond_30

    iget-object v3, p0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_31

    :cond_2f
    move v1, v2

    .line 305
    goto/16 :goto_0

    .line 303
    :cond_30
    iget-object v3, v0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    if-nez v3, :cond_2f

    .line 306
    :cond_31
    iget-object v3, p0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    if-eqz v3, :cond_33

    iget-object v3, p0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v3, v4}, Lco/vine/android/api/VineUser;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_34

    :cond_32
    move v1, v2

    goto/16 :goto_0

    :cond_33
    iget-object v3, v0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    if-nez v3, :cond_32

    .line 307
    :cond_34
    iget-object v3, p0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    if-eqz v3, :cond_36

    iget-object v3, p0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_37

    :cond_35
    move v1, v2

    .line 308
    goto/16 :goto_0

    .line 307
    :cond_36
    iget-object v3, v0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    if-nez v3, :cond_35

    .line 309
    :cond_37
    iget-object v3, p0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    if-eqz v3, :cond_39

    iget-object v3, p0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    invoke-virtual {v3, v4}, Lco/vine/android/api/VineVenue;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3a

    :cond_38
    move v1, v2

    .line 310
    goto/16 :goto_0

    .line 309
    :cond_39
    iget-object v3, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    if-nez v3, :cond_38

    .line 311
    :cond_3a
    iget-object v3, p0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    if-eqz v3, :cond_3c

    iget-object v3, p0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3d

    :cond_3b
    move v1, v2

    .line 313
    goto/16 :goto_0

    .line 311
    :cond_3c
    iget-object v3, v0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    if-nez v3, :cond_3b

    .line 314
    :cond_3d
    iget-object v3, p0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    if-eqz v3, :cond_3f

    iget-object v3, p0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_40

    :cond_3e
    move v1, v2

    .line 315
    goto/16 :goto_0

    .line 314
    :cond_3f
    iget-object v3, v0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    if-nez v3, :cond_3e

    .line 316
    :cond_40
    iget-object v3, p0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    if-eqz v3, :cond_41

    iget-object v3, p0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    iget-object v4, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    invoke-virtual {v3, v4}, Lco/vine/android/api/VineRepost;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 317
    goto/16 :goto_0

    .line 316
    :cond_41
    iget-object v3, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 8

    .prologue
    const/16 v7, 0x20

    const/4 v2, 0x0

    .line 323
    iget-wide v3, p0, Lco/vine/android/api/VinePost;->created:J

    iget-wide v5, p0, Lco/vine/android/api/VinePost;->created:J

    ushr-long/2addr v5, v7

    xor-long/2addr v3, v5

    long-to-int v0, v3

    .line 324
    .local v0, result:I
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    add-int v0, v1, v3

    .line 325
    mul-int/lit8 v3, v0, 0x1f

    iget-boolean v1, p0, Lco/vine/android/api/VinePost;->isLast:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    add-int v0, v3, v1

    .line 326
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lco/vine/android/api/VinePost;->postFlags:I

    add-int v0, v1, v3

    .line 327
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v3, p0, Lco/vine/android/api/VinePost;->userId:J

    iget-wide v5, p0, Lco/vine/android/api/VinePost;->userId:J

    ushr-long/2addr v5, v7

    xor-long/2addr v3, v5

    long-to-int v3, v3

    add-int v0, v1, v3

    .line 328
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v3, p0, Lco/vine/android/api/VinePost;->postId:J

    iget-wide v5, p0, Lco/vine/android/api/VinePost;->postId:J

    ushr-long/2addr v5, v7

    xor-long/2addr v3, v5

    long-to-int v3, v3

    add-int v0, v1, v3

    .line 329
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v3, p0, Lco/vine/android/api/VinePost;->myRepostId:J

    iget-wide v5, p0, Lco/vine/android/api/VinePost;->myRepostId:J

    ushr-long/2addr v5, v7

    xor-long/2addr v3, v5

    long-to-int v3, v3

    add-int v0, v1, v3

    .line 330
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lco/vine/android/api/VinePost;->likesCount:I

    add-int v0, v1, v3

    .line 331
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lco/vine/android/api/VinePost;->revinersCount:I

    add-int v0, v1, v3

    .line 332
    mul-int/lit8 v1, v0, 0x1f

    iget v3, p0, Lco/vine/android/api/VinePost;->commentsCount:I

    add-int v0, v1, v3

    .line 333
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_1
    add-int v0, v3, v1

    .line 334
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_2
    add-int v0, v3, v1

    .line 335
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_3
    add-int v0, v3, v1

    .line 336
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_4
    add-int v0, v3, v1

    .line 337
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_5
    add-int v0, v3, v1

    .line 338
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    if-eqz v1, :cond_7

    iget-object v1, p0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_6
    add-int v0, v3, v1

    .line 339
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_7
    add-int v0, v3, v1

    .line 340
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    if-eqz v1, :cond_9

    iget-object v1, p0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_8
    add-int v0, v3, v1

    .line 341
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    if-eqz v1, :cond_a

    iget-object v1, p0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_9
    add-int v0, v3, v1

    .line 342
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    if-eqz v1, :cond_b

    iget-object v1, p0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_a
    add-int v0, v3, v1

    .line 343
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_b
    add-int v0, v3, v1

    .line 344
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->hashCode()I

    move-result v1

    :goto_c
    add-int v0, v3, v1

    .line 345
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->hashCode()I

    move-result v1

    :goto_d
    add-int v0, v3, v1

    .line 346
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    if-eqz v1, :cond_f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_e
    add-int v0, v3, v1

    .line 347
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    if-eqz v1, :cond_10

    iget-object v1, p0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_f
    add-int v0, v3, v1

    .line 348
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    if-eqz v1, :cond_11

    iget-object v1, p0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v1}, Lco/vine/android/api/VineUser;->hashCode()I

    move-result v1

    :goto_10
    add-int v0, v3, v1

    .line 349
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    if-eqz v1, :cond_12

    iget-object v1, p0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    invoke-virtual {v1}, Lco/vine/android/api/VineVenue;->hashCode()I

    move-result v1

    :goto_11
    add-int v0, v3, v1

    .line 350
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    if-eqz v3, :cond_0

    iget-object v2, p0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    invoke-virtual {v2}, Lco/vine/android/api/VineRepost;->hashCode()I

    move-result v2

    :cond_0
    add-int v0, v1, v2

    .line 351
    return v0

    :cond_1
    move v1, v2

    .line 325
    goto/16 :goto_0

    :cond_2
    move v1, v2

    .line 333
    goto/16 :goto_1

    :cond_3
    move v1, v2

    .line 334
    goto/16 :goto_2

    :cond_4
    move v1, v2

    .line 335
    goto/16 :goto_3

    :cond_5
    move v1, v2

    .line 336
    goto/16 :goto_4

    :cond_6
    move v1, v2

    .line 337
    goto/16 :goto_5

    :cond_7
    move v1, v2

    .line 338
    goto/16 :goto_6

    :cond_8
    move v1, v2

    .line 339
    goto/16 :goto_7

    :cond_9
    move v1, v2

    .line 340
    goto/16 :goto_8

    :cond_a
    move v1, v2

    .line 341
    goto/16 :goto_9

    :cond_b
    move v1, v2

    .line 342
    goto/16 :goto_a

    :cond_c
    move v1, v2

    .line 343
    goto/16 :goto_b

    :cond_d
    move v1, v2

    .line 344
    goto :goto_c

    :cond_e
    move v1, v2

    .line 345
    goto :goto_d

    :cond_f
    move v1, v2

    .line 346
    goto :goto_e

    :cond_10
    move v1, v2

    .line 347
    goto :goto_f

    :cond_11
    move v1, v2

    .line 348
    goto :goto_10

    :cond_12
    move v1, v2

    .line 349
    goto :goto_11
.end method

.method public isExplicit()Z
    .locals 1

    .prologue
    .line 415
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLiked()Z
    .locals 1

    .prologue
    .line 423
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPrivate()Z
    .locals 1

    .prologue
    .line 431
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPromoted()Z
    .locals 1

    .prologue
    .line 419
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRevined()Z
    .locals 1

    .prologue
    .line 427
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isShareable()Z
    .locals 1

    .prologue
    .line 435
    iget-object v0, p0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isVerified()Z
    .locals 1

    .prologue
    .line 411
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setFlagExplicit(Z)V
    .locals 1
    .parameter "explicit"

    .prologue
    .line 363
    if-eqz p1, :cond_0

    .line 364
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 368
    :goto_0
    return-void

    .line 366
    :cond_0
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    goto :goto_0
.end method

.method public setFlagLiked(Z)V
    .locals 1
    .parameter "liked"

    .prologue
    .line 379
    if-eqz p1, :cond_0

    .line 380
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 384
    :goto_0
    return-void

    .line 382
    :cond_0
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    goto :goto_0
.end method

.method public setFlagPostVerified(Z)V
    .locals 1
    .parameter "postVerified"

    .prologue
    .line 395
    if-eqz p1, :cond_0

    .line 396
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 400
    :goto_0
    return-void

    .line 398
    :cond_0
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    goto :goto_0
.end method

.method public setFlagPrivate(Z)V
    .locals 1
    .parameter "priv"

    .prologue
    .line 403
    if-eqz p1, :cond_0

    .line 404
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 408
    :goto_0
    return-void

    .line 406
    :cond_0
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    goto :goto_0
.end method

.method public setFlagPromoted(Z)V
    .locals 1
    .parameter "promoted"

    .prologue
    .line 371
    if-eqz p1, :cond_0

    .line 372
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 376
    :goto_0
    return-void

    .line 374
    :cond_0
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    goto :goto_0
.end method

.method public setFlagRevined(Z)V
    .locals 1
    .parameter "revined"

    .prologue
    .line 387
    if-eqz p1, :cond_0

    .line 388
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 392
    :goto_0
    return-void

    .line 390
    :cond_0
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    goto :goto_0
.end method

.method public setFlagVerified(Z)V
    .locals 1
    .parameter "verified"

    .prologue
    .line 355
    if-eqz p1, :cond_0

    .line 356
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    .line 360
    :goto_0
    return-void

    .line 358
    :cond_0
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 235
    iget-wide v0, p0, Lco/vine/android/api/VinePost;->created:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 236
    iget v0, p0, Lco/vine/android/api/VinePost;->metadataFlags:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 237
    iget-boolean v0, p0, Lco/vine/android/api/VinePost;->isLast:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 238
    iget v0, p0, Lco/vine/android/api/VinePost;->postFlags:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 239
    iget v0, p0, Lco/vine/android/api/VinePost;->likesCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 240
    iget v0, p0, Lco/vine/android/api/VinePost;->revinersCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 241
    iget v0, p0, Lco/vine/android/api/VinePost;->commentsCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 242
    iget-wide v0, p0, Lco/vine/android/api/VinePost;->userId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 243
    iget-wide v0, p0, Lco/vine/android/api/VinePost;->postId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 244
    iget-wide v0, p0, Lco/vine/android/api/VinePost;->myRepostId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 245
    iget-object v0, p0, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 246
    iget-object v0, p0, Lco/vine/android/api/VinePost;->tag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 247
    iget-object v0, p0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 248
    iget-object v0, p0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 249
    iget-object v0, p0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 250
    iget-object v0, p0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 251
    iget-object v0, p0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 252
    iget-object v0, p0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 253
    iget-object v0, p0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 254
    iget-object v0, p0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 255
    iget-object v0, p0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 256
    iget-object v0, p0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 257
    iget-object v0, p0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 258
    iget-object v0, p0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 259
    iget-object v0, p0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 260
    iget-object v0, p0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 261
    iget-object v0, p0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 262
    return-void

    .line 237
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
