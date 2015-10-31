.class public Lcom/google/android/gms/plus/PlusClient$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/plus/PlusClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private e:Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

.field private g:Ljava/lang/String;

.field private gK:Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

.field private gL:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private gM:[Ljava/lang/String;

.field private gN:[Ljava/lang/String;

.field private gO:Ljava/lang/String;

.field private gP:Ljava/lang/String;

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 2
    .parameter "context"
    .parameter "connectionCallbacks"
    .parameter "connectionFailedListener"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gK:Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    iput-object p3, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->e:Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gL:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gP:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gO:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gL:Ljava/util/ArrayList;

    const-string v1, "https://www.googleapis.com/auth/plus.login"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/gms/plus/PlusClient;
    .locals 10

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->g:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "<<default account>>"

    iput-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->g:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gL:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gL:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;

    new-instance v0, Lcom/google/android/gms/plus/PlusClient;

    iget-object v1, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gP:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gO:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->g:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gK:Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;

    iget-object v6, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->e:Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;

    iget-object v7, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gM:[Ljava/lang/String;

    iget-object v8, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gN:[Ljava/lang/String;

    invoke-direct/range {v0 .. v9}, Lcom/google/android/gms/plus/PlusClient;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-object v0
.end method

.method public clearScopes()Lcom/google/android/gms/plus/PlusClient$Builder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gL:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-object p0
.end method

.method public setAccountName(Ljava/lang/String;)Lcom/google/android/gms/plus/PlusClient$Builder;
    .locals 0
    .parameter "accountName"

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->g:Ljava/lang/String;

    return-object p0
.end method

.method public varargs setScopes([Ljava/lang/String;)Lcom/google/android/gms/plus/PlusClient$Builder;
    .locals 2
    .parameter "scopes"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gL:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gL:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object p0
.end method

.method public varargs setVisibleActivities([Ljava/lang/String;)Lcom/google/android/gms/plus/PlusClient$Builder;
    .locals 0
    .parameter "visibleActivities"

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/PlusClient$Builder;->gM:[Ljava/lang/String;

    return-object p0
.end method
