.class public Lco/vine/android/ExploreChannelsActivity;
.super Lco/vine/android/BaseTimelineActivity;
.source "ExploreChannelsActivity.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;
.implements Lco/vine/android/widget/IconTabHost$OnTabClickedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/ExploreChannelsActivity$ExploreChannelsAppSessionListener;
    }
.end annotation


# static fields
.field public static final PARAM_ICON_PATH:Ljava/lang/String; = "icon"

.field public static final PARAM_NAME:Ljava/lang/String; = "name"

.field public static final PARAM_NAV_RGB:Ljava/lang/String; = "navRGB"

.field public static final PARAM_TITLE_RGB:Ljava/lang/String; = "titleRGB"

.field public static final PATH_SEGMENT_CHANNEL_ID:I = 0x0

.field public static final SORT_POPULAR:Ljava/lang/String; = "popular"

.field public static final SORT_RECENT:Ljava/lang/String; = "recent"

.field public static final TAG_POPULAR:Ljava/lang/String; = "popular"

.field public static final TAG_RECENT:Ljava/lang/String; = "recent"


# instance fields
.field private mIconImageKey:Lco/vine/android/util/image/ImageKey;

.field private mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

.field private mTabHost:Lco/vine/android/widget/IconTabHost;

.field private mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

.field private mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lco/vine/android/BaseTimelineActivity;-><init>()V

    .line 265
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/ExploreChannelsActivity;)Lco/vine/android/util/image/ImageKey;
    .locals 1
    .parameter "x0"

    .prologue
    .line 37
    iget-object v0, p0, Lco/vine/android/ExploreChannelsActivity;->mIconImageKey:Lco/vine/android/util/image/ImageKey;

    return-object v0
.end method

.method static synthetic access$100(Lco/vine/android/ExploreChannelsActivity;Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lco/vine/android/ExploreChannelsActivity;->setIconImage(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private setIconImage(Landroid/graphics/Bitmap;)V
    .locals 5
    .parameter "iconImage"

    .prologue
    .line 257
    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 258
    .local v0, ab:Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    .line 259
    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0010

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 260
    .local v1, l:I
    const/4 v3, 0x1

    invoke-static {p1, v1, v1, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 261
    .local v2, scaledIconImage:Landroid/graphics/Bitmap;
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 263
    .end local v1           #l:I
    .end local v2           #scaledIconImage:Landroid/graphics/Bitmap;
    :cond_0
    return-void
.end method

.method private setupTabs()V
    .locals 2

    .prologue
    .line 213
    const v0, 0x1020012

    invoke-virtual {p0, v0}, Lco/vine/android/ExploreChannelsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/IconTabHost;

    iput-object v0, p0, Lco/vine/android/ExploreChannelsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    .line 214
    iget-object v0, p0, Lco/vine/android/ExploreChannelsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    if-nez v0, :cond_0

    .line 215
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Your content must have a TabHost whose id attribute is \'android.R.id.tabhost\'"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_0
    iget-object v0, p0, Lco/vine/android/ExploreChannelsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v0}, Lco/vine/android/widget/IconTabHost;->setup()V

    .line 220
    const v0, 0x7f0a0086

    invoke-virtual {p0, v0}, Lco/vine/android/ExploreChannelsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    iput-object v0, p0, Lco/vine/android/ExploreChannelsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 221
    return-void
.end method


# virtual methods
.method protected getCurrentTimeLineFragment()Lco/vine/android/BaseTimelineFragment;
    .locals 5

    .prologue
    .line 171
    iget-object v3, p0, Lco/vine/android/ExploreChannelsActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    iget-object v4, p0, Lco/vine/android/ExploreChannelsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v4}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v4

    invoke-virtual {v3, v4}, Lco/vine/android/HomeTabActivity$TabsAdapter;->getTab(I)Lco/vine/android/HomeTabActivity$TabInfo;

    move-result-object v2

    .line 172
    .local v2, tabInfo:Lco/vine/android/HomeTabActivity$TabInfo;
    if-eqz v2, :cond_0

    .line 173
    invoke-virtual {v2}, Lco/vine/android/HomeTabActivity$TabInfo;->getTag()Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, currentTabTag:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 175
    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 176
    .local v1, fragment:Landroid/support/v4/app/Fragment;
    instance-of v3, v1, Lco/vine/android/BaseTimelineFragment;

    if-eqz v3, :cond_0

    .line 177
    check-cast v1, Lco/vine/android/BaseTimelineFragment;

    .line 181
    .end local v0           #currentTabTag:Ljava/lang/String;
    .end local v1           #fragment:Landroid/support/v4/app/Fragment;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isShowing(Ljava/lang/String;)Z
    .locals 1
    .parameter "tag"

    .prologue
    .line 253
    if-eqz p1, :cond_0

    iget-object v0, p0, Lco/vine/android/ExploreChannelsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v0}, Lco/vine/android/widget/IconTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 186
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseTimelineActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 187
    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsActivity;->getCurrentTimeLineFragment()Lco/vine/android/BaseTimelineFragment;

    move-result-object v0

    .line 188
    .local v0, fragment:Lco/vine/android/BaseTimelineFragment;
    if-eqz v0, :cond_0

    .line 189
    invoke-virtual {v0, p1, p2, p3}, Lco/vine/android/BaseTimelineFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 191
    :cond_0
    return-void
.end method

.method public onContentChanged()V
    .locals 1

    .prologue
    .line 206
    invoke-super {p0}, Lco/vine/android/BaseTimelineActivity;->onContentChanged()V

    .line 207
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v0

    if-nez v0, :cond_0

    .line 208
    invoke-direct {p0}, Lco/vine/android/ExploreChannelsActivity;->setupTabs()V

    .line 210
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 29
    .parameter "savedInstanceState"

    .prologue
    .line 61
    const v24, 0x7f030040

    const/16 v25, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v24

    move/from16 v3, v25

    invoke-super {v0, v1, v2, v3}, Lco/vine/android/BaseTimelineActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 62
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v24

    if-eqz v24, :cond_0

    .line 63
    invoke-direct/range {p0 .. p0}, Lco/vine/android/ExploreChannelsActivity;->setupTabs()V

    .line 66
    :cond_0
    new-instance v24, Lco/vine/android/ExploreChannelsActivity$ExploreChannelsAppSessionListener;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/ExploreChannelsActivity$ExploreChannelsAppSessionListener;-><init>(Lco/vine/android/ExploreChannelsActivity;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/ExploreChannelsActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 69
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/ExploreChannelsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v15

    .line 70
    .local v15, intent:Landroid/content/Intent;
    if-eqz v15, :cond_1

    invoke-virtual {v15}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v24

    if-nez v24, :cond_2

    .line 71
    :cond_1
    new-instance v24, Ljava/lang/IllegalAccessError;

    const-string v25, "Intent data is null. You must provide a URI in order to view a video list."

    invoke-direct/range {v24 .. v25}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v24

    .line 73
    :cond_2
    invoke-virtual {v15}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v10

    .line 74
    .local v10, data:Landroid/net/Uri;
    invoke-virtual {v10}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x0

    invoke-interface/range {v24 .. v25}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 75
    .local v9, channelId:Ljava/lang/String;
    const-string v24, "icon"

    move-object/from16 v0, v24

    invoke-virtual {v10, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 76
    .local v13, iconPath:Ljava/lang/String;
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "#"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "navRGB"

    move-object/from16 v0, v25

    invoke-virtual {v10, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 77
    .local v17, navRGBParam:Ljava/lang/String;
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "#"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "titleRGB"

    move-object/from16 v0, v25

    invoke-virtual {v10, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 79
    .local v23, titleRGBParam:Ljava/lang/String;
    const-string v24, "name"

    move-object/from16 v0, v24

    invoke-virtual {v10, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 80
    .local v8, channel:Ljava/lang/String;
    if-eqz v8, :cond_3

    .line 81
    const/16 v24, 0x2b

    const/16 v25, 0x20

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v8, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v8

    .line 87
    :cond_3
    :try_start_0
    invoke-static/range {v17 .. v17}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v16

    .line 92
    .local v16, navRGB:I
    :goto_0
    :try_start_1
    invoke-static/range {v23 .. v23}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v22

    .line 97
    .local v22, titleRGB:I
    :goto_1
    const/16 v24, 0x1

    invoke-static/range {v24 .. v24}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v24

    const/16 v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v25

    const/16 v26, 0x0

    const/16 v27, 0x1

    invoke-static/range {v27 .. v27}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v27

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Lco/vine/android/ExploreChannelsActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 99
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/ExploreChannelsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v5

    .line 100
    .local v5, ab:Landroid/support/v7/app/ActionBar;
    if-eqz v5, :cond_4

    .line 101
    invoke-virtual {v5, v8}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 102
    new-instance v24, Landroid/graphics/drawable/ColorDrawable;

    move-object/from16 v0, v24

    move/from16 v1, v16

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Landroid/support/v7/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 107
    :cond_4
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v24

    const-string v25, "action_bar_title"

    const-string v26, "id"

    const-string v27, "android"

    invoke-virtual/range {v24 .. v27}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 108
    .local v6, actionBarTitleId:I
    if-lez v6, :cond_5

    .line 109
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lco/vine/android/ExploreChannelsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/TextView;

    .line 110
    .local v21, title:Landroid/widget/TextView;
    if-eqz v21, :cond_5

    .line 111
    invoke-virtual/range {v21 .. v22}, Landroid/widget/TextView;->setTextColor(I)V

    .line 116
    .end local v21           #title:Landroid/widget/TextView;
    :cond_5
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v24

    if-nez v24, :cond_6

    .line 117
    invoke-static/range {p0 .. p0}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lco/vine/android/client/VineAPI;->getBaseCdnUrl()Ljava/lang/String;

    move-result-object v7

    .line 118
    .local v7, baseUrl:Ljava/lang/String;
    new-instance v24, Lco/vine/android/util/image/ImageKey;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/ExploreChannelsActivity;->mIconImageKey:Lco/vine/android/util/image/ImageKey;

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mIconImageKey:Lco/vine/android/util/image/ImageKey;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 120
    .local v12, iconImage:Landroid/graphics/Bitmap;
    if-eqz v12, :cond_6

    .line 121
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lco/vine/android/ExploreChannelsActivity;->setIconImage(Landroid/graphics/Bitmap;)V

    .line 126
    .end local v7           #baseUrl:Ljava/lang/String;
    .end local v12           #iconImage:Landroid/graphics/Bitmap;
    :cond_6
    const v24, 0x7f0a00b2

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lco/vine/android/ExploreChannelsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v24

    check-cast v24, Lco/vine/android/widget/ViewPagerScrollBar;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/ExploreChannelsActivity;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lco/vine/android/widget/ViewPagerScrollBar;->setLineColor(I)V

    .line 128
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    move-object/from16 v24, v0

    const/16 v25, 0x2

    invoke-virtual/range {v24 .. v25}, Lco/vine/android/widget/ViewPagerScrollBar;->setRange(I)V

    .line 129
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lco/vine/android/widget/ViewPagerScrollBar;->setVisibility(I)V

    .line 131
    const v24, 0x7f0a0086

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lco/vine/android/ExploreChannelsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v24

    check-cast v24, Landroid/support/v4/view/ViewPager;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/ExploreChannelsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    move-object/from16 v24, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/ExploreChannelsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v25

    const v26, 0x7f0b0039

    invoke-virtual/range {v25 .. v26}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v25

    invoke-virtual/range {v24 .. v25}, Landroid/support/v4/view/ViewPager;->setPageMargin(I)V

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    move-object/from16 v24, v0

    const v25, 0x7f090009

    invoke-virtual/range {v24 .. v25}, Landroid/support/v4/view/ViewPager;->setPageMarginDrawable(I)V

    .line 134
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    move-object/from16 v24, v0

    const/16 v25, 0x1

    invoke-virtual/range {v24 .. v25}, Landroid/support/v4/view/ViewPager;->setOffscreenPageLimit(I)V

    .line 136
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    move-object/from16 v20, v0

    .line 137
    .local v20, tabHost:Lco/vine/android/widget/IconTabHost;
    new-instance v24, Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mScrollBar:Lco/vine/android/widget/ViewPagerScrollBar;

    move-object/from16 v26, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/HomeTabActivity$TabsAdapter;-><init>(Lco/vine/android/BaseControllerActionBarActivity;Landroid/widget/TabHost;Landroid/support/v4/view/ViewPager;Lco/vine/android/widget/ViewPagerScrollBar;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/ExploreChannelsActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    .line 138
    invoke-static/range {p0 .. p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v14

    .line 139
    .local v14, inflater:Landroid/view/LayoutInflater;
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 140
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->setOnTabClickedListener(Lco/vine/android/widget/IconTabHost$OnTabClickedListener;)V

    .line 143
    const/16 v24, 0x1

    const-string v25, "popular"

    const-string v26, "popular"

    move/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v15, v0, v9, v1, v2}, Lco/vine/android/ExploreChannelsFragment;->prepareArguments(Landroid/content/Intent;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v18

    .line 145
    .local v18, popularBundle:Landroid/os/Bundle;
    const-string v24, "empty_desc"

    const v25, 0x7f0e01bf

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 147
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-object/from16 v24, v0

    const-string v25, "popular"

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v25

    const v26, 0x7f03002e

    const v27, 0x7f0e01b5

    const/16 v28, 0x1

    move/from16 v0, v26

    move-object/from16 v1, v20

    move/from16 v2, v27

    move/from16 v3, v28

    invoke-static {v14, v0, v1, v2, v3}, Lco/vine/android/widget/TabIndicator;->newTextIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;IZ)Lco/vine/android/widget/TabIndicator;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v25

    const-class v26, Lco/vine/android/ExploreChannelsFragment;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v18

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/HomeTabActivity$TabsAdapter;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 153
    const/16 v24, 0x1

    const-string v25, "recent"

    const-string v26, "recent"

    move/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v15, v0, v9, v1, v2}, Lco/vine/android/ExploreChannelsFragment;->prepareArguments(Landroid/content/Intent;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v19

    .line 155
    .local v19, recentBundle:Landroid/os/Bundle;
    const-string v24, "empty_desc"

    const v25, 0x7f0e01bf

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 157
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ExploreChannelsActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    move-object/from16 v24, v0

    const-string v25, "recent"

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lco/vine/android/widget/IconTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v25

    const v26, 0x7f03002e

    const v27, 0x7f0e01b7

    const/16 v28, 0x1

    move/from16 v0, v26

    move-object/from16 v1, v20

    move/from16 v2, v27

    move/from16 v3, v28

    invoke-static {v14, v0, v1, v2, v3}, Lco/vine/android/widget/TabIndicator;->newTextIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;IZ)Lco/vine/android/widget/TabIndicator;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v25

    const-class v26, Lco/vine/android/ExploreChannelsFragment;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/HomeTabActivity$TabsAdapter;->addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 161
    return-void

    .line 88
    .end local v5           #ab:Landroid/support/v7/app/ActionBar;
    .end local v6           #actionBarTitleId:I
    .end local v14           #inflater:Landroid/view/LayoutInflater;
    .end local v16           #navRGB:I
    .end local v18           #popularBundle:Landroid/os/Bundle;
    .end local v19           #recentBundle:Landroid/os/Bundle;
    .end local v20           #tabHost:Lco/vine/android/widget/IconTabHost;
    .end local v22           #titleRGB:I
    :catch_0
    move-exception v11

    .line 89
    .local v11, e:Ljava/lang/IllegalArgumentException;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/ExploreChannelsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    const v25, 0x7f090076

    invoke-virtual/range {v24 .. v25}, Landroid/content/res/Resources;->getColor(I)I

    move-result v16

    .restart local v16       #navRGB:I
    goto/16 :goto_0

    .line 93
    .end local v11           #e:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v11

    .line 94
    .restart local v11       #e:Ljava/lang/IllegalArgumentException;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/ExploreChannelsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v24

    const v25, 0x7f090066

    invoke-virtual/range {v24 .. v25}, Landroid/content/res/Resources;->getColor(I)I

    move-result v22

    .restart local v22       #titleRGB:I
    goto/16 :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 165
    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f100003

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 166
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onCurrentTabClicked()V
    .locals 0

    .prologue
    .line 225
    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsActivity;->scrollTop()V

    .line 226
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 200
    invoke-super {p0}, Lco/vine/android/BaseTimelineActivity;->onResume()V

    .line 201
    iget-object v0, p0, Lco/vine/android/ExploreChannelsActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    iget-object v1, p0, Lco/vine/android/ExploreChannelsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v1}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v1

    iput v1, v0, Lco/vine/android/HomeTabActivity$TabsAdapter;->previousTab:I

    .line 202
    return-void
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 2
    .parameter "s"

    .prologue
    .line 195
    iget-object v0, p0, Lco/vine/android/ExploreChannelsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lco/vine/android/ExploreChannelsActivity;->mTabHost:Lco/vine/android/widget/IconTabHost;

    invoke-virtual {v1}, Lco/vine/android/widget/IconTabHost;->getCurrentTab()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 196
    return-void
.end method

.method public scrollTop()V
    .locals 5

    .prologue
    .line 229
    iget-object v3, p0, Lco/vine/android/ExploreChannelsActivity;->mTabsAdapter:Lco/vine/android/HomeTabActivity$TabsAdapter;

    iget-object v4, p0, Lco/vine/android/ExploreChannelsActivity;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v4}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v4

    invoke-virtual {v3, v4}, Lco/vine/android/HomeTabActivity$TabsAdapter;->getTab(I)Lco/vine/android/HomeTabActivity$TabInfo;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/HomeTabActivity$TabInfo;->fragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 233
    .local v0, fragment:Landroid/support/v4/app/Fragment;
    instance-of v3, v0, Lco/vine/android/BaseListFragment;

    if-nez v3, :cond_1

    .line 250
    .end local v0           #fragment:Landroid/support/v4/app/Fragment;
    :cond_0
    :goto_0
    return-void

    .line 237
    .restart local v0       #fragment:Landroid/support/v4/app/Fragment;
    :cond_1
    if-eqz v0, :cond_0

    .line 240
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v2

    .line 241
    .local v2, view:Landroid/view/View;
    if-eqz v2, :cond_0

    .line 244
    const v3, 0x102000a

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/twitter/android/widget/TopScrollable;

    .line 246
    .local v1, list:Lcom/twitter/android/widget/TopScrollable;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/twitter/android/widget/TopScrollable;->scrollTop()Z

    move-result v3

    if-nez v3, :cond_0

    .line 248
    check-cast v0, Lco/vine/android/BaseListFragment;

    .end local v0           #fragment:Landroid/support/v4/app/Fragment;
    invoke-virtual {v0}, Lco/vine/android/BaseListFragment;->invokeScrollFirstItem()V

    goto :goto_0
.end method
