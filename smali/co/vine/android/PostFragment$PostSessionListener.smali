.class Lco/vine/android/PostFragment$PostSessionListener;
.super Lco/vine/android/client/AppSessionListener;
.source "PostFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/PostFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PostSessionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/PostFragment;


# direct methods
.method constructor <init>(Lco/vine/android/PostFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 584
    iput-object p1, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnectFacebookComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    .line 587
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    #getter for: Lco/vine/android/PostFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/PostFragment;->access$000(Lco/vine/android/PostFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 588
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    #getter for: Lco/vine/android/PostFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/PostFragment;->access$000(Lco/vine/android/PostFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 590
    :cond_0
    const/16 v0, 0xc8

    if-eq p2, v0, :cond_1

    .line 591
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    invoke-virtual {v0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0e00a2

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 593
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    #getter for: Lco/vine/android/PostFragment;->mPostFacebook:Lco/vine/android/views/SwitchInterface;
    invoke-static {v0}, Lco/vine/android/PostFragment;->access$100(Lco/vine/android/PostFragment;)Lco/vine/android/views/SwitchInterface;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 595
    :cond_1
    return-void
.end method

.method public onConnectTwitterComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 7
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "username"
    .parameter "token"
    .parameter "secret"
    .parameter "userId"

    .prologue
    .line 601
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_1

    .line 602
    const-wide/16 v0, 0x0

    cmp-long v0, p7, v0

    if-lez v0, :cond_0

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 603
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    invoke-virtual {v0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    iget-object v1, v1, Lco/vine/android/PostFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v1

    move-object v2, p4

    move-object v3, p5

    move-object v4, p6

    move-wide v5, p7

    invoke-static/range {v0 .. v6}, Lco/vine/android/client/VineAccountHelper;->saveTwitterInfo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 606
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    #getter for: Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;
    invoke-static {v0}, Lco/vine/android/PostFragment;->access$200(Lco/vine/android/PostFragment;)Lco/vine/android/views/SwitchInterface;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 612
    :cond_0
    :goto_0
    return-void

    .line 609
    :cond_1
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    invoke-virtual {v0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 610
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    #getter for: Lco/vine/android/PostFragment;->mPostTwitter:Lco/vine/android/views/SwitchInterface;
    invoke-static {v0}, Lco/vine/android/PostFragment;->access$200(Lco/vine/android/PostFragment;)Lco/vine/android/views/SwitchInterface;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

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
    .line 628
    .local p5, tags:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineTag;>;"
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_0

    invoke-virtual {p5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 629
    invoke-static {p4, p5}, Lco/vine/android/provider/VineSuggestionsProvider;->addRealtimeTagSuggestions(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 630
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    #getter for: Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;
    invoke-static {v0}, Lco/vine/android/PostFragment;->access$300(Lco/vine/android/PostFragment;)Lco/vine/android/widget/PopupEditText;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/PopupEditText;->performFilter(Z)V

    .line 632
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
    .line 617
    .local p5, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_0

    .line 618
    invoke-virtual {p5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 619
    invoke-static {p4, p5}, Lco/vine/android/provider/VineSuggestionsProvider;->addRealtimeUserSuggestions(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 620
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    #getter for: Lco/vine/android/PostFragment;->mCaption:Lco/vine/android/widget/PopupEditText;
    invoke-static {v0}, Lco/vine/android/PostFragment;->access$300(Lco/vine/android/PostFragment;)Lco/vine/android/widget/PopupEditText;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/PopupEditText;->performFilter(Z)V

    .line 623
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
    .line 636
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    invoke-super {p0, p1}, Lco/vine/android/client/AppSessionListener;->onPhotoImageLoaded(Ljava/util/HashMap;)V

    .line 637
    iget-object v0, p0, Lco/vine/android/PostFragment$PostSessionListener;->this$0:Lco/vine/android/PostFragment;

    #getter for: Lco/vine/android/PostFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;
    invoke-static {v0}, Lco/vine/android/PostFragment;->access$400(Lco/vine/android/PostFragment;)Lco/vine/android/UsersAutoCompleteAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lco/vine/android/UsersAutoCompleteAdapter;->setUserImages(Ljava/util/HashMap;)V

    .line 638
    return-void
.end method
