.class public Lco/vine/android/CommentsActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "CommentsActivity.java"


# static fields
.field public static final EXTRA_HIDE_KEYBOARD:Ljava/lang/String; = "hide_keyboard"

.field public static final EXTRA_POST_AUTHOR_ID:Ljava/lang/String; = "post_author_id"

.field public static final EXTRA_POST_ID:Ljava/lang/String; = "post_id"

.field private static final TAG:Ljava/lang/String; = "commentsthread"


# instance fields
.field private mFragment:Lco/vine/android/CommentsFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 60
    iget-object v0, p0, Lco/vine/android/CommentsActivity;->mFragment:Lco/vine/android/CommentsFragment;

    invoke-virtual {v0, p1, p2, p3}, Lco/vine/android/CommentsFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 61
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    const-wide/16 v8, -0x1

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 24
    const v3, 0x7f030037

    invoke-super {p0, p1, v3, v6}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 26
    iget-object v3, p0, Lco/vine/android/CommentsActivity;->mAppController:Lco/vine/android/client/AppController;

    if-nez v3, :cond_0

    .line 27
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v3

    iput-object v3, p0, Lco/vine/android/CommentsActivity;->mAppController:Lco/vine/android/client/AppController;

    .line 28
    new-instance v3, Lco/vine/android/VineException;

    invoke-direct {v3}, Lco/vine/android/VineException;-><init>()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "App controller is null here, and now? "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/CommentsActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v7, [Ljava/lang/Object;

    invoke-static {v3, v4, v5}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 31
    :cond_0
    iget-object v3, p0, Lco/vine/android/CommentsActivity;->mAppController:Lco/vine/android/client/AppController;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lco/vine/android/CommentsActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->isLoggedIn()Z

    move-result v3

    if-nez v3, :cond_2

    .line 57
    :cond_1
    :goto_0
    return-void

    .line 35
    :cond_2
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const v5, 0x7f0e0061

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {p0, v3, v4, v5, v6}, Lco/vine/android/CommentsActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 37
    invoke-virtual {p0}, Lco/vine/android/CommentsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 39
    .local v2, intent:Landroid/content/Intent;
    if-nez p1, :cond_1

    .line 40
    new-instance v3, Lco/vine/android/CommentsFragment;

    invoke-direct {v3}, Lco/vine/android/CommentsFragment;-><init>()V

    iput-object v3, p0, Lco/vine/android/CommentsActivity;->mFragment:Lco/vine/android/CommentsFragment;

    .line 41
    invoke-static {v2, v7}, Lco/vine/android/CommentsFragment;->prepareArguments(Landroid/content/Intent;Z)Landroid/os/Bundle;

    move-result-object v0

    .line 42
    .local v0, args:Landroid/os/Bundle;
    const-string v3, "hide_keyboard"

    invoke-virtual {v2, v3, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 44
    .local v1, hideKeyboard:Z
    const-string v3, "post_id"

    const-string v4, "post_id"

    invoke-virtual {v2, v4, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 46
    const-string v3, "post_author_id"

    const-string v4, "post_author_id"

    invoke-virtual {v2, v4, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 48
    const-string v3, "empty_desc"

    const v4, 0x7f0e005e

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 49
    const-string v3, "hide_keyboard"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 50
    iget-object v3, p0, Lco/vine/android/CommentsActivity;->mFragment:Lco/vine/android/CommentsFragment;

    invoke-virtual {v3, v0}, Lco/vine/android/CommentsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 52
    invoke-virtual {p0}, Lco/vine/android/CommentsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    const v4, 0x7f0a00a1

    iget-object v5, p0, Lco/vine/android/CommentsActivity;->mFragment:Lco/vine/android/CommentsFragment;

    const-string v6, "commentsthread"

    invoke-virtual {v3, v4, v5, v6}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    goto :goto_0
.end method
