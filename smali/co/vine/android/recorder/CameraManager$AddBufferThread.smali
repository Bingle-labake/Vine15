.class Lco/vine/android/recorder/CameraManager$AddBufferThread;
.super Ljava/lang/Thread;
.source "CameraManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/CameraManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AddBufferThread"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/recorder/CameraManager;


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/CameraManager;)V
    .locals 1
    .parameter

    .prologue
    .line 264
    iput-object p1, p0, Lco/vine/android/recorder/CameraManager$AddBufferThread;->this$0:Lco/vine/android/recorder/CameraManager;

    .line 265
    const-string v0, "AddBufferThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 266
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 271
    :cond_0
    :goto_0
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager$AddBufferThread;->this$0:Lco/vine/android/recorder/CameraManager;

    #getter for: Lco/vine/android/recorder/CameraManager;->mRunAddBufferThraed:Z
    invoke-static {v3}, Lco/vine/android/recorder/CameraManager;->access$000(Lco/vine/android/recorder/CameraManager;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 272
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager$AddBufferThread;->this$0:Lco/vine/android/recorder/CameraManager;

    #getter for: Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;
    invoke-static {v3}, Lco/vine/android/recorder/CameraManager;->access$100(Lco/vine/android/recorder/CameraManager;)Landroid/hardware/Camera;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 273
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager$AddBufferThread;->this$0:Lco/vine/android/recorder/CameraManager;

    #getter for: Lco/vine/android/recorder/CameraManager;->mAddArray:Ljava/util/concurrent/ConcurrentLinkedQueue;
    invoke-static {v3}, Lco/vine/android/recorder/CameraManager;->access$200(Lco/vine/android/recorder/CameraManager;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 274
    .local v0, bytes:[B
    if-nez v0, :cond_2

    .line 276
    const-wide/16 v3, 0x32

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 277
    :catch_0
    move-exception v1

    .line 285
    .end local v0           #bytes:[B
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 286
    .local v2, unused:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    :goto_1
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager$AddBufferThread;->this$0:Lco/vine/android/recorder/CameraManager;

    #getter for: Lco/vine/android/recorder/CameraManager;->mAddArray:Ljava/util/concurrent/ConcurrentLinkedQueue;
    invoke-static {v3}, Lco/vine/android/recorder/CameraManager;->access$200(Lco/vine/android/recorder/CameraManager;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .restart local v0       #bytes:[B
    if-eqz v0, :cond_4

    .line 287
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager$AddBufferThread;->this$0:Lco/vine/android/recorder/CameraManager;

    #getter for: Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;
    invoke-static {v3}, Lco/vine/android/recorder/CameraManager;->access$100(Lco/vine/android/recorder/CameraManager;)Landroid/hardware/Camera;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 288
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager$AddBufferThread;->this$0:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v3, v0}, Lco/vine/android/recorder/CameraManager;->addCallbackBuffer([B)V

    goto :goto_1

    .line 281
    .end local v2           #unused:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    :cond_2
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager$AddBufferThread;->this$0:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v3, v0}, Lco/vine/android/recorder/CameraManager;->addCallbackBuffer([B)V

    goto :goto_0

    .line 290
    .restart local v2       #unused:Ljava/util/ArrayList;,"Ljava/util/ArrayList<[B>;"
    :cond_3
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 293
    :cond_4
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager$AddBufferThread;->this$0:Lco/vine/android/recorder/CameraManager;

    #getter for: Lco/vine/android/recorder/CameraManager;->mBufferArray:Ljava/util/concurrent/ConcurrentLinkedQueue;
    invoke-static {v3}, Lco/vine/android/recorder/CameraManager;->access$300(Lco/vine/android/recorder/CameraManager;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->addAll(Ljava/util/Collection;)Z

    .line 294
    return-void
.end method
