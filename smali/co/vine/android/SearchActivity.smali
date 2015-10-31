.class public Lco/vine/android/SearchActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "SearchActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/text/TextWatcher;


# static fields
.field public static final TAB_TAGS:Ljava/lang/String; = "tags"

.field public static final TAB_USERS:Ljava/lang/String; = "users"


# instance fields
.field private mClear:Landroid/widget/ImageButton;

.field private mCurrentFragment:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/BaseSearchFragment;",
            ">;"
        }
    .end annotation
.end field

.field private mQuery:Landroid/widget/EditText;

.field private mTabHost:Lco/vine/android/widget/FragmentTabHost;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    return-void
.end method

.method private performSearch()V
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 186
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lco/vine/android/util/Util;->setSoftInputVisibility(Landroid/content/Context;Landroid/view/View;Z)V

    .line 187
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/BaseSearchFragment;

    iget-object v1, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/BaseSearchFragment;->setQueryText(Ljava/lang/String;)V

    .line 189
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/BaseSearchFragment;

    invoke-virtual {v0}, Lco/vine/android/BaseSearchFragment;->performSearch()V

    .line 191
    :cond_0
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "editable"

    .prologue
    .line 133
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "charSequence"
    .parameter "i"
    .parameter "i2"
    .parameter "i3"

    .prologue
    .line 129
    return-void
.end method

.method public clearQueryText()V
    .locals 2

    .prologue
    .line 200
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 201
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 202
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lco/vine/android/util/Util;->setSoftInputVisibility(Landroid/content/Context;Landroid/view/View;Z)V

    .line 203
    return-void
.end method

.method protected modernShowDivider()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 103
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    .line 104
    iget-object v1, p0, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    invoke-virtual {v1}, Lco/vine/android/widget/FragmentTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    .line 105
    .local v0, tabWidget:Landroid/widget/TabWidget;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TabWidget;->setShowDividers(I)V

    .line 107
    .end local v0           #tabWidget:Landroid/widget/TabWidget;
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 137
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 160
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 139
    :pswitch_1
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lco/vine/android/util/Util;->setSoftInputVisibility(Landroid/content/Context;Landroid/view/View;Z)V

    goto :goto_0

    .line 143
    :pswitch_2
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mClear:Landroid/widget/ImageButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 144
    invoke-virtual {p0}, Lco/vine/android/SearchActivity;->clearQueryText()V

    .line 145
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/BaseSearchFragment;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lco/vine/android/BaseSearchFragment;->setQueryText(Ljava/lang/String;)V

    .line 147
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/BaseSearchFragment;

    invoke-virtual {v0}, Lco/vine/android/BaseSearchFragment;->cleanSearchResults()V

    goto :goto_0

    .line 153
    :pswitch_3
    invoke-direct {p0}, Lco/vine/android/SearchActivity;->performSearch()V

    goto :goto_0

    .line 137
    :pswitch_data_0
    .packed-switch 0x7f0a0146
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 21
    .parameter "savedInstanceState"

    .prologue
    .line 43
    const v17, 0x7f03005c

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v17

    move/from16 v3, v18

    invoke-super {v0, v1, v2, v3}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 44
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/SearchActivity;->setRequestedOrientation(I)V

    .line 46
    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v17

    const/16 v18, 0x1

    invoke-static/range {v18 .. v18}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v18

    const/16 v19, 0x0

    const/16 v20, 0x1

    invoke-static/range {v20 .. v20}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    move-object/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Lco/vine/android/SearchActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 48
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SearchActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v5

    .line 50
    .local v5, ab:Landroid/support/v7/app/ActionBar;
    if-eqz v5, :cond_0

    .line 51
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Landroid/support/v7/app/ActionBar;->setDisplayShowCustomEnabled(Z)V

    .line 52
    const v17, 0x7f03005b

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Landroid/support/v7/app/ActionBar;->setCustomView(I)V

    .line 55
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SearchActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v17

    const v18, 0x7f0a0146

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 56
    .local v9, query:Landroid/widget/EditText;
    move-object/from16 v0, p0

    invoke-virtual {v9, v0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 57
    move-object/from16 v0, p0

    invoke-virtual {v9, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 58
    invoke-virtual {v9}, Landroid/widget/EditText;->requestFocus()Z

    .line 59
    move-object/from16 v0, p0

    iput-object v9, v0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    .line 61
    const v17, 0x7f0a0147

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageButton;

    .line 62
    .local v6, clear:Landroid/widget/ImageButton;
    move-object/from16 v0, p0

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    move-object/from16 v0, p0

    iput-object v6, v0, Lco/vine/android/SearchActivity;->mClear:Landroid/widget/ImageButton;

    .line 65
    if-nez p1, :cond_1

    .line 66
    const v17, 0x7f0a0148

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Lco/vine/android/widget/FragmentTabHost;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    .line 67
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    move-object/from16 v17, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SearchActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v18

    const v19, 0x7f0a0149

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    move/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/widget/FragmentTabHost;->setup(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;I)V

    .line 69
    invoke-static/range {p0 .. p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v8

    .line 70
    .local v8, li:Landroid/view/LayoutInflater;
    new-instance v14, Landroid/os/Bundle;

    invoke-direct {v14}, Landroid/os/Bundle;-><init>()V

    .line 71
    .local v14, usersArgs:Landroid/os/Bundle;
    const-string v17, "empty_desc"

    const v18, 0x7f0e00fc

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 72
    const-string v17, "refresh"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 73
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    move-object/from16 v17, v0

    const-string v18, "users"

    invoke-virtual/range {v17 .. v18}, Lco/vine/android/widget/FragmentTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v16

    .line 74
    .local v16, usersSpec:Landroid/widget/TabHost$TabSpec;
    const v17, 0x7f03005e

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lco/vine/android/widget/FragmentTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v18

    const/16 v19, 0x0

    move/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v8, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v15

    .line 76
    .local v15, usersIndicator:Landroid/view/View;
    const v17, 0x7f0a014e

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    .line 77
    .local v13, title:Landroid/widget/TextView;
    const v17, 0x7f0e0117

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/SearchActivity;->getString(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    const v17, 0x7f0a014d

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 79
    .local v7, icon:Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SearchActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const v18, 0x7f0201d9

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 80
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    .line 81
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    move-object/from16 v17, v0

    const-class v18, Lco/vine/android/UserSearchFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2, v14}, Lco/vine/android/widget/FragmentTabHost;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 83
    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    .line 84
    .local v10, tagsArgs:Landroid/os/Bundle;
    const-string v17, "empty_desc"

    const v18, 0x7f0e00fd

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 85
    const-string v17, "refresh"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    move-object/from16 v17, v0

    const-string v18, "tags"

    invoke-virtual/range {v17 .. v18}, Lco/vine/android/widget/FragmentTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v12

    .line 87
    .local v12, tagsSpec:Landroid/widget/TabHost$TabSpec;
    const v17, 0x7f03005e

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lco/vine/android/widget/FragmentTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v18

    const/16 v19, 0x0

    move/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v8, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v11

    .line 89
    .local v11, tagsIndicator:Landroid/view/View;
    const v17, 0x7f0a014e

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    .end local v13           #title:Landroid/widget/TextView;
    check-cast v13, Landroid/widget/TextView;

    .line 90
    .restart local v13       #title:Landroid/widget/TextView;
    const v17, 0x7f0e01ba

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/SearchActivity;->getString(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    const v17, 0x7f0a014d

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .end local v7           #icon:Landroid/widget/ImageView;
    check-cast v7, Landroid/widget/ImageView;

    .line 92
    .restart local v7       #icon:Landroid/widget/ImageView;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SearchActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const v18, 0x7f0201de

    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 93
    invoke-virtual {v12, v11}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    move-object/from16 v17, v0

    const-class v18, Lco/vine/android/TagSearchFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v12, v1, v10}, Lco/vine/android/widget/FragmentTabHost;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 97
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SearchActivity;->modernShowDivider()V

    .line 99
    .end local v7           #icon:Landroid/widget/ImageView;
    .end local v8           #li:Landroid/view/LayoutInflater;
    .end local v10           #tagsArgs:Landroid/os/Bundle;
    .end local v11           #tagsIndicator:Landroid/view/View;
    .end local v12           #tagsSpec:Landroid/widget/TabHost$TabSpec;
    .end local v13           #title:Landroid/widget/TextView;
    .end local v14           #usersArgs:Landroid/os/Bundle;
    .end local v15           #usersIndicator:Landroid/view/View;
    .end local v16           #usersSpec:Landroid/widget/TabHost$TabSpec;
    :cond_1
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 207
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onDestroy()V

    .line 208
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/SearchActivity;->mTabHost:Lco/vine/android/widget/FragmentTabHost;

    .line 209
    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "v"
    .parameter "actionId"
    .parameter "event"

    .prologue
    .line 164
    invoke-virtual {p1}, Landroid/widget/TextView;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 181
    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 166
    :pswitch_0
    const/4 v0, 0x2

    .line 167
    .local v0, minimumQueryLength:I
    iget-object v1, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 168
    iget-object v1, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/BaseSearchFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseSearchFragment;->getMinimumSearchQueryLength()I

    move-result v0

    .line 170
    :cond_1
    const/4 v1, 0x3

    if-ne p2, v1, :cond_0

    iget-object v1, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    if-lt v1, v0, :cond_0

    .line 172
    invoke-direct {p0}, Lco/vine/android/SearchActivity;->performSearch()V

    .line 173
    const/4 v1, 0x1

    goto :goto_0

    .line 164
    :pswitch_data_0
    .packed-switch 0x7f0a0146
        :pswitch_0
    .end packed-switch
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 4
    .parameter "charSequence"
    .parameter "i"
    .parameter "i2"
    .parameter "i3"

    .prologue
    .line 111
    const v1, 0x7f0a0147

    invoke-virtual {p0, v1}, Lco/vine/android/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 112
    .local v0, cancel:Landroid/widget/ImageButton;
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 113
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 118
    :goto_0
    iget-object v1, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 119
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    iget-object v1, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/BaseSearchFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseSearchFragment;->getMinimumSearchQueryLength()I

    move-result v1

    if-lt v2, v1, :cond_2

    .line 120
    iget-object v1, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/BaseSearchFragment;

    invoke-virtual {p0}, Lco/vine/android/SearchActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lco/vine/android/BaseSearchFragment;->showSearchHint(Landroid/content/res/Resources;Ljava/lang/String;)V

    .line 125
    :cond_0
    :goto_1
    return-void

    .line 115
    :cond_1
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_0

    .line 122
    :cond_2
    iget-object v1, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/BaseSearchFragment;

    invoke-virtual {v1}, Lco/vine/android/BaseSearchFragment;->hideSearchHint()V

    goto :goto_1
.end method

.method public restoreQueryText(Ljava/lang/String;)V
    .locals 2
    .parameter "query"

    .prologue
    .line 194
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 195
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 196
    iget-object v0, p0, Lco/vine/android/SearchActivity;->mQuery:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lco/vine/android/util/Util;->setSoftInputVisibility(Landroid/content/Context;Landroid/view/View;Z)V

    .line 197
    return-void
.end method

.method public setCurrentTab(Lco/vine/android/BaseSearchFragment;)V
    .locals 1
    .parameter "fragment"

    .prologue
    .line 212
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lco/vine/android/SearchActivity;->mCurrentFragment:Ljava/lang/ref/WeakReference;

    .line 213
    return-void
.end method
