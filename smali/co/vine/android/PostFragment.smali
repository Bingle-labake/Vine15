.class public Lco/vine/android/PostFragment;
.super Lco/vine/android/BaseControllerFragment;
.source "PostFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/Filterable;
.implements Lco/vine/android/widget/PopupEditText$PopupEditTextListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/PostFragment$PostSessionListener;
    }
.end annotation


# static fields
.field private static final AG_FROM_SONY:Ljava/lang/String; = "f_s"

.field private static final AG_IS_RETRY:Ljava/lang/String; = "is_retry"

.field private static final AG_PREVIEW_PATH:Ljava/lang/String; = "preview_path"

.field private static final AG_THUMBNAIL_PATH:Ljava/lang/String; = "pic_path"

.field private static final AG_VIDEO_PATH:Ljava/lang/String; = "vid_path"

.field private static final MAX_CHARS:I = 0x78

.field private static final POSTING_DIALOG_DELAY:I = 0x2ee

.field public static final REQUEST_CODE_ADD_TO_CHANNEL:I = 0x3

.field public static final RESULT_FINISH:I = 0x20

.field public static final RESULT_SAVED:I = 0x1f

.field private static final STATE_CHANNEL:Ljava/lang/String; = "channel"

.field private static mToastLengthExceeded:Landroid/widget/Toast;


# instance fields
.field private mAddToChannel:Landroid/view/View;

.field private mAddToChannelIcon:Landroid/widget/ImageView;

.field private mAddToChannelText:Landroid/widget/TextView;

.field private mCaption:Lco/vine/android/widget/PopupEditText;

.field private mChannelId:J

.field private mFilter:Landroid/widget/Filter;

.field private mImagePreview:Landroid/widget/ImageView;

.field private mIsFromSony:Z

.field private mIsRetry:Z

.field private mPostFacebook:Lco/vine/android/views/SwitchInterface;

.field private mPostToFacebookText:Landroid/widget/TextView;

.field private mPostToTwitterText:Landroid/widget/TextView;

.field private mPostTwitter:Lco/vine/android/views/SwitchInterface;

.field private mPostVine:Lco/vine/android/views/SwitchInterface;

.field private mPreviewPath:Ljava/lang/String;

.field private mProgress:Landroid/app/ProgressDialog;

.field private mTagsAdapter:Lco/vine/android/TagsAutoCompleteAdapter;

.field private mTokenizer:Lco/vine/android/ComposeTokenizer;

.field private mTwitter:Lcom/twitter/android/sdk/Twitter;

.field private mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

.field private mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;

.field private mVideoPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lco/vine/android/BaseControllerFragment;-><init>()V

    .line 584
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/PostFragment;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lco/vine/android/PostFragment;->mProgress:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$100(Lco/vine/android/PostFragment;)Lco/vine/android/views/SwitchInterface;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/PostFragment;)Lco/vine/android/views/SwitchInterface;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/PostFragment;)Lco/vine/android/widget/PopupEditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    return-object v0
.end method

.method static synthetic access$400(Lco/vine/android/PostFragment;)Lco/vine/android/UsersAutoCompleteAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 69
    iget-object v0, p0, Lco/vine/android/PostFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;

    return-object v0
.end method

.method private captionLength()I
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v0}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method private insertText(Ljava/lang/String;)V
    .locals 3
    .parameter "toInsert"

    .prologue
    .line 297
    iget-object v2, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    if-eqz v2, :cond_0

    .line 298
    iget-object v2, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->getSelectionStart()I

    move-result v1

    .line 299
    .local v1, selStart:I
    iget-object v2, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->getSelectionEnd()I

    move-result v0

    .line 300
    .local v0, selEnd:I
    iget-object v2, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    if-eqz v2, :cond_0

    if-ltz v1, :cond_0

    iget-object v2, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->length()I

    move-result v2

    if-gt v0, v2, :cond_0

    .line 301
    iget-object v2, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v1, v0, p1}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 304
    .end local v0           #selEnd:I
    .end local v1           #selStart:I
    :cond_0
    return-void
.end method

.method public static prepareArguments(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/os/Bundle;
    .locals 2
    .parameter "intent"
    .parameter "videoPath"
    .parameter "thumbnailPath"
    .parameter "previewPath"
    .parameter "isRetry"

    .prologue
    .line 492
    invoke-static {p0}, Lco/vine/android/BaseControllerFragment;->prepareArguments(Landroid/content/Intent;)Landroid/os/Bundle;

    move-result-object v0

    .line 493
    .local v0, bundle:Landroid/os/Bundle;
    const-string v1, "is_retry"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 494
    const-string v1, "vid_path"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 495
    const-string v1, "pic_path"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 496
    const-string v1, "preview_path"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    return-object v0
.end method

.method private saveToCameraRoll(Ljava/lang/String;)V
    .locals 6
    .parameter "path"

    .prologue
    .line 342
    const-string v3, "Saving to camera roll: {}."

    invoke-static {v3, p1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 343
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 344
    .local v1, actualFile:Ljava/io/File;
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v3, v4, v5}, Lco/vine/android/recorder/RecordConfigUtils;->getCameraRollFile(Landroid/content/Context;J)Ljava/io/File;

    move-result-object v2

    .line 346
    .local v2, finalName:Ljava/io/File;
    if-nez v2, :cond_0

    .line 347
    const-string v3, "Failed to find directory."

    invoke-static {v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 359
    :goto_0
    return-void

    .line 349
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {v1, v2}, Lco/vine/android/recorder/RecordConfigUtils;->copySilently(Ljava/io/File;Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 350
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 351
    .local v0, activity:Landroid/support/v4/app/FragmentActivity;
    if-eqz v0, :cond_1

    .line 352
    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Lco/vine/android/util/MediaUtil;->scanFile(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)V

    .line 354
    :cond_1
    const-string v3, "Renamed to finale position! {}, Scan {}."

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v2, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 356
    .end local v0           #activity:Landroid/support/v4/app/FragmentActivity;
    :cond_2
    const-string v3, "Failed to move {}, file is probably already copied."

    invoke-static {v3, p1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public getFilter()Landroid/widget/Filter;
    .locals 3

    .prologue
    .line 166
    iget-object v2, p0, Lco/vine/android/PostFragment;->mFilter:Landroid/widget/Filter;

    if-nez v2, :cond_0

    .line 167
    iget-object v2, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v0

    .line 168
    .local v0, activeId:J
    new-instance v2, Lco/vine/android/ComposeFilter;

    invoke-direct {v2, p0, v0, v1}, Lco/vine/android/ComposeFilter;-><init>(Lco/vine/android/widget/PopupEditText$PopupEditTextListener;J)V

    iput-object v2, p0, Lco/vine/android/PostFragment;->mFilter:Landroid/widget/Filter;

    .line 170
    .end local v0           #activeId:J
    :cond_0
    iget-object v2, p0, Lco/vine/android/PostFragment;->mFilter:Landroid/widget/Filter;

    return-object v2
.end method

.method public getPopupAdapter()Landroid/support/v4/widget/CursorAdapter;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lco/vine/android/PostFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    .line 312
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 313
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 314
    .local v0, args:Landroid/os/Bundle;
    const-string v6, "pic_path"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 315
    .local v4, thumbnailPath:Ljava/lang/String;
    const-string v6, "vid_path"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lco/vine/android/PostFragment;->mVideoPath:Ljava/lang/String;

    .line 316
    iget-object v6, p0, Lco/vine/android/PostFragment;->mVideoPath:Ljava/lang/String;

    if-nez v6, :cond_0

    .line 317
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "Null video path."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 319
    :cond_0
    const-string v6, "preview_path"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lco/vine/android/PostFragment;->mPreviewPath:Ljava/lang/String;

    .line 320
    const-string v6, "f_s"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, p0, Lco/vine/android/PostFragment;->mIsFromSony:Z

    .line 322
    :try_start_0
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 323
    .local v1, bitmap:Landroid/graphics/Bitmap;
    iget-object v6, p0, Lco/vine/android/PostFragment;->mImagePreview:Landroid/widget/ImageView;

    invoke-virtual {v6, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 329
    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    :goto_0
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    iget-object v7, p0, Lco/vine/android/PostFragment;->mVideoPath:Ljava/lang/String;

    invoke-static {v6, v7}, Lco/vine/android/util/UploadManager;->getUpload(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/api/VineUpload;

    move-result-object v5

    .line 330
    .local v5, upload:Lco/vine/android/api/VineUpload;
    if-eqz v5, :cond_1

    .line 331
    invoke-virtual {v5}, Lco/vine/android/api/VineUpload;->getPostInfo()Lco/vine/android/api/VineUpload$PostInfo;

    move-result-object v3

    .line 332
    .local v3, postInfo:Lco/vine/android/api/VineUpload$PostInfo;
    if-eqz v3, :cond_1

    .line 333
    iget-object v6, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    iget-object v7, v3, Lco/vine/android/api/VineUpload$PostInfo;->caption:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lco/vine/android/widget/PopupEditText;->setText(Ljava/lang/CharSequence;)V

    .line 337
    .end local v3           #postInfo:Lco/vine/android/api/VineUpload$PostInfo;
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    const-string v7, "notification"

    invoke-virtual {v6, v7}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/NotificationManager;

    iget-object v7, p0, Lco/vine/android/PostFragment;->mVideoPath:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    .line 339
    return-void

    .line 324
    .end local v5           #upload:Lco/vine/android/api/VineUpload;
    :catch_0
    move-exception v2

    .line 326
    .local v2, e:Ljava/lang/OutOfMemoryError;
    invoke-static {v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 17
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 502
    packed-switch p1, :pswitch_data_0

    .line 544
    const-string v3, "Facebook auth came back: {}"

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 545
    const/4 v3, -0x1

    move/from16 v0, p2

    if-ne v0, v3, :cond_6

    .line 546
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v14

    .line 547
    .local v14, session:Lcom/facebook/Session;
    if-eqz v14, :cond_5

    .line 548
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    move/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v14, v3, v0, v1, v2}, Lcom/facebook/Session;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 550
    invoke-virtual {v14}, Lcom/facebook/Session;->getPermissions()Ljava/util/List;

    move-result-object v3

    const-string v4, "publish_actions"

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 551
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v14}, Lcom/facebook/Session;->getAccessToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lco/vine/android/client/AppController;->setPendingFacebookToken(Landroid/content/Context;Ljava/lang/String;)V

    .line 553
    new-instance v13, Landroid/app/ProgressDialog;

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const/4 v4, 0x2

    invoke-direct {v13, v3, v4}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 555
    .local v13, d:Landroid/app/ProgressDialog;
    const v3, 0x7f0e00de

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lco/vine/android/PostFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 556
    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 557
    invoke-virtual {v13}, Landroid/app/ProgressDialog;->show()V

    .line 558
    move-object/from16 v0, p0

    iput-object v13, v0, Lco/vine/android/PostFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 559
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->sendFacebookToken()Ljava/lang/String;

    .line 582
    .end local v13           #d:Landroid/app/ProgressDialog;
    .end local v14           #session:Lcom/facebook/Session;
    :cond_0
    :goto_0
    return-void

    .line 504
    :pswitch_0
    const/4 v3, -0x1

    move/from16 v0, p2

    if-ne v0, v3, :cond_1

    .line 505
    const-string v3, "screen_name"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 506
    .local v5, username:Ljava/lang/String;
    const-string v3, "tk"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 507
    .local v6, token:Ljava/lang/String;
    const-string v3, "ts"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 508
    .local v7, secret:Ljava/lang/String;
    const-string v3, "user_id"

    const-wide/16 v15, 0x0

    move-object/from16 v0, p3

    move-wide v1, v15

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    .line 509
    .local v8, userId:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v4

    invoke-virtual/range {v3 .. v9}, Lco/vine/android/client/AppController;->connectTwitter(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    goto :goto_0

    .line 512
    .end local v5           #username:Ljava/lang/String;
    .end local v6           #token:Ljava/lang/String;
    .end local v7           #secret:Ljava/lang/String;
    .end local v8           #userId:J
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    goto :goto_0

    .line 517
    :pswitch_1
    const/4 v3, -0x1

    move/from16 v0, p2

    if-ne v0, v3, :cond_2

    .line 518
    const-string v3, "screen_name"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 520
    .restart local v5       #username:Ljava/lang/String;
    const-string v3, "token"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 521
    .restart local v6       #token:Ljava/lang/String;
    const-string v3, "secret"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 522
    .restart local v7       #secret:Ljava/lang/String;
    const-string v3, "user_id"

    const-wide/16 v15, 0x0

    move-object/from16 v0, p3

    move-wide v1, v15

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    .line 523
    .restart local v8       #userId:J
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v4

    invoke-virtual/range {v3 .. v9}, Lco/vine/android/client/AppController;->connectTwitter(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    goto :goto_0

    .line 526
    .end local v5           #username:Ljava/lang/String;
    .end local v6           #token:Ljava/lang/String;
    .end local v7           #secret:Ljava/lang/String;
    .end local v8           #userId:J
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    goto/16 :goto_0

    .line 531
    :pswitch_2
    const/4 v3, -0x1

    move/from16 v0, p2

    if-ne v0, v3, :cond_0

    .line 532
    const-string v3, "channel_id"

    const-wide/16 v15, -0x1

    move-object/from16 v0, p3

    move-wide v1, v15

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v11

    .line 533
    .local v11, channelId:J
    const-string v3, "channel"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 534
    .local v10, channel:Ljava/lang/String;
    const-wide/16 v3, -0x1

    cmp-long v3, v11, v3

    if-lez v3, :cond_0

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 535
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mAddToChannelText:Landroid/widget/TextView;

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 536
    move-object/from16 v0, p0

    iput-wide v11, v0, Lco/vine/android/PostFragment;->mChannelId:J

    .line 537
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mAddToChannelIcon:Landroid/widget/ImageView;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 538
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " (id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/util/FlurryUtils;->trackChannelChange(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 561
    .end local v10           #channel:Ljava/lang/String;
    .end local v11           #channelId:J
    .restart local v14       #session:Lcom/facebook/Session;
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    new-instance v4, Lco/vine/android/PostFragment$2;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lco/vine/android/PostFragment$2;-><init>(Lco/vine/android/PostFragment;)V

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 567
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Lco/vine/android/client/AppController;->connectToFacebookPublish(Landroid/support/v4/app/Fragment;)V

    goto/16 :goto_0

    .line 570
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    goto/16 :goto_0

    .line 573
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 574
    invoke-super/range {p0 .. p3}, Lco/vine/android/BaseControllerFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto/16 :goto_0

    .line 577
    .end local v14           #session:Lcom/facebook/Session;
    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    goto/16 :goto_0

    .line 502
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 10
    .parameter "compoundButton"
    .parameter "checked"

    .prologue
    const v9, 0x7f090064

    const v8, 0x7f09004b

    const/4 v7, 0x0

    .line 433
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 488
    :cond_0
    :goto_0
    return-void

    .line 435
    :sswitch_0
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v5, p2}, Lco/vine/android/views/SwitchInterface;->setEnabled(Z)V

    .line 436
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v5, p2}, Lco/vine/android/views/SwitchInterface;->setEnabled(Z)V

    .line 437
    if-nez p2, :cond_1

    .line 438
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v5, v7}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 439
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostToTwitterText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 441
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v5, v7}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 442
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostToFacebookText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 445
    :cond_1
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostToTwitterText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 447
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostToFacebookText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 453
    :sswitch_1
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostVine:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v5}, Lco/vine/android/views/SwitchInterface;->isChecked()Z

    move-result v5

    if-nez v5, :cond_3

    .line 454
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v5, v7}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 469
    :cond_2
    :sswitch_2
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostVine:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v5}, Lco/vine/android/views/SwitchInterface;->isChecked()Z

    move-result v5

    if-nez v5, :cond_5

    .line 470
    iget-object v5, p0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v5, v7}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    goto :goto_0

    .line 455
    :cond_3
    if-eqz p2, :cond_2

    .line 456
    iget-object v5, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v5, v6, v7}, Lco/vine/android/client/AppController;->getValidFacebookSession(Landroid/app/Activity;Z)Lcom/facebook/Session;

    move-result-object v3

    .line 458
    .local v3, session:Lcom/facebook/Session;
    if-nez v3, :cond_4

    .line 459
    iget-object v5, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, p0}, Lco/vine/android/client/AppController;->connectToFacebookInitialize(Landroid/support/v4/app/Fragment;)V

    goto/16 :goto_0

    .line 461
    :cond_4
    iget-object v5, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5}, Lco/vine/android/client/AppController;->getPendingFacebookToken()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 462
    iget-object v5, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5}, Lco/vine/android/client/AppController;->sendFacebookToken()Ljava/lang/String;

    goto/16 :goto_0

    .line 471
    .end local v3           #session:Lcom/facebook/Session;
    :cond_5
    if-eqz p2, :cond_0

    .line 472
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 473
    .local v1, activity:Landroid/app/Activity;
    iget-object v5, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v5

    invoke-virtual {v5}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v0

    .line 475
    .local v0, ac:Landroid/accounts/Account;
    invoke-static {v1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 476
    .local v2, am:Landroid/accounts/AccountManager;
    if-eqz v0, :cond_6

    if-nez v2, :cond_7

    .line 477
    :cond_6
    new-instance v5, Lco/vine/android/VineException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Account or AM is null: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 479
    :cond_7
    const-string v5, "account_t_token"

    invoke-virtual {v2, v0, v5}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 480
    .local v4, token:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 481
    iget-object v5, p0, Lco/vine/android/PostFragment;->mTwitter:Lcom/twitter/android/sdk/Twitter;

    invoke-static {v5, v1}, Lco/vine/android/client/AppController;->startTwitterAuthWithFinish(Lcom/twitter/android/sdk/Twitter;Landroid/app/Activity;)V

    goto/16 :goto_0

    .line 433
    :sswitch_data_0
    .sparse-switch
        0x7f0a00ea -> :sswitch_0
        0x7f0a00ee -> :sswitch_2
        0x7f0a00f2 -> :sswitch_1
    .end sparse-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 402
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 413
    :goto_0
    return-void

    .line 404
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lco/vine/android/ChannelsListActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 405
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "selected_channel"

    iget-wide v2, p0, Lco/vine/android/PostFragment;->mChannelId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 406
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 402
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a00e4
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ShowToast"
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 116
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 117
    invoke-virtual {p0, v4}, Lco/vine/android/PostFragment;->setHasOptionsMenu(Z)V

    .line 118
    new-instance v0, Lcom/twitter/android/sdk/Twitter;

    sget-object v1, Lco/vine/android/client/TwitterVineApp;->API_KEY:Ljava/lang/String;

    sget-object v2, Lco/vine/android/client/TwitterVineApp;->API_SECRET:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/twitter/android/sdk/Twitter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lco/vine/android/PostFragment;->mTwitter:Lcom/twitter/android/sdk/Twitter;

    .line 119
    new-instance v0, Lco/vine/android/PostFragment$PostSessionListener;

    invoke-direct {v0, p0}, Lco/vine/android/PostFragment$PostSessionListener;-><init>(Lco/vine/android/PostFragment;)V

    iput-object v0, p0, Lco/vine/android/PostFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 120
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "is_retry"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/PostFragment;->mIsRetry:Z

    .line 121
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0e0053

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    sput-object v0, Lco/vine/android/PostFragment;->mToastLengthExceeded:Landroid/widget/Toast;

    .line 123
    sget-object v0, Lco/vine/android/PostFragment;->mToastLengthExceeded:Landroid/widget/Toast;

    const/16 v1, 0x11

    invoke-virtual {v0, v1, v3, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 125
    if-nez p1, :cond_0

    .line 126
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lco/vine/android/PostFragment;->mChannelId:J

    .line 131
    :goto_0
    new-instance v0, Lco/vine/android/UsersAutoCompleteAdapter;

    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-direct {v0, v1, v2}, Lco/vine/android/UsersAutoCompleteAdapter;-><init>(Landroid/app/Activity;Lco/vine/android/client/AppController;)V

    iput-object v0, p0, Lco/vine/android/PostFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;

    .line 132
    new-instance v0, Lco/vine/android/TagsAutoCompleteAdapter;

    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-direct {v0, v1, v2}, Lco/vine/android/TagsAutoCompleteAdapter;-><init>(Landroid/app/Activity;Lco/vine/android/client/AppController;)V

    iput-object v0, p0, Lco/vine/android/PostFragment;->mTagsAdapter:Lco/vine/android/TagsAutoCompleteAdapter;

    .line 133
    iget-object v0, p0, Lco/vine/android/PostFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;

    iput-object v0, p0, Lco/vine/android/PostFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 134
    return-void

    .line 128
    :cond_0
    const-string v0, "channel"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/PostFragment;->mChannelId:J

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 397
    const v0, 0x7f10000e

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 398
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 364
    const v3, 0x7f03004c

    invoke-virtual {p1, v3, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 365
    .local v2, v:Landroid/view/View;
    const v3, 0x7f0a00e4

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 366
    .local v0, addToChannel:Landroid/view/View;
    const v3, 0x7f0a00e5

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lco/vine/android/PostFragment;->mAddToChannelIcon:Landroid/widget/ImageView;

    .line 367
    const v3, 0x7f0a00e6

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lco/vine/android/PostFragment;->mAddToChannelText:Landroid/widget/TextView;

    .line 368
    iput-object v0, p0, Lco/vine/android/PostFragment;->mAddToChannel:Landroid/view/View;

    .line 370
    const v3, 0x7f0a00ea

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lco/vine/android/views/SwitchInterface;

    iput-object v3, p0, Lco/vine/android/PostFragment;->mPostVine:Lco/vine/android/views/SwitchInterface;

    .line 371
    const v3, 0x7f0a00ee

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lco/vine/android/views/SwitchInterface;

    iput-object v3, p0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    .line 372
    const v3, 0x7f0a00f2

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lco/vine/android/views/SwitchInterface;

    iput-object v3, p0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    .line 373
    const v3, 0x7f0a00e1

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lco/vine/android/PostFragment;->mImagePreview:Landroid/widget/ImageView;

    .line 374
    const v3, 0x7f0a00e2

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lco/vine/android/widget/PopupEditText;

    .line 375
    .local v1, edit:Lco/vine/android/widget/PopupEditText;
    iget-object v3, p0, Lco/vine/android/PostFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;

    invoke-virtual {v1, v3}, Lco/vine/android/widget/PopupEditText;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 376
    new-instance v3, Lco/vine/android/ComposeTokenizer;

    invoke-direct {v3, p0}, Lco/vine/android/ComposeTokenizer;-><init>(Lco/vine/android/widget/PopupEditText$PopupEditTextListener;)V

    iput-object v3, p0, Lco/vine/android/PostFragment;->mTokenizer:Lco/vine/android/ComposeTokenizer;

    .line 377
    iget-object v3, p0, Lco/vine/android/PostFragment;->mTokenizer:Lco/vine/android/ComposeTokenizer;

    iget-object v4, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->getTypeaheadThrottle()J

    move-result-wide v4

    invoke-virtual {v1, v3, p0, v4, v5}, Lco/vine/android/widget/PopupEditText;->setTokenizer(Landroid/widget/MultiAutoCompleteTextView$Tokenizer;Landroid/widget/Filterable;J)V

    .line 378
    invoke-virtual {v1, p0}, Lco/vine/android/widget/PopupEditText;->setPopupEditTextListener(Lco/vine/android/widget/PopupEditText$PopupEditTextListener;)V

    .line 379
    iput-object v1, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    .line 380
    const v3, 0x7f0a00ed

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lco/vine/android/PostFragment;->mPostToTwitterText:Landroid/widget/TextView;

    .line 381
    const v3, 0x7f0a00f1

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lco/vine/android/PostFragment;->mPostToFacebookText:Landroid/widget/TextView;

    .line 383
    iget-object v3, p0, Lco/vine/android/PostFragment;->mAddToChannel:Landroid/view/View;

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 384
    iget-object v3, p0, Lco/vine/android/PostFragment;->mAddToChannel:Landroid/view/View;

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 385
    iget-object v3, p0, Lco/vine/android/PostFragment;->mPostVine:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v3, v7}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 386
    iget-object v3, p0, Lco/vine/android/PostFragment;->mPostVine:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v3, v7}, Lco/vine/android/views/SwitchInterface;->setEnabled(Z)V

    .line 387
    iget-object v3, p0, Lco/vine/android/PostFragment;->mPostVine:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v3, p0}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 388
    iget-object v3, p0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v3, v6}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 389
    iget-object v3, p0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v3, p0}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 390
    iget-object v3, p0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v3, v6}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 391
    iget-object v3, p0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v3, p0}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 392
    return-object v2
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 144
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onDestroy()V

    .line 145
    invoke-static {}, Lco/vine/android/provider/VineSuggestionsProvider;->clearRealtimeUserSuggestions()V

    .line 146
    invoke-static {}, Lco/vine/android/provider/VineSuggestionsProvider;->clearRealtimeTagSuggestions()V

    .line 147
    return-void
.end method

.method public onFiltering(Ljava/lang/CharSequence;)V
    .locals 7
    .parameter "constraint"

    .prologue
    const/4 v5, 0x0

    const/4 v0, 0x1

    .line 183
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 185
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 187
    .local v3, selection:Ljava/lang/String;
    const-string v6, "@"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 188
    const-string v4, "mention"

    .line 189
    .local v4, type:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 197
    .local v2, query:Ljava/lang/String;
    :goto_0
    iget-object v6, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v6, v4}, Lco/vine/android/client/AppController;->getTypeaheadFetchThreshold(Ljava/lang/String;)I

    move-result v1

    .line 199
    .local v1, fetchThreshold:I
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-lt v6, v1, :cond_0

    .line 201
    const-string v6, "mention"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 202
    invoke-static {v2}, Lco/vine/android/provider/VineSuggestionsProvider;->getRealtimeUserSuggestions(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    if-nez v6, :cond_3

    .line 209
    .local v0, fetch:Z
    :goto_1
    if-eqz v0, :cond_0

    .line 210
    const-string v5, "mention"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 211
    iget-object v5, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v2}, Lco/vine/android/client/AppController;->fetchUserTypeahead(Ljava/lang/String;)Ljava/lang/String;

    .line 218
    .end local v0           #fetch:Z
    .end local v1           #fetchThreshold:I
    .end local v2           #query:Ljava/lang/String;
    .end local v3           #selection:Ljava/lang/String;
    .end local v4           #type:Ljava/lang/String;
    :cond_0
    :goto_2
    return-void

    .line 190
    .restart local v3       #selection:Ljava/lang/String;
    :cond_1
    const-string v6, "#"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 191
    const-string v4, "tag"

    .line 192
    .restart local v4       #type:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #query:Ljava/lang/String;
    goto :goto_0

    .line 194
    .end local v2           #query:Ljava/lang/String;
    .end local v4           #type:Ljava/lang/String;
    :cond_2
    const/4 v4, 0x0

    .line 195
    .restart local v4       #type:Ljava/lang/String;
    const/4 v2, 0x0

    .restart local v2       #query:Ljava/lang/String;
    goto :goto_0

    .restart local v1       #fetchThreshold:I
    :cond_3
    move v0, v5

    .line 202
    goto :goto_1

    .line 203
    :cond_4
    const-string v6, "tag"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 204
    invoke-static {v2}, Lco/vine/android/provider/VineSuggestionsProvider;->getRealtimeTagSuggestions(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    if-nez v6, :cond_5

    .restart local v0       #fetch:Z
    :goto_3
    goto :goto_1

    .end local v0           #fetch:Z
    :cond_5
    move v0, v5

    goto :goto_3

    .line 206
    :cond_6
    const/4 v0, 0x0

    .restart local v0       #fetch:Z
    goto :goto_1

    .line 212
    :cond_7
    const-string v5, "tag"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 213
    iget-object v5, p0, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v2}, Lco/vine/android/client/AppController;->fetchTagTypeahead(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_2
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 3
    .parameter "view"

    .prologue
    const/4 v0, 0x0

    .line 417
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 426
    :goto_0
    return v0

    .line 419
    :pswitch_0
    iget-object v1, p0, Lco/vine/android/PostFragment;->mAddToChannelText:Landroid/widget/TextView;

    const v2, 0x7f0e0041

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 420
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lco/vine/android/PostFragment;->mChannelId:J

    .line 421
    iget-object v1, p0, Lco/vine/android/PostFragment;->mAddToChannelIcon:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 422
    const-string v0, "Channel removed"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils;->trackChannelChange(Ljava/lang/String;)V

    .line 423
    const/4 v0, 0x1

    goto :goto_0

    .line 417
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a00e4
        :pswitch_0
    .end packed-switch
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 14
    .parameter "item"

    .prologue
    .line 222
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 290
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    .line 293
    :goto_0
    return v1

    .line 224
    :sswitch_0
    invoke-direct {p0}, Lco/vine/android/PostFragment;->captionLength()I

    move-result v1

    const/16 v2, 0x78

    if-gt v1, v2, :cond_7

    .line 225
    iget-object v1, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v1}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v13

    .line 226
    .local v13, text:Landroid/text/Editable;
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 227
    .local v0, activity:Landroid/app/Activity;
    iget-object v1, p0, Lco/vine/android/PostFragment;->mPreviewPath:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lco/vine/android/PostFragment;->mPreviewPath:Ljava/lang/String;

    :goto_1
    invoke-direct {p0, v1}, Lco/vine/android/PostFragment;->saveToCameraRoll(Ljava/lang/String;)V

    .line 228
    iget-object v1, p0, Lco/vine/android/PostFragment;->mPostVine:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v1}, Lco/vine/android/views/SwitchInterface;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 229
    iget-object v1, p0, Lco/vine/android/PostFragment;->mVideoPath:Ljava/lang/String;

    if-eqz v13, :cond_3

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_2
    iget-object v3, p0, Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v3}, Lco/vine/android/views/SwitchInterface;->isChecked()Z

    move-result v3

    iget-object v4, p0, Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v4}, Lco/vine/android/views/SwitchInterface;->isChecked()Z

    move-result v4

    iget-wide v5, p0, Lco/vine/android/PostFragment;->mChannelId:J

    iget-boolean v7, p0, Lco/vine/android/PostFragment;->mIsRetry:Z

    iget-object v8, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v8}, Lco/vine/android/widget/PopupEditText;->getEntities()Ljava/util/ArrayList;

    move-result-object v8

    const/4 v9, 0x0

    invoke-static/range {v0 .. v9}, Lco/vine/android/service/VineUploadService;->getPostIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZJZLjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 233
    invoke-static {v0}, Lco/vine/android/service/VineUploadService;->getShowProgressIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 238
    :goto_3
    iget-object v1, p0, Lco/vine/android/PostFragment;->mPostVine:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v1}, Lco/vine/android/views/SwitchInterface;->isChecked()Z

    move-result v1

    invoke-static {v1}, Lco/vine/android/util/FlurryUtils;->trackPost(Z)V

    .line 240
    const/16 v1, 0x1f

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 242
    :try_start_0
    iget-object v1, p0, Lco/vine/android/PostFragment;->mPostVine:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v1}, Lco/vine/android/views/SwitchInterface;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 243
    iget-object v1, p0, Lco/vine/android/PostFragment;->mPreviewPath:Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 244
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lco/vine/android/PostFragment;->mPreviewPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    const-string v2, "Session Completed."

    invoke-static {v1, v2}, Lco/vine/android/recorder/RecordSessionManager;->deleteSession(Ljava/io/File;Ljava/lang/String;)V

    .line 252
    :cond_0
    :goto_4
    const-string v1, "Session folder deleted: {}."

    iget-object v2, p0, Lco/vine/android/PostFragment;->mPreviewPath:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    :cond_1
    :goto_5
    iget-boolean v1, p0, Lco/vine/android/PostFragment;->mIsFromSony:Z

    if-eqz v1, :cond_6

    .line 258
    new-instance v1, Landroid/app/ProgressDialog;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lco/vine/android/PostFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 259
    iget-object v1, p0, Lco/vine/android/PostFragment;->mProgress:Landroid/app/ProgressDialog;

    const v2, 0x7f0e0196

    invoke-virtual {p0, v2}, Lco/vine/android/PostFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 260
    iget-object v1, p0, Lco/vine/android/PostFragment;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 261
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lco/vine/android/PostFragment$1;

    invoke-direct {v2, p0, v0}, Lco/vine/android/PostFragment$1;-><init>(Lco/vine/android/PostFragment;Landroid/app/Activity;)V

    const-wide/16 v3, 0x2ee

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 275
    :goto_6
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 227
    :cond_2
    iget-object v1, p0, Lco/vine/android/PostFragment;->mVideoPath:Ljava/lang/String;

    goto/16 :goto_1

    .line 229
    :cond_3
    const-string v2, ""

    goto/16 :goto_2

    .line 235
    :cond_4
    iget-object v1, p0, Lco/vine/android/PostFragment;->mVideoPath:Ljava/lang/String;

    invoke-static {v0, v1}, Lco/vine/android/service/VineUploadService;->getDiscardIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_3

    .line 246
    :cond_5
    :try_start_1
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lco/vine/android/PostFragment;->mVideoPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    .line 247
    .local v12, parentName:Ljava/lang/String;
    invoke-virtual {p0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/recorder/RecordSessionManager;->getInstance(Landroid/content/Context;)Lco/vine/android/recorder/RecordSessionManager;

    move-result-object v1

    invoke-virtual {v1, v12}, Lco/vine/android/recorder/RecordSessionManager;->getFolderFromName(Ljava/lang/String;)Ljava/io/File;

    move-result-object v11

    .line 248
    .local v11, parentFolder:Ljava/io/File;
    if-eqz v11, :cond_0

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 249
    const-string v1, "Done with session."

    invoke-static {v11, v1}, Lco/vine/android/recorder/RecordSessionManager;->deleteSession(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    .line 254
    .end local v11           #parentFolder:Ljava/io/File;
    .end local v12           #parentName:Ljava/lang/String;
    :catch_0
    move-exception v10

    .line 255
    .local v10, e:Ljava/io/IOException;
    const-string v1, "Failed to delete session folder."

    invoke-static {v1, v10}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 271
    .end local v10           #e:Ljava/io/IOException;
    :cond_6
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/HomeTabActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x400

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 273
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_6

    .line 277
    .end local v0           #activity:Landroid/app/Activity;
    .end local v13           #text:Landroid/text/Editable;
    :cond_7
    sget-object v1, Lco/vine/android/PostFragment;->mToastLengthExceeded:Landroid/widget/Toast;

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 293
    :goto_7
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 282
    :sswitch_1
    const-string v1, "@"

    invoke-direct {p0, v1}, Lco/vine/android/PostFragment;->insertText(Ljava/lang/String;)V

    goto :goto_7

    .line 286
    :sswitch_2
    const-string v1, "#"

    invoke-direct {p0, v1}, Lco/vine/android/PostFragment;->insertText(Ljava/lang/String;)V

    goto :goto_7

    .line 222
    :sswitch_data_0
    .sparse-switch
        0x7f0a018b -> :sswitch_1
        0x7f0a018c -> :sswitch_2
        0x7f0a0199 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPopupItemSelected(IILjava/lang/CharSequence;J)V
    .locals 0
    .parameter "tokenStart"
    .parameter "tokenEnd"
    .parameter "selection"
    .parameter "userId"

    .prologue
    .line 175
    return-void
.end method

.method public onPopupShown()V
    .locals 0

    .prologue
    .line 179
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .parameter "outState"

    .prologue
    .line 138
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 139
    const-string v0, "channel"

    iget-wide v1, p0, Lco/vine/android/PostFragment;->mChannelId:J

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 140
    return-void
.end method

.method public setPopupAdapter(Ljava/lang/String;)V
    .locals 2
    .parameter "type"

    .prologue
    .line 156
    const-string v0, "users_adapter"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 157
    iget-object v0, p0, Lco/vine/android/PostFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;

    iput-object v0, p0, Lco/vine/android/PostFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 161
    :cond_0
    :goto_0
    iget-object v0, p0, Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;

    iget-object v1, p0, Lco/vine/android/PostFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0, v1}, Lco/vine/android/widget/PopupEditText;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 162
    return-void

    .line 158
    :cond_1
    const-string v0, "tags_adapter"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lco/vine/android/PostFragment;->mTagsAdapter:Lco/vine/android/TagsAutoCompleteAdapter;

    iput-object v0, p0, Lco/vine/android/PostFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    goto :goto_0
.end method
