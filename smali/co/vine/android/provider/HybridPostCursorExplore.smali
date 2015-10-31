.class public Lco/vine/android/provider/HybridPostCursorExplore;
.super Lco/vine/android/provider/HybridPostCursor;
.source "HybridPostCursorExplore.java"


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 1
    .parameter "cursor"

    .prologue
    .line 18
    const/16 v0, 0x14

    invoke-direct {p0, p1, v0}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;I)V
    .locals 0
    .parameter "cursor"
    .parameter "limit"

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;I)V
    .locals 0
    .parameter
    .parameter "limit"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p1, posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    invoke-direct {p0, p1, p2}, Lco/vine/android/provider/HybridPostCursor;-><init>(Ljava/util/ArrayList;I)V

    .line 27
    return-void
.end method


# virtual methods
.method public onPrepare()V
    .locals 15

    .prologue
    const/4 v14, 0x1

    .line 31
    iget-object v3, p0, Lco/vine/android/provider/HybridPostCursorExplore;->mCursor:Landroid/database/Cursor;

    .line 35
    .local v3, cursor:Landroid/database/Cursor;
    const/4 v0, 0x0

    .line 36
    .local v0, count:I
    const/4 v5, 0x0

    .line 37
    .local v5, moveToNext:Z
    if-eqz v3, :cond_5

    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 38
    const-wide/16 v6, 0x0

    .line 39
    .local v6, postId:J
    const/4 v8, 0x0

    .line 40
    .local v8, vinePost:Lco/vine/android/api/VinePost;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lco/vine/android/provider/HybridPostCursorExplore;->mList:Ljava/util/List;

    .line 42
    :cond_0
    invoke-interface {v3, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 45
    .local v1, currentPostId:J
    cmp-long v9, v1, v6

    if-eqz v9, :cond_2

    .line 47
    if-eqz v8, :cond_1

    .line 48
    iget-object v9, p0, Lco/vine/android/provider/HybridPostCursorExplore;->mList:Ljava/util/List;

    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 51
    :cond_1
    move-wide v6, v1

    .line 52
    invoke-static {v3}, Lco/vine/android/api/VinePost;->fromExplore(Landroid/database/Cursor;)Lco/vine/android/api/VinePost;

    move-result-object v8

    .line 56
    :cond_2
    :try_start_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 75
    :goto_0
    if-eqz v5, :cond_3

    iget v9, p0, Lco/vine/android/provider/HybridPostCursorExplore;->mLimit:I

    if-lt v0, v9, :cond_0

    .line 76
    :cond_3
    if-eqz v8, :cond_4

    .line 77
    iget-object v9, p0, Lco/vine/android/provider/HybridPostCursorExplore;->mList:Ljava/util/List;

    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .end local v1           #currentPostId:J
    .end local v6           #postId:J
    .end local v8           #vinePost:Lco/vine/android/api/VinePost;
    :cond_4
    :goto_1
    return-void

    .line 57
    .restart local v1       #currentPostId:J
    .restart local v6       #postId:J
    .restart local v8       #vinePost:Lco/vine/android/api/VinePost;
    :catch_0
    move-exception v4

    .line 71
    .local v4, e:Ljava/lang/IllegalStateException;
    new-instance v9, Lco/vine/android/VineException;

    invoke-direct {v9}, Lco/vine/android/VineException;-><init>()V

    const-string v10, "Failed to get cursor\'s row id. total: {}, current: {}, limit: {}, postId: {}."

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v14

    const/4 v12, 0x2

    iget v13, p0, Lco/vine/android/provider/HybridPostCursorExplore;->mLimit:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 80
    .end local v1           #currentPostId:J
    .end local v4           #e:Ljava/lang/IllegalStateException;
    .end local v6           #postId:J
    .end local v8           #vinePost:Lco/vine/android/api/VinePost;
    :cond_5
    const/4 v9, 0x0

    iput-object v9, p0, Lco/vine/android/provider/HybridPostCursorExplore;->mList:Ljava/util/List;

    goto :goto_1
.end method
