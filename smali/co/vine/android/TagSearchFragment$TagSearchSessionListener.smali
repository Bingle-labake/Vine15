.class Lco/vine/android/TagSearchFragment$TagSearchSessionListener;
.super Lco/vine/android/client/AppSessionListener;
.source "TagSearchFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/TagSearchFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TagSearchSessionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/TagSearchFragment;


# direct methods
.method private constructor <init>(Lco/vine/android/TagSearchFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 128
    iput-object p1, p0, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;->this$0:Lco/vine/android/TagSearchFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/TagSearchFragment;Lco/vine/android/TagSearchFragment$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    invoke-direct {p0, p1}, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;-><init>(Lco/vine/android/TagSearchFragment;)V

    return-void
.end method


# virtual methods
.method public onTagSearchComplete(Ljava/lang/String;ILjava/lang/String;III)V
    .locals 4
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "count"
    .parameter "nextPage"
    .parameter "previousPage"

    .prologue
    const/4 v3, 0x1

    .line 133
    iget-object v1, p0, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;->this$0:Lco/vine/android/TagSearchFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/TagSearchFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 134
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_1

    .line 135
    iget-object v1, p0, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;->this$0:Lco/vine/android/TagSearchFragment;

    iget v2, v0, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {v1, v2}, Lco/vine/android/TagSearchFragment;->hideProgress(I)V

    .line 136
    packed-switch p2, :pswitch_data_0

    .line 145
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 146
    iget-object v1, p0, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;->this$0:Lco/vine/android/TagSearchFragment;

    const v2, 0x7f0e00a7

    invoke-virtual {v1, v2}, Lco/vine/android/TagSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    .line 148
    :cond_0
    iget-object v1, p0, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;->this$0:Lco/vine/android/TagSearchFragment;

    invoke-virtual {v1}, Lco/vine/android/TagSearchFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 153
    :cond_1
    :goto_0
    return-void

    .line 138
    :pswitch_0
    if-ge p4, v3, :cond_1

    .line 139
    iget-object v1, p0, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;->this$0:Lco/vine/android/TagSearchFragment;

    invoke-virtual {v1}, Lco/vine/android/TagSearchFragment;->cleanSearchResults()V

    .line 140
    iget-object v1, p0, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;->this$0:Lco/vine/android/TagSearchFragment;

    const/4 v2, 0x0

    invoke-virtual {v1, v3, v2}, Lco/vine/android/TagSearchFragment;->showSadface(ZZ)V

    goto :goto_0

    .line 136
    :pswitch_data_0
    .packed-switch 0xc8
        :pswitch_0
    .end packed-switch
.end method
