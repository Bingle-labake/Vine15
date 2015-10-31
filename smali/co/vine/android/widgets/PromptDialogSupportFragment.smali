.class public Lco/vine/android/widgets/PromptDialogSupportFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "PromptDialogSupportFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;
    }
.end annotation


# static fields
.field private static final ARG_DIALOG_ICON:Ljava/lang/String; = "icon"

.field private static final ARG_DIALOG_ID:Ljava/lang/String; = "id"

.field private static final ARG_DIALOG_ITEMS:Ljava/lang/String; = "items"

.field private static final ARG_DIALOG_ITEMS_STRING:Ljava/lang/String; = "items_string"

.field private static final ARG_DIALOG_MESSAGE:Ljava/lang/String; = "message"

.field private static final ARG_DIALOG_NEGATIVE_BUTTON:Ljava/lang/String; = "negative_button"

.field private static final ARG_DIALOG_NEUTRAL_BUTTON:Ljava/lang/String; = "neutral_button"

.field private static final ARG_DIALOG_POSITIVE_BUTTON:Ljava/lang/String; = "positive_button"

.field private static final ARG_DIALOG_TITLE:Ljava/lang/String; = "title"


# instance fields
.field private mListener:Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 38
    return-void
.end method

.method public static newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;
    .locals 3
    .parameter "id"

    .prologue
    .line 43
    new-instance v1, Lco/vine/android/widgets/PromptDialogSupportFragment;

    invoke-direct {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;-><init>()V

    .line 45
    .local v1, f:Lco/vine/android/widgets/PromptDialogSupportFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 46
    .local v0, bundle:Landroid/os/Bundle;
    const-string v2, "id"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 47
    invoke-virtual {v1, v0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setArguments(Landroid/os/Bundle;)V

    .line 49
    return-object v1
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .parameter "activity"

    .prologue
    .line 54
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 56
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getTargetFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 57
    .local v0, targetFragment:Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_1

    .line 58
    instance-of v1, v0, Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;

    if-eqz v1, :cond_0

    .line 59
    check-cast v0, Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;

    .end local v0           #targetFragment:Landroid/support/v4/app/Fragment;
    iput-object v0, p0, Lco/vine/android/widgets/PromptDialogSupportFragment;->mListener:Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;

    .line 64
    .end local p1
    :cond_0
    :goto_0
    return-void

    .line 61
    .restart local v0       #targetFragment:Landroid/support/v4/app/Fragment;
    .restart local p1
    :cond_1
    instance-of v1, p1, Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;

    if-eqz v1, :cond_0

    .line 62
    check-cast p1, Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;

    .end local p1
    iput-object p1, p0, Lco/vine/android/widgets/PromptDialogSupportFragment;->mListener:Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;

    goto :goto_0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 113
    iget-object v0, p0, Lco/vine/android/widgets/PromptDialogSupportFragment;->mListener:Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lco/vine/android/widgets/PromptDialogSupportFragment;->mListener:Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;

    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, p1, v1, p2}, Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;->onDialogDone(Landroid/content/DialogInterface;II)V

    .line 116
    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 68
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    .line 70
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 71
    .local v0, args:Landroid/os/Bundle;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_8

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const/4 v3, 0x2

    invoke-direct {v1, v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 77
    .local v1, builder:Landroid/app/AlertDialog$Builder;
    :goto_0
    const-string v2, "icon"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 78
    const-string v2, "icon"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 81
    :cond_0
    const-string v2, "title"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 82
    const-string v2, "title"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 85
    :cond_1
    const-string v2, "message"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 86
    const-string v2, "message"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 89
    :cond_2
    const-string v2, "positive_button"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 90
    const-string v2, "positive_button"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 93
    :cond_3
    const-string v2, "neutral_button"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 94
    const-string v2, "neutral_button"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2, p0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 97
    :cond_4
    const-string v2, "negative_button"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 98
    const-string v2, "negative_button"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 101
    :cond_5
    const-string v2, "items"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 102
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "items"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 105
    :cond_6
    const-string v2, "items_string"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 106
    const-string v2, "items_string"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 109
    :cond_7
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    return-object v2

    .line 71
    .end local v1           #builder:Landroid/app/AlertDialog$Builder;
    :cond_8
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    goto/16 :goto_0
.end method

.method public setIcon(I)Lco/vine/android/widgets/PromptDialogSupportFragment;
    .locals 2
    .parameter "icon"

    .prologue
    .line 123
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "icon"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 124
    return-object p0
.end method

.method public setItems(I)Lco/vine/android/widgets/PromptDialogSupportFragment;
    .locals 2
    .parameter "items"

    .prologue
    .line 138
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "items"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 139
    return-object p0
.end method

.method public setItems([Ljava/lang/String;)Lco/vine/android/widgets/PromptDialogSupportFragment;
    .locals 2
    .parameter "items"

    .prologue
    .line 143
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "items_string"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 144
    return-object p0
.end method

.method public setListener(Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 119
    iput-object p1, p0, Lco/vine/android/widgets/PromptDialogSupportFragment;->mListener:Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;

    .line 120
    return-void
.end method

.method public setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;
    .locals 2
    .parameter "message"

    .prologue
    .line 133
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "message"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 134
    return-object p0
.end method

.method public setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;
    .locals 2
    .parameter "negativeButton"

    .prologue
    .line 158
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "negative_button"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 159
    return-object p0
.end method

.method public setNeutralButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;
    .locals 2
    .parameter "neutralButton"

    .prologue
    .line 153
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "neutral_button"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 154
    return-object p0
.end method

.method public setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;
    .locals 2
    .parameter "positiveButton"

    .prologue
    .line 148
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "positive_button"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 149
    return-object p0
.end method

.method public setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;
    .locals 2
    .parameter "title"

    .prologue
    .line 128
    invoke-virtual {p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 129
    return-object p0
.end method

.method public show(Landroid/support/v4/app/FragmentManager;)V
    .locals 1
    .parameter "fragmentManager"

    .prologue
    .line 163
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 164
    return-void
.end method
