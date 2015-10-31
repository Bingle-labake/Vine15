.class final Lcom/google/android/gms/internal/bj$an;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "an"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/bm;",
        ">.b<",
        "Lcom/google/android/gms/games/OnSignOutCompleteListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/OnSignOutCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$an;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/games/OnSignOutCompleteListener;)V
    .locals 0

    invoke-interface {p1}, Lcom/google/android/gms/games/OnSignOutCompleteListener;->onSignOutComplete()V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/games/OnSignOutCompleteListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bj$an;->a(Lcom/google/android/gms/games/OnSignOutCompleteListener;)V

    return-void
.end method
