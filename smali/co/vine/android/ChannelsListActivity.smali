.class public Lco/vine/android/ChannelsListActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "ChannelsListActivity.java"


# static fields
.field public static final EXTRA_CHANNEL:Ljava/lang/String; = "channel"

.field public static final EXTRA_CHANNEL_ID:Ljava/lang/String; = "channel_id"

.field public static final EXTRA_SELECTED_CHANNEL:Ljava/lang/String; = "selected_channel"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onChannelSelected(JLjava/lang/String;)V
    .locals 2
    .parameter "channelId"
    .parameter "channel"

    .prologue
    .line 42
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 43
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "channel"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    const-string v1, "channel_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 45
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lco/vine/android/ChannelsListActivity;->setResult(ILandroid/content/Intent;)V

    .line 46
    invoke-virtual {p0}, Lco/vine/android/ChannelsListActivity;->finish()V

    .line 47
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 19
    const v4, 0x7f030037

    invoke-super {p0, p1, v4, v8}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 20
    invoke-virtual {p0, v8}, Lco/vine/android/ChannelsListActivity;->setRequestedOrientation(I)V

    .line 23
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const v6, 0x7f0e014f

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {p0, v4, v5, v6, v7}, Lco/vine/android/ChannelsListActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 25
    invoke-virtual {p0}, Lco/vine/android/ChannelsListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 27
    .local v1, intent:Landroid/content/Intent;
    if-nez p1, :cond_0

    .line 28
    new-instance v0, Lco/vine/android/ChannelsListFragment;

    invoke-direct {v0}, Lco/vine/android/ChannelsListFragment;-><init>()V

    .line 29
    .local v0, fragment:Lco/vine/android/ChannelsListFragment;
    const-string v4, "selected_channel"

    const-wide/16 v5, -0x1

    invoke-virtual {v1, v4, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 30
    .local v2, selectedChannel:J
    const-string v4, "refresh"

    invoke-virtual {v1, v4, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 31
    const-string v4, "take_focus"

    invoke-virtual {v1, v4, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 32
    const-string v4, "selected_channel"

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 33
    invoke-static {v1, v9}, Lco/vine/android/BaseListFragment;->prepareArguments(Landroid/content/Intent;Z)Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {v0, v4}, Lco/vine/android/ChannelsListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 34
    invoke-virtual {p0}, Lco/vine/android/ChannelsListActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    const v5, 0x7f0a00a1

    invoke-virtual {v4, v5, v0}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 39
    .end local v0           #fragment:Lco/vine/android/ChannelsListFragment;
    .end local v2           #selectedChannel:J
    :cond_0
    return-void
.end method
