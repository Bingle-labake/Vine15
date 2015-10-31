.class public Lco/vine/android/util/MediaUtility;
.super Ljava/lang/Object;
.source "MediaUtility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/util/MediaUtility$FileInfo;
    }
.end annotation


# static fields
.field public static final MEDIA:I = 0x2

.field public static final S3:I = 0x1


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lco/vine/android/util/MediaUtility;->mContext:Landroid/content/Context;

    .line 34
    return-void
.end method

.method public static getUploadType(Landroid/content/Context;)I
    .locals 5
    .parameter "context"

    .prologue
    const/4 v1, 0x1

    .line 37
    invoke-static {p0, v1}, Lco/vine/android/client/VineAccountHelper;->isLoggedIn(Landroid/content/Context;Z)Z

    move-result v2

    if-nez v2, :cond_1

    .line 45
    :cond_0
    :goto_0
    return v1

    .line 40
    :cond_1
    invoke-static {p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "server_upload_type"

    const-string v4, "media"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, uploadType:Ljava/lang/String;
    const-string v2, "s3"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 45
    const/4 v1, 0x2

    goto :goto_0
.end method


# virtual methods
.method public getPhotoUri(Landroid/net/Uri;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 8
    .parameter "avatarFileUri"
    .parameter "pictureBucket"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "avatars/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ".jpg"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 168
    .local v2, filename:Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 169
    invoke-static {p3, p1}, Lco/vine/android/util/image/ImageUtils;->getRealPathFromImageUri(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v7

    .line 171
    .local v7, realFileUrl:Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v5, "avatars"

    move-object v0, p0

    move-object v4, p2

    invoke-virtual/range {v0 .. v5}, Lco/vine/android/util/MediaUtility;->upload(Lco/vine/android/util/VineProgressListener;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lco/vine/android/util/MediaUtility$FileInfo;

    move-result-object v6

    .line 173
    .local v6, info:Lco/vine/android/util/MediaUtility$FileInfo;
    if-eqz v6, :cond_0

    .line 174
    iget-object v1, v6, Lco/vine/android/util/MediaUtility$FileInfo;->uploadKey:Ljava/lang/String;

    .line 179
    .end local v6           #info:Lco/vine/android/util/MediaUtility$FileInfo;
    .end local v7           #realFileUrl:Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method public getThumbnailUri(Lco/vine/android/util/VineProgressListener;Ljava/lang/String;Ljava/io/File;Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .parameter "listener"
    .parameter "filename"
    .parameter "thumbnail"
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 139
    invoke-static {p4}, Lco/vine/android/client/Amazon;->getBucket(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 140
    .local v4, videoBucket:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "thumbs/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 141
    const-string v5, "thumbs"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lco/vine/android/util/MediaUtility;->upload(Lco/vine/android/util/VineProgressListener;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lco/vine/android/util/MediaUtility$FileInfo;

    move-result-object v6

    .line 142
    .local v6, info:Lco/vine/android/util/MediaUtility$FileInfo;
    if-eqz v6, :cond_0

    .line 143
    iget-object v0, v6, Lco/vine/android/util/MediaUtility$FileInfo;->uploadKey:Ljava/lang/String;

    .line 145
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getVideoUri(Lco/vine/android/util/VineProgressListener;Ljava/io/File;Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "listener"
    .parameter "file"
    .parameter "context"
    .parameter "filename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 152
    invoke-static {p3}, Lco/vine/android/client/Amazon;->getBucket(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 153
    .local v4, videoBucket:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "videos/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    .line 154
    const-string v5, "videos"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p4

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Lco/vine/android/util/MediaUtility;->upload(Lco/vine/android/util/VineProgressListener;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lco/vine/android/util/MediaUtility$FileInfo;

    move-result-object v6

    .line 155
    .local v6, info:Lco/vine/android/util/MediaUtility$FileInfo;
    if-eqz v6, :cond_0

    .line 156
    iget-object v0, v6, Lco/vine/android/util/MediaUtility$FileInfo;->uploadKey:Ljava/lang/String;

    .line 158
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public upload(Lco/vine/android/util/VineProgressListener;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lco/vine/android/util/MediaUtility$FileInfo;
    .locals 9
    .parameter "listener"
    .parameter "key"
    .parameter "fileToUpload"
    .parameter "bucket"
    .parameter "type"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 52
    const-string v4, "Upload started for {}."

    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    iget-object v4, p0, Lco/vine/android/util/MediaUtility;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/util/MediaUtility;->getUploadType(Landroid/content/Context;)I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 134
    :cond_0
    :goto_0
    const/4 v4, 0x0

    :goto_1
    return-object v4

    .line 85
    :pswitch_0
    const-string v4, ".mp4"

    invoke-virtual {p2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 86
    const-string v4, "Upload video through media."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 87
    iget-object v4, p0, Lco/vine/android/util/MediaUtility;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->get(Landroid/content/Context;)Lco/vine/android/util/BuildUtil;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/util/BuildUtil;->getMediaUrl()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "upload"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "videos"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".mp4"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 96
    .local v3, url:Ljava/lang/StringBuilder;
    new-instance v0, Lco/vine/android/util/MeasureOutputStream;

    const-string v4, "video/mp4"

    invoke-direct {v0, p3, v4, p1}, Lco/vine/android/util/MeasureOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;Lco/vine/android/util/VineProgressListener;)V

    .line 97
    .local v0, entity:Lco/vine/android/util/MeasureOutputStream;
    const/16 v4, 0x10

    invoke-static {v4}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v2

    .line 99
    .local v2, reader:Lco/vine/android/api/VineParserReader;
    iget-object v4, p0, Lco/vine/android/util/MediaUtility;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/util/MediaUtility;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v5

    invoke-static {v4, v3, v2, v0, v5}, Lco/vine/android/network/HttpOperation;->createMediaPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/network/HttpOperationReader;Lorg/apache/http/HttpEntity;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v1

    .line 102
    .local v1, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {v1}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 103
    const-string v4, "Upload {} successful."

    iget-object v5, v1, Lco/vine/android/network/HttpOperation;->uploadKey:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 104
    new-instance v4, Lco/vine/android/util/MediaUtility$FileInfo;

    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v1, Lco/vine/android/network/HttpOperation;->uploadKey:Ljava/lang/String;

    invoke-direct {v4, v5, p3, v6}, Lco/vine/android/util/MediaUtility$FileInfo;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V

    goto :goto_1

    .line 106
    :cond_1
    const-string v4, "{} {} {}"

    iget v5, v1, Lco/vine/android/network/HttpOperation;->statusCode:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v6, v1, Lco/vine/android/network/HttpOperation;->statusPhrase:Ljava/lang/String;

    invoke-static {v4, v3, v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 108
    .end local v0           #entity:Lco/vine/android/util/MeasureOutputStream;
    .end local v1           #op:Lco/vine/android/network/HttpOperation;
    .end local v2           #reader:Lco/vine/android/api/VineParserReader;
    .end local v3           #url:Ljava/lang/StringBuilder;
    :cond_2
    const-string v4, "jpg"

    invoke-virtual {p2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 109
    const-string v4, "Upload image through media."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 110
    iget-object v4, p0, Lco/vine/android/util/MediaUtility;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->get(Landroid/content/Context;)Lco/vine/android/util/BuildUtil;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/util/BuildUtil;->getMediaUrl()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "upload"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p5, v5, v6

    const/4 v6, 0x2

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".jpg"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 118
    .restart local v3       #url:Ljava/lang/StringBuilder;
    new-instance v0, Lco/vine/android/util/MeasureOutputStream;

    const-string v4, "image/jpeg"

    invoke-direct {v0, p3, v4, p1}, Lco/vine/android/util/MeasureOutputStream;-><init>(Ljava/io/File;Ljava/lang/String;Lco/vine/android/util/VineProgressListener;)V

    .line 119
    .restart local v0       #entity:Lco/vine/android/util/MeasureOutputStream;
    const/16 v4, 0x10

    invoke-static {v4}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v2

    .line 121
    .restart local v2       #reader:Lco/vine/android/api/VineParserReader;
    iget-object v4, p0, Lco/vine/android/util/MediaUtility;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/util/MediaUtility;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v5

    invoke-static {v4, v3, v2, v0, v5}, Lco/vine/android/network/HttpOperation;->createMediaPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/network/HttpOperationReader;Lorg/apache/http/HttpEntity;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v1

    .line 124
    .restart local v1       #op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {v1}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 125
    const-string v4, "Upload {} successful."

    iget-object v5, v1, Lco/vine/android/network/HttpOperation;->uploadKey:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    new-instance v4, Lco/vine/android/util/MediaUtility$FileInfo;

    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v1, Lco/vine/android/network/HttpOperation;->uploadKey:Ljava/lang/String;

    invoke-direct {v4, v5, p3, v6}, Lco/vine/android/util/MediaUtility$FileInfo;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 128
    :cond_3
    const-string v4, "{} {} {}"

    iget v5, v1, Lco/vine/android/network/HttpOperation;->statusCode:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v6, v1, Lco/vine/android/network/HttpOperation;->statusPhrase:Ljava/lang/String;

    invoke-static {v4, v3, v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 53
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
