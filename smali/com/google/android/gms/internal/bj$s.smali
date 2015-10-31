.class final Lcom/google/android/gms/internal/bj$s;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "s"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/bm;",
        ">.b<",
        "Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field private final cR:Lcom/google/android/gms/internal/k;

.field private final cS:Lcom/google/android/gms/internal/k;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;Lcom/google/android/gms/internal/k;Lcom/google/android/gms/internal/k;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$s;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/bj$s;->cR:Lcom/google/android/gms/internal/k;

    iput-object p4, p0, Lcom/google/android/gms/internal/bj$s;->cS:Lcom/google/android/gms/internal/k;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;)V
    .locals 3

    new-instance v0, Lcom/google/android/gms/games/leaderboard/LeaderboardBuffer;

    iget-object v1, p0, Lcom/google/android/gms/internal/bj$s;->cR:Lcom/google/android/gms/internal/k;

    invoke-direct {v0, v1}, Lcom/google/android/gms/games/leaderboard/LeaderboardBuffer;-><init>(Lcom/google/android/gms/internal/k;)V

    new-instance v1, Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$s;->cS:Lcom/google/android/gms/internal/k;

    invoke-direct {v1, v2}, Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;-><init>(Lcom/google/android/gms/internal/k;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$s;->cS:Lcom/google/android/gms/internal/k;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/k;->getStatusCode()I

    move-result v2

    invoke-interface {p1, v2, v0, v1}, Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;->onLeaderboardScoresLoaded(ILcom/google/android/gms/games/leaderboard/LeaderboardBuffer;Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;)V

    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bj$s;->a(Lcom/google/android/gms/games/leaderboard/OnLeaderboardScoresLoadedListener;)V

    return-void
.end method
