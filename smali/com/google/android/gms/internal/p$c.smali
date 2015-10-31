.class public abstract Lcom/google/android/gms/internal/p$c;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T",
        "Listener:Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/p",
        "<TT;>.b<TT",
        "Listener;",
        ">;"
    }
.end annotation


# instance fields
.field protected final O:Lcom/google/android/gms/internal/k;

.field final synthetic aF:Lcom/google/android/gms/internal/p;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;Lcom/google/android/gms/internal/k;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT",
            "Listener;",
            "Lcom/google/android/gms/internal/k;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/p$c;->aF:Lcom/google/android/gms/internal/p;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/p$c;->O:Lcom/google/android/gms/internal/k;

    return-void
.end method


# virtual methods
.method protected abstract a(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT",
            "Listener;",
            ")V"
        }
    .end annotation
.end method

.method public bridge synthetic p()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/internal/p$b;->p()V

    return-void
.end method

.method public bridge synthetic q()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/internal/p$b;->q()V

    return-void
.end method
