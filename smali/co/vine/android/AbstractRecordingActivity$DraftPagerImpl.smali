.class Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;
.super Landroid/support/v4/app/DraftFragmentStatePagerAdapter;
.source "AbstractRecordingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/AbstractRecordingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DraftPagerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/AbstractRecordingActivity;


# direct methods
.method public constructor <init>(Lco/vine/android/AbstractRecordingActivity;Landroid/support/v4/app/FragmentManager;)V
    .locals 0
    .parameter
    .parameter "fm"

    .prologue
    .line 1385
    iput-object p1, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    .line 1386
    invoke-direct {p0, p2}, Landroid/support/v4/app/DraftFragmentStatePagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 1387
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 3
    .parameter "container"
    .parameter "position"
    .parameter "object"

    .prologue
    .line 1445
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/DraftFragmentStatePagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 1447
    instance-of v2, p3, Lco/vine/android/DraftFragment;

    if-eqz v2, :cond_0

    .line 1448
    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    invoke-virtual {v2}, Lco/vine/android/AbstractRecordingActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 1449
    .local v1, m:Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 1450
    .local v0, ft:Landroid/support/v4/app/FragmentTransaction;
    check-cast p3, Lco/vine/android/DraftFragment;

    .end local p3
    invoke-virtual {v0, p3}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 1451
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 1453
    .end local v0           #ft:Landroid/support/v4/app/FragmentTransaction;
    .end local v1           #m:Landroid/support/v4/app/FragmentManager;
    :cond_0
    return-void
.end method

.method public finishUpdate(Landroid/view/ViewGroup;)V
    .locals 2
    .parameter "container"

    .prologue
    .line 1470
    invoke-super {p0, p1}, Landroid/support/v4/app/DraftFragmentStatePagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    .line 1475
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #getter for: Lco/vine/android/AbstractRecordingActivity;->mFirstDraftLaunch:Z
    invoke-static {v0}, Lco/vine/android/AbstractRecordingActivity;->access$3700(Lco/vine/android/AbstractRecordingActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1476
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #calls: Lco/vine/android/AbstractRecordingActivity;->setCurrentSession()Z
    invoke-static {v0}, Lco/vine/android/AbstractRecordingActivity;->access$3800(Lco/vine/android/AbstractRecordingActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    #setter for: Lco/vine/android/AbstractRecordingActivity;->mFirstDraftLaunch:Z
    invoke-static {v1, v0}, Lco/vine/android/AbstractRecordingActivity;->access$3702(Lco/vine/android/AbstractRecordingActivity;Z)Z

    .line 1478
    :cond_0
    return-void

    .line 1476
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 1390
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #getter for: Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;
    invoke-static {v0}, Lco/vine/android/AbstractRecordingActivity;->access$2800(Lco/vine/android/AbstractRecordingActivity;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 9
    .parameter "i"

    .prologue
    .line 1395
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #getter for: Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;
    invoke-static {v1}, Lco/vine/android/AbstractRecordingActivity;->access$2800(Lco/vine/android/AbstractRecordingActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne p1, v1, :cond_0

    .line 1396
    new-instance v0, Lco/vine/android/DraftCameraPreviewFragment;

    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    iget v1, v1, Lco/vine/android/AbstractRecordingActivity;->mPreviewDimen:I

    invoke-direct {v0, v1}, Lco/vine/android/DraftCameraPreviewFragment;-><init>(I)V

    .line 1397
    .local v0, fragment:Lco/vine/android/DraftCameraPreviewFragment;
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    #setter for: Lco/vine/android/AbstractRecordingActivity;->mCameraFragment:Ljava/lang/ref/WeakReference;
    invoke-static {v1, v2}, Lco/vine/android/AbstractRecordingActivity;->access$2902(Lco/vine/android/AbstractRecordingActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 1439
    .end local v0           #fragment:Lco/vine/android/DraftCameraPreviewFragment;
    :goto_0
    return-object v0

    .line 1400
    :cond_0
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #getter for: Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;
    invoke-static {v1}, Lco/vine/android/AbstractRecordingActivity;->access$2800(Lco/vine/android/AbstractRecordingActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    .line 1401
    .local v8, session:Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;
    new-instance v0, Lco/vine/android/DraftFragment;

    if-nez p1, :cond_1

    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #getter for: Lco/vine/android/AbstractRecordingActivity;->mFirstPageSet:Z
    invoke-static {v1}, Lco/vine/android/AbstractRecordingActivity;->access$3000(Lco/vine/android/AbstractRecordingActivity;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    iget-object v2, v8, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->video:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    iget-object v2, v8, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->thumb:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v8, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->folder:Ljava/io/File;

    iget-object v2, v8, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->meta:Lco/vine/android/recorder/RecordSessionMeta;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordSessionMeta;->getProgress()I

    move-result v6

    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    iget v7, v2, Lco/vine/android/AbstractRecordingActivity;->mPreviewDimen:I

    move v2, p1

    invoke-direct/range {v0 .. v7}, Lco/vine/android/DraftFragment;-><init>(ZILjava/lang/String;Ljava/lang/String;Ljava/io/File;II)V

    .line 1405
    .local v0, fragment:Lco/vine/android/DraftFragment;
    new-instance v1, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl$1;

    invoke-direct {v1, p0, v0}, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl$1;-><init>(Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;Lco/vine/android/DraftFragment;)V

    invoke-virtual {v0, v1}, Lco/vine/android/DraftFragment;->setListener(Landroid/view/View$OnClickListener;)V

    .line 1438
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #getter for: Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;
    invoke-static {v1}, Lco/vine/android/AbstractRecordingActivity;->access$000(Lco/vine/android/AbstractRecordingActivity;)Landroid/util/SparseArray;

    move-result-object v1

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, p1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 1401
    .end local v0           #fragment:Lco/vine/android/DraftFragment;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 2
    .parameter "object"

    .prologue
    .line 1457
    instance-of v1, p1, Lco/vine/android/DraftFragment;

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 1458
    check-cast v0, Lco/vine/android/DraftFragment;

    .line 1459
    .local v0, frag:Lco/vine/android/DraftFragment;
    invoke-virtual {v0}, Lco/vine/android/DraftFragment;->isExpired()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1460
    const/4 v1, -0x2

    .line 1465
    .end local v0           #frag:Lco/vine/android/DraftFragment;
    :goto_0
    return v1

    .line 1462
    .restart local v0       #frag:Lco/vine/android/DraftFragment;
    :cond_0
    const/4 v1, -0x1

    goto :goto_0

    .line 1465
    .end local v0           #frag:Lco/vine/android/DraftFragment;
    :cond_1
    invoke-super {p0, p1}, Landroid/support/v4/app/DraftFragmentStatePagerAdapter;->getItemPosition(Ljava/lang/Object;)I

    move-result v1

    goto :goto_0
.end method
