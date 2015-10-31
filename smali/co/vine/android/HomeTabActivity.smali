.class public Lco/vine/android/HomeTabActivity;
.super Lco/vine/android/BaseTimelineActivity;
.source "HomeTabActivity.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;
.implements Lco/vine/android/widget/IconTabHost$OnTabClickedListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/HomeTabActivity$ChangesListener;,
        Lco/vine/android/HomeTabActivity$TabScrollListener;,
        Lco/vine/android/HomeTabActivity$TabSavedState;,
        Lco/vine/android/HomeTabActivity$TabsAdapter;,
        Lco/vine/android/HomeTabActivity$DummyTabFactory;,
        Lco/vine/android/HomeTabActivity$TabInfo;,
        Lco/vine/android/HomeTabActivity$DelayHandler;
    }
.end annotation


# static fields
.field public static final HOST_POST:Ljava/lang/String; = "post"

.field public static final HOST_TIMELINES:Ljava/lang/String; = "timelines"

.field public static final HOST_VINE:Ljava/lang/String; = "vine.co"

.field public static final HOST_VINE_DEV:Ljava/lang/String; = "plant.vine.co"

.field public static final INDEX_ACTIVITY_TAB:I = 0x1

.field public static final PREFIX_SHARED_VIDEO:Ljava/lang/String; = "v"

.field public static final PREFIX_USER_ID:Ljava/lang/String; = "u"

.field public static final REQUEST_CODE_VIEW_NOTIF:I = 0x1

.field public static final SCHEME_VINE:Ljava/lang/String; = "vine"

.field public static final TAB_PROFILE:Ljava/lang/String; = "profile"

.field public static final TAG_ACTIVITY:Ljava/lang/String; = "activity"

.field public static final TAG_EXPLORE:Ljava/lang/String; = "explore"

.field public static final TAG_HOME:Ljava/lang/String; = "home"


# instance fields
.field private mMenu:Landroid/view/Menu;

.field private mTabHost:Lco/vine/android/widget/IconTabHost;

.field private mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lco/vine/android/BaseTimelineActivity;-><init>()V

    .line 798
    return-void
.end method

.method static synthetic access$200(Lco/vine/android/HomeTabActivity;)Lco/vine/android/HomeTabActivity$TabsAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 57
    iget-object v0, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    return-object v0
.end method

.method private logTabChange(Ljava/lang/String;)V
    .locals 1
    .parameter "tag"

    .prologue
    .line 324
    const-string v0, "Current Tab"

    invoke-static {v0, p1}, Lcom/crashlytics/android/Crashlytics;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    if-eqz p1, :cond_0

    const-string v0, "switcher"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 326
    invoke-static {p1}, Lco/vine/android/util/FlurryUtils;->trackTabChange(Ljava/lang/String;)V

    .line 328
    :cond_0
    return-void
.end method

.method private setupTabs()V
    .locals 2

    .prologue
    .line 411
    const v0, 0x1020012

    invoke-virtual {p0, v0}, Lco/vine/android/HomeTabActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/IconTabHost;

    iput-object v0, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    .line 412
    iget-object v0, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    if-nez v0, :cond_0

    .line 413
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Your content must have a TabHost whose id attribute is \'android.R.id.tabhost\'"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 417
    :cond_0
    iget-object v0, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v0}, Lco/vine/android/widget/IconTabHost;->setup()V

    .line 418
    const v0, 0x7f0a0086

    invoke-virtual {p0, v0}, Lco/vine/android/HomeTabActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    iput-object v0, p0, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 419
    return-void
.end method

.method public static start(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3
    .parameter "activity"
    .parameter "tag"

    .prologue
    .line 422
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/HomeTabActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x400

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    .line 424
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 425
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 426
    return-void
.end method

.method private trimSegment(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "segment"

    .prologue
    .line 245
    const-string v0, "\\s+"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected getCurrentTimeLineFragment()Lco/vine/android/BaseTimelineFragment;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 389
    :try_start_0
    iget-object v4, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    #getter for: Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;
    invoke-static {v4}, Lco/vine/android/HomeTabActivity$TabsAdapter;->access$000(Lco/vine/android/HomeTabActivity$TabsAdapter;)Ljava/util/ArrayList;

    move-result-object v2

    .line 390
    .local v2, tabs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/HomeTabActivity$TabInfo;>;"
    iget-object v4, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v4}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/HomeTabActivity$TabInfo;

    #getter for: Lco/vine/android/HomeTabActivity$TabInfo;->mTag:Ljava/lang/String;
    invoke-static {v4}, Lco/vine/android/HomeTabActivity$TabInfo;->access$100(Lco/vine/android/HomeTabActivity$TabInfo;)Ljava/lang/String;

    move-result-object v3

    .line 391
    .local v3, tag:Ljava/lang/String;
    invoke-virtual {p0}, Lco/vine/android/HomeTabActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 392
    .local v1, frag:Landroid/support/v4/app/Fragment;
    instance-of v4, v1, Lco/vine/android/BaseTimelineFragment;

    if-eqz v4, :cond_0

    .line 393
    check-cast v1, Lco/vine/android/BaseTimelineFragment;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 398
    .end local v1           #frag:Landroid/support/v4/app/Fragment;
    .end local v2           #tabs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/HomeTabActivity$TabInfo;>;"
    .end local v3           #tag:Ljava/lang/String;
    :goto_0
    return-object v1

    .restart local v1       #frag:Landroid/support/v4/app/Fragment;
    .restart local v2       #tabs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/HomeTabActivity$TabInfo;>;"
    .restart local v3       #tag:Ljava/lang/String;
    :cond_0
    move-object v1, v5

    .line 395
    goto :goto_0

    .line 397
    .end local v1           #frag:Landroid/support/v4/app/Fragment;
    .end local v2           #tabs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/HomeTabActivity$TabInfo;>;"
    .end local v3           #tag:Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    move-object v1, v5

    .line 398
    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 11
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v10, 0x1

    .line 353
    iget-object v8, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    if-eqz v8, :cond_0

    .line 354
    iget-object v8, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    #getter for: Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;
    invoke-static {v8}, Lco/vine/android/HomeTabActivity$TabsAdapter;->access$000(Lco/vine/android/HomeTabActivity$TabsAdapter;)Ljava/util/ArrayList;

    move-result-object v6

    .line 355
    .local v6, tabs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/HomeTabActivity$TabInfo;>;"
    if-nez p1, :cond_1

    .line 356
    invoke-static {p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 357
    .local v4, sp:Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "inviteBannerWasClicked"

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 359
    iget-object v8, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v8}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/vine/android/HomeTabActivity$TabInfo;

    #getter for: Lco/vine/android/HomeTabActivity$TabInfo;->mTag:Ljava/lang/String;
    invoke-static {v8}, Lco/vine/android/HomeTabActivity$TabInfo;->access$100(Lco/vine/android/HomeTabActivity$TabInfo;)Ljava/lang/String;

    move-result-object v7

    .line 360
    .local v7, tag:Ljava/lang/String;
    invoke-virtual {p0}, Lco/vine/android/HomeTabActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    .line 361
    .local v2, homeTimeline:Landroid/support/v4/app/Fragment;
    instance-of v8, v2, Lco/vine/android/HomeTimelineFragment;

    if-eqz v8, :cond_0

    .line 362
    check-cast v2, Lco/vine/android/HomeTimelineFragment;

    .end local v2           #homeTimeline:Landroid/support/v4/app/Fragment;
    invoke-virtual {v2}, Lco/vine/android/HomeTimelineFragment;->removeHeader()V

    .line 384
    .end local v4           #sp:Landroid/content/SharedPreferences;
    .end local v6           #tabs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/HomeTabActivity$TabInfo;>;"
    .end local v7           #tag:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 364
    .restart local v6       #tabs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/HomeTabActivity$TabInfo;>;"
    :cond_1
    if-ne p1, v10, :cond_3

    if-ne p2, v10, :cond_3

    .line 366
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/vine/android/HomeTabActivity$TabInfo;

    .line 367
    .local v5, tab:Lco/vine/android/HomeTabActivity$TabInfo;
    invoke-virtual {p0}, Lco/vine/android/HomeTabActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v8

    #getter for: Lco/vine/android/HomeTabActivity$TabInfo;->mTag:Ljava/lang/String;
    invoke-static {v5}, Lco/vine/android/HomeTabActivity$TabInfo;->access$100(Lco/vine/android/HomeTabActivity$TabInfo;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 368
    .local v1, fragment:Landroid/support/v4/app/Fragment;
    instance-of v8, v1, Lco/vine/android/BaseTimelineFragment;

    if-eqz v8, :cond_2

    .line 369
    invoke-virtual {v1, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_1

    .line 372
    .end local v1           #fragment:Landroid/support/v4/app/Fragment;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v5           #tab:Lco/vine/android/HomeTabActivity$TabInfo;
    :cond_3
    if-ne p1, v10, :cond_4

    const/4 v8, -0x1

    if-ne p2, v8, :cond_4

    .line 373
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v8

    if-eqz v8, :cond_0

    iget-object v8, p0, Lco/vine/android/HomeTabActivity;->mMenu:Landroid/view/Menu;

    if-eqz v8, :cond_0

    .line 374
    iget-object v8, p0, Lco/vine/android/HomeTabActivity;->mMenu:Landroid/view/Menu;

    const v9, 0x7f0a0191

    invoke-interface {v8, v9}, Landroid/view/Menu;->removeItem(I)V

    goto :goto_0

    .line 377
    :cond_4
    iget-object v8, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v8}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/vine/android/HomeTabActivity$TabInfo;

    #getter for: Lco/vine/android/HomeTabActivity$TabInfo;->mTag:Ljava/lang/String;
    invoke-static {v8}, Lco/vine/android/HomeTabActivity$TabInfo;->access$100(Lco/vine/android/HomeTabActivity$TabInfo;)Ljava/lang/String;

    move-result-object v7

    .line 378
    .restart local v7       #tag:Ljava/lang/String;
    invoke-virtual {p0}, Lco/vine/android/HomeTabActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 379
    .local v0, frag:Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_0

    .line 380
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onContentChanged()V
    .locals 1

    .prologue
    .line 404
    invoke-super {p0}, Lco/vine/android/BaseTimelineActivity;->onContentChanged()V

    .line 405
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v0

    if-nez v0, :cond_0

    .line 406
    invoke-direct {p0}, Lco/vine/android/HomeTabActivity;->setupTabs()V

    .line 408
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 33
    .parameter "savedInstanceState"

    .prologue
    .line 88
    const v28, 0x7f030040

    const/16 v29, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v28

    move/from16 v3, v29

    invoke-super {v0, v1, v2, v3}, Lco/vine/android/BaseTimelineActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 89
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v28

    if-eqz v28, :cond_0

    .line 90
    invoke-direct/range {p0 .. p0}, Lco/vine/android/HomeTabActivity;->setupTabs()V

    .line 92
    :cond_0
    const-string v28, "HomeTabActivity pid: {}"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    invoke-static/range {v28 .. v29}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    const/16 v28, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/vine/android/HomeTabActivity;->setRequestedOrientation(I)V

    .line 96
    const/16 v28, 0x0

    invoke-static/range {v28 .. v28}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v28

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    move-object/from16 v3, v30

    move-object/from16 v4, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Lco/vine/android/HomeTabActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 98
    new-instance v28, Lco/vine/android/HomeTabActivity$ChangesListener;

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/HomeTabActivity$ChangesListener;-><init>(Lco/vine/android/HomeTabActivity;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/HomeTabActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 100
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/HomeTabActivity;->getIntent()Landroid/content/Intent;

    move-result-object v15

    .line 102
    .local v15, intent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v28, v0

    if-nez v28, :cond_1

    .line 103
    invoke-static/range {p0 .. p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/HomeTabActivity;->mAppController:Lco/vine/android/client/AppController;

    .line 106
    :cond_1
    move-object/from16 v0, p0

    iget-object v7, v0, Lco/vine/android/HomeTabActivity;->mAppController:Lco/vine/android/client/AppController;

    .line 108
    .local v7, appController:Lco/vine/android/client/AppController;
    invoke-virtual {v7}, Lco/vine/android/client/AppController;->isLoggedIn()Z

    move-result v28

    if-nez v28, :cond_3

    .line 242
    :cond_2
    :goto_0
    return-void

    .line 112
    :cond_3
    invoke-static/range {p0 .. p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v20

    .line 114
    .local v20, prefs:Landroid/content/SharedPreferences;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    move-object/from16 v25, v0

    .line 116
    .local v25, tabHost:Lco/vine/android/widget/IconTabHost;
    const v28, 0x7f0a0086

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/vine/android/HomeTabActivity;->findViewById(I)Landroid/view/View;

    move-result-object v28

    check-cast v28, Landroid/support/v4/view/ViewPager;

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 117
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    move-object/from16 v28, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/HomeTabActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v29

    const v30, 0x7f0b0039

    invoke-virtual/range {v29 .. v30}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v29

    invoke-virtual/range {v28 .. v29}, Landroid/support/v4/view/ViewPager;->setPageMargin(I)V

    .line 118
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    move-object/from16 v28, v0

    const v29, 0x7f090009

    invoke-virtual/range {v28 .. v29}, Landroid/support/v4/view/ViewPager;->setPageMarginDrawable(I)V

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    move-object/from16 v28, v0

    const/16 v29, 0x3

    invoke-virtual/range {v28 .. v29}, Landroid/support/v4/view/ViewPager;->setOffscreenPageLimit(I)V

    .line 121
    new-instance v28, Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    move-object/from16 v2, v25

    move-object/from16 v3, v29

    move-object/from16 v4, v30

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/HomeTabActivity$TabsAdapter;-><init>(Lco/vine/android/BaseControllerActionBarActivity;Landroid/widget/TabHost;Landroid/support/v4/view/ViewPager;Lco/vine/android/widget/ViewPagerScrollBar;)V

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    .line 123
    invoke-static/range {p0 .. p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v14

    .line 124
    .local v14, inflater:Landroid/view/LayoutInflater;
    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 125
    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->setOnTabClickedListener(Lco/vine/android/widget/IconTabHost$OnTabClickedListener;)V

    .line 128
    new-instance v26, Landroid/os/Bundle;

    invoke-direct/range {v26 .. v26}, Landroid/os/Bundle;-><init>()V

    .line 129
    .local v26, timelineBundle:Landroid/os/Bundle;
    const-string v28, "empty_desc"

    const v29, 0x7f0e01bf

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-object/from16 v28, v0

    const-string v29, "home"

    move-object/from16 v0, v25

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v29

    const v30, 0x7f030038

    const v31, 0x7f02014d

    const/16 v32, 0x0

    move/from16 v0, v30

    move-object/from16 v1, v25

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-static {v14, v0, v1, v2, v3}, Lco/vine/android/widget/TabIndicator;->newIconIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;II)Lco/vine/android/widget/TabIndicator;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v29

    const-class v30, Lco/vine/android/HomeTimelineFragment;

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/HomeTabActivity$TabsAdapter;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 137
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 138
    .local v6, activityBundle:Landroid/os/Bundle;
    const-string v28, "empty_desc"

    const v29, 0x7f0e003b

    move-object/from16 v0, v28

    move/from16 v1, v29

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 140
    const-string v28, "co.vine.android.NOTIFICATION_PRESSED"

    invoke-virtual {v15}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_4

    .line 141
    const-string v28, "take_focus"

    const/16 v29, 0x1

    move-object/from16 v0, v28

    move/from16 v1, v29

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 144
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-object/from16 v28, v0

    const-string v29, "activity"

    move-object/from16 v0, v25

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v29

    const v30, 0x7f030038

    const v31, 0x7f02011a

    const v32, 0x7f02011b

    move/from16 v0, v30

    move-object/from16 v1, v25

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-static {v14, v0, v1, v2, v3}, Lco/vine/android/widget/TabIndicator;->newIconIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;II)Lco/vine/android/widget/TabIndicator;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v29

    const-class v30, Lco/vine/android/ActivityFragment;

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    invoke-virtual {v0, v1, v2, v6}, Lco/vine/android/HomeTabActivity$TabsAdapter;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 149
    new-instance v11, Landroid/os/Bundle;

    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    .line 152
    .local v11, exploreBundle:Landroid/os/Bundle;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-object/from16 v28, v0

    const-string v29, "explore"

    move-object/from16 v0, v25

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v29

    const v30, 0x7f030038

    const v31, 0x7f02012e

    const/16 v32, 0x0

    move/from16 v0, v30

    move-object/from16 v1, v25

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-static {v14, v0, v1, v2, v3}, Lco/vine/android/widget/TabIndicator;->newIconIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;II)Lco/vine/android/widget/TabIndicator;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v29

    const-class v30, Lco/vine/android/ExploreFragment;

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    invoke-virtual {v0, v1, v2, v11}, Lco/vine/android/HomeTabActivity$TabsAdapter;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 158
    new-instance v21, Landroid/os/Bundle;

    invoke-direct/range {v21 .. v21}, Landroid/os/Bundle;-><init>()V

    .line 160
    .local v21, profileBundle:Landroid/os/Bundle;
    const-string v28, "user_id"

    invoke-virtual {v7}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v29

    move-object/from16 v0, v21

    move-object/from16 v1, v28

    move-wide/from16 v2, v29

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 161
    const-string v28, "refresh"

    const/16 v29, 0x1

    move-object/from16 v0, v21

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-object/from16 v28, v0

    const-string v29, "profile"

    move-object/from16 v0, v25

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v29

    const v30, 0x7f030038

    const v31, 0x7f020174

    const/16 v32, 0x0

    move/from16 v0, v30

    move-object/from16 v1, v25

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-static {v14, v0, v1, v2, v3}, Lco/vine/android/widget/TabIndicator;->newIconIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;II)Lco/vine/android/widget/TabIndicator;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v29

    const-class v30, Lco/vine/android/ProfileFragment;

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/HomeTabActivity$TabsAdapter;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v23

    .line 169
    .local v23, session:Lco/vine/android/client/Session;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->determineCleanup(Lco/vine/android/client/Session;)V

    .line 171
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-object/from16 v29, v0

    const/16 v30, 0x1

    const-string v28, "unread_notification_count"

    const/16 v31, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    move/from16 v2, v31

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v28

    if-lez v28, :cond_9

    const/16 v28, 0x1

    :goto_1
    move-object/from16 v0, v29

    move/from16 v1, v30

    move/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Lco/vine/android/HomeTabActivity$TabsAdapter;->setNew(IZ)V

    .line 173
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->fetchPendingNotificationCount(Lco/vine/android/client/Session;)Ljava/lang/String;

    .line 175
    invoke-virtual {v15}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v8

    .line 176
    .local v8, data:Landroid/net/Uri;
    invoke-virtual {v15}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    .line 177
    .local v5, action:Ljava/lang/String;
    const-string v28, "android.intent.action.VIEW"

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_e

    if-eqz v8, :cond_e

    .line 178
    new-instance v17, Ljava/util/ArrayList;

    invoke-virtual {v8}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v28

    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 179
    .local v17, pathSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v8}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v22

    .line 180
    .local v22, scheme:Ljava/lang/String;
    invoke-virtual {v8}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v13

    .line 182
    .local v13, host:Ljava/lang/String;
    if-eqz v13, :cond_6

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v28

    if-nez v28, :cond_6

    .line 183
    const-string v28, "vine.co"

    move-object/from16 v0, v28

    invoke-virtual {v13, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v28

    if-nez v28, :cond_5

    const-string v28, "plant.vine.co"

    move-object/from16 v0, v28

    invoke-virtual {v13, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v28

    if-eqz v28, :cond_c

    .line 184
    :cond_5
    const/16 v28, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 185
    .local v16, pathPrefix:Ljava/lang/String;
    const-string v28, "v"

    move-object/from16 v0, v28

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_a

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v28

    const/16 v29, 0x1

    move/from16 v0, v28

    move/from16 v1, v29

    if-le v0, v1, :cond_a

    .line 187
    const/16 v28, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lco/vine/android/HomeTabActivity;->trimSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 188
    .local v24, shareId:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Lco/vine/android/SingleActivity;->start(Landroid/content/Context;Ljava/lang/String;)V

    .line 212
    .end local v13           #host:Ljava/lang/String;
    .end local v16           #pathPrefix:Ljava/lang/String;
    .end local v17           #pathSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v22           #scheme:Ljava/lang/String;
    .end local v24           #shareId:Ljava/lang/String;
    :cond_6
    :goto_2
    new-instance v12, Lco/vine/android/HomeTabActivity$DelayHandler;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Lco/vine/android/HomeTabActivity$DelayHandler;-><init>(Landroid/content/Context;)V

    .line 213
    .local v12, handler:Lco/vine/android/HomeTabActivity$DelayHandler;
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v12, v0}, Lco/vine/android/HomeTabActivity$DelayHandler;->hasMessages(I)Z

    move-result v28

    if-eqz v28, :cond_7

    .line 214
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v12, v0}, Lco/vine/android/HomeTabActivity$DelayHandler;->removeMessages(I)V

    .line 216
    :cond_7
    const/16 v28, 0x2

    move/from16 v0, v28

    invoke-virtual {v12, v0}, Lco/vine/android/HomeTabActivity$DelayHandler;->hasMessages(I)Z

    move-result v28

    if-eqz v28, :cond_8

    .line 217
    const/16 v28, 0x2

    move/from16 v0, v28

    invoke-virtual {v12, v0}, Lco/vine/android/HomeTabActivity$DelayHandler;->removeMessages(I)V

    .line 220
    :cond_8
    const/16 v28, 0x4

    const/16 v29, 0x0

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v12, v0, v1}, Lco/vine/android/HomeTabActivity$DelayHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v12, v0}, Lco/vine/android/HomeTabActivity$DelayHandler;->sendMessage(Landroid/os/Message;)Z

    .line 222
    const/16 v28, 0x1

    const/16 v29, 0x0

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v12, v0, v1}, Lco/vine/android/HomeTabActivity$DelayHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v28

    const-wide/32 v29, 0xea60

    move-object/from16 v0, v28

    move-wide/from16 v1, v29

    invoke-virtual {v12, v0, v1, v2}, Lco/vine/android/HomeTabActivity$DelayHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 224
    const/16 v28, 0x2

    const/16 v29, 0x0

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v12, v0, v1}, Lco/vine/android/HomeTabActivity$DelayHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v28

    const-wide/32 v29, 0xea60

    move-object/from16 v0, v28

    move-wide/from16 v1, v29

    invoke-virtual {v12, v0, v1, v2}, Lco/vine/android/HomeTabActivity$DelayHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 226
    const/16 v28, 0x3

    const/16 v29, 0x0

    move/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v12, v0, v1}, Lco/vine/android/HomeTabActivity$DelayHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v28

    const-wide/32 v29, 0xea60

    move-object/from16 v0, v28

    move-wide/from16 v1, v29

    invoke-virtual {v12, v0, v1, v2}, Lco/vine/android/HomeTabActivity$DelayHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 229
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lco/vine/android/AppImpl;->startCameraService(Landroid/app/Activity;)V

    .line 231
    invoke-static/range {p0 .. p0}, Lco/vine/android/client/VineAccountHelper;->syncNormalVideoPlayable(Landroid/content/Context;)V

    .line 234
    :try_start_0
    invoke-static/range {p0 .. p0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v10

    .line 235
    .local v10, errorCode:I
    if-nez v10, :cond_2

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/HomeTabActivity;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v28

    move-object/from16 v0, p0

    move-wide/from16 v1, v28

    invoke-static {v0, v1, v2}, Lco/vine/android/service/GCMRegistrationService;->getRegisterIntent(Landroid/content/Context;J)Landroid/content/Intent;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/vine/android/HomeTabActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 239
    .end local v10           #errorCode:I
    :catch_0
    move-exception v9

    .line 240
    .local v9, e:Ljava/lang/Throwable;
    const-string v28, "Failed to validate Google Player Service status."

    const/16 v29, 0x0

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-static {v9, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 171
    .end local v5           #action:Ljava/lang/String;
    .end local v8           #data:Landroid/net/Uri;
    .end local v9           #e:Ljava/lang/Throwable;
    .end local v12           #handler:Lco/vine/android/HomeTabActivity$DelayHandler;
    :cond_9
    const/16 v28, 0x0

    goto/16 :goto_1

    .line 189
    .restart local v5       #action:Ljava/lang/String;
    .restart local v8       #data:Landroid/net/Uri;
    .restart local v13       #host:Ljava/lang/String;
    .restart local v16       #pathPrefix:Ljava/lang/String;
    .restart local v17       #pathSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v22       #scheme:Ljava/lang/String;
    :cond_a
    const-string v28, "u"

    move-object/from16 v0, v28

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_b

    .line 191
    invoke-virtual {v8}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lco/vine/android/HomeTabActivity;->trimSegment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 192
    .local v27, userId:Ljava/lang/String;
    invoke-static/range {v27 .. v27}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v28

    const-string v30, "Deep Link: /u/<userId>"

    move-object/from16 v0, p0

    move-wide/from16 v1, v28

    move-object/from16 v3, v30

    invoke-static {v0, v1, v2, v3}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    goto/16 :goto_2

    .line 195
    .end local v27           #userId:Ljava/lang/String;
    :cond_b
    const-string v28, "Deep Link: Vanity URL"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v28

    invoke-static {v0, v1, v2}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 197
    .end local v16           #pathPrefix:Ljava/lang/String;
    :cond_c
    const-string v28, "vine"

    move-object/from16 v0, v28

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_6

    .line 198
    const-string v28, "post"

    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_d

    .line 200
    invoke-virtual {v8}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    .line 201
    .local v18, postId:J
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-static {v0, v1, v2}, Lco/vine/android/SingleActivity;->start(Landroid/content/Context;J)V

    goto/16 :goto_2

    .line 202
    .end local v18           #postId:J
    :cond_d
    const-string v28, "timelines"

    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_6

    .line 204
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lco/vine/android/ExploreVideoListActivity;->start(Landroid/content/Context;Landroid/net/Uri;)V

    goto/16 :goto_2

    .line 208
    .end local v13           #host:Ljava/lang/String;
    .end local v17           #pathSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v22           #scheme:Ljava/lang/String;
    :cond_e
    const-string v28, "co.vine.android.UPLOAD_LIST"

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_6

    .line 209
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lco/vine/android/AppImpl;->startUploadsListActivity(Landroid/app/Activity;)V

    goto/16 :goto_2
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .parameter "menu"

    .prologue
    .line 430
    invoke-virtual {p0}, Lco/vine/android/HomeTabActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    const v2, 0x7f100005

    invoke-virtual {v1, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 431
    invoke-static {p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 432
    .local v0, prefs:Landroid/content/SharedPreferences;
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "pref_gb_notif_dismissed"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 434
    const v1, 0x7f0a0191

    invoke-interface {p1, v1}, Landroid/view/Menu;->removeItem(I)V

    .line 436
    :cond_0
    iput-object p1, p0, Lco/vine/android/HomeTabActivity;->mMenu:Landroid/view/Menu;

    .line 437
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    return v1
.end method

.method public onCurrentTabClicked()V
    .locals 0

    .prologue
    .line 516
    invoke-virtual {p0}, Lco/vine/android/HomeTabActivity;->scrollTop()V

    .line 517
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 7
    .parameter "view"

    .prologue
    const/4 v6, 0x0

    .line 476
    const/4 v1, -0x1

    .line 477
    .local v1, toastResId:I
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 499
    :goto_0
    if-lez v1, :cond_0

    .line 500
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v2

    .line 501
    .local v2, xOffset:I
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int v3, v4, v5

    .line 502
    .local v3, yOffset:I
    invoke-static {p0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    .line 503
    .local v0, toast:Landroid/widget/Toast;
    const/16 v4, 0x33

    invoke-virtual {v0, v4, v2, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 504
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 508
    .end local v0           #toast:Landroid/widget/Toast;
    .end local v2           #xOffset:I
    .end local v3           #yOffset:I
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Lco/vine/android/widget/TabIndicator;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 509
    invoke-virtual {p1, v6}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 511
    :cond_1
    const/4 v4, 0x1

    return v4

    .line 479
    :pswitch_0
    const v1, 0x7f0e01b8

    .line 480
    goto :goto_0

    .line 483
    :pswitch_1
    const v1, 0x7f0e01b3

    .line 484
    goto :goto_0

    .line 487
    :pswitch_2
    const v1, 0x7f0e01b4

    .line 488
    goto :goto_0

    .line 491
    :pswitch_3
    const v1, 0x7f0e01b6

    .line 492
    goto :goto_0

    .line 477
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 5
    .parameter "intent"

    .prologue
    const/4 v4, 0x1

    .line 250
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 251
    const-string v2, "co.vine.android.NOTIFICATION_PRESSED"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 252
    iget-object v2, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    #getter for: Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;
    invoke-static {v2}, Lco/vine/android/HomeTabActivity$TabsAdapter;->access$000(Lco/vine/android/HomeTabActivity$TabsAdapter;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/HomeTabActivity$TabInfo;

    #getter for: Lco/vine/android/HomeTabActivity$TabInfo;->mTag:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/HomeTabActivity$TabInfo;->access$100(Lco/vine/android/HomeTabActivity$TabInfo;)Ljava/lang/String;

    move-result-object v1

    .line 253
    .local v1, tag:Ljava/lang/String;
    invoke-virtual {p0}, Lco/vine/android/HomeTabActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 254
    .local v0, fragment:Landroid/support/v4/app/Fragment;
    instance-of v2, v0, Lco/vine/android/BaseListFragment;

    if-eqz v2, :cond_0

    .line 255
    invoke-virtual {p0, v4, v0}, Lco/vine/android/HomeTabActivity;->showPage(ILandroid/support/v4/app/Fragment;)V

    .line 258
    .end local v0           #fragment:Landroid/support/v4/app/Fragment;
    .end local v1           #tag:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "item"

    .prologue
    const/4 v0, 0x1

    .line 442
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 469
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 444
    :sswitch_0
    const-string v1, "Menu"

    invoke-static {v1}, Lco/vine/android/util/FlurryUtils;->trackVisitFindFriends(Ljava/lang/String;)V

    .line 445
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/FindFriendsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lco/vine/android/HomeTabActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 449
    :sswitch_1
    const-string v1, "Menu"

    invoke-static {v1}, Lco/vine/android/util/FlurryUtils;->trackVisitSettings(Ljava/lang/String;)V

    .line 450
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/SettingsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1, v0}, Lco/vine/android/HomeTabActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 455
    :sswitch_2
    const-string v1, "Menu"

    invoke-static {v1}, Lco/vine/android/util/FlurryUtils;->trackVisitSearch(Ljava/lang/String;)V

    .line 456
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/SearchActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lco/vine/android/HomeTabActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 460
    :sswitch_3
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 461
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/ViewOnlyNotifActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1, v0}, Lco/vine/android/HomeTabActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 465
    :cond_0
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0

    .line 442
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0a0159 -> :sswitch_0
        0x7f0a0190 -> :sswitch_2
        0x7f0a0191 -> :sswitch_3
        0x7f0a0192 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onResume()V
    .locals 7

    .prologue
    .line 332
    invoke-super {p0}, Lco/vine/android/BaseTimelineActivity;->onResume()V

    .line 333
    iget-object v5, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    if-eqz v5, :cond_0

    .line 334
    iget-object v5, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    iget-object v6, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v6}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v6

    iput v6, v5, Lco/vine/android/HomeTabActivity$TabsAdapter;->previousTab:I

    .line 336
    :cond_0
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v5

    invoke-virtual {v5, p0}, Lco/vine/android/AppImpl;->getNotifyFailedIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    .line 337
    .local v0, i:Landroid/content/Intent;
    if-eqz v0, :cond_1

    .line 338
    invoke-virtual {p0, v0}, Lco/vine/android/HomeTabActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 340
    :cond_1
    iget-object v5, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v5}, Lco/vine/android/widget/IconTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v4

    .line 341
    .local v4, tabWidget:Landroid/widget/TabWidget;
    if-nez v4, :cond_3

    const/4 v2, 0x0

    .line 342
    .local v2, tabCount:I
    :goto_0
    const/4 v1, 0x0

    .local v1, j:I
    :goto_1
    if-ge v1, v2, :cond_4

    .line 343
    invoke-virtual {v4, v1}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 344
    .local v3, tabView:Landroid/view/View;
    if-eqz v3, :cond_2

    .line 345
    add-int/lit8 v5, v1, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 346
    invoke-virtual {v3, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 342
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 341
    .end local v1           #j:I
    .end local v2           #tabCount:I
    .end local v3           #tabView:Landroid/view/View;
    :cond_3
    invoke-virtual {v4}, Landroid/widget/TabWidget;->getTabCount()I

    move-result v2

    goto :goto_0

    .line 349
    .restart local v1       #j:I
    .restart local v2       #tabCount:I
    :cond_4
    return-void
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 3
    .parameter "tag"

    .prologue
    const/4 v2, 0x0

    .line 314
    iget-object v0, p0, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lco/vine/android/HomeTabActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v1}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 315
    const-string v0, "activity"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 316
    invoke-static {p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "unread_notification_count"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 318
    iget-object v0, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/HomeTabActivity$TabsAdapter;->setNew(IZ)V

    .line 320
    :cond_0
    invoke-direct {p0, p1}, Lco/vine/android/HomeTabActivity;->logTabChange(Ljava/lang/String;)V

    .line 321
    return-void
.end method

.method public scrollTop()V
    .locals 5

    .prologue
    .line 520
    iget-object v3, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    iget-object v4, p0, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v4}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v4

    invoke-virtual {v3, v4}, Lco/vine/android/HomeTabActivity$TabsAdapter;->getTab(I)Lco/vine/android/HomeTabActivity$TabInfo;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/HomeTabActivity$TabInfo;->fragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 521
    .local v0, fragment:Landroid/support/v4/app/Fragment;
    instance-of v3, v0, Lco/vine/android/BaseListFragment;

    if-eqz v3, :cond_2

    .line 522
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v2

    .line 523
    .local v2, view:Landroid/view/View;
    if-nez v2, :cond_1

    .line 537
    .end local v0           #fragment:Landroid/support/v4/app/Fragment;
    .end local v2           #view:Landroid/view/View;
    :cond_0
    :goto_0
    return-void

    .line 526
    .restart local v0       #fragment:Landroid/support/v4/app/Fragment;
    .restart local v2       #view:Landroid/view/View;
    :cond_1
    const v3, 0x102000a

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/twitter/android/widget/TopScrollable;

    .line 528
    .local v1, list:Lcom/twitter/android/widget/TopScrollable;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/twitter/android/widget/TopScrollable;->scrollTop()Z

    move-result v3

    if-nez v3, :cond_0

    .line 530
    check-cast v0, Lco/vine/android/BaseListFragment;

    .end local v0           #fragment:Landroid/support/v4/app/Fragment;
    invoke-virtual {v0}, Lco/vine/android/BaseListFragment;->invokeScrollFirstItem()V

    goto :goto_0

    .line 533
    .end local v1           #list:Lcom/twitter/android/widget/TopScrollable;
    .end local v2           #view:Landroid/view/View;
    .restart local v0       #fragment:Landroid/support/v4/app/Fragment;
    :cond_2
    instance-of v3, v0, Lcom/twitter/android/widget/TopScrollable;

    if-eqz v3, :cond_0

    .line 534
    check-cast v0, Lcom/twitter/android/widget/TopScrollable;

    .end local v0           #fragment:Landroid/support/v4/app/Fragment;
    invoke-interface {v0}, Lcom/twitter/android/widget/TopScrollable;->scrollTop()Z

    goto :goto_0
.end method

.method public showPage(ILandroid/support/v4/app/Fragment;)V
    .locals 3
    .parameter "position"
    .parameter "fragment"

    .prologue
    .line 261
    iget-object v1, p0, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1, p1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 262
    instance-of v1, p2, Lco/vine/android/BaseListFragment;

    if-eqz v1, :cond_0

    move-object v1, p2

    .line 263
    check-cast v1, Lco/vine/android/BaseListFragment;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lco/vine/android/BaseListFragment;->onMoveTo(I)V

    .line 265
    :cond_0
    iget-object v1, p0, Lco/vine/android/HomeTabActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    iget-object v2, p0, Lco/vine/android/HomeTabActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v1, v2}, Lco/vine/android/HomeTabActivity$TabsAdapter;->getTab(I)Lco/vine/android/HomeTabActivity$TabInfo;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/HomeTabActivity$TabInfo;->fragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 266
    .local v0, current:Landroid/support/v4/app/Fragment;
    instance-of v1, v0, Lco/vine/android/BaseListFragment;

    if-eqz v1, :cond_1

    .line 267
    check-cast v0, Lco/vine/android/BaseListFragment;

    .end local v0           #current:Landroid/support/v4/app/Fragment;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lco/vine/android/BaseListFragment;->onMoveAway(I)V

    .line 269
    :cond_1
    invoke-virtual {p2}, Landroid/support/v4/app/Fragment;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lco/vine/android/HomeTabActivity;->logTabChange(Ljava/lang/String;)V

    .line 270
    return-void
.end method
