.class public Lco/vine/android/UploadsListFragment;
.super Lco/vine/android/BaseListFragment;
.source "UploadsListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;


# static fields
.field public static final ARG_TAKE_FOCUS:Ljava/lang/String; = "take_focus"

.field private static final DIALOG_CONFIRM_DELETE:I = 0x1


# instance fields
.field private mPath:Ljava/lang/String;

.field private mReference:Ljava/lang/String;

.field private mRetryView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mRsm:Lco/vine/android/recorder/RecordSessionManager;

.field private mSpinnerView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ProgressBar;",
            ">;"
        }
    .end annotation
.end field

.field private mStatusMessage:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private mUploadCompleteReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lco/vine/android/BaseListFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 50
    iget-object v0, p0, Lco/vine/android/UploadsListFragment;->mRetryView:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$100(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 50
    iget-object v0, p0, Lco/vine/android/UploadsListFragment;->mSpinnerView:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 50
    iget-object v0, p0, Lco/vine/android/UploadsListFragment;->mStatusMessage:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method private handleRetryPost(Landroid/database/Cursor;Z)V
    .locals 9
    .parameter "cursor"
    .parameter "ignoreCaptcha"

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 236
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/UploadsListFragment;->mPath:Ljava/lang/String;

    .line 239
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 240
    .local v7, status:I
    iget-object v0, p0, Lco/vine/android/UploadsListFragment;->mPath:Ljava/lang/String;

    invoke-static {v0, p1}, Lco/vine/android/api/VineUpload;->fromCursor(Ljava/lang/String;Landroid/database/Cursor;)Lco/vine/android/api/VineUpload;

    move-result-object v8

    .line 241
    .local v8, upload:Lco/vine/android/api/VineUpload;
    if-nez v7, :cond_0

    .line 242
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, v8}, Lco/vine/android/service/VineUploadService;->getUploadIntent(Landroid/content/Context;Lco/vine/android/api/VineUpload;)Landroid/content/Intent;

    move-result-object v6

    .line 243
    .local v6, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 259
    :goto_0
    return-void

    .line 245
    .end local v6           #intent:Landroid/content/Intent;
    :cond_0
    iget-object v0, v8, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 246
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, v8, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    iget-object v2, v8, Lco/vine/android/api/VineUpload;->thumbnailPath:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lco/vine/android/PostActivity;->getIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    move-result-object v6

    .line 248
    .restart local v6       #intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/support/v4/app/FragmentActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 249
    .end local v6           #intent:Landroid/content/Intent;
    :cond_1
    iget-object v0, v8, Lco/vine/android/api/VineUpload;->captchaUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p2, :cond_3

    .line 250
    :cond_2
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, v8, v4}, Lco/vine/android/service/VineUploadService;->getPostIntent(Landroid/content/Context;Lco/vine/android/api/VineUpload;Z)Landroid/content/Intent;

    move-result-object v6

    .line 251
    .restart local v6       #intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 253
    .end local v6           #intent:Landroid/content/Intent;
    :cond_3
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, v8, Lco/vine/android/api/VineUpload;->captchaUrl:Ljava/lang/String;

    iget-object v2, p0, Lco/vine/android/UploadsListFragment;->mPath:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lco/vine/android/CaptchaActivity;->getIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v6

    .line 254
    .restart local v6       #intent:Landroid/content/Intent;
    new-instance v0, Lco/vine/android/PendingCaptchaRequest;

    iget-object v1, p0, Lco/vine/android/UploadsListFragment;->mPath:Ljava/lang/String;

    invoke-direct {v0, v1, v5, v3}, Lco/vine/android/PendingCaptchaRequest;-><init>(Ljava/lang/String;ILandroid/os/Bundle;)V

    iput-object v0, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    .line 255
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const/16 v1, 0xb

    invoke-virtual {v0, v6, v1}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method


# virtual methods
.method protected handlePendingCaptchaRequest()V
    .locals 6

    .prologue
    .line 155
    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    if-eqz v4, :cond_2

    .line 156
    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v4, v4, Lco/vine/android/PendingCaptchaRequest;->state:I

    const/4 v5, 0x3

    if-ne v4, v5, :cond_3

    .line 157
    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mListView:Landroid/widget/ListView;

    if-eqz v4, :cond_1

    .line 158
    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getChildCount()I

    move-result v4

    iget-object v5, p0, Lco/vine/android/UploadsListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v5

    if-le v4, v5, :cond_1

    .line 159
    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mListView:Landroid/widget/ListView;

    iget-object v5, p0, Lco/vine/android/UploadsListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 160
    .local v1, currentRow:Landroid/view/View;
    if-eqz v1, :cond_1

    .line 161
    const v4, 0x7f0a001d

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    .line 163
    .local v2, loading:Landroid/widget/ProgressBar;
    if-eqz v2, :cond_0

    .line 164
    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 165
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lco/vine/android/UploadsListFragment;->mSpinnerView:Ljava/lang/ref/WeakReference;

    .line 168
    :cond_0
    const v4, 0x7f0a017f

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 169
    .local v3, retry:Landroid/widget/ImageView;
    if-eqz v3, :cond_1

    .line 170
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 171
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lco/vine/android/UploadsListFragment;->mRetryView:Ljava/lang/ref/WeakReference;

    .line 183
    .end local v1           #currentRow:Landroid/view/View;
    .end local v2           #loading:Landroid/widget/ProgressBar;
    .end local v3           #retry:Landroid/widget/ImageView;
    :cond_1
    :goto_0
    const/4 v4, 0x0

    iput-object v4, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    .line 185
    :cond_2
    return-void

    .line 176
    :cond_3
    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v4, v4, Lco/vine/android/PendingCaptchaRequest;->state:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_1

    .line 178
    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v4}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 179
    .local v0, c:Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 180
    const/4 v4, 0x1

    invoke-direct {p0, v0, v4}, Lco/vine/android/UploadsListFragment;->handleRetryPost(Landroid/database/Cursor;Z)V

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const/4 v8, 0x0

    .line 116
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 118
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 120
    .local v0, activity:Landroid/support/v4/app/FragmentActivity;
    iget-object v5, p0, Lco/vine/android/UploadsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-nez v5, :cond_0

    .line 121
    new-instance v5, Lco/vine/android/UploadsAdapter;

    iget-object v6, p0, Lco/vine/android/UploadsListFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-direct {v5, v0, v6, v8}, Lco/vine/android/UploadsAdapter;-><init>(Landroid/content/Context;Lco/vine/android/client/AppController;I)V

    iput-object v5, p0, Lco/vine/android/UploadsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 125
    :cond_0
    :try_start_0
    invoke-static {v0}, Lco/vine/android/recorder/RecordSessionManager;->getInstance(Landroid/content/Context;)Lco/vine/android/recorder/RecordSessionManager;

    move-result-object v5

    iput-object v5, p0, Lco/vine/android/UploadsListFragment;->mRsm:Lco/vine/android/recorder/RecordSessionManager;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    :goto_0
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f03006b

    iget-object v7, p0, Lco/vine/android/UploadsListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v5, v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 132
    .local v2, header:Landroid/view/View;
    const v5, 0x7f0a0034

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 133
    .local v3, headerTitle:Landroid/widget/TextView;
    const v5, 0x7f0e01cf

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(I)V

    .line 135
    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mListView:Landroid/widget/ListView;

    .line 136
    .local v4, listview:Landroid/widget/ListView;
    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5, v8}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 137
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090073

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setBackgroundColor(I)V

    .line 138
    invoke-virtual {v4, v8}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 139
    invoke-virtual {v4, p0}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 140
    iget-object v5, p0, Lco/vine/android/UploadsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 141
    return-void

    .line 126
    .end local v2           #header:Landroid/view/View;
    .end local v3           #headerTitle:Landroid/widget/TextView;
    .end local v4           #listview:Landroid/widget/ListView;
    :catch_0
    move-exception v1

    .line 127
    .local v1, e:Ljava/io/IOException;
    const v5, 0x7f0e01b1

    invoke-static {v0, v5}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 128
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v2, 0x2

    .line 312
    packed-switch p1, :pswitch_data_0

    .line 330
    :cond_0
    :goto_0
    return-void

    .line 314
    :pswitch_0
    iget-object v1, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    if-eqz v1, :cond_0

    if-eqz p3, :cond_0

    .line 315
    const-string v1, "rid"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 316
    .local v0, path:Ljava/lang/String;
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    iget-object v1, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v1, v1, Lco/vine/android/PendingCaptchaRequest;->reqId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 318
    iget-object v1, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iput v2, v1, Lco/vine/android/PendingCaptchaRequest;->state:I

    .line 320
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0

    .line 321
    :cond_1
    if-ne p2, v2, :cond_0

    iget-object v1, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v1, v1, Lco/vine/android/PendingCaptchaRequest;->reqId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 323
    iget-object v1, p0, Lco/vine/android/UploadsListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    const/4 v2, 0x3

    iput v2, v1, Lco/vine/android/PendingCaptchaRequest;->state:I

    goto :goto_0

    .line 312
    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 308
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 70
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 72
    new-instance v0, Lco/vine/android/UploadsListFragment$1;

    invoke-direct {v0, p0}, Lco/vine/android/UploadsListFragment$1;-><init>(Lco/vine/android/UploadsListFragment;)V

    iput-object v0, p0, Lco/vine/android/UploadsListFragment;->mUploadCompleteReceiver:Landroid/content/BroadcastReceiver;

    .line 112
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 8
    .parameter "id"
    .parameter "args"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 196
    const-string v7, "status=?"

    .line 197
    .local v7, selection:Ljava/lang/String;
    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v5, v0

    .line 198
    .local v5, selArgs:[Ljava/lang/String;
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/VineUploads$Uploads;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v4, "status=?"

    const-string v6, "_id ASC"

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 5
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    .line 281
    packed-switch p2, :pswitch_data_0

    .line 304
    :goto_0
    :pswitch_0
    return-void

    .line 283
    :pswitch_1
    packed-switch p3, :pswitch_data_1

    goto :goto_0

    .line 288
    :pswitch_2
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 290
    .local v0, context:Landroid/content/Context;
    :try_start_0
    iget-object v3, p0, Lco/vine/android/UploadsListFragment;->mRsm:Lco/vine/android/recorder/RecordSessionManager;

    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mReference:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lco/vine/android/recorder/RecordSessionManager;->getFolderFromName(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 291
    .local v2, folder:Ljava/io/File;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 292
    const-string v3, "Upload List Deleted."

    invoke-static {v2, v3}, Lco/vine/android/recorder/RecordSessionManager;->deleteSession(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    .end local v2           #folder:Ljava/io/File;
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/UploadsListFragment;->mPath:Ljava/lang/String;

    invoke-static {v0, v4}, Lco/vine/android/service/VineUploadService;->getDiscardIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 294
    :catch_0
    move-exception v1

    .line 295
    .local v1, e:Ljava/io/IOException;
    const-string v3, "Failed to delete session."

    invoke-static {v3}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V

    goto :goto_1

    .line 281
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
    .end packed-switch

    .line 283
    :pswitch_data_1
    .packed-switch -0x2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 4
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v2, 0x1

    .line 263
    iget-object v3, p0, Lco/vine/android/UploadsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v3}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 264
    .local v0, cursor:Landroid/database/Cursor;
    check-cast p1, Landroid/widget/ListView;

    .end local p1           #parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v3

    sub-int v3, p3, v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 265
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lco/vine/android/UploadsListFragment;->mPath:Ljava/lang/String;

    .line 266
    const/16 v3, 0x9

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lco/vine/android/UploadsListFragment;->mReference:Ljava/lang/String;

    .line 267
    invoke-static {v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    .line 269
    .local v1, promptDialogFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    invoke-virtual {v1, p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setListener(Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;)V

    .line 270
    const v3, 0x7f0e0090

    invoke-virtual {v1, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 271
    const v3, 0x7f0e01ec

    invoke-virtual {v1, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 272
    const v3, 0x7f0e0052

    invoke-virtual {v1, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 273
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v1, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    .line 276
    .end local v1           #promptDialogFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 7
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    const/4 v6, 0x0

    .line 215
    iget-object v5, p0, Lco/vine/android/UploadsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v5}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 216
    .local v0, cursor:Landroid/database/Cursor;
    invoke-virtual {p1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v5

    sub-int v4, p3, v5

    .line 218
    .local v4, uploadPosition:I
    if-nez v4, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 219
    const v5, 0x7f0a017f

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 220
    .local v1, retry:Landroid/widget/ImageView;
    const/16 v5, 0x8

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 221
    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lco/vine/android/UploadsListFragment;->mRetryView:Ljava/lang/ref/WeakReference;

    .line 223
    const v5, 0x7f0a001d

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    .line 224
    .local v2, spinner:Landroid/widget/ProgressBar;
    invoke-virtual {v2, v6}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 225
    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lco/vine/android/UploadsListFragment;->mSpinnerView:Ljava/lang/ref/WeakReference;

    .line 227
    const v5, 0x7f0a017e

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 228
    .local v3, statusMessage:Landroid/widget/TextView;
    const v5, 0x7f0e01d4

    invoke-virtual {p0, v5}, Lco/vine/android/UploadsListFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lco/vine/android/UploadsListFragment;->mStatusMessage:Ljava/lang/ref/WeakReference;

    .line 231
    invoke-direct {p0, v0, v6}, Lco/vine/android/UploadsListFragment;->handleRetryPost(Landroid/database/Cursor;Z)V

    .line 233
    .end local v1           #retry:Landroid/widget/ImageView;
    .end local v2           #spinner:Landroid/widget/ProgressBar;
    .end local v3           #statusMessage:Landroid/widget/TextView;
    :cond_0
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 2
    .parameter
    .parameter "cursor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    const/4 v1, 0x0

    .line 204
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    .line 205
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lco/vine/android/UploadsListFragment;->hideProgress(I)V

    .line 206
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lco/vine/android/UploadsListFragment;->showSadface(ZZ)V

    .line 211
    :goto_0
    return-void

    .line 209
    :cond_0
    invoke-virtual {p0, v1}, Lco/vine/android/UploadsListFragment;->showSadface(Z)V

    goto :goto_0
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 50
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/UploadsListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 189
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onPause()V

    .line 190
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/UploadsListFragment;->mUploadCompleteReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 192
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 145
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onResume()V

    .line 146
    iget-object v1, p0, Lco/vine/android/UploadsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    if-nez v1, :cond_0

    .line 147
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->initLoader()V

    .line 149
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "co.vine.android.UPLOAD_RESULT"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 150
    .local v0, intentFilter:Landroid/content/IntentFilter;
    invoke-virtual {p0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/UploadsListFragment;->mUploadCompleteReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/app/FragmentActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 151
    return-void
.end method
