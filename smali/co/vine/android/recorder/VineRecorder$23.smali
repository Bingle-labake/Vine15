.class Lco/vine/android/recorder/VineRecorder$23;
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
    .line 2068
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$23;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    const/4 v1, 0x1

    .line 2071
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$23;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mReturnToPreview:Z
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$5800(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2072
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$23;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->returnToPreview(Z)V
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$6100(Lco/vine/android/recorder/VineRecorder;Z)V

    .line 2077
    :goto_0
    return-void

    .line 2075
    :cond_0
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$23;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$23;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorCancelButton:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$6600(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v3

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$23;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditing:Z
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$6300(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v0

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {v2, v3, v0, v1}, Lco/vine/android/recorder/VineRecorder;->setEditMode(Landroid/view/View;ZZ)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method
