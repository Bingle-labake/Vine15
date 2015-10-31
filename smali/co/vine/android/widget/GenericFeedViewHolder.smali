.class public abstract Lco/vine/android/widget/GenericFeedViewHolder;
.super Ljava/lang/Object;
.source "GenericFeedViewHolder.java"


# instance fields
.field public avatarKey:Lco/vine/android/util/image/ImageKey;

.field public comment:Landroid/widget/ImageButton;

.field public commentList:Landroid/widget/LinearLayout;

.field public commentType:I

.field public comments1:Landroid/widget/TextView;

.field public comments2:Landroid/widget/TextView;

.field public comments3:Landroid/widget/TextView;

.field public comments4:Landroid/widget/TextView;

.field public comments5:Landroid/widget/TextView;

.field public commentsContainer:Landroid/widget/RelativeLayout;

.field public compactLikesCommentsContainer:Landroid/widget/RelativeLayout;

.field public compactLikesCommentsCounts:Landroid/widget/TextView;

.field public compactRevinersCount:Landroid/widget/TextView;

.field public compactRevinersDivider:Landroid/view/View;

.field public description:Landroid/widget/TextView;

.field public hasVideoImage:Z

.field public imageListener:Lco/vine/android/player/SensitiveImageClickListener;

.field public isVideoImageLoaded:Z

.field public likeType:I

.field public liked:Landroid/widget/ImageButton;

.field public likers:Landroid/widget/TextView;

.field public likersContainer:Landroid/widget/RelativeLayout;

.field public location:Landroid/widget/TextView;

.field public locationContainer:Landroid/widget/RelativeLayout;

.field public locationIcon:Landroid/widget/ImageView;

.field public more:Landroid/widget/ImageView;

.field public olderComments:Landroid/widget/TextView;

.field public olderCommentsContainer:Landroid/widget/RelativeLayout;

.field public position:I

.field public post:Lco/vine/android/api/VinePost;

.field public revine:Landroid/widget/ImageButton;

.field public revineContainer:Landroid/widget/RelativeLayout;

.field public revineLine:Landroid/widget/TextView;

.field public reviners:Landroid/widget/TextView;

.field public revinersContainer:Landroid/widget/RelativeLayout;

.field public sensitiveTextContainer:Landroid/widget/LinearLayout;

.field public timestamp:Landroid/widget/TextView;

.field public userImage:Landroid/widget/ImageView;

.field public username:Landroid/widget/TextView;

.field public videoImageKey:Lco/vine/android/util/image/ImageKey;

.field public videoLoadImage:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const v0, 0x7f0a00c3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->description:Landroid/widget/TextView;

    .line 65
    const v0, 0x7f0a00aa

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->username:Landroid/widget/TextView;

    .line 66
    const v0, 0x7f0a00c6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->location:Landroid/widget/TextView;

    .line 67
    const v0, 0x7f0a00c5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->locationIcon:Landroid/widget/ImageView;

    .line 68
    const v0, 0x7f0a005d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->timestamp:Landroid/widget/TextView;

    .line 69
    const v0, 0x7f0a0051

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->userImage:Landroid/widget/ImageView;

    .line 70
    const v0, 0x7f0a00dd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->comment:Landroid/widget/ImageButton;

    .line 71
    const v0, 0x7f0a00c9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->likers:Landroid/widget/TextView;

    .line 72
    const v0, 0x7f0a00cc

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->reviners:Landroid/widget/TextView;

    .line 73
    const v0, 0x7f0a00d1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->commentList:Landroid/widget/LinearLayout;

    .line 74
    const v0, 0x7f0a00d0

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->olderComments:Landroid/widget/TextView;

    .line 75
    const v0, 0x7f0a00c7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->likersContainer:Landroid/widget/RelativeLayout;

    .line 76
    const v0, 0x7f0a00ca

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->revinersContainer:Landroid/widget/RelativeLayout;

    .line 77
    const v0, 0x7f0a00cd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->commentsContainer:Landroid/widget/RelativeLayout;

    .line 78
    const v0, 0x7f0a00cf

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->olderCommentsContainer:Landroid/widget/RelativeLayout;

    .line 80
    const v0, 0x7f0a0055

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->videoLoadImage:Landroid/widget/ProgressBar;

    .line 81
    const v0, 0x7f0a00c4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->locationContainer:Landroid/widget/RelativeLayout;

    .line 82
    const v0, 0x7f0a00bd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    .line 83
    const v0, 0x7f0a00dc

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->liked:Landroid/widget/ImageButton;

    .line 84
    const v0, 0x7f0a00df

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->more:Landroid/widget/ImageView;

    .line 85
    const v0, 0x7f0a00d2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->comments1:Landroid/widget/TextView;

    .line 86
    const v0, 0x7f0a00d3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->comments2:Landroid/widget/TextView;

    .line 87
    const v0, 0x7f0a00d4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->comments3:Landroid/widget/TextView;

    .line 88
    const v0, 0x7f0a00d5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->comments4:Landroid/widget/TextView;

    .line 89
    const v0, 0x7f0a00d6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->comments5:Landroid/widget/TextView;

    .line 90
    const v0, 0x7f0a00d7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->compactLikesCommentsContainer:Landroid/widget/RelativeLayout;

    .line 92
    const v0, 0x7f0a00d9

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->compactLikesCommentsCounts:Landroid/widget/TextView;

    .line 94
    const v0, 0x7f0a00bf

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->revineContainer:Landroid/widget/RelativeLayout;

    .line 95
    const v0, 0x7f0a00c1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->revineLine:Landroid/widget/TextView;

    .line 96
    const v0, 0x7f0a00de

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->revine:Landroid/widget/ImageButton;

    .line 97
    const v0, 0x7f0a00db

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->compactRevinersCount:Landroid/widget/TextView;

    .line 98
    const v0, 0x7f0a00da

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/widget/GenericFeedViewHolder;->compactRevinersDivider:Landroid/view/View;

    .line 99
    return-void
.end method


# virtual methods
.method public abstract getViewForVideoImage()Landroid/view/View;
.end method
