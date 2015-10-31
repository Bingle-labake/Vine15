.class Lco/vine/android/ActivityFragment$ActivityListener;
.super Lco/vine/android/client/AppSessionListener;
.source "ActivityFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ActivityFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ActivityListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/ActivityFragment;


# direct methods
.method constructor <init>(Lco/vine/android/ActivityFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 477
    iput-object p1, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetActivityComplete(Ljava/lang/String;ILjava/lang/String;II)V
    .locals 6
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "count"
    .parameter "followRequestCount"

    .prologue
    const/16 v5, 0xc8

    .line 482
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    invoke-virtual {v2, p1}, Lco/vine/android/ActivityFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v1

    .line 483
    .local v1, req:Lco/vine/android/PendingRequest;
    if-eqz v1, :cond_3

    .line 484
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    iget v3, v1, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {v2, v3}, Lco/vine/android/ActivityFragment;->hideProgress(I)V

    .line 485
    if-eq p2, v5, :cond_0

    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    #getter for: Lco/vine/android/ActivityFragment;->mFocused:Z
    invoke-static {v2}, Lco/vine/android/ActivityFragment;->access$000(Lco/vine/android/ActivityFragment;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 486
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    invoke-virtual {v2}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const v3, 0x7f0e003c

    invoke-static {v2, v3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 488
    :cond_0
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    invoke-virtual {v2}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 489
    .local v0, pr:Landroid/content/SharedPreferences;
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    const-string v3, "settings_private"

    const/4 v4, 0x0

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    #setter for: Lco/vine/android/ActivityFragment;->mPrivate:Z
    invoke-static {v2, v3}, Lco/vine/android/ActivityFragment;->access$102(Lco/vine/android/ActivityFragment;Z)Z

    .line 491
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    #getter for: Lco/vine/android/ActivityFragment;->mPrivate:Z
    invoke-static {v2}, Lco/vine/android/ActivityFragment;->access$100(Lco/vine/android/ActivityFragment;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 492
    if-ne p2, v5, :cond_4

    .line 493
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "settings_follow_pref_count"

    iget-object v4, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    #getter for: Lco/vine/android/ActivityFragment;->mFollowRequestCount:I
    invoke-static {v4}, Lco/vine/android/ActivityFragment;->access$200(Lco/vine/android/ActivityFragment;)I

    move-result v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 494
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    #setter for: Lco/vine/android/ActivityFragment;->mFollowRequestCount:I
    invoke-static {v2, p5}, Lco/vine/android/ActivityFragment;->access$202(Lco/vine/android/ActivityFragment;I)I

    .line 495
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    invoke-virtual {v2}, Lco/vine/android/ActivityFragment;->updateFollowRequestHeader()V

    .line 500
    :cond_1
    :goto_0
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    iget-object v2, v2, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    iget-object v2, v2, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    if-nez p4, :cond_2

    .line 501
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lco/vine/android/ActivityFragment;->showSadface(Z)V

    .line 505
    :cond_2
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    invoke-virtual {v2}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    invoke-virtual {v3}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/service/GCMNotificationService;->getClearNotificationIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 508
    .end local v0           #pr:Landroid/content/SharedPreferences;
    :cond_3
    return-void

    .line 497
    .restart local v0       #pr:Landroid/content/SharedPreferences;
    :cond_4
    iget-object v2, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    #calls: Lco/vine/android/ActivityFragment;->updateFollowRequestCount()V
    invoke-static {v2}, Lco/vine/android/ActivityFragment;->access$300(Lco/vine/android/ActivityFragment;)V

    goto :goto_0
.end method

.method public onGetUsersMeComplete(Ljava/lang/String;ILjava/lang/String;JLco/vine/android/api/VineUser;)V
    .locals 2
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "sessionOwnerId"
    .parameter "meUser"

    .prologue
    .line 518
    if-eqz p6, :cond_0

    invoke-virtual {p6}, Lco/vine/android/api/VineUser;->isPrivate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 519
    iget-object v0, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    const/4 v1, 0x1

    #setter for: Lco/vine/android/ActivityFragment;->mPrivate:Z
    invoke-static {v0, v1}, Lco/vine/android/ActivityFragment;->access$102(Lco/vine/android/ActivityFragment;Z)Z

    .line 520
    iget-object v0, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    invoke-virtual {v0}, Lco/vine/android/ActivityFragment;->restartLoader()Z

    .line 521
    iget-object v0, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    invoke-virtual {v0}, Lco/vine/android/ActivityFragment;->updateFollowRequestHeader()V

    .line 523
    :cond_0
    return-void
.end method

.method public onPhotoImageLoaded(Ljava/util/HashMap;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/image/ImageKey;",
            "Lco/vine/android/util/image/UrlImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 512
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    iget-object v0, p0, Lco/vine/android/ActivityFragment$ActivityListener;->this$0:Lco/vine/android/ActivityFragment;

    iget-object v0, v0, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    check-cast v0, Lco/vine/android/ActivityAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/ActivityAdapter;->setUserImages(Ljava/util/HashMap;)V

    .line 513
    return-void
.end method
