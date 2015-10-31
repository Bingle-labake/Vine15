.class Lco/vine/android/recorder/VineRecorder$13;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder;->start(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;

.field final synthetic val$tag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1504
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$13;->this$0:Lco/vine/android/recorder/VineRecorder;

    iput-object p2, p0, Lco/vine/android/recorder/VineRecorder$13;->val$tag:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1507
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$13;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$13;->val$tag:Ljava/lang/String;

    #calls: Lco/vine/android/recorder/VineRecorder;->guardedStartRecording(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$4100(Lco/vine/android/recorder/VineRecorder;Ljava/lang/String;)V

    .line 1508
    return-void
.end method
