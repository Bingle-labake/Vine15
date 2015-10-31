.class Lco/vine/android/ExploreFragment$ExploreListener;
.super Lco/vine/android/client/AppSessionListener;
.source "ExploreFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ExploreFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ExploreListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/ExploreFragment;


# direct methods
.method constructor <init>(Lco/vine/android/ExploreFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 79
    iput-object p1, p0, Lco/vine/android/ExploreFragment$ExploreListener;->this$0:Lco/vine/android/ExploreFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpdateEditionComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    .line 82
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/client/AppSessionListener;->onUpdateEditionComplete(Ljava/lang/String;ILjava/lang/String;)V

    .line 83
    const-string v0, "Reloading webview after edition update"

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 84
    iget-object v0, p0, Lco/vine/android/ExploreFragment$ExploreListener;->this$0:Lco/vine/android/ExploreFragment;

    invoke-virtual {v0}, Lco/vine/android/ExploreFragment;->reloadWebView()V

    .line 85
    return-void
.end method
