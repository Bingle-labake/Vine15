.class final Lcom/google/android/gms/internal/dy$h;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "h"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/dx;",
        ">.b<",
        "Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic hf:Lcom/google/android/gms/internal/dy;

.field private final hg:Lcom/google/android/gms/common/ConnectionResult;

.field private final hn:Lcom/google/android/gms/plus/model/people/Person;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/plus/model/people/Person;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dy$h;->hf:Lcom/google/android/gms/internal/dy;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/dy$h;->hg:Lcom/google/android/gms/common/ConnectionResult;

    iput-object p4, p0, Lcom/google/android/gms/internal/dy$h;->hn:Lcom/google/android/gms/plus/model/people/Person;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dy$h;->hg:Lcom/google/android/gms/common/ConnectionResult;

    iget-object v1, p0, Lcom/google/android/gms/internal/dy$h;->hn:Lcom/google/android/gms/plus/model/people/Person;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;->onPersonLoaded(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/plus/model/people/Person;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/dy$h;->a(Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;)V

    return-void
.end method
