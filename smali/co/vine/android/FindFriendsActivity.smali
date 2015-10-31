.class public Lco/vine/android/FindFriendsActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "FindFriendsActivity.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;
.implements Lco/vine/android/widget/IconTabHost$OnTabClickedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/FindFriendsActivity$1;,
        Lco/vine/android/FindFriendsActivity$FindFriendsListener;,
        Lco/vine/android/FindFriendsActivity$TabSavedState;,
        Lco/vine/android/FindFriendsActivity$TabsAdapter;,
        Lco/vine/android/FindFriendsActivity$DummyTabFactory;,
        Lco/vine/android/FindFriendsActivity$TabInfo;
    }
.end annotation


# static fields
.field private static final STATE_CURRENT_TAB:Ljava/lang/String; = "currentTab"

.field public static final TAG_ADDRESS_BOOK:Ljava/lang/String; = "address"

.field public static final TAG_SEARCH:Ljava/lang/String; = "search"

.field public static final TAG_TWITTER:Ljava/lang/String; = "twitter"


# instance fields
.field private mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

.field private mTabHost:Lco/vine/android/widget/IconTabHost;

.field private mTabsAdapter:Lco/vine/android/FindFriendsActivity$TabsAdapter;

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    .line 413
    return-void
.end method

.method private setupTabs()V
    .locals 2

    .prologue
    .line 122
    const v0, 0x1020012

    invoke-virtual {p0, v0}, Lco/vine/android/FindFriendsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/IconTabHost;

    iput-object v0, p0, Lco/vine/android/FindFriendsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    .line 123
    iget-object v0, p0, Lco/vine/android/FindFriendsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    if-nez v0, :cond_0

    .line 124
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Your content must have a TabHost whose id attribute is \'android.R.id.tabhost\'"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 128
    :cond_0
    iget-object v0, p0, Lco/vine/android/FindFriendsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v0}, Lco/vine/android/widget/IconTabHost;->setup()V

    .line 129
    const v0, 0x7f0a0086

    invoke-virtual {p0, v0}, Lco/vine/android/FindFriendsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    iput-object v0, p0, Lco/vine/android/FindFriendsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 130
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 403
    packed-switch p1, :pswitch_data_0

    .line 411
    :goto_0
    return-void

    .line 406
    :pswitch_0
    iget-object v1, p0, Lco/vine/android/FindFriendsActivity;->mTabsAdapter:Lco/vine/android/FindFriendsActivity$TabsAdapter;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lco/vine/android/FindFriendsActivity$TabsAdapter;->getTab(I)Lco/vine/android/FindFriendsActivity$TabInfo;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/FindFriendsActivity$TabInfo;->fragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 407
    .local v0, frag:Landroid/support/v4/app/Fragment;
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 403
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onContentChanged()V
    .locals 1

    .prologue
    .line 134
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onContentChanged()V

    .line 135
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v0

    if-nez v0, :cond_0

    .line 136
    invoke-direct {p0}, Lco/vine/android/FindFriendsActivity;->setupTabs()V

    .line 138
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11
    .parameter "savedInstanceState"

    .prologue
    const v10, 0x7f030032

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 49
    const v5, 0x7f030041

    invoke-super {p0, p1, v5, v8}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 50
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 51
    invoke-direct {p0}, Lco/vine/android/FindFriendsActivity;->setupTabs()V

    .line 54
    :cond_0
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const v7, 0x7f0e00af

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {p0, v5, v6, v7, v8}, Lco/vine/android/FindFriendsActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 56
    iget-object v3, p0, Lco/vine/android/FindFriendsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    .line 57
    .local v3, tabHost:Lco/vine/android/widget/IconTabHost;
    const v5, 0x7f0a00b2

    invoke-virtual {p0, v5}, Lco/vine/android/FindFriendsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lco/vine/android/widget/ViewPagerScrollBar;

    iput-object v5, p0, Lco/vine/android/FindFriendsActivity;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    .line 58
    iget-object v5, p0, Lco/vine/android/FindFriendsActivity;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Lco/vine/android/widget/ViewPagerScrollBar;->setRange(I)V

    .line 60
    const v5, 0x7f0a0086

    invoke-virtual {p0, v5}, Lco/vine/android/FindFriendsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager;

    iput-object v5, p0, Lco/vine/android/FindFriendsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 61
    iget-object v5, p0, Lco/vine/android/FindFriendsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p0}, Lco/vine/android/FindFriendsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0b0039

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/support/v4/view/ViewPager;->setPageMargin(I)V

    .line 62
    iget-object v5, p0, Lco/vine/android/FindFriendsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    const v6, 0x7f090009

    invoke-virtual {v5, v6}, Landroid/support/v4/view/ViewPager;->setPageMarginDrawable(I)V

    .line 63
    iget-object v5, p0, Lco/vine/android/FindFriendsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/support/v4/view/ViewPager;->setOffscreenPageLimit(I)V

    .line 65
    new-instance v5, Lco/vine/android/FindFriendsActivity$TabsAdapter;

    iget-object v6, p0, Lco/vine/android/FindFriendsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v7, p0, Lco/vine/android/FindFriendsActivity;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    invoke-direct {v5, p0, v3, v6, v7}, Lco/vine/android/FindFriendsActivity$TabsAdapter;-><init>(Lco/vine/android/BaseControllerActionBarActivity;Landroid/widget/TabHost;Landroid/support/v4/view/ViewPager;Lco/vine/android/widget/ViewPagerScrollBar;)V

    iput-object v5, p0, Lco/vine/android/FindFriendsActivity;->mTabsAdapter:Lco/vine/android/FindFriendsActivity$TabsAdapter;

    .line 67
    new-instance v5, Lco/vine/android/FindFriendsActivity$FindFriendsListener;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Lco/vine/android/FindFriendsActivity$FindFriendsListener;-><init>(Lco/vine/android/FindFriendsActivity;Lco/vine/android/FindFriendsActivity$1;)V

    iput-object v5, p0, Lco/vine/android/FindFriendsActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 69
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 70
    .local v1, inflater:Landroid/view/LayoutInflater;
    invoke-virtual {v3, p0}, Lco/vine/android/widget/IconTabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 71
    invoke-virtual {v3, p0}, Lco/vine/android/widget/IconTabHost;->setOnTabClickedListener(Lco/vine/android/widget/IconTabHost$OnTabClickedListener;)V

    .line 74
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 75
    .local v0, addressBundle:Landroid/os/Bundle;
    iget-object v5, p0, Lco/vine/android/FindFriendsActivity;->mTabsAdapter:Lco/vine/android/FindFriendsActivity$TabsAdapter;

    const-string v6, "address"

    invoke-virtual {v3, v6}, Lco/vine/android/widget/IconTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v6

    const v7, 0x7f0200fd

    invoke-static {v1, v10, v3, v7, v9}, Lco/vine/android/widget/TabIndicator;->newIconIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;II)Lco/vine/android/widget/TabIndicator;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v6

    const-class v7, Lco/vine/android/FindFriendsAddressFragment;

    invoke-virtual {v5, v6, v7, v0}, Lco/vine/android/FindFriendsActivity$TabsAdapter;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 82
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 83
    .local v4, twitterBundle:Landroid/os/Bundle;
    iget-object v5, p0, Lco/vine/android/FindFriendsActivity;->mTabsAdapter:Lco/vine/android/FindFriendsActivity$TabsAdapter;

    const-string v6, "twitter"

    invoke-virtual {v3, v6}, Lco/vine/android/widget/IconTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v6

    const v7, 0x7f0200ff

    invoke-static {v1, v10, v3, v7, v9}, Lco/vine/android/widget/TabIndicator;->newIconIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;II)Lco/vine/android/widget/TabIndicator;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v6

    const-class v7, Lco/vine/android/FindFriendsTwitterFragment;

    invoke-virtual {v5, v6, v7, v4}, Lco/vine/android/FindFriendsActivity$TabsAdapter;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 91
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 92
    .local v2, searchBundle:Landroid/os/Bundle;
    const-string v5, "layout"

    const v6, 0x7f030031

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 94
    iget-object v5, p0, Lco/vine/android/FindFriendsActivity;->mTabsAdapter:Lco/vine/android/FindFriendsActivity$TabsAdapter;

    const-string v6, "search"

    invoke-virtual {v3, v6}, Lco/vine/android/widget/IconTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v6

    const v7, 0x7f0200fe

    invoke-static {v1, v10, v3, v7, v9}, Lco/vine/android/widget/TabIndicator;->newIconIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;II)Lco/vine/android/widget/TabIndicator;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v6

    const-class v7, Lco/vine/android/FindFriendsSearchFragment;

    invoke-virtual {v5, v6, v7, v2}, Lco/vine/android/FindFriendsActivity$TabsAdapter;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 100
    return-void
.end method

.method public onCurrentTabClicked()V
    .locals 0

    .prologue
    .line 143
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 393
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onDestroy()V

    .line 394
    iget-object v2, p0, Lco/vine/android/FindFriendsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v2}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v0

    .line 395
    .local v0, currentIndex:I
    iget-object v2, p0, Lco/vine/android/FindFriendsActivity;->mTabsAdapter:Lco/vine/android/FindFriendsActivity$TabsAdapter;

    #getter for: Lco/vine/android/FindFriendsActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;
    invoke-static {v2}, Lco/vine/android/FindFriendsActivity$TabsAdapter;->access$100(Lco/vine/android/FindFriendsActivity$TabsAdapter;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/FindFriendsActivity$TabInfo;

    invoke-virtual {v2}, Lco/vine/android/FindFriendsActivity$TabInfo;->fragment()Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 396
    .local v1, fragment:Landroid/support/v4/app/Fragment;
    instance-of v2, v1, Lco/vine/android/widget/OnTabChangedListener;

    if-eqz v2, :cond_0

    .line 397
    check-cast v1, Lco/vine/android/widget/OnTabChangedListener;

    .end local v1           #fragment:Landroid/support/v4/app/Fragment;
    invoke-interface {v1, v0}, Lco/vine/android/widget/OnTabChangedListener;->onMoveAway(I)V

    .line 399
    :cond_0
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "state"

    .prologue
    .line 104
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerActionBarActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 105
    const-string v1, "currentTab"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, cur:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {p0, v0}, Lco/vine/android/FindFriendsActivity;->setCurrentTabByTag(Ljava/lang/String;)V

    .line 109
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 114
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 115
    iget-object v1, p0, Lco/vine/android/FindFriendsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v1}, Lco/vine/android/widget/IconTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, cur:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 117
    const-string v1, "currentTab"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    :cond_0
    return-void
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 2
    .parameter "tag"

    .prologue
    .line 156
    iget-object v0, p0, Lco/vine/android/FindFriendsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lco/vine/android/FindFriendsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v1}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 157
    return-void
.end method

.method setCurrentTabByTag(Ljava/lang/String;)V
    .locals 3
    .parameter "tag"

    .prologue
    .line 147
    iget-object v0, p0, Lco/vine/android/FindFriendsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    .line 148
    .local v0, tabHost:Landroid/widget/TabHost;
    invoke-virtual {v0}, Landroid/widget/TabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 149
    invoke-virtual {v0, p1}, Landroid/widget/TabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    .line 151
    :cond_0
    iget-object v1, p0, Lco/vine/android/FindFriendsActivity;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    iget-object v2, p0, Lco/vine/android/FindFriendsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v1, v2}, Lco/vine/android/widget/ViewPagerScrollBar;->setPosition(I)V

    .line 152
    return-void
.end method
