.class Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;
.super Lco/vine/android/client/AppSessionListener;
.source "BaseTimelineFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/BaseTimelineFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TimeLineSessionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/BaseTimelineFragment;


# direct methods
.method constructor <init>(Lco/vine/android/BaseTimelineFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 507
    iput-object p1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

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
    .line 711
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/BaseTimelineFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 712
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 713
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    new-instance v2, Lco/vine/android/PendingCaptchaRequest;

    iget v3, p3, Lco/vine/android/service/PendingAction;->actionCode:I

    iget-object v4, p3, Lco/vine/android/service/PendingAction;->bundle:Landroid/os/Bundle;

    invoke-direct {v2, p1, v3, v4}, Lco/vine/android/PendingCaptchaRequest;-><init>(Ljava/lang/String;ILandroid/os/Bundle;)V

    iput-object v2, v1, Lco/vine/android/BaseTimelineFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    .line 715
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1, p1, p2}, Lco/vine/android/BaseTimelineFragment;->showCaptcha(Ljava/lang/String;Ljava/lang/String;)V

    .line 717
    :cond_0
    return-void
.end method

.method public onDeletePostComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    .line 646
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/BaseTimelineFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 647
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 648
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_1

    .line 649
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e011a

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 654
    :cond_0
    :goto_0
    return-void

    .line 651
    :cond_1
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e011b

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method public onGetCommentsComplete(Ljava/lang/String;ILjava/lang/String;JI)V
    .locals 0
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"
    .parameter "responseCode"

    .prologue
    .line 610
    invoke-super/range {p0 .. p6}, Lco/vine/android/client/AppSessionListener;->onGetCommentsComplete(Ljava/lang/String;ILjava/lang/String;JI)V

    .line 611
    return-void
.end method

.method public onGetTimeLineComplete(Ljava/lang/String;ILjava/lang/String;IIZLjava/util/ArrayList;Ljava/lang/String;IIIJZILjava/lang/String;)V
    .locals 20
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "type"
    .parameter "count"
    .parameter "memory"
    .parameter
    .parameter "tag"
    .parameter "pageType"
    .parameter "next"
    .parameter "previous"
    .parameter "anchor"
    .parameter "userInitiated"
    .parameter "size"
    .parameter "title"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "IIZ",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;",
            "Ljava/lang/String;",
            "IIIJZI",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 535
    .local p7, posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lco/vine/android/BaseTimelineFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v18

    .line 536
    .local v18, req:Lco/vine/android/PendingRequest;
    if-eqz v18, :cond_6

    .line 537
    if-eqz p6, :cond_5

    const/16 v1, 0xc8

    move/from16 v0, p2

    if-ne v0, v1, :cond_5

    .line 538
    sget-boolean v1, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v1, :cond_0

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v1}, Lco/vine/android/widget/GenericTimelineAdapter;->getStartLoadingTime()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    .line 539
    const-string v1, "Time since started loading to end fetch: {}ms"

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v2, v2, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v2}, Lco/vine/android/widget/GenericTimelineAdapter;->timeSinceStartLoadingTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 543
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v12

    .line 544
    .local v12, currentCursor:Landroid/database/Cursor;
    invoke-static/range {p4 .. p4}, Lco/vine/android/api/VineComparatorFactory;->get(I)Lco/vine/android/api/VineComparatorFactory$VineComparator;

    move-result-object v11

    .line 548
    .local v11, comparator:Lco/vine/android/api/VineComparatorFactory$VineComparator;,"Lco/vine/android/api/VineComparatorFactory$VineComparator<Lco/vine/android/api/VinePost;>;"
    if-eqz v12, :cond_1

    invoke-interface {v12}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-nez v1, :cond_8

    .line 549
    :cond_1
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v2}, Lco/vine/android/BaseTimelineFragment;->trackNewCount()Z

    move-result v2

    move-object/from16 v0, p7

    invoke-static {v1, v0, v11, v2}, Lco/vine/android/provider/HybridPostCursor;->mergePosts(Ljava/util/ArrayList;Ljava/util/ArrayList;Lco/vine/android/api/VineComparatorFactory$VineComparator;Z)Ljava/util/ArrayList;

    move-result-object v16

    .line 562
    .local v16, mergedPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    :goto_0
    if-eqz v16, :cond_5

    .line 564
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 565
    new-instance v13, Lco/vine/android/provider/HybridPostCursorExplore;

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorQuerySize:I

    move-object/from16 v0, v16

    invoke-direct {v13, v0, v1}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Ljava/util/ArrayList;I)V

    .line 569
    .local v13, cursor:Lco/vine/android/provider/HybridPostCursor;
    :goto_1
    if-gtz p10, :cond_2

    .line 570
    invoke-virtual {v13}, Lco/vine/android/provider/HybridPostCursor;->markLast()V

    .line 572
    :cond_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1, v13}, Landroid/support/v4/widget/CursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v17

    .line 573
    .local v17, oldCursor:Landroid/database/Cursor;
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    if-eqz v1, :cond_4

    .line 574
    if-eqz v17, :cond_3

    .line 575
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    move-object/from16 v0, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 577
    :cond_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-virtual {v13, v1}, Lco/vine/android/provider/HybridPostCursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 579
    :cond_4
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 581
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v2

    iput v2, v1, Lco/vine/android/BaseTimelineFragment;->mCursorQuerySize:I

    .line 582
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    const/4 v10, 0x0

    move-object/from16 v2, p7

    move/from16 v3, p4

    move-object/from16 v4, p8

    move/from16 v5, p9

    move/from16 v6, p10

    move/from16 v7, p11

    move-wide/from16 v8, p12

    invoke-virtual/range {v1 .. v10}, Lco/vine/android/client/AppController;->saveLoadedPosts(Ljava/util/ArrayList;ILjava/lang/String;IIIJZ)Ljava/lang/String;

    .line 586
    .end local v11           #comparator:Lco/vine/android/api/VineComparatorFactory$VineComparator;,"Lco/vine/android/api/VineComparatorFactory$VineComparator<Lco/vine/android/api/VinePost;>;"
    .end local v12           #currentCursor:Landroid/database/Cursor;
    .end local v13           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .end local v16           #mergedPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v17           #oldCursor:Landroid/database/Cursor;
    :cond_5
    move-object/from16 v0, v18

    iget v1, v0, Lco/vine/android/PendingRequest;->fetchType:I

    packed-switch v1, :pswitch_data_0

    .line 597
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    move-object/from16 v0, v18

    iget v2, v0, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {v1, v2}, Lco/vine/android/BaseTimelineFragment;->hideProgress(I)V

    .line 602
    :cond_6
    :goto_2
    invoke-static/range {p16 .. p16}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    #getter for: Lco/vine/android/BaseTimelineFragment;->mCallback:Landroid/support/v7/app/ActionBarActivity;
    invoke-static {v1}, Lco/vine/android/BaseTimelineFragment;->access$000(Lco/vine/android/BaseTimelineFragment;)Landroid/support/v7/app/ActionBarActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 603
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    #getter for: Lco/vine/android/BaseTimelineFragment;->mCallback:Landroid/support/v7/app/ActionBarActivity;
    invoke-static {v1}, Lco/vine/android/BaseTimelineFragment;->access$000(Lco/vine/android/BaseTimelineFragment;)Landroid/support/v7/app/ActionBarActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    move-object/from16 v0, p16

    invoke-virtual {v1, v0}, Landroid/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 605
    :cond_7
    return-void

    .line 552
    .restart local v11       #comparator:Lco/vine/android/api/VineComparatorFactory$VineComparator;,"Lco/vine/android/api/VineComparatorFactory$VineComparator<Lco/vine/android/api/VinePost;>;"
    .restart local v12       #currentCursor:Landroid/database/Cursor;
    :cond_8
    new-instance v19, Landroid/os/Bundle;

    invoke-direct/range {v19 .. v19}, Landroid/os/Bundle;-><init>()V

    .line 553
    .local v19, response:Landroid/os/Bundle;
    const-string v1, "include_list"

    const/4 v2, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 554
    move-object/from16 v0, v19

    invoke-interface {v12, v0}, Landroid/database/Cursor;->respond(Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 555
    invoke-interface {v12}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v15

    .line 556
    .local v15, extras:Landroid/os/Bundle;
    const-string v1, "extra_posts"

    invoke-virtual {v15, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v14

    .line 558
    .local v14, existingPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseTimelineFragment;->trackNewCount()Z

    move-result v1

    move-object/from16 v0, p7

    invoke-static {v14, v0, v11, v1}, Lco/vine/android/provider/HybridPostCursor;->mergePosts(Ljava/util/ArrayList;Ljava/util/ArrayList;Lco/vine/android/api/VineComparatorFactory$VineComparator;Z)Ljava/util/ArrayList;

    move-result-object v16

    .restart local v16       #mergedPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    goto/16 :goto_0

    .line 567
    .end local v14           #existingPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v15           #extras:Landroid/os/Bundle;
    .end local v19           #response:Landroid/os/Bundle;
    :cond_9
    new-instance v13, Lco/vine/android/provider/HybridPostCursor;

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorQuerySize:I

    move-object/from16 v0, v16

    invoke-direct {v13, v0, v1}, Lco/vine/android/provider/HybridPostCursor;-><init>(Ljava/util/ArrayList;I)V

    .restart local v13       #cursor:Lco/vine/android/provider/HybridPostCursor;
    goto/16 :goto_1

    .line 588
    .end local v11           #comparator:Lco/vine/android/api/VineComparatorFactory$VineComparator;,"Lco/vine/android/api/VineComparatorFactory$VineComparator<Lco/vine/android/api/VinePost;>;"
    .end local v12           #currentCursor:Landroid/database/Cursor;
    .end local v13           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .end local v16           #mergedPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v1, :cond_a

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    if-nez p5, :cond_a

    .line 589
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    move-object/from16 v0, v18

    iget v2, v0, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {v1, v2}, Lco/vine/android/BaseTimelineFragment;->hideProgress(I)V

    .line 590
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lco/vine/android/BaseTimelineFragment;->showSadface(Z)V

    goto/16 :goto_2

    .line 592
    :cond_a
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lco/vine/android/BaseTimelineFragment;->showSadface(Z)V

    goto/16 :goto_2

    .line 586
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public onLikePost(Ljava/lang/String;ILjava/lang/String;J)V
    .locals 2
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"

    .prologue
    .line 658
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/BaseTimelineFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 659
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 660
    const/16 v1, 0xc8

    if-eq p2, v1, :cond_0

    .line 661
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/LikeCache;->removeEntry(J)V

    .line 662
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/widget/GenericTimelineAdapter;->showUnlikedByMe(J)V

    .line 663
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 666
    :cond_0
    return-void
.end method

.method public onLowMemory()V
    .locals 2

    .prologue
    .line 624
    invoke-super {p0}, Lco/vine/android/client/AppSessionListener;->onLowMemory()V

    .line 625
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v0, v1, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    .line 626
    .local v0, adapter:Lco/vine/android/widget/GenericTimelineAdapter;
    if-eqz v0, :cond_0

    .line 627
    invoke-virtual {v0}, Lco/vine/android/widget/GenericTimelineAdapter;->onLowMemory()V

    .line 629
    :cond_0
    return-void
.end method

.method public onPhotoImageError(Lco/vine/android/util/image/ImageKey;Lco/vine/android/network/HttpResult;)V
    .locals 0
    .parameter "key"
    .parameter "result"

    .prologue
    .line 521
    invoke-super {p0, p1, p2}, Lco/vine/android/client/AppSessionListener;->onPhotoImageError(Lco/vine/android/util/image/ImageKey;Lco/vine/android/network/HttpResult;)V

    .line 522
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
    .line 526
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v0, v0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/widget/GenericTimelineAdapter;->setImages(Ljava/util/HashMap;)V

    .line 527
    return-void
.end method

.method public onReportPostComplete(Ljava/lang/String;ILjava/lang/String;J)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"

    .prologue
    .line 634
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/BaseTimelineFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 635
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 636
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_1

    .line 637
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e011f

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 642
    :cond_0
    :goto_0
    return-void

    .line 639
    :cond_1
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e0120

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method public onRevine(Ljava/lang/String;ILjava/lang/String;JLco/vine/android/api/VineRepost;)V
    .locals 6
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"
    .parameter "repost"

    .prologue
    .line 683
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/BaseTimelineFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 684
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 685
    const/16 v1, 0xc8

    if-eq p2, v1, :cond_1

    .line 686
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/RevineCache;->unRevine(J)V

    .line 687
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 688
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const/4 v2, 0x0

    invoke-virtual {v1, p4, p5, v2}, Lco/vine/android/widget/GenericTimelineAdapter;->updateRevinedCount(JZ)V

    .line 693
    :cond_0
    :goto_0
    return-void

    .line 690
    :cond_1
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    iget-wide v2, p6, Lco/vine/android/api/VineRepost;->postId:J

    iget-wide v4, p6, Lco/vine/android/api/VineRepost;->repostId:J

    invoke-virtual {v1, v2, v3, v4, v5}, Lco/vine/android/RevineCache;->putMyRepostId(JJ)V

    goto :goto_0
.end method

.method public onTrimMemory(I)V
    .locals 2
    .parameter "level"

    .prologue
    .line 615
    invoke-super {p0, p1}, Lco/vine/android/client/AppSessionListener;->onTrimMemory(I)V

    .line 616
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v0, v1, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    .line 617
    .local v0, adapter:Lco/vine/android/widget/GenericTimelineAdapter;
    if-eqz v0, :cond_0

    .line 618
    invoke-virtual {v0, p1}, Lco/vine/android/widget/GenericTimelineAdapter;->onTrimMemory(I)V

    .line 620
    :cond_0
    return-void
.end method

.method public onUnlikePost(Ljava/lang/String;ILjava/lang/String;J)V
    .locals 2
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"

    .prologue
    .line 670
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/BaseTimelineFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 671
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 672
    const/16 v1, 0xc8

    if-eq p2, v1, :cond_0

    .line 673
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/LikeCache;->like(J)V

    .line 674
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/widget/GenericTimelineAdapter;->showLikedByMe(J)V

    .line 675
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 678
    :cond_0
    return-void
.end method

.method public onUnrevine(Ljava/lang/String;ILjava/lang/String;J)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"

    .prologue
    .line 697
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/BaseTimelineFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 698
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 699
    const/16 v1, 0xc8

    if-eq p2, v1, :cond_1

    .line 700
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/RevineCache;->revine(J)V

    .line 701
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 702
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const/4 v2, 0x1

    invoke-virtual {v1, p4, p5, v2}, Lco/vine/android/widget/GenericTimelineAdapter;->updateRevinedCount(JZ)V

    .line 707
    :cond_0
    :goto_0
    return-void

    .line 704
    :cond_1
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v1, v1, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/RevineCache;->removeEntry(J)V

    goto :goto_0
.end method

.method public onVideoPathError(Lco/vine/android/util/video/VideoKey;Lco/vine/android/network/HttpResult;)V
    .locals 3
    .parameter "key"
    .parameter "result"

    .prologue
    .line 516
    const-string v0, "s"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Download of video failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lco/vine/android/network/HttpResult;->reasonPhrase:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " key: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lco/vine/android/util/video/VideoKey;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    return-void
.end method

.method public onVideoPathObtained(Ljava/util/HashMap;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/video/VideoKey;",
            "Lco/vine/android/util/video/UrlVideo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 511
    .local p1, videos:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/video/VideoKey;Lco/vine/android/util/video/UrlVideo;>;"
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->this$0:Lco/vine/android/BaseTimelineFragment;

    iget-object v0, v0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/widget/GenericTimelineAdapter;->onVideoPathObtained(Ljava/util/HashMap;)V

    .line 512
    return-void
.end method
