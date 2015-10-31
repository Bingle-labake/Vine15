.class Lco/vine/android/recorder/VineRecorder$24;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder;->onUiResumed(Landroid/app/Activity;Ljava/lang/Runnable;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter

    .prologue
    .line 2099
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$24;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    const/4 v1, 0x0

    .line 2102
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$24;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$24;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2200(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ProgressView;

    move-result-object v3

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$24;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditing:Z
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$6300(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v3, v0, v1}, Lco/vine/android/recorder/VineRecorder;->setEditMode(Landroid/view/View;ZZ)V

    .line 2103
    return-void

    :cond_0
    move v0, v1

    .line 2102
    goto :goto_0
.end method
