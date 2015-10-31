.class Lco/vine/android/SonyRecordingActivity$1;
.super Ljava/lang/Object;
.source "SonyRecordingActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/SonyRecordingActivity;->setupSonyOverlay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/SonyRecordingActivity;


# direct methods
.method constructor <init>(Lco/vine/android/SonyRecordingActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 97
    iput-object p1, p0, Lco/vine/android/SonyRecordingActivity$1;->this$0:Lco/vine/android/SonyRecordingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 100
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity$1;->this$0:Lco/vine/android/SonyRecordingActivity;

    #getter for: Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;
    invoke-static {v2}, Lco/vine/android/SonyRecordingActivity;->access$000(Lco/vine/android/SonyRecordingActivity;)Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 101
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity$1;->this$0:Lco/vine/android/SonyRecordingActivity;

    iget-object v0, v2, Lco/vine/android/SonyRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    .line 102
    .local v0, fragment:Lco/vine/android/RecordingFragment;
    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isEditing()Z

    move-result v1

    .line 103
    .local v1, isEditing:Z
    if-nez v1, :cond_1

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isSessionModified()Z

    move-result v2

    if-nez v2, :cond_1

    .line 104
    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->setDiscardChangesOnStop()V

    .line 105
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity$1;->this$0:Lco/vine/android/SonyRecordingActivity;

    #calls: Lco/vine/android/SonyRecordingActivity;->showSonyOverlay()V
    invoke-static {v2}, Lco/vine/android/SonyRecordingActivity;->access$100(Lco/vine/android/SonyRecordingActivity;)V

    .line 115
    .end local v0           #fragment:Lco/vine/android/RecordingFragment;
    .end local v1           #isEditing:Z
    :cond_0
    :goto_0
    return-void

    .line 107
    .restart local v0       #fragment:Lco/vine/android/RecordingFragment;
    .restart local v1       #isEditing:Z
    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isEditingDirty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 108
    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->discardEditing()V

    .line 109
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity$1;->this$0:Lco/vine/android/SonyRecordingActivity;

    #calls: Lco/vine/android/SonyRecordingActivity;->showSonyOverlay()V
    invoke-static {v2}, Lco/vine/android/SonyRecordingActivity;->access$100(Lco/vine/android/SonyRecordingActivity;)V

    goto :goto_0

    .line 111
    :cond_2
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity$1;->this$0:Lco/vine/android/SonyRecordingActivity;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Lco/vine/android/SonyRecordingActivity;->showUnSavedChangesDialog(ILco/vine/android/RecordingFragment;)V

    goto :goto_0
.end method
