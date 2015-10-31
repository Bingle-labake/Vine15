.class public final Lcom/google/android/gms/internal/bj$j;
.super Lcom/google/android/gms/internal/t$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "j"
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field private final cL:Lcom/google/android/gms/internal/p$d;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/internal/p$d;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$j;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0}, Lcom/google/android/gms/internal/t$a;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/bj$j;->cL:Lcom/google/android/gms/internal/p$d;

    return-void
.end method


# virtual methods
.method public a(ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$j;->cL:Lcom/google/android/gms/internal/p$d;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gms/internal/p$d;->a(ILandroid/os/IBinder;Landroid/os/Bundle;)V

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$j;->cH:Lcom/google/android/gms/internal/bj;

    const-string v1, "show_welcome_popup"

    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/bj;Z)Z

    :cond_0
    return-void
.end method
