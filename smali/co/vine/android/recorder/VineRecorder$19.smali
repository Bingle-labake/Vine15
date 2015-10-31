.class Lco/vine/android/recorder/VineRecorder$19;
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
    .line 2004
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$19;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .parameter "v"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 2007
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$19;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mReturnToPreview:Z
    invoke-static {v2}, Lco/vine/android/recorder/VineRecorder;->access$5800(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$19;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->getDurationFromSegments()J
    invoke-static {v2}, Lco/vine/android/recorder/VineRecorder;->access$5900(Lco/vine/android/recorder/VineRecorder;)J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 2008
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$19;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->animateEditModeControlsOut(Z)V
    invoke-static {v2, v0}, Lco/vine/android/recorder/VineRecorder;->access$6000(Lco/vine/android/recorder/VineRecorder;Z)V

    .line 2009
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$19;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->returnToPreview(Z)V
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$6100(Lco/vine/android/recorder/VineRecorder;Z)V

    .line 2013
    :goto_0
    return-void

    .line 2011
    :cond_0
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$19;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder$19;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorDoneButton:Landroid/view/View;
    invoke-static {v3}, Lco/vine/android/recorder/VineRecorder;->access$6200(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder$19;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditing:Z
    invoke-static {v4}, Lco/vine/android/recorder/VineRecorder;->access$6300(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v4

    if-nez v4, :cond_1

    :goto_1
    invoke-virtual {v2, v3, v0, v1}, Lco/vine/android/recorder/VineRecorder;->setEditMode(Landroid/view/View;ZZ)V

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method
