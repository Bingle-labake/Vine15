.class Lco/vine/android/UploadsListFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "UploadsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/UploadsListFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/UploadsListFragment;


# direct methods
.method constructor <init>(Lco/vine/android/UploadsListFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 72
    iput-object p1, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 75
    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    #getter for: Lco/vine/android/UploadsListFragment;->mRetryView:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lco/vine/android/UploadsListFragment;->access$000(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    #getter for: Lco/vine/android/UploadsListFragment;->mRetryView:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lco/vine/android/UploadsListFragment;->access$000(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    #getter for: Lco/vine/android/UploadsListFragment;->mRetryView:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lco/vine/android/UploadsListFragment;->access$000(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 77
    .local v6, refresh:Landroid/widget/ImageView;
    invoke-virtual {v6, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 79
    .end local v6           #refresh:Landroid/widget/ImageView;
    :cond_0
    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    #getter for: Lco/vine/android/UploadsListFragment;->mSpinnerView:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lco/vine/android/UploadsListFragment;->access$100(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    #getter for: Lco/vine/android/UploadsListFragment;->mSpinnerView:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lco/vine/android/UploadsListFragment;->access$100(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 80
    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    #getter for: Lco/vine/android/UploadsListFragment;->mSpinnerView:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lco/vine/android/UploadsListFragment;->access$100(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/widget/ProgressBar;

    .line 81
    .local v7, spinner:Landroid/widget/ProgressBar;
    const/16 v0, 0x8

    invoke-virtual {v7, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 84
    .end local v7           #spinner:Landroid/widget/ProgressBar;
    :cond_1
    const-string v0, "upload_status"

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    .line 86
    .local v8, status:I
    const-string v0, "UploadsListFragment.onReceive status={}"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    #getter for: Lco/vine/android/UploadsListFragment;->mStatusMessage:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lco/vine/android/UploadsListFragment;->access$200(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    #getter for: Lco/vine/android/UploadsListFragment;->mStatusMessage:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lco/vine/android/UploadsListFragment;->access$200(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 88
    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    #getter for: Lco/vine/android/UploadsListFragment;->mStatusMessage:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lco/vine/android/UploadsListFragment;->access$200(Lco/vine/android/UploadsListFragment;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 89
    .local v9, statusMessage:Landroid/widget/TextView;
    packed-switch v8, :pswitch_data_0

    .line 110
    .end local v9           #statusMessage:Landroid/widget/TextView;
    :cond_2
    :goto_0
    return-void

    .line 91
    .restart local v9       #statusMessage:Landroid/widget/TextView;
    :pswitch_0
    const v0, 0x7f0e01d3

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 95
    :pswitch_1
    const v0, 0x7f0e01d2

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 99
    :pswitch_2
    const v0, 0x7f0e01d1

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 103
    :pswitch_3
    const-string v0, "path"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, videoPath:Ljava/lang/String;
    const-string v0, "thumbnail"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 105
    .local v2, thumbnailPath:Ljava/lang/String;
    iget-object v10, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    iget-object v0, p0, Lco/vine/android/UploadsListFragment$1;->this$0:Lco/vine/android/UploadsListFragment;

    invoke-virtual {v0}, Lco/vine/android/UploadsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lco/vine/android/PostActivity;->getIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v10, v0}, Lco/vine/android/UploadsListFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 89
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method
