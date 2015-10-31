.class public abstract Lcom/google/android/gms/common/data/DataBuffer;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected final O:Lcom/google/android/gms/internal/k;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/k;)V
    .locals 0
    .parameter "dataHolder"

    .prologue
    .local p0, this:Lcom/google/android/gms/common/data/DataBuffer;,"Lcom/google/android/gms/common/data/DataBuffer<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/data/DataBuffer;->O:Lcom/google/android/gms/internal/k;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/data/DataBuffer;->O:Lcom/google/android/gms/internal/k;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/k;->close()V

    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract get(I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/data/DataBuffer;->O:Lcom/google/android/gms/internal/k;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/k;->getCount()I

    move-result v0

    return v0
.end method

.method public isClosed()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/common/data/DataBuffer;->O:Lcom/google/android/gms/internal/k;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/k;->isClosed()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/i;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/i;-><init>(Lcom/google/android/gms/common/data/DataBuffer;)V

    return-object v0
.end method
