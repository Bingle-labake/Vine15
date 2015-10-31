.class Lco/vine/android/CaptchaActivity$1;
.super Landroid/webkit/WebViewClient;
.source "CaptchaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/CaptchaActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/CaptchaActivity;


# direct methods
.method constructor <init>(Lco/vine/android/CaptchaActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 35
    iput-object p1, p0, Lco/vine/android/CaptchaActivity$1;->this$0:Lco/vine/android/CaptchaActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "view"
    .parameter "errorCode"
    .parameter "description"
    .parameter "failingUrl"

    .prologue
    .line 68
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 69
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 6
    .parameter "view"
    .parameter "url"

    .prologue
    const/4 v3, 0x0

    .line 38
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 39
    .local v2, parsedUri:Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    const-string v5, "vine"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    const-string v5, "vine-dev"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 41
    :cond_0
    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, host:Ljava/lang/String;
    const-string v4, "_captcha_complete"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 44
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 45
    .local v1, i:Landroid/content/Intent;
    const-string v4, "rid"

    iget-object v5, p0, Lco/vine/android/CaptchaActivity$1;->this$0:Lco/vine/android/CaptchaActivity;

    #getter for: Lco/vine/android/CaptchaActivity;->mReqId:Ljava/lang/String;
    invoke-static {v5}, Lco/vine/android/CaptchaActivity;->access$000(Lco/vine/android/CaptchaActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 46
    iget-object v4, p0, Lco/vine/android/CaptchaActivity$1;->this$0:Lco/vine/android/CaptchaActivity;

    const/4 v5, -0x1

    invoke-virtual {v4, v5, v1}, Lco/vine/android/CaptchaActivity;->setResult(ILandroid/content/Intent;)V

    .line 49
    new-instance v4, Lco/vine/android/CaptchaActivity$1$1;

    invoke-direct {v4, p0}, Lco/vine/android/CaptchaActivity$1$1;-><init>(Lco/vine/android/CaptchaActivity$1;)V

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v4, v3}, Lco/vine/android/CaptchaActivity$1$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 57
    iget-object v3, p0, Lco/vine/android/CaptchaActivity$1;->this$0:Lco/vine/android/CaptchaActivity;

    invoke-virtual {v3}, Lco/vine/android/CaptchaActivity;->finish()V

    .line 59
    .end local v1           #i:Landroid/content/Intent;
    :cond_1
    const/4 v3, 0x1

    .line 61
    .end local v0           #host:Ljava/lang/String;
    :cond_2
    return v3
.end method
