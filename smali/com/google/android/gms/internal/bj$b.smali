.class abstract Lcom/google/android/gms/internal/bj$b;
.super Lcom/google/android/gms/internal/p$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/bm;",
        ">.c<",
        "Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/internal/k;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$b;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/p$c;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;Lcom/google/android/gms/internal/k;)V

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$b;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v1, p0, Lcom/google/android/gms/internal/bj$b;->O:Lcom/google/android/gms/internal/k;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/internal/k;)Lcom/google/android/gms/games/multiplayer/realtime/Room;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/bj$b;->a(Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/Room;)V

    return-void
.end method

.method protected abstract a(Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/Room;)V
.end method

.method protected bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bj$b;->a(Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;)V

    return-void
.end method
