.class public Lco/vine/android/UploadsAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "UploadsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/UploadsAdapter$UploadViewHolder;
    }
.end annotation


# instance fields
.field protected final mAppController:Lco/vine/android/client/AppController;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lco/vine/android/client/AppController;I)V
    .locals 1
    .parameter "context"
    .parameter "appController"
    .parameter "flags"

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p3}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 45
    iput-object p2, p0, Lco/vine/android/UploadsAdapter;->mAppController:Lco/vine/android/client/AppController;

    .line 46
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 5
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    const/16 v4, 0x8

    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/UploadsAdapter$UploadViewHolder;

    .line 63
    .local v0, holder:Lco/vine/android/UploadsAdapter$UploadViewHolder;
    iget-object v2, v0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->status:Landroid/widget/TextView;

    const v3, 0x7f0e01ce

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 64
    iget-object v2, v0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->retry:Landroid/widget/ImageView;

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 65
    iget-object v2, v0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->loading:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 66
    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v2

    if-nez v2, :cond_0

    .line 67
    iget-object v2, v0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->retry:Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 70
    :cond_0
    const/4 v2, 0x6

    invoke-interface {p3, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 71
    .local v1, thumbnailPath:Ljava/lang/String;
    iget-object v2, v0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->thumbnail:Landroid/widget/ImageView;

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 72
    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "context"
    .parameter "cursor"
    .parameter "parent"

    .prologue
    .line 50
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 51
    .local v1, layoutInflater:Landroid/view/LayoutInflater;
    const v3, 0x7f03006c

    const/4 v4, 0x0

    invoke-virtual {v1, v3, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 53
    .local v2, v:Landroid/view/View;
    new-instance v0, Lco/vine/android/UploadsAdapter$UploadViewHolder;

    invoke-direct {v0, p0, v2}, Lco/vine/android/UploadsAdapter$UploadViewHolder;-><init>(Lco/vine/android/UploadsAdapter;Landroid/view/View;)V

    .line 55
    .local v0, holder:Lco/vine/android/UploadsAdapter$UploadViewHolder;
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 56
    return-object v2
.end method
