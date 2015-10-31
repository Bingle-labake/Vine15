.class public abstract Lco/vine/android/BaseControllerActionBarActivity;
.super Lco/vine/android/BaseActionBarActivity;
.source "BaseControllerActionBarActivity.java"


# static fields
.field public static final EXTRA_TITLE_ID:Ljava/lang/String; = "title"

.field private static final STATE_PENDING_REQUESTS:Ljava/lang/String; = "pending_reqs"


# instance fields
.field protected mAppController:Lco/vine/android/client/AppController;

.field protected mAppSessionListener:Lco/vine/android/client/AppSessionListener;

.field private mPendingRequests:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lco/vine/android/BaseActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public getAppController()Lco/vine/android/client/AppController;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lco/vine/android/BaseControllerActionBarActivity;->mAppController:Lco/vine/android/client/AppController;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;IZ)V
    .locals 2
    .parameter "savedInstanceState"
    .parameter "layout"
    .parameter "loginRequired"

    .prologue
    .line 26
    const/4 v0, 0x0

    invoke-super {p0, p1, p2, p3, v0}, Lco/vine/android/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;IZZ)V

    .line 28
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/BaseControllerActionBarActivity;->mAppController:Lco/vine/android/client/AppController;

    .line 30
    if-eqz p1, :cond_0

    .line 31
    const-string v0, "pending_reqs"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/BaseControllerActionBarActivity;->mPendingRequests:Ljava/util/ArrayList;

    .line 36
    :goto_0
    return-void

    .line 33
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lco/vine/android/BaseControllerActionBarActivity;->mPendingRequests:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 40
    invoke-super {p0}, Lco/vine/android/BaseActionBarActivity;->onDestroy()V

    .line 41
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v0

    if-nez v0, :cond_0

    .line 42
    invoke-static {}, Lco/vine/android/player/SdkVideoView;->releaseStaticIfNeeded()V

    .line 44
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 62
    invoke-super {p0}, Lco/vine/android/BaseActionBarActivity;->onPause()V

    .line 63
    iget-object v0, p0, Lco/vine/android/BaseControllerActionBarActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lco/vine/android/BaseControllerActionBarActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/BaseControllerActionBarActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->removeListener(Lco/vine/android/client/AppSessionListener;)V

    .line 66
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 54
    invoke-super {p0}, Lco/vine/android/BaseActionBarActivity;->onResume()V

    .line 55
    iget-object v0, p0, Lco/vine/android/BaseControllerActionBarActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lco/vine/android/BaseControllerActionBarActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/BaseControllerActionBarActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->addListener(Lco/vine/android/client/AppSessionListener;)V

    .line 58
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 48
    invoke-super {p0, p1}, Lco/vine/android/BaseActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 49
    const-string v0, "pending_reqs"

    iget-object v1, p0, Lco/vine/android/BaseControllerActionBarActivity;->mPendingRequests:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 50
    return-void
.end method
