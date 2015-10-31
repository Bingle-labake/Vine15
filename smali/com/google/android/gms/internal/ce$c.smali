.class final Lcom/google/android/gms/internal/ce$c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/ch;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/ch",
        "<",
        "Lcom/google/android/gms/internal/cc;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic eM:Lcom/google/android/gms/internal/ce;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/ce;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ce$c;->eM:Lcom/google/android/gms/internal/ce;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/ce;Lcom/google/android/gms/internal/ce$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ce$c;-><init>(Lcom/google/android/gms/internal/ce;)V

    return-void
.end method


# virtual methods
.method public az()Lcom/google/android/gms/internal/cc;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/ce$c;->eM:Lcom/google/android/gms/internal/ce;

    invoke-static {v0}, Lcom/google/android/gms/internal/ce;->b(Lcom/google/android/gms/internal/ce;)Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/cc;

    return-object v0
.end method

.method public n()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/ce$c;->eM:Lcom/google/android/gms/internal/ce;

    invoke-static {v0}, Lcom/google/android/gms/internal/ce;->a(Lcom/google/android/gms/internal/ce;)V

    return-void
.end method

.method public synthetic o()Landroid/os/IInterface;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/ce$c;->az()Lcom/google/android/gms/internal/cc;

    move-result-object v0

    return-object v0
.end method
