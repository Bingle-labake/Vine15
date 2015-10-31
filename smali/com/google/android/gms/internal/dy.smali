.class public Lcom/google/android/gms/internal/dy;
.super Lcom/google/android/gms/internal/p;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/dy$i;,
        Lcom/google/android/gms/internal/dy$c;,
        Lcom/google/android/gms/internal/dy$d;,
        Lcom/google/android/gms/internal/dy$l;,
        Lcom/google/android/gms/internal/dy$g;,
        Lcom/google/android/gms/internal/dy$e;,
        Lcom/google/android/gms/internal/dy$a;,
        Lcom/google/android/gms/internal/dy$m;,
        Lcom/google/android/gms/internal/dy$h;,
        Lcom/google/android/gms/internal/dy$f;,
        Lcom/google/android/gms/internal/dy$b;,
        Lcom/google/android/gms/internal/dy$j;,
        Lcom/google/android/gms/internal/dy$k;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/dx;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Ljava/lang/String;

.field private final gN:[Ljava/lang/String;

.field private final ha:Ljava/lang/String;

.field private final hb:Ljava/lang/String;

.field private hc:Lcom/google/android/gms/plus/model/people/Person;

.field private final hd:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p5, p6, p9}, Lcom/google/android/gms/internal/p;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;)V

    iput-object p2, p0, Lcom/google/android/gms/internal/dy;->ha:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/dy;->hb:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/dy;->g:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/internal/dy;->hd:[Ljava/lang/String;

    iput-object p8, p0, Lcom/google/android/gms/internal/dy;->gN:[Ljava/lang/String;

    return-void
.end method

.method static synthetic a(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/model/people/Person;)Lcom/google/android/gms/plus/model/people/Person;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dy;->hc:Lcom/google/android/gms/plus/model/people/Person;

    return-object p1
.end method


# virtual methods
.method protected W(Landroid/os/IBinder;)Lcom/google/android/gms/internal/dx;
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/internal/dx$a;->V(Landroid/os/IBinder;)Lcom/google/android/gms/internal/dx;

    move-result-object v0

    return-object v0
.end method

.method protected a(Lcom/google/android/gms/internal/u;Lcom/google/android/gms/internal/p$d;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/u;",
            "Lcom/google/android/gms/internal/p",
            "<",
            "Lcom/google/android/gms/internal/dx;",
            ">.d;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    const-string v0, "skip_oob"

    const/4 v1, 0x0

    invoke-virtual {v7, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "request_visible_actions"

    iget-object v1, p0, Lcom/google/android/gms/internal/dy;->hd:[Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dy;->gN:[Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, "required_features"

    iget-object v1, p0, Lcom/google/android/gms/internal/dy;->gN:[Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/dy$i;

    invoke-direct {v1, p0, p2}, Lcom/google/android/gms/internal/dy$i;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/internal/p$d;)V

    const v2, 0x2fda64

    iget-object v3, p0, Lcom/google/android/gms/internal/dy;->ha:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/internal/dy;->hb:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->j()[Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/gms/internal/dy;->g:Ljava/lang/String;

    move-object v0, p1

    invoke-interface/range {v0 .. v7}, Lcom/google/android/gms/internal/u;->a(Lcom/google/android/gms/internal/t;ILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public a(Lcom/google/android/gms/plus/PlusClient$a;Landroid/net/Uri;I)V
    .locals 4

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v0, "bounding_box"

    invoke-virtual {v1, v0, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    new-instance v2, Lcom/google/android/gms/internal/dy$c;

    invoke-direct {v2, p0, p1}, Lcom/google/android/gms/internal/dy$c;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$a;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    invoke-interface {v0, v2, p2, v1}, Lcom/google/android/gms/internal/dx;->a(Lcom/google/android/gms/internal/dw;Landroid/net/Uri;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/16 v0, 0x8

    invoke-virtual {v2, v0, v3, v3}, Lcom/google/android/gms/internal/dy$c;->a(ILandroid/os/Bundle;Landroid/os/ParcelFileDescriptor;)V

    goto :goto_0
.end method

.method public a(Lcom/google/android/gms/plus/PlusClient$b;Ljava/lang/String;)V
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    new-instance v1, Lcom/google/android/gms/internal/dy$j;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/dy$j;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$b;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/dx;->a(Lcom/google/android/gms/internal/dw;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/16 v0, 0x8

    invoke-virtual {v1, v0, v2, v2}, Lcom/google/android/gms/internal/dy$j;->a(ILandroid/os/Bundle;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method protected b()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.plus.service.START"

    return-object v0
.end method

.method protected synthetic c(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/dy;->W(Landroid/os/IBinder;)Lcom/google/android/gms/internal/dx;

    move-result-object v0

    return-object v0
.end method

.method protected c()Ljava/lang/String;
    .locals 1

    const-string v0, "com.google.android.gms.plus.internal.IPlusService"

    return-object v0
.end method

.method public clearDefaultAccount()V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/google/android/gms/internal/dy;->hc:Lcom/google/android/gms/plus/model/people/Person;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    invoke-interface {v0}, Lcom/google/android/gms/internal/dx;->clearDefaultAccount()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getAccountName()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    invoke-interface {v0}, Lcom/google/android/gms/internal/dx;->getAccountName()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getCurrentPerson()Lcom/google/android/gms/plus/model/people/Person;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    iget-object v0, p0, Lcom/google/android/gms/internal/dy;->hc:Lcom/google/android/gms/plus/model/people/Person;

    return-object v0
.end method

.method public loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .parameter "listener"
    .parameter "maxResults"
    .parameter "pageToken"
    .parameter "targetUrl"
    .parameter "type"
    .parameter "userId"

    .prologue
    const/4 v7, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    new-instance v1, Lcom/google/android/gms/internal/dy$a;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/dy$a;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/dx;->a(Lcom/google/android/gms/internal/dw;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/16 v0, 0x8

    invoke-static {v0}, Lcom/google/android/gms/internal/k;->e(I)Lcom/google/android/gms/internal/k;

    move-result-object v0

    invoke-virtual {v1, v0, v7, v7}, Lcom/google/android/gms/internal/dy$a;->a(Lcom/google/android/gms/internal/k;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public loadPeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;IIILjava/lang/String;)V
    .locals 6
    .parameter "listener"
    .parameter "collection"
    .parameter "orderBy"
    .parameter "maxResults"
    .parameter "pageToken"

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    new-instance v1, Lcom/google/android/gms/internal/dy$e;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/dy$e;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/dx;->a(Lcom/google/android/gms/internal/dw;IIILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/16 v0, 0x8

    invoke-static {v0}, Lcom/google/android/gms/internal/k;->e(I)Lcom/google/android/gms/internal/k;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/dy$e;->a(Lcom/google/android/gms/internal/k;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public loadPerson(Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;Ljava/lang/String;)V
    .locals 3
    .parameter "listener"
    .parameter "userId"

    .prologue
    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    new-instance v1, Lcom/google/android/gms/internal/dy$g;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/dy$g;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/dx;->e(Lcom/google/android/gms/internal/dw;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/16 v0, 0x8

    invoke-virtual {v1, v0, v2, v2}, Lcom/google/android/gms/internal/dy$g;->a(ILandroid/os/Bundle;Lcom/google/android/gms/internal/at;)V

    goto :goto_0
.end method

.method public removeMoment(Ljava/lang/String;)V
    .locals 2
    .parameter "momentId"

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/dx;->removeMoment(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public revokeAccessAndDisconnect(Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V
    .locals 2
    .parameter "listener"

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->clearDefaultAccount()V

    new-instance v1, Lcom/google/android/gms/internal/dy$l;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/dy$l;-><init>(Lcom/google/android/gms/internal/dy;Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/dx;->c(Lcom/google/android/gms/internal/dw;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeMoment(Lcom/google/android/gms/plus/model/moments/Moment;)V
    .locals 2
    .parameter "moment"

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->n()V

    :try_start_0
    check-cast p1, Lcom/google/android/gms/internal/ef;

    .end local p1
    invoke-static {p1}, Lcom/google/android/gms/internal/at;->a(Lcom/google/android/gms/internal/an;)Lcom/google/android/gms/internal/at;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dy;->o()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/dx;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/dx;->a(Lcom/google/android/gms/internal/at;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
