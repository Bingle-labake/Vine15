.class Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;
.super Lco/vine/android/client/AppSessionListener;
.source "GCMNotificationService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/service/GCMNotificationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GCMBroadcastReceiverListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/service/GCMNotificationService;


# direct methods
.method private constructor <init>(Lco/vine/android/service/GCMNotificationService;)V
    .locals 0
    .parameter

    .prologue
    .line 233
    iput-object p1, p0, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;->this$0:Lco/vine/android/service/GCMNotificationService;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/service/GCMNotificationService;Lco/vine/android/service/GCMNotificationService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 233
    invoke-direct {p0, p1}, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;-><init>(Lco/vine/android/service/GCMNotificationService;)V

    return-void
.end method


# virtual methods
.method public onPhotoImageLoaded(Ljava/util/HashMap;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/image/ImageKey;",
            "Lco/vine/android/util/image/UrlImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 236
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;->this$0:Lco/vine/android/service/GCMNotificationService;

    #getter for: Lco/vine/android/service/GCMNotificationService;->mImageKey:Lco/vine/android/util/image/ImageKey;
    invoke-static {v1}, Lco/vine/android/service/GCMNotificationService;->access$100(Lco/vine/android/service/GCMNotificationService;)Lco/vine/android/util/image/ImageKey;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;->this$0:Lco/vine/android/service/GCMNotificationService;

    #getter for: Lco/vine/android/service/GCMNotificationService;->mIconRequested:Z
    invoke-static {v1}, Lco/vine/android/service/GCMNotificationService;->access$200(Lco/vine/android/service/GCMNotificationService;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 237
    iget-object v1, p0, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;->this$0:Lco/vine/android/service/GCMNotificationService;

    const/4 v2, 0x0

    #setter for: Lco/vine/android/service/GCMNotificationService;->mIconRequested:Z
    invoke-static {v1, v2}, Lco/vine/android/service/GCMNotificationService;->access$202(Lco/vine/android/service/GCMNotificationService;Z)Z

    .line 238
    iget-object v1, p0, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;->this$0:Lco/vine/android/service/GCMNotificationService;

    #getter for: Lco/vine/android/service/GCMNotificationService;->mImageKey:Lco/vine/android/util/image/ImageKey;
    invoke-static {v1}, Lco/vine/android/service/GCMNotificationService;->access$100(Lco/vine/android/service/GCMNotificationService;)Lco/vine/android/util/image/ImageKey;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/image/UrlImage;

    .line 239
    .local v0, image:Lco/vine/android/util/image/UrlImage;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lco/vine/android/util/image/UrlImage;->isValid()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 240
    iget-object v1, p0, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;->this$0:Lco/vine/android/service/GCMNotificationService;

    iget-object v2, v0, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    #calls: Lco/vine/android/service/GCMNotificationService;->showNotification(Landroid/graphics/Bitmap;)V
    invoke-static {v1, v2}, Lco/vine/android/service/GCMNotificationService;->access$300(Lco/vine/android/service/GCMNotificationService;Landroid/graphics/Bitmap;)V

    .line 245
    .end local v0           #image:Lco/vine/android/util/image/UrlImage;
    :cond_0
    :goto_0
    return-void

    .line 242
    .restart local v0       #image:Lco/vine/android/util/image/UrlImage;
    :cond_1
    iget-object v1, p0, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;->this$0:Lco/vine/android/service/GCMNotificationService;

    const/4 v2, 0x0

    #calls: Lco/vine/android/service/GCMNotificationService;->showNotification(Landroid/graphics/Bitmap;)V
    invoke-static {v1, v2}, Lco/vine/android/service/GCMNotificationService;->access$300(Lco/vine/android/service/GCMNotificationService;Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method
