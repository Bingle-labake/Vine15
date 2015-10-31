.class final Lcom/google/android/gms/internal/p$e;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "e"
.end annotation


# instance fields
.field final synthetic aF:Lcom/google/android/gms/internal/p;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/p;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/p$e;->aF:Lcom/google/android/gms/internal/p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1
    .parameter "component"
    .parameter "binder"

    .prologue
    .local p0, this:Lcom/google/android/gms/internal/p$e;,"Lcom/google/android/gms/internal/p<TT;>.e;"
    iget-object v0, p0, Lcom/google/android/gms/internal/p$e;->aF:Lcom/google/android/gms/internal/p;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/p;->f(Landroid/os/IBinder;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "component"

    .prologue
    .local p0, this:Lcom/google/android/gms/internal/p$e;,"Lcom/google/android/gms/internal/p<TT;>.e;"
    iget-object v0, p0, Lcom/google/android/gms/internal/p$e;->aF:Lcom/google/android/gms/internal/p;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/p;->a(Lcom/google/android/gms/internal/p;Landroid/os/IInterface;)Landroid/os/IInterface;

    iget-object v0, p0, Lcom/google/android/gms/internal/p$e;->aF:Lcom/google/android/gms/internal/p;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/p;->m()V

    return-void
.end method
