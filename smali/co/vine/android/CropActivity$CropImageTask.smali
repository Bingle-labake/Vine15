.class Lco/vine/android/CropActivity$CropImageTask;
.super Landroid/os/AsyncTask;
.source "CropActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/CropActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CropImageTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field mActivity:Lco/vine/android/CropActivity;

.field final mBitmapHeight:I

.field final mBitmapHeightOffset:I

.field final mBitmapWidth:I

.field final mBitmapWidthOffset:I

.field final mContext:Landroid/content/Context;

.field final mCropRect:Landroid/graphics/Rect;

.field final mFileToViewScale:I

.field final mIntent:Landroid/content/Intent;

.field final mUri:Landroid/net/Uri;

.field mView:Landroid/widget/ImageView;

.field mViewBitmap:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lco/vine/android/CropActivity;)V
    .locals 6
    .parameter "activity"

    .prologue
    .line 221
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 222
    iput-object p1, p0, Lco/vine/android/CropActivity$CropImageTask;->mActivity:Lco/vine/android/CropActivity;

    .line 223
    invoke-virtual {p1}, Lco/vine/android/CropActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mContext:Landroid/content/Context;

    .line 224
    iget v1, p1, Lco/vine/android/CropActivity;->mFileToViewScale:I

    iput v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mFileToViewScale:I

    .line 225
    iget v1, p1, Lco/vine/android/CropActivity;->mBitmapWidthOffset:I

    iput v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mBitmapWidthOffset:I

    .line 226
    iget v1, p1, Lco/vine/android/CropActivity;->mBitmapHeightOffset:I

    iput v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mBitmapHeightOffset:I

    .line 227
    iget v1, p1, Lco/vine/android/CropActivity;->mBitmapHeight:I

    iput v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mBitmapHeight:I

    .line 228
    iget v1, p1, Lco/vine/android/CropActivity;->mBitmapWidth:I

    iput v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mBitmapWidth:I

    .line 229
    iget-object v1, p1, Lco/vine/android/CropActivity;->mUri:Landroid/net/Uri;

    iput-object v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mUri:Landroid/net/Uri;

    .line 230
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    iput-object v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mIntent:Landroid/content/Intent;

    .line 231
    iget-object v1, p1, Lco/vine/android/CropActivity;->mView:Lco/vine/android/widget/CroppableImageView;

    iput-object v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mView:Landroid/widget/ImageView;

    .line 233
    iget-object v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mView:Landroid/widget/ImageView;

    check-cast v1, Lco/vine/android/widget/CroppableImageView;

    invoke-virtual {v1}, Lco/vine/android/widget/CroppableImageView;->getCropRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 234
    .local v0, rectF:Landroid/graphics/RectF;
    new-instance v1, Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    float-to-int v2, v2

    iget v3, v0, Landroid/graphics/RectF;->top:F

    float-to-int v3, v3

    iget v4, v0, Landroid/graphics/RectF;->right:F

    float-to-int v4, v4

    iget v5, v0, Landroid/graphics/RectF;->bottom:F

    float-to-int v5, v5

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mCropRect:Landroid/graphics/Rect;

    .line 236
    return-void
.end method

.method private basicCrop()Ljava/lang/Boolean;
    .locals 19

    .prologue
    .line 257
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/CropActivity$CropImageTask;->mContext:Landroid/content/Context;

    .line 258
    .local v1, context:Landroid/content/Context;
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/CropActivity$CropImageTask;->mCropRect:Landroid/graphics/Rect;

    .line 259
    .local v14, rect:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/CropActivity$CropImageTask;->mViewBitmap:Landroid/graphics/Bitmap;

    .line 260
    .local v2, bmp:Landroid/graphics/Bitmap;
    if-nez v2, :cond_0

    .line 261
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 295
    :goto_0
    return-object v3

    .line 263
    :cond_0
    new-instance v9, Landroid/graphics/Rect;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-direct {v9, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 265
    .local v9, bitmapRect:Landroid/graphics/Rect;
    invoke-virtual {v14}, Landroid/graphics/Rect;->height()I

    move-result v11

    .line 266
    .local v11, height:I
    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v17

    .line 267
    .local v17, width:I
    const/4 v3, 0x1

    move/from16 v0, v17

    if-le v0, v3, :cond_1

    const/4 v3, 0x1

    if-gt v11, v3, :cond_2

    .line 268
    :cond_1
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 272
    :cond_2
    invoke-virtual {v9, v14}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 273
    iget v3, v14, Landroid/graphics/Rect;->left:I

    iget v4, v14, Landroid/graphics/Rect;->top:I

    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {v14}, Landroid/graphics/Rect;->height()I

    move-result v6

    invoke-static/range {v1 .. v6}, Lco/vine/android/util/image/ImageUtils;->createBitmap(Landroid/content/Context;Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 275
    .local v10, cropped:Landroid/graphics/Bitmap;
    if-eqz v10, :cond_3

    .line 276
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 277
    .local v7, baos:Ljava/io/ByteArrayOutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {v10, v3, v4, v7}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 278
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    const/16 v4, 0xc8

    const/16 v5, 0xc8

    invoke-static {v1, v3, v4, v5}, Lco/vine/android/util/image/ImageUtils;->resizeBitmap(Landroid/content/Context;[BII)Lco/vine/android/util/image/ImageUtils$BitmapInfo;

    move-result-object v8

    .line 279
    .local v8, bi:Lco/vine/android/util/image/ImageUtils$BitmapInfo;
    if-eqz v8, :cond_3

    iget-object v3, v8, Lco/vine/android/util/image/ImageUtils$BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_3

    .line 280
    invoke-static {v1}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v12

    .line 281
    .local v12, ownerId:J
    iget-object v3, v8, Lco/vine/android/util/image/ImageUtils$BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    invoke-static {v1, v3, v12, v13}, Lco/vine/android/util/image/ImageUtils;->writePicToFile(Landroid/content/Context;Landroid/graphics/Bitmap;J)Landroid/net/Uri;

    move-result-object v16

    .line 282
    .local v16, uri:Landroid/net/Uri;
    if-eqz v16, :cond_3

    .line 283
    move-object/from16 v0, p0

    iget v15, v0, Lco/vine/android/CropActivity$CropImageTask;->mFileToViewScale:I

    .line 284
    .local v15, scale:I
    iget v3, v14, Landroid/graphics/Rect;->left:I

    mul-int/2addr v3, v15

    iget v4, v14, Landroid/graphics/Rect;->top:I

    mul-int/2addr v4, v15

    iget v5, v14, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, p0

    iget v6, v0, Lco/vine/android/CropActivity$CropImageTask;->mBitmapWidthOffset:I

    sub-int/2addr v5, v6

    mul-int/2addr v5, v15

    iget v6, v14, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/CropActivity$CropImageTask;->mBitmapHeightOffset:I

    move/from16 v18, v0

    sub-int v6, v6, v18

    mul-int/2addr v6, v15

    invoke-virtual {v14, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 288
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/CropActivity$CropImageTask;->mIntent:Landroid/content/Intent;

    const-string v4, "cropped_rect"

    invoke-virtual {v3, v4, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 289
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/CropActivity$CropImageTask;->mIntent:Landroid/content/Intent;

    const-string v4, "uri"

    move-object/from16 v0, v16

    invoke-virtual {v3, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 290
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto/16 :goto_0

    .line 295
    .end local v7           #baos:Ljava/io/ByteArrayOutputStream;
    .end local v8           #bi:Lco/vine/android/util/image/ImageUtils$BitmapInfo;
    .end local v10           #cropped:Landroid/graphics/Bitmap;
    .end local v12           #ownerId:J
    .end local v15           #scale:I
    .end local v16           #uri:Landroid/net/Uri;
    :cond_3
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_0
.end method


# virtual methods
.method public attachActivity(Lco/vine/android/CropActivity;)V
    .locals 0
    .parameter "activity"

    .prologue
    .line 239
    iput-object p1, p0, Lco/vine/android/CropActivity$CropImageTask;->mActivity:Lco/vine/android/CropActivity;

    .line 240
    return-void
.end method

.method public detachActivity()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 243
    iput-object v0, p0, Lco/vine/android/CropActivity$CropImageTask;->mActivity:Lco/vine/android/CropActivity;

    .line 244
    iput-object v0, p0, Lco/vine/android/CropActivity$CropImageTask;->mView:Landroid/widget/ImageView;

    .line 245
    return-void
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 2
    .parameter "voids"

    .prologue
    .line 300
    iget-object v0, p0, Lco/vine/android/CropActivity$CropImageTask;->mContext:Landroid/content/Context;

    .line 302
    .local v0, context:Landroid/content/Context;
    invoke-direct {p0}, Lco/vine/android/CropActivity$CropImageTask;->basicCrop()Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 207
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/CropActivity$CropImageTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 3
    .parameter "success"

    .prologue
    .line 309
    iget-object v0, p0, Lco/vine/android/CropActivity$CropImageTask;->mActivity:Lco/vine/android/CropActivity;

    if-eqz v0, :cond_0

    .line 310
    iget-object v0, p0, Lco/vine/android/CropActivity$CropImageTask;->mActivity:Lco/vine/android/CropActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/vine/android/CropActivity;->removeDialog(I)V

    .line 311
    iget-object v0, p0, Lco/vine/android/CropActivity$CropImageTask;->mActivity:Lco/vine/android/CropActivity;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v2, p0, Lco/vine/android/CropActivity$CropImageTask;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Lco/vine/android/CropActivity;->onCropDone(ZLandroid/content/Intent;)V

    .line 313
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 207
    check-cast p1, Ljava/lang/Boolean;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/CropActivity$CropImageTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 249
    iget-object v0, p0, Lco/vine/android/CropActivity$CropImageTask;->mView:Landroid/widget/ImageView;

    .line 250
    .local v0, view:Landroid/widget/ImageView;
    iget-object v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mActivity:Lco/vine/android/CropActivity;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 251
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mViewBitmap:Landroid/graphics/Bitmap;

    .line 252
    iget-object v1, p0, Lco/vine/android/CropActivity$CropImageTask;->mActivity:Lco/vine/android/CropActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lco/vine/android/CropActivity;->showDialog(I)V

    .line 254
    :cond_0
    return-void
.end method
