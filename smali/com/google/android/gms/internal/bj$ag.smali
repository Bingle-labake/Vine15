.class final Lcom/google/android/gms/internal/bj$ag;
.super Lcom/google/android/gms/internal/bi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ag"
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field final cZ:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeReliableMessageSentListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeReliableMessageSentListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$ag;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0}, Lcom/google/android/gms/internal/bi;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/bj$ag;->cZ:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeReliableMessageSentListener;

    return-void
.end method


# virtual methods
.method public a(IILjava/lang/String;)V
    .locals 7

    iget-object v6, p0, Lcom/google/android/gms/internal/bj$ag;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v0, Lcom/google/android/gms/internal/bj$af;

    iget-object v1, p0, Lcom/google/android/gms/internal/bj$ag;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$ag;->cZ:Lcom/google/android/gms/games/multiplayer/realtime/RealTimeReliableMessageSentListener;

    move v3, p1

    move v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/bj$af;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/realtime/RealTimeReliableMessageSentListener;IILjava/lang/String;)V

    invoke-virtual {v6, v0}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
