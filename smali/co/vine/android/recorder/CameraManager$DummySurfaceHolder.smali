.class Lco/vine/android/recorder/CameraManager$DummySurfaceHolder;
.super Ljava/lang/Object;
.source "CameraManager.java"

# interfaces
.implements Landroid/view/SurfaceHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/CameraManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DummySurfaceHolder"
.end annotation


# instance fields
.field private final mSurface:Landroid/view/Surface;


# direct methods
.method public constructor <init>(Landroid/view/Surface;)V
    .locals 0
    .parameter "surface"

    .prologue
    .line 951
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 952
    iput-object p1, p0, Lco/vine/android/recorder/CameraManager$DummySurfaceHolder;->mSurface:Landroid/view/Surface;

    .line 953
    return-void
.end method


# virtual methods
.method public addCallback(Landroid/view/SurfaceHolder$Callback;)V
    .locals 0
    .parameter "callback"

    .prologue
    .line 958
    return-void
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 1017
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager$DummySurfaceHolder;->mSurface:Landroid/view/Surface;

    return-object v0
.end method

.method public getSurfaceFrame()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 1012
    const/4 v0, 0x0

    return-object v0
.end method

.method public isCreating()Z
    .locals 1

    .prologue
    .line 967
    const/4 v0, 0x0

    return v0
.end method

.method public lockCanvas()Landroid/graphics/Canvas;
    .locals 1

    .prologue
    .line 997
    const/4 v0, 0x0

    return-object v0
.end method

.method public lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;
    .locals 1
    .parameter "dirty"

    .prologue
    .line 1002
    const/4 v0, 0x0

    return-object v0
.end method

.method public removeCallback(Landroid/view/SurfaceHolder$Callback;)V
    .locals 0
    .parameter "callback"

    .prologue
    .line 963
    return-void
.end method

.method public setFixedSize(II)V
    .locals 0
    .parameter "width"
    .parameter "height"

    .prologue
    .line 978
    return-void
.end method

.method public setFormat(I)V
    .locals 0
    .parameter "format"

    .prologue
    .line 988
    return-void
.end method

.method public setKeepScreenOn(Z)V
    .locals 0
    .parameter "screenOn"

    .prologue
    .line 993
    return-void
.end method

.method public setSizeFromLayout()V
    .locals 0

    .prologue
    .line 983
    return-void
.end method

.method public setType(I)V
    .locals 0
    .parameter "type"

    .prologue
    .line 973
    return-void
.end method

.method public unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    .locals 0
    .parameter "canvas"

    .prologue
    .line 1008
    return-void
.end method
