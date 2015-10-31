.class Lcom/google/android/gms/internal/bb$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/be;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/be",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic bU:Lcom/google/android/gms/internal/bb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/bb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bb$1;->bU:Lcom/google/android/gms/internal/bb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/dynamic/LifecycleDelegate;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/bb$1;->bU:Lcom/google/android/gms/internal/bb;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/bb;->a(Lcom/google/android/gms/internal/bb;Lcom/google/android/gms/dynamic/LifecycleDelegate;)Lcom/google/android/gms/dynamic/LifecycleDelegate;

    iget-object v0, p0, Lcom/google/android/gms/internal/bb$1;->bU:Lcom/google/android/gms/internal/bb;

    invoke-static {v0}, Lcom/google/android/gms/internal/bb;->a(Lcom/google/android/gms/internal/bb;)Ljava/util/LinkedList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/bb$a;

    iget-object v2, p0, Lcom/google/android/gms/internal/bb$1;->bU:Lcom/google/android/gms/internal/bb;

    invoke-static {v2}, Lcom/google/android/gms/internal/bb;->b(Lcom/google/android/gms/internal/bb;)Lcom/google/android/gms/dynamic/LifecycleDelegate;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/bb$a;->b(Lcom/google/android/gms/dynamic/LifecycleDelegate;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/bb$1;->bU:Lcom/google/android/gms/internal/bb;

    invoke-static {v0}, Lcom/google/android/gms/internal/bb;->a(Lcom/google/android/gms/internal/bb;)Ljava/util/LinkedList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/internal/bb$1;->bU:Lcom/google/android/gms/internal/bb;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/bb;->a(Lcom/google/android/gms/internal/bb;Landroid/os/Bundle;)Landroid/os/Bundle;

    return-void
.end method
