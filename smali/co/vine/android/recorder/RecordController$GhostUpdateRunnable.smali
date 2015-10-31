.class public Lco/vine/android/recorder/RecordController$GhostUpdateRunnable;
.super Ljava/lang/Object;
.source "RecordController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/RecordController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GhostUpdateRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/recorder/RecordController;


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/RecordController;)V
    .locals 0
    .parameter

    .prologue
    .line 677
    iput-object p1, p0, Lco/vine/android/recorder/RecordController$GhostUpdateRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 681
    iget-object v0, p0, Lco/vine/android/recorder/RecordController$GhostUpdateRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->initializeGhostBitmapsIfNeeded()V

    .line 682
    iget-object v0, p0, Lco/vine/android/recorder/RecordController$GhostUpdateRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    const/4 v1, 0x1

    #calls: Lco/vine/android/recorder/RecordController;->updateGhostBitmap(Z)V
    invoke-static {v0, v1}, Lco/vine/android/recorder/RecordController;->access$100(Lco/vine/android/recorder/RecordController;Z)V

    .line 683
    return-void
.end method
