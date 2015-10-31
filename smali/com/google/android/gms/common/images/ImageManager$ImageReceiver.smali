.class public final Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;
.super Landroid/os/ResultReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/images/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ImageReceiver"
.end annotation


# instance fields
.field final synthetic an:Lcom/google/android/gms/common/images/ImageManager;

.field private final ao:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final mUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/net/Uri;)V
    .locals 2
    .parameter
    .parameter "uri"

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->an:Lcom/google/android/gms/common/images/ImageManager;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p0, v0}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    iput-object p2, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->mUri:Landroid/net/Uri;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->ao:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public addOnImageLoadedListenerHolder(Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;)V
    .locals 1
    .parameter "imageViewLoadListener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->ao:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 5
    .parameter "resultCode"
    .parameter "resultData"

    .prologue
    const/4 v1, 0x0

    const-string v0, "com.google.android.gms.extra.fileDescriptor"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;)Landroid/graphics/Bitmap;

    move-result-object v1

    :try_start_0
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->an:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v2}, Lcom/google/android/gms/common/images/ImageManager;->a(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->an:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v1}, Lcom/google/android/gms/common/images/ImageManager;->b(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/internal/af;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->mUri:Landroid/net/Uri;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/af;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->an:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v0}, Lcom/google/android/gms/common/images/ImageManager;->c(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->mUri:Landroid/net/Uri;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->ao:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v2, v0

    :goto_1
    if-ge v2, v3, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->ao:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;

    iget-object v4, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v4, v1}, Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;->onImageLoaded(Landroid/net/Uri;Landroid/graphics/drawable/Drawable;)V

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v2, "ImageManager"

    const-string v3, "closed failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_1
    return-void
.end method

.method public removeOnImageLoadedListenerHolder(Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;)V
    .locals 1
    .parameter "imageViewLoadListener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->ao:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method
