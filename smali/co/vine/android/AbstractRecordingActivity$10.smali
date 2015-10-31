.class Lco/vine/android/AbstractRecordingActivity$10;
.super Ljava/lang/Object;
.source "AbstractRecordingActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/AbstractRecordingActivity;->doStopMotion()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/AbstractRecordingActivity;


# direct methods
.method constructor <init>(Lco/vine/android/AbstractRecordingActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1216
    iput-object p1, p0, Lco/vine/android/AbstractRecordingActivity$10;->this$0:Lco/vine/android/AbstractRecordingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1219
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$10;->this$0:Lco/vine/android/AbstractRecordingActivity;

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 1220
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$10;->this$0:Lco/vine/android/AbstractRecordingActivity;

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->doOneFrame()V

    .line 1221
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$10;->this$0:Lco/vine/android/AbstractRecordingActivity;

    invoke-static {v0}, Lco/vine/android/AbstractRecordingActivity;->access$2408(Lco/vine/android/AbstractRecordingActivity;)I

    .line 1222
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$10;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #calls: Lco/vine/android/AbstractRecordingActivity;->doStopMotion()V
    invoke-static {v0}, Lco/vine/android/AbstractRecordingActivity;->access$2500(Lco/vine/android/AbstractRecordingActivity;)V

    .line 1224
    :cond_0
    return-void
.end method
