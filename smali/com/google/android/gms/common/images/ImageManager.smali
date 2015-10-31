.class public final Lcom/google/android/gms/common/images/ImageManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/images/ImageManager$1;,
        Lcom/google/android/gms/common/images/ImageManager$c;,
        Lcom/google/android/gms/common/images/ImageManager$b;,
        Lcom/google/android/gms/common/images/ImageManager$a;,
        Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;,
        Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;,
        Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;
    }
.end annotation


# static fields
.field private static ai:Lcom/google/android/gms/common/images/ImageManager;


# instance fields
.field private final aj:Lcom/google/android/gms/internal/af;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/af",
            "<",
            "Landroid/net/Uri;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/graphics/drawable/Drawable$ConstantState;",
            ">;>;"
        }
    .end annotation
.end field

.field private final ak:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;",
            "Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;",
            ">;"
        }
    .end annotation
.end field

.field private final al:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/net/Uri;",
            "Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/google/android/gms/internal/af;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/af;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->aj:Lcom/google/android/gms/internal/af;

    invoke-static {}, Lcom/google/android/gms/internal/ba;->ad()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/google/android/gms/common/images/ImageManager$c;

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager;->aj:Lcom/google/android/gms/internal/af;

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/images/ImageManager$c;-><init>(Lcom/google/android/gms/internal/af;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->ak:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->al:Ljava/util/Map;

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private a(Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;Landroid/net/Uri;)V
    .locals 3

    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->aj:Lcom/google/android/gms/internal/af;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/af;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable$ConstantState;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;->handleCachedDrawable(Landroid/net/Uri;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1, p2}, Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;->shouldLoadImage(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->al:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;

    if-nez v0, :cond_2

    new-instance v0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;

    invoke-direct {v0, p0, p2}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;-><init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/net/Uri;)V

    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager;->al:Ljava/util/Map;

    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->addOnImageLoadedListenerHolder(Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;)V

    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager;->ak:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.android.gms.common.images.LOAD_IMAGE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.google.android.gms.extras.uri"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v2, "com.google.android.gms.extras.resultReceiver"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v0, "com.google.android.gms.extras.priority"

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method static synthetic b(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/internal/af;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->aj:Lcom/google/android/gms/internal/af;

    return-object v0
.end method

.method static synthetic c(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->al:Ljava/util/Map;

    return-object v0
.end method

.method public static create(Landroid/content/Context;)Lcom/google/android/gms/common/images/ImageManager;
    .locals 1
    .parameter "context"

    .prologue
    sget-object v0, Lcom/google/android/gms/common/images/ImageManager;->ai:Lcom/google/android/gms/common/images/ImageManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/common/images/ImageManager;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/images/ImageManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/google/android/gms/common/images/ImageManager;->ai:Lcom/google/android/gms/common/images/ImageManager;

    :cond_0
    sget-object v0, Lcom/google/android/gms/common/images/ImageManager;->ai:Lcom/google/android/gms/common/images/ImageManager;

    return-object v0
.end method

.method static synthetic d(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->ak:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public loadImage(Landroid/widget/ImageView;I)V
    .locals 1
    .parameter "imageView"
    .parameter "resId"

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/google/android/gms/common/images/ImageManager;->loadImage(Landroid/widget/ImageView;Landroid/net/Uri;I)V

    return-void
.end method

.method public loadImage(Landroid/widget/ImageView;Landroid/net/Uri;)V
    .locals 1
    .parameter "imageView"
    .parameter "uri"

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/gms/common/images/ImageManager;->loadImage(Landroid/widget/ImageView;Landroid/net/Uri;I)V

    return-void
.end method

.method public loadImage(Landroid/widget/ImageView;Landroid/net/Uri;I)V
    .locals 2
    .parameter "imageView"
    .parameter "uri"
    .parameter "defaultResId"

    .prologue
    new-instance v0, Lcom/google/android/gms/common/images/ImageManager$b;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p3, v1}, Lcom/google/android/gms/common/images/ImageManager$b;-><init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/widget/ImageView;ILcom/google/android/gms/common/images/ImageManager$1;)V

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/common/images/ImageManager;->a(Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;Landroid/net/Uri;)V

    return-void
.end method

.method public loadImage(Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;Landroid/net/Uri;)V
    .locals 1
    .parameter "listener"
    .parameter "uri"

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/gms/common/images/ImageManager;->loadImage(Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;Landroid/net/Uri;I)V

    return-void
.end method

.method public loadImage(Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;Landroid/net/Uri;I)V
    .locals 2
    .parameter "listener"
    .parameter "uri"
    .parameter "defaultResId"

    .prologue
    new-instance v0, Lcom/google/android/gms/common/images/ImageManager$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p3, v1}, Lcom/google/android/gms/common/images/ImageManager$a;-><init>(Lcom/google/android/gms/common/images/ImageManager;Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;ILcom/google/android/gms/common/images/ImageManager$1;)V

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/common/images/ImageManager;->a(Lcom/google/android/gms/common/images/ImageManager$ListenerHolder;Landroid/net/Uri;)V

    return-void
.end method
