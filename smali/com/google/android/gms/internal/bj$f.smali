.class final Lcom/google/android/gms/internal/bj$f;
.super Lcom/google/android/gms/internal/bi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "f"
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field private final cK:Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$f;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0}, Lcom/google/android/gms/internal/bi;-><init>()V

    const-string v0, "Listener must not be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/x;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;

    iput-object v0, p0, Lcom/google/android/gms/internal/bj$f;->cK:Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;

    return-void
.end method


# virtual methods
.method public b(Lcom/google/android/gms/internal/k;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/bj$f;->cH:Lcom/google/android/gms/internal/bj;

    new-instance v1, Lcom/google/android/gms/internal/bj$g;

    iget-object v2, p0, Lcom/google/android/gms/internal/bj$f;->cH:Lcom/google/android/gms/internal/bj;

    iget-object v3, p0, Lcom/google/android/gms/internal/bj$f;->cK:Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/internal/bj$g;-><init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;Lcom/google/android/gms/internal/k;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/bj;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
