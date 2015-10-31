.class final Lcom/google/android/gms/internal/dy$e;
.super Lcom/google/android/gms/internal/dv;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "e"
.end annotation


# instance fields
.field final synthetic hf:Lcom/google/android/gms/internal/dy;

.field private final hl:Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dy$e;->hf:Lcom/google/android/gms/internal/dy;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dv;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/dy$e;->hl:Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/k;Ljava/lang/String;)V
    .locals 7

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/k;->h()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/k;->h()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "pendingIntent"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    :cond_0
    new-instance v3, Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/k;->getStatusCode()I

    move-result v1

    invoke-direct {v3, v1, v0}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    iget-object v6, p0, Lcom/google/android/gms/internal/dy$e;->hf:Lcom/google/android/gms/internal/dy;

    new-instance v0, Lcom/google/android/gms/internal/dy$f;

    iget-object v1, p0, Lcom/google/android/gms/internal/dy$e;->hf:Lcom/google/android/gms/internal/dy;

    iget-object v2, p0, Lcom/google/android/gms/internal/dy$e;->hl:Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/dy$f;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/internal/k;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Lcom/google/android/gms/internal/dy;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
