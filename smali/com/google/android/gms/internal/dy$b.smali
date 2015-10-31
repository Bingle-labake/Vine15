.class final Lcom/google/android/gms/internal/dy$b;
.super Lcom/google/android/gms/internal/p$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/dx;",
        ">.c<",
        "Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic hf:Lcom/google/android/gms/internal/dy;

.field private final hg:Lcom/google/android/gms/common/ConnectionResult;

.field private final hh:Ljava/lang/String;

.field private final hi:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/internal/k;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dy$b;->hf:Lcom/google/android/gms/internal/dy;

    invoke-direct {p0, p1, p2, p4}, Lcom/google/android/gms/internal/p$c;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;Lcom/google/android/gms/internal/k;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/dy$b;->hg:Lcom/google/android/gms/common/ConnectionResult;

    iput-object p5, p0, Lcom/google/android/gms/internal/dy$b;->hh:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/internal/dy$b;->hi:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;)V
    .locals 4

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dy$b;->hg:Lcom/google/android/gms/common/ConnectionResult;

    new-instance v1, Lcom/google/android/gms/plus/model/moments/MomentBuffer;

    iget-object v2, p0, Lcom/google/android/gms/internal/dy$b;->O:Lcom/google/android/gms/internal/k;

    invoke-direct {v1, v2}, Lcom/google/android/gms/plus/model/moments/MomentBuffer;-><init>(Lcom/google/android/gms/internal/k;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dy$b;->hh:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/internal/dy$b;->hi:Ljava/lang/String;

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;->onMomentsLoaded(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/plus/model/moments/MomentBuffer;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/dy$b;->a(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;)V

    return-void
.end method
