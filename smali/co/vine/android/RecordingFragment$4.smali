.class Lco/vine/android/RecordingFragment$4;
.super Ljava/lang/Object;
.source "RecordingFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/RecordingFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/RecordingFragment;


# direct methods
.method constructor <init>(Lco/vine/android/RecordingFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 112
    iput-object p1, p0, Lco/vine/android/RecordingFragment$4;->this$0:Lco/vine/android/RecordingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 115
    iget-object v1, p0, Lco/vine/android/RecordingFragment$4;->this$0:Lco/vine/android/RecordingFragment;

    invoke-virtual {v1}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/AbstractRecordingActivity;

    .line 116
    .local v0, activity:Lco/vine/android/AbstractRecordingActivity;
    if-eqz v0, :cond_2

    .line 117
    iget-object v1, p0, Lco/vine/android/RecordingFragment$4;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;
    invoke-static {v1}, Lco/vine/android/RecordingFragment;->access$400(Lco/vine/android/RecordingFragment;)Landroid/widget/ToggleButton;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 118
    iget-object v1, p0, Lco/vine/android/RecordingFragment$4;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;
    invoke-static {v1}, Lco/vine/android/RecordingFragment;->access$400(Lco/vine/android/RecordingFragment;)Landroid/widget/ToggleButton;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 120
    :cond_0
    iget-object v1, p0, Lco/vine/android/RecordingFragment$4;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mGhostButton:Landroid/widget/ToggleButton;
    invoke-static {v1}, Lco/vine/android/RecordingFragment;->access$500(Lco/vine/android/RecordingFragment;)Landroid/widget/ToggleButton;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 121
    iget-object v1, p0, Lco/vine/android/RecordingFragment$4;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;
    invoke-static {v1}, Lco/vine/android/RecordingFragment;->access$600(Lco/vine/android/RecordingFragment;)Lco/vine/android/recorder/VineRecorder;

    move-result-object v1

    invoke-virtual {v1, v2}, Lco/vine/android/recorder/VineRecorder;->setGhostMode(Z)Z

    .line 123
    :cond_1
    iget-object v1, p0, Lco/vine/android/RecordingFragment$4;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;
    invoke-static {v1}, Lco/vine/android/RecordingFragment;->access$600(Lco/vine/android/RecordingFragment;)Lco/vine/android/recorder/VineRecorder;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/recorder/VineRecorder;->isSavedSession()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lco/vine/android/RecordingFragment$4;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;
    invoke-static {v1}, Lco/vine/android/RecordingFragment;->access$600(Lco/vine/android/RecordingFragment;)Lco/vine/android/recorder/VineRecorder;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v1

    iget-object v1, v1, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->showDrafts(Ljava/lang/String;)V

    .line 127
    :cond_2
    return-void

    .line 123
    :cond_3
    const-string v1, "camera_preview"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
