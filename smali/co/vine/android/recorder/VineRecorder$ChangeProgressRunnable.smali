.class Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/VineRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChangeProgressRunnable"
.end annotation


# instance fields
.field public progress:I

.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method private constructor <init>(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter

    .prologue
    .line 2556
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2556
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 2562
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget v1, p0, Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;->progress:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->changeProgress(J)V

    .line 2563
    return-void
.end method
