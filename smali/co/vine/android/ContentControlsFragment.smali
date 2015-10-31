.class public Lco/vine/android/ContentControlsFragment;
.super Lco/vine/android/BaseControllerFragment;
.source "ContentControlsFragment.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/ContentControlsFragment$ContentControlsListener;
    }
.end annotation


# static fields
.field private static final DIALOG_MAKE_EXPLICIT:I = 0x3

.field private static final DIALOG_MAKE_UNEXPLICIT:I = 0x4

.field private static final DIALOG_PROTECT_POSTS:I = 0x1

.field private static final DIALOG_UNPROTECT_POSTS:I = 0x2

.field private static final STATE_EXPLICIT:Ljava/lang/String; = "state_explicit"

.field private static final STATE_PRIVATE:Ljava/lang/String; = "state_private"


# instance fields
.field private mExplicit:Z

.field private mExplicitIcon:Landroid/widget/ImageView;

.field private mExplicitSwitch:Lco/vine/android/views/SwitchInterface;

.field private mPrivate:Z

.field private mPrivateIcon:Landroid/widget/ImageView;

.field private mPrivateSwitch:Lco/vine/android/views/SwitchInterface;

.field private mProgress:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lco/vine/android/BaseControllerFragment;-><init>()V

    .line 249
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/ContentControlsFragment;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;

    return-object v0
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5
    .parameter "compoundButton"
    .parameter "on"

    .prologue
    const v4, 0x7f0e0052

    const/4 v3, 0x0

    .line 194
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 247
    :goto_0
    return-void

    .line 196
    :sswitch_0
    if-eqz p2, :cond_0

    .line 197
    iget-object v1, p0, Lco/vine/android/ContentControlsFragment;->mPrivateIcon:Landroid/widget/ImageView;

    const v2, 0x7f020184

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 198
    const/4 v1, 0x1

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v0

    .line 200
    .local v0, p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v1, 0x7f0e0079

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 201
    const v1, 0x7f0e007a

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 202
    invoke-virtual {v0, v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 203
    const v1, 0x7f0e0078

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 204
    invoke-virtual {v0, p0, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 205
    invoke-virtual {p0}, Lco/vine/android/ContentControlsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0

    .line 207
    .end local v0           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_0
    iget-object v1, p0, Lco/vine/android/ContentControlsFragment;->mPrivateIcon:Landroid/widget/ImageView;

    const v2, 0x7f020183

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 208
    const/4 v1, 0x2

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v0

    .line 210
    .restart local v0       #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v1, 0x7f0e0080

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 211
    const v1, 0x7f0e0081

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 212
    invoke-virtual {v0, v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 213
    const v1, 0x7f0e007f

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 214
    invoke-virtual {v0, p0, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 215
    invoke-virtual {p0}, Lco/vine/android/ContentControlsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0

    .line 220
    .end local v0           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :sswitch_1
    if-eqz p2, :cond_1

    .line 221
    iget-object v1, p0, Lco/vine/android/ContentControlsFragment;->mExplicitIcon:Landroid/widget/ImageView;

    const v2, 0x7f020182

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 222
    const/4 v1, 0x3

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v0

    .line 224
    .restart local v0       #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v1, 0x7f0e0074

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 225
    const v1, 0x7f0e0075

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 226
    invoke-virtual {v0, v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 227
    const v1, 0x7f0e0076

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 228
    invoke-virtual {v0, p0, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 229
    invoke-virtual {p0}, Lco/vine/android/ContentControlsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto/16 :goto_0

    .line 231
    .end local v0           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_1
    iget-object v1, p0, Lco/vine/android/ContentControlsFragment;->mExplicitIcon:Landroid/widget/ImageView;

    const v2, 0x7f020181

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 232
    const/4 v1, 0x4

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v0

    .line 234
    .restart local v0       #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v1, 0x7f0e007c

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 235
    const v1, 0x7f0e007d

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 236
    invoke-virtual {v0, v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 237
    const v1, 0x7f0e007e

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 238
    invoke-virtual {v0, p0, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 239
    invoke-virtual {p0}, Lco/vine/android/ContentControlsFragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto/16 :goto_0

    .line 194
    :sswitch_data_0
    .sparse-switch
        0x7f0a0067 -> :sswitch_0
        0x7f0a006b -> :sswitch_1
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x0

    .line 47
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 48
    new-instance v2, Lco/vine/android/ContentControlsFragment$ContentControlsListener;

    invoke-direct {v2, p0}, Lco/vine/android/ContentControlsFragment$ContentControlsListener;-><init>(Lco/vine/android/ContentControlsFragment;)V

    iput-object v2, p0, Lco/vine/android/ContentControlsFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 50
    if-eqz p1, :cond_0

    .line 51
    const-string v2, "state_private"

    invoke-virtual {p1, v2, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mPrivate:Z

    .line 52
    const-string v2, "state_explicit"

    invoke-virtual {p1, v2, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mExplicit:Z

    .line 58
    :goto_0
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/ContentControlsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const v3, 0x7f0f0028

    invoke-direct {v1, v2, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 59
    .local v1, prog:Landroid/app/ProgressDialog;
    const v2, 0x7f0e0083

    invoke-virtual {p0, v2}, Lco/vine/android/ContentControlsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 60
    invoke-virtual {v1, v4}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 61
    iput-object v1, p0, Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 62
    return-void

    .line 54
    .end local v1           #prog:Landroid/app/ProgressDialog;
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/ContentControlsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 55
    .local v0, prefs:Landroid/content/SharedPreferences;
    const-string v2, "settings_private"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mPrivate:Z

    .line 56
    const-string v2, "settings_explicit"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mExplicit:Z

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 74
    const v0, 0x7f030022

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 5
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 113
    packed-switch p2, :pswitch_data_0

    .line 190
    :goto_0
    return-void

    .line 115
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    .line 123
    iput-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mPrivate:Z

    .line 124
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mPrivateIcon:Landroid/widget/ImageView;

    const v1, 0x7f020183

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 125
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mPrivateSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, v4}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 126
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mPrivateSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, v2}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 127
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mPrivateSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, p0}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_0

    .line 117
    :pswitch_1
    iput-boolean v3, p0, Lco/vine/android/ContentControlsFragment;->mPrivate:Z

    .line 118
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 119
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ContentControlsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Lco/vine/android/client/AppController;->updatePrivate(Lco/vine/android/client/Session;Z)Ljava/lang/String;

    goto :goto_0

    .line 134
    :pswitch_2
    packed-switch p3, :pswitch_data_2

    .line 142
    iput-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mPrivate:Z

    .line 143
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mPrivateIcon:Landroid/widget/ImageView;

    const v1, 0x7f020184

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 144
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mPrivateSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, v4}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 145
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mPrivateSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, v3}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 146
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mPrivateSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, p0}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_0

    .line 136
    :pswitch_3
    iput-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mPrivate:Z

    .line 137
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 138
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ContentControlsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/client/AppController;->updatePrivate(Lco/vine/android/client/Session;Z)Ljava/lang/String;

    goto :goto_0

    .line 152
    :pswitch_4
    packed-switch p3, :pswitch_data_3

    .line 160
    iput-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mExplicit:Z

    .line 161
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mExplicitIcon:Landroid/widget/ImageView;

    const v1, 0x7f020181

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 162
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mExplicitSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, v4}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 163
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mExplicitSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, v2}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 164
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mExplicitSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, p0}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_0

    .line 154
    :pswitch_5
    iput-boolean v3, p0, Lco/vine/android/ContentControlsFragment;->mExplicit:Z

    .line 155
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 156
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ContentControlsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Lco/vine/android/client/AppController;->updateExplicit(Lco/vine/android/client/Session;Z)Ljava/lang/String;

    goto/16 :goto_0

    .line 171
    :pswitch_6
    packed-switch p3, :pswitch_data_4

    .line 179
    iput-boolean v3, p0, Lco/vine/android/ContentControlsFragment;->mExplicit:Z

    .line 180
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mExplicitIcon:Landroid/widget/ImageView;

    const v1, 0x7f020182

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 181
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mExplicitSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, v4}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 182
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mExplicitSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, v3}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 183
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mExplicitSwitch:Lco/vine/android/views/SwitchInterface;

    invoke-interface {v0, p0}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto/16 :goto_0

    .line 173
    :pswitch_7
    iput-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mExplicit:Z

    .line 174
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 175
    iget-object v0, p0, Lco/vine/android/ContentControlsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ContentControlsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/client/AppController;->updateExplicit(Lco/vine/android/client/Session;Z)Ljava/lang/String;

    goto/16 :goto_0

    .line 113
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_6
    .end packed-switch

    .line 115
    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_1
    .end packed-switch

    .line 134
    :pswitch_data_2
    .packed-switch -0x1
        :pswitch_3
    .end packed-switch

    .line 152
    :pswitch_data_3
    .packed-switch -0x1
        :pswitch_5
    .end packed-switch

    .line 171
    :pswitch_data_4
    .packed-switch -0x1
        :pswitch_7
    .end packed-switch
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 66
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 67
    const-string v0, "state_private"

    iget-boolean v1, p0, Lco/vine/android/ContentControlsFragment;->mPrivate:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 68
    const-string v0, "state_explicit"

    iget-boolean v1, p0, Lco/vine/android/ContentControlsFragment;->mExplicit:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 69
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 6
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x1

    .line 79
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseControllerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 80
    const v2, 0x7f0a0067

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lco/vine/android/views/SwitchInterface;

    .line 81
    .local v1, pSwitch:Lco/vine/android/views/SwitchInterface;
    const v2, 0x7f0a006b

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/views/SwitchInterface;

    .line 83
    .local v0, eSwitch:Lco/vine/android/views/SwitchInterface;
    const v2, 0x7f0a0066

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lco/vine/android/ContentControlsFragment;->mPrivateIcon:Landroid/widget/ImageView;

    .line 84
    iget-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mPrivate:Z

    if-eqz v2, :cond_0

    .line 85
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment;->mPrivateIcon:Landroid/widget/ImageView;

    const v3, 0x7f020184

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 86
    invoke-interface {v1, v4}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    .line 91
    :goto_0
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 92
    const v2, 0x7f0a0068

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 93
    const v2, 0x7f0a006c

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 104
    :goto_1
    invoke-interface {v1, p0}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 105
    invoke-interface {v0, p0}, Lco/vine/android/views/SwitchInterface;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 107
    iput-object v1, p0, Lco/vine/android/ContentControlsFragment;->mPrivateSwitch:Lco/vine/android/views/SwitchInterface;

    .line 108
    iput-object v0, p0, Lco/vine/android/ContentControlsFragment;->mExplicitSwitch:Lco/vine/android/views/SwitchInterface;

    .line 109
    return-void

    .line 88
    :cond_0
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment;->mPrivateIcon:Landroid/widget/ImageView;

    const v3, 0x7f020183

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 95
    :cond_1
    const v2, 0x7f0a006a

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lco/vine/android/ContentControlsFragment;->mExplicitIcon:Landroid/widget/ImageView;

    .line 96
    iget-boolean v2, p0, Lco/vine/android/ContentControlsFragment;->mExplicit:Z

    if-eqz v2, :cond_2

    .line 97
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment;->mExplicitIcon:Landroid/widget/ImageView;

    const v3, 0x7f020182

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 98
    invoke-interface {v0, v4}, Lco/vine/android/views/SwitchInterface;->setChecked(Z)V

    goto :goto_1

    .line 100
    :cond_2
    iget-object v2, p0, Lco/vine/android/ContentControlsFragment;->mExplicitIcon:Landroid/widget/ImageView;

    const v3, 0x7f020181

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1
.end method
