.class Lco/vine/android/recorder/VineRecorder$9;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder;->setEditMode(Landroid/view/View;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;

.field final synthetic val$wasEditingAlready:Z


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 756
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$9;->this$0:Lco/vine/android/recorder/VineRecorder;

    iput-boolean p2, p0, Lco/vine/android/recorder/VineRecorder$9;->val$wasEditingAlready:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 759
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$9;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-boolean v1, p0, Lco/vine/android/recorder/VineRecorder$9;->val$wasEditingAlready:Z

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineRecorder;->startEditMode(Z)V

    .line 760
    return-void
.end method
