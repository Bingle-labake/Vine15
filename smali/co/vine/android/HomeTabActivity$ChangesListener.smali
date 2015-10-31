.class Lco/vine/android/HomeTabActivity$ChangesListener;
.super Lco/vine/android/client/AppSessionListener;
.source "HomeTabActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/HomeTabActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ChangesListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/HomeTabActivity;


# direct methods
.method constructor <init>(Lco/vine/android/HomeTabActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 798
    iput-object p1, p0, Lco/vine/android/HomeTabActivity$ChangesListener;->this$0:Lco/vine/android/HomeTabActivity;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetPendingNotificationCountComplete(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "count"

    .prologue
    const/4 v1, 0x1

    .line 803
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_0

    .line 804
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$ChangesListener;->this$0:Lco/vine/android/HomeTabActivity;

    #getter for: Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;
    invoke-static {v0}, Lco/vine/android/HomeTabActivity;->access$200(Lco/vine/android/HomeTabActivity;)Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-result-object v2

    if-lez p4, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v2, v1, v0}, Lco/vine/android/HomeTabActivity$TabsAdapter;->setNew(IZ)V

    .line 806
    :cond_0
    return-void

    .line 804
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
