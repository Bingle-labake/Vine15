.class final Lcom/google/android/gms/internal/ds$c;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/dr;",
        ">.b<",
        "Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;",
        ">;"
    }
.end annotation


# instance fields
.field private final gD:Lcom/google/android/gms/common/ConnectionResult;

.field private final gE:Landroid/content/Intent;

.field final synthetic gF:Lcom/google/android/gms/internal/ds;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ds;Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;Lcom/google/android/gms/common/ConnectionResult;Landroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ds$c;->gF:Lcom/google/android/gms/internal/ds;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/ds$c;->gD:Lcom/google/android/gms/common/ConnectionResult;

    iput-object p4, p0, Lcom/google/android/gms/internal/ds$c;->gE:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/ds$c;->gD:Lcom/google/android/gms/common/ConnectionResult;

    iget-object v1, p0, Lcom/google/android/gms/internal/ds$c;->gE:Landroid/content/Intent;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;->onPanoramaInfoLoaded(Lcom/google/android/gms/common/ConnectionResult;Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ds$c;->a(Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;)V

    return-void
.end method
