.class final Lcom/google/android/gms/internal/bj$e;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/bm;",
        ">.b<",
        "Lcom/google/android/gms/games/achievement/OnAchievementUpdatedListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic cH:Lcom/google/android/gms/internal/bj;

.field private final cJ:Ljava/lang/String;

.field private final p:I


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/bj;Lcom/google/android/gms/games/achievement/OnAchievementUpdatedListener;ILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/bj$e;->cH:Lcom/google/android/gms/internal/bj;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    iput p3, p0, Lcom/google/android/gms/internal/bj$e;->p:I

    iput-object p4, p0, Lcom/google/android/gms/internal/bj$e;->cJ:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/games/achievement/OnAchievementUpdatedListener;)V
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/bj$e;->p:I

    iget-object v1, p0, Lcom/google/android/gms/internal/bj$e;->cJ:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/games/achievement/OnAchievementUpdatedListener;->onAchievementUpdated(ILjava/lang/String;)V

    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/games/achievement/OnAchievementUpdatedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/bj$e;->a(Lcom/google/android/gms/games/achievement/OnAchievementUpdatedListener;)V

    return-void
.end method
