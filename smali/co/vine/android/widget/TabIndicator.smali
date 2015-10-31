.class public Lco/vine/android/widget/TabIndicator;
.super Landroid/widget/RelativeLayout;
.source "TabIndicator.java"


# instance fields
.field private mIcon:Landroid/widget/ImageView;

.field private mIconNewResId:I

.field private mIconResId:I

.field private mNew:Z

.field private mNewIndicator:Landroid/widget/ImageView;

.field private mTabText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 27
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    return-void
.end method

.method public static newIconIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;II)Lco/vine/android/widget/TabIndicator;
    .locals 3
    .parameter "inflater"
    .parameter "layout"
    .parameter "tabHost"
    .parameter "iconResId"
    .parameter "newResId"

    .prologue
    .line 50
    invoke-virtual {p2}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/TabIndicator;

    .line 52
    .local v0, indicator:Lco/vine/android/widget/TabIndicator;
    if-lez p3, :cond_0

    .line 53
    invoke-virtual {v0, p3, p4}, Lco/vine/android/widget/TabIndicator;->setTabIcon(II)V

    .line 55
    :cond_0
    return-object v0
.end method

.method public static newTextIndicator(Landroid/view/LayoutInflater;ILandroid/widget/TabHost;IZ)Lco/vine/android/widget/TabIndicator;
    .locals 3
    .parameter "inflater"
    .parameter "layout"
    .parameter "tabHost"
    .parameter "tabTextId"
    .parameter "caps"

    .prologue
    .line 40
    invoke-virtual {p2}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/TabIndicator;

    .line 42
    .local v0, indicator:Lco/vine/android/widget/TabIndicator;
    if-lez p3, :cond_0

    .line 43
    invoke-virtual {v0, p3, p4}, Lco/vine/android/widget/TabIndicator;->setTabText(IZ)V

    .line 45
    :cond_0
    return-object v0
.end method


# virtual methods
.method protected drawableStateChanged()V
    .locals 1

    .prologue
    .line 118
    invoke-super {p0}, Landroid/widget/RelativeLayout;->drawableStateChanged()V

    .line 119
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mTabText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 124
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .prologue
    .line 61
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 62
    const v0, 0x7f0a0090

    invoke-virtual {p0, v0}, Lco/vine/android/widget/TabIndicator;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/TabIndicator;->mTabText:Landroid/widget/TextView;

    .line 63
    const v0, 0x7f0a0091

    invoke-virtual {p0, v0}, Lco/vine/android/widget/TabIndicator;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/TabIndicator;->mNewIndicator:Landroid/widget/ImageView;

    .line 64
    const v0, 0x7f0a0033

    invoke-virtual {p0, v0}, Lco/vine/android/widget/TabIndicator;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/TabIndicator;->mIcon:Landroid/widget/ImageView;

    .line 65
    return-void
.end method

.method public setNew(Z)V
    .locals 2
    .parameter "isNew"

    .prologue
    .line 68
    iget-boolean v0, p0, Lco/vine/android/widget/TabIndicator;->mNew:Z

    if-ne p1, v0, :cond_0

    .line 86
    :goto_0
    return-void

    .line 72
    :cond_0
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mNewIndicator:Landroid/widget/ImageView;

    if-eqz v0, :cond_3

    .line 73
    if-eqz p1, :cond_2

    .line 74
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mNewIndicator:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 85
    :cond_1
    :goto_1
    iput-boolean p1, p0, Lco/vine/android/widget/TabIndicator;->mNew:Z

    goto :goto_0

    .line 76
    :cond_2
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mNewIndicator:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    .line 78
    :cond_3
    iget v0, p0, Lco/vine/android/widget/TabIndicator;->mIconNewResId:I

    if-lez v0, :cond_1

    .line 79
    if-eqz p1, :cond_4

    .line 80
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mIcon:Landroid/widget/ImageView;

    iget v1, p0, Lco/vine/android/widget/TabIndicator;->mIconNewResId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    .line 82
    :cond_4
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mIcon:Landroid/widget/ImageView;

    iget v1, p0, Lco/vine/android/widget/TabIndicator;->mIconResId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1
.end method

.method public setTabIcon(II)V
    .locals 2
    .parameter "resId"
    .parameter "newResId"

    .prologue
    .line 104
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mIcon:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 105
    if-lez p1, :cond_1

    .line 106
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 107
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mIcon:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 112
    :cond_0
    :goto_0
    iput p1, p0, Lco/vine/android/widget/TabIndicator;->mIconResId:I

    .line 113
    iput p2, p0, Lco/vine/android/widget/TabIndicator;->mIconNewResId:I

    .line 114
    return-void

    .line 109
    :cond_1
    iget-object v0, p0, Lco/vine/android/widget/TabIndicator;->mIcon:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method public setTabText(IZ)V
    .locals 3
    .parameter "resId"
    .parameter "caps"

    .prologue
    .line 89
    iget-object v1, p0, Lco/vine/android/widget/TabIndicator;->mTabText:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 90
    invoke-virtual {p0}, Lco/vine/android/widget/TabIndicator;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, text:Ljava/lang/String;
    if-eqz p2, :cond_0

    .line 92
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 94
    :cond_0
    if-lez p1, :cond_2

    .line 95
    iget-object v1, p0, Lco/vine/android/widget/TabIndicator;->mTabText:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 96
    iget-object v1, p0, Lco/vine/android/widget/TabIndicator;->mTabText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .end local v0           #text:Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 98
    .restart local v0       #text:Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lco/vine/android/widget/TabIndicator;->mTabText:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method
