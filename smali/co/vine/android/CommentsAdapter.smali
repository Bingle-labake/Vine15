.class public Lco/vine/android/CommentsAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "CommentsAdapter.java"


# static fields
.field private static final SPAN_FLAGS:I = 0x21


# instance fields
.field private mAppController:Lco/vine/android/client/AppController;

.field private mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

.field private mCommentSbs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/text/Editable;",
            ">;"
        }
    .end annotation
.end field

.field private mIdToPositionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final mListener:Lco/vine/android/widget/SpanClickListener;

.field final mViewHolders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/CommentViewHolder;",
            ">;>;"
        }
    .end annotation
.end field

.field private mVineGreen:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lco/vine/android/client/AppController;Lco/vine/android/widget/SpanClickListener;)V
    .locals 5
    .parameter "context"
    .parameter "appController"
    .parameter "listener"

    .prologue
    const/4 v4, 0x0

    .line 57
    const/4 v0, 0x2

    invoke-direct {p0, p1, v4, v0}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/CommentsAdapter;->mViewHolders:Ljava/util/ArrayList;

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/vine/android/CommentsAdapter;->mCommentSbs:Ljava/util/HashMap;

    .line 58
    new-instance v0, Lco/vine/android/widget/TypefacesSpan;

    invoke-static {p1}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x3

    invoke-virtual {v1, v2, v3}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-direct {v0, v4, v1}, Lco/vine/android/widget/TypefacesSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    iput-object v0, p0, Lco/vine/android/CommentsAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    .line 60
    iput-object p2, p0, Lco/vine/android/CommentsAdapter;->mAppController:Lco/vine/android/client/AppController;

    .line 61
    iput-object p3, p0, Lco/vine/android/CommentsAdapter;->mListener:Lco/vine/android/widget/SpanClickListener;

    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090076

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lco/vine/android/CommentsAdapter;->mVineGreen:I

    .line 63
    return-void
.end method


# virtual methods
.method public atLastPage()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 205
    iget-object v2, p0, Lco/vine/android/CommentsAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lco/vine/android/CommentsAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 206
    iget-object v2, p0, Lco/vine/android/CommentsAdapter;->mCursor:Landroid/database/Cursor;

    const/16 v3, 0xb

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-ne v2, v0, :cond_0

    .line 208
    :goto_0
    return v0

    :cond_0
    move v0, v1

    .line 206
    goto :goto_0

    :cond_1
    move v0, v1

    .line 208
    goto :goto_0
.end method

.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 22
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 82
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    .line 83
    .local v13, res:Landroid/content/res/Resources;
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/vine/android/CommentViewHolder;

    .line 84
    .local v9, h:Lco/vine/android/CommentViewHolder;
    const/16 v18, 0x5

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 85
    .local v16, username:Ljava/lang/String;
    const/16 v18, 0x9

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 87
    .local v4, comment:Ljava/lang/String;
    const/16 v18, 0xa

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lco/vine/android/util/Util;->fromByteArray([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/ArrayList;

    .line 90
    .local v7, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    if-nez v16, :cond_0

    .line 91
    const-string v16, ""

    .line 92
    new-instance v18, Lco/vine/android/VineException;

    invoke-direct/range {v18 .. v18}, Lco/vine/android/VineException;-><init>()V

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Username is null for "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, p3

    move/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    invoke-static/range {v18 .. v20}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 96
    :cond_0
    iget-object v0, v9, Lco/vine/android/CommentViewHolder;->content:Landroid/widget/TextView;

    move-object/from16 v18, v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 98
    iget-object v0, v9, Lco/vine/android/CommentViewHolder;->timestamp:Landroid/widget/TextView;

    move-object/from16 v18, v0

    const/16 v19, 0x6

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v19

    const/16 v21, 0x0

    move-wide/from16 v0, v19

    move/from16 v2, v21

    invoke-static {v13, v0, v1, v2}, Lco/vine/android/util/Util;->getRelativeTimeString(Landroid/content/res/Resources;JZ)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    const/16 v18, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    iput-object v0, v9, Lco/vine/android/CommentViewHolder;->commentId:Ljava/lang/String;

    .line 101
    const/16 v18, 0x4

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    move-wide/from16 v0, v18

    iput-wide v0, v9, Lco/vine/android/CommentViewHolder;->userId:J

    .line 103
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/CommentsAdapter;->mCommentSbs:Ljava/util/HashMap;

    move-object/from16 v18, v0

    iget-object v0, v9, Lco/vine/android/CommentViewHolder;->commentId:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/text/Editable;

    .line 105
    .local v5, commentSb:Landroid/text/Editable;
    if-nez v5, :cond_2

    .line 106
    new-instance v18, Landroid/text/SpannableStringBuilder;

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    .line 107
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/CommentsAdapter;->mCommentSbs:Ljava/util/HashMap;

    move-object/from16 v18, v0

    iget-object v0, v9, Lco/vine/android/CommentViewHolder;->commentId:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/CommentsAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v20

    const/16 v21, 0x21

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-static {v5, v0, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 111
    new-instance v14, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v18, 0x1

    iget-wide v0, v9, Lco/vine/android/CommentViewHolder;->userId:J

    move-wide/from16 v19, v0

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/CommentsAdapter;->mListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v20, v0

    move/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v14, v0, v1, v2}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 114
    .local v14, styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/CommentsAdapter;->mVineGreen:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-virtual {v14, v0}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 115
    const/16 v18, 0x0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x21

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v5, v14, v0, v1, v2}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 118
    if-eqz v7, :cond_2

    .line 120
    :try_start_0
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v18

    add-int/lit8 v18, v18, 0x1

    const/16 v19, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v7, v5, v0, v1}, Lco/vine/android/util/Util;->adjustEntities(Ljava/util/ArrayList;Landroid/text/Editable;IZ)V

    .line 121
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/vine/android/api/VineEntity;

    .line 122
    .local v8, entity:Lco/vine/android/api/VineEntity;
    invoke-virtual {v8}, Lco/vine/android/api/VineEntity;->isUserType()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 123
    new-instance v17, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v18, 0x1

    iget-wide v0, v8, Lco/vine/android/api/VineEntity;->id:J

    move-wide/from16 v19, v0

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/CommentsAdapter;->mListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v20, v0

    invoke-direct/range {v17 .. v20}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 126
    .local v17, usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/CommentsAdapter;->mVineGreen:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 127
    iget v0, v8, Lco/vine/android/api/VineEntity;->start:I

    move/from16 v18, v0

    iget v0, v8, Lco/vine/android/api/VineEntity;->end:I

    move/from16 v19, v0

    const/16 v20, 0x21

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-static {v5, v0, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 136
    .end local v8           #entity:Lco/vine/android/api/VineEntity;
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v17           #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    :catch_0
    move-exception v6

    .line 137
    .local v6, e:Ljava/lang/IndexOutOfBoundsException;
    invoke-static {v6}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 142
    .end local v6           #e:Ljava/lang/IndexOutOfBoundsException;
    .end local v14           #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    :cond_2
    iget-object v0, v9, Lco/vine/android/CommentViewHolder;->content:Landroid/widget/TextView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    const/16 v18, 0x3

    move-object/from16 v0, p3

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 145
    .local v15, url:Ljava/lang/String;
    invoke-static {v15}, Lco/vine/android/util/Util;->isDefaultAvatarUrl(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 146
    iget-object v0, v9, Lco/vine/android/CommentViewHolder;->profileImage:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lco/vine/android/util/Util;->safeSetDefaultAvatar(Landroid/widget/ImageView;)V

    .line 147
    iget-object v0, v9, Lco/vine/android/CommentViewHolder;->profileImage:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    const v19, 0x7f020061

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 154
    :goto_1
    return-void

    .line 128
    .end local v15           #url:Ljava/lang/String;
    .restart local v8       #entity:Lco/vine/android/api/VineEntity;
    .restart local v10       #i$:Ljava/util/Iterator;
    .restart local v14       #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    :cond_3
    :try_start_1
    invoke-virtual {v8}, Lco/vine/android/api/VineEntity;->isTagType()Z

    move-result v18

    if-eqz v18, :cond_1

    .line 129
    new-instance v17, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v18, 0x3

    iget-object v0, v8, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/CommentsAdapter;->mListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v20, v0

    invoke-direct/range {v17 .. v20}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 132
    .restart local v17       #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/CommentsAdapter;->mVineGreen:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 133
    iget v0, v8, Lco/vine/android/api/VineEntity;->start:I

    move/from16 v18, v0

    iget v0, v8, Lco/vine/android/api/VineEntity;->end:I

    move/from16 v19, v0

    const/16 v20, 0x21

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-static {v5, v0, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 149
    .end local v8           #entity:Lco/vine/android/api/VineEntity;
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v14           #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v17           #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    .restart local v15       #url:Ljava/lang/String;
    :cond_4
    new-instance v11, Lco/vine/android/util/image/ImageKey;

    invoke-direct {v11, v15}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    .line 150
    .local v11, key:Lco/vine/android/util/image/ImageKey;
    iput-object v11, v9, Lco/vine/android/CommentViewHolder;->imageKey:Lco/vine/android/util/image/ImageKey;

    .line 151
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/CommentsAdapter;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 152
    .local v12, profileImage:Landroid/graphics/Bitmap;
    iget-object v0, v9, Lco/vine/android/CommentViewHolder;->profileImage:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    new-instance v19, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/CommentsAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v12}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "pos"

    .prologue
    .line 191
    iget-object v0, p0, Lco/vine/android/CommentsAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/CommentsAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lco/vine/android/CommentsAdapter;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 194
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method public getPositionForId(J)I
    .locals 2
    .parameter "id"

    .prologue
    .line 198
    iget-object v0, p0, Lco/vine/android/CommentsAdapter;->mIdToPositionMap:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/CommentsAdapter;->mIdToPositionMap:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 199
    iget-object v0, p0, Lco/vine/android/CommentsAdapter;->mIdToPositionMap:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 201
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "context"
    .parameter "cursor"
    .parameter "viewGroup"

    .prologue
    .line 67
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f030020

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    .line 69
    .local v1, layout:Landroid/widget/RelativeLayout;
    new-instance v0, Lco/vine/android/CommentViewHolder;

    invoke-direct {v0}, Lco/vine/android/CommentViewHolder;-><init>()V

    .line 70
    .local v0, h:Lco/vine/android/CommentViewHolder;
    const v2, 0x7f0a005b

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v0, Lco/vine/android/CommentViewHolder;->profileImage:Landroid/widget/ImageView;

    .line 71
    const v2, 0x7f0a005c

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lco/vine/android/CommentViewHolder;->content:Landroid/widget/TextView;

    .line 72
    iget-object v2, v0, Lco/vine/android/CommentViewHolder;->content:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 73
    const v2, 0x7f0a005d

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lco/vine/android/CommentViewHolder;->timestamp:Landroid/widget/TextView;

    .line 74
    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setTag(Ljava/lang/Object;)V

    .line 75
    iget-object v2, p0, Lco/vine/android/CommentsAdapter;->mViewHolders:Ljava/util/ArrayList;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    return-object v1
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 4
    .parameter "c"

    .prologue
    .line 178
    invoke-super {p0, p1}, Landroid/support/v4/widget/CursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    .line 179
    .local v0, oldCursor:Landroid/database/Cursor;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lco/vine/android/CommentsAdapter;->mIdToPositionMap:Ljava/util/HashMap;

    .line 180
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-eqz v1, :cond_0

    .line 181
    const/4 v1, -0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 182
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 183
    iget-object v1, p0, Lco/vine/android/CommentsAdapter;->mIdToPositionMap:Ljava/util/HashMap;

    const/4 v2, 0x1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 186
    :cond_0
    return-object v0
.end method

.method public updateProfileImages(Ljava/util/HashMap;)V
    .locals 10
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
    .line 157
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 159
    .local v3, toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Lco/vine/android/CommentViewHolder;>;>;"
    iget-object v6, p0, Lco/vine/android/CommentsAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v0, v6, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_2

    .line 160
    iget-object v6, p0, Lco/vine/android/CommentsAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/ref/WeakReference;

    .line 161
    .local v5, wf:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/CommentViewHolder;>;"
    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/CommentViewHolder;

    .line 162
    .local v4, vh:Lco/vine/android/CommentViewHolder;
    if-nez v4, :cond_1

    .line 163
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 164
    :cond_1
    iget-object v6, v4, Lco/vine/android/CommentViewHolder;->imageKey:Lco/vine/android/util/image/ImageKey;

    if-eqz v6, :cond_0

    .line 165
    iget-object v6, v4, Lco/vine/android/CommentViewHolder;->imageKey:Lco/vine/android/util/image/ImageKey;

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/util/image/UrlImage;

    .line 166
    .local v2, image:Lco/vine/android/util/image/UrlImage;
    if-eqz v2, :cond_0

    .line 167
    iget-object v6, v4, Lco/vine/android/CommentViewHolder;->profileImage:Landroid/widget/ImageView;

    new-instance v7, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v8, p0, Lco/vine/android/CommentsAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    iget-object v9, v2, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v7, v8, v9}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 171
    .end local v2           #image:Lco/vine/android/util/image/UrlImage;
    .end local v4           #vh:Lco/vine/android/CommentViewHolder;
    .end local v5           #wf:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/CommentViewHolder;>;"
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/ref/WeakReference;

    .line 172
    .restart local v5       #wf:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/CommentViewHolder;>;"
    iget-object v6, p0, Lco/vine/android/CommentsAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 174
    .end local v5           #wf:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/CommentViewHolder;>;"
    :cond_3
    return-void
.end method
