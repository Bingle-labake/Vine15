.class public Lco/vine/android/recorder/PictureConverter;
.super Ljava/lang/Object;
.source "PictureConverter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/recorder/PictureConverter$1;,
        Lco/vine/android/recorder/PictureConverter$ScaleStep;
    }
.end annotation


# static fields
.field private static final A:I = -0x1000000


# instance fields
.field public final LOCK:[I

.field private lastH:I

.field private lastW:I

.field private mCurrentFrameSize:I

.field private mFilterYuv:Lco/vine/android/recorder/RsYuv;

.field private mIntBuffer:Ljava/nio/IntBuffer;

.field private mLastDegree:I

.field private mLastFront:Z

.field private mLastMirrored:Z

.field private final mMatrix:Landroid/graphics/Matrix;

.field private final mPaint:Landroid/graphics/Paint;

.field private mRS:Landroid/support/v8/renderscript/RenderScript;

.field private mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

.field private final mTargetSize:I

.field private srcBmp:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/support/v8/renderscript/RenderScript;ILco/vine/android/recorder/CameraSetting;)V
    .locals 2
    .parameter "rs"
    .parameter "targetSize"
    .parameter "cameraSetting"

    .prologue
    const/4 v1, 0x0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const v0, -0x1869f

    iput v0, p0, Lco/vine/android/recorder/PictureConverter;->mLastDegree:I

    .line 31
    new-array v0, v1, [I

    iput-object v0, p0, Lco/vine/android/recorder/PictureConverter;->LOCK:[I

    .line 32
    iput-boolean v1, p0, Lco/vine/android/recorder/PictureConverter;->mLastMirrored:Z

    .line 62
    iput-object p1, p0, Lco/vine/android/recorder/PictureConverter;->mRS:Landroid/support/v8/renderscript/RenderScript;

    .line 63
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mMatrix:Landroid/graphics/Matrix;

    .line 64
    iput p2, p0, Lco/vine/android/recorder/PictureConverter;->mTargetSize:I

    .line 65
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mPaint:Landroid/graphics/Paint;

    .line 66
    invoke-direct {p0, p3}, Lco/vine/android/recorder/PictureConverter;->setCameraSetting(Lco/vine/android/recorder/CameraSetting;)V

    .line 67
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/recorder/PictureConverter;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 16
    iget v0, p0, Lco/vine/android/recorder/PictureConverter;->lastH:I

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/recorder/PictureConverter;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 16
    iget v0, p0, Lco/vine/android/recorder/PictureConverter;->lastW:I

    return v0
.end method

.method static synthetic access$200(Lco/vine/android/recorder/PictureConverter;)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 16
    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->srcBmp:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/recorder/PictureConverter;)Landroid/graphics/Paint;
    .locals 1
    .parameter "x0"

    .prologue
    .line 16
    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method private allocate(III)V
    .locals 2
    .parameter "frameSize"
    .parameter "originalW"
    .parameter "originalH"

    .prologue
    .line 164
    new-instance v0, Lco/vine/android/recorder/RsYuv;

    iget-object v1, p0, Lco/vine/android/recorder/PictureConverter;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {v0, v1, p2, p3}, Lco/vine/android/recorder/RsYuv;-><init>(Landroid/support/v8/renderscript/RenderScript;II)V

    iput-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mFilterYuv:Lco/vine/android/recorder/RsYuv;

    .line 165
    return-void
.end method

.method private convertUsingRenderScript(Lco/vine/android/recorder/CameraSetting;Lco/vine/android/recorder/VideoData;Z)V
    .locals 4
    .parameter "cameraSetting"
    .parameter "next"
    .parameter "hasChanged"

    .prologue
    .line 130
    iget-object v0, p2, Lco/vine/android/recorder/VideoData;->data:[B

    if-nez v0, :cond_0

    .line 131
    const-string v0, "Data is null."

    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 133
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mRS:Landroid/support/v8/renderscript/RenderScript;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mFilterYuv:Lco/vine/android/recorder/RsYuv;

    if-eqz v0, :cond_1

    if-eqz p3, :cond_2

    .line 134
    :cond_1
    new-instance v0, Lco/vine/android/recorder/RsYuv;

    iget-object v1, p0, Lco/vine/android/recorder/PictureConverter;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget v2, p1, Lco/vine/android/recorder/CameraSetting;->originalW:I

    iget v3, p1, Lco/vine/android/recorder/CameraSetting;->originalH:I

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/recorder/RsYuv;-><init>(Landroid/support/v8/renderscript/RenderScript;II)V

    iput-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mFilterYuv:Lco/vine/android/recorder/RsYuv;

    .line 136
    :cond_2
    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mFilterYuv:Lco/vine/android/recorder/RsYuv;

    iget-object v1, p2, Lco/vine/android/recorder/VideoData;->data:[B

    iget-object v2, p0, Lco/vine/android/recorder/PictureConverter;->srcBmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/RsYuv;->execute([BLandroid/graphics/Bitmap;)V

    .line 137
    return-void
.end method

.method private giveMatrixNewValuesWithScaleIfDegreeHasChanged(IZ)V
    .locals 11
    .parameter "degrees"
    .parameter "mirror"

    .prologue
    const/high16 v10, 0x4000

    .line 140
    iget v7, p0, Lco/vine/android/recorder/PictureConverter;->mLastDegree:I

    if-ne v7, p1, :cond_0

    iget-boolean v7, p0, Lco/vine/android/recorder/PictureConverter;->mLastMirrored:Z

    if-eq v7, p2, :cond_1

    .line 141
    :cond_0
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    if-nez v7, :cond_2

    iget v6, p0, Lco/vine/android/recorder/PictureConverter;->lastW:I

    .line 142
    .local v6, width:I
    :goto_0
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    if-nez v7, :cond_3

    iget v2, p0, Lco/vine/android/recorder/PictureConverter;->lastH:I

    .line 143
    .local v2, height:I
    :goto_1
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v7}, Landroid/graphics/Matrix;->reset()V

    .line 144
    iget v7, p0, Lco/vine/android/recorder/PictureConverter;->mTargetSize:I

    int-to-float v7, v7

    int-to-float v8, v6

    div-float/2addr v7, v8

    iget v8, p0, Lco/vine/android/recorder/PictureConverter;->mTargetSize:I

    int-to-float v8, v8

    int-to-float v9, v2

    div-float/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 145
    .local v5, scaleFactor:F
    int-to-float v7, v6

    mul-float v1, v7, v5

    .line 146
    .local v1, actualWidth:F
    int-to-float v7, v2

    mul-float v0, v7, v5

    .line 147
    .local v0, actualHeight:F
    iget v7, p0, Lco/vine/android/recorder/PictureConverter;->mTargetSize:I

    int-to-float v7, v7

    sub-float v7, v1, v7

    neg-float v7, v7

    div-float v3, v7, v10

    .line 148
    .local v3, offsetX:F
    iget v7, p0, Lco/vine/android/recorder/PictureConverter;->mTargetSize:I

    int-to-float v7, v7

    sub-float v7, v0, v7

    neg-float v7, v7

    div-float v4, v7, v10

    .line 149
    .local v4, offsetY:F
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mMatrix:Landroid/graphics/Matrix;

    int-to-float v8, p1

    div-int/lit8 v9, v6, 0x2

    int-to-float v9, v9

    div-int/lit8 v10, v2, 0x2

    int-to-float v10, v10

    invoke-virtual {v7, v8, v9, v10}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 150
    const-string v7, "Creating with mirrored {}."

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 151
    if-eqz p2, :cond_4

    .line 152
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mMatrix:Landroid/graphics/Matrix;

    neg-float v8, v5

    invoke-virtual {v7, v8, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 153
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mMatrix:Landroid/graphics/Matrix;

    neg-float v8, v3

    iget v9, p0, Lco/vine/android/recorder/PictureConverter;->mTargetSize:I

    int-to-float v9, v9

    add-float/2addr v8, v9

    invoke-virtual {v7, v8, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 158
    :goto_2
    iput-boolean p2, p0, Lco/vine/android/recorder/PictureConverter;->mLastMirrored:Z

    .line 159
    iput p1, p0, Lco/vine/android/recorder/PictureConverter;->mLastDegree:I

    .line 161
    .end local v0           #actualHeight:F
    .end local v1           #actualWidth:F
    .end local v2           #height:I
    .end local v3           #offsetX:F
    .end local v4           #offsetY:F
    .end local v5           #scaleFactor:F
    .end local v6           #width:I
    :cond_1
    return-void

    .line 141
    :cond_2
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    #getter for: Lco/vine/android/recorder/PictureConverter$ScaleStep;->scaledW:I
    invoke-static {v7}, Lco/vine/android/recorder/PictureConverter$ScaleStep;->access$700(Lco/vine/android/recorder/PictureConverter$ScaleStep;)I

    move-result v6

    goto :goto_0

    .line 142
    .restart local v6       #width:I
    :cond_3
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    #getter for: Lco/vine/android/recorder/PictureConverter$ScaleStep;->scaledH:I
    invoke-static {v7}, Lco/vine/android/recorder/PictureConverter$ScaleStep;->access$800(Lco/vine/android/recorder/PictureConverter$ScaleStep;)I

    move-result v2

    goto :goto_1

    .line 155
    .restart local v0       #actualHeight:F
    .restart local v1       #actualWidth:F
    .restart local v2       #height:I
    .restart local v3       #offsetX:F
    .restart local v4       #offsetY:F
    .restart local v5       #scaleFactor:F
    :cond_4
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v7, v5, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 156
    iget-object v7, p0, Lco/vine/android/recorder/PictureConverter;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v7, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_2
.end method

.method private setCameraSetting(Lco/vine/android/recorder/CameraSetting;)V
    .locals 5
    .parameter "cameraSetting"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 92
    iget v0, p1, Lco/vine/android/recorder/CameraSetting;->originalW:I

    iget v1, p1, Lco/vine/android/recorder/CameraSetting;->originalH:I

    sget-object v2, Lco/vine/android/recorder/RecordConfigUtils;->DEFAULT_BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/PictureConverter;->srcBmp:Landroid/graphics/Bitmap;

    .line 95
    iget v0, p1, Lco/vine/android/recorder/CameraSetting;->originalW:I

    iget v1, p1, Lco/vine/android/recorder/CameraSetting;->originalH:I

    mul-int/2addr v0, v1

    iput v0, p0, Lco/vine/android/recorder/PictureConverter;->mCurrentFrameSize:I

    .line 96
    iget v0, p1, Lco/vine/android/recorder/CameraSetting;->originalH:I

    iput v0, p0, Lco/vine/android/recorder/PictureConverter;->lastH:I

    .line 97
    iget v0, p1, Lco/vine/android/recorder/CameraSetting;->originalW:I

    iput v0, p0, Lco/vine/android/recorder/PictureConverter;->lastW:I

    .line 98
    iget-boolean v0, p1, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    iput-boolean v0, p0, Lco/vine/android/recorder/PictureConverter;->mLastFront:Z

    .line 100
    iget-boolean v0, p1, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    if-eqz v0, :cond_0

    iget v0, p1, Lco/vine/android/recorder/CameraSetting;->frontFacingAspectRatio:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_0

    .line 101
    new-instance v0, Lco/vine/android/recorder/PictureConverter$ScaleStep;

    iget v1, p1, Lco/vine/android/recorder/CameraSetting;->frontFacingAspectRatio:F

    invoke-direct {v0, p0, v1, v3}, Lco/vine/android/recorder/PictureConverter$ScaleStep;-><init>(Lco/vine/android/recorder/PictureConverter;FLco/vine/android/recorder/PictureConverter$1;)V

    iput-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    .line 108
    :goto_0
    iget v0, p1, Lco/vine/android/recorder/CameraSetting;->degrees:I

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lco/vine/android/recorder/PictureConverter;->giveMatrixNewValuesWithScaleIfDegreeHasChanged(IZ)V

    .line 109
    iget v0, p0, Lco/vine/android/recorder/PictureConverter;->mCurrentFrameSize:I

    iget v1, p1, Lco/vine/android/recorder/CameraSetting;->originalW:I

    iget v2, p1, Lco/vine/android/recorder/CameraSetting;->originalH:I

    invoke-direct {p0, v0, v1, v2}, Lco/vine/android/recorder/PictureConverter;->allocate(III)V

    .line 110
    return-void

    .line 102
    :cond_0
    iget v0, p1, Lco/vine/android/recorder/CameraSetting;->backFacingAspectRatio:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_1

    .line 103
    new-instance v0, Lco/vine/android/recorder/PictureConverter$ScaleStep;

    iget v1, p1, Lco/vine/android/recorder/CameraSetting;->backFacingAspectRatio:F

    invoke-direct {v0, p0, v1, v3}, Lco/vine/android/recorder/PictureConverter$ScaleStep;-><init>(Lco/vine/android/recorder/PictureConverter;FLco/vine/android/recorder/PictureConverter$1;)V

    iput-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    goto :goto_0

    .line 105
    :cond_1
    iput-object v3, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    goto :goto_0
.end method


# virtual methods
.method public convert(Lco/vine/android/recorder/CameraSetting;Lco/vine/android/recorder/VideoData;Z)Z
    .locals 2
    .parameter "cameraSetting"
    .parameter "next"
    .parameter "hasChanged"

    .prologue
    const/4 v1, 0x0

    .line 118
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lco/vine/android/recorder/PictureConverter;->convertUsingRenderScript(Lco/vine/android/recorder/CameraSetting;Lco/vine/android/recorder/VideoData;Z)V
    :try_end_0
    .catch Landroid/renderscript/RSInvalidStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/support/v8/renderscript/RSInvalidStateException; {:try_start_0 .. :try_end_0} :catch_1

    .line 119
    const/4 v1, 0x1

    .line 125
    :goto_0
    return v1

    .line 120
    :catch_0
    move-exception v0

    .line 122
    .local v0, e:Landroid/renderscript/RSInvalidStateException;
    goto :goto_0

    .line 123
    .end local v0           #e:Landroid/renderscript/RSInvalidStateException;
    :catch_1
    move-exception v0

    .line 125
    .local v0, e:Landroid/support/v8/renderscript/RSInvalidStateException;
    goto :goto_0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 3
    .parameter "canvas"

    .prologue
    .line 70
    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    if-nez v0, :cond_0

    .line 71
    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->srcBmp:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lco/vine/android/recorder/PictureConverter;->mMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lco/vine/android/recorder/PictureConverter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 76
    :goto_0
    return-void

    .line 73
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    #calls: Lco/vine/android/recorder/PictureConverter$ScaleStep;->scale()V
    invoke-static {v0}, Lco/vine/android/recorder/PictureConverter$ScaleStep;->access$400(Lco/vine/android/recorder/PictureConverter$ScaleStep;)V

    .line 74
    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mScaleStep:Lco/vine/android/recorder/PictureConverter$ScaleStep;

    #getter for: Lco/vine/android/recorder/PictureConverter$ScaleStep;->mPreScaleBitmap:Landroid/graphics/Bitmap;
    invoke-static {v0}, Lco/vine/android/recorder/PictureConverter$ScaleStep;->access$500(Lco/vine/android/recorder/PictureConverter$ScaleStep;)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/recorder/PictureConverter;->mMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lco/vine/android/recorder/PictureConverter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public drawGeneric(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V
    .locals 1
    .parameter "canvas"
    .parameter "bitmap"
    .parameter "matrix"

    .prologue
    .line 79
    iget-object v0, p0, Lco/vine/android/recorder/PictureConverter;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 80
    return-void
.end method

.method public giveMatrixNewValuesWithScaleIfDegreeHasChangedWithKnownConfigs(IZ)V
    .locals 0
    .parameter "degrees"
    .parameter "frontFacing"

    .prologue
    .line 113
    invoke-direct {p0, p1, p2}, Lco/vine/android/recorder/PictureConverter;->giveMatrixNewValuesWithScaleIfDegreeHasChanged(IZ)V

    .line 114
    return-void
.end method

.method public updateSettingsIfNeeded(Lco/vine/android/recorder/CameraSetting;)Z
    .locals 3
    .parameter "cameraSetting"

    .prologue
    .line 83
    iget v1, p0, Lco/vine/android/recorder/PictureConverter;->lastW:I

    iget v2, p1, Lco/vine/android/recorder/CameraSetting;->originalW:I

    if-ne v1, v2, :cond_0

    iget v1, p0, Lco/vine/android/recorder/PictureConverter;->lastH:I

    iget v2, p1, Lco/vine/android/recorder/CameraSetting;->originalH:I

    if-ne v1, v2, :cond_0

    iget-boolean v1, p1, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    iget-boolean v2, p0, Lco/vine/android/recorder/PictureConverter;->mLastFront:Z

    if-eq v1, v2, :cond_3

    :cond_0
    const/4 v0, 0x1

    .line 85
    .local v0, hasChanged:Z
    :goto_0
    iget-object v1, p0, Lco/vine/android/recorder/PictureConverter;->srcBmp:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    if-eqz v0, :cond_2

    .line 86
    :cond_1
    invoke-direct {p0, p1}, Lco/vine/android/recorder/PictureConverter;->setCameraSetting(Lco/vine/android/recorder/CameraSetting;)V

    .line 88
    :cond_2
    return v0

    .line 83
    .end local v0           #hasChanged:Z
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method
