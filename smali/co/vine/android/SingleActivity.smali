.class public Lco/vine/android/SingleActivity;
.super Lco/vine/android/BaseTimelineActivity;
.source "SingleActivity.java"


# static fields
.field private static final EXTRA_LOCKED:Ljava/lang/String; = "locked"

.field private static final EXTRA_POST_ID:Ljava/lang/String; = "post_id"

.field private static final EXTRA_SHARE_ID:Ljava/lang/String; = "post_share_id"

.field private static final EXTRA_USERNAME:Ljava/lang/String; = "username"

.field private static final EXTRA_USER_ID:Ljava/lang/String; = "userId"

.field private static final FRAGMENT_TAG:Ljava/lang/String; = "single_post"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lco/vine/android/BaseTimelineActivity;-><init>()V

    return-void
.end method

.method public static start(Landroid/content/Context;J)V
    .locals 2
    .parameter "context"
    .parameter "postId"

    .prologue
    .line 58
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/SingleActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 59
    .local v0, i:Landroid/content/Intent;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 60
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 61
    return-void
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "shareId"

    .prologue
    .line 64
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/SingleActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 65
    .local v0, i:Landroid/content/Intent;
    const-string v1, "post_share_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 66
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 67
    return-void
.end method

.method public static startLocked(Landroid/content/Context;JLjava/lang/String;J)V
    .locals 3
    .parameter "context"
    .parameter "postId"
    .parameter "username"
    .parameter "userId"

    .prologue
    .line 70
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/SingleActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 71
    .local v0, i:Landroid/content/Intent;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 72
    const-string v1, "locked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 73
    const-string v1, "username"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 74
    const-string v1, "userId"

    invoke-virtual {v0, v1, p4, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 75
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 76
    return-void
.end method


# virtual methods
.method protected getCurrentTimeLineFragment()Lco/vine/android/BaseTimelineFragment;
    .locals 2

    .prologue
    .line 48
    invoke-virtual {p0}, Lco/vine/android/SingleActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "single_post"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lco/vine/android/BaseTimelineFragment;

    return-object v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 80
    invoke-virtual {p0}, Lco/vine/android/SingleActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "single_post"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 81
    .local v0, fragment:Landroid/support/v4/app/Fragment;
    instance-of v1, v0, Lco/vine/android/BaseTimelineFragment;

    if-eqz v1, :cond_0

    .line 82
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 84
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseTimelineActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 85
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x1

    .line 28
    const v2, 0x7f030037

    invoke-super {p0, p1, v2, v6}, Lco/vine/android/BaseTimelineActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 29
    invoke-virtual {p0, v6}, Lco/vine/android/SingleActivity;->setRequestedOrientation(I)V

    .line 31
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const v4, 0x7f0e01c1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {p0, v2, v3, v4, v5}, Lco/vine/android/SingleActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 33
    invoke-virtual {p0}, Lco/vine/android/SingleActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 35
    .local v1, intent:Landroid/content/Intent;
    if-nez p1, :cond_0

    .line 36
    new-instance v0, Lco/vine/android/SingleFragment;

    invoke-direct {v0}, Lco/vine/android/SingleFragment;-><init>()V

    .line 37
    .local v0, fragment:Landroid/support/v4/app/Fragment;
    const-string v2, "take_focus"

    invoke-virtual {v1, v2, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 38
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lco/vine/android/BaseListFragment;->prepareArguments(Landroid/content/Intent;Z)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 39
    invoke-virtual {p0}, Lco/vine/android/SingleActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    const v3, 0x7f0a00a1

    const-string v4, "single_post"

    invoke-virtual {v2, v3, v0, v4}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 44
    .end local v0           #fragment:Landroid/support/v4/app/Fragment;
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 53
    invoke-virtual {p0}, Lco/vine/android/SingleActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f100007

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 54
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method
