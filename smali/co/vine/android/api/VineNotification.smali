.class public Lco/vine/android/api/VineNotification;
.super Ljava/lang/Object;
.source "VineNotification.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final FOLLOWING:I = 0x1

.field public static final FOLLOW_REQUESTED:I = 0x2

.field public static final PRIVATE:I = 0x4


# instance fields
.field public avatarUrl:Ljava/lang/String;

.field public comment:Ljava/lang/String;

.field public createdAt:J

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

.field public followStatus:I

.field public notificationId:J

.field public notificationType:I

.field public postId:J

.field public thumbnailUrl:Ljava/lang/String;

.field public userId:J

.field public username:Ljava/lang/String;

.field public verified:Z


# direct methods
.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .parameter "in"

    .prologue
    const/4 v0, 0x1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineNotification;->avatarUrl:Ljava/lang/String;

    .line 57
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineNotification;->username:Ljava/lang/String;

    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineNotification;->thumbnailUrl:Ljava/lang/String;

    .line 59
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineNotification;->comment:Ljava/lang/String;

    .line 60
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VineNotification;->notificationId:J

    .line 61
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VineNotification;->userId:J

    .line 62
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VineNotification;->postId:J

    .line 63
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VineNotification;->createdAt:J

    .line 64
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lco/vine/android/api/VineNotification;->verified:Z

    .line 65
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineNotification;->notificationType:I

    .line 66
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lco/vine/android/api/VineNotification;->entities:Ljava/util/ArrayList;

    .line 67
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineNotification;->followStatus:I

    .line 68
    return-void

    .line 64
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJJJZILjava/util/ArrayList;)V
    .locals 0
    .parameter "avatarUrl"
    .parameter "username"
    .parameter "thumbnailUrl"
    .parameter "comment"
    .parameter "notificationId"
    .parameter "userId"
    .parameter "postId"
    .parameter "createdAt"
    .parameter "verified"
    .parameter "notificationType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JJJJZI",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p15, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lco/vine/android/api/VineNotification;->avatarUrl:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lco/vine/android/api/VineNotification;->username:Ljava/lang/String;

    .line 38
    iput-object p3, p0, Lco/vine/android/api/VineNotification;->thumbnailUrl:Ljava/lang/String;

    .line 39
    iput-object p4, p0, Lco/vine/android/api/VineNotification;->comment:Ljava/lang/String;

    .line 40
    iput-wide p5, p0, Lco/vine/android/api/VineNotification;->notificationId:J

    .line 41
    iput-wide p7, p0, Lco/vine/android/api/VineNotification;->userId:J

    .line 42
    iput-wide p9, p0, Lco/vine/android/api/VineNotification;->postId:J

    .line 43
    iput-wide p11, p0, Lco/vine/android/api/VineNotification;->createdAt:J

    .line 44
    iput-boolean p13, p0, Lco/vine/android/api/VineNotification;->verified:Z

    .line 45
    iput p14, p0, Lco/vine/android/api/VineNotification;->notificationType:I

    .line 46
    iput-object p15, p0, Lco/vine/android/api/VineNotification;->entities:Ljava/util/ArrayList;

    .line 47
    return-void
.end method

.method public static isLocked(I)Z
    .locals 2
    .parameter "followStatus"

    .prologue
    const/4 v0, 0x1

    .line 106
    and-int/lit8 v1, p0, 0x4

    if-lt v1, v0, :cond_1

    and-int/lit8 v1, p0, 0x2

    if-ge v1, v0, :cond_0

    and-int/lit8 v1, p0, 0x1

    if-ge v1, v0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    return v0
.end method

.method public setFollowRequested()V
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lco/vine/android/api/VineNotification;->followStatus:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lco/vine/android/api/VineNotification;->followStatus:I

    .line 88
    return-void
.end method

.method public setFollowing()V
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lco/vine/android/api/VineNotification;->followStatus:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lco/vine/android/api/VineNotification;->followStatus:I

    .line 92
    return-void
.end method

.method public setPrivate()V
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lco/vine/android/api/VineNotification;->followStatus:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lco/vine/android/api/VineNotification;->followStatus:I

    .line 96
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 72
    iget-object v0, p0, Lco/vine/android/api/VineNotification;->avatarUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 73
    iget-object v0, p0, Lco/vine/android/api/VineNotification;->username:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lco/vine/android/api/VineNotification;->thumbnailUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lco/vine/android/api/VineNotification;->comment:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 76
    iget-wide v0, p0, Lco/vine/android/api/VineNotification;->notificationId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 77
    iget-wide v0, p0, Lco/vine/android/api/VineNotification;->userId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 78
    iget-wide v0, p0, Lco/vine/android/api/VineNotification;->postId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 79
    iget-wide v0, p0, Lco/vine/android/api/VineNotification;->createdAt:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 80
    iget-boolean v0, p0, Lco/vine/android/api/VineNotification;->verified:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 81
    iget v0, p0, Lco/vine/android/api/VineNotification;->notificationType:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 82
    iget-object v0, p0, Lco/vine/android/api/VineNotification;->entities:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 83
    iget v0, p0, Lco/vine/android/api/VineNotification;->followStatus:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 84
    return-void

    .line 80
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
