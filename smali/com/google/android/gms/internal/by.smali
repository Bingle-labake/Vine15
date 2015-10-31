.class public final Lcom/google/android/gms/internal/by;
.super Lcom/google/android/gms/internal/m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/m",
        "<",
        "Lcom/google/android/gms/games/multiplayer/realtime/Room;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/k;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/m;-><init>(Lcom/google/android/gms/internal/k;)V

    return-void
.end method


# virtual methods
.method protected synthetic a(II)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/by;->b(II)Lcom/google/android/gms/games/multiplayer/realtime/Room;

    move-result-object v0

    return-object v0
.end method

.method protected b(II)Lcom/google/android/gms/games/multiplayer/realtime/Room;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/bz;

    iget-object v1, p0, Lcom/google/android/gms/internal/by;->O:Lcom/google/android/gms/internal/k;

    invoke-direct {v0, v1, p1, p2}, Lcom/google/android/gms/internal/bz;-><init>(Lcom/google/android/gms/internal/k;II)V

    return-object v0
.end method

.method protected getPrimaryDataMarkerColumn()Ljava/lang/String;
    .locals 1

    const-string v0, "external_match_id"

    return-object v0
.end method
