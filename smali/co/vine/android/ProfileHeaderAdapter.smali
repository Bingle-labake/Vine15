.class public Lco/vine/android/ProfileHeaderAdapter;
.super Landroid/widget/BaseAdapter;
.source "ProfileHeaderAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;
    }
.end annotation


# instance fields
.field private mAppController:Lco/vine/android/client/AppController;

.field private mBlocked:Z

.field private mContext:Landroid/content/Context;

.field private mFollowEventSource:Ljava/lang/String;

.field private mHideProfileReposts:Z

.field private mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

.field private mListener:Landroid/view/View$OnClickListener;

.field private mLocked:Z

.field private mProfileSpanClickListener:Lco/vine/android/widget/SpanClickListener;

.field private mUser:Lco/vine/android/api/VineUser;

.field private mWhite:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lco/vine/android/client/AppController;Landroid/view/View$OnClickListener;Lco/vine/android/widget/SpanClickListener;ZZLjava/lang/String;Z)V
    .locals 5
    .parameter "context"
    .parameter "appController"
    .parameter "listener"
    .parameter "spanClickListener"
    .parameter "locked"
    .parameter "blocked"
    .parameter "followEventSource"
    .parameter "hideProfileReposts"

    .prologue
    .line 55
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 56
    instance-of v1, p3, Landroid/view/View$OnLongClickListener;

    if-nez v1, :cond_0

    .line 57
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Param \"listener\" must implement both View.OnClickListener and View.OnLongClickListener"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 60
    :cond_0
    iput-object p1, p0, Lco/vine/android/ProfileHeaderAdapter;->mContext:Landroid/content/Context;

    .line 61
    iput-object p3, p0, Lco/vine/android/ProfileHeaderAdapter;->mListener:Landroid/view/View$OnClickListener;

    .line 62
    iput-object p2, p0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    .line 64
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 65
    .local v0, res:Landroid/content/res/Resources;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    const v4, 0x7f090066

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    aput-object v3, v1, v2

    iput-object v1, p0, Lco/vine/android/ProfileHeaderAdapter;->mWhite:[Ljava/lang/Object;

    .line 66
    iput-object p4, p0, Lco/vine/android/ProfileHeaderAdapter;->mProfileSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    .line 67
    iput-boolean p5, p0, Lco/vine/android/ProfileHeaderAdapter;->mLocked:Z

    .line 68
    iput-boolean p6, p0, Lco/vine/android/ProfileHeaderAdapter;->mBlocked:Z

    .line 69
    iput-object p7, p0, Lco/vine/android/ProfileHeaderAdapter;->mFollowEventSource:Ljava/lang/String;

    .line 70
    iput-boolean p8, p0, Lco/vine/android/ProfileHeaderAdapter;->mHideProfileReposts:Z

    .line 71
    return-void
.end method

.method private setImage(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
    .locals 4
    .parameter "v"
    .parameter "bmp"

    .prologue
    .line 347
    if-nez p2, :cond_1

    .line 348
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    iget-wide v0, v0, Lco/vine/android/api/VineUser;->userId:J

    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 349
    const v0, 0x7f020076

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 356
    :goto_0
    return-void

    .line 351
    :cond_0
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02006c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 354
    :cond_1
    new-instance v0, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v1, p0, Lco/vine/android/ProfileHeaderAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method


# virtual methods
.method public bindUser(Lco/vine/android/api/VineUser;)V
    .locals 20
    .parameter "profileUser"

    .prologue
    .line 107
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    if-eqz v14, :cond_1

    .line 108
    move-object/from16 v0, p0

    iget-object v7, v0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    .line 109
    .local v7, holder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    .line 110
    .local v11, res:Landroid/content/res/Resources;
    move-object/from16 v0, p1

    iget-object v14, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_0

    move-object/from16 v0, p1

    iget-object v14, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    invoke-static {v14}, Lco/vine/android/util/Util;->isDefaultAvatarUrl(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 112
    :cond_0
    move-object/from16 v0, p1

    iget-wide v14, v0, Lco/vine/android/api/VineUser;->userId:J

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v16

    cmp-long v14, v14, v16

    if-nez v14, :cond_2

    .line 113
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageView:Landroid/widget/ImageView;

    const v15, 0x7f020076

    invoke-virtual {v14, v15}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 121
    :goto_0
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageView:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/ProfileHeaderAdapter;->mListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v14, v15}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v15, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageView:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mListener:Landroid/view/View$OnClickListener;

    check-cast v14, Landroid/view/View$OnLongClickListener;

    invoke-virtual {v15, v14}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 123
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->username:Landroid/widget/TextView;

    move-object/from16 v0, p1

    iget-object v15, v0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    move-object/from16 v0, p1

    iget-object v14, v0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_4

    .line 126
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v0, p1

    iget-object v15, v0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->description:Landroid/widget/TextView;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 132
    :goto_1
    move-object/from16 v0, p1

    iget-object v14, v0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_5

    .line 133
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->location:Landroid/widget/TextView;

    move-object/from16 v0, p1

    iget-object v15, v0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->location:Landroid/widget/TextView;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 138
    :goto_2
    move-object/from16 v0, p1

    iget-wide v14, v0, Lco/vine/android/api/VineUser;->userId:J

    iput-wide v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->userId:J

    .line 140
    invoke-virtual/range {p1 .. p1}, Lco/vine/android/api/VineUser;->isVerified()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 141
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v14, v14, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->verified:Landroid/widget/ImageView;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 146
    :goto_3
    iget-object v2, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->followStateButton:Lco/vine/android/widget/FollowStateButton;

    .line 148
    .local v2, button:Lco/vine/android/widget/FollowStateButton;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mBlocked:Z

    if-eqz v14, :cond_7

    .line 149
    const/4 v14, 0x4

    invoke-virtual {v2, v14}, Lco/vine/android/widget/FollowStateButton;->setVisibility(I)V

    .line 155
    :goto_4
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mLocked:Z

    if-eqz v14, :cond_8

    .line 156
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->posts:Lco/vine/android/widget/TabButton;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Lco/vine/android/widget/TabButton;->setVisibility(I)V

    .line 157
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->likes:Lco/vine/android/widget/TabButton;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Lco/vine/android/widget/TabButton;->setVisibility(I)V

    .line 158
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->dot:Landroid/widget/TextView;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 159
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->followers:Landroid/widget/TextView;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 160
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->following:Landroid/widget/TextView;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 161
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->profileTabArrow:Landroid/view/ViewGroup;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 217
    :goto_5
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageFrame:Landroid/widget/ImageView;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 218
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->progress:Landroid/widget/ProgressBar;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 220
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->profileTabArrow:Landroid/view/ViewGroup;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 221
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->profileTabArrow:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/ProfileHeaderAdapter;->mListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v14, v15}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    .end local v2           #button:Lco/vine/android/widget/FollowStateButton;
    .end local v7           #holder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;
    .end local v11           #res:Landroid/content/res/Resources;
    :cond_1
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    .line 224
    return-void

    .line 115
    .restart local v7       #holder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;
    .restart local v11       #res:Landroid/content/res/Resources;
    :cond_2
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-static {v14}, Lco/vine/android/util/Util;->safeSetDefaultAvatar(Landroid/widget/ImageView;)V

    goto/16 :goto_0

    .line 118
    :cond_3
    new-instance v14, Lco/vine/android/util/image/ImageKey;

    move-object/from16 v0, p1

    iget-object v15, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    invoke-direct {v14, v15}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    iput-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->userImageKey:Lco/vine/android/util/image/ImageKey;

    .line 119
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageView:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    iget-object v0, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->userImageKey:Lco/vine/android/util/image/ImageKey;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lco/vine/android/ProfileHeaderAdapter;->setImage(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 129
    :cond_4
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->description:Landroid/widget/TextView;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1

    .line 136
    :cond_5
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->location:Landroid/widget/TextView;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 143
    :cond_6
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v14, v14, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->verified:Landroid/widget/ImageView;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_3

    .line 151
    .restart local v2       #button:Lco/vine/android/widget/FollowStateButton;
    :cond_7
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v14}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v14

    move-object/from16 v0, p1

    invoke-virtual {v2, v14, v15, v0}, Lco/vine/android/widget/FollowStateButton;->setUser(JLco/vine/android/api/VineUser;)V

    .line 152
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v14}, Lco/vine/android/widget/FollowStateButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_4

    .line 163
    :cond_8
    iget-object v5, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->followers:Landroid/widget/TextView;

    .line 164
    .local v5, followers:Landroid/widget/TextView;
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->followers:Landroid/widget/TextView;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 165
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mWhite:[Ljava/lang/Object;

    const/high16 v15, 0x7f0d

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/api/VineUser;->followerCount:I

    move/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/api/VineUser;->followerCount:I

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-static {v11, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    move/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v11, v15, v0, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x22

    invoke-static/range {v14 .. v16}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v12

    .line 171
    .local v12, spanned:Landroid/text/Spanned;
    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v14

    invoke-virtual {v5, v14}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 174
    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Landroid/text/Spannable;

    .line 175
    .local v3, clickSpannable:Landroid/text/Spannable;
    new-instance v4, Lco/vine/android/widget/StyledClickableSpan;

    const/4 v14, 0x5

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter;->mProfileSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v4, v14, v15, v0}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 177
    .local v4, clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const/4 v14, 0x0

    invoke-interface {v12}, Landroid/text/Spanned;->length()I

    move-result v15

    const/16 v16, 0x21

    move/from16 v0, v16

    invoke-static {v3, v4, v14, v15, v0}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 180
    iget-object v6, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->following:Landroid/widget/TextView;

    .line 181
    .local v6, following:Landroid/widget/TextView;
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->following:Landroid/widget/TextView;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 182
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mWhite:[Ljava/lang/Object;

    const v15, 0x7f0d0001

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/api/VineUser;->followingCount:I

    move/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/api/VineUser;->followingCount:I

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-static {v11, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    move/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v11, v15, v0, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x22

    invoke-static/range {v14 .. v16}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v12

    .line 187
    invoke-virtual {v6, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v14

    invoke-virtual {v6, v14}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 190
    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    .end local v3           #clickSpannable:Landroid/text/Spannable;
    check-cast v3, Landroid/text/Spannable;

    .line 191
    .restart local v3       #clickSpannable:Landroid/text/Spannable;
    new-instance v4, Lco/vine/android/widget/StyledClickableSpan;

    .end local v4           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const/4 v14, 0x6

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter;->mProfileSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v4, v14, v15, v0}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 193
    .restart local v4       #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const/4 v14, 0x0

    invoke-interface {v12}, Landroid/text/Spanned;->length()I

    move-result v15

    const/16 v16, 0x21

    move/from16 v0, v16

    invoke-static {v3, v4, v14, v15, v0}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 196
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->posts:Lco/vine/android/widget/TabButton;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Lco/vine/android/widget/TabButton;->setVisibility(I)V

    .line 197
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->likes:Lco/vine/android/widget/TabButton;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Lco/vine/android/widget/TabButton;->setVisibility(I)V

    .line 198
    iget-object v10, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->posts:Lco/vine/android/widget/TabButton;

    .line 199
    .local v10, posts:Lco/vine/android/widget/TabButton;
    const/4 v14, 0x1

    invoke-virtual {v10, v14}, Lco/vine/android/widget/TabButton;->setSelected(Z)V

    .line 200
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mHideProfileReposts:Z

    if-eqz v14, :cond_9

    move-object/from16 v0, p1

    iget v9, v0, Lco/vine/android/api/VineUser;->authoredPostCount:I

    .line 202
    .local v9, postCount:I
    :goto_6
    const v14, 0x7f0d0003

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v11, v9}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v11, v14, v9, v15}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 204
    .local v13, text:Ljava/lang/String;
    const-string v14, "\""

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v14}, Lco/vine/android/widget/TabButton;->setText(Ljava/lang/CharSequence;)V

    .line 205
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v10, v14}, Lco/vine/android/widget/TabButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 207
    iget-object v8, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->likes:Lco/vine/android/widget/TabButton;

    .line 208
    .local v8, likes:Lco/vine/android/widget/TabButton;
    const v14, 0x7f0d0002

    move-object/from16 v0, p1

    iget v15, v0, Lco/vine/android/api/VineUser;->likeCount:I

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/api/VineUser;->likeCount:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-static {v11, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, v16

    invoke-virtual {v11, v14, v15, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 211
    const-string v14, "\""

    const-string v15, ""

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v14}, Lco/vine/android/widget/TabButton;->setText(Ljava/lang/CharSequence;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/ProfileHeaderAdapter;->mListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v8, v14}, Lco/vine/android/widget/TabButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 214
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->dot:Landroid/widget/TextView;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setVisibility(I)V

    .line 215
    iget-object v14, v7, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->profileTabArrow:Landroid/view/ViewGroup;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto/16 :goto_5

    .line 200
    .end local v8           #likes:Lco/vine/android/widget/TabButton;
    .end local v9           #postCount:I
    .end local v13           #text:Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p1

    iget v9, v0, Lco/vine/android/api/VineUser;->postCount:I

    goto :goto_6
.end method

.method public changeSelectedTab(I)V
    .locals 3
    .parameter "tabId"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 316
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    if-nez v0, :cond_0

    .line 333
    :goto_0
    return-void

    .line 319
    :cond_0
    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 321
    :pswitch_1
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->likes:Lco/vine/android/widget/TabButton;

    invoke-virtual {v0, v1}, Lco/vine/android/widget/TabButton;->setSelected(Z)V

    .line 322
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->posts:Lco/vine/android/widget/TabButton;

    invoke-virtual {v0, v2}, Lco/vine/android/widget/TabButton;->setSelected(Z)V

    .line 323
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->profileTabArrow:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_0

    .line 327
    :pswitch_2
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->likes:Lco/vine/android/widget/TabButton;

    invoke-virtual {v0, v2}, Lco/vine/android/widget/TabButton;->setSelected(Z)V

    .line 328
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->posts:Lco/vine/android/widget/TabButton;

    invoke-virtual {v0, v1}, Lco/vine/android/widget/TabButton;->setSelected(Z)V

    .line 329
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->profileTabArrow:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_0

    .line 319
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0108
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "i"

    .prologue
    .line 80
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "i"

    .prologue
    .line 85
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .parameter "i"
    .parameter "convertView"
    .parameter "root"

    .prologue
    const/4 v2, 0x0

    .line 90
    if-nez p2, :cond_0

    .line 91
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030051

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 93
    new-instance v0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    invoke-direct {v0, p2}, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    .line 96
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageFrame:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 97
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v0, v0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 99
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    invoke-virtual {p0, v0}, Lco/vine/android/ProfileHeaderAdapter;->bindUser(Lco/vine/android/api/VineUser;)V

    .line 103
    :cond_0
    return-object p2
.end method

.method public onImageLoaded(Ljava/util/HashMap;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/image/ImageKey;",
            "Lco/vine/android/util/image/UrlImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 336
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    iget-object v1, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    if-eqz v1, :cond_0

    .line 337
    iget-object v1, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v1, v1, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->userImageKey:Lco/vine/android/util/image/ImageKey;

    if-eqz v1, :cond_0

    .line 338
    iget-object v1, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v1, v1, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->userImageKey:Lco/vine/android/util/image/ImageKey;

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/image/UrlImage;

    .line 339
    .local v0, urlImage:Lco/vine/android/util/image/UrlImage;
    if-eqz v0, :cond_0

    .line 340
    iget-object v1, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v1, v1, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageView:Landroid/widget/ImageView;

    iget-object v2, v0, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0, v1, v2}, Lco/vine/android/ProfileHeaderAdapter;->setImage(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    .line 344
    .end local v0           #urlImage:Lco/vine/android/util/image/UrlImage;
    :cond_0
    return-void
.end method

.method public onProfileHeaderClick(Landroid/view/View;Lco/vine/android/ProfileFragment;)V
    .locals 7
    .parameter "view"
    .parameter "fragment"

    .prologue
    const/4 v6, 0x1

    .line 253
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mContext:Landroid/content/Context;

    .line 254
    .local v0, context:Landroid/content/Context;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 313
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 256
    :sswitch_0
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    if-eqz v2, :cond_0

    .line 257
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v2, v2, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->followStateButton:Lco/vine/android/widget/FollowStateButton;

    invoke-virtual {v2}, Lco/vine/android/widget/FollowStateButton;->getState()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 259
    :pswitch_1
    const-string v2, "Profile"

    invoke-static {v2}, Lco/vine/android/util/FlurryUtils;->trackVisitFindFriends(Ljava/lang/String;)V

    .line 260
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/FindFriendsActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 261
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 265
    .end local v1           #intent:Landroid/content/Intent;
    :pswitch_2
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v2, v2, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->followStateButton:Lco/vine/android/widget/FollowStateButton;

    invoke-virtual {v2}, Lco/vine/android/widget/FollowStateButton;->unfollow()V

    .line 266
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    iget-object v3, p0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-wide v4, v4, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->userId:J

    invoke-virtual {v2, v3, v4, v5, v6}, Lco/vine/android/client/AppController;->unfollowUser(Lco/vine/android/client/Session;JZ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 268
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mFollowEventSource:Ljava/lang/String;

    invoke-static {v2}, Lco/vine/android/util/FlurryUtils;->trackFollow(Ljava/lang/String;)V

    goto :goto_0

    .line 272
    :pswitch_3
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v2, v2, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->followStateButton:Lco/vine/android/widget/FollowStateButton;

    iget-object v3, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    invoke-virtual {v2, v3}, Lco/vine/android/widget/FollowStateButton;->follow(Lco/vine/android/api/VineUser;)V

    .line 273
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    iget-object v3, p0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-wide v4, v4, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->userId:J

    invoke-virtual {v2, v3, v4, v5, v6}, Lco/vine/android/client/AppController;->followUser(Lco/vine/android/client/Session;JZ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 275
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mFollowEventSource:Ljava/lang/String;

    invoke-static {v2}, Lco/vine/android/util/FlurryUtils;->trackUnfollow(Ljava/lang/String;)V

    goto :goto_0

    .line 290
    :sswitch_1
    const v2, 0x7f0a0108

    invoke-virtual {p0, v2}, Lco/vine/android/ProfileHeaderAdapter;->changeSelectedTab(I)V

    goto :goto_0

    .line 294
    :sswitch_2
    const v2, 0x7f0a010a

    invoke-virtual {p0, v2}, Lco/vine/android/ProfileHeaderAdapter;->changeSelectedTab(I)V

    goto :goto_0

    .line 298
    :sswitch_3
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    if-eqz v2, :cond_0

    .line 299
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    iget-wide v2, v2, Lco/vine/android/api/VineUser;->userId:J

    iget-object v4, p0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    .line 300
    const-string v2, "Profile"

    invoke-static {v2}, Lco/vine/android/util/FlurryUtils;->trackVisitSettings(Ljava/lang/String;)V

    .line 301
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lco/vine/android/SettingsActivity;

    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 303
    :cond_1
    const/4 v2, 0x0

    invoke-static {v2}, Lco/vine/android/util/FlurryUtils;->trackProfileImageClick(Z)V

    .line 304
    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    iget-object v2, v2, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    const v3, 0x7f0e01a2

    invoke-static {v0, v2, v3}, Lco/vine/android/ImageActivity;->start(Landroid/content/Context;Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 254
    :sswitch_data_0
    .sparse-switch
        0x7f0a0051 -> :sswitch_3
        0x7f0a0106 -> :sswitch_0
        0x7f0a0108 -> :sswitch_1
        0x7f0a010a -> :sswitch_2
    .end sparse-switch

    .line 257
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onProfileHeaderLongClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 237
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 250
    :cond_0
    :goto_0
    return-void

    .line 239
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    iget-wide v0, v0, Lco/vine/android/api/VineUser;->userId:J

    iget-object v2, p0, Lco/vine/android/ProfileHeaderAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 240
    const/4 v0, 0x1

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils;->trackProfileImageClick(Z)V

    .line 241
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 242
    iget-object v0, p0, Lco/vine/android/ProfileHeaderAdapter;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lco/vine/android/ProfileHeaderAdapter;->mUser:Lco/vine/android/api/VineUser;

    iget-object v1, v1, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    const v2, 0x7f0e01a2

    invoke-static {v0, v1, v2}, Lco/vine/android/ImageActivity;->start(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0

    .line 237
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0051
        :pswitch_0
    .end packed-switch
.end method

.method public updatePostsCount(I)V
    .locals 7
    .parameter "postCount"

    .prologue
    .line 227
    iget-object v3, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    if-eqz v3, :cond_0

    .line 228
    iget-object v3, p0, Lco/vine/android/ProfileHeaderAdapter;->mHolder:Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;

    iget-object v0, v3, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->posts:Lco/vine/android/widget/TabButton;

    .line 229
    .local v0, posts:Lco/vine/android/widget/TabButton;
    iget-object v3, p0, Lco/vine/android/ProfileHeaderAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 230
    .local v1, res:Landroid/content/res/Resources;
    const v3, 0x7f0d0003

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v1, p1}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v3, p1, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 232
    .local v2, text:Ljava/lang/String;
    const-string v3, "\""

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lco/vine/android/widget/TabButton;->setText(Ljava/lang/CharSequence;)V

    .line 234
    .end local v0           #posts:Lco/vine/android/widget/TabButton;
    .end local v1           #res:Landroid/content/res/Resources;
    .end local v2           #text:Ljava/lang/String;
    :cond_0
    return-void
.end method
