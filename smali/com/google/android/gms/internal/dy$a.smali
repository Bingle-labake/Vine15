.class final Lcom/google/android/gms/internal/dy$a;
.super Lcom/google/android/gms/internal/dv;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field private final he:Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;

.field final synthetic hf:Lcom/google/android/gms/internal/dy;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dy$a;->hf:Lcom/google/android/gms/internal/dy;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dv;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/dy$a;->he:Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/k;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    invoke-virtual {p1}, Lcom/google/android/gms/internal/k;->h()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/k;->h()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "pendingIntent"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    :cond_0
    new-instance v3, Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/k;->getStatusCode()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {v3, v0, v1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    iget-object v7, p0, Lcom/google/android/gms/internal/dy$a;->hf:Lcom/google/android/gms/internal/dy;

    new-instance v0, Lcom/google/android/gms/internal/dy$b;

    iget-object v1, p0, Lcom/google/android/gms/internal/dy$a;->hf:Lcom/google/android/gms/internal/dy;

    iget-object v2, p0, Lcom/google/android/gms/internal/dy$a;->he:Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/dy$b;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/internal/k;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Lcom/google/android/gms/internal/dy;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
