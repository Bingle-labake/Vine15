.class Lco/vine/android/CommentsFragment$CommentsAppSessionListener;
.super Lco/vine/android/client/AppSessionListener;
.source "CommentsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/CommentsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CommentsAppSessionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/CommentsFragment;


# direct methods
.method constructor <init>(Lco/vine/android/CommentsFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 502
    iput-object p1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptchaRequired(Ljava/lang/String;Ljava/lang/String;Lco/vine/android/service/PendingAction;)V
    .locals 5
    .parameter "reqId"
    .parameter "captchaUrl"
    .parameter "action"

    .prologue
    .line 570
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/CommentsFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 571
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 572
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    new-instance v2, Lco/vine/android/PendingCaptchaRequest;

    iget v3, p3, Lco/vine/android/service/PendingAction;->actionCode:I

    iget-object v4, p3, Lco/vine/android/service/PendingAction;->bundle:Landroid/os/Bundle;

    invoke-direct {v2, p1, v3, v4}, Lco/vine/android/PendingCaptchaRequest;-><init>(Ljava/lang/String;ILandroid/os/Bundle;)V

    iput-object v2, v1, Lco/vine/android/CommentsFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    .line 573
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    invoke-virtual {v1, p1, p2}, Lco/vine/android/CommentsFragment;->showCaptcha(Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    :cond_0
    return-void
.end method

.method public onGetCommentsComplete(Ljava/lang/String;ILjava/lang/String;JI)V
    .locals 4
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"
    .parameter "responseCode"

    .prologue
    const/4 v3, 0x0

    .line 506
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/CommentsFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 507
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    #getter for: Lco/vine/android/CommentsFragment;->mPostId:J
    invoke-static {v1}, Lco/vine/android/CommentsFragment;->access$000(Lco/vine/android/CommentsFragment;)J

    move-result-wide v1

    cmp-long v1, p4, v1

    if-nez v1, :cond_0

    .line 508
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lco/vine/android/CommentsFragment;->hideProgress(I)V

    .line 509
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    iget-object v1, v1, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 510
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v3}, Lco/vine/android/CommentsFragment;->showSadface(ZZ)V

    .line 511
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    iget-object v1, v1, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    check-cast v1, Lco/vine/android/widget/ConversationList;

    invoke-virtual {v1}, Lco/vine/android/widget/ConversationList;->deactivateRefresh()V

    .line 515
    :goto_0
    const/4 v1, 0x4

    if-ne p6, v1, :cond_0

    .line 516
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    iget-object v1, v1, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    check-cast v1, Lco/vine/android/widget/ConversationList;

    invoke-virtual {v1}, Lco/vine/android/widget/ConversationList;->reactivateRefresh()V

    .line 519
    :cond_0
    return-void

    .line 513
    :cond_1
    iget-object v1, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    invoke-virtual {v1, v3}, Lco/vine/android/CommentsFragment;->showSadface(Z)V

    goto :goto_0
.end method

.method public onGetTagTypeAheadComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 2
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "query"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineTag;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 560
    .local p5, tags:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineTag;>;"
    iget-object v0, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    invoke-virtual {v0, p1}, Lco/vine/android/CommentsFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v0, 0xc8

    if-ne p2, v0, :cond_0

    .line 561
    invoke-virtual {p5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 562
    invoke-static {p4, p5}, Lco/vine/android/provider/VineSuggestionsProvider;->addRealtimeTagSuggestions(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 563
    iget-object v0, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    #getter for: Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;
    invoke-static {v0}, Lco/vine/android/CommentsFragment;->access$500(Lco/vine/android/CommentsFragment;)Lco/vine/android/widget/PopupEditText;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/PopupEditText;->performFilter(Z)V

    .line 566
    :cond_0
    return-void
.end method

.method public onGetUserTypeAheadComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 2
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "query"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 549
    .local p5, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    iget-object v0, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    invoke-virtual {v0, p1}, Lco/vine/android/CommentsFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v0, 0xc8

    if-ne p2, v0, :cond_0

    .line 550
    invoke-virtual {p5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 551
    invoke-static {p4, p5}, Lco/vine/android/provider/VineSuggestionsProvider;->addRealtimeUserSuggestions(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 552
    iget-object v0, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    #getter for: Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;
    invoke-static {v0}, Lco/vine/android/CommentsFragment;->access$500(Lco/vine/android/CommentsFragment;)Lco/vine/android/widget/PopupEditText;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/PopupEditText;->performFilter(Z)V

    .line 555
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
    .line 523
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    invoke-super {p0, p1}, Lco/vine/android/client/AppSessionListener;->onPhotoImageLoaded(Ljava/util/HashMap;)V

    .line 524
    iget-object v0, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    iget-object v0, v0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    check-cast v0, Lco/vine/android/CommentsAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/CommentsAdapter;->updateProfileImages(Ljava/util/HashMap;)V

    .line 525
    iget-object v0, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    #getter for: Lco/vine/android/CommentsFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;
    invoke-static {v0}, Lco/vine/android/CommentsFragment;->access$400(Lco/vine/android/CommentsFragment;)Lco/vine/android/UsersAutoCompleteAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lco/vine/android/UsersAutoCompleteAdapter;->setUserImages(Ljava/util/HashMap;)V

    .line 526
    return-void
.end method

.method public onPostCommentComplete(Ljava/lang/String;ILjava/lang/String;JLjava/lang/String;)V
    .locals 4
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"
    .parameter "comment"

    .prologue
    .line 531
    iget-object v2, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    invoke-virtual {v2}, Lco/vine/android/CommentsFragment;->dismissDialog()V

    .line 532
    iget-object v2, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    invoke-virtual {v2, p1}, Lco/vine/android/CommentsFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v1

    .line 533
    .local v1, req:Lco/vine/android/PendingRequest;
    if-eqz v1, :cond_0

    iget-object v2, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    #getter for: Lco/vine/android/CommentsFragment;->mPostId:J
    invoke-static {v2}, Lco/vine/android/CommentsFragment;->access$000(Lco/vine/android/CommentsFragment;)J

    move-result-wide v2

    cmp-long v2, p4, v2

    if-nez v2, :cond_0

    .line 534
    iget-object v2, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    iget-object v0, v2, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    .line 535
    .local v0, listView:Landroid/widget/ListView;
    new-instance v2, Lco/vine/android/CommentsFragment$CommentsAppSessionListener$1;

    invoke-direct {v2, p0, v0}, Lco/vine/android/CommentsFragment$CommentsAppSessionListener$1;-><init>(Lco/vine/android/CommentsFragment$CommentsAppSessionListener;Landroid/widget/ListView;)V

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 540
    const/16 v2, 0xc8

    if-eq p2, v2, :cond_0

    .line 541
    iget-object v2, p0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;->this$0:Lco/vine/android/CommentsFragment;

    #getter for: Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;
    invoke-static {v2}, Lco/vine/android/CommentsFragment;->access$500(Lco/vine/android/CommentsFragment;)Lco/vine/android/widget/PopupEditText;

    move-result-object v2

    invoke-virtual {v2, p6}, Lco/vine/android/widget/PopupEditText;->setText(Ljava/lang/CharSequence;)V

    .line 544
    .end local v0           #listView:Landroid/widget/ListView;
    :cond_0
    return-void
.end method
