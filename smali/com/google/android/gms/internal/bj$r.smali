.class final Lcom/google/android/gms/internal/bj$r;
.super Lcom/google/android/gms/internal/bi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "r"
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field private final cQ:Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$r;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0}, Lcom/google/android/gms/internal/bi;-><init>()V

    const-string v0, "Listener must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/x;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;

    iput-object v0, p0, Lcom/google/android/gms/internal/bj$r;->cQ:Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/internal/k;Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$r;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$s;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$r;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$r;->cQ:Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/bj$s;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;Lcom/google/android/gms/internal/k;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
