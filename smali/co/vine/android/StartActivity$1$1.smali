.class Lco/vine/android/StartActivity$1$1;
.super Ljava/lang/Object;
.source "StartActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/StartActivity$1;->onError(Landroid/media/MediaPlayer;II)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/vine/android/StartActivity$1;


# direct methods
.method constructor <init>(Lco/vine/android/StartActivity$1;)V
    .locals 0
    .parameter

    .prologue
    .line 227
    iput-object p1, p0, Lco/vine/android/StartActivity$1$1;->this$1:Lco/vine/android/StartActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lco/vine/android/StartActivity$1$1;->this$1:Lco/vine/android/StartActivity$1;

    iget-object v0, v0, Lco/vine/android/StartActivity$1;->this$0:Lco/vine/android/StartActivity;

    #calls: Lco/vine/android/StartActivity;->openStartVideo()V
    invoke-static {v0}, Lco/vine/android/StartActivity;->access$000(Lco/vine/android/StartActivity;)V

    .line 231
    return-void
.end method
