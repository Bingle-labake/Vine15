.class final Lcom/google/android/gms/internal/bj$ai;
.super Lcom/google/android/gms/internal/bi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ai"
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field private final da:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

.field private final db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

.field private final dc:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;)V
    .locals 2

    const/4 v1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0}, Lcom/google/android/gms/internal/bi;-><init>()V

    const-string v0, "Callbacks must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/x;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iput-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->da:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iput-object v1, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    iput-object v1, p0, Lcom/google/android/gms/internal/bj$ai;->dc:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0}, Lcom/google/android/gms/internal/bi;-><init>()V

    const-string v0, "Callbacks must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/x;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iput-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->da:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    iput-object p3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    iput-object p4, p0, Lcom/google/android/gms/internal/bj$ai;->dc:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$aa;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/bj$aa;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public b(Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$ab;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/bj$ab;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public c(Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$ac;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/bj$ac;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public d(Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$y;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/bj$y;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public e(Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$x;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/bj$x;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public f(Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$z;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/bj$z;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public n(Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$al;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->da:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$al;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public o(Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$q;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->da:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$q;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public onLeftRoom(ILjava/lang/String;)V
    .locals 4
    .parameter "statusCode"
    .parameter "externalRoomId"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$v;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->da:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/bj$v;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public onRealTimeMessageReceived(Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessage;)V
    .locals 4
    .parameter "message"

    .prologue
    const-string v0, "GamesClient"

    const-string v1, "RoomBinderCallbacks: onRealTimeMessageReceived"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/bk;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$w;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->dc:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$w;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessageReceivedListener;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeMessage;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public p(Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$ak;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$ak;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public q(Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$ah;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$ah;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public r(Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$aj;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->da:Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$aj;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomUpdateListener;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public s(Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$h;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$h;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public t(Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$i;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ai;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ai;->db:Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$i;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RoomStatusUpdateListener;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
