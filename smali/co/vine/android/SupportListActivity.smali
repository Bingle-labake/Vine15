.class public Lco/vine/android/SupportListActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "SupportListActivity.java"


# instance fields
.field protected mAdapter:Landroid/widget/ListAdapter;

.field private mFinishedStart:Z

.field private mHandler:Landroid/os/Handler;

.field protected mList:Landroid/widget/ListView;

.field private mOnClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mRequestFocus:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 176
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 188
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lco/vine/android/SupportListActivity;->mHandler:Landroid/os/Handler;

    .line 189
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/SupportListActivity;->mFinishedStart:Z

    .line 191
    new-instance v0, Lco/vine/android/SupportListActivity$1;

    invoke-direct {v0, p0}, Lco/vine/android/SupportListActivity$1;-><init>(Lco/vine/android/SupportListActivity;)V

    iput-object v0, p0, Lco/vine/android/SupportListActivity;->mRequestFocus:Ljava/lang/Runnable;

    .line 317
    new-instance v0, Lco/vine/android/SupportListActivity$2;

    invoke-direct {v0, p0}, Lco/vine/android/SupportListActivity$2;-><init>(Lco/vine/android/SupportListActivity;)V

    iput-object v0, p0, Lco/vine/android/SupportListActivity;->mOnClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method private ensureList()V
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    if-eqz v0, :cond_0

    .line 315
    :goto_0
    return-void

    .line 313
    :cond_0
    const v0, 0x1090014

    invoke-virtual {p0, v0}, Lco/vine/android/SupportListActivity;->setContentView(I)V

    goto :goto_0
.end method


# virtual methods
.method public getListAdapter()Landroid/widget/ListAdapter;
    .locals 1

    .prologue
    .line 306
    iget-object v0, p0, Lco/vine/android/SupportListActivity;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getListView()Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 298
    invoke-direct {p0}, Lco/vine/android/SupportListActivity;->ensureList()V

    .line 299
    iget-object v0, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    return-object v0
.end method

.method public getSelectedItemId()J
    .locals 2

    .prologue
    .line 291
    iget-object v0, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getSelectedItemId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSelectedItemPosition()I
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getSelectedItemPosition()I

    move-result v0

    return v0
.end method

.method public onContentChanged()V
    .locals 3

    .prologue
    .line 240
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onContentChanged()V

    .line 241
    const v1, 0x1020004

    invoke-virtual {p0, v1}, Lco/vine/android/SupportListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 242
    .local v0, emptyView:Landroid/view/View;
    const v1, 0x102000a

    invoke-virtual {p0, v1}, Lco/vine/android/SupportListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    .line 243
    iget-object v1, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    if-nez v1, :cond_0

    .line 244
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Your content must have a ListView whose id attribute is \'android.R.id.list\'"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 248
    :cond_0
    if-eqz v0, :cond_1

    .line 249
    iget-object v1, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 251
    :cond_1
    iget-object v1, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    iget-object v2, p0, Lco/vine/android/SupportListActivity;->mOnClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 252
    iget-boolean v1, p0, Lco/vine/android/SupportListActivity;->mFinishedStart:Z

    if-eqz v1, :cond_2

    .line 253
    iget-object v1, p0, Lco/vine/android/SupportListActivity;->mAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {p0, v1}, Lco/vine/android/SupportListActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 255
    :cond_2
    iget-object v1, p0, Lco/vine/android/SupportListActivity;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lco/vine/android/SupportListActivity;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 256
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/SupportListActivity;->mFinishedStart:Z

    .line 257
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 228
    iget-object v0, p0, Lco/vine/android/SupportListActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lco/vine/android/SupportListActivity;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 229
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 230
    return-void
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 0
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 209
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "state"

    .prologue
    .line 219
    invoke-direct {p0}, Lco/vine/android/SupportListActivity;->ensureList()V

    .line 220
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 221
    return-void
.end method

.method public setListAdapter(Landroid/widget/ListAdapter;)V
    .locals 1
    .parameter "adapter"

    .prologue
    .line 263
    monitor-enter p0

    .line 264
    :try_start_0
    invoke-direct {p0}, Lco/vine/android/SupportListActivity;->ensureList()V

    .line 265
    iput-object p1, p0, Lco/vine/android/SupportListActivity;->mAdapter:Landroid/widget/ListAdapter;

    .line 266
    iget-object v0, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 267
    monitor-exit p0

    .line 268
    return-void

    .line 267
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setSelection(I)V
    .locals 1
    .parameter "position"

    .prologue
    .line 277
    iget-object v0, p0, Lco/vine/android/SupportListActivity;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setSelection(I)V

    .line 278
    return-void
.end method
