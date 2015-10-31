.class Lco/vine/android/ExploreChannelsActivity$ExploreChannelsAppSessionListener;
.super Lco/vine/android/client/AppSessionListener;
.source "ExploreChannelsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ExploreChannelsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ExploreChannelsAppSessionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/ExploreChannelsActivity;


# direct methods
.method constructor <init>(Lco/vine/android/ExploreChannelsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 265
    iput-object p1, p0, Lco/vine/android/ExploreChannelsActivity$ExploreChannelsAppSessionListener;->this$0:Lco/vine/android/ExploreChannelsActivity;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

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
    .line 268
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lco/vine/android/ExploreChannelsActivity$ExploreChannelsAppSessionListener;->this$0:Lco/vine/android/ExploreChannelsActivity;

    #getter for: Lco/vine/android/ExploreChannelsActivity;->mIconImageKey:Lco/vine/android/util/image/ImageKey;
    invoke-static {v1}, Lco/vine/android/ExploreChannelsActivity;->access$000(Lco/vine/android/ExploreChannelsActivity;)Lco/vine/android/util/image/ImageKey;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 269
    iget-object v1, p0, Lco/vine/android/ExploreChannelsActivity$ExploreChannelsAppSessionListener;->this$0:Lco/vine/android/ExploreChannelsActivity;

    #getter for: Lco/vine/android/ExploreChannelsActivity;->mIconImageKey:Lco/vine/android/util/image/ImageKey;
    invoke-static {v1}, Lco/vine/android/ExploreChannelsActivity;->access$000(Lco/vine/android/ExploreChannelsActivity;)Lco/vine/android/util/image/ImageKey;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/image/UrlImage;

    .line 270
    .local v0, image:Lco/vine/android/util/image/UrlImage;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lco/vine/android/util/image/UrlImage;->isValid()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    .line 271
    iget-object v1, p0, Lco/vine/android/ExploreChannelsActivity$ExploreChannelsAppSessionListener;->this$0:Lco/vine/android/ExploreChannelsActivity;

    iget-object v2, v0, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    #calls: Lco/vine/android/ExploreChannelsActivity;->setIconImage(Landroid/graphics/Bitmap;)V
    invoke-static {v1, v2}, Lco/vine/android/ExploreChannelsActivity;->access$100(Lco/vine/android/ExploreChannelsActivity;Landroid/graphics/Bitmap;)V

    .line 274
    .end local v0           #image:Lco/vine/android/util/image/UrlImage;
    :cond_0
    return-void
.end method
