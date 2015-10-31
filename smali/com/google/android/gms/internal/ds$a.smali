.class final Lcom/google/android/gms/internal/ds$a;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/dr;",
        ">.b<",
        "Lcom/google/android/gms/panorama/PanoramaClient$a;",
        ">;"
    }
.end annotation


# instance fields
.field public final gD:Lcom/google/android/gms/common/ConnectionResult;

.field public final gE:Landroid/content/Intent;

.field final synthetic gF:Lcom/google/android/gms/internal/ds;

.field public final type:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ds;Lcom/google/android/gms/panorama/PanoramaClient$a;Lcom/google/android/gms/common/ConnectionResult;ILandroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/ds$a;->gF:Lcom/google/android/gms/internal/ds;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/ds$a;->gD:Lcom/google/android/gms/common/ConnectionResult;

    iput p4, p0, Lcom/google/android/gms/internal/ds$a;->type:I

    iput-object p5, p0, Lcom/google/android/gms/internal/ds$a;->gE:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/panorama/PanoramaClient$a;)V
    .locals 3

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/ds$a;->gD:Lcom/google/android/gms/common/ConnectionResult;

    iget v1, p0, Lcom/google/android/gms/internal/ds$a;->type:I

    iget-object v2, p0, Lcom/google/android/gms/internal/ds$a;->gE:Landroid/content/Intent;

    invoke-interface {p1, v0, v1, v2}, Lcom/google/android/gms/panorama/PanoramaClient$a;->a(Lcom/google/android/gms/common/ConnectionResult;ILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/panorama/PanoramaClient$a;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ds$a;->a(Lcom/google/android/gms/panorama/PanoramaClient$a;)V

    return-void
.end method
