.class Lco/vine/android/StartActivity$1;
.super Ljava/lang/Object;
.source "StartActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/StartActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/StartActivity;


# direct methods
.method constructor <init>(Lco/vine/android/StartActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 222
    iput-object p1, p0, Lco/vine/android/StartActivity$1;->this$0:Lco/vine/android/StartActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 4
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    .line 225
    const-string v0, "Video test failed."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 226
    iget-object v0, p0, Lco/vine/android/StartActivity$1;->this$0:Lco/vine/android/StartActivity;

    invoke-virtual {v0}, Lco/vine/android/StartActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lco/vine/android/util/SystemUtil;->setNormalVideoPlayable(Landroid/content/Context;Z)V

    .line 227
    iget-object v0, p0, Lco/vine/android/StartActivity$1;->this$0:Lco/vine/android/StartActivity;

    #getter for: Lco/vine/android/StartActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lco/vine/android/StartActivity;->access$100(Lco/vine/android/StartActivity;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lco/vine/android/StartActivity$1$1;

    invoke-direct {v1, p0}, Lco/vine/android/StartActivity$1$1;-><init>(Lco/vine/android/StartActivity$1;)V

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 233
    const/4 v0, 0x1

    return v0
.end method
