.class public Lco/vine/android/api/VineUpload;
.super Ljava/lang/Object;
.source "VineUpload.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/api/VineUpload$PostInfo;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lco/vine/android/api/VineUpload;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public captchaUrl:Ljava/lang/String;

.field public hash:Ljava/lang/String;

.field public id:J

.field public path:Ljava/lang/String;

.field public postInfo:Ljava/lang/String;

.field public reference:Ljava/lang/String;

.field public status:I

.field public thumbnailPath:Ljava/lang/String;

.field public thumbnailUrl:Ljava/lang/String;

.field public uploadTime:J

.field public videoUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 133
    new-instance v0, Lco/vine/android/api/VineUpload$1;

    invoke-direct {v0}, Lco/vine/android/api/VineUpload$1;-><init>()V

    sput-object v0, Lco/vine/android/api/VineUpload;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .parameter "in"

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUpload;->status:I

    .line 62
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/api/VineUpload;->id:J

    .line 63
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/api/VineUpload;->uploadTime:J

    .line 64
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    .line 65
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUpload;->hash:Ljava/lang/String;

    .line 66
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    .line 67
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUpload;->thumbnailPath:Ljava/lang/String;

    .line 68
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUpload;->thumbnailUrl:Ljava/lang/String;

    .line 69
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUpload;->reference:Ljava/lang/String;

    .line 70
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUpload;->captchaUrl:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .parameter "path"
    .parameter "hash"
    .parameter "postInfo"
    .parameter "videoUrl"
    .parameter "thumbnailPath"
    .parameter "thumbnailUrl"
    .parameter "uploadTime"
    .parameter "reference"
    .parameter "status"
    .parameter "captchaUrl"

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    .line 42
    iput-object p2, p0, Lco/vine/android/api/VineUpload;->hash:Ljava/lang/String;

    .line 43
    iput-object p3, p0, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    .line 44
    iput-object p4, p0, Lco/vine/android/api/VineUpload;->videoUrl:Ljava/lang/String;

    .line 45
    iput-object p5, p0, Lco/vine/android/api/VineUpload;->thumbnailPath:Ljava/lang/String;

    .line 46
    iput-object p6, p0, Lco/vine/android/api/VineUpload;->thumbnailUrl:Ljava/lang/String;

    .line 47
    iput-object p8, p0, Lco/vine/android/api/VineUpload;->reference:Ljava/lang/String;

    .line 48
    iput p9, p0, Lco/vine/android/api/VineUpload;->status:I

    .line 51
    invoke-static {p7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 52
    invoke-static {p7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/api/VineUpload;->uploadTime:J

    .line 57
    :goto_0
    iput-object p10, p0, Lco/vine/android/api/VineUpload;->captchaUrl:Ljava/lang/String;

    .line 58
    return-void

    .line 54
    :cond_0
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lco/vine/android/api/VineUpload;->uploadTime:J

    goto :goto_0
.end method

.method public static declared-synchronized fromCursor(Ljava/lang/String;Landroid/database/Cursor;)Lco/vine/android/api/VineUpload;
    .locals 12
    .parameter "path"
    .parameter "c"

    .prologue
    .line 79
    const-class v11, Lco/vine/android/api/VineUpload;

    monitor-enter v11

    const/4 v0, 0x2

    :try_start_0
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 80
    .local v2, hash:Ljava/lang/String;
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 81
    .local v3, postInfo:Ljava/lang/String;
    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 82
    .local v4, videoUrl:Ljava/lang/String;
    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 83
    .local v5, thumbnailPath:Ljava/lang/String;
    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 84
    .local v6, thumbnailUrl:Ljava/lang/String;
    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 85
    .local v7, uploadTime:Ljava/lang/String;
    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 86
    .local v8, reference:Ljava/lang/String;
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 87
    .local v9, status:I
    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 89
    .local v10, captchaUrl:Ljava/lang/String;
    new-instance v0, Lco/vine/android/api/VineUpload;

    move-object v1, p0

    invoke-direct/range {v0 .. v10}, Lco/vine/android/api/VineUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v11

    return-object v0

    .line 79
    .end local v2           #hash:Ljava/lang/String;
    .end local v3           #postInfo:Ljava/lang/String;
    .end local v4           #videoUrl:Ljava/lang/String;
    .end local v5           #thumbnailPath:Ljava/lang/String;
    .end local v6           #thumbnailUrl:Ljava/lang/String;
    .end local v7           #uploadTime:Ljava/lang/String;
    .end local v8           #reference:Ljava/lang/String;
    .end local v9           #status:I
    .end local v10           #captchaUrl:Ljava/lang/String;
    :catchall_0
    move-exception v0

    monitor-exit v11

    throw v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x0

    return v0
.end method

.method public getPostInfo()Lco/vine/android/api/VineUpload$PostInfo;
    .locals 2

    .prologue
    .line 98
    const-string v0, "Post info: {}."

    iget-object v1, p0, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 99
    iget-object v0, p0, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    const/4 v0, 0x0

    .line 102
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    invoke-static {v0}, Lco/vine/android/api/VineUpload$PostInfo;->fromJsonString(Ljava/lang/String;)Lco/vine/android/api/VineUpload$PostInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public getUris()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 107
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lco/vine/android/api/VineUpload;->videoUrl:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lco/vine/android/api/VineUpload;->thumbnailUrl:Ljava/lang/String;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public isExpired()Z
    .locals 4

    .prologue
    .line 94
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lco/vine/android/api/VineUpload;->uploadTime:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x5265c00

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCaptchaUrl(Ljava/lang/String;)V
    .locals 0
    .parameter "captchaUrl"

    .prologue
    .line 116
    iput-object p1, p0, Lco/vine/android/api/VineUpload;->captchaUrl:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public setUris([Ljava/lang/String;)V
    .locals 1
    .parameter "uris"

    .prologue
    .line 111
    const/4 v0, 0x0

    aget-object v0, p1, v0

    iput-object v0, p0, Lco/vine/android/api/VineUpload;->videoUrl:Ljava/lang/String;

    .line 112
    const/4 v0, 0x1

    aget-object v0, p1, v0

    iput-object v0, p0, Lco/vine/android/api/VineUpload;->thumbnailUrl:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 121
    iget v0, p0, Lco/vine/android/api/VineUpload;->status:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 122
    iget-wide v0, p0, Lco/vine/android/api/VineUpload;->id:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 123
    iget-wide v0, p0, Lco/vine/android/api/VineUpload;->uploadTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 124
    iget-object v0, p0, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 125
    iget-object v0, p0, Lco/vine/android/api/VineUpload;->hash:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lco/vine/android/api/VineUpload;->thumbnailPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lco/vine/android/api/VineUpload;->thumbnailUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 129
    iget-object v0, p0, Lco/vine/android/api/VineUpload;->reference:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lco/vine/android/api/VineUpload;->captchaUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 131
    return-void
.end method
