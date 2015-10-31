.class public abstract Lcom/lifevibes/videoeditor/BaseMediaItem;
.super Ljava/lang/Object;
.source "BaseMediaItem.java"


# instance fields
.field protected final mFilename:Ljava/lang/String;

.field protected final mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

.field protected final mUniqueId:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "editor"
    .parameter "mediaItemId"
    .parameter "filename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    if-nez p3, :cond_0

    .line 76
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "MediaItem : filename is null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 78
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 79
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 80
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found ! "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 82
    :cond_1
    iput-object p2, p0, Lcom/lifevibes/videoeditor/BaseMediaItem;->mUniqueId:Ljava/lang/String;

    .line 83
    iput-object p3, p0, Lcom/lifevibes/videoeditor/BaseMediaItem;->mFilename:Ljava/lang/String;

    .line 84
    check-cast p1, Lcom/lifevibes/videoeditor/VideoEditorImpl;

    .end local p1
    invoke-virtual {p1}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->getNativeContext()Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    move-result-object v1

    iput-object v1, p0, Lcom/lifevibes/videoeditor/BaseMediaItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    .line 85
    return-void
.end method


# virtual methods
.method public abstract getDuration()J
.end method

.method public abstract getFileType()I
.end method

.method public getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/lifevibes/videoeditor/BaseMediaItem;->mFilename:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/lifevibes/videoeditor/BaseMediaItem;->mUniqueId:Ljava/lang/String;

    return-object v0
.end method

.method getNativeContext()Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/lifevibes/videoeditor/BaseMediaItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    return-object v0
.end method

.method public abstract getTimelineDuration()J
.end method
