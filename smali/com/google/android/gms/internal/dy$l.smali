.class final Lcom/google/android/gms/internal/dy$l;
.super Lcom/google/android/gms/internal/dv;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "l"
.end annotation


# instance fields
.field final synthetic hf:Lcom/google/android/gms/internal/dy;

.field private final hq:Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dy$l;->hf:Lcom/google/android/gms/internal/dy;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dv;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/dy$l;->hq:Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;

    return-void
.end method


# virtual methods
.method public b(ILandroid/os/Bundle;)V
    .locals 5

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    const-string v0, "pendingIntent"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    :cond_0
    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {v1, p1, v0}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dy$l;->hf:Lcom/google/android/gms/internal/dy;

    new-instance v2, Lcom/google/android/gms/internal/dy$m;

    iget-object v3, p0, Lcom/google/android/gms/internal/dy$l;->hf:Lcom/google/android/gms/internal/dy;

    iget-object v4, p0, Lcom/google/android/gms/internal/dy$l;->hq:Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;

    invoke-direct {v2, v3, v4, v1}, Lcom/google/android/gms/internal/dy$m;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/dy;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
