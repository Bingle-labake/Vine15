.class public Lcom/google/android/gms/internal/bn;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/bn$1;,
        Lcom/google/android/gms/internal/bn$a;,
        Lcom/google/android/gms/internal/bn$b;
    }
.end annotation


# instance fields
.field protected cs:Lcom/google/android/gms/internal/bj;

.field protected dh:Lcom/google/android/gms/internal/bn$a;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/bj;I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/bn;->cs:Lcom/google/android/gms/internal/bj;

    new-instance v0, Lcom/google/android/gms/internal/bn$a;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lcom/google/android/gms/internal/bn$a;-><init>(ILcom/google/android/gms/internal/bn$1;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/bn;->dh:Lcom/google/android/gms/internal/bn$a;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/bj;ILcom/google/android/gms/internal/bn$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/bn;-><init>(Lcom/google/android/gms/internal/bj;I)V

    return-void
.end method

.method public static a(Lcom/google/android/gms/internal/bj;I)Lcom/google/android/gms/internal/bn;
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/ba;->ab()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/bn$b;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/bn$b;-><init>(Lcom/google/android/gms/internal/bj;I)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/bn;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/bn;-><init>(Lcom/google/android/gms/internal/bj;I)V

    goto :goto_0
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public am()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/bn;->cs:Lcom/google/android/gms/internal/bj;

    iget-object v1, p0, Lcom/google/android/gms/internal/bn;->dh:Lcom/google/android/gms/internal/bn$a;

    iget-object v1, v1, Lcom/google/android/gms/internal/bn$a;->di:Landroid/os/IBinder;

    iget-object v2, p0, Lcom/google/android/gms/internal/bn;->dh:Lcom/google/android/gms/internal/bn$a;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/bn$a;->ap()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/bj;->a(Landroid/os/IBinder;Landroid/os/Bundle;)V

    return-void
.end method

.method public an()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/bn;->dh:Lcom/google/android/gms/internal/bn$a;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/bn$a;->ap()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public ao()Landroid/os/IBinder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/bn;->dh:Lcom/google/android/gms/internal/bn$a;

    iget-object v0, v0, Lcom/google/android/gms/internal/bn$a;->di:Landroid/os/IBinder;

    return-object v0
.end method

.method public setGravity(I)V
    .locals 1
    .parameter "gravity"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/bn;->dh:Lcom/google/android/gms/internal/bn$a;

    iput p1, v0, Lcom/google/android/gms/internal/bn$a;->gravity:I

    return-void
.end method
