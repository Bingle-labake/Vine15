.class public Lco/vine/android/recorder/CameraSetting;
.super Ljava/lang/Object;
.source "CameraSetting.java"

# interfaces
.implements Ljava/io/Externalizable;


# static fields
.field private static final serialVersionUID:J = 0x773635a4cd84a345L


# instance fields
.field public backFacingAspectRatio:F

.field public degrees:I

.field public frameRate:I

.field public frontFacing:Z

.field public frontFacingAspectRatio:F

.field public imageFormat:I

.field public originalH:I

.field public originalW:I

.field public tpf:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public constructor <init>(IIIIIZFF)V
    .locals 1
    .parameter "originalW"
    .parameter "originalH"
    .parameter "degrees"
    .parameter "frameRate"
    .parameter "imageFormat"
    .parameter "frontFacing"
    .parameter "frontFacingAspectRatio"
    .parameter "backFacingAspectRatio"

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput p1, p0, Lco/vine/android/recorder/CameraSetting;->originalW:I

    .line 32
    iput p2, p0, Lco/vine/android/recorder/CameraSetting;->originalH:I

    .line 33
    iput p3, p0, Lco/vine/android/recorder/CameraSetting;->degrees:I

    .line 34
    iput p4, p0, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    .line 35
    const/16 v0, 0x3e8

    div-int/2addr v0, p4

    iput v0, p0, Lco/vine/android/recorder/CameraSetting;->tpf:I

    .line 36
    iput p5, p0, Lco/vine/android/recorder/CameraSetting;->imageFormat:I

    .line 37
    iput-boolean p6, p0, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    .line 38
    iput p7, p0, Lco/vine/android/recorder/CameraSetting;->frontFacingAspectRatio:F

    .line 39
    iput p8, p0, Lco/vine/android/recorder/CameraSetting;->backFacingAspectRatio:F

    .line 40
    return-void
.end method


# virtual methods
.method public readExternal(Ljava/io/ObjectInput;)V
    .locals 1
    .parameter "input"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/CameraSetting;->originalW:I

    .line 45
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/CameraSetting;->originalH:I

    .line 46
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/CameraSetting;->degrees:I

    .line 47
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    .line 48
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/CameraSetting;->tpf:I

    .line 49
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/CameraSetting;->imageFormat:I

    .line 50
    invoke-interface {p1}, Ljava/io/ObjectInput;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    .line 51
    invoke-interface {p1}, Ljava/io/ObjectInput;->readFloat()F

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/CameraSetting;->frontFacingAspectRatio:F

    .line 52
    invoke-interface {p1}, Ljava/io/ObjectInput;->readFloat()F

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/CameraSetting;->backFacingAspectRatio:F

    .line 53
    return-void
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .locals 1
    .parameter "output"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    iget v0, p0, Lco/vine/android/recorder/CameraSetting;->originalW:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 58
    iget v0, p0, Lco/vine/android/recorder/CameraSetting;->originalH:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 59
    iget v0, p0, Lco/vine/android/recorder/CameraSetting;->degrees:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 60
    iget v0, p0, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 61
    iget v0, p0, Lco/vine/android/recorder/CameraSetting;->tpf:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 62
    iget v0, p0, Lco/vine/android/recorder/CameraSetting;->imageFormat:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 63
    iget-boolean v0, p0, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeBoolean(Z)V

    .line 64
    iget v0, p0, Lco/vine/android/recorder/CameraSetting;->frontFacingAspectRatio:F

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeFloat(F)V

    .line 65
    iget v0, p0, Lco/vine/android/recorder/CameraSetting;->backFacingAspectRatio:F

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeFloat(F)V

    .line 66
    return-void
.end method
