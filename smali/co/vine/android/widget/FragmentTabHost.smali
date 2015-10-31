.class public Lco/vine/android/widget/FragmentTabHost;
.super Landroid/widget/TabHost;
.source "FragmentTabHost.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widget/FragmentTabHost$1;,
        Lco/vine/android/widget/FragmentTabHost$SavedState;,
        Lco/vine/android/widget/FragmentTabHost$DummyTabFactory;,
        Lco/vine/android/widget/FragmentTabHost$TabInfo;
    }
.end annotation


# instance fields
.field private mAttached:Z

.field private mContainerId:I

.field private mContext:Landroid/content/Context;

.field private mFragmentManager:Landroid/support/v4/app/FragmentManager;

.field private mLastTab:Lco/vine/android/widget/FragmentTabHost$TabInfo;

.field private mOnTabChangeListener:Landroid/widget/TabHost$OnTabChangeListener;

.field private mRealTabContent:Landroid/widget/FrameLayout;

.field private final mTabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/widget/FragmentTabHost$TabInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 136
    invoke-direct {p0, p1, v1}, Landroid/widget/TabHost;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/widget/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    .line 137
    invoke-direct {p0, p1, v1}, Lco/vine/android/widget/FragmentTabHost;->initFragmentTabHost(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 138
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 141
    invoke-direct {p0, p1, p2}, Landroid/widget/TabHost;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/widget/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    .line 142
    invoke-direct {p0, p1, p2}, Lco/vine/android/widget/FragmentTabHost;->initFragmentTabHost(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 143
    return-void
.end method

.method private doTabChanged(Ljava/lang/String;Landroid/support/v4/app/FragmentTransaction;)Landroid/support/v4/app/FragmentTransaction;
    .locals 7
    .parameter "tabId"
    .parameter "ft"

    .prologue
    .line 329
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 330
    const-string p1, "users"

    .line 332
    :cond_0
    const/4 v2, 0x0

    .line 333
    .local v2, newTab:Lco/vine/android/widget/FragmentTabHost$TabInfo;
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/widget/FragmentTabHost$TabInfo;

    .line 334
    .local v3, tab:Lco/vine/android/widget/FragmentTabHost$TabInfo;
    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;
    invoke-static {v3}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$200(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 335
    move-object v2, v3

    goto :goto_0

    .line 338
    .end local v3           #tab:Lco/vine/android/widget/FragmentTabHost$TabInfo;
    :cond_2
    if-nez v2, :cond_3

    .line 339
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "No tab known for tag "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    move-object v0, p2

    .line 363
    .end local p2
    .local v0, ft:Landroid/support/v4/app/FragmentTransaction;
    :goto_1
    return-object v0

    .line 342
    .end local v0           #ft:Landroid/support/v4/app/FragmentTransaction;
    .restart local p2
    :cond_3
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mLastTab:Lco/vine/android/widget/FragmentTabHost$TabInfo;

    if-eq v4, v2, :cond_7

    .line 343
    if-nez p2, :cond_4

    .line 344
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object p2

    .line 346
    :cond_4
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mLastTab:Lco/vine/android/widget/FragmentTabHost$TabInfo;

    if-eqz v4, :cond_5

    .line 347
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mLastTab:Lco/vine/android/widget/FragmentTabHost$TabInfo;

    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v4}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 348
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mLastTab:Lco/vine/android/widget/FragmentTabHost$TabInfo;

    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v4}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    invoke-virtual {p2, v4}, Landroid/support/v4/app/FragmentTransaction;->detach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 351
    :cond_5
    if-eqz v2, :cond_6

    .line 352
    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v2}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    if-nez v4, :cond_8

    .line 353
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mContext:Landroid/content/Context;

    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->clss:Ljava/lang/Class;
    invoke-static {v2}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$300(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->args:Landroid/os/Bundle;
    invoke-static {v2}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$400(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/os/Bundle;

    move-result-object v6

    invoke-static {v4, v5, v6}, Landroid/support/v4/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    #setter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v2, v4}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$102(Lco/vine/android/widget/FragmentTabHost$TabInfo;Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/Fragment;

    .line 355
    iget v4, p0, Lco/vine/android/widget/FragmentTabHost;->mContainerId:I

    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v2}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v5

    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$200(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v4, v5, v6}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 361
    :cond_6
    :goto_2
    iput-object v2, p0, Lco/vine/android/widget/FragmentTabHost;->mLastTab:Lco/vine/android/widget/FragmentTabHost$TabInfo;

    :cond_7
    move-object v0, p2

    .line 363
    .end local p2
    .restart local v0       #ft:Landroid/support/v4/app/FragmentTransaction;
    goto :goto_1

    .line 357
    .end local v0           #ft:Landroid/support/v4/app/FragmentTransaction;
    .restart local p2
    :cond_8
    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v2}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    invoke-virtual {p2, v4}, Landroid/support/v4/app/FragmentTransaction;->attach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto :goto_2
.end method

.method private ensureContent()V
    .locals 3

    .prologue
    .line 215
    iget-object v0, p0, Lco/vine/android/widget/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    if-nez v0, :cond_0

    .line 216
    iget v0, p0, Lco/vine/android/widget/FragmentTabHost;->mContainerId:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FragmentTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lco/vine/android/widget/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    .line 217
    iget-object v0, p0, Lco/vine/android/widget/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    if-nez v0, :cond_0

    .line 218
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No tab content FrameLayout found for id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lco/vine/android/widget/FragmentTabHost;->mContainerId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 222
    :cond_0
    return-void
.end method

.method private initFragmentTabHost(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 11
    .parameter "context"
    .parameter "attrs"

    .prologue
    const v10, 0x1020013

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, -0x1

    const/4 v6, 0x0

    .line 146
    new-array v4, v9, [I

    const v5, 0x10100f3

    aput v5, v4, v6

    invoke-virtual {p1, p2, v4, v6, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 148
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v6, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    iput v4, p0, Lco/vine/android/widget/FragmentTabHost;->mContainerId:I

    .line 149
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 151
    invoke-super {p0, p0}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 155
    invoke-virtual {p0, v10}, Lco/vine/android/widget/FragmentTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-nez v4, :cond_0

    .line 156
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 157
    .local v2, ll:Landroid/widget/LinearLayout;
    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 158
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v2, v4}, Lco/vine/android/widget/FragmentTabHost;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    new-instance v3, Landroid/widget/TabWidget;

    invoke-direct {v3, p1}, Landroid/widget/TabWidget;-><init>(Landroid/content/Context;)V

    .line 163
    .local v3, tw:Landroid/widget/TabWidget;
    invoke-virtual {v3, v10}, Landroid/widget/TabWidget;->setId(I)V

    .line 164
    invoke-virtual {v3, v6}, Landroid/widget/TabWidget;->setOrientation(I)V

    .line 165
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v4, v7, v5, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 169
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 170
    .local v1, fl:Landroid/widget/FrameLayout;
    const v4, 0x1020011

    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->setId(I)V

    .line 171
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v6, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    new-instance v1, Landroid/widget/FrameLayout;

    .end local v1           #fl:Landroid/widget/FrameLayout;
    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .restart local v1       #fl:Landroid/widget/FrameLayout;
    iput-object v1, p0, Lco/vine/android/widget/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    .line 174
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    iget v5, p0, Lco/vine/android/widget/FragmentTabHost;->mContainerId:I

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setId(I)V

    .line 175
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f80

    invoke-direct {v4, v7, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 178
    .end local v1           #fl:Landroid/widget/FrameLayout;
    .end local v2           #ll:Landroid/widget/LinearLayout;
    .end local v3           #tw:Landroid/widget/TabWidget;
    :cond_0
    return-void
.end method


# virtual methods
.method public addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 5
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
    .line 230
    .local p2, clss:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    new-instance v3, Lco/vine/android/widget/FragmentTabHost$DummyTabFactory;

    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Lco/vine/android/widget/FragmentTabHost$DummyTabFactory;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v3}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/widget/TabHost$TabContentFactory;)Landroid/widget/TabHost$TabSpec;

    .line 231
    invoke-virtual {p1}, Landroid/widget/TabHost$TabSpec;->getTag()Ljava/lang/String;

    move-result-object v2

    .line 233
    .local v2, tag:Ljava/lang/String;
    new-instance v1, Lco/vine/android/widget/FragmentTabHost$TabInfo;

    invoke-direct {v1, v2, p2, p3}, Lco/vine/android/widget/FragmentTabHost$TabInfo;-><init>(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)V

    .line 235
    .local v1, info:Lco/vine/android/widget/FragmentTabHost$TabInfo;
    iget-boolean v3, p0, Lco/vine/android/widget/FragmentTabHost;->mAttached:Z

    if-eqz v3, :cond_0

    .line 239
    iget-object v3, p0, Lco/vine/android/widget/FragmentTabHost;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v3, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    #setter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v1, v3}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$102(Lco/vine/android/widget/FragmentTabHost$TabInfo;Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/Fragment;

    .line 240
    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v1}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    if-eqz v3, :cond_0

    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v1}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v3

    if-nez v3, :cond_0

    .line 241
    iget-object v3, p0, Lco/vine/android/widget/FragmentTabHost;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 242
    .local v0, ft:Landroid/support/v4/app/FragmentTransaction;
    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v1}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/support/v4/app/FragmentTransaction;->detach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 243
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 247
    .end local v0           #ft:Landroid/support/v4/app/FragmentTransaction;
    :cond_0
    iget-object v3, p0, Lco/vine/android/widget/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 248
    invoke-virtual {p0, p1}, Lco/vine/android/widget/FragmentTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 249
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 6

    .prologue
    .line 253
    invoke-super {p0}, Landroid/widget/TabHost;->onAttachedToWindow()V

    .line 255
    invoke-virtual {p0}, Lco/vine/android/widget/FragmentTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v0

    .line 259
    .local v0, currentTab:Ljava/lang/String;
    const/4 v1, 0x0

    .line 260
    .local v1, ft:Landroid/support/v4/app/FragmentTransaction;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 261
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/widget/FragmentTabHost$TabInfo;

    .line 262
    .local v3, tab:Lco/vine/android/widget/FragmentTabHost$TabInfo;
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;
    invoke-static {v3}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$200(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    #setter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v3, v4}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$102(Lco/vine/android/widget/FragmentTabHost$TabInfo;Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/Fragment;

    .line 263
    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v3}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    if-eqz v4, :cond_0

    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v3}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/Fragment;->isDetached()Z

    move-result v4

    if-nez v4, :cond_0

    .line 264
    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;
    invoke-static {v3}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$200(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 268
    iput-object v3, p0, Lco/vine/android/widget/FragmentTabHost;->mLastTab:Lco/vine/android/widget/FragmentTabHost$TabInfo;

    .line 260
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 272
    :cond_1
    if-nez v1, :cond_2

    .line 273
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 275
    :cond_2
    #getter for: Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;
    invoke-static {v3}, Lco/vine/android/widget/FragmentTabHost$TabInfo;->access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v4/app/FragmentTransaction;->detach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto :goto_1

    .line 282
    .end local v3           #tab:Lco/vine/android/widget/FragmentTabHost$TabInfo;
    :cond_3
    const/4 v4, 0x1

    iput-boolean v4, p0, Lco/vine/android/widget/FragmentTabHost;->mAttached:Z

    .line 283
    invoke-direct {p0, v0, v1}, Lco/vine/android/widget/FragmentTabHost;->doTabChanged(Ljava/lang/String;Landroid/support/v4/app/FragmentTransaction;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 284
    if-eqz v1, :cond_4

    .line 285
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 286
    iget-object v4, p0, Lco/vine/android/widget/FragmentTabHost;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z

    .line 288
    :cond_4
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 292
    invoke-super {p0}, Landroid/widget/TabHost;->onDetachedFromWindow()V

    .line 293
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/widget/FragmentTabHost;->mAttached:Z

    .line 294
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2
    .parameter "state"

    .prologue
    .line 306
    move-object v0, p1

    check-cast v0, Lco/vine/android/widget/FragmentTabHost$SavedState;

    .line 307
    .local v0, ss:Lco/vine/android/widget/FragmentTabHost$SavedState;
    invoke-virtual {v0}, Lco/vine/android/widget/FragmentTabHost$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/TabHost;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 308
    iget-object v1, v0, Lco/vine/android/widget/FragmentTabHost$SavedState;->curTab:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lco/vine/android/widget/FragmentTabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    .line 309
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 298
    invoke-super {p0}, Landroid/widget/TabHost;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 299
    .local v1, superState:Landroid/os/Parcelable;
    new-instance v0, Lco/vine/android/widget/FragmentTabHost$SavedState;

    invoke-direct {v0, v1}, Lco/vine/android/widget/FragmentTabHost$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 300
    .local v0, ss:Lco/vine/android/widget/FragmentTabHost$SavedState;
    invoke-virtual {p0}, Lco/vine/android/widget/FragmentTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/widget/FragmentTabHost$SavedState;->curTab:Ljava/lang/String;

    .line 301
    return-object v0
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 2
    .parameter "tabId"

    .prologue
    .line 313
    iget-boolean v1, p0, Lco/vine/android/widget/FragmentTabHost;->mAttached:Z

    if-eqz v1, :cond_0

    .line 314
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lco/vine/android/widget/FragmentTabHost;->doTabChanged(Ljava/lang/String;Landroid/support/v4/app/FragmentTransaction;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 315
    .local v0, ft:Landroid/support/v4/app/FragmentTransaction;
    if-eqz v0, :cond_0

    .line 316
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 319
    .end local v0           #ft:Landroid/support/v4/app/FragmentTransaction;
    :cond_0
    iget-object v1, p0, Lco/vine/android/widget/FragmentTabHost;->mOnTabChangeListener:Landroid/widget/TabHost$OnTabChangeListener;

    if-eqz v1, :cond_1

    .line 320
    iget-object v1, p0, Lco/vine/android/widget/FragmentTabHost;->mOnTabChangeListener:Landroid/widget/TabHost$OnTabChangeListener;

    invoke-interface {v1, p1}, Landroid/widget/TabHost$OnTabChangeListener;->onTabChanged(Ljava/lang/String;)V

    .line 322
    :cond_1
    return-void
.end method

.method public setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 226
    iput-object p1, p0, Lco/vine/android/widget/FragmentTabHost;->mOnTabChangeListener:Landroid/widget/TabHost$OnTabChangeListener;

    .line 227
    return-void
.end method

.method public setup()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 188
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must call setup() that takes a Context and FragmentManager"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setup(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;)V
    .locals 0
    .parameter "context"
    .parameter "manager"

    .prologue
    .line 193
    invoke-super {p0}, Landroid/widget/TabHost;->setup()V

    .line 194
    iput-object p1, p0, Lco/vine/android/widget/FragmentTabHost;->mContext:Landroid/content/Context;

    .line 195
    iput-object p2, p0, Lco/vine/android/widget/FragmentTabHost;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    .line 196
    invoke-direct {p0}, Lco/vine/android/widget/FragmentTabHost;->ensureContent()V

    .line 197
    return-void
.end method

.method public setup(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;I)V
    .locals 2
    .parameter "context"
    .parameter "manager"
    .parameter "containerId"

    .prologue
    .line 200
    invoke-super {p0}, Landroid/widget/TabHost;->setup()V

    .line 201
    iput-object p1, p0, Lco/vine/android/widget/FragmentTabHost;->mContext:Landroid/content/Context;

    .line 202
    iput-object p2, p0, Lco/vine/android/widget/FragmentTabHost;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    .line 203
    iput p3, p0, Lco/vine/android/widget/FragmentTabHost;->mContainerId:I

    .line 204
    invoke-direct {p0}, Lco/vine/android/widget/FragmentTabHost;->ensureContent()V

    .line 205
    iget-object v0, p0, Lco/vine/android/widget/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p3}, Landroid/widget/FrameLayout;->setId(I)V

    .line 209
    invoke-virtual {p0}, Lco/vine/android/widget/FragmentTabHost;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 210
    const v0, 0x1020012

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FragmentTabHost;->setId(I)V

    .line 212
    :cond_0
    return-void
.end method
