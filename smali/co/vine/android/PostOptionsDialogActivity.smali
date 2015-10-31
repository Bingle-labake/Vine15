.class public Lco/vine/android/PostOptionsDialogActivity;
.super Lco/vine/android/SupportListActivity;
.source "PostOptionsDialogActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/PostOptionsDialogActivity$OptionArrayAdapter;,
        Lco/vine/android/PostOptionsDialogActivity$Option;
    }
.end annotation


# static fields
.field public static final ACTION_DELETE:Ljava/lang/String; = "action_delete"

.field public static final ACTION_FACEBOOK:Ljava/lang/String; = "action_facebook"

.field public static final ACTION_REPORT:Ljava/lang/String; = "action_report"

.field public static final ACTION_SHARE_OTHER:Ljava/lang/String; = "action_other"

.field public static final ACTION_TWITTER:Ljava/lang/String; = "action_twitter"

.field private static final DIALOG_DELETE:I = 0x2

.field private static final DIALOG_REPORT:I = 0x1

.field public static final EXTRA_DELETE:Ljava/lang/String; = "delete"

.field public static final EXTRA_DESCRIPTION:Ljava/lang/String; = "description"

.field public static final EXTRA_NAME:Ljava/lang/String; = "name"

.field public static final EXTRA_POST_FACEBOOK:Ljava/lang/String; = "post_facebook"

.field public static final EXTRA_POST_ID:Ljava/lang/String; = "post_id"

.field public static final EXTRA_POST_TWITTER:Ljava/lang/String; = "post_twitter"

.field public static final EXTRA_REPORT:Ljava/lang/String; = "report"

.field public static final EXTRA_SHARE_OTHER:Ljava/lang/String; = "share_other"

.field public static final EXTRA_SHARE_URL:Ljava/lang/String; = "share_url"

.field public static final EXTRA_THUMBNAIL_URL:Ljava/lang/String; = "thumbnail_url"

.field private static final ID_CANCEL:I = 0x6

.field private static final ID_DELETE:I = 0x5

.field private static final ID_FACEBOOK:I = 0x2

.field private static final ID_REPORT:I = 0x4

.field private static final ID_SHARE_OTHER:I = 0x3

.field private static final ID_TWITTER:I = 0x1


# instance fields
.field private mArrayAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Lco/vine/android/PostOptionsDialogActivity$Option;",
            ">;"
        }
    .end annotation
.end field

.field private mDelete:Z

.field private mName:Ljava/lang/String;

.field private mPostFacebook:Z

.field private mPostId:J

.field private mPostTwitter:Z

.field private mReport:Z

.field private mShareOther:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lco/vine/android/SupportListActivity;-><init>()V

    .line 224
    return-void
.end method

.method private addAll(Ljava/util/Collection;)V
    .locals 1
    .parameter
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/PostOptionsDialogActivity$Option;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 114
    .local p1, c:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/PostOptionsDialogActivity$Option;>;"
    iget-object v0, p0, Lco/vine/android/PostOptionsDialogActivity;->mArrayAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/ArrayAdapter;->addAll(Ljava/util/Collection;)V

    .line 115
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 120
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 67
    invoke-super {p0, p1}, Lco/vine/android/SupportListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 68
    const v5, 0x7f030047

    invoke-virtual {p0, v5}, Lco/vine/android/PostOptionsDialogActivity;->setContentView(I)V

    .line 69
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 71
    .local v0, b:Landroid/os/Bundle;
    const-string v5, "post_twitter"

    invoke-virtual {v0, v5, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mPostTwitter:Z

    .line 72
    const-string v5, "post_facebook"

    invoke-virtual {v0, v5, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mPostFacebook:Z

    .line 73
    const-string v5, "share_other"

    invoke-virtual {v0, v5, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mShareOther:Z

    .line 74
    const-string v5, "report"

    invoke-virtual {v0, v5, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mReport:Z

    .line 75
    const-string v5, "delete"

    invoke-virtual {v0, v5, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mDelete:Z

    .line 76
    const-string v5, "post_id"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mPostId:J

    .line 77
    const-string v5, "name"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mName:Ljava/lang/String;

    .line 79
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 80
    .local v4, res:Landroid/content/res/Resources;
    new-instance v5, Lco/vine/android/PostOptionsDialogActivity$OptionArrayAdapter;

    const v6, 0x7f030049

    invoke-direct {v5, p0, p0, v6}, Lco/vine/android/PostOptionsDialogActivity$OptionArrayAdapter;-><init>(Lco/vine/android/PostOptionsDialogActivity;Landroid/content/Context;I)V

    iput-object v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mArrayAdapter:Landroid/widget/ArrayAdapter;

    .line 82
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v3, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/PostOptionsDialogActivity$Option;>;"
    iget-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mPostTwitter:Z

    if-eqz v5, :cond_0

    .line 84
    new-instance v5, Lco/vine/android/PostOptionsDialogActivity$Option;

    const v6, 0x7f0e019d

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v7, v6}, Lco/vine/android/PostOptionsDialogActivity$Option;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    :cond_0
    iget-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mPostFacebook:Z

    if-eqz v5, :cond_1

    .line 87
    new-instance v5, Lco/vine/android/PostOptionsDialogActivity$Option;

    const/4 v6, 0x2

    const v7, 0x7f0e018f

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lco/vine/android/PostOptionsDialogActivity$Option;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    :cond_1
    iget-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mShareOther:Z

    if-eqz v5, :cond_2

    .line 90
    new-instance v5, Lco/vine/android/PostOptionsDialogActivity$Option;

    const/4 v6, 0x3

    const v7, 0x7f0e0193

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lco/vine/android/PostOptionsDialogActivity$Option;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    :cond_2
    iget-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mReport:Z

    if-eqz v5, :cond_3

    .line 93
    new-instance v5, Lco/vine/android/PostOptionsDialogActivity$Option;

    const/4 v6, 0x4

    const v7, 0x7f0e013b

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lco/vine/android/PostOptionsDialogActivity$Option;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    :cond_3
    iget-boolean v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mDelete:Z

    if-eqz v5, :cond_4

    .line 96
    new-instance v5, Lco/vine/android/PostOptionsDialogActivity$Option;

    const/4 v6, 0x5

    const v7, 0x7f0e0093

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lco/vine/android/PostOptionsDialogActivity$Option;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    :cond_4
    new-instance v5, Lco/vine/android/PostOptionsDialogActivity$Option;

    const/4 v6, 0x6

    const v7, 0x7f0e0052

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lco/vine/android/PostOptionsDialogActivity$Option;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xe

    if-lt v5, v6, :cond_6

    .line 100
    invoke-direct {p0, v3}, Lco/vine/android/PostOptionsDialogActivity;->addAll(Ljava/util/Collection;)V

    .line 107
    :cond_5
    iget-object v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mArrayAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {p0, v5}, Lco/vine/android/PostOptionsDialogActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 108
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->getListView()Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v5, v8}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 109
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->getListView()Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->getListAdapter()Landroid/widget/ListAdapter;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 110
    return-void

    .line 102
    :cond_6
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/PostOptionsDialogActivity$Option;

    .line 103
    .local v2, item:Lco/vine/android/PostOptionsDialogActivity$Option;
    iget-object v5, p0, Lco/vine/android/PostOptionsDialogActivity;->mArrayAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v5, v2}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 5
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    const/4 v4, -0x1

    .line 179
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 180
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "post_id"

    iget-wide v2, p0, Lco/vine/android/PostOptionsDialogActivity;->mPostId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 181
    packed-switch p2, :pswitch_data_0

    .line 211
    :goto_0
    return-void

    .line 183
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    goto :goto_0

    .line 185
    :pswitch_1
    const-string v1, "action_report"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 186
    invoke-virtual {p0, v4, v0}, Lco/vine/android/PostOptionsDialogActivity;->setResult(ILandroid/content/Intent;)V

    .line 187
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->finish()V

    goto :goto_0

    .line 197
    :pswitch_2
    packed-switch p3, :pswitch_data_2

    goto :goto_0

    .line 199
    :pswitch_3
    const-string v1, "action_delete"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 200
    invoke-virtual {p0, v4, v0}, Lco/vine/android/PostOptionsDialogActivity;->setResult(ILandroid/content/Intent;)V

    .line 201
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->finish()V

    goto :goto_0

    .line 181
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 183
    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_1
    .end packed-switch

    .line 197
    :pswitch_data_2
    .packed-switch -0x1
        :pswitch_3
    .end packed-switch
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 7
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    const v4, 0x7f0e0052

    const/4 v6, -0x1

    .line 124
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 125
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 126
    .local v1, optionId:I
    packed-switch v1, :pswitch_data_0

    .line 175
    :goto_0
    return-void

    .line 128
    :pswitch_0
    const-string v3, "action_twitter"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    invoke-virtual {p0, v6, v0}, Lco/vine/android/PostOptionsDialogActivity;->setResult(ILandroid/content/Intent;)V

    .line 130
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->finish()V

    goto :goto_0

    .line 134
    :pswitch_1
    const-string v3, "action_facebook"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    invoke-virtual {p0, v6, v0}, Lco/vine/android/PostOptionsDialogActivity;->setResult(ILandroid/content/Intent;)V

    .line 136
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->finish()V

    goto :goto_0

    .line 140
    :pswitch_2
    const-string v3, "post_id"

    iget-wide v4, p0, Lco/vine/android/PostOptionsDialogActivity;->mPostId:J

    invoke-virtual {v0, v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 141
    const-string v3, "action_other"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 142
    invoke-virtual {p0, v6, v0}, Lco/vine/android/PostOptionsDialogActivity;->setResult(ILandroid/content/Intent;)V

    .line 143
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->finish()V

    goto :goto_0

    .line 147
    :pswitch_3
    const/4 v3, 0x1

    invoke-static {v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v2

    .line 149
    .local v2, promptDialogFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    invoke-virtual {v2, p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setListener(Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;)V

    .line 150
    const v3, 0x7f0e013c

    invoke-virtual {v2, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 151
    const v3, 0x7f0e013b

    invoke-virtual {v2, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 152
    invoke-virtual {v2, v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNeutralButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 153
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v2, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0

    .line 157
    .end local v2           #promptDialogFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :pswitch_4
    const/4 v3, 0x2

    invoke-static {v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v2

    .line 159
    .restart local v2       #promptDialogFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    invoke-virtual {v2, p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setListener(Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;)V

    .line 160
    const v3, 0x7f0e008f

    invoke-virtual {v2, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 161
    const v3, 0x7f0e0093

    invoke-virtual {v2, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 162
    invoke-virtual {v2, v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNeutralButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 163
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v2, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0

    .line 167
    .end local v2           #promptDialogFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :pswitch_5
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v0}, Lco/vine/android/PostOptionsDialogActivity;->setResult(ILandroid/content/Intent;)V

    .line 168
    invoke-virtual {p0}, Lco/vine/android/PostOptionsDialogActivity;->finish()V

    goto :goto_0

    .line 126
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
