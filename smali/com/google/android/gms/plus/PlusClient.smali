.class public Lcom/google/android/gms/plus/PlusClient;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/GooglePlayServicesClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/plus/PlusClient$Builder;,
        Lcom/google/android/gms/plus/PlusClient$a;,
        Lcom/google/android/gms/plus/PlusClient$b;,
        Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;,
        Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;,
        Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;,
        Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;
    }
.end annotation


# static fields
.field public static final KEY_REQUEST_VISIBLE_ACTIVITIES:Ljava/lang/String; = "request_visible_actions"


# instance fields
.field final gJ:Lcom/google/android/gms/internal/dy;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 10
    .parameter "context"
    .parameter "callingPackage"
    .parameter "authPackage"
    .parameter "accountName"
    .parameter "connectedListener"
    .parameter "connectionFailedListener"
    .parameter "visibleActions"
    .parameter "requiredFeatures"
    .parameter "scopes"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/dy;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/internal/dy;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dy;->j()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/av;->a([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public a(Lcom/google/android/gms/plus/PlusClient$a;Landroid/net/Uri;I)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gms/internal/dy;->a(Lcom/google/android/gms/plus/PlusClient$a;Landroid/net/Uri;I)V

    return-void
.end method

.method public a(Lcom/google/android/gms/plus/PlusClient$b;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/dy;->a(Lcom/google/android/gms/plus/PlusClient$b;Ljava/lang/String;)V

    return-void
.end method

.method public clearDefaultAccount()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dy;->clearDefaultAccount()V

    return-void
.end method

.method public connect()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dy;->connect()V

    return-void
.end method

.method public disconnect()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dy;->disconnect()V

    return-void
.end method

.method public getAccountName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dy;->getAccountName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentPerson()Lcom/google/android/gms/plus/model/people/Person;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dy;->getCurrentPerson()Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v0

    return-object v0
.end method

.method public isConnected()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dy;->isConnected()Z

    move-result v0

    return v0
.end method

.method public isConnecting()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dy;->isConnecting()Z

    move-result v0

    return v0
.end method

.method public isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dy;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    return v0
.end method

.method public isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dy;->isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z

    move-result v0

    return v0
.end method

.method public loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;)V
    .locals 7
    .parameter "listener"

    .prologue
    const/4 v3, 0x0

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    const/16 v2, 0x14

    const-string v6, "me"

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/dy;->loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "listener"
    .parameter "maxResults"
    .parameter "pageToken"
    .parameter "targetUrl"
    .parameter "type"
    .parameter "userId"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/dy;->loadMoments(Lcom/google/android/gms/plus/PlusClient$OnMomentsLoadedListener;ILjava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public loadPeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;I)V
    .locals 6
    .parameter "listener"
    .parameter "collection"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    const/4 v3, 0x0

    const/16 v4, 0x64

    const/4 v5, 0x0

    move-object v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/dy;->loadPeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;IIILjava/lang/String;)V

    return-void
.end method

.method public loadPeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;IIILjava/lang/String;)V
    .locals 6
    .parameter "listener"
    .parameter "collection"
    .parameter "orderBy"
    .parameter "maxResults"
    .parameter "pageToken"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/dy;->loadPeople(Lcom/google/android/gms/plus/PlusClient$OnPeopleLoadedListener;IIILjava/lang/String;)V

    return-void
.end method

.method public loadPerson(Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;Ljava/lang/String;)V
    .locals 1
    .parameter "listener"
    .parameter "userId"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/dy;->loadPerson(Lcom/google/android/gms/plus/PlusClient$OnPersonLoadedListener;Ljava/lang/String;)V

    return-void
.end method

.method public registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dy;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dy;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method

.method public removeMoment(Ljava/lang/String;)V
    .locals 1
    .parameter "momentId"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dy;->removeMoment(Ljava/lang/String;)V

    return-void
.end method

.method public revokeAccessAndDisconnect(Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dy;->revokeAccessAndDisconnect(Lcom/google/android/gms/plus/PlusClient$OnAccessRevokedListener;)V

    return-void
.end method

.method public unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dy;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dy;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method

.method public writeMoment(Lcom/google/android/gms/plus/model/moments/Moment;)V
    .locals 1
    .parameter "moment"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient;->gJ:Lcom/google/android/gms/internal/dy;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/dy;->writeMoment(Lcom/google/android/gms/plus/model/moments/Moment;)V

    return-void
.end method
