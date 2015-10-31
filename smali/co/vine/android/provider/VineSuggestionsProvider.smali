.class public Lco/vine/android/provider/VineSuggestionsProvider;
.super Landroid/content/ContentProvider;
.source "VineSuggestionsProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/provider/VineSuggestionsProvider$TagsQuery;,
        Lco/vine/android/provider/VineSuggestionsProvider$UsersQuery;
    }
.end annotation


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = null

.field public static final CONTENT_AUTHORITY:Ljava/lang/String; = null

#the value of this static final field might be set in the static constructor
.field private static final LOGGABLE:Z = false

.field public static final PATH_TAGS:Ljava/lang/String; = "tags"

.field public static final PATH_USERS:Ljava/lang/String; = "users"

.field public static final SCHEME:Ljava/lang/String; = "content"

.field private static final SUGGEST_TAGS:I = 0x2

.field private static final SUGGEST_USERS:I = 0x1

.field private static final TAG:Ljava/lang/String; = "VineSuggestProvider"

.field public static final TAGS_URI:Landroid/net/Uri;

.field public static final USERS_URI:Landroid/net/Uri;

.field private static final sTagsTypeAhead:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineTag;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sUriMatcher:Landroid/content/UriMatcher;

.field private static final sUsersTypeAhead:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private mAppController:Lco/vine/android/client/AppController;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 41
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VineSuggestProvider"

    const/4 v2, 0x3

    invoke-static {v0, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move v0, v1

    :goto_0
    sput-boolean v0, Lco/vine/android/provider/VineSuggestionsProvider;->LOGGABLE:Z

    .line 44
    const-string v0, ".provider.VineSuggestionsProvider"

    invoke-static {v0}, Lco/vine/android/util/BuildUtil;->getAuthority(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->AUTHORITY:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "content://"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lco/vine/android/provider/VineSuggestionsProvider;->AUTHORITY:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->CONTENT_AUTHORITY:Ljava/lang/String;

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lco/vine/android/provider/VineSuggestionsProvider;->CONTENT_AUTHORITY:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "users"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->USERS_URI:Landroid/net/Uri;

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lco/vine/android/provider/VineSuggestionsProvider;->CONTENT_AUTHORITY:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "tags"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->TAGS_URI:Landroid/net/Uri;

    .line 55
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v2, -0x1

    invoke-direct {v0, v2}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sUriMatcher:Landroid/content/UriMatcher;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sUsersTypeAhead:Ljava/util/HashMap;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sTagsTypeAhead:Ljava/util/HashMap;

    .line 63
    sget-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v2, Lco/vine/android/provider/VineSuggestionsProvider;->AUTHORITY:Ljava/lang/String;

    const-string v3, "users/#"

    invoke-virtual {v0, v2, v3, v1}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 64
    sget-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineSuggestionsProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "tags"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 65
    return-void

    .line 41
    :cond_1
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 309
    return-void
.end method

.method public static addRealtimeTagSuggestions(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 2
    .parameter "query"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineTag;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 280
    .local p1, tags:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineTag;>;"
    sget-object v1, Lco/vine/android/provider/VineSuggestionsProvider;->sTagsTypeAhead:Ljava/util/HashMap;

    monitor-enter v1

    .line 281
    :try_start_0
    sget-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sTagsTypeAhead:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    monitor-exit v1

    .line 283
    return-void

    .line 282
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static addRealtimeUserSuggestions(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 2
    .parameter "query"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 262
    .local p1, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    sget-object v1, Lco/vine/android/provider/VineSuggestionsProvider;->sUsersTypeAhead:Ljava/util/HashMap;

    monitor-enter v1

    .line 263
    :try_start_0
    sget-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sUsersTypeAhead:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    monitor-exit v1

    .line 265
    return-void

    .line 264
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static clearRealtimeTagSuggestions()V
    .locals 2

    .prologue
    .line 292
    sget-object v1, Lco/vine/android/provider/VineSuggestionsProvider;->sTagsTypeAhead:Ljava/util/HashMap;

    monitor-enter v1

    .line 293
    :try_start_0
    sget-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sTagsTypeAhead:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 294
    monitor-exit v1

    .line 295
    return-void

    .line 294
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static clearRealtimeUserSuggestions()V
    .locals 2

    .prologue
    .line 274
    sget-object v1, Lco/vine/android/provider/VineSuggestionsProvider;->sUsersTypeAhead:Ljava/util/HashMap;

    monitor-enter v1

    .line 275
    :try_start_0
    sget-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sUsersTypeAhead:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 276
    monitor-exit v1

    .line 277
    return-void

    .line 276
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private getComposeTagSuggestions(Ljava/lang/String;Landroid/database/MatrixCursor;)Landroid/database/Cursor;
    .locals 20
    .parameter "query"
    .parameter "cursor"

    .prologue
    .line 206
    const/4 v11, 0x0

    .line 207
    .local v11, id:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/provider/VineSuggestionsProvider;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->getTypeaheadMaxCompose()I

    move-result v13

    .line 208
    .local v13, max:I
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5

    const/4 v9, 0x1

    .line 209
    .local v9, haveQuery:Z
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineSuggestionsProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 210
    .local v2, resolver:Landroid/content/ContentResolver;
    sget-object v3, Lco/vine/android/provider/Vine$TagsRecentlyUsed;->CONTENT_URI:Landroid/net/Uri;

    .line 214
    .local v3, uri:Landroid/net/Uri;
    if-eqz v9, :cond_6

    .line 215
    const-string v5, "tag_name LIKE ?"

    .line 216
    .local v5, selection:Ljava/lang/String;
    const/4 v4, 0x1

    new-array v6, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v18, "%"

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    .line 222
    .local v6, selectionArgs:[Ljava/lang/String;
    :goto_1
    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$TagsRecentlyUsedQuery;->PROJECTION:[Ljava/lang/String;

    const-string v7, "last_used_timestamp DESC"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 225
    .local v8, c:Landroid/database/Cursor;
    new-instance v14, Ljava/util/HashSet;

    invoke-direct {v14}, Ljava/util/HashSet;-><init>()V

    .line 226
    .local v14, prefetchIds:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    if-eqz v8, :cond_2

    .line 227
    :cond_0
    :goto_2
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 228
    const/4 v4, 0x1

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 229
    if-le v11, v13, :cond_7

    .line 239
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 242
    :cond_2
    if-eqz v9, :cond_4

    if-gt v11, v13, :cond_4

    .line 243
    invoke-static/range {p1 .. p1}, Lco/vine/android/provider/VineSuggestionsProvider;->getRealtimeTagSuggestions(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v17

    .line 244
    .local v17, tags:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineTag;>;"
    if-eqz v17, :cond_4

    .line 245
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_3
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lco/vine/android/api/VineTag;

    .line 246
    .local v16, tag:Lco/vine/android/api/VineTag;
    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VineTag;->tagId:J

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 247
    if-le v11, v13, :cond_8

    .line 258
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v16           #tag:Lco/vine/android/api/VineTag;
    .end local v17           #tags:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineTag;>;"
    :cond_4
    return-object p2

    .line 208
    .end local v2           #resolver:Landroid/content/ContentResolver;
    .end local v3           #uri:Landroid/net/Uri;
    .end local v5           #selection:Ljava/lang/String;
    .end local v6           #selectionArgs:[Ljava/lang/String;
    .end local v8           #c:Landroid/database/Cursor;
    .end local v9           #haveQuery:Z
    .end local v14           #prefetchIds:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_5
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 218
    .restart local v2       #resolver:Landroid/content/ContentResolver;
    .restart local v3       #uri:Landroid/net/Uri;
    .restart local v9       #haveQuery:Z
    :cond_6
    const/4 v5, 0x0

    .line 219
    .restart local v5       #selection:Ljava/lang/String;
    const/4 v6, 0x0

    .restart local v6       #selectionArgs:[Ljava/lang/String;
    goto :goto_1

    .line 232
    .restart local v8       #c:Landroid/database/Cursor;
    .restart local v14       #prefetchIds:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_7
    invoke-virtual/range {p2 .. p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object v15

    .line 233
    .local v15, rowBuilder:Landroid/database/MatrixCursor$RowBuilder;
    add-int/lit8 v12, v11, 0x1

    .end local v11           #id:I
    .local v12, id:I
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 234
    const/4 v4, 0x1

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 235
    const/4 v4, 0x2

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 236
    const/4 v4, 0x1

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move v11, v12

    .line 237
    .end local v12           #id:I
    .restart local v11       #id:I
    goto :goto_2

    .line 250
    .end local v15           #rowBuilder:Landroid/database/MatrixCursor$RowBuilder;
    .restart local v10       #i$:Ljava/util/Iterator;
    .restart local v16       #tag:Lco/vine/android/api/VineTag;
    .restart local v17       #tags:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineTag;>;"
    :cond_8
    invoke-virtual/range {p2 .. p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object v15

    .line 251
    .restart local v15       #rowBuilder:Landroid/database/MatrixCursor$RowBuilder;
    add-int/lit8 v12, v11, 0x1

    .end local v11           #id:I
    .restart local v12       #id:I
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 252
    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VineTag;->tagId:J

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 253
    move-object/from16 v0, v16

    iget-object v4, v0, Lco/vine/android/api/VineTag;->tagName:Ljava/lang/String;

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move v11, v12

    .end local v12           #id:I
    .restart local v11       #id:I
    goto :goto_3
.end method

.method private getComposeUserSuggestions(Ljava/lang/String;Landroid/database/MatrixCursor;J)Landroid/database/Cursor;
    .locals 20
    .parameter "query"
    .parameter "cursor"
    .parameter "userId"

    .prologue
    .line 148
    const/4 v11, 0x0

    .line 149
    .local v11, id:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/provider/VineSuggestionsProvider;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->getTypeaheadMaxCompose()I

    move-result v13

    .line 150
    .local v13, max:I
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5

    const/4 v9, 0x1

    .line 151
    .local v9, haveQuery:Z
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineSuggestionsProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 152
    .local v2, resolver:Landroid/content/ContentResolver;
    sget-object v4, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_FRIENDS:Landroid/net/Uri;

    move-wide/from16 v0, p3

    invoke-static {v4, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    .line 156
    .local v3, uri:Landroid/net/Uri;
    if-eqz v9, :cond_6

    .line 157
    const-string v5, "username LIKE ?"

    .line 158
    .local v5, selection:Ljava/lang/String;
    const/4 v4, 0x1

    new-array v6, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v18, "%"

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    .line 164
    .local v6, selectionArgs:[Ljava/lang/String;
    :goto_1
    sget-object v4, Lco/vine/android/provider/VineSuggestionsProvider$UsersQuery;->PROJECTION:[Ljava/lang/String;

    const-string v7, "order_id DESC"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 167
    .local v8, c:Landroid/database/Cursor;
    new-instance v14, Ljava/util/HashSet;

    invoke-direct {v14}, Ljava/util/HashSet;-><init>()V

    .line 168
    .local v14, prefetchIds:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    if-eqz v8, :cond_2

    .line 169
    :cond_0
    :goto_2
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 170
    const/4 v4, 0x1

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 171
    if-le v11, v13, :cond_7

    .line 182
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 185
    :cond_2
    if-eqz v9, :cond_4

    if-gt v11, v13, :cond_4

    .line 186
    invoke-static/range {p1 .. p1}, Lco/vine/android/provider/VineSuggestionsProvider;->getRealtimeUserSuggestions(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v17

    .line 187
    .local v17, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    if-eqz v17, :cond_4

    .line 188
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_3
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lco/vine/android/api/VineUser;

    .line 189
    .local v16, user:Lco/vine/android/api/VineUser;
    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VineUser;->userId:J

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 190
    if-le v11, v13, :cond_8

    .line 202
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v16           #user:Lco/vine/android/api/VineUser;
    .end local v17           #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    :cond_4
    return-object p2

    .line 150
    .end local v2           #resolver:Landroid/content/ContentResolver;
    .end local v3           #uri:Landroid/net/Uri;
    .end local v5           #selection:Ljava/lang/String;
    .end local v6           #selectionArgs:[Ljava/lang/String;
    .end local v8           #c:Landroid/database/Cursor;
    .end local v9           #haveQuery:Z
    .end local v14           #prefetchIds:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_5
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 160
    .restart local v2       #resolver:Landroid/content/ContentResolver;
    .restart local v3       #uri:Landroid/net/Uri;
    .restart local v9       #haveQuery:Z
    :cond_6
    const/4 v5, 0x0

    .line 161
    .restart local v5       #selection:Ljava/lang/String;
    const/4 v6, 0x0

    .restart local v6       #selectionArgs:[Ljava/lang/String;
    goto :goto_1

    .line 174
    .restart local v8       #c:Landroid/database/Cursor;
    .restart local v14       #prefetchIds:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :cond_7
    invoke-virtual/range {p2 .. p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object v15

    .line 175
    .local v15, rowBuilder:Landroid/database/MatrixCursor$RowBuilder;
    add-int/lit8 v12, v11, 0x1

    .end local v11           #id:I
    .local v12, id:I
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 176
    const/4 v4, 0x1

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 177
    const/4 v4, 0x2

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 178
    const/4 v4, 0x3

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 179
    const/4 v4, 0x1

    invoke-interface {v8, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v14, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move v11, v12

    .line 180
    .end local v12           #id:I
    .restart local v11       #id:I
    goto/16 :goto_2

    .line 193
    .end local v15           #rowBuilder:Landroid/database/MatrixCursor$RowBuilder;
    .restart local v10       #i$:Ljava/util/Iterator;
    .restart local v16       #user:Lco/vine/android/api/VineUser;
    .restart local v17       #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    :cond_8
    invoke-virtual/range {p2 .. p2}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object v15

    .line 194
    .restart local v15       #rowBuilder:Landroid/database/MatrixCursor$RowBuilder;
    add-int/lit8 v12, v11, 0x1

    .end local v11           #id:I
    .restart local v12       #id:I
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 195
    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VineUser;->userId:J

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 196
    move-object/from16 v0, v16

    iget-object v4, v0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    .line 197
    move-object/from16 v0, v16

    iget-object v4, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    invoke-virtual {v15, v4}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move v11, v12

    .end local v12           #id:I
    .restart local v11       #id:I
    goto/16 :goto_3
.end method

.method public static getRealtimeTagSuggestions(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 2
    .parameter "query"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineTag;",
            ">;"
        }
    .end annotation

    .prologue
    .line 286
    sget-object v1, Lco/vine/android/provider/VineSuggestionsProvider;->sTagsTypeAhead:Ljava/util/HashMap;

    monitor-enter v1

    .line 287
    :try_start_0
    sget-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sTagsTypeAhead:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    monitor-exit v1

    return-object v0

    .line 288
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static getRealtimeUserSuggestions(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 2
    .parameter "query"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;"
        }
    .end annotation

    .prologue
    .line 268
    sget-object v1, Lco/vine/android/provider/VineSuggestionsProvider;->sUsersTypeAhead:Ljava/util/HashMap;

    monitor-enter v1

    .line 269
    :try_start_0
    sget-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->sUsersTypeAhead:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    monitor-exit v1

    return-object v0

    .line 270
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 139
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .parameter "uri"

    .prologue
    .line 129
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .parameter "uri"
    .parameter "values"

    .prologue
    .line 134
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()Z
    .locals 1

    .prologue
    .line 71
    invoke-virtual {p0}, Lco/vine/android/provider/VineSuggestionsProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/provider/VineSuggestionsProvider;->mAppController:Lco/vine/android/client/AppController;

    .line 72
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 14
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selArgs"
    .parameter "sortOrder"

    .prologue
    .line 79
    const/4 v6, 0x0

    .line 83
    .local v6, groupBy:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineSuggestionsProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 91
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    new-instance v1, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v1}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 92
    .local v1, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    sget-boolean v3, Lco/vine/android/provider/VineSuggestionsProvider;->LOGGABLE:Z

    if-eqz v3, :cond_0

    .line 93
    const-string v3, "VineSuggestProvider"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "QUERY: uri "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " -> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lco/vine/android/provider/VineSuggestionsProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v5, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    :cond_0
    sget-object v3, Lco/vine/android/provider/VineSuggestionsProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v11

    .line 97
    .local v11, match:I
    packed-switch v11, :pswitch_data_0

    .line 107
    const-string v3, "user_groups_view"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 113
    const/4 v7, 0x0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v8, p5

    :try_start_1
    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 116
    .local v9, c:Landroid/database/Cursor;
    invoke-virtual {p0}, Lco/vine/android/provider/VineSuggestionsProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-interface {v9, v3, p1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 117
    .end local v9           #c:Landroid/database/Cursor;
    :goto_1
    return-object v9

    .line 85
    .end local v1           #qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    .end local v2           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v11           #match:I
    :catch_0
    move-exception v10

    .line 86
    .local v10, e:Landroid/database/sqlite/SQLiteException;
    const-string v3, "Failed to get a readable database on query."

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v10, v3, v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 87
    invoke-virtual {p0}, Lco/vine/android/provider/VineSuggestionsProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .restart local v2       #db:Landroid/database/sqlite/SQLiteDatabase;
    goto :goto_0

    .line 99
    .end local v10           #e:Landroid/database/sqlite/SQLiteException;
    .restart local v1       #qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    .restart local v11       #match:I
    :pswitch_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    .line 100
    .local v12, userId:J
    new-instance v3, Landroid/database/MatrixCursor;

    sget-object v4, Lco/vine/android/provider/VineSuggestionsProvider$UsersQuery;->PROJECTION:[Ljava/lang/String;

    invoke-direct {v3, v4}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-direct {p0, v0, v3, v12, v13}, Lco/vine/android/provider/VineSuggestionsProvider;->getComposeUserSuggestions(Ljava/lang/String;Landroid/database/MatrixCursor;J)Landroid/database/Cursor;

    move-result-object v9

    goto :goto_1

    .line 104
    .end local v12           #userId:J
    :pswitch_1
    new-instance v3, Landroid/database/MatrixCursor;

    sget-object v4, Lco/vine/android/provider/VineSuggestionsProvider$TagsQuery;->PROJECTION:[Ljava/lang/String;

    invoke-direct {v3, v4}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-direct {p0, v0, v3}, Lco/vine/android/provider/VineSuggestionsProvider;->getComposeTagSuggestions(Ljava/lang/String;Landroid/database/MatrixCursor;)Landroid/database/Cursor;

    move-result-object v9

    goto :goto_1

    .line 118
    :catch_1
    move-exception v10

    .line 119
    .local v10, e:Ljava/lang/Exception;
    sget-boolean v3, Lco/vine/android/provider/VineSuggestionsProvider;->LOGGABLE:Z

    if-eqz v3, :cond_1

    .line 120
    const-string v3, "Cannot execute {} {}  {} {} {} {}"

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    const/4 v5, 0x1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->getTables()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    const/4 v5, 0x2

    aput-object p3, v4, v5

    const/4 v5, 0x3

    aput-object v6, v4, v5

    const/4 v5, 0x4

    aput-object p5, v4, v5

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 123
    :cond_1
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v10}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 97
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 144
    const/4 v0, 0x0

    return v0
.end method
