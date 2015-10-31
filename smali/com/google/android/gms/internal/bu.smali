.class public final Lcom/google/android/gms/internal/bu;
.super Lcom/google/android/gms/internal/j;

# interfaces
.implements Lcom/google/android/gms/games/leaderboard/LeaderboardScore;


# instance fields
.field private final dA:Lcom/google/android/gms/internal/bg;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/k;I)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/j;-><init>(Lcom/google/android/gms/internal/k;I)V

    new-instance v0, Lcom/google/android/gms/internal/bg;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/bg;-><init>(Lcom/google/android/gms/internal/k;I)V

    iput-object v0, p0, Lcom/google/android/gms/internal/bu;->dA:Lcom/google/android/gms/internal/bg;

    return-void
.end method


# virtual methods
.method public as()Lcom/google/android/gms/games/leaderboard/LeaderboardScore;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/bt;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/bt;-><init>(Lcom/google/android/gms/games/leaderboard/LeaderboardScore;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .parameter "obj"

    .prologue
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/bt;->a(Lcom/google/android/gms/games/leaderboard/LeaderboardScore;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public synthetic freeze()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/bu;->as()Lcom/google/android/gms/games/leaderboard/LeaderboardScore;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayRank()Ljava/lang/String;
    .locals 1

    const-string v0, "display_rank"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayRank(Landroid/database/CharArrayBuffer;)V
    .locals 1
    .parameter "dataOut"

    .prologue
    const-string v0, "display_rank"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/bu;->a(Ljava/lang/String;Landroid/database/CharArrayBuffer;)V

    return-void
.end method

.method public getDisplayScore()Ljava/lang/String;
    .locals 1

    const-string v0, "display_score"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayScore(Landroid/database/CharArrayBuffer;)V
    .locals 1
    .parameter "dataOut"

    .prologue
    const-string v0, "display_score"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/bu;->a(Ljava/lang/String;Landroid/database/CharArrayBuffer;)V

    return-void
.end method

.method public getRank()J
    .locals 2

    const-string v0, "rank"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getRawScore()J
    .locals 2

    const-string v0, "raw_score"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getScoreHolder()Lcom/google/android/gms/games/Player;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->d(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/bu;->dA:Lcom/google/android/gms/internal/bg;

    goto :goto_0
.end method

.method public getScoreHolderDisplayName()Ljava/lang/String;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->d(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "default_display_name"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/bu;->dA:Lcom/google/android/gms/internal/bg;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/bg;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getScoreHolderDisplayName(Landroid/database/CharArrayBuffer;)V
    .locals 1
    .parameter "dataOut"

    .prologue
    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->d(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "default_display_name"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/bu;->a(Ljava/lang/String;Landroid/database/CharArrayBuffer;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/bu;->dA:Lcom/google/android/gms/internal/bg;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/bg;->getDisplayName(Landroid/database/CharArrayBuffer;)V

    goto :goto_0
.end method

.method public getScoreHolderHiResImageUri()Landroid/net/Uri;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->d(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/bu;->dA:Lcom/google/android/gms/internal/bg;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/bg;->getHiResImageUri()Landroid/net/Uri;

    move-result-object v0

    goto :goto_0
.end method

.method public getScoreHolderIconImageUri()Landroid/net/Uri;
    .locals 1

    const-string v0, "external_player_id"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->d(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "default_display_image_uri"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->c(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/bu;->dA:Lcom/google/android/gms/internal/bg;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/bg;->getIconImageUri()Landroid/net/Uri;

    move-result-object v0

    goto :goto_0
.end method

.method public getTimestampMillis()J
    .locals 2

    const-string v0, "achieved_timestamp"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/bu;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public hashCode()I
    .locals 1

    invoke-static {p0}, Lcom/google/android/gms/internal/bt;->a(Lcom/google/android/gms/games/leaderboard/LeaderboardScore;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lcom/google/android/gms/internal/bt;->b(Lcom/google/android/gms/games/leaderboard/LeaderboardScore;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
