.class public Lco/vine/android/LoginActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "LoginActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/view/View$OnClickListener;
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/LoginActivity$LoginSessionListener;
    }
.end annotation


# static fields
.field private static final DIALOG_ACTIVATE_ACCOUNT:I = 0x1

.field public static final EXTRA_FINISH:Ljava/lang/String; = "finish"


# instance fields
.field private mFinish:Z

.field private mLoginButton:Landroid/view/MenuItem;

.field private mPassword:Landroid/widget/EditText;

.field private mUsername:Landroid/widget/EditText;

.field private mWidthResolved:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    .line 260
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/LoginActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    invoke-direct {p0}, Lco/vine/android/LoginActivity;->validate()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/LoginActivity;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lco/vine/android/LoginActivity;->mPassword:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/LoginActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lco/vine/android/LoginActivity;->login(Z)V

    return-void
.end method

.method static synthetic access$300(Lco/vine/android/LoginActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-boolean v0, p0, Lco/vine/android/LoginActivity;->mWidthResolved:Z

    return v0
.end method

.method static synthetic access$302(Lco/vine/android/LoginActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iput-boolean p1, p0, Lco/vine/android/LoginActivity;->mWidthResolved:Z

    return p1
.end method

.method public static getIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2
    .parameter "context"

    .prologue
    .line 53
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/LoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method public static getIntentWithFinish(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3
    .parameter "context"

    .prologue
    .line 57
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/LoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 58
    .local v0, i:Landroid/content/Intent;
    const-string v1, "finish"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 59
    return-object v0
.end method

.method private login(Z)V
    .locals 9
    .parameter "reactivate"

    .prologue
    const/4 v1, 0x0

    .line 174
    iget-object v3, p0, Lco/vine/android/LoginActivity;->mUsername:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 175
    .local v2, username:Ljava/lang/String;
    iget-object v3, p0, Lco/vine/android/LoginActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 176
    .local v7, password:Ljava/lang/String;
    new-instance v6, Landroid/app/ProgressDialog;

    const v3, 0x7f0f0028

    invoke-direct {v6, p0, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 177
    .local v6, dialog:Landroid/app/ProgressDialog;
    const/4 v3, 0x0

    invoke-virtual {v6, v3}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 178
    const v3, 0x7f0e00de

    invoke-virtual {p0, v3}, Lco/vine/android/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 180
    :try_start_0
    invoke-virtual {v6}, Landroid/app/ProgressDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    :goto_0
    iput-object v6, p0, Lco/vine/android/LoginActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 186
    iget-object v3, p0, Lco/vine/android/LoginActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3, v2}, Lco/vine/android/client/AppController;->getSession(Ljava/lang/String;)Lco/vine/android/client/Session;

    move-result-object v8

    .line 187
    .local v8, s:Lco/vine/android/client/Session;
    new-instance v0, Lco/vine/android/api/VineLogin;

    const-wide/16 v3, 0x0

    move-object v5, v1

    invoke-direct/range {v0 .. v5}, Lco/vine/android/api/VineLogin;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 189
    .local v0, login:Lco/vine/android/api/VineLogin;
    iget-object v1, p0, Lco/vine/android/LoginActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1, v8, v0, v7, p1}, Lco/vine/android/client/AppController;->login(Lco/vine/android/client/Session;Lco/vine/android/api/VineLogin;Ljava/lang/String;Z)Ljava/lang/String;

    .line 190
    return-void

    .line 181
    .end local v0           #login:Lco/vine/android/api/VineLogin;
    .end local v8           #s:Lco/vine/android/client/Session;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private validate()Z
    .locals 2

    .prologue
    .line 169
    iget-object v0, p0, Lco/vine/android/LoginActivity;->mUsername:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lco/vine/android/LoginActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    const/16 v1, 0x8

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
    .line 141
    iget-object v0, p0, Lco/vine/android/LoginActivity;->mLoginButton:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lco/vine/android/LoginActivity;->mLoginButton:Landroid/view/MenuItem;

    invoke-direct {p0}, Lco/vine/android/LoginActivity;->validate()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 144
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
    .line 133
    return-void
.end method

.method completeLogin(ILjava/lang/String;I)V
    .locals 2
    .parameter "statusCode"
    .parameter "reason"
    .parameter "errorCode"

    .prologue
    .line 193
    packed-switch p1, :pswitch_data_0

    .line 202
    sget-object v1, Lco/vine/android/api/VineError$VineKnownErrors;->ACCOUNT_DEACTIVATED:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v1, v1, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    if-ne p3, v1, :cond_1

    .line 203
    const/4 v1, 0x1

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v0

    .line 205
    .local v0, p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v1, 0x7f0e015c

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 206
    const v1, 0x7f0e015d

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 207
    const v1, 0x7f0e0052

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 208
    const v1, 0x7f0e015b

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 209
    invoke-virtual {p0}, Lco/vine/android/LoginActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    .line 216
    .end local v0           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :goto_0
    return-void

    .line 195
    :pswitch_0
    iget-boolean v1, p0, Lco/vine/android/LoginActivity;->mFinish:Z

    if-nez v1, :cond_0

    .line 196
    invoke-static {p0}, Lco/vine/android/StartActivity;->toStart(Landroid/content/Context;)V

    .line 198
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/LoginActivity;->finish()V

    goto :goto_0

    .line 211
    :cond_1
    invoke-static {p0, p2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 193
    nop

    :pswitch_data_0
    .packed-switch 0xc8
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "view"

    .prologue
    .line 220
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 234
    :goto_0
    return-void

    .line 222
    :pswitch_0
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/ResetPasswordActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 223
    .local v1, i:Landroid/content/Intent;
    iget-object v2, p0, Lco/vine/android/LoginActivity;->mUsername:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 224
    .local v0, email:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 225
    const-string v2, "email"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 227
    :cond_0
    invoke-virtual {p0, v1}, Lco/vine/android/LoginActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 220
    :pswitch_data_0
    .packed-switch 0x7f0a00b0
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 14
    .parameter "savedInstanceState"

    .prologue
    const v13, 0x7f0a00ab

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 64
    const v6, 0x7f03003f

    invoke-super {p0, p1, v6, v10}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 66
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    const v8, 0x7f0e00e1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {p0, v6, v7, v8, v9}, Lco/vine/android/LoginActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 68
    new-instance v6, Lco/vine/android/LoginActivity$LoginSessionListener;

    invoke-direct {v6, p0}, Lco/vine/android/LoginActivity$LoginSessionListener;-><init>(Lco/vine/android/LoginActivity;)V

    iput-object v6, p0, Lco/vine/android/LoginActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 70
    invoke-virtual {p0, v13}, Lco/vine/android/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lco/vine/android/LoginActivity;->mUsername:Landroid/widget/EditText;

    .line 71
    iget-object v6, p0, Lco/vine/android/LoginActivity;->mUsername:Landroid/widget/EditText;

    invoke-static {p0}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v7

    invoke-virtual {v7, v10, v12}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 73
    iget-object v6, p0, Lco/vine/android/LoginActivity;->mUsername:Landroid/widget/EditText;

    invoke-virtual {v6, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 75
    const v6, 0x7f0a00ae

    invoke-virtual {p0, v6}, Lco/vine/android/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lco/vine/android/LoginActivity;->mPassword:Landroid/widget/EditText;

    .line 76
    iget-object v6, p0, Lco/vine/android/LoginActivity;->mPassword:Landroid/widget/EditText;

    invoke-static {p0}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v7

    invoke-virtual {v7, v10, v12}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 78
    iget-object v6, p0, Lco/vine/android/LoginActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v6, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 80
    iget-object v6, p0, Lco/vine/android/LoginActivity;->mPassword:Landroid/widget/EditText;

    new-instance v7, Lco/vine/android/LoginActivity$1;

    invoke-direct {v7, p0}, Lco/vine/android/LoginActivity$1;-><init>(Lco/vine/android/LoginActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 92
    new-array v2, v11, [Landroid/text/style/StyleSpan;

    new-instance v6, Landroid/text/style/StyleSpan;

    invoke-direct {v6, v11}, Landroid/text/style/StyleSpan;-><init>(I)V

    aput-object v6, v2, v10

    .line 94
    .local v2, mStyleSpanBoldSingle:[Landroid/text/style/StyleSpan;
    const v6, 0x7f0a00b0

    invoke-virtual {p0, v6}, Lco/vine/android/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 95
    .local v1, mResetPassword:Landroid/widget/TextView;
    const v6, 0x7f0e00dd

    invoke-virtual {p0, v6}, Lco/vine/android/LoginActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 96
    .local v3, resetText:Ljava/lang/String;
    const/16 v6, 0x22

    invoke-static {v2, v3, v6}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v6

    sget-object v7, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {v1, v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 99
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    invoke-virtual {p0}, Lco/vine/android/LoginActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 102
    .local v0, i:Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 103
    const-string v6, "finish"

    invoke-virtual {v0, v6, v10}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lco/vine/android/LoginActivity;->mFinish:Z

    .line 108
    :goto_0
    invoke-virtual {p0, v13}, Lco/vine/android/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 109
    .local v4, username:Landroid/widget/EditText;
    const v6, 0x7f0a00ac

    invoke-virtual {p0, v6}, Lco/vine/android/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 114
    .local v5, usernameLabel:Landroid/widget/TextView;
    iput-boolean v10, p0, Lco/vine/android/LoginActivity;->mWidthResolved:Z

    .line 115
    invoke-virtual {v5}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v6

    new-instance v7, Lco/vine/android/LoginActivity$2;

    invoke-direct {v7, p0, v5, v4}, Lco/vine/android/LoginActivity$2;-><init>(Lco/vine/android/LoginActivity;Landroid/widget/TextView;Landroid/widget/EditText;)V

    invoke-virtual {v6, v7}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 128
    return-void

    .line 105
    .end local v4           #username:Landroid/widget/EditText;
    .end local v5           #usernameLabel:Landroid/widget/TextView;
    :cond_0
    iput-boolean v10, p0, Lco/vine/android/LoginActivity;->mFinish:Z

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 148
    invoke-virtual {p0}, Lco/vine/android/LoginActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f100006

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 149
    const v0, 0x7f0a0193

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/LoginActivity;->mLoginButton:Landroid/view/MenuItem;

    .line 150
    const/4 v0, 0x1

    return v0
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 1
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    .line 238
    packed-switch p2, :pswitch_data_0

    .line 258
    :goto_0
    :pswitch_0
    return-void

    .line 240
    :pswitch_1
    packed-switch p3, :pswitch_data_1

    goto :goto_0

    .line 242
    :pswitch_2
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lco/vine/android/LoginActivity;->login(Z)V

    goto :goto_0

    .line 238
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
    .end packed-switch

    .line 240
    :pswitch_data_1
    .packed-switch -0x2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 155
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 163
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 157
    :pswitch_0
    invoke-direct {p0}, Lco/vine/android/LoginActivity;->validate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/LoginActivity;->login(Z)V

    .line 160
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 155
    :pswitch_data_0
    .packed-switch 0x7f0a0193
        :pswitch_0
    .end packed-switch
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "charSequence"
    .parameter "i"
    .parameter "i2"
    .parameter "i3"

    .prologue
    .line 137
    return-void
.end method
