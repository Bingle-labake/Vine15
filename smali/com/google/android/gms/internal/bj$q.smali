.class final Lcom/google/android/gms/internal/bj$q;
.super Lcom/google/android/gms/internal/bj$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "q"
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/internal/k;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$q;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/bj$b;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/internal/k;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/Room;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$q;->O:Lcom/google/android/gms/internal/k;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/k;->getStatusCode()I

    move-result v0

    invoke-interface {p1, v0, p2}, Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;->onJoinedRoom(ILcom/google/android/gms/games/multiplayer/realtime/Room;)V

    return-void
.end method
