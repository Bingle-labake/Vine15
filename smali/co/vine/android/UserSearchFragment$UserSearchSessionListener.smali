.class Lco/vine/android/UserSearchFragment$UserSearchSessionListener;
.super Lco/vine/android/client/AppSessionListener;
.source "UserSearchFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/UserSearchFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UserSearchSessionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/UserSearchFragment;


# direct methods
.method private constructor <init>(Lco/vine/android/UserSearchFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 131
    iput-object p1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/UserSearchFragment;Lco/vine/android/UserSearchFragment$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 131
    invoke-direct {p0, p1}, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;-><init>(Lco/vine/android/UserSearchFragment;)V

    return-void
.end method


# virtual methods
.method public onCaptchaRequired(Ljava/lang/String;Ljava/lang/String;Lco/vine/android/service/PendingAction;)V
    .locals 5
    .parameter "reqId"
    .parameter "captchaUrl"
    .parameter "action"

    .prologue
    .line 165
    iget-object v1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/UserSearchFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 166
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 167
    iget-object v1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    new-instance v2, Lco/vine/android/PendingCaptchaRequest;

    iget v3, p3, Lco/vine/android/service/PendingAction;->actionCode:I

    iget-object v4, p3, Lco/vine/android/service/PendingAction;->bundle:Landroid/os/Bundle;

    invoke-direct {v2, p1, v3, v4}, Lco/vine/android/PendingCaptchaRequest;-><init>(Ljava/lang/String;ILandroid/os/Bundle;)V

    iput-object v2, v1, Lco/vine/android/UserSearchFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    .line 168
    iget-object v1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    invoke-virtual {v1, p1, p2}, Lco/vine/android/UserSearchFragment;->showCaptcha(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
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
    .line 160
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    iget-object v0, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    iget-object v0, v0, Lco/vine/android/UserSearchFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    check-cast v0, Lco/vine/android/UsersAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/UsersAdapter;->setUserImages(Ljava/util/HashMap;)V

    .line 161
    return-void
.end method

.method public onUserSearchComplete(Ljava/lang/String;ILjava/lang/String;III)V
    .locals 4
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "count"
    .parameter "nextPage"
    .parameter "previousPage"

    .prologue
    const/4 v3, 0x1

    .line 136
    iget-object v1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/UserSearchFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 137
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_1

    .line 138
    iget-object v1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    iget v2, v0, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {v1, v2}, Lco/vine/android/UserSearchFragment;->hideProgress(I)V

    .line 139
    packed-switch p2, :pswitch_data_0

    .line 148
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 149
    iget-object v1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    const v2, 0x7f0e00a7

    invoke-virtual {v1, v2}, Lco/vine/android/UserSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    .line 151
    :cond_0
    iget-object v1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    invoke-virtual {v1}, Lco/vine/android/UserSearchFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 156
    :cond_1
    :goto_0
    return-void

    .line 141
    :pswitch_0
    if-ge p4, v3, :cond_1

    .line 142
    iget-object v1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    invoke-virtual {v1}, Lco/vine/android/UserSearchFragment;->cleanSearchResults()V

    .line 143
    iget-object v1, p0, Lco/vine/android/UserSearchFragment$UserSearchSessionListener;->this$0:Lco/vine/android/UserSearchFragment;

    const/4 v2, 0x0

    invoke-virtual {v1, v3, v2}, Lco/vine/android/UserSearchFragment;->showSadface(ZZ)V

    goto :goto_0

    .line 139
    :pswitch_data_0
    .packed-switch 0xc8
        :pswitch_0
    .end packed-switch
.end method
