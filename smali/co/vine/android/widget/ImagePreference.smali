.class public Lco/vine/android/widget/ImagePreference;
.super Landroid/preference/Preference;
.source "ImagePreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widget/ImagePreference$OnImagePreferenceBoundListener;
    }
.end annotation


# instance fields
.field private mBorder:Landroid/widget/ImageView;

.field private mContext:Landroid/content/Context;

.field private mImage:Landroid/widget/ImageView;

.field private mListener:Lco/vine/android/widget/ImagePreference$OnImagePreferenceBoundListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/widget/ImagePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/widget/ImagePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    const v0, 0x7f03003a

    invoke-virtual {p0, v0}, Lco/vine/android/widget/ImagePreference;->setLayoutResource(I)V

    .line 41
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/widget/ImagePreference;->setSelectable(Z)V

    .line 42
    iput-object p1, p0, Lco/vine/android/widget/ImagePreference;->mContext:Landroid/content/Context;

    .line 43
    return-void
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 86
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 87
    const v0, 0x7f0a0051

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/ImagePreference;->mImage:Landroid/widget/ImageView;

    .line 88
    const v0, 0x7f0a0150

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/ImagePreference;->mBorder:Landroid/widget/ImageView;

    .line 89
    iget-object v0, p0, Lco/vine/android/widget/ImagePreference;->mListener:Lco/vine/android/widget/ImagePreference$OnImagePreferenceBoundListener;

    invoke-interface {v0, p0}, Lco/vine/android/widget/ImagePreference$OnImagePreferenceBoundListener;->onImagePeferenceBound(Lco/vine/android/widget/ImagePreference;)V

    .line 90
    return-void
.end method

.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .parameter "parent"

    .prologue
    .line 47
    invoke-super {p0, p1}, Landroid/preference/Preference;->onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 48
    .local v1, v:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 50
    .local v0, params:Landroid/view/ViewGroup$LayoutParams;
    iget-object v2, p0, Lco/vine/android/widget/ImagePreference;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b003a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 51
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    return-object v1
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 3
    .parameter "bmp"

    .prologue
    .line 57
    iget-object v0, p0, Lco/vine/android/widget/ImagePreference;->mImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lco/vine/android/widget/ImagePreference;->mImage:Landroid/widget/ImageView;

    new-instance v1, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v2, p0, Lco/vine/android/widget/ImagePreference;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 60
    :cond_0
    return-void
.end method

.method public setBorderDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 69
    iget-object v0, p0, Lco/vine/android/widget/ImagePreference;->mBorder:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lco/vine/android/widget/ImagePreference;->mBorder:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 72
    :cond_0
    return-void
.end method

.method public setDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 63
    iget-object v0, p0, Lco/vine/android/widget/ImagePreference;->mImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lco/vine/android/widget/ImagePreference;->mImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 66
    :cond_0
    return-void
.end method

.method public setImageClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 79
    iget-object v0, p0, Lco/vine/android/widget/ImagePreference;->mImage:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lco/vine/android/widget/ImagePreference;->mImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    :cond_0
    return-void
.end method

.method public setPreferenceBoundListener(Lco/vine/android/widget/ImagePreference$OnImagePreferenceBoundListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 75
    iput-object p1, p0, Lco/vine/android/widget/ImagePreference;->mListener:Lco/vine/android/widget/ImagePreference$OnImagePreferenceBoundListener;

    .line 76
    return-void
.end method
