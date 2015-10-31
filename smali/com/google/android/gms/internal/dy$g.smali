.class final Lcom/google/android/gms/internal/dy$g;
.super Lcom/google/android/gms/internal/dv;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "g"
.end annotation


# instance fields
.field final synthetic hf:Lcom/google/android/gms/internal/dy;

.field private final hm:Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dy$g;->hf:Lcom/google/android/gms/internal/dy;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dv;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/dy$g;->hm:Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;

    return-void
.end method


# virtual methods
.method public a(ILandroid/os/Bundle;Lcom/google/android/gms/internal/at;)V
    .locals 6

    const/4 v1, 0x0

    if-eqz p2, :cond_1

    const-string v0, "pendingIntent"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    :goto_0
    new-instance v2, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {v2, p1, v0}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    if-nez p3, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dy$g;->hf:Lcom/google/android/gms/internal/dy;

    new-instance v3, Lcom/google/android/gms/internal/dy$h;

    iget-object v4, p0, Lcom/google/android/gms/internal/dy$g;->hf:Lcom/google/android/gms/internal/dy;

    iget-object v5, p0, Lcom/google/android/gms/internal/dy$g;->hm:Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;

    invoke-direct {v3, v4, v5, v2, v1}, Lcom/google/android/gms/internal/dy$h;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/plus/model/people/Person;)V

    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/dy;->a(Lcom/google/android/gms/internal/p$b;)V

    :goto_1
    return-void

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/eq;->CREATOR:Lcom/google/android/gms/internal/er;

    invoke-virtual {p3, v0}, Lcom/google/android/gms/internal/at;->a(Landroid/os/Parcelable$Creator;)Lcom/google/android/gms/internal/ae;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/eq;

    iget-object v1, p0, Lcom/google/android/gms/internal/dy$g;->hf:Lcom/google/android/gms/internal/dy;

    new-instance v3, Lcom/google/android/gms/internal/dy$h;

    iget-object v4, p0, Lcom/google/android/gms/internal/dy$g;->hf:Lcom/google/android/gms/internal/dy;

    iget-object v5, p0, Lcom/google/android/gms/internal/dy$g;->hm:Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;

    invoke-direct {v3, v4, v5, v2, v0}, Lcom/google/android/gms/internal/dy$h;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/plus/model/people/Person;)V

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/dy;->a(Lcom/google/android/gms/internal/p$b;)V

    goto :goto_1

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method
