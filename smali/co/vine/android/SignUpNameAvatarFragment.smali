.class public Lco/vine/android/SignUpNameAvatarFragment;
.super Lco/vine/android/BaseControllerFragment;
.source "SignUpNameAvatarFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/view/View$OnClickListener;
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;
.implements Lco/vine/android/SetThumbnailTask$SetThumbnailListener;
.implements Lco/vine/android/ImagePicker$Listener;
.implements Lco/vine/android/util/ContactsHelper$ContactHelperListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;
    }
.end annotation


# static fields
.field public static final ARG_LOGIN:Ljava/lang/String; = "user"

.field private static final DIALOG_REMOVE_TAKE_OR_CHOOSE_PHOTO:I = 0x3

.field private static final DIALOG_SET_PHOTO_OR_SKIP:I = 0x1

.field private static final DIALOG_TAKE_OR_CHOOSE_PHOTO:I = 0x2

.field public static final REQUEST_CODE_CHOOSE_PHOTO:I = 0x3

.field public static final REQUEST_CODE_CROP:I = 0x2

.field public static final REQUEST_CODE_TAKE_PHOTO:I = 0x1

.field private static final STATE_PROFILE_URI:Ljava/lang/String; = "state_pi"


# instance fields
.field private mHasPromptedForPhoto:Z

.field private mImagePicker:Lco/vine/android/ImagePicker;

.field private mLogin:Lco/vine/android/api/VineLogin;

.field private mName:Landroid/widget/EditText;

.field private mNextButton:Landroid/view/MenuItem;

.field private mPhoneNumber:Landroid/widget/EditText;

.field private mPhoneNumberContainer:Landroid/widget/RelativeLayout;

.field private mPhotoAttached:Z

.field private mProfileImage:Landroid/widget/ImageView;

.field private mProfileUri:Landroid/net/Uri;

.field private mProgress:Landroid/app/Dialog;

.field private mTwitterUser:Lco/vine/android/api/TwitterUser;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lco/vine/android/BaseControllerFragment;-><init>()V

    .line 406
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$100(Lco/vine/android/SignUpNameAvatarFragment;ILandroid/view/View;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lco/vine/android/SignUpNameAvatarFragment;->onEditorActionClicked(ILandroid/view/View;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumber:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/RelativeLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumberContainer:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$402(Lco/vine/android/SignUpNameAvatarFragment;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    iput-object p1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    return-object p1
.end method

.method static synthetic access$500(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$602(Lco/vine/android/SignUpNameAvatarFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    iput-boolean p1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhotoAttached:Z

    return p1
.end method

.method static synthetic access$700(Lco/vine/android/SignUpNameAvatarFragment;)Lco/vine/android/ImagePicker;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    return-object v0
.end method

.method static synthetic access$800(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/app/Dialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$902(Lco/vine/android/SignUpNameAvatarFragment;Lco/vine/android/api/TwitterUser;)Lco/vine/android/api/TwitterUser;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 49
    iput-object p1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    return-object p1
.end method

.method private addPhoto()V
    .locals 6

    .prologue
    const v5, 0x7f0e01bb

    const v4, 0x7f0e01a2

    const v3, 0x7f0e0055

    const/4 v2, 0x0

    .line 266
    iget-boolean v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhotoAttached:Z

    if-eqz v1, :cond_0

    .line 267
    const/4 v1, 0x3

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v0

    .line 269
    .local v0, p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    invoke-virtual {v0, p0, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 270
    invoke-virtual {v0, v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    const v2, 0x7f0e013a

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    invoke-virtual {v1, v5}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNeutralButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    invoke-virtual {v1, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    .line 284
    :goto_0
    return-void

    .line 276
    .end local v0           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_0
    const/4 v1, 0x2

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v0

    .line 278
    .restart local v0       #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    invoke-virtual {v0, p0, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 279
    invoke-virtual {v0, v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    invoke-virtual {v1, v5}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    invoke-virtual {v1, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNeutralButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0
.end method

.method private nextClicked()V
    .locals 3

    .prologue
    .line 188
    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/SignUpPagerActivity;

    .line 189
    .local v0, activity:Lco/vine/android/SignUpPagerActivity;
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setName(Ljava/lang/String;)V

    .line 190
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumber:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setPhone(Ljava/lang/String;)V

    .line 191
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setProfile(Landroid/net/Uri;)V

    .line 192
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lco/vine/android/api/TwitterUser;->name:Ljava/lang/String;

    .line 194
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setTwitterUser(Lco/vine/android/api/TwitterUser;)V

    .line 196
    :cond_0
    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->toNextStep()V

    .line 197
    return-void
.end method

.method private onEditorActionClicked(ILandroid/view/View;)Z
    .locals 4
    .parameter "actionId"
    .parameter "v"

    .prologue
    .line 113
    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 114
    .local v0, activity:Landroid/support/v4/app/FragmentActivity;
    if-eqz v0, :cond_0

    const/4 v2, 0x6

    if-ne p1, v2, :cond_0

    invoke-direct {p0}, Lco/vine/android/SignUpNameAvatarFragment;->validate()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 115
    const-string v2, "input_method"

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 117
    .local v1, imm:Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 118
    invoke-direct {p0, v0}, Lco/vine/android/SignUpNameAvatarFragment;->onNextClicked(Landroid/app/Activity;)Z

    .line 120
    .end local v1           #imm:Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    const/4 v2, 0x1

    return v2
.end method

.method private onNextClicked(Landroid/app/Activity;)Z
    .locals 3
    .parameter "a"

    .prologue
    .line 212
    invoke-direct {p0}, Lco/vine/android/SignUpNameAvatarFragment;->showProfilePhotoPrompt()Z

    move-result v1

    if-nez v1, :cond_1

    move-object v0, p1

    .line 213
    check-cast v0, Lco/vine/android/SignUpPagerActivity;

    .line 214
    .local v0, activity:Lco/vine/android/SignUpPagerActivity;
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setName(Ljava/lang/String;)V

    .line 215
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumber:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setPhone(Ljava/lang/String;)V

    .line 216
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    invoke-virtual {v1}, Lco/vine/android/ImagePicker;->getSavedImageUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setProfile(Landroid/net/Uri;)V

    .line 217
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    if-eqz v1, :cond_0

    .line 218
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lco/vine/android/api/TwitterUser;->name:Ljava/lang/String;

    .line 219
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setTwitterUser(Lco/vine/android/api/TwitterUser;)V

    .line 221
    :cond_0
    invoke-direct {p0}, Lco/vine/android/SignUpNameAvatarFragment;->nextClicked()V

    .line 223
    .end local v0           #activity:Lco/vine/android/SignUpPagerActivity;
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method private showProfilePhotoPrompt()Z
    .locals 6

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 169
    iget-object v4, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    if-nez v4, :cond_0

    iget-boolean v4, p0, Lco/vine/android/SignUpNameAvatarFragment;->mHasPromptedForPhoto:Z

    if-nez v4, :cond_0

    iget-boolean v4, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhotoAttached:Z

    if-nez v4, :cond_0

    .line 170
    invoke-static {v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v4

    const v5, 0x7f0e0135

    invoke-virtual {v4, v5}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v4

    const v5, 0x7f0e0154

    invoke-virtual {v4, v5}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v4

    const v5, 0x7f0e01a9

    invoke-virtual {v4, v5}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    .line 175
    .local v1, promptDialogSupportFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    invoke-virtual {v1, p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setListener(Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;)V

    .line 177
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v1, v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    iput-boolean v2, p0, Lco/vine/android/SignUpNameAvatarFragment;->mHasPromptedForPhoto:Z

    .line 184
    .end local v1           #promptDialogSupportFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :goto_0
    return v2

    .line 178
    .restart local v1       #promptDialogSupportFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/IllegalStateException;
    move v2, v3

    .line 179
    goto :goto_0

    .end local v0           #e:Ljava/lang/IllegalStateException;
    .end local v1           #promptDialogSupportFragment:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_0
    move v2, v3

    .line 184
    goto :goto_0
.end method

.method private validate()Z
    .locals 2

    .prologue
    .line 262
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .parameter "editable"

    .prologue
    .line 236
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mNextButton:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 237
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mNextButton:Landroid/view/MenuItem;

    invoke-direct {p0}, Lco/vine/android/SignUpNameAvatarFragment;->validate()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 239
    :cond_0
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "charSequence"
    .parameter "i"
    .parameter "i2"
    .parameter "i3"

    .prologue
    .line 228
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "extras"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 288
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseControllerFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 289
    packed-switch p1, :pswitch_data_0

    .line 321
    :cond_0
    :goto_0
    return-void

    .line 292
    :pswitch_0
    if-ne p2, v3, :cond_2

    .line 294
    if-ne p1, v4, :cond_1

    .line 295
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    .line 299
    .local v2, uri:Landroid/net/Uri;
    :goto_1
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    const-class v5, Lco/vine/android/EditProfileCropActivity;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v4, "uri"

    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v1

    .line 301
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v1, v4}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 297
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #uri:Landroid/net/Uri;
    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .restart local v2       #uri:Landroid/net/Uri;
    goto :goto_1

    .line 303
    .end local v2           #uri:Landroid/net/Uri;
    :cond_2
    iput-object v5, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    goto :goto_0

    .line 308
    :pswitch_1
    if-ne p2, v3, :cond_3

    if-eqz p3, :cond_3

    .line 309
    const-string v3, "uri"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    .line 310
    .local v0, croppedUri:Landroid/net/Uri;
    if-eqz v0, :cond_0

    .line 311
    iget-object v3, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    invoke-static {v3}, Lco/vine/android/util/image/ImageUtils;->deleteTempPic(Landroid/net/Uri;)Z

    .line 312
    iput-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    .line 313
    new-instance v3, Lco/vine/android/SetThumbnailTask;

    invoke-direct {v3, p0}, Lco/vine/android/SetThumbnailTask;-><init>(Landroid/support/v4/app/Fragment;)V

    new-array v4, v4, [Landroid/net/Uri;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {v3, v4}, Lco/vine/android/SetThumbnailTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 316
    .end local v0           #croppedUri:Landroid/net/Uri;
    :cond_3
    iput-object v5, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    goto :goto_0

    .line 289
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 330
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 335
    :goto_0
    return-void

    .line 332
    :pswitch_0
    invoke-direct {p0}, Lco/vine/android/SignUpNameAvatarFragment;->addPhoto()V

    goto :goto_0

    .line 330
    :pswitch_data_0
    .packed-switch 0x7f0a0176
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 83
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 84
    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mAppController:Lco/vine/android/client/AppController;

    .line 86
    if-eqz p1, :cond_0

    const-string v1, "state_pi"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    const-string v1, "state_pi"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    iput-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    .line 88
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    if-eqz v1, :cond_0

    .line 89
    new-instance v1, Lco/vine/android/SetThumbnailTask;

    invoke-direct {v1, p0}, Lco/vine/android/SetThumbnailTask;-><init>(Landroid/support/v4/app/Fragment;)V

    new-array v2, v5, [Landroid/net/Uri;

    iget-object v3, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lco/vine/android/SetThumbnailTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 93
    :cond_0
    invoke-virtual {p0, v5}, Lco/vine/android/SignUpNameAvatarFragment;->setHasOptionsMenu(Z)V

    .line 94
    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lco/vine/android/SignUpPagerActivity;

    const v2, 0x7f0e00e2

    invoke-virtual {v1, v2}, Lco/vine/android/SignUpPagerActivity;->setBarTitle(I)V

    .line 96
    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 97
    .local v0, b:Landroid/os/Bundle;
    if-eqz v0, :cond_1

    const-string v1, "user"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 98
    const-string v1, "user"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineLogin;

    iput-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mLogin:Lco/vine/android/api/VineLogin;

    .line 100
    :cond_1
    new-instance v1, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;

    invoke-direct {v1, p0}, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;-><init>(Lco/vine/android/SignUpNameAvatarFragment;)V

    iput-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 101
    iput-boolean v4, p0, Lco/vine/android/SignUpNameAvatarFragment;->mHasPromptedForPhoto:Z

    .line 103
    new-instance v1, Lco/vine/android/ImagePicker;

    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/SignUpNameAvatarFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v3

    invoke-direct {v1, v2, p0, v3, v4}, Lco/vine/android/ImagePicker;-><init>(Landroid/app/Activity;Lco/vine/android/ImagePicker$Listener;J)V

    iput-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    .line 105
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 161
    const v0, 0x7f100008

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 162
    const v0, 0x7f0a018f

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mNextButton:Landroid/view/MenuItem;

    .line 163
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mNextButton:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mNextButton:Landroid/view/MenuItem;

    invoke-direct {p0}, Lco/vine/android/SignUpNameAvatarFragment;->validate()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 166
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .parameter "inflater"
    .parameter "root"
    .parameter "savedInstanceState"

    .prologue
    .line 109
    const v0, 0x7f030064

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 3
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    const/4 v2, 0x3

    const/4 v1, 0x1

    .line 339
    packed-switch p2, :pswitch_data_0

    .line 386
    :goto_0
    return-void

    .line 341
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    goto :goto_0

    .line 347
    :pswitch_1
    invoke-direct {p0}, Lco/vine/android/SignUpNameAvatarFragment;->nextClicked()V

    goto :goto_0

    .line 343
    :pswitch_2
    invoke-direct {p0}, Lco/vine/android/SignUpNameAvatarFragment;->addPhoto()V

    goto :goto_0

    .line 354
    :pswitch_3
    packed-switch p3, :pswitch_data_2

    :pswitch_4
    goto :goto_0

    .line 360
    :pswitch_5
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    invoke-virtual {v0, v2}, Lco/vine/android/ImagePicker;->chooseImage(I)V

    goto :goto_0

    .line 356
    :pswitch_6
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    invoke-virtual {v0, v1}, Lco/vine/android/ImagePicker;->captureImage(I)V

    goto :goto_0

    .line 367
    :pswitch_7
    packed-switch p3, :pswitch_data_3

    goto :goto_0

    .line 373
    :pswitch_8
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    invoke-virtual {v0, v1}, Lco/vine/android/ImagePicker;->captureImage(I)V

    goto :goto_0

    .line 369
    :pswitch_9
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/SignUpNameAvatarFragment;->setThumbnailImage(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 377
    :pswitch_a
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    invoke-virtual {v0, v2}, Lco/vine/android/ImagePicker;->chooseImage(I)V

    goto :goto_0

    .line 339
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_3
        :pswitch_7
    .end packed-switch

    .line 341
    :pswitch_data_1
    .packed-switch -0x2
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 354
    :pswitch_data_2
    .packed-switch -0x3
        :pswitch_5
        :pswitch_4
        :pswitch_6
    .end packed-switch

    .line 367
    :pswitch_data_3
    .packed-switch -0x3
        :pswitch_8
        :pswitch_a
        :pswitch_9
    .end packed-switch
.end method

.method public onEmailLoaded(Ljava/lang/String;)V
    .locals 0
    .parameter "email"

    .prologue
    .line 259
    return-void
.end method

.method public onNameLoaded(Ljava/lang/String;)V
    .locals 1
    .parameter "name"

    .prologue
    .line 244
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 245
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 247
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 201
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 206
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 203
    :pswitch_0
    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p0, v0}, Lco/vine/android/SignUpNameAvatarFragment;->onNextClicked(Landroid/app/Activity;)Z

    move-result v0

    goto :goto_0

    .line 201
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a018f
        :pswitch_0
    .end packed-switch
.end method

.method public onPhoneNumberLoaded(Ljava/lang/String;)V
    .locals 1
    .parameter "phoneNumber"

    .prologue
    .line 251
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumber:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumber:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 253
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumber:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 255
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 390
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 391
    const-string v0, "state_pi"

    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 392
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "charSequence"
    .parameter "i"
    .parameter "i2"
    .parameter "i3"

    .prologue
    .line 232
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    .line 125
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseControllerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 126
    const v1, 0x7f0a0177

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    .line 127
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 128
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;

    new-instance v2, Lco/vine/android/SignUpNameAvatarFragment$1;

    invoke-direct {v2, p0}, Lco/vine/android/SignUpNameAvatarFragment$1;-><init>(Lco/vine/android/SignUpNameAvatarFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 134
    const v1, 0x7f0a0152

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumberContainer:Landroid/widget/RelativeLayout;

    .line 136
    const v1, 0x7f0a0171

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumber:Landroid/widget/EditText;

    .line 137
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumber:Landroid/widget/EditText;

    invoke-virtual {v1, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 138
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumber:Landroid/widget/EditText;

    new-instance v2, Lco/vine/android/SignUpNameAvatarFragment$2;

    invoke-direct {v2, p0}, Lco/vine/android/SignUpNameAvatarFragment$2;-><init>(Lco/vine/android/SignUpNameAvatarFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 144
    const v1, 0x7f0a0176

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;

    .line 145
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mLogin:Lco/vine/android/api/VineLogin;

    if-eqz v1, :cond_0

    .line 148
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/SignUpNameAvatarFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0f0028

    invoke-direct {v0, v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 149
    .local v0, d:Landroid/app/ProgressDialog;
    const v1, 0x7f0e00d7

    invoke-virtual {p0, v1}, Lco/vine/android/SignUpNameAvatarFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 150
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 151
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 152
    iput-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;

    .line 153
    iget-object v1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment;->mLogin:Lco/vine/android/api/VineLogin;

    invoke-virtual {v1, v2}, Lco/vine/android/client/AppController;->fetchTwitterUser(Lco/vine/android/api/VineLogin;)Ljava/lang/String;

    .line 156
    .end local v0           #d:Landroid/app/ProgressDialog;
    :cond_0
    new-instance v1, Lco/vine/android/util/ContactsHelper;

    invoke-direct {v1, p0, p0}, Lco/vine/android/util/ContactsHelper;-><init>(Landroid/support/v4/app/Fragment;Lco/vine/android/util/ContactsHelper$ContactHelperListener;)V

    .line 157
    return-void
.end method

.method public setAvatarUrl(Landroid/net/Uri;)V
    .locals 0
    .parameter "url"

    .prologue
    .line 325
    iput-object p1, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;

    .line 326
    return-void
.end method

.method public setThumbnailImage(Landroid/graphics/Bitmap;)V
    .locals 4
    .parameter "bm"

    .prologue
    const/4 v3, 0x1

    .line 396
    if-eqz p1, :cond_0

    .line 397
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;

    new-instance v1, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 398
    iput-boolean v3, p0, Lco/vine/android/SignUpNameAvatarFragment;->mHasPromptedForPhoto:Z

    .line 399
    iput-boolean v3, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhotoAttached:Z

    .line 404
    :goto_0
    return-void

    .line 401
    :cond_0
    iget-object v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;

    const v1, 0x7f020076

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 402
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/SignUpNameAvatarFragment;->mPhotoAttached:Z

    goto :goto_0
.end method
