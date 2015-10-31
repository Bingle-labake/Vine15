.class public Lcom/google/android/gms/plus/PlusShare$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/plus/PlusShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private gR:Z

.field private gS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private gT:Z

.field private final mIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string v0, "android.intent.action.SEND"

    invoke-direct {p0, v0}, Lcom/google/android/gms/plus/PlusShare$Builder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3
    .parameter "launchingActivity"

    .prologue
    const-string v0, "android.intent.action.SEND"

    invoke-virtual {p1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/gms/plus/PlusShare$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/ComponentName;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/google/android/gms/plus/PlusClient;)V
    .locals 3
    .parameter "launchingActivity"
    .parameter "plusClient"

    .prologue
    const/4 v1, 0x1

    invoke-direct {p0, p1}, Lcom/google/android/gms/plus/PlusShare$Builder;-><init>(Landroid/app/Activity;)V

    if-eqz p2, :cond_0

    move v0, v1

    :goto_0
    const-string v2, "Must include PlusClient in PlusShare.Builder constructor to create an interactive post."

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/x;->a(ZLjava/lang/Object;)V

    invoke-virtual {p2}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v0

    const-string v2, "PlusClient must be connected to create an interactive post."

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/x;->a(ZLjava/lang/Object;)V

    const-string v0, "https://www.googleapis.com/auth/plus.login"

    invoke-virtual {p2, v0}, Lcom/google/android/gms/plus/PlusClient;->A(Ljava/lang/String;)Z

    move-result v0

    const-string v2, "Must request PLUS_LOGIN scope in PlusClient to create an interactive post."

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/x;->a(ZLjava/lang/Object;)V

    iput-boolean v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gT:Z

    invoke-virtual {p2}, Lcom/google/android/gms/plus/PlusClient;->getCurrentPerson()Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/google/android/gms/plus/model/people/Person;->getId()Ljava/lang/String;

    move-result-object v0

    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "com.google.android.apps.plus.SENDER_ID"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const-string v0, "0"

    goto :goto_1
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "intentAction"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/ComponentName;)V
    .locals 2
    .parameter "intentAction"
    .parameter "activityPackageName"
    .parameter "activityComponentName"

    .prologue
    invoke-direct {p0, p1}, Lcom/google/android/gms/plus/PlusShare$Builder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.v4.app.EXTRA_CALLING_PACKAGE"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p3, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.support.v4.app.EXTRA_CALLING_ACTIVITY"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const/high16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gR:Z

    return-void
.end method


# virtual methods
.method public addCallToAction(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;)Lcom/google/android/gms/plus/PlusShare$Builder;
    .locals 4
    .parameter "label"
    .parameter "uri"
    .parameter "deepLinkId"

    .prologue
    const/4 v1, 0x1

    iget-boolean v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gR:Z

    const-string v2, "Must include the launching activity with PlusShare.Builder constructor before setting call-to-action"

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/x;->a(ZLjava/lang/Object;)V

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    move v0, v1

    :goto_0
    const-string v2, "Must provide a call to action URL"

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/x;->b(ZLjava/lang/Object;)V

    iget-boolean v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gT:Z

    const-string v2, "Must include PlusClient in PlusShare.Builder constructor to create an interactive post"

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/x;->a(ZLjava/lang/Object;)V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "label"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string v2, "url"

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "deepLinkId"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v2, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v3, "com.google.android.apps.plus.CALL_TO_ACTION"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "text/plain"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "com.google.android.apps.plus.GOOGLE_INTERACTIVE_POST"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object p0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public addStream(Landroid/net/Uri;)Lcom/google/android/gms/plus/PlusShare$Builder;
    .locals 2
    .parameter "streamUri"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.intent.extra.STREAM"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/android/gms/plus/PlusShare$Builder;->setStream(Landroid/net/Uri;)Lcom/google/android/gms/plus/PlusShare$Builder;

    move-result-object p0

    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    if-nez v1, :cond_1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 7

    const/4 v0, 0x1

    const/4 v2, 0x0

    iget-object v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v0, :cond_1

    move v1, v0

    :goto_0
    iget-object v3, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    iget-object v4, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v5, "com.google.android.apps.plus.GOOGLE_INTERACTIVE_POST"

    invoke-virtual {v4, v5, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v1, :cond_0

    if-nez v4, :cond_2

    :cond_0
    :goto_1
    const-string v5, "Call-to-action buttons are only available for URLs."

    invoke-static {v0, v5}, Lcom/google/android/gms/internal/x;->a(ZLjava/lang/Object;)V

    if-eqz v4, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v5, "com.google.android.apps.plus.CONTENT_URL"

    invoke-virtual {v0, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The content URL is required for interactive posts."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    move v1, v2

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1

    :cond_3
    if-nez v1, :cond_4

    if-eqz v3, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v5, "android.intent.action.SEND"

    invoke-virtual {v0, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v5, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v6, "android.intent.extra.STREAM"

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    invoke-virtual {v5, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :goto_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    :cond_4
    if-eqz v1, :cond_5

    if-nez v3, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.intent.extra.STREAM"

    iget-object v2, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    :cond_5
    :goto_3
    if-eqz v4, :cond_8

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.google.android.apps.plus.CONTENT_URL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.google.android.apps.plus.CONTENT_DEEP_LINK_ID"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must set content URL or content deep-link ID to use a call-to-action button."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "android.intent.extra.STREAM"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_2

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.intent.extra.STREAM"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_3

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.google.android.apps.plus"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public setContentDeepLinkId(Ljava/lang/String;)Lcom/google/android/gms/plus/PlusShare$Builder;
    .locals 1
    .parameter "deepLinkId"

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0, v0}, Lcom/google/android/gms/plus/PlusShare$Builder;->setContentDeepLinkId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/gms/plus/PlusShare$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setContentDeepLinkId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/gms/plus/PlusShare$Builder;
    .locals 3
    .parameter "deepLinkId"
    .parameter "title"
    .parameter "description"
    .parameter "thumbnailUri"

    .prologue
    iget-boolean v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gR:Z

    const-string v1, "Must include the launching activity with PlusShare.Builder constructor before setting deep links"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/x;->b(ZLjava/lang/Object;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "The deepLinkId parameter is required."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/x;->b(ZLjava/lang/Object;)V

    invoke-static {p2, p3, p4}, Lcom/google/android/gms/plus/PlusShare;->a(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Landroid/os/Bundle;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "com.google.android.apps.plus.CONTENT_DEEP_LINK_ID"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "com.google.android.apps.plus.CONTENT_DEEP_LINK_METADATA"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    return-object p0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setContentUrl(Landroid/net/Uri;)Lcom/google/android/gms/plus/PlusShare$Builder;
    .locals 3
    .parameter "uri"

    .prologue
    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.google.android.apps.plus.CONTENT_URL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :goto_0
    return-object p0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v2, "com.google.android.apps.plus.CONTENT_URL"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method public setRecipients(Ljava/util/List;)Lcom/google/android/gms/plus/PlusShare$Builder;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/plus/model/people/Person;",
            ">;)",
            "Lcom/google/android/gms/plus/PlusShare$Builder;"
        }
    .end annotation

    .prologue
    .local p1, recipientList:Ljava/util/List;,"Ljava/util/List<Lcom/google/android/gms/plus/model/people/Person;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.google.android.apps.plus.RECIPIENT_IDS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.google.android.apps.plus.RECIPIENT_DISPLAY_NAMES"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :goto_1
    return-object p0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/plus/model/people/Person;

    invoke-interface {v0}, Lcom/google/android/gms/plus/model/people/Person;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v0}, Lcom/google/android/gms/plus/model/people/Person;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v3, "com.google.android.apps.plus.RECIPIENT_IDS"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.google.android.apps.plus.RECIPIENT_DISPLAY_NAMES"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    goto :goto_1
.end method

.method public setStream(Landroid/net/Uri;)Lcom/google/android/gms/plus/PlusShare$Builder;
    .locals 2
    .parameter "streamUri"

    .prologue
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->gS:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.intent.extra.STREAM"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-object p0
.end method

.method public setText(Ljava/lang/CharSequence;)Lcom/google/android/gms/plus/PlusShare$Builder;
    .locals 2
    .parameter "text"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    return-object p0
.end method

.method public setType(Ljava/lang/String;)Lcom/google/android/gms/plus/PlusShare$Builder;
    .locals 1
    .parameter "mimeType"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/plus/PlusShare$Builder;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    return-object p0
.end method
