.class public Lco/vine/android/LoginTwitterActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "LoginTwitterActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Lco/vine/android/widget/SpanClickListener;
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;
    }
.end annotation


# static fields
.field private static final DIALOG_ACTIVATE_ACCOUNT:I = 0x1

.field public static final EXTRA_FINISH:Ljava/lang/String; = "finish"

.field public static final EXTRA_SCREEN_NAME:Ljava/lang/String; = "screen_name"

.field public static final EXTRA_SECRET:Ljava/lang/String; = "secret"

.field public static final EXTRA_TOKEN:Ljava/lang/String; = "token"

.field public static final EXTRA_USER_ID:Ljava/lang/String; = "user_id"

.field private static final SPAN_VINE_PP:I = 0x1

.field private static final SPAN_VINE_TOS:I = 0x2

.field private static final STATE_VINE_LOGIN:Ljava/lang/String; = "vine_login"


# instance fields
.field private mFinish:Z

.field private mPassword:Landroid/widget/EditText;

.field private mSignIn:Landroid/view/MenuItem;

.field private mUsername:Landroid/widget/EditText;

.field private mVineLogin:Lco/vine/android/api/VineLogin;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    .line 239
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/LoginTwitterActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lco/vine/android/LoginTwitterActivity;->login(Z)V

    return-void
.end method

.method static synthetic access$100(Lco/vine/android/LoginTwitterActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-boolean v0, p0, Lco/vine/android/LoginTwitterActivity;->mFinish:Z

    return v0
.end method

.method static synthetic access$202(Lco/vine/android/LoginTwitterActivity;Lco/vine/android/api/VineLogin;)Lco/vine/android/api/VineLogin;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    iput-object p1, p0, Lco/vine/android/LoginTwitterActivity;->mVineLogin:Lco/vine/android/api/VineLogin;

    return-object p1
.end method

.method public static getIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2
    .parameter "context"

    .prologue
    .line 69
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/LoginTwitterActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method public static getIntentWithFinish(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3
    .parameter "context"

    .prologue
    .line 73
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/LoginTwitterActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "finish"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 75
    return-object v0
.end method

.method private login(Z)V
    .locals 9
    .parameter "reactivate"

    .prologue
    .line 195
    invoke-direct {p0}, Lco/vine/android/LoginTwitterActivity;->validate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    new-instance v7, Landroid/app/ProgressDialog;

    const v0, 0x7f0f0028

    invoke-direct {v7, p0, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 197
    .local v7, dialog:Landroid/app/ProgressDialog;
    const v0, 0x7f0e01a1

    invoke-virtual {p0, v0}, Lco/vine/android/LoginTwitterActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 198
    const/4 v0, 0x0

    invoke-virtual {v7, v0}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 200
    :try_start_0
    invoke-virtual {v7}, Landroid/app/ProgressDialog;->show()V
    :try_end_0
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    :goto_0
    iput-object v7, p0, Lco/vine/android/LoginTwitterActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 205
    if-nez p1, :cond_1

    .line 206
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity;->mUsername:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/LoginTwitterActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/client/AppController;->loginWithxAuth(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 216
    .end local v7           #dialog:Landroid/app/ProgressDialog;
    :cond_0
    :goto_1
    return-void

    .line 208
    .restart local v7       #dialog:Landroid/app/ProgressDialog;
    :cond_1
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity;->mVineLogin:Lco/vine/android/api/VineLogin;

    if-eqz v0, :cond_2

    .line 209
    iget-object v8, p0, Lco/vine/android/LoginTwitterActivity;->mVineLogin:Lco/vine/android/api/VineLogin;

    .line 210
    .local v8, login:Lco/vine/android/api/VineLogin;
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, v8, Lco/vine/android/api/VineLogin;->twitterUsername:Ljava/lang/String;

    iget-object v2, v8, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    iget-object v3, v8, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    iget-wide v4, v8, Lco/vine/android/api/VineLogin;->twitterUserId:J

    const/4 v6, 0x1

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->loginCheckTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Ljava/lang/String;

    goto :goto_1

    .line 213
    .end local v8           #login:Lco/vine/android/api/VineLogin;
    :cond_2
    const v0, 0x7f0e00a8

    invoke-static {p0, v0}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_1

    .line 201
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private validate()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 185
    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity;->mUsername:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->length()I

    move-result v1

    if-lt v1, v0, :cond_0

    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->length()I

    move-result v1

    if-lt v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "editable"

    .prologue
    .line 182
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "charSequence"
    .parameter "i"
    .parameter "i2"
    .parameter "i3"

    .prologue
    .line 171
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .parameter "savedInstanceState"

    .prologue
    .line 79
    const v9, 0x7f030073

    const/4 v10, 0x0

    invoke-super {p0, p1, v9, v10}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 81
    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const v11, 0x7f0e00e9

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-virtual {p0, v9, v10, v11, v12}, Lco/vine/android/LoginTwitterActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 83
    const v9, 0x7f0a00ab

    invoke-virtual {p0, v9}, Lco/vine/android/LoginTwitterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    iput-object v9, p0, Lco/vine/android/LoginTwitterActivity;->mUsername:Landroid/widget/EditText;

    .line 84
    iget-object v9, p0, Lco/vine/android/LoginTwitterActivity;->mUsername:Landroid/widget/EditText;

    invoke-static {p0}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x2

    invoke-virtual {v10, v11, v12}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 86
    iget-object v9, p0, Lco/vine/android/LoginTwitterActivity;->mUsername:Landroid/widget/EditText;

    invoke-virtual {v9, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 88
    const v9, 0x7f0a00ae

    invoke-virtual {p0, v9}, Lco/vine/android/LoginTwitterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    iput-object v9, p0, Lco/vine/android/LoginTwitterActivity;->mPassword:Landroid/widget/EditText;

    .line 89
    iget-object v9, p0, Lco/vine/android/LoginTwitterActivity;->mPassword:Landroid/widget/EditText;

    invoke-static {p0}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x2

    invoke-virtual {v10, v11, v12}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 91
    iget-object v9, p0, Lco/vine/android/LoginTwitterActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v9, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 93
    iget-object v9, p0, Lco/vine/android/LoginTwitterActivity;->mPassword:Landroid/widget/EditText;

    new-instance v10, Lco/vine/android/LoginTwitterActivity$1;

    invoke-direct {v10, p0}, Lco/vine/android/LoginTwitterActivity$1;-><init>(Lco/vine/android/LoginTwitterActivity;)V

    invoke-virtual {v9, v10}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 102
    invoke-virtual {p0}, Lco/vine/android/LoginTwitterActivity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    const-string v10, "finish"

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v9

    iput-boolean v9, p0, Lco/vine/android/LoginTwitterActivity;->mFinish:Z

    .line 104
    new-instance v9, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;

    invoke-direct {v9, p0}, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;-><init>(Lco/vine/android/LoginTwitterActivity;)V

    iput-object v9, p0, Lco/vine/android/LoginTwitterActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 106
    const v9, 0x7f0a0174

    invoke-virtual {p0, v9}, Lco/vine/android/LoginTwitterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 107
    .local v4, mTos:Landroid/widget/TextView;
    const/4 v9, 0x2

    new-array v0, v9, [Landroid/text/style/StyleSpan;

    const/4 v9, 0x0

    new-instance v10, Landroid/text/style/StyleSpan;

    const/4 v11, 0x1

    invoke-direct {v10, v11}, Landroid/text/style/StyleSpan;-><init>(I)V

    aput-object v10, v0, v9

    const/4 v9, 0x1

    new-instance v10, Landroid/text/style/StyleSpan;

    const/4 v11, 0x1

    invoke-direct {v10, v11}, Landroid/text/style/StyleSpan;-><init>(I)V

    aput-object v10, v0, v9

    .line 109
    .local v0, boldStyle:[Landroid/text/style/StyleSpan;
    const v9, 0x7f0e00eb

    invoke-virtual {p0, v9}, Lco/vine/android/LoginTwitterActivity;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x22

    invoke-static {v0, v9, v10}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v6

    .line 112
    .local v6, spanned:Landroid/text/Spanned;
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v9

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 115
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Landroid/text/Spannable;

    .line 116
    .local v1, clickSpannable:Landroid/text/Spannable;
    const/4 v9, 0x0

    invoke-interface {v6}, Landroid/text/Spanned;->length()I

    move-result v10

    const-class v11, Landroid/text/style/StyleSpan;

    invoke-interface {v6, v9, v10, v11}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Landroid/text/style/StyleSpan;

    .line 117
    .local v7, spans:[Landroid/text/style/StyleSpan;
    invoke-virtual {p0}, Lco/vine/android/LoginTwitterActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 120
    .local v5, res:Landroid/content/res/Resources;
    const/4 v9, 0x0

    aget-object v9, v7, v9

    invoke-interface {v6, v9}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v8

    .line 121
    .local v8, start:I
    const/4 v9, 0x0

    aget-object v9, v7, v9

    invoke-interface {v6, v9}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v3

    .line 122
    .local v3, end:I
    new-instance v2, Lco/vine/android/widget/StyledClickableSpan;

    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-direct {v2, v9, v10, p0}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 124
    .local v2, clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v9, 0x7f09006d

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v2, v9}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 125
    const/16 v9, 0x21

    invoke-static {v1, v2, v8, v3, v9}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 128
    if-eqz p1, :cond_0

    const-string v9, "vine_login"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 129
    const-string v9, "vine_login"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v9

    check-cast v9, Lco/vine/android/api/VineLogin;

    iput-object v9, p0, Lco/vine/android/LoginTwitterActivity;->mVineLogin:Lco/vine/android/api/VineLogin;

    .line 133
    :cond_0
    const/4 v9, 0x1

    aget-object v9, v7, v9

    invoke-interface {v6, v9}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v8

    .line 134
    const/4 v9, 0x1

    aget-object v9, v7, v9

    invoke-interface {v6, v9}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v3

    .line 135
    new-instance v2, Lco/vine/android/widget/StyledClickableSpan;

    .end local v2           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-direct {v2, v9, v10, p0}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 136
    .restart local v2       #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v9, 0x7f09006d

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v2, v9}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 137
    const/16 v9, 0x21

    invoke-static {v1, v2, v8, v3, v9}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 139
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 151
    invoke-virtual {p0}, Lco/vine/android/LoginTwitterActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f100006

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 152
    const v0, 0x7f0a0193

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/LoginTwitterActivity;->mSignIn:Landroid/view/MenuItem;

    .line 153
    const/4 v0, 0x1

    return v0
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 1
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    .line 220
    packed-switch p2, :pswitch_data_0

    .line 237
    :goto_0
    return-void

    .line 222
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    goto :goto_0

    .line 224
    :pswitch_1
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lco/vine/android/LoginTwitterActivity;->login(Z)V

    goto :goto_0

    .line 220
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch

    .line 222
    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_1
    .end packed-switch
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 158
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 164
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 160
    :pswitch_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/LoginTwitterActivity;->login(Z)V

    .line 161
    const/4 v0, 0x1

    goto :goto_0

    .line 158
    :pswitch_data_0
    .packed-switch 0x7f0a0193
        :pswitch_0
    .end packed-switch
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 143
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 144
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity;->mVineLogin:Lco/vine/android/api/VineLogin;

    if-eqz v0, :cond_0

    .line 145
    const-string v0, "vine_login"

    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity;->mVineLogin:Lco/vine/android/api/VineLogin;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 147
    :cond_0
    return-void
.end method

.method public onSpanClicked(Landroid/view/View;ILjava/lang/Object;)V
    .locals 3
    .parameter "view"
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 319
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/WebViewActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 320
    .local v0, i:Landroid/content/Intent;
    packed-switch p2, :pswitch_data_0

    .line 334
    :goto_0
    return-void

    .line 322
    :pswitch_0
    const-string v1, "type"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 333
    :goto_1
    invoke-virtual {p0, v0}, Lco/vine/android/LoginTwitterActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 326
    :pswitch_1
    const-string v1, "type"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_1

    .line 320
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .parameter "charSequence"
    .parameter "i"
    .parameter "i2"
    .parameter "i3"

    .prologue
    .line 175
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity;->mSignIn:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 176
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity;->mSignIn:Landroid/view/MenuItem;

    invoke-direct {p0}, Lco/vine/android/LoginTwitterActivity;->validate()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 178
    :cond_0
    return-void
.end method
