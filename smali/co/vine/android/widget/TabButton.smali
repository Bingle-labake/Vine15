.class public Lco/vine/android/widget/TabButton;
.super Landroid/widget/Button;
.source "TabButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widget/TabButton$TabChanger;
    }
.end annotation


# static fields
.field private static final TAB_SELECTED_STATE_SET:[I


# instance fields
.field private final mDeselectedColor:I

.field private mSelected:Z

.field private final mSelectedColor:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 20
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x7f01003d

    aput v2, v0, v1

    sput-object v0, Lco/vine/android/widget/TabButton;->TAB_SELECTED_STATE_SET:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/widget/TabButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/widget/TabButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09004c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lco/vine/android/widget/TabButton;->mSelectedColor:I

    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09004d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lco/vine/android/widget/TabButton;->mDeselectedColor:I

    .line 38
    return-void
.end method


# virtual methods
.method protected onCreateDrawableState(I)[I
    .locals 2
    .parameter "extraSpace"

    .prologue
    .line 42
    add-int/lit8 v1, p1, 0x1

    invoke-super {p0, v1}, Landroid/widget/Button;->onCreateDrawableState(I)[I

    move-result-object v0

    .line 43
    .local v0, drawableState:[I
    iget-boolean v1, p0, Lco/vine/android/widget/TabButton;->mSelected:Z

    if-eqz v1, :cond_0

    .line 44
    sget-object v1, Lco/vine/android/widget/TabButton;->TAB_SELECTED_STATE_SET:[I

    invoke-static {v0, v1}, Lco/vine/android/widget/TabButton;->mergeDrawableStates([I[I)[I

    .line 46
    :cond_0
    return-object v0
.end method

.method public setSelected(Z)V
    .locals 1
    .parameter "selected"

    .prologue
    .line 50
    if-eqz p1, :cond_0

    .line 51
    iget v0, p0, Lco/vine/android/widget/TabButton;->mSelectedColor:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/TabButton;->setTextColor(I)V

    .line 55
    :goto_0
    iput-boolean p1, p0, Lco/vine/android/widget/TabButton;->mSelected:Z

    .line 56
    invoke-virtual {p0}, Lco/vine/android/widget/TabButton;->refreshDrawableState()V

    .line 57
    return-void

    .line 53
    :cond_0
    iget v0, p0, Lco/vine/android/widget/TabButton;->mDeselectedColor:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/TabButton;->setTextColor(I)V

    goto :goto_0
.end method
