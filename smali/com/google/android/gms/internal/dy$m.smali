.class final Lcom/google/android/gms/internal/dy$m;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "m"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/dx;",
        ">.b<",
        "Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic hf:Lcom/google/android/gms/internal/dy;

.field private final hg:Lcom/google/android/gms/common/ConnectionResult;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dy$m;->hf:Lcom/google/android/gms/internal/dy;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/dy$m;->hg:Lcom/google/android/gms/common/ConnectionResult;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dy$m;->hf:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dy;->disconnect()V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dy$m;->hg:Lcom/google/android/gms/common/ConnectionResult;

    invoke-interface {p1, v0}, Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;->onAccessRevoked(Lcom/google/android/gms/common/ConnectionResult;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/dy$m;->a(Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V

    return-void
.end method
