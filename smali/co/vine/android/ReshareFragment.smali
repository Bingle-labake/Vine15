.class public Lco/vine/android/ReshareFragment;
.super Lco/vine/android/BaseControllerFragment;
.source "ReshareFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/ReshareFragment$ReshareListener;
    }
.end annotation


# static fields
.field public static final ARG_DESCRIPTION:Ljava/lang/String; = "description"

.field public static final ARG_NETWORK:Ljava/lang/String; = "network"

.field public static final ARG_POST_ID:Ljava/lang/String; = "post_id"

.field public static final ARG_SHARE_URL:Ljava/lang/String; = "share_url"

.field public static final ARG_THUMBNAIL_URL:Ljava/lang/String; = "thumbnail_url"

.field public static final FRAGMENT_TAG:Ljava/lang/String; = "reshare"

.field private static final MAX_CHARS_TWITTER:I = 0x8c

.field public static final NETWORK_FACEBOOK:Ljava/lang/String; = "facebook"

.field public static final NETWORK_TWITTER:Ljava/lang/String; = "twitter"


# instance fields
.field private mCaption:Landroid/widget/EditText;

.field private mDescription:Ljava/lang/String;

.field private mNetwork:Ljava/lang/String;

.field private mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

.field private mPostId:J

.field private mProgress:Landroid/app/ProgressDialog;

.field private mShareProgress:Landroid/app/ProgressDialog;

.field private mShareUrl:Ljava/lang/String;

.field private mThumbnailKey:Lco/vine/android/util/image/ImageKey;

.field private mThumbnailUrl:Ljava/lang/String;

.field private mThumbnailView:Landroid/widget/ImageView;

.field private mTwitter:Lcom/twitter/android/sdk/Twitter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lco/vine/android/BaseControllerFragment;-><init>()V

    .line 324
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/ReshareFragment;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mShareProgress:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$100(Lco/vine/android/ReshareFragment;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/ReshareFragment;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mProgress:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/ReshareFragment;)Lco/vine/android/util/image/ImageKey;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mThumbnailKey:Lco/vine/android/util/image/ImageKey;

    return-object v0
.end method

.method static synthetic access$400(Lco/vine/android/ReshareFragment;Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lco/vine/android/ReshareFragment;->setThumbnailImage(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$502(Lco/vine/android/ReshareFragment;Lco/vine/android/PendingCaptchaRequest;)Lco/vine/android/PendingCaptchaRequest;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 44
    iput-object p1, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    return-object p1
.end method

.method private handlePendingCaptchaRequest()V
    .locals 4

    .prologue
    .line 404
    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    if-eqz v1, :cond_1

    .line 405
    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v1, v1, Lco/vine/android/PendingCaptchaRequest;->state:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 407
    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v2, v2, Lco/vine/android/PendingCaptchaRequest;->actionCode:I

    iget-object v3, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v3, v3, Lco/vine/android/PendingCaptchaRequest;->bundle:Landroid/os/Bundle;

    invoke-virtual {v1, v2, v3}, Lco/vine/android/client/AppController;->retryRequest(ILandroid/os/Bundle;)Ljava/lang/String;

    .line 415
    :cond_0
    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    .line 417
    :cond_1
    return-void

    .line 409
    :cond_2
    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v1, v1, Lco/vine/android/PendingCaptchaRequest;->state:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 411
    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->generateReqIdForCanceledCaptcha()Ljava/lang/String;

    move-result-object v0

    .line 412
    .local v0, newRequestToFail:Ljava/lang/String;
    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v2, v2, Lco/vine/android/PendingCaptchaRequest;->actionCode:I

    iget-object v3, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v3, v3, Lco/vine/android/PendingCaptchaRequest;->bundle:Landroid/os/Bundle;

    invoke-virtual {v1, v0, v2, v3}, Lco/vine/android/client/AppController;->failRequest(Ljava/lang/String;ILandroid/os/Bundle;)V

    goto :goto_0
.end method

.method private setThumbnailImage(Landroid/graphics/Bitmap;)V
    .locals 3
    .parameter "bitmap"

    .prologue
    .line 316
    if-eqz p1, :cond_0

    .line 317
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mThumbnailView:Landroid/widget/ImageView;

    new-instance v1, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v2, p0, Lco/vine/android/ReshareFragment;->mThumbnailView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 322
    :goto_0
    return-void

    .line 319
    :cond_0
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mThumbnailView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 320
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mThumbnailView:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090065

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    goto :goto_0
.end method

.method private validateSocialConnect()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 101
    const-string v1, "facebook"

    iget-object v2, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 102
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->isConnectedToFacebook(Landroid/app/Activity;)Z

    move-result v0

    .line 108
    :cond_0
    :goto_0
    return v0

    .line 103
    :cond_1
    const-string v1, "twitter"

    iget-object v2, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 106
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "settings_twitter_connected"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const/4 v8, 0x0

    .line 122
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 125
    const-string v5, "facebook"

    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 126
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v5, v6, v8}, Lco/vine/android/client/AppController;->getValidFacebookSession(Landroid/app/Activity;Z)Lcom/facebook/Session;

    move-result-object v3

    .line 127
    .local v3, session:Lcom/facebook/Session;
    if-nez v3, :cond_3

    .line 128
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, p0}, Lco/vine/android/client/AppController;->connectToFacebookInitialize(Landroid/support/v4/app/Fragment;)V

    .line 150
    .end local v3           #session:Lcom/facebook/Session;
    :cond_0
    :goto_0
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mCaption:Landroid/widget/EditText;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setLines(I)V

    .line 151
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mCaption:Landroid/widget/EditText;

    invoke-virtual {v5, v8}, Landroid/widget/EditText;->setHorizontallyScrolling(Z)V

    .line 153
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mThumbnailUrl:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 154
    new-instance v5, Lco/vine/android/util/image/ImageKey;

    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mThumbnailUrl:Ljava/lang/String;

    invoke-direct {v5, v6}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    iput-object v5, p0, Lco/vine/android/ReshareFragment;->mThumbnailKey:Lco/vine/android/util/image/ImageKey;

    .line 155
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mThumbnailKey:Lco/vine/android/util/image/ImageKey;

    invoke-virtual {v5, v6}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-direct {p0, v5}, Lco/vine/android/ReshareFragment;->setThumbnailImage(Landroid/graphics/Bitmap;)V

    .line 157
    :cond_1
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mDescription:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 158
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mCaption:Landroid/widget/EditText;

    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mDescription:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 160
    :cond_2
    return-void

    .line 130
    .restart local v3       #session:Lcom/facebook/Session;
    :cond_3
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5}, Lco/vine/android/client/AppController;->getPendingFacebookToken()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 131
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5}, Lco/vine/android/client/AppController;->sendFacebookToken()Ljava/lang/String;

    goto :goto_0

    .line 134
    .end local v3           #session:Lcom/facebook/Session;
    :cond_4
    const-string v5, "twitter"

    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 135
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 136
    .local v1, activity:Landroid/app/Activity;
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v5

    invoke-virtual {v5}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v0

    .line 138
    .local v0, ac:Landroid/accounts/Account;
    invoke-static {v1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 139
    .local v2, am:Landroid/accounts/AccountManager;
    if-eqz v0, :cond_5

    if-nez v2, :cond_6

    .line 140
    :cond_5
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

    .line 142
    :cond_6
    const-string v5, "account_t_token"

    invoke-virtual {v2, v0, v5}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 143
    .local v4, token:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 144
    iget-object v5, p0, Lco/vine/android/ReshareFragment;->mTwitter:Lcom/twitter/android/sdk/Twitter;

    invoke-static {v5, v1}, Lco/vine/android/client/AppController;->startTwitterAuthWithFinish(Lcom/twitter/android/sdk/Twitter;Landroid/app/Activity;)V

    goto/16 :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 12
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 228
    if-nez p2, :cond_1

    .line 229
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 313
    :cond_0
    :goto_0
    return-void

    .line 233
    :cond_1
    const/16 v0, 0xb

    if-eq p1, v0, :cond_3

    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mProgress:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_3

    .line 235
    :cond_2
    new-instance v7, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0f0028

    invoke-direct {v7, v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 237
    .local v7, d:Landroid/app/ProgressDialog;
    const v0, 0x7f0e00de

    invoke-virtual {p0, v0}, Lco/vine/android/ReshareFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 238
    const/4 v0, 0x0

    invoke-virtual {v7, v0}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 239
    invoke-virtual {v7}, Landroid/app/ProgressDialog;->show()V

    .line 240
    iput-object v7, p0, Lco/vine/android/ReshareFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 243
    .end local v7           #d:Landroid/app/ProgressDialog;
    :cond_3
    sparse-switch p1, :sswitch_data_0

    .line 286
    :cond_4
    const-string v0, "Facebook auth came back: {}"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 287
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 288
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v9

    .line 289
    .local v9, session:Lcom/facebook/Session;
    if-eqz v9, :cond_8

    .line 290
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v9, v0, p1, p2, p3}, Lcom/facebook/Session;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 292
    invoke-virtual {v9}, Lcom/facebook/Session;->getPermissions()Ljava/util/List;

    move-result-object v0

    const-string v1, "publish_actions"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 293
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v9}, Lcom/facebook/Session;->getAccessToken()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/vine/android/client/AppController;->setPendingFacebookToken(Landroid/content/Context;Ljava/lang/String;)V

    .line 295
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->sendFacebookToken()Ljava/lang/String;

    goto :goto_0

    .line 245
    .end local v9           #session:Lcom/facebook/Session;
    :sswitch_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 246
    const-string v0, "screen_name"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 247
    .local v2, username:Ljava/lang/String;
    const-string v0, "tk"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 248
    .local v3, token:Ljava/lang/String;
    const-string v0, "ts"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 249
    .local v4, secret:Ljava/lang/String;
    const-string v0, "user_id"

    const-wide/16 v10, 0x0

    invoke-virtual {p3, v0, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v5

    .line 250
    .local v5, userId:J
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->connectTwitter(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    goto/16 :goto_0

    .line 256
    .end local v2           #username:Ljava/lang/String;
    .end local v3           #token:Ljava/lang/String;
    .end local v4           #secret:Ljava/lang/String;
    .end local v5           #userId:J
    :sswitch_1
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 257
    const-string v0, "screen_name"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 259
    .restart local v2       #username:Ljava/lang/String;
    const-string v0, "token"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 260
    .restart local v3       #token:Ljava/lang/String;
    const-string v0, "secret"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 261
    .restart local v4       #secret:Ljava/lang/String;
    const-string v0, "user_id"

    const-wide/16 v10, 0x0

    invoke-virtual {p3, v0, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v5

    .line 262
    .restart local v5       #userId:J
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->connectTwitter(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    goto/16 :goto_0

    .line 268
    .end local v2           #username:Ljava/lang/String;
    .end local v3           #token:Ljava/lang/String;
    .end local v4           #secret:Ljava/lang/String;
    .end local v5           #userId:J
    :sswitch_2
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    if-eqz v0, :cond_4

    if-eqz p3, :cond_4

    .line 269
    const-string v0, "rid"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 270
    .local v8, reqId:Ljava/lang/String;
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mShareProgress:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mShareProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 271
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mShareProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->hide()V

    .line 273
    :cond_5
    const/4 v0, -0x1

    if-ne p2, v0, :cond_6

    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v0, v0, Lco/vine/android/PendingCaptchaRequest;->reqId:Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 275
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    const/4 v1, 0x2

    iput v1, v0, Lco/vine/android/PendingCaptchaRequest;->state:I

    goto/16 :goto_0

    .line 277
    :cond_6
    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v0, v0, Lco/vine/android/PendingCaptchaRequest;->reqId:Ljava/lang/String;

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 279
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    const/4 v1, 0x3

    iput v1, v0, Lco/vine/android/PendingCaptchaRequest;->state:I

    goto/16 :goto_0

    .line 297
    .end local v8           #reqId:Ljava/lang/String;
    .restart local v9       #session:Lcom/facebook/Session;
    :cond_7
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lco/vine/android/ReshareFragment$1;

    invoke-direct {v1, p0}, Lco/vine/android/ReshareFragment$1;-><init>(Lco/vine/android/ReshareFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 303
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0, p0}, Lco/vine/android/client/AppController;->connectToFacebookPublish(Landroid/support/v4/app/Fragment;)V

    goto/16 :goto_0

    .line 307
    :cond_8
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseControllerFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto/16 :goto_0

    .line 243
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0xb -> :sswitch_2
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 76
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 77
    new-instance v1, Lco/vine/android/ReshareFragment$ReshareListener;

    invoke-direct {v1, p0}, Lco/vine/android/ReshareFragment$ReshareListener;-><init>(Lco/vine/android/ReshareFragment;)V

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 79
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 80
    .local v0, args:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/ReshareFragment;->mPostId:J

    .line 81
    const-string v1, "description"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mDescription:Ljava/lang/String;

    .line 82
    const-string v1, "network"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    .line 83
    const-string v1, "share_url"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mShareUrl:Ljava/lang/String;

    .line 84
    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mShareUrl:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 85
    const-string v1, ""

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mShareUrl:Ljava/lang/String;

    .line 87
    :cond_0
    const-string v1, "thumbnail_url"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mThumbnailUrl:Ljava/lang/String;

    .line 88
    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mThumbnailUrl:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 89
    const-string v1, ""

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mThumbnailUrl:Ljava/lang/String;

    .line 91
    :cond_1
    new-instance v1, Lcom/twitter/android/sdk/Twitter;

    sget-object v2, Lco/vine/android/client/TwitterVineApp;->API_KEY:Ljava/lang/String;

    sget-object v3, Lco/vine/android/client/TwitterVineApp;->API_SECRET:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/twitter/android/sdk/Twitter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mTwitter:Lcom/twitter/android/sdk/Twitter;

    .line 93
    if-eqz p1, :cond_2

    .line 94
    const-string v1, "state_pending_captcha_request"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lco/vine/android/PendingCaptchaRequest;

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    .line 97
    :cond_2
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lco/vine/android/ReshareFragment;->setHasOptionsMenu(Z)V

    .line 98
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 173
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->isDetached()Z

    move-result v1

    if-nez v1, :cond_1

    .line 174
    const v1, 0x7f10000c

    invoke-virtual {p2, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 175
    const v1, 0x7f0a018d

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 177
    .local v0, menuItem:Landroid/view/MenuItem;
    :try_start_0
    const-string v1, "facebook"

    iget-object v2, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 178
    const v1, 0x7f0e018d

    invoke-virtual {p0, v1}, Lco/vine/android/ReshareFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 182
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseControllerFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 188
    .end local v0           #menuItem:Landroid/view/MenuItem;
    :cond_1
    :goto_1
    return-void

    .line 179
    .restart local v0       #menuItem:Landroid/view/MenuItem;
    :cond_2
    const-string v1, "twitter"

    iget-object v2, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 180
    const v1, 0x7f0e018e

    invoke-virtual {p0, v1}, Lco/vine/android/ReshareFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 183
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 165
    const v1, 0x7f030059

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 166
    .local v0, v:Landroid/view/View;
    const v1, 0x7f0a00e2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mCaption:Landroid/widget/EditText;

    .line 167
    const v1, 0x7f0a0143

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mThumbnailView:Landroid/widget/ImageView;

    .line 168
    return-object v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 11
    .parameter "item"

    .prologue
    const/4 v5, 0x1

    const/4 v10, 0x0

    .line 192
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    packed-switch v6, :pswitch_data_0

    .line 221
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v5

    :goto_0
    return v5

    .line 195
    :pswitch_0
    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mShareUrl:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    rsub-int v6, v6, 0x8c

    add-int/lit8 v0, v6, -0x1

    .line 196
    .local v0, characterLimit:I
    const-string v6, "twitter"

    iget-object v7, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mCaption:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->length()I

    move-result v6

    if-le v6, v0, :cond_0

    .line 197
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    const v7, 0x7f0e0143

    new-array v8, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-virtual {p0, v7, v8}, Lco/vine/android/ReshareFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 199
    :cond_0
    invoke-direct {p0}, Lco/vine/android/ReshareFragment;->validateSocialConnect()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 200
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    const-string v7, "input_method"

    invoke-virtual {v6, v7}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    .line 202
    .local v2, imm:Landroid/view/inputmethod/InputMethodManager;
    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mCaption:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v6

    invoke-virtual {v2, v6, v10}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 204
    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mCaption:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 205
    .local v3, message:Ljava/lang/String;
    iget-object v6, p0, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v7, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    iget-wide v8, p0, Lco/vine/android/ReshareFragment;->mPostId:J

    invoke-virtual {v6, v7, v3, v8, v9}, Lco/vine/android/client/AppController;->sharePost(Ljava/lang/String;Ljava/lang/String;J)V

    .line 206
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    const v7, 0x7f0f0028

    invoke-direct {v1, v6, v7}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 208
    .local v1, d:Landroid/app/ProgressDialog;
    const v6, 0x7f0e019f

    invoke-virtual {p0, v6}, Lco/vine/android/ReshareFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 209
    invoke-virtual {v1, v10}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 210
    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 211
    iput-object v1, p0, Lco/vine/android/ReshareFragment;->mShareProgress:Landroid/app/ProgressDialog;

    goto/16 :goto_0

    .line 213
    .end local v1           #d:Landroid/app/ProgressDialog;
    .end local v2           #imm:Landroid/view/inputmethod/InputMethodManager;
    .end local v3           #message:Ljava/lang/String;
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    invoke-virtual {v7, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 214
    .local v4, properNetwork:Ljava/lang/String;
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    const v7, 0x7f0e0191

    new-array v8, v5, [Ljava/lang/Object;

    aput-object v4, v8, v10

    invoke-virtual {p0, v7, v8}, Lco/vine/android/ReshareFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 216
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto/16 :goto_0

    .line 192
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a018d
        :pswitch_0
    .end packed-switch
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 113
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onResume()V

    .line 114
    iget-object v0, p0, Lco/vine/android/ReshareFragment;->mCaption:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 115
    invoke-virtual {p0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mCaption:Landroid/widget/EditText;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lco/vine/android/util/Util;->setSoftInputVisibility(Landroid/content/Context;Landroid/view/View;Z)V

    .line 117
    :cond_0
    invoke-direct {p0}, Lco/vine/android/ReshareFragment;->handlePendingCaptchaRequest()V

    .line 118
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 399
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 400
    const-string v0, "state_pending_captcha_request"

    iget-object v1, p0, Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 401
    return-void
.end method
