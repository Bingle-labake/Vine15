.class public Lco/vine/android/FindFriendsSearchFragment;
.super Lco/vine/android/BaseControllerFragment;
.source "FindFriendsSearchFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final ARG_LAYOUT:Ljava/lang/String; = "layout"


# instance fields
.field private mBold:[Landroid/text/style/StyleSpan;

.field private mLayoutRes:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lco/vine/android/BaseControllerFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .parameter "view"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 60
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 91
    :goto_0
    return-void

    .line 62
    :pswitch_0
    const-string v1, "sms"

    const-string v2, "FindFriends"

    invoke-static {v1, v2}, Lco/vine/android/util/FlurryUtils;->trackInvite(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 64
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "vnd.android-dir/mms-sms"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 65
    const-string v1, "sms_body"

    invoke-static {}, Lco/vine/android/util/Util;->getSmsMessageId()I

    move-result v2

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Lco/vine/android/FindFriendsSearchFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p0, v2, v3}, Lco/vine/android/FindFriendsSearchFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 67
    const v1, 0x7f0e0150

    invoke-virtual {p0, v1}, Lco/vine/android/FindFriendsSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lco/vine/android/FindFriendsSearchFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 71
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_1
    const-string v1, "email"

    const-string v2, "FindFriends"

    invoke-static {v1, v2}, Lco/vine/android/util/FlurryUtils;->trackInvite(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SENDTO"

    const-string v2, "mailto"

    const-string v3, ""

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 74
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "android.intent.extra.SUBJECT"

    const v2, 0x7f0e00b7

    invoke-virtual {p0, v2}, Lco/vine/android/FindFriendsSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 76
    const-string v1, "android.intent.extra.TEXT"

    invoke-static {}, Lco/vine/android/util/Util;->getEmailMessageId()I

    move-result v2

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Lco/vine/android/FindFriendsSearchFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p0, v2, v3}, Lco/vine/android/FindFriendsSearchFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 78
    const v1, 0x7f0e00b4

    invoke-virtual {p0, v1}, Lco/vine/android/FindFriendsSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lco/vine/android/FindFriendsSearchFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 83
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_2
    const-string v1, "FindFriends"

    invoke-static {v1}, Lco/vine/android/util/FlurryUtils;->trackVisitSearch(Ljava/lang/String;)V

    .line 84
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/FindFriendsSearchFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lco/vine/android/SearchActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lco/vine/android/FindFriendsSearchFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 60
    :pswitch_data_0
    .packed-switch 0x7f0a0096
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 29
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 30
    new-array v1, v4, [Landroid/text/style/StyleSpan;

    new-instance v2, Landroid/text/style/StyleSpan;

    invoke-direct {v2, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    aput-object v2, v1, v3

    iput-object v1, p0, Lco/vine/android/FindFriendsSearchFragment;->mBold:[Landroid/text/style/StyleSpan;

    .line 32
    invoke-virtual {p0}, Lco/vine/android/FindFriendsSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 33
    .local v0, args:Landroid/os/Bundle;
    const-string v1, "layout"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lco/vine/android/FindFriendsSearchFragment;->mLayoutRes:I

    .line 34
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    const/16 v6, 0x22

    .line 39
    iget v4, p0, Lco/vine/android/FindFriendsSearchFragment;->mLayoutRes:I

    const/4 v5, 0x0

    invoke-virtual {p1, v4, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 41
    .local v3, v:Landroid/view/View;
    const v4, 0x7f0a0096

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 42
    .local v2, search:Landroid/widget/Button;
    iget-object v4, p0, Lco/vine/android/FindFriendsSearchFragment;->mBold:[Landroid/text/style/StyleSpan;

    const v5, 0x7f0e00bb

    invoke-virtual {p0, v5}, Lco/vine/android/FindFriendsSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 44
    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    const v4, 0x7f0a0097

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 47
    .local v1, inviteText:Landroid/widget/Button;
    iget-object v4, p0, Lco/vine/android/FindFriendsSearchFragment;->mBold:[Landroid/text/style/StyleSpan;

    const v5, 0x7f0e00bc

    invoke-virtual {p0, v5}, Lco/vine/android/FindFriendsSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 49
    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    const v4, 0x7f0a0098

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 52
    .local v0, inviteEmail:Landroid/widget/Button;
    iget-object v4, p0, Lco/vine/android/FindFriendsSearchFragment;->mBold:[Landroid/text/style/StyleSpan;

    const v5, 0x7f0e00ba

    invoke-virtual {p0, v5}, Lco/vine/android/FindFriendsSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 54
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    return-object v3
.end method
