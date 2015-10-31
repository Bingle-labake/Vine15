.class public Lco/vine/android/LocaleDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "LocaleDialog.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/LocaleDialog$LocaleComparator;
    }
.end annotation


# instance fields
.field private mChanges:Z

.field private mLastSelected:I

.field private mLocaleOptions:Landroid/widget/RadioGroup;

.field private mLocales:Landroid/widget/Spinner;

.field private mLocalesAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mLocalesCodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Locale;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 188
    return-void
.end method

.method static synthetic access$100(Lco/vine/android/LocaleDialog;)Landroid/widget/Spinner;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lco/vine/android/LocaleDialog;->mLocales:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$202(Lco/vine/android/LocaleDialog;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput-boolean p1, p0, Lco/vine/android/LocaleDialog;->mChanges:Z

    return p1
.end method

.method private static isValidLocale(Ljava/util/Locale;)Ljava/lang/Boolean;
    .locals 1
    .parameter "locale"

    .prologue
    .line 41
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static newInstance()Lco/vine/android/LocaleDialog;
    .locals 1

    .prologue
    .line 37
    new-instance v0, Lco/vine/android/LocaleDialog;

    invoke-direct {v0}, Lco/vine/android/LocaleDialog;-><init>()V

    return-object v0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 140
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 141
    invoke-virtual {p0}, Lco/vine/android/LocaleDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 142
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 12
    .parameter "savedInstanceState"

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 49
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .local v9, localesNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v8, localesCodes:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Locale;>;"
    invoke-static {}, Ljava/util/Locale;->getAvailableLocales()[Ljava/util/Locale;

    move-result-object v1

    .line 53
    .local v1, availableLocales:[Ljava/util/Locale;
    if-eqz v1, :cond_1

    .line 54
    new-instance v10, Lco/vine/android/LocaleDialog$LocaleComparator;

    const/4 v11, 0x0

    invoke-direct {v10, p0, v11}, Lco/vine/android/LocaleDialog$LocaleComparator;-><init>(Lco/vine/android/LocaleDialog;Lco/vine/android/LocaleDialog$1;)V

    invoke-static {v1, v10}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 55
    move-object v0, v1

    .local v0, arr$:[Ljava/util/Locale;
    array-length v6, v0

    .local v6, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v6, :cond_1

    aget-object v5, v0, v4

    .line 56
    .local v5, l:Ljava/util/Locale;
    invoke-static {v5}, Lco/vine/android/LocaleDialog;->isValidLocale(Ljava/util/Locale;)Ljava/lang/Boolean;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 57
    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v5, v10}, Ljava/util/Locale;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 58
    .local v2, code:Ljava/lang/String;
    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .end local v2           #code:Ljava/lang/String;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 65
    .end local v0           #arr$:[Ljava/util/Locale;
    .end local v4           #i$:I
    .end local v5           #l:Ljava/util/Locale;
    .end local v6           #len$:I
    :cond_1
    new-instance v3, Ljava/util/Locale;

    const-string v10, "en"

    const-string v11, "ss"

    invoke-direct {v3, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .local v3, dummy:Ljava/util/Locale;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "DEBUG - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v3, v11}, Ljava/util/Locale;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    iput-object v8, p0, Lco/vine/android/LocaleDialog;->mLocalesCodes:Ljava/util/ArrayList;

    .line 71
    new-instance v7, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lco/vine/android/LocaleDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v10

    const v11, 0x1090008

    invoke-direct {v7, v10, v11, v9}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 73
    .local v7, localesAdapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v10, 0x1090009

    invoke-virtual {v7, v10}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 74
    iput-object v7, p0, Lco/vine/android/LocaleDialog;->mLocalesAdapter:Landroid/widget/ArrayAdapter;

    .line 75
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 16
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 80
    const v14, 0x7f03003e

    const/4 v15, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v14, v1, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v13

    .line 82
    .local v13, v:Landroid/view/View;
    const v14, 0x7f0a00a7

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/RadioButton;

    .line 83
    .local v12, system:Landroid/widget/RadioButton;
    const v14, 0x7f0a00a8

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    .line 85
    .local v2, custom:Landroid/widget/RadioButton;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/LocaleDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v14

    invoke-static {v14}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v11

    .line 87
    .local v11, prefs:Landroid/content/SharedPreferences;
    const-string v14, "pref_custom_locale_enabled"

    const/4 v15, 0x0

    invoke-interface {v11, v14, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 88
    .local v4, customEnabled:Z
    if-nez v4, :cond_1

    const/4 v14, 0x1

    :goto_0
    invoke-virtual {v12, v14}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 89
    invoke-virtual {v2, v4}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 91
    const v14, 0x7f0a00a9

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Spinner;

    .line 92
    .local v10, locales:Landroid/widget/Spinner;
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/LocaleDialog;->mLocalesAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v10, v14}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 93
    const-string v14, "pref_custom_locale"

    invoke-interface {v11, v14}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 94
    const-string v14, "pref_custom_locale"

    const-string v15, ""

    invoke-interface {v11, v14, v15}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 95
    .local v5, customLocaleCode:Ljava/lang/String;
    const-string v14, "pref_custom_locale_country"

    const-string v15, ""

    invoke-interface {v11, v14, v15}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 96
    .local v3, customCountry:Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 97
    const/4 v7, 0x0

    .line 98
    .local v7, index:I
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/LocaleDialog;->mLocalesCodes:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Locale;

    .line 99
    .local v8, l:Ljava/util/Locale;
    invoke-virtual {v8}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-virtual {v8}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 101
    invoke-virtual {v10, v7}, Landroid/widget/Spinner;->setSelection(I)V

    .line 102
    move-object/from16 v0, p0

    iput v7, v0, Lco/vine/android/LocaleDialog;->mLastSelected:I

    .line 110
    .end local v3           #customCountry:Ljava/lang/String;
    .end local v5           #customLocaleCode:Ljava/lang/String;
    .end local v6           #i$:Ljava/util/Iterator;
    .end local v7           #index:I
    .end local v8           #l:Ljava/util/Locale;
    :cond_0
    const v14, 0x7f0a00a6

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/RadioGroup;

    .line 111
    .local v9, localeOptions:Landroid/widget/RadioGroup;
    if-eqz v4, :cond_3

    .line 112
    const v14, 0x7f0a00a8

    invoke-virtual {v9, v14}, Landroid/widget/RadioGroup;->check(I)V

    .line 117
    :goto_2
    new-instance v14, Lco/vine/android/LocaleDialog$1;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lco/vine/android/LocaleDialog$1;-><init>(Lco/vine/android/LocaleDialog;)V

    invoke-virtual {v9, v14}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 125
    invoke-virtual {v10, v4}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 127
    move-object/from16 v0, p0

    invoke-virtual {v10, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 129
    move-object/from16 v0, p0

    iput-object v10, v0, Lco/vine/android/LocaleDialog;->mLocales:Landroid/widget/Spinner;

    .line 130
    move-object/from16 v0, p0

    iput-object v9, v0, Lco/vine/android/LocaleDialog;->mLocaleOptions:Landroid/widget/RadioGroup;

    .line 133
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/LocaleDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v14

    const-string v15, "Custom locales"

    invoke-virtual {v14, v15}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 135
    return-object v13

    .line 88
    .end local v9           #localeOptions:Landroid/widget/RadioGroup;
    .end local v10           #locales:Landroid/widget/Spinner;
    :cond_1
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 105
    .restart local v3       #customCountry:Ljava/lang/String;
    .restart local v5       #customLocaleCode:Ljava/lang/String;
    .restart local v6       #i$:Ljava/util/Iterator;
    .restart local v7       #index:I
    .restart local v8       #l:Ljava/util/Locale;
    .restart local v10       #locales:Landroid/widget/Spinner;
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 106
    goto :goto_1

    .line 114
    .end local v3           #customCountry:Ljava/lang/String;
    .end local v5           #customLocaleCode:Ljava/lang/String;
    .end local v6           #i$:Ljava/util/Iterator;
    .end local v7           #index:I
    .end local v8           #l:Ljava/util/Locale;
    .restart local v9       #localeOptions:Landroid/widget/RadioGroup;
    :cond_3
    const v14, 0x7f0a00a7

    invoke-virtual {v9, v14}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_2
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 11
    .parameter "dialog"

    .prologue
    .line 146
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 147
    iget-boolean v9, p0, Lco/vine/android/LocaleDialog;->mChanges:Z

    if-eqz v9, :cond_1

    .line 148
    iget-object v9, p0, Lco/vine/android/LocaleDialog;->mLocaleOptions:Landroid/widget/RadioGroup;

    invoke-virtual {v9}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v9

    const v10, 0x7f0a00a8

    if-ne v9, v10, :cond_2

    const/4 v1, 0x1

    .line 150
    .local v1, customLocale:Z
    :goto_0
    iget-object v9, p0, Lco/vine/android/LocaleDialog;->mLocales:Landroid/widget/Spinner;

    invoke-virtual {v9}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v6

    .line 151
    .local v6, position:I
    const/4 v4, 0x0

    .line 152
    .local v4, index:I
    const/4 v8, 0x0

    .line 153
    .local v8, selectedLocale:Ljava/util/Locale;
    iget-object v9, p0, Lco/vine/android/LocaleDialog;->mLocalesCodes:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Locale;

    .line 154
    .local v5, l:Ljava/util/Locale;
    if-ne v4, v6, :cond_3

    .line 155
    move-object v8, v5

    .line 160
    .end local v5           #l:Ljava/util/Locale;
    :cond_0
    if-nez v8, :cond_4

    .line 176
    .end local v1           #customLocale:Z
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #index:I
    .end local v6           #position:I
    .end local v8           #selectedLocale:Ljava/util/Locale;
    :cond_1
    :goto_2
    return-void

    .line 148
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 158
    .restart local v1       #customLocale:Z
    .restart local v3       #i$:Ljava/util/Iterator;
    .restart local v4       #index:I
    .restart local v5       #l:Ljava/util/Locale;
    .restart local v6       #position:I
    .restart local v8       #selectedLocale:Ljava/util/Locale;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 159
    goto :goto_1

    .line 164
    .end local v5           #l:Ljava/util/Locale;
    :cond_4
    invoke-virtual {v8}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    .line 165
    .local v2, customLocaleCode:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    .line 166
    .local v0, customCountry:Ljava/lang/String;
    invoke-virtual {p0}, Lco/vine/android/LocaleDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v9

    invoke-static {v9}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 168
    .local v7, prefs:Landroid/content/SharedPreferences;
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string v10, "pref_custom_locale_enabled"

    invoke-interface {v9, v10, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string v10, "pref_custom_locale"

    invoke-interface {v9, v10, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string v10, "pref_custom_locale_country"

    invoke-interface {v9, v10, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 172
    iget v9, p0, Lco/vine/android/LocaleDialog;->mLastSelected:I

    if-eq v4, v9, :cond_1

    .line 173
    invoke-virtual {p0}, Lco/vine/android/LocaleDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v9

    invoke-static {v9}, Lco/vine/android/util/Util;->restartApp(Landroid/content/Context;)V

    goto :goto_2
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 180
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/LocaleDialog;->mChanges:Z

    .line 181
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 186
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    return-void
.end method
