.class final Lcom/google/android/gms/internal/ds$b;
.super Lcom/google/android/gms/internal/dq$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "b"
.end annotation


# instance fields
.field final synthetic gF:Lcom/google/android/gms/internal/ds;

.field private final gG:Lcom/google/android/gms/panorama/PanoramaClient$a;

.field private final gH:Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;

.field private final gI:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ds;Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;Landroid/net/Uri;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/ds$b;->gF:Lcom/google/android/gms/internal/ds;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dq$a;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/ds$b;->gG:Lcom/google/android/gms/panorama/PanoramaClient$a;

    iput-object p2, p0, Lcom/google/android/gms/internal/ds$b;->gH:Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;

    iput-object p3, p0, Lcom/google/android/gms/internal/ds$b;->gI:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public a(ILandroid/os/Bundle;ILandroid/content/Intent;)V
    .locals 7

    iget-object v0, p0, Lcom/google/android/gms/internal/ds$b;->gI:Landroid/net/Uri;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/ds$b;->gF:Lcom/google/android/gms/internal/ds;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ds;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/ds$b;->gI:Landroid/net/Uri;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->revokeUriPermission(Landroid/net/Uri;I)V

    :cond_0
    const/4 v0, 0x0

    if-eqz p2, :cond_1

    const-string v0, "pendingIntent"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    :cond_1
    new-instance v3, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {v3, p1, v0}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/ds$b;->gG:Lcom/google/android/gms/panorama/PanoramaClient$a;

    if-eqz v0, :cond_2

    iget-object v6, p0, Lcom/google/android/gms/internal/ds$b;->gF:Lcom/google/android/gms/internal/ds;

    new-instance v0, Lcom/google/android/gms/internal/ds$a;

    iget-object v1, p0, Lcom/google/android/gms/internal/ds$b;->gF:Lcom/google/android/gms/internal/ds;

    iget-object v2, p0, Lcom/google/android/gms/internal/ds$b;->gG:Lcom/google/android/gms/panorama/PanoramaClient$a;

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/ds$a;-><init>(Lcom/google/android/gms/internal/ds;Lcom/google/android/gms/panorama/PanoramaClient$a;Lcom/google/android/gms/common/ConnectionResult;ILandroid/content/Intent;)V

    invoke-virtual {v6, v0}, Lcom/google/android/gms/internal/ds;->a(Lcom/google/android/gms/internal/p$b;)V

    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/ds$b;->gF:Lcom/google/android/gms/internal/ds;

    new-instance v1, Lcom/google/android/gms/internal/ds$c;

    iget-object v2, p0, Lcom/google/android/gms/internal/ds$b;->gF:Lcom/google/android/gms/internal/ds;

    iget-object v4, p0, Lcom/google/android/gms/internal/ds$b;->gH:Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;

    invoke-direct {v1, v2, v4, v3, p4}, Lcom/google/android/gms/internal/ds$c;-><init>(Lcom/google/android/gms/internal/ds;Lcom/google/android/gms/panorama/PanoramaClient$OnPanoramaInfoLoadedListener;Lcom/google/android/gms/common/ConnectionResult;Landroid/content/Intent;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ds;->a(Lcom/google/android/gms/internal/p$b;)V

    goto :goto_0
.end method
