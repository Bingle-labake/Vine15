.class Lco/vine/android/recorder/VineRecorder$10;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder;->adjustEditBoundaries()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;

.field final synthetic val$thumbListParams:Landroid/widget/RelativeLayout$LayoutParams;


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder;Landroid/widget/RelativeLayout$LayoutParams;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 892
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$10;->this$0:Lco/vine/android/recorder/VineRecorder;

    iput-object p2, p0, Lco/vine/android/recorder/VineRecorder$10;->val$thumbListParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 895
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$10;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v0

    .line 896
    .local v0, view:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 897
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$10;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoViewParams:Landroid/widget/RelativeLayout$LayoutParams;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2700(Lco/vine/android/recorder/VineRecorder;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 899
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$10;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    .line 900
    if-eqz v0, :cond_1

    .line 901
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$10;->val$thumbListParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 903
    :cond_1
    return-void
.end method
