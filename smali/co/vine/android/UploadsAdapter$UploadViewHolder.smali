.class Lco/vine/android/UploadsAdapter$UploadViewHolder;
.super Ljava/lang/Object;
.source "UploadsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/UploadsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UploadViewHolder"
.end annotation


# instance fields
.field public loading:Landroid/widget/ProgressBar;

.field public retry:Landroid/widget/ImageView;

.field public status:Landroid/widget/TextView;

.field final synthetic this$0:Lco/vine/android/UploadsAdapter;

.field public thumbnail:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Lco/vine/android/UploadsAdapter;Landroid/view/View;)V
    .locals 1
    .parameter
    .parameter "view"

    .prologue
    .line 80
    iput-object p1, p0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->this$0:Lco/vine/android/UploadsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    const v0, 0x7f0a0143

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->thumbnail:Landroid/widget/ImageView;

    .line 82
    const v0, 0x7f0a017e

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->status:Landroid/widget/TextView;

    .line 83
    const v0, 0x7f0a017f

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->retry:Landroid/widget/ImageView;

    .line 84
    const v0, 0x7f0a001d

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lco/vine/android/UploadsAdapter$UploadViewHolder;->loading:Landroid/widget/ProgressBar;

    .line 85
    return-void
.end method
