.class final Lcom/google/android/gms/internal/bj$o;
.super Lcom/google/android/gms/internal/bi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "o"
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field private final cP:Lcom/google/android/gms/games/multiplayer/OnInvitationsLoadedListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/OnInvitationsLoadedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$o;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0}, Lcom/google/android/gms/internal/bi;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/bj$o;->cP:Lcom/google/android/gms/games/multiplayer/OnInvitationsLoadedListener;

    return-void
.end method


# virtual methods
.method public j(Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$o;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$p;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$o;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$o;->cP:Lcom/google/android/gms/games/multiplayer/OnInvitationsLoadedListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$p;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/multiplayer/OnInvitationsLoadedListener;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
