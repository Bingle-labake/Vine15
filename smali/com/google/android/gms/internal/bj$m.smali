.class final Lcom/google/android/gms/internal/bj$m;
.super Lcom/google/android/gms/internal/bi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "m"
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field private final cN:Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$m;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0}, Lcom/google/android/gms/internal/bi;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/bj$m;->cN:Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;

    return-void
.end method


# virtual methods
.method public k(Lcom/google/android/gms/internal/k;)V
    .locals 5

    new-instance v1, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;

    invoke-direct {v1, p1}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;-><init>(Lcom/google/android/gms/internal/k;)V

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {v1}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/Invitation;

    invoke-interface {v0}, Lcom/google/android/gms/games/multiplayer/Invitation;->freeze()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/Invitation;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;->close()V

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/bj$m;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v2, Lcom/google/android/gms/internal/bj$n;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$m;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v4, p0, Lcom/google/android/gms/internal/bj$m;->cN:Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;

    invoke-direct {v2, v3, v4, v0}, Lcom/google/android/gms/internal/bj$n;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/OnInvitationReceivedListener;Lcom/google/android/gms/games/multiplayer/Invitation;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Lcom/google/android/gms/games/multiplayer/InvitationBuffer;->close()V

    throw v0
.end method
