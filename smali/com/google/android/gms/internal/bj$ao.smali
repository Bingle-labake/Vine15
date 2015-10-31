.class final Lcom/google/android/gms/internal/bj$ao;
.super Lcom/google/android/gms/internal/bi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ao"
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field private final de:Lcom/google/android/gms/games/leaderboard/OnScoreSubmittedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/leaderboard/OnScoreSubmittedListener;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$ao;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0}, Lcom/google/android/gms/internal/bi;-><init>()V

    const-string v0, "Listener must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/x;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/leaderboard/OnScoreSubmittedListener;

    iput-object v0, p0, Lcom/google/android/gms/internal/bj$ao;->de:Lcom/google/android/gms/games/leaderboard/OnScoreSubmittedListener;

    return-void
.end method


# virtual methods
.method public d(Lcom/google/android/gms/internal/k;)V
    .locals 5

    new-instance v0, Lcom/google/android/gms/games/leaderboard/SubmitScoreResult;

    invoke-direct {v0, p1}, Lcom/google/android/gms/games/leaderboard/SubmitScoreResult;-><init>(Lcom/google/android/gms/internal/k;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/bj$ao;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v2, Lcom/google/android/gms/internal/bj$ap;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$ao;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v4, p0, Lcom/google/android/gms/internal/bj$ao;->de:Lcom/google/android/gms/games/leaderboard/OnScoreSubmittedListener;

    invoke-direct {v2, v3, v4, v0}, Lcom/google/android/gms/internal/bj$ap;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/leaderboard/OnScoreSubmittedListener;Lcom/google/android/gms/games/leaderboard/SubmitScoreResult;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
