.class Lcom/google/android/gms/internal/bb$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/bb$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/bb;->onInflate(Landroid/app/Activity;Landroid/os/Bundle;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bU:Lcom/google/android/gms/internal/bb;

.field final synthetic bV:Landroid/app/Activity;

.field final synthetic bW:Landroid/os/Bundle;

.field final synthetic bX:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/bb;Landroid/app/Activity;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bb$2;->bU:Lcom/google/android/gms/internal/bb;

    iput-object p2, p0, Lcom/google/android/gms/internal/bb$2;->bV:Landroid/app/Activity;

    iput-object p3, p0, Lcom/google/android/gms/internal/bb$2;->bW:Landroid/os/Bundle;

    iput-object p4, p0, Lcom/google/android/gms/internal/bb$2;->bX:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public b(Lcom/google/android/gms/dynamic/LifecycleDelegate;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bb$2;->bU:Lcom/google/android/gms/internal/bb;

    invoke-static {v0}, Lcom/google/android/gms/internal/bb;->b(Lcom/google/android/gms/internal/bb;)Lcom/google/android/gms/dynamic/LifecycleDelegate;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/bb$2;->bV:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/gms/internal/bb$2;->bW:Landroid/os/Bundle;

    iget-object v3, p0, Lcom/google/android/gms/internal/bb$2;->bX:Landroid/os/Bundle;

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/dynamic/LifecycleDelegate;->onInflate(Landroid/app/Activity;Landroid/os/Bundle;Landroid/os/Bundle;)V

    return-void
.end method

.method public getState()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
