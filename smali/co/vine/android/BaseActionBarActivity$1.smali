.class Lco/vine/android/BaseActionBarActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "BaseActionBarActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/BaseActionBarActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/BaseActionBarActivity;


# direct methods
.method constructor <init>(Lco/vine/android/BaseActionBarActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 45
    iput-object p1, p0, Lco/vine/android/BaseActionBarActivity$1;->this$0:Lco/vine/android/BaseActionBarActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 48
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "co.vine.android.FINISH"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lco/vine/android/BaseActionBarActivity$1;->this$0:Lco/vine/android/BaseActionBarActivity;

    invoke-virtual {v0}, Lco/vine/android/BaseActionBarActivity;->finish()V

    .line 51
    :cond_0
    return-void
.end method
