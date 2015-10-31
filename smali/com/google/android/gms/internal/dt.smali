.class public Lcom/google/android/gms/internal/dt;
.super Landroid/widget/ImageView;

# interfaces
.implements Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/plus/PlusClient$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/dt$a;
    }
.end annotation


# instance fields
.field private gU:I

.field private gV:Z

.field private gW:Z

.field private gX:Landroid/graphics/Bitmap;

.field private gY:Lcom/google/android/gms/plus/PlusClient;

.field private mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private static a(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 8

    const-wide/high16 v6, 0x3fe0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-double v2, v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-double v4, v0

    cmpl-double v0, v2, v4

    if-lez v0, :cond_0

    int-to-double v0, p1

    div-double/2addr v0, v2

    :goto_0
    mul-double/2addr v2, v0

    add-double/2addr v2, v6

    double-to-int v2, v2

    mul-double/2addr v0, v4

    add-double/2addr v0, v6

    double-to-int v0, v0

    const/4 v1, 0x1

    invoke-static {p0, v2, v0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_0
    int-to-double v0, p1

    div-double/2addr v0, v4

    goto :goto_0
.end method

.method static synthetic a(Lcom/google/android/gms/internal/dt;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dt;->gX:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic a(Lcom/google/android/gms/internal/dt;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/dt;->gV:Z

    return v0
.end method

.method static synthetic b(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 1

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/dt;->a(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic b(Lcom/google/android/gms/internal/dt;)Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gX:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method private bc()V
    .locals 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_1

    const-string v0, "android.resource"

    iget-object v2, p0, Lcom/google/android/gms/internal/dt;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iget-boolean v2, p0, Lcom/google/android/gms/internal/dt;->gW:Z

    if-nez v2, :cond_2

    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/google/android/gms/internal/dt;->mUri:Landroid/net/Uri;

    if-nez v2, :cond_3

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dt;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1

    :cond_3
    if-nez v0, :cond_4

    iget-object v2, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v2}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_4
    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->mUri:Landroid/net/Uri;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dt;->setImageURI(Landroid/net/Uri;)V

    :goto_2
    iput-boolean v1, p0, Lcom/google/android/gms/internal/dt;->gW:Z

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    iget-object v2, p0, Lcom/google/android/gms/internal/dt;->mUri:Landroid/net/Uri;

    iget v3, p0, Lcom/google/android/gms/internal/dt;->gU:I

    invoke-virtual {v0, p0, v2, v3}, Lcom/google/android/gms/plus/PlusClient;->a(Lcom/google/android/gms/plus/PlusClient$a;Landroid/net/Uri;I)V

    goto :goto_2
.end method


# virtual methods
.method public a(Landroid/net/Uri;I)V
    .locals 4

    const/4 v2, 0x0

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->mUri:Landroid/net/Uri;

    if-nez v0, :cond_2

    if-nez p1, :cond_1

    move v0, v1

    :goto_0
    iget v3, p0, Lcom/google/android/gms/internal/dt;->gU:I

    if-ne v3, p2, :cond_0

    move v2, v1

    :cond_0
    if-eqz v0, :cond_3

    if-eqz v2, :cond_3

    :goto_1
    return-void

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_3
    iput-object p1, p0, Lcom/google/android/gms/internal/dt;->mUri:Landroid/net/Uri;

    iput p2, p0, Lcom/google/android/gms/internal/dt;->gU:I

    iput-boolean v1, p0, Lcom/google/android/gms/internal/dt;->gW:Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/dt;->bc()V

    goto :goto_1
.end method

.method public a(Lcom/google/android/gms/common/ConnectionResult;Landroid/os/ParcelFileDescriptor;)V
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iput-boolean v2, p0, Lcom/google/android/gms/internal/dt;->gW:Z

    if-eqz p2, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/dt$a;

    iget v1, p0, Lcom/google/android/gms/internal/dt;->gU:I

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/dt$a;-><init>(Lcom/google/android/gms/internal/dt;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/os/ParcelFileDescriptor;

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/dt$a;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/plus/PlusClient;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    :cond_1
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dt;->gV:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gX:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gX:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dt;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_1
    return-void
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .locals 0
    .parameter "connectionHint"

    .prologue
    invoke-direct {p0}, Lcom/google/android/gms/internal/dt;->bc()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/dt;->gV:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dt;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    :cond_0
    return-void
.end method

.method public onDisconnected()V
    .locals 0

    return-void
.end method
