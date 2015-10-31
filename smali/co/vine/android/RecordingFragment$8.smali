.class Lco/vine/android/RecordingFragment$8;
.super Ljava/lang/Object;
.source "RecordingFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/RecordingFragment;->saveSessionAndQuit()V
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
    .line 552
    iput-object p1, p0, Lco/vine/android/RecordingFragment$8;->this$0:Lco/vine/android/RecordingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 555
    iget-object v1, p0, Lco/vine/android/RecordingFragment$8;->this$0:Lco/vine/android/RecordingFragment;

    invoke-virtual {v1}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 556
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 557
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 559
    :cond_0
    return-void
.end method
