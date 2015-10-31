.class Lco/vine/android/SettingsFragment$SettingsListener;
.super Lco/vine/android/client/AppSessionListener;
.source "SettingsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/SettingsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SettingsListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/SettingsFragment;


# direct methods
.method constructor <init>(Lco/vine/android/SettingsFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 589
    iput-object p1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onClearCacheComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    .line 664
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 665
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 668
    :cond_0
    :try_start_0
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mClearCacheValue:Landroid/widget/TextView;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$1100(Lco/vine/android/SettingsFragment;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v2}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v3}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/util/Util;->getCacheSize(Landroid/content/Context;)J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lco/vine/android/util/Util;->formatFileSize(Landroid/content/res/Resources;J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lco/vine/android/VineException; {:try_start_0 .. :try_end_0} :catch_0

    .line 673
    :goto_0
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v1}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->setResult(I)V

    .line 674
    return-void

    .line 670
    :catch_0
    move-exception v0

    .line 671
    .local v0, e:Lco/vine/android/VineException;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onConnectTwitterComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 10
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "username"
    .parameter "token"
    .parameter "secret"
    .parameter "userId"

    .prologue
    .line 680
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 681
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 683
    :cond_0
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a015e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 685
    .local v9, valueTextView:Landroid/widget/TextView;
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a015d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 687
    .local v8, label:Landroid/widget/TextView;
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p7, v0

    if-lez v0, :cond_1

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static/range {p6 .. p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 689
    const v0, 0x7f0e0167

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(I)V

    .line 690
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 691
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$1200(Lco/vine/android/SettingsFragment;)Lco/vine/android/client/AppController;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v1

    move-object v2, p4

    move-object v3, p5

    move-object/from16 v4, p6

    move-wide/from16 v5, p7

    invoke-static/range {v0 .. v6}, Lco/vine/android/client/VineAccountHelper;->saveTwitterInfo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 694
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    const/4 v1, 0x1

    #setter for: Lco/vine/android/SettingsFragment;->mTwitterLogin:Z
    invoke-static {v0, v1}, Lco/vine/android/SettingsFragment;->access$1302(Lco/vine/android/SettingsFragment;Z)Z

    .line 695
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mPrefs:Landroid/content/SharedPreferences;
    invoke-static {v0}, Lco/vine/android/SettingsFragment;->access$1400(Lco/vine/android/SettingsFragment;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 696
    .local v7, editor:Landroid/content/SharedPreferences$Editor;
    const-string v0, "settings_twitter_connected"

    const/4 v1, 0x1

    invoke-interface {v7, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 697
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 708
    .end local v7           #editor:Landroid/content/SharedPreferences$Editor;
    :goto_0
    return-void

    .line 699
    :cond_1
    const v0, 0x7f0e0164

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(I)V

    .line 700
    const v0, 0x7f0e0165

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(I)V

    .line 701
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    const/4 v1, 0x0

    #setter for: Lco/vine/android/SettingsFragment;->mTwitterLogin:Z
    invoke-static {v0, v1}, Lco/vine/android/SettingsFragment;->access$1302(Lco/vine/android/SettingsFragment;Z)Z

    .line 702
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 703
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0175

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    .line 706
    :cond_2
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDeactivateAccountComplete(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "success"

    .prologue
    .line 750
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 751
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 755
    :cond_0
    if-eqz p4, :cond_1

    .line 756
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$1200(Lco/vine/android/SettingsFragment;)Lco/vine/android/client/AppController;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$1200(Lco/vine/android/SettingsFragment;)Lco/vine/android/client/AppController;

    move-result-object v2

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/client/AppController;->logout(Lco/vine/android/client/Session;)Ljava/lang/String;

    .line 757
    const v0, 0x7f0e015a

    .line 758
    .local v0, messageId:I
    const-string v1, "User account successfully deactivated"

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 763
    :goto_0
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v1}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v0}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 764
    return-void

    .line 760
    .end local v0           #messageId:I
    :cond_1
    const v0, 0x7f0e0159

    .line 761
    .restart local v0       #messageId:I
    const-string v1, "User account deactivation failed"

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDisconnectTwitterComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    const/4 v4, 0x0

    .line 712
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 713
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->dismiss()V

    .line 715
    :cond_0
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v2}, Lco/vine/android/SettingsFragment;->getView()Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a015e

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 717
    .local v1, valueTextView:Landroid/widget/TextView;
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v2}, Lco/vine/android/SettingsFragment;->getView()Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a015d

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 719
    .local v0, label:Landroid/widget/TextView;
    const/16 v2, 0xc8

    if-ne p2, v2, :cond_1

    .line 720
    const v2, 0x7f0e0164

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 721
    const v2, 0x7f0e0165

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 722
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v2}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;
    invoke-static {v3}, Lco/vine/android/SettingsFragment;->access$1200(Lco/vine/android/SettingsFragment;)Lco/vine/android/client/AppController;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lco/vine/android/client/VineAccountHelper;->removeTwitterInfo(Landroid/content/Context;Ljava/lang/String;)V

    .line 724
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #setter for: Lco/vine/android/SettingsFragment;->mTwitterLogin:Z
    invoke-static {v2, v4}, Lco/vine/android/SettingsFragment;->access$1302(Lco/vine/android/SettingsFragment;Z)Z

    .line 725
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mEditor:Landroid/content/SharedPreferences$Editor;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$1000(Lco/vine/android/SettingsFragment;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "settings_twitter_connected"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 726
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mEditor:Landroid/content/SharedPreferences$Editor;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$1000(Lco/vine/android/SettingsFragment;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 734
    :goto_0
    return-void

    .line 728
    :cond_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 729
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v2}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0176

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    .line 732
    :cond_2
    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v2}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onGetEditionsComplete(ILjava/util/ArrayList;)V
    .locals 2
    .parameter "statusCode"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 769
    .local p2, editions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/16 v0, 0xc8

    if-ne p1, v0, :cond_0

    .line 770
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    const/4 v1, 0x1

    #setter for: Lco/vine/android/SettingsFragment;->mEditionsFetched:Z
    invoke-static {v0, v1}, Lco/vine/android/SettingsFragment;->access$1502(Lco/vine/android/SettingsFragment;Z)Z

    .line 772
    :cond_0
    return-void
.end method

.method public onLogoutComplete(Ljava/lang/String;)V
    .locals 1
    .parameter "reqId"

    .prologue
    .line 738
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 745
    :cond_0
    :goto_0
    return-void

    .line 741
    :cond_1
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 742
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 744
    :cond_2
    iget-object v0, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/StartActivity;->toStart(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public onPhotoImageLoaded(Ljava/util/HashMap;)V
    .locals 5
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
    .line 593
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mAvatarKey:Lco/vine/android/util/image/ImageKey;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$700(Lco/vine/android/SettingsFragment;)Lco/vine/android/util/image/ImageKey;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/image/UrlImage;

    .line 594
    .local v0, urlImage:Lco/vine/android/util/image/UrlImage;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lco/vine/android/util/image/UrlImage;->isValid()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 595
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$800(Lco/vine/android/SettingsFragment;)Landroid/widget/ImageView;

    move-result-object v1

    new-instance v2, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v3, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;
    invoke-static {v3}, Lco/vine/android/SettingsFragment;->access$800(Lco/vine/android/SettingsFragment;)Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget-object v4, v0, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v2, v3, v4}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 597
    :cond_0
    return-void
.end method

.method public onUpdateEditionComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    .line 631
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 632
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 634
    :cond_0
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_1

    .line 635
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mEditor:Landroid/content/SharedPreferences$Editor;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$1000(Lco/vine/android/SettingsFragment;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 636
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v1, "settings_edition"

    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$500(Lco/vine/android/SettingsFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 637
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 639
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_1
    return-void
.end method

.method public onUpdateProfileComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "avatarUrl"

    .prologue
    .line 602
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 603
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 605
    :cond_0
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_3

    .line 606
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mEditor:Landroid/content/SharedPreferences$Editor;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$1000(Lco/vine/android/SettingsFragment;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 607
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 608
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mEditor:Landroid/content/SharedPreferences$Editor;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$1000(Lco/vine/android/SettingsFragment;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "settings_profile_avatar_url"

    invoke-interface {v1, v2, p4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 610
    :cond_1
    const-string v1, "settings_profile_name"

    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$000(Lco/vine/android/SettingsFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 611
    const-string v1, "settings_profile_description"

    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$100(Lco/vine/android/SettingsFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 612
    const-string v1, "settings_profile_location"

    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$200(Lco/vine/android/SettingsFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 613
    const-string v1, "settings_profile_email"

    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$300(Lco/vine/android/SettingsFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 614
    const-string v1, "settings_profile_phone"

    iget-object v2, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mPhone:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/SettingsFragment;->access$400(Lco/vine/android/SettingsFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 616
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 617
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v1}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 618
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v1}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 627
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_2
    :goto_0
    return-void

    .line 621
    :cond_3
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 622
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v1}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e01cd

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0

    .line 624
    :cond_4
    iget-object v1, p0, Lco/vine/android/SettingsFragment$SettingsListener;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v1}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method
