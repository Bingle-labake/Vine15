.class Lco/vine/android/service/VineService$ExecutionRunnable;
.super Ljava/lang/Object;
.source "VineService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/service/VineService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExecutionRunnable"
.end annotation


# instance fields
.field private final mActionCode:I

.field private final mBundle:Landroid/os/Bundle;

.field private final mResponder:Lco/vine/android/service/VineServiceResponder;

.field private final mStartId:I

.field final synthetic this$0:Lco/vine/android/service/VineService;


# direct methods
.method public constructor <init>(Lco/vine/android/service/VineService;IILandroid/os/Bundle;Lco/vine/android/service/VineServiceResponder;)V
    .locals 0
    .parameter
    .parameter "startId"
    .parameter "actionCode"
    .parameter "bundle"
    .parameter "responder"

    .prologue
    .line 2746
    iput-object p1, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->this$0:Lco/vine/android/service/VineService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2747
    iput p2, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mStartId:I

    .line 2748
    iput p3, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mActionCode:I

    .line 2749
    iput-object p4, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    .line 2750
    iput-object p5, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mResponder:Lco/vine/android/service/VineServiceResponder;

    .line 2751
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v7, 0x1

    .line 2754
    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 2755
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->this$0:Lco/vine/android/service/VineService;

    iget v1, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mStartId:I

    iget v2, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mActionCode:I

    iget-object v3, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    iget-object v6, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mResponder:Lco/vine/android/service/VineServiceResponder;

    invoke-virtual {v0, v1, v2, v3, v6}, Lco/vine/android/service/VineService;->executeAction(IILandroid/os/Bundle;Lco/vine/android/service/VineServiceResponder;)Landroid/os/Bundle;

    move-result-object v8

    .line 2756
    .local v8, result:Landroid/os/Bundle;
    const-string v0, "executionCode"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 2831
    :cond_0
    :goto_0
    const-string v0, "statusCode"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 2832
    .local v4, statusCode:I
    const-string v0, "reasonPhrase"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2833
    .local v5, reasonPhrase:Ljava/lang/String;
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->this$0:Lco/vine/android/service/VineService;

    #getter for: Lco/vine/android/service/VineService;->mMainHandler:Landroid/os/Handler;
    invoke-static {v0}, Lco/vine/android/service/VineService;->access$100(Lco/vine/android/service/VineService;)Landroid/os/Handler;

    move-result-object v9

    new-instance v0, Lco/vine/android/service/VineService$ResponderRunnable;

    iget-object v1, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->this$0:Lco/vine/android/service/VineService;

    iget-object v2, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mResponder:Lco/vine/android/service/VineServiceResponder;

    iget v3, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mActionCode:I

    iget-object v6, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    iget v7, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mStartId:I

    invoke-direct/range {v0 .. v7}, Lco/vine/android/service/VineService$ResponderRunnable;-><init>(Lco/vine/android/service/VineService;Lco/vine/android/service/VineServiceResponder;IILjava/lang/String;Landroid/os/Bundle;I)V

    invoke-virtual {v9, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2835
    return-void

    .line 2758
    .end local v4           #statusCode:I
    .end local v5           #reasonPhrase:Ljava/lang/String;
    :pswitch_0
    invoke-static {}, Lco/vine/android/service/VineService;->access$000()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2759
    const-string v0, "VineService"

    const-string v1, "Session key was invalid. Refreshing session key and then will try again"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2762
    :cond_1
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->this$0:Lco/vine/android/service/VineService;

    iget v1, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mStartId:I

    const/16 v2, 0x3e8

    iget-object v3, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    iget-object v6, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mResponder:Lco/vine/android/service/VineServiceResponder;

    invoke-virtual {v0, v1, v2, v3, v6}, Lco/vine/android/service/VineService;->executeAction(IILandroid/os/Bundle;Lco/vine/android/service/VineServiceResponder;)Landroid/os/Bundle;

    move-result-object v8

    .line 2764
    const-string v0, "executionCode"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_1

    .line 2781
    invoke-static {}, Lco/vine/android/service/VineService;->access$000()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2782
    const-string v0, "VineService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Session key successfully refreshed. Trying original action of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mActionCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " again"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2785
    :cond_2
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->this$0:Lco/vine/android/service/VineService;

    iget v1, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mStartId:I

    iget v2, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mActionCode:I

    iget-object v3, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    iget-object v6, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mResponder:Lco/vine/android/service/VineServiceResponder;

    invoke-virtual {v0, v1, v2, v3, v6}, Lco/vine/android/service/VineService;->executeAction(IILandroid/os/Bundle;Lco/vine/android/service/VineServiceResponder;)Landroid/os/Bundle;

    move-result-object v8

    .line 2786
    const-string v0, "executionCode"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_2

    .line 2803
    invoke-static {}, Lco/vine/android/service/VineService;->access$000()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2804
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    const-string v1, "refresh_session"

    invoke-virtual {v0, v1, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 2805
    const-string v0, "VineService"

    const-string v1, "Session key refresh and retry complete."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 2766
    :pswitch_1
    invoke-static {}, Lco/vine/android/service/VineService;->access$000()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2767
    const-string v0, "VineService"

    const-string v1, "Session key could not be refreshed. Aborting."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2769
    :cond_3
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    const-string v1, "logged_out"

    invoke-virtual {v0, v1, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 2773
    :pswitch_2
    invoke-static {}, Lco/vine/android/service/VineService;->access$000()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2774
    const-string v0, "VineService"

    const-string v1, "Session was logged out."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2776
    :cond_4
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    const-string v1, "logged_out"

    invoke-virtual {v0, v1, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 2788
    :pswitch_3
    invoke-static {}, Lco/vine/android/service/VineService;->access$000()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2789
    const-string v0, "VineService"

    const-string v1, "Session key is still invalid. Aborting."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2791
    :cond_5
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    const-string v1, "logged_out"

    invoke-virtual {v0, v1, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 2795
    :pswitch_4
    invoke-static {}, Lco/vine/android/service/VineService;->access$000()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2796
    const-string v0, "VineService"

    const-string v1, "Session was logged out."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2798
    :cond_6
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    const-string v1, "logged_out"

    invoke-virtual {v0, v1, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 2816
    :pswitch_5
    const-string v0, "VineService"

    const-string v1, "Captcha triggered"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2817
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    const-string v1, "captcha_url"

    const-string v2, "captcha_url"

    invoke-virtual {v8, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2821
    :pswitch_6
    const-string v0, "VineService"

    const-string v1, "Session was logged out."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2822
    iget-object v0, p0, Lco/vine/android/service/VineService$ExecutionRunnable;->mBundle:Landroid/os/Bundle;

    const-string v1, "logged_out"

    invoke-virtual {v0, v1, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 2756
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_6
        :pswitch_5
    .end packed-switch

    .line 2764
    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 2786
    :pswitch_data_2
    .packed-switch 0x2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
