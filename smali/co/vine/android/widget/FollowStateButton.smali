.class public Lco/vine/android/widget/FollowStateButton;
.super Landroid/widget/Button;
.source "FollowStateButton.java"


# static fields
.field public static final STATE_FOLLOWING:I = 0x3

.field public static final STATE_FOLLOW_REQUESTED:I = 0x4

.field public static final STATE_NOT_FOLLOWING:I = 0x2

.field public static final STATE_SELF:I = 0x1


# instance fields
.field private mFollowRequestedDrawableRes:I

.field private mFollowRequestedText:I

.field private mFollowRequestedTextColor:I

.field private mFollowingDrawableRes:I

.field private mFollowingText:I

.field private mFollowingTextColor:I

.field private mNotFollowingDrawableRes:I

.field private mNotFollowingText:I

.field private mNotFollowingTextColor:I

.field private mSelfDrawableRes:I

.field private mSelfText:I

.field private mSelfTextColor:I

.field private mState:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/widget/FollowStateButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/widget/FollowStateButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const v6, 0x7f090049

    const/4 v5, 0x5

    const/4 v4, 0x0

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    sget-object v2, Lco/vine/android/R$styleable;->FollowStateButton:[I

    invoke-virtual {p1, p2, v2, p3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 48
    .local v0, a:Landroid/content/res/TypedArray;
    const v2, 0x7f0200a8

    invoke-virtual {v0, v4, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mSelfDrawableRes:I

    .line 50
    const/4 v2, 0x3

    const v3, 0x7f0200a2

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mNotFollowingDrawableRes:I

    .line 53
    const/4 v2, 0x6

    const v3, 0x7f0200a5

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mFollowingDrawableRes:I

    .line 55
    const/16 v2, 0x9

    const v3, 0x7f0200ab

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mFollowRequestedDrawableRes:I

    .line 58
    const/4 v2, 0x1

    const v3, 0x7f0e00af

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mSelfText:I

    .line 60
    const/4 v2, 0x4

    const v3, 0x7f0e00c9

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mNotFollowingText:I

    .line 62
    const/4 v2, 0x7

    const v3, 0x7f0e00cf

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mFollowingText:I

    .line 64
    const/16 v2, 0xa

    const v3, 0x7f0e00ce

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mFollowRequestedText:I

    .line 67
    invoke-virtual {p0}, Lco/vine/android/widget/FollowStateButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 69
    .local v1, res:Landroid/content/res/Resources;
    const/4 v2, 0x2

    const v3, 0x7f09003a

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mSelfTextColor:I

    .line 71
    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v5, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mNotFollowingTextColor:I

    .line 73
    const v2, 0x7f09003f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v5, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mFollowingTextColor:I

    .line 75
    const/16 v2, 0xb

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/FollowStateButton;->mFollowRequestedTextColor:I

    .line 78
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 80
    invoke-virtual {p0}, Lco/vine/android/widget/FollowStateButton;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b002b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {p0, v2, v4, v4, v4}, Lco/vine/android/widget/FollowStateButton;->setPadding(IIII)V

    .line 81
    invoke-virtual {p0}, Lco/vine/android/widget/FollowStateButton;->invalidate()V

    .line 82
    return-void
.end method

.method private setState(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 123
    packed-switch p1, :pswitch_data_0

    .line 152
    :goto_0
    return-void

    .line 125
    :pswitch_0
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mSelfDrawableRes:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setBackgroundResource(I)V

    .line 126
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mSelfText:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setText(I)V

    .line 127
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mSelfTextColor:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setTextColor(I)V

    .line 128
    const/4 v0, 0x1

    iput v0, p0, Lco/vine/android/widget/FollowStateButton;->mState:I

    goto :goto_0

    .line 132
    :pswitch_1
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mNotFollowingDrawableRes:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setBackgroundResource(I)V

    .line 133
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mNotFollowingText:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setText(I)V

    .line 134
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mNotFollowingTextColor:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setTextColor(I)V

    .line 135
    const/4 v0, 0x2

    iput v0, p0, Lco/vine/android/widget/FollowStateButton;->mState:I

    goto :goto_0

    .line 139
    :pswitch_2
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mFollowingDrawableRes:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setBackgroundResource(I)V

    .line 140
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mFollowingText:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setText(I)V

    .line 141
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mFollowingTextColor:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setTextColor(I)V

    .line 142
    const/4 v0, 0x3

    iput v0, p0, Lco/vine/android/widget/FollowStateButton;->mState:I

    goto :goto_0

    .line 146
    :pswitch_3
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mFollowRequestedDrawableRes:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setBackgroundResource(I)V

    .line 147
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mFollowRequestedText:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setText(I)V

    .line 148
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mFollowRequestedTextColor:I

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setTextColor(I)V

    goto :goto_0

    .line 123
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public follow(Lco/vine/android/api/VineUser;)V
    .locals 3
    .parameter "user"

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x3

    .line 102
    invoke-virtual {p1}, Lco/vine/android/api/VineUser;->isPrivate()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 103
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mState:I

    if-eq v0, v2, :cond_0

    .line 104
    invoke-direct {p0, v2}, Lco/vine/android/widget/FollowStateButton;->setState(I)V

    .line 105
    invoke-virtual {p0}, Lco/vine/android/widget/FollowStateButton;->invalidate()V

    .line 113
    :cond_0
    :goto_0
    return-void

    .line 108
    :cond_1
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mState:I

    if-eq v0, v1, :cond_0

    .line 109
    invoke-direct {p0, v1}, Lco/vine/android/widget/FollowStateButton;->setState(I)V

    .line 110
    invoke-virtual {p0}, Lco/vine/android/widget/FollowStateButton;->invalidate()V

    goto :goto_0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mState:I

    return v0
.end method

.method public setUser(JLco/vine/android/api/VineUser;)V
    .locals 2
    .parameter "ownerId"
    .parameter "user"

    .prologue
    .line 85
    iget-wide v0, p3, Lco/vine/android/api/VineUser;->userId:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 86
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setState(I)V

    .line 94
    :goto_0
    invoke-virtual {p0}, Lco/vine/android/widget/FollowStateButton;->invalidate()V

    .line 95
    return-void

    .line 87
    :cond_0
    invoke-virtual {p3}, Lco/vine/android/api/VineUser;->hasFollowRequested()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 88
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setState(I)V

    goto :goto_0

    .line 89
    :cond_1
    invoke-virtual {p3}, Lco/vine/android/api/VineUser;->isFollowing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 90
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setState(I)V

    goto :goto_0

    .line 92
    :cond_2
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lco/vine/android/widget/FollowStateButton;->setState(I)V

    goto :goto_0
.end method

.method public unfollow()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 116
    iget v0, p0, Lco/vine/android/widget/FollowStateButton;->mState:I

    if-eq v0, v1, :cond_0

    .line 117
    invoke-direct {p0, v1}, Lco/vine/android/widget/FollowStateButton;->setState(I)V

    .line 118
    invoke-virtual {p0}, Lco/vine/android/widget/FollowStateButton;->invalidate()V

    .line 120
    :cond_0
    return-void
.end method
