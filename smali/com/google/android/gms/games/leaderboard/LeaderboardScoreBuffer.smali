.class public final Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;
.super Lcom/google/android/gms/common/data/DataBuffer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/data/DataBuffer",
        "<",
        "Lcom/google/android/gms/games/leaderboard/LeaderboardScore;",
        ">;"
    }
.end annotation


# instance fields
.field private final dp:Lcom/google/android/gms/internal/bs;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/k;)V
    .locals 2
    .parameter "dataHolder"

    .prologue
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/data/DataBuffer;-><init>(Lcom/google/android/gms/internal/k;)V

    new-instance v0, Lcom/google/android/gms/internal/bs;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/k;->h()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/bs;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;->dp:Lcom/google/android/gms/internal/bs;

    return-void
.end method


# virtual methods
.method public aq()Lcom/google/android/gms/internal/bs;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;->dp:Lcom/google/android/gms/internal/bs;

    return-object v0
.end method

.method public get(I)Lcom/google/android/gms/games/leaderboard/LeaderboardScore;
    .locals 2
    .parameter "position"

    .prologue
    new-instance v0, Lcom/google/android/gms/internal/bu;

    iget-object v1, p0, Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;->O:Lcom/google/android/gms/internal/k;

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/bu;-><init>(Lcom/google/android/gms/internal/k;I)V

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/games/leaderboard/LeaderboardScoreBuffer;->get(I)Lcom/google/android/gms/games/leaderboard/LeaderboardScore;

    move-result-object v0

    return-object v0
.end method
