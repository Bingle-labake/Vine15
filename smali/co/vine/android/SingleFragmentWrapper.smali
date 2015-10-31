.class public Lco/vine/android/SingleFragmentWrapper;
.super Ljava/lang/Object;
.source "SingleFragmentWrapper.java"


# static fields
.field public static final ARG_LOCKED:Ljava/lang/String; = "locked"

.field public static final ARG_POST_ID:Ljava/lang/String; = "post_id"

.field public static final ARG_SHARE_ID:Ljava/lang/String; = "post_share_id"

.field public static final ARG_TAKE_FOCUS:Ljava/lang/String; = "take_focus"

.field public static final ARG_USERNAME:Ljava/lang/String; = "username"

.field public static final ARG_USER_ID:Ljava/lang/String; = "userId"


# instance fields
.field private mAppController:Lco/vine/android/client/AppController;

.field private mFragment:Lco/vine/android/BaseControllerFragment;

.field private mLocked:Z

.field private mPostId:J

.field private mShareId:Ljava/lang/String;

.field private mSinglePostListener:Lco/vine/android/client/AppSessionListener;

.field private mUserId:J

.field private mUsername:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fetchPostContent()Ljava/lang/String;
    .locals 4

    .prologue
    .line 97
    iget-object v0, p0, Lco/vine/android/SingleFragmentWrapper;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/SingleFragmentWrapper;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    iget-wide v2, p0, Lco/vine/android/SingleFragmentWrapper;->mPostId:J

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/client/AppController;->fetchPost(Lco/vine/android/client/Session;J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public fetchPostId()Ljava/lang/String;
    .locals 3

    .prologue
    .line 101
    iget-object v0, p0, Lco/vine/android/SingleFragmentWrapper;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/SingleFragmentWrapper;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/SingleFragmentWrapper;->mShareId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lco/vine/android/client/AppController;->fetchPostId(Lco/vine/android/client/Session;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPostId()J
    .locals 2

    .prologue
    .line 125
    iget-wide v0, p0, Lco/vine/android/SingleFragmentWrapper;->mPostId:J

    return-wide v0
.end method

.method public getSharedId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lco/vine/android/SingleFragmentWrapper;->mShareId:Ljava/lang/String;

    return-object v0
.end method

.method public isLocked()Z
    .locals 1

    .prologue
    .line 70
    iget-boolean v0, p0, Lco/vine/android/SingleFragmentWrapper;->mLocked:Z

    return v0
.end method

.method public onCreate(Lco/vine/android/BaseControllerFragment;Lco/vine/android/client/AppSessionListener;)Z
    .locals 5
    .parameter "fragment"
    .parameter "listener"

    .prologue
    const/4 v2, 0x0

    .line 49
    iput-object p1, p0, Lco/vine/android/SingleFragmentWrapper;->mFragment:Lco/vine/android/BaseControllerFragment;

    .line 50
    iget-object v3, p0, Lco/vine/android/SingleFragmentWrapper;->mFragment:Lco/vine/android/BaseControllerFragment;

    invoke-virtual {v3}, Lco/vine/android/BaseControllerFragment;->getAppController()Lco/vine/android/client/AppController;

    move-result-object v3

    iput-object v3, p0, Lco/vine/android/SingleFragmentWrapper;->mAppController:Lco/vine/android/client/AppController;

    .line 51
    invoke-virtual {p1}, Lco/vine/android/BaseControllerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 52
    .local v0, args:Landroid/os/Bundle;
    const-string v3, "locked"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lco/vine/android/SingleFragmentWrapper;->mLocked:Z

    .line 54
    iget-boolean v3, p0, Lco/vine/android/SingleFragmentWrapper;->mLocked:Z

    if-nez v3, :cond_1

    .line 55
    const-string v3, "post_id"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Lco/vine/android/SingleFragmentWrapper;->mPostId:J

    .line 56
    const-string v3, "post_share_id"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lco/vine/android/SingleFragmentWrapper;->mShareId:Ljava/lang/String;

    .line 57
    const-string v3, "take_focus"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 58
    .local v1, takeFocus:Z
    iput-object p2, p0, Lco/vine/android/SingleFragmentWrapper;->mSinglePostListener:Lco/vine/android/client/AppSessionListener;

    .line 59
    if-eqz v1, :cond_0

    .line 60
    const/4 v2, 0x1

    .line 66
    .end local v1           #takeFocus:Z
    :cond_0
    :goto_0
    return v2

    .line 63
    :cond_1
    const-string v3, "username"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lco/vine/android/SingleFragmentWrapper;->mUsername:Ljava/lang/String;

    .line 64
    const-string v3, "userId"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Lco/vine/android/SingleFragmentWrapper;->mUserId:J

    goto :goto_0
.end method

.method public onCreateLoader()Landroid/support/v4/content/Loader;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 115
    iget-boolean v0, p0, Lco/vine/android/SingleFragmentWrapper;->mLocked:Z

    if-eqz v0, :cond_0

    .line 118
    :goto_0
    return-object v4

    :cond_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    iget-object v1, p0, Lco/vine/android/SingleFragmentWrapper;->mFragment:Lco/vine/android/BaseControllerFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseControllerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_SINGLE:Landroid/net/Uri;

    iget-wide v5, p0, Lco/vine/android/SingleFragmentWrapper;->mPostId:J

    invoke-static {v2, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    move-object v4, v0

    goto :goto_0
.end method

.method public onCreateLockedView(Landroid/view/View;Lco/vine/android/widget/SpanClickListener;)Landroid/view/View;
    .locals 9
    .parameter "v"
    .parameter "listener"

    .prologue
    const/4 v8, 0x0

    const/4 v6, 0x1

    .line 74
    const v3, 0x7f0a00bb

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 75
    .local v2, tv:Landroid/widget/TextView;
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 76
    new-instance v1, Lco/vine/android/widget/StyledClickableSpan;

    iget-wide v3, p0, Lco/vine/android/SingleFragmentWrapper;->mUserId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-direct {v1, v6, v3, p2}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 78
    .local v1, styled:Lco/vine/android/widget/StyledClickableSpan;
    iget-object v3, p0, Lco/vine/android/SingleFragmentWrapper;->mFragment:Lco/vine/android/BaseControllerFragment;

    invoke-virtual {v3}, Lco/vine/android/BaseControllerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f090076

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v1, v3}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 79
    new-array v3, v6, [Ljava/lang/Object;

    aput-object v1, v3, v8

    iget-object v4, p0, Lco/vine/android/SingleFragmentWrapper;->mFragment:Lco/vine/android/BaseControllerFragment;

    const v5, 0x7f0e011e

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lco/vine/android/SingleFragmentWrapper;->mUsername:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {v4, v5, v6}, Lco/vine/android/BaseControllerFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x22

    invoke-static {v3, v4, v5}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v0

    .line 81
    .local v0, sp:Landroid/text/Spanned;
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    return-object p1
.end method

.method public onGetPostIdComplete(J)V
    .locals 0
    .parameter "postId"

    .prologue
    .line 105
    iput-wide p1, p0, Lco/vine/android/SingleFragmentWrapper;->mPostId:J

    .line 106
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 109
    iget-object v0, p0, Lco/vine/android/SingleFragmentWrapper;->mSinglePostListener:Lco/vine/android/client/AppSessionListener;

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lco/vine/android/SingleFragmentWrapper;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/SingleFragmentWrapper;->mSinglePostListener:Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->removeListener(Lco/vine/android/client/AppSessionListener;)V

    .line 112
    :cond_0
    return-void
.end method

.method public onResume()Z
    .locals 2

    .prologue
    .line 86
    invoke-virtual {p0}, Lco/vine/android/SingleFragmentWrapper;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    const/4 v0, 0x0

    .line 92
    :goto_0
    return v0

    .line 89
    :cond_0
    iget-object v0, p0, Lco/vine/android/SingleFragmentWrapper;->mSinglePostListener:Lco/vine/android/client/AppSessionListener;

    if-eqz v0, :cond_1

    .line 90
    iget-object v0, p0, Lco/vine/android/SingleFragmentWrapper;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/SingleFragmentWrapper;->mSinglePostListener:Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->addListener(Lco/vine/android/client/AppSessionListener;)V

    .line 92
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method
