.class public abstract Lcom/lifevibes/videoeditor/MediaItem;
.super Lcom/lifevibes/videoeditor/BaseMediaItem;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;
    }
.end annotation


# static fields
.field public static final END_OF_FILE:I = -0x1

.field public static final RENDERING_MODE_BLACK_BORDER:I = 0x0

.field public static final RENDERING_MODE_CROPPING:I = 0x2

.field public static final RENDERING_MODE_STRETCH:I = 0x1


# instance fields
.field private final mProjectPath:Ljava/lang/String;

.field private mRenderingMode:I


# direct methods
.method protected constructor <init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .parameter "editor"
    .parameter "mediaItemId"
    .parameter "filename"
    .parameter "renderingMode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-direct {p0, p1, p2, p3}, Lcom/lifevibes/videoeditor/BaseMediaItem;-><init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    iput p4, p0, Lcom/lifevibes/videoeditor/MediaItem;->mRenderingMode:I

    .line 129
    invoke-interface {p1}, Lcom/lifevibes/videoeditor/VideoEditor;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lifevibes/videoeditor/MediaItem;->mProjectPath:Ljava/lang/String;

    .line 130
    return-void
.end method


# virtual methods
.method public abstract getAspectRatio()I
.end method

.method public abstract getHeight()I
.end method

.method public getRenderingMode()I
    .locals 1

    .prologue
    .line 158
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaItem;->mRenderingMode:I

    return v0
.end method

.method public abstract getWidth()I
.end method

.method public setRenderingMode(I)V
    .locals 2
    .parameter "renderingMode"

    .prologue
    .line 141
    packed-switch p1, :pswitch_data_0

    .line 148
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid Rendering Mode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 151
    :pswitch_0
    iput p1, p0, Lcom/lifevibes/videoeditor/MediaItem;->mRenderingMode:I

    .line 152
    return-void

    .line 141
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
