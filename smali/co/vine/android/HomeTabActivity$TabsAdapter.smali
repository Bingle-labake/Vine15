.class Lco/vine/android/HomeTabActivity$TabsAdapter;
.super Landroid/support/v4/app/FragmentPagerAdapter;
.source "HomeTabActivity.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/HomeTabActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TabsAdapter"
.end annotation


# instance fields
.field private final mActivity:Lco/vine/android/BaseControllerActionBarActivity;

.field private final mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

.field private final mTabFactory:Lco/vine/android/HomeTabActivity$DummyTabFactory;

.field private final mTabHost:Landroid/widget/TabHost;

.field private final mTabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/HomeTabActivity$TabInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mViewPager:Landroid/support/v4/view/ViewPager;

.field public previousTab:I


# direct methods
.method public constructor <init>(Lco/vine/android/BaseControllerActionBarActivity;Landroid/widget/TabHost;Landroid/support/v4/view/ViewPager;Lco/vine/android/widget/ViewPagerScrollBar;)V
    .locals 2
    .parameter "activity"
    .parameter "tabHost"
    .parameter "pager"
    .parameter "scrollBar"

    .prologue
    .line 616
    invoke-virtual {p1}, Lco/vine/android/BaseControllerActionBarActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v4/app/FragmentPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 602
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    .line 617
    iput-object p1, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mActivity:Lco/vine/android/BaseControllerActionBarActivity;

    .line 618
    iput-object p2, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabHost:Landroid/widget/TabHost;

    .line 619
    iput-object p3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 620
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 621
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 622
    iput-object p4, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    .line 623
    new-instance v0, Lco/vine/android/HomeTabActivity$DummyTabFactory;

    iget-object v1, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mActivity:Lco/vine/android/BaseControllerActionBarActivity;

    invoke-direct {v0, v1}, Lco/vine/android/HomeTabActivity$DummyTabFactory;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabFactory:Lco/vine/android/HomeTabActivity$DummyTabFactory;

    .line 624
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/HomeTabActivity$TabsAdapter;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 596
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 2
    .parameter "tabSpec"
    .parameter
    .parameter "args"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TabHost$TabSpec;",
            "Ljava/lang/Class",
            "<*>;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 627
    .local p2, clss:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    new-instance v0, Lco/vine/android/HomeTabActivity$TabInfo;

    invoke-virtual {p1}, Landroid/widget/TabHost$TabSpec;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p2, p3, v1}, Lco/vine/android/HomeTabActivity$TabInfo;-><init>(Ljava/lang/Class;Landroid/os/Bundle;Ljava/lang/String;)V

    .line 628
    .local v0, info:Lco/vine/android/HomeTabActivity$TabInfo;
    iget-object v1, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabFactory:Lco/vine/android/HomeTabActivity$DummyTabFactory;

    invoke-virtual {p1, v1}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/widget/TabHost$TabContentFactory;)Landroid/widget/TabHost$TabSpec;

    .line 629
    iget-object v1, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 630
    iget-object v1, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v1, p1}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 631
    invoke-virtual {p0}, Lco/vine/android/HomeTabActivity$TabsAdapter;->notifyDataSetChanged()V

    .line 632
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 636
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 3
    .parameter "position"

    .prologue
    .line 680
    iget-object v1, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mActivity:Lco/vine/android/BaseControllerActionBarActivity;

    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/HomeTabActivity$TabInfo;

    iget-object v0, v0, Lco/vine/android/HomeTabActivity$TabInfo;->clss:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/HomeTabActivity$TabInfo;

    iget-object v0, v0, Lco/vine/android/HomeTabActivity$TabInfo;->bundle:Landroid/os/Bundle;

    invoke-static {v1, v2, v0}, Landroid/support/v4/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 4
    .parameter "object"

    .prologue
    .line 641
    const/4 v0, 0x0

    .line 642
    .local v0, found:Z
    iget-object v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/HomeTabActivity$TabInfo;

    .line 643
    .local v2, info:Lco/vine/android/HomeTabActivity$TabInfo;
    invoke-virtual {v2}, Lco/vine/android/HomeTabActivity$TabInfo;->fragment()Landroid/support/v4/app/Fragment;

    move-result-object v3

    if-ne v3, p1, :cond_0

    .line 644
    const/4 v0, 0x1

    .line 648
    .end local v2           #info:Lco/vine/android/HomeTabActivity$TabInfo;
    :cond_1
    if-eqz v0, :cond_2

    .line 649
    const/4 v3, -0x1

    .line 651
    :goto_0
    return v3

    :cond_2
    const/4 v3, -0x2

    goto :goto_0
.end method

.method public getTab(I)Lco/vine/android/HomeTabActivity$TabInfo;
    .locals 1
    .parameter "pos"

    .prologue
    .line 611
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/HomeTabActivity$TabInfo;

    return-object v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 4
    .parameter "container"
    .parameter "position"

    .prologue
    .line 686
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/FragmentPagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 688
    .local v0, blf:Landroid/support/v4/app/Fragment;
    iget-object v1, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/HomeTabActivity$TabInfo;

    invoke-virtual {v1, v0}, Lco/vine/android/HomeTabActivity$TabInfo;->setFragment(Landroid/support/v4/app/Fragment;)V

    .line 690
    instance-of v1, v0, Lco/vine/android/BaseListFragment;

    if-eqz v1, :cond_0

    move-object v1, v0

    .line 691
    check-cast v1, Lco/vine/android/BaseListFragment;

    new-instance v2, Lco/vine/android/HomeTabActivity$TabScrollListener;

    iget-object v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mActivity:Lco/vine/android/BaseControllerActionBarActivity;

    invoke-direct {v2, v3, p2}, Lco/vine/android/HomeTabActivity$TabScrollListener;-><init>(Lco/vine/android/BaseControllerActionBarActivity;I)V

    invoke-virtual {v1, v2}, Lco/vine/android/BaseListFragment;->setScrollListener(Lco/vine/android/BaseListFragment$OnScrollListener;)V

    .line 693
    iget-object v1, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    if-ne p2, v1, :cond_0

    .line 698
    :cond_0
    return-object v0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0
    .parameter "state"

    .prologue
    .line 738
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 2
    .parameter "position"
    .parameter "positionOffset"
    .parameter "positionOffsetPixels"

    .prologue
    .line 702
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    if-ge v0, p1, :cond_1

    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    if-eqz v0, :cond_1

    .line 703
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    neg-int v1, p3

    invoke-virtual {v0, p1, v1}, Lco/vine/android/widget/ViewPagerScrollBar;->scroll(II)V

    .line 707
    :cond_0
    :goto_0
    return-void

    .line 704
    :cond_1
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    if-eqz v0, :cond_0

    .line 705
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    invoke-virtual {v0, p1, p3}, Lco/vine/android/widget/ViewPagerScrollBar;->scroll(II)V

    goto :goto_0
.end method

.method public onPageSelected(I)V
    .locals 7
    .parameter "position"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 714
    iget-object v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v3}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v2

    .line 715
    .local v2, widget:Landroid/widget/TabWidget;
    invoke-virtual {v2}, Landroid/widget/TabWidget;->getDescendantFocusability()I

    move-result v0

    .line 716
    .local v0, descendantFocusability:I
    const/high16 v3, 0x6

    invoke-virtual {v2, v3}, Landroid/widget/TabWidget;->setDescendantFocusability(I)V

    .line 717
    iget v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->previousTab:I

    if-eq p1, v3, :cond_1

    .line 718
    iget-object v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabHost:Landroid/widget/TabHost;

    check-cast v3, Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v3, p1}, Lco/vine/android/widget/IconTabHost;->setTabExplicit(I)V

    .line 719
    iget-object v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    iget v4, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->previousTab:I

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/HomeTabActivity$TabInfo;

    invoke-virtual {v3}, Lco/vine/android/HomeTabActivity$TabInfo;->fragment()Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 720
    .local v1, fragment:Landroid/support/v4/app/Fragment;
    if-eqz v1, :cond_0

    instance-of v3, v1, Lco/vine/android/widget/OnTabChangedListener;

    if-eqz v3, :cond_0

    .line 721
    check-cast v1, Lco/vine/android/widget/OnTabChangedListener;

    .end local v1           #fragment:Landroid/support/v4/app/Fragment;
    invoke-interface {v1, p1}, Lco/vine/android/widget/OnTabChangedListener;->onMoveAway(I)V

    .line 723
    :cond_0
    iget-object v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/HomeTabActivity$TabInfo;

    invoke-virtual {v3}, Lco/vine/android/HomeTabActivity$TabInfo;->fragment()Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 724
    .restart local v1       #fragment:Landroid/support/v4/app/Fragment;
    if-eqz v1, :cond_1

    instance-of v3, v1, Lco/vine/android/widget/OnTabChangedListener;

    if-eqz v3, :cond_1

    .line 725
    check-cast v1, Lco/vine/android/widget/OnTabChangedListener;

    .end local v1           #fragment:Landroid/support/v4/app/Fragment;
    iget v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->previousTab:I

    invoke-interface {v1, v3}, Lco/vine/android/widget/OnTabChangedListener;->onMoveTo(I)V

    .line 728
    :cond_1
    invoke-virtual {v2, v0}, Landroid/widget/TabWidget;->setDescendantFocusability(I)V

    .line 729
    iget-object v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v3}, Landroid/widget/TabHost;->getCurrentTab()I

    move-result v3

    iput v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->previousTab:I

    .line 730
    if-ne p1, v6, :cond_2

    .line 731
    iget-object v3, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mActivity:Lco/vine/android/BaseControllerActionBarActivity;

    invoke-static {v3}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "unread_notification_count"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 733
    invoke-virtual {p0, v6, v5}, Lco/vine/android/HomeTabActivity$TabsAdapter;->setNew(IZ)V

    .line 735
    :cond_2
    return-void
.end method

.method public restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V
    .locals 7
    .parameter "state"
    .parameter "loader"

    .prologue
    .line 662
    move-object v2, p1

    check-cast v2, Lco/vine/android/HomeTabActivity$TabSavedState;

    .line 663
    .local v2, savedState:Lco/vine/android/HomeTabActivity$TabSavedState;
    iget-object v4, v2, Lco/vine/android/HomeTabActivity$TabSavedState;->tags:[Ljava/lang/String;

    .line 664
    .local v4, tags:[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v5, v4

    if-ge v1, v5, :cond_1

    .line 665
    aget-object v3, v4, v1

    .line 666
    .local v3, tag:Ljava/lang/String;
    iget-object v5, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mActivity:Lco/vine/android/BaseControllerActionBarActivity;

    invoke-virtual {v5}, Lco/vine/android/BaseControllerActionBarActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 668
    .local v0, fragment:Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_0

    .line 669
    iget-object v5, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/vine/android/HomeTabActivity$TabInfo;

    invoke-virtual {v5, v0}, Lco/vine/android/HomeTabActivity$TabInfo;->setFragment(Landroid/support/v4/app/Fragment;)V

    .line 670
    instance-of v5, v0, Lco/vine/android/BaseListFragment;

    if-eqz v5, :cond_0

    .line 671
    check-cast v0, Lco/vine/android/BaseListFragment;

    .end local v0           #fragment:Landroid/support/v4/app/Fragment;
    new-instance v5, Lco/vine/android/HomeTabActivity$TabScrollListener;

    iget-object v6, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mActivity:Lco/vine/android/BaseControllerActionBarActivity;

    invoke-direct {v5, v6, v1}, Lco/vine/android/HomeTabActivity$TabScrollListener;-><init>(Lco/vine/android/BaseControllerActionBarActivity;I)V

    invoke-virtual {v0, v5}, Lco/vine/android/BaseListFragment;->setScrollListener(Lco/vine/android/BaseListFragment$OnScrollListener;)V

    .line 664
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 676
    .end local v3           #tag:Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public saveState()Landroid/os/Parcelable;
    .locals 2

    .prologue
    .line 657
    new-instance v0, Lco/vine/android/HomeTabActivity$TabSavedState;

    iget-object v1, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Lco/vine/android/HomeTabActivity$TabSavedState;-><init>(Ljava/util/ArrayList;)V

    return-object v0
.end method

.method public setNew(IZ)V
    .locals 1
    .parameter "tabIndex"
    .parameter "isNew"

    .prologue
    .line 741
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/TabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/TabIndicator;

    invoke-virtual {v0, p2}, Lco/vine/android/widget/TabIndicator;->setNew(Z)V

    .line 742
    return-void
.end method

.method public tabs()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/HomeTabActivity$TabInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 607
    iget-object v0, p0, Lco/vine/android/HomeTabActivity$TabsAdapter;->mTabs:Ljava/util/ArrayList;

    return-object v0
.end method
