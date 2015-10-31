.class final Lcom/google/android/gms/common/images/ImageManager$b;
.super Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/images/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "b"
.end annotation


# instance fields
.field final synthetic an:Lcom/google/android/gms/common/images/ImageManager;

.field private final ap:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/widget/ImageView;I)V
    .locals 2

    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager$b;->an:Lcom/google/android/gms/common/images/ImageManager;

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, p3, v1}, Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;-><init>(Lcom/google/android/gms/common/images/ImageManager;IILcom/google/android/gms/common/images/ImageManager$1;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$b;->ap:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/widget/ImageView;ILcom/google/android/gms/common/images/ImageManager$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/common/images/ImageManager$b;-><init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/widget/ImageView;I)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    const/4 v0, 0x0

    instance-of v1, p1, Lcom/google/android/gms/common/images/ImageManager$b;

    if-eqz v1, :cond_0

    check-cast p1, Lcom/google/android/gms/common/images/ImageManager$b;

    .end local p1
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$b;->ap:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/google/android/gms/common/images/ImageManager$b;->ap:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/google/android/gms/common/images/ImageManager$b;->mHashCode:I

    iget v2, p1, Lcom/google/android/gms/common/images/ImageManager$b;->mHashCode:I

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public handleCachedDrawable(Landroid/net/Uri;Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .parameter "uri"
    .parameter "drawable"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$b;->ap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$b;->an:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v0}, Lcom/google/android/gms/common/images/ImageManager;->d(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->removeOnImageLoadedListenerHolder(Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;)V

    :cond_1
    return-void
.end method

.method public onImageLoaded(Landroid/net/Uri;Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "uri"
    .parameter "drawable"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$b;->an:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v0}, Lcom/google/android/gms/common/images/ImageManager;->d(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;

    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$b;->ap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public shouldLoadImage(Landroid/net/Uri;)Z
    .locals 2
    .parameter "uri"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$b;->ap:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/google/android/gms/common/images/ImageManager$b;->mDefaultResId:I

    if-nez v1, :cond_2

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    :goto_0
    if-nez p1, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$b;->an:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v0}, Lcom/google/android/gms/common/images/ImageManager;->d(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->removeOnImageLoadedListenerHolder(Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;)V

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0

    :cond_2
    iget v1, p0, Lcom/google/android/gms/common/images/ImageManager$b;->mDefaultResId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_3
    const/4 v0, 0x1

    goto :goto_1
.end method
