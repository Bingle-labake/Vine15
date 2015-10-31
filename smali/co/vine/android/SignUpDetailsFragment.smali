.class public Lco/vine/android/SignUpDetailsFragment;
.super Lco/vine/android/BaseFragment;
.source "SignUpDetailsFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Lco/vine/android/widget/SpanClickListener;
.implements Lco/vine/android/util/ContactsHelper$ContactHelperListener;


# static fields
.field private static final SPAN_PRIVACY_POLICY:I = 0x1

.field private static final SPAN_TOS:I = 0x2


# instance fields
.field private mDoneButton:Landroid/view/MenuItem;

.field private mEmail:Landroid/widget/EditText;

.field private mPassword:Landroid/widget/EditText;

.field private mPhone:Landroid/widget/EditText;

.field private mWidthResolved:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lco/vine/android/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/vine/android/SignUpDetailsFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    invoke-direct {p0}, Lco/vine/android/SignUpDetailsFragment;->validate()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/SignUpDetailsFragment;)Landroid/widget/EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mPhone:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/SignUpDetailsFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    invoke-direct {p0}, Lco/vine/android/SignUpDetailsFragment;->onNextClicked()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lco/vine/android/SignUpDetailsFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-boolean v0, p0, Lco/vine/android/SignUpDetailsFragment;->mWidthResolved:Z

    return v0
.end method

.method static synthetic access$302(Lco/vine/android/SignUpDetailsFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-boolean p1, p0, Lco/vine/android/SignUpDetailsFragment;->mWidthResolved:Z

    return p1
.end method

.method private onNextClicked()Z
    .locals 2

    .prologue
    .line 167
    invoke-virtual {p0}, Lco/vine/android/SignUpDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/SignUpPagerActivity;

    .line 168
    .local v0, activity:Lco/vine/android/SignUpPagerActivity;
    if-eqz v0, :cond_0

    .line 169
    iget-object v1, p0, Lco/vine/android/SignUpDetailsFragment;->mEmail:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setLogin(Ljava/lang/String;)V

    .line 170
    iget-object v1, p0, Lco/vine/android/SignUpDetailsFragment;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setPassword(Ljava/lang/String;)V

    .line 171
    iget-object v1, p0, Lco/vine/android/SignUpDetailsFragment;->mPhone:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setPhone(Ljava/lang/String;)V

    .line 172
    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->toNextStep()V

    .line 173
    const/4 v1, 0x1

    .line 175
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private validate()Z
    .locals 2

    .prologue
    .line 195
    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mEmail:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mEmail:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mPassword:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mPassword:Landroid/widget/EditText;

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
    .line 189
    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mDoneButton:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mDoneButton:Landroid/view/MenuItem;

    invoke-direct {p0}, Lco/vine/android/SignUpDetailsFragment;->validate()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 192
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
    .line 181
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 54
    invoke-super {p0, p1}, Lco/vine/android/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    .line 55
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/SignUpDetailsFragment;->setHasOptionsMenu(Z)V

    .line 56
    invoke-virtual {p0}, Lco/vine/android/SignUpDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/SignUpPagerActivity;

    const v1, 0x7f0e00e2

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setBarTitle(I)V

    .line 57
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 146
    const v1, 0x7f100002

    invoke-virtual {p2, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 147
    const v1, 0x7f0a018d

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 148
    .local v0, doneButton:Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    .line 149
    invoke-direct {p0}, Lco/vine/android/SignUpDetailsFragment;->validate()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 151
    :cond_0
    iput-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mDoneButton:Landroid/view/MenuItem;

    .line 152
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .parameter "inflater"
    .parameter "root"
    .parameter "savedInstanceState"

    .prologue
    .line 61
    const v0, 0x7f030063

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onEmailLoaded(Ljava/lang/String;)V
    .locals 1
    .parameter "email"

    .prologue
    .line 235
    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mEmail:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 236
    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mEmail:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 238
    :cond_0
    return-void
.end method

.method public onNameLoaded(Ljava/lang/String;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 224
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 156
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 161
    invoke-super {p0, p1}, Lco/vine/android/BaseFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 158
    :pswitch_0
    invoke-direct {p0}, Lco/vine/android/SignUpDetailsFragment;->onNextClicked()Z

    move-result v0

    goto :goto_0

    .line 156
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a018d
        :pswitch_0
    .end packed-switch
.end method

.method public onPhoneNumberLoaded(Ljava/lang/String;)V
    .locals 1
    .parameter "phoneNumber"

    .prologue
    .line 228
    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mPhone:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 229
    iget-object v0, p0, Lco/vine/android/SignUpDetailsFragment;->mPhone:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 231
    :cond_0
    return-void
.end method

.method public onSpanClicked(Landroid/view/View;ILjava/lang/Object;)V
    .locals 3
    .parameter "view"
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 201
    invoke-virtual {p0}, Lco/vine/android/SignUpDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 219
    :goto_0
    return-void

    .line 204
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SignUpDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lco/vine/android/WebViewActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 205
    .local v0, i:Landroid/content/Intent;
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 207
    :pswitch_0
    const-string v1, "type"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 218
    :goto_1
    invoke-virtual {p0, v0}, Lco/vine/android/SignUpDetailsFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 211
    :pswitch_1
    const-string v1, "type"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_1

    .line 205
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "charSequence"
    .parameter "i"
    .parameter "i2"
    .parameter "i3"

    .prologue
    .line 185
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 17
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    .line 66
    invoke-super/range {p0 .. p2}, Lco/vine/android/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 67
    const v13, 0x7f0a016d

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iput-object v13, v0, Lco/vine/android/SignUpDetailsFragment;->mEmail:Landroid/widget/EditText;

    .line 68
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/SignUpDetailsFragment;->mEmail:Landroid/widget/EditText;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 70
    const v13, 0x7f0a016f

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iput-object v13, v0, Lco/vine/android/SignUpDetailsFragment;->mPassword:Landroid/widget/EditText;

    .line 71
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/SignUpDetailsFragment;->mPassword:Landroid/widget/EditText;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 72
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/SignUpDetailsFragment;->mPassword:Landroid/widget/EditText;

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SignUpDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v14

    invoke-static {v14}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v14

    const/4 v15, 0x0

    const/16 v16, 0x2

    invoke-virtual/range {v14 .. v16}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 75
    const v13, 0x7f0a0171

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iput-object v13, v0, Lco/vine/android/SignUpDetailsFragment;->mPhone:Landroid/widget/EditText;

    .line 76
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/SignUpDetailsFragment;->mPhone:Landroid/widget/EditText;

    new-instance v14, Lco/vine/android/SignUpDetailsFragment$1;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lco/vine/android/SignUpDetailsFragment$1;-><init>(Lco/vine/android/SignUpDetailsFragment;)V

    invoke-virtual {v13, v14}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 91
    const v13, 0x7f0a0174

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 92
    .local v6, mTos:Landroid/widget/TextView;
    const/4 v13, 0x2

    new-array v2, v13, [Landroid/text/style/StyleSpan;

    const/4 v13, 0x0

    new-instance v14, Landroid/text/style/StyleSpan;

    const/4 v15, 0x1

    invoke-direct {v14, v15}, Landroid/text/style/StyleSpan;-><init>(I)V

    aput-object v14, v2, v13

    const/4 v13, 0x1

    new-instance v14, Landroid/text/style/StyleSpan;

    const/4 v15, 0x1

    invoke-direct {v14, v15}, Landroid/text/style/StyleSpan;-><init>(I)V

    aput-object v14, v2, v13

    .line 94
    .local v2, boldStyle:[Landroid/text/style/StyleSpan;
    const v13, 0x7f0e01a4

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lco/vine/android/SignUpDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x22

    invoke-static {v2, v13, v14}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v8

    .line 97
    .local v8, spanned:Landroid/text/Spanned;
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v13

    invoke-virtual {v6, v13}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 100
    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Landroid/text/Spannable;

    .line 101
    .local v3, clickSpannable:Landroid/text/Spannable;
    const/4 v13, 0x0

    invoke-interface {v8}, Landroid/text/Spanned;->length()I

    move-result v14

    const-class v15, Landroid/text/style/StyleSpan;

    invoke-interface {v8, v13, v14, v15}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Landroid/text/style/StyleSpan;

    .line 102
    .local v9, spans:[Landroid/text/style/StyleSpan;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SignUpDetailsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 105
    .local v7, res:Landroid/content/res/Resources;
    const/4 v13, 0x0

    aget-object v13, v9, v13

    invoke-interface {v8, v13}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v10

    .line 106
    .local v10, start:I
    const/4 v13, 0x0

    aget-object v13, v9, v13

    invoke-interface {v8, v13}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    .line 107
    .local v5, end:I
    new-instance v4, Lco/vine/android/widget/StyledClickableSpan;

    const/4 v13, 0x1

    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-direct {v4, v13, v14, v0}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 109
    .local v4, clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v13, 0x7f09006d

    invoke-virtual {v7, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v13

    invoke-virtual {v4, v13}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 110
    const/16 v13, 0x21

    invoke-static {v3, v4, v10, v5, v13}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 114
    const/4 v13, 0x1

    aget-object v13, v9, v13

    invoke-interface {v8, v13}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v10

    .line 115
    const/4 v13, 0x1

    aget-object v13, v9, v13

    invoke-interface {v8, v13}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    .line 116
    new-instance v4, Lco/vine/android/widget/StyledClickableSpan;

    .end local v4           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const/4 v13, 0x2

    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-direct {v4, v13, v14, v0}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 117
    .restart local v4       #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v13, 0x7f09006d

    invoke-virtual {v7, v13}, Landroid/content/res/Resources;->getColor(I)I

    move-result v13

    invoke-virtual {v4, v13}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 118
    const/16 v13, 0x21

    invoke-static {v3, v4, v10, v5, v13}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 121
    new-instance v13, Lco/vine/android/util/ContactsHelper;

    move-object/from16 v0, p0

    move-object/from16 v1, p0

    invoke-direct {v13, v0, v1}, Lco/vine/android/util/ContactsHelper;-><init>(Landroid/support/v4/app/Fragment;Lco/vine/android/util/ContactsHelper$ContactHelperListener;)V

    .line 123
    const v13, 0x7f0a016d

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/EditText;

    .line 124
    .local v11, username:Landroid/widget/EditText;
    const v13, 0x7f0a016e

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 127
    .local v12, usernameLabel:Landroid/widget/TextView;
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lco/vine/android/SignUpDetailsFragment;->mWidthResolved:Z

    .line 128
    invoke-virtual {v12}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v13

    new-instance v14, Lco/vine/android/SignUpDetailsFragment$2;

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v12, v11}, Lco/vine/android/SignUpDetailsFragment$2;-><init>(Lco/vine/android/SignUpDetailsFragment;Landroid/widget/TextView;Landroid/widget/EditText;)V

    invoke-virtual {v13, v14}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 141
    return-void
.end method
