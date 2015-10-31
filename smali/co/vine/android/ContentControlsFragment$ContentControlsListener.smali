.class Lco/vine/android/ContentControlsFragment$ContentControlsListener;
.super Lco/vine/android/client/AppSessionListener;
.source "ContentControlsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ContentControlsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ContentControlsListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/ContentControlsFragment;


# direct methods
.method constructor <init>(Lco/vine/android/ContentControlsFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 249
    iput-object p1, p0, Lco/vine/android/ContentControlsFragment$ContentControlsListener;->this$0:Lco/vine/android/ContentControlsFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpdateExplicitComplete(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "explicit"

    .prologue
    .line 273
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment$ContentControlsListener;->this$0:Lco/vine/android/ContentControlsFragment;

    #getter for: Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lco/vine/android/ContentControlsFragment;->access$000(Lco/vine/android/ContentControlsFragment;)Landroid/app/ProgressDialog;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 274
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment$ContentControlsListener;->this$0:Lco/vine/android/ContentControlsFragment;

    #getter for: Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lco/vine/android/ContentControlsFragment;->access$000(Lco/vine/android/ContentControlsFragment;)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->dismiss()V

    .line 276
    :cond_0
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment$ContentControlsListener;->this$0:Lco/vine/android/ContentControlsFragment;

    invoke-virtual {v2}, Lco/vine/android/ContentControlsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 277
    .local v0, activity:Landroid/app/Activity;
    const/16 v2, 0xc8

    if-ne p2, v2, :cond_1

    .line 278
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment$ContentControlsListener;->this$0:Lco/vine/android/ContentControlsFragment;

    invoke-virtual {v2}, Lco/vine/android/ContentControlsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 279
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "settings_explicit"

    invoke-interface {v1, v2, p4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 280
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 288
    .end local v1           #editor:Landroid/content/SharedPreferences$Editor;
    :goto_0
    return-void

    .line 282
    :cond_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 283
    invoke-static {v0, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 285
    :cond_2
    const v2, 0x7f0e0082

    invoke-static {v0, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method public onUpdatePrivateComplete(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "priv"

    .prologue
    .line 253
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment$ContentControlsListener;->this$0:Lco/vine/android/ContentControlsFragment;

    #getter for: Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lco/vine/android/ContentControlsFragment;->access$000(Lco/vine/android/ContentControlsFragment;)Landroid/app/ProgressDialog;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 254
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment$ContentControlsListener;->this$0:Lco/vine/android/ContentControlsFragment;

    #getter for: Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lco/vine/android/ContentControlsFragment;->access$000(Lco/vine/android/ContentControlsFragment;)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->dismiss()V

    .line 256
    :cond_0
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment$ContentControlsListener;->this$0:Lco/vine/android/ContentControlsFragment;

    invoke-virtual {v2}, Lco/vine/android/ContentControlsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 257
    .local v0, activity:Landroid/app/Activity;
    const/16 v2, 0xc8

    if-ne p2, v2, :cond_1

    .line 258
    invoke-static {v0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 259
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "settings_private"

    invoke-interface {v1, v2, p4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 260
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 268
    .end local v1           #editor:Landroid/content/SharedPreferences$Editor;
    :goto_0
    return-void

    .line 262
    :cond_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 263
    invoke-static {v0, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 265
    :cond_2
    const v2, 0x7f0e0082

    invoke-static {v0, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0
.end method
