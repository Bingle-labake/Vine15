.class public Lco/vine/android/ImageActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "ImageActivity.java"


# static fields
.field public static final EXTRA_IMAGE_URL:Ljava/lang/String; = "image_url"

.field public static final FRAGMENT_TAG:Ljava/lang/String; = "image_fragment"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    return-void
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 2
    .parameter "context"
    .parameter "imageUrl"
    .parameter "titleResId"

    .prologue
    .line 46
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/ImageActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 47
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "image_url"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    const-string v1, "title"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 49
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 50
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 21
    const v3, 0x7f030037

    invoke-super {p0, p1, v3, v7}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 22
    invoke-virtual {p0, v7}, Lco/vine/android/ImageActivity;->setRequestedOrientation(I)V

    .line 24
    invoke-virtual {p0}, Lco/vine/android/ImageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 26
    .local v1, intent:Landroid/content/Intent;
    const-string v3, "title"

    invoke-virtual {v1, v3, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 27
    .local v2, titleResId:I
    if-nez v2, :cond_0

    .line 28
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "An ActionBar title resourceId must be provided when starting this Activity."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 32
    :cond_0
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {p0, v3, v4, v5, v6}, Lco/vine/android/ImageActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 34
    if-nez p1, :cond_1

    .line 35
    new-instance v0, Lco/vine/android/ImageFragment;

    invoke-direct {v0}, Lco/vine/android/ImageFragment;-><init>()V

    .line 36
    .local v0, fragment:Lco/vine/android/ImageFragment;
    const-string v3, "take_focus"

    invoke-virtual {v1, v3, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 37
    invoke-static {v1, v8}, Lco/vine/android/BaseListFragment;->prepareArguments(Landroid/content/Intent;Z)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v0, v3}, Lco/vine/android/ImageFragment;->setArguments(Landroid/os/Bundle;)V

    .line 38
    invoke-virtual {p0}, Lco/vine/android/ImageActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    const v4, 0x7f0a00a1

    const-string v5, "image_fragment"

    invoke-virtual {v3, v4, v0, v5}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 43
    .end local v0           #fragment:Lco/vine/android/ImageFragment;
    :cond_1
    return-void
.end method
