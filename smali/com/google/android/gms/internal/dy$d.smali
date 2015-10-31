.class final Lcom/google/android/gms/internal/dy$d;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/dx;",
        ">.b<",
        "Lcom/google/android/gms/plus/PlusClient$a;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic hf:Lcom/google/android/gms/internal/dy;

.field private final hg:Lcom/google/android/gms/common/ConnectionResult;

.field private final hk:Landroid/os/ParcelFileDescriptor;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$a;Lcom/google/android/gms/common/ConnectionResult;Landroid/os/ParcelFileDescriptor;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dy$d;->hf:Lcom/google/android/gms/internal/dy;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/dy$d;->hg:Lcom/google/android/gms/common/ConnectionResult;

    iput-object p4, p0, Lcom/google/android/gms/internal/dy$d;->hk:Landroid/os/ParcelFileDescriptor;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/plus/PlusClient$a;)V
    .locals 3

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dy$d;->hg:Lcom/google/android/gms/common/ConnectionResult;

    iget-object v1, p0, Lcom/google/android/gms/internal/dy$d;->hk:Landroid/os/ParcelFileDescriptor;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/plus/PlusClient$a;->a(Lcom/google/android/gms/common/ConnectionResult;Landroid/os/ParcelFileDescriptor;)V

    :goto_0
    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dy$d;->hk:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "PlusClientImpl"

    const-string v2, "failed close"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/plus/PlusClient$a;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/dy$d;->a(Lcom/google/android/gms/plus/PlusClient$a;)V

    return-void
.end method

.method public q()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/internal/p$b;->q()V

    return-void
.end method
