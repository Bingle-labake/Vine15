.class public Lco/vine/android/util/LoopManager;
.super Ljava/lang/Object;
.source "LoopManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/util/LoopManager$Record;
    }
.end annotation


# static fields
#the value of this static final field might be set in the static constructor
.field private static final DEBUGGABLE:Z = false

.field private static final TAG:Ljava/lang/String; = "VineLoopManager"

.field private static sInstance:Lco/vine/android/util/LoopManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mFinalRecords:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mLastViewedId:J

.field private mPrefs:Landroid/content/SharedPreferences;

.field private mRecords:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lco/vine/android/util/LoopManager$Record;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    sput-boolean v0, Lco/vine/android/util/LoopManager;->DEBUGGABLE:Z

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-static {p1}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/util/LoopManager;->mPrefs:Landroid/content/SharedPreferences;

    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/vine/android/util/LoopManager;->mRecords:Ljava/util/HashMap;

    .line 49
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lco/vine/android/util/LoopManager;->mFinalRecords:Ljava/util/Set;

    .line 50
    iput-object p1, p0, Lco/vine/android/util/LoopManager;->mContext:Landroid/content/Context;

    .line 51
    return-void
.end method

.method public static get(Landroid/content/Context;)Lco/vine/android/util/LoopManager;
    .locals 1
    .parameter "context"

    .prologue
    .line 54
    sget-object v0, Lco/vine/android/util/LoopManager;->sInstance:Lco/vine/android/util/LoopManager;

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lco/vine/android/util/LoopManager;

    invoke-direct {v0, p0}, Lco/vine/android/util/LoopManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lco/vine/android/util/LoopManager;->sInstance:Lco/vine/android/util/LoopManager;

    .line 57
    :cond_0
    sget-object v0, Lco/vine/android/util/LoopManager;->sInstance:Lco/vine/android/util/LoopManager;

    return-object v0
.end method


# virtual methods
.method public addRecord(JLco/vine/android/util/LoopManager$Record;)V
    .locals 2
    .parameter "postId"
    .parameter "record"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/util/LoopManager;->mRecords:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    return-void
.end method

.method public declared-synchronized commit()V
    .locals 6

    .prologue
    .line 81
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lco/vine/android/util/LoopManager;->mRecords:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_0

    .line 98
    :goto_0
    monitor-exit p0

    return-void

    .line 84
    :cond_0
    :try_start_1
    iget-object v3, p0, Lco/vine/android/util/LoopManager;->mRecords:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/util/LoopManager$Record;

    .line 85
    .local v1, r:Lco/vine/android/util/LoopManager$Record;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v2, sb:Ljava/lang/StringBuilder;
    iget-wide v3, v1, Lco/vine/android/util/LoopManager$Record;->userId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 87
    iget-wide v3, v1, Lco/vine/android/util/LoopManager$Record;->postId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    iget v3, v1, Lco/vine/android/util/LoopManager$Record;->loopCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    #getter for: Lco/vine/android/util/LoopManager$Record;->timeStamp:J
    invoke-static {v1}, Lco/vine/android/util/LoopManager$Record;->access$000(Lco/vine/android/util/LoopManager$Record;)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 90
    iget-object v3, p0, Lco/vine/android/util/LoopManager;->mFinalRecords:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 81
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #r:Lco/vine/android/util/LoopManager$Record;
    .end local v2           #sb:Ljava/lang/StringBuilder;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 92
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_2
    sget-boolean v3, Lco/vine/android/util/LoopManager;->DEBUGGABLE:Z

    if-eqz v3, :cond_2

    .line 93
    const-string v3, "VineLoopManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Commiting these loop records:\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lco/vine/android/util/LoopManager;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    :cond_2
    iget-object v3, p0, Lco/vine/android/util/LoopManager;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "pref_loop_count_records"

    iget-object v5, p0, Lco/vine/android/util/LoopManager;->mFinalRecords:Ljava/util/Set;

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 96
    iget-object v3, p0, Lco/vine/android/util/LoopManager;->mRecords:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 97
    iget-object v3, p0, Lco/vine/android/util/LoopManager;->mFinalRecords:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->clear()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0
.end method

.method public declared-synchronized increment(J)V
    .locals 6
    .parameter "postId"

    .prologue
    .line 62
    monitor-enter p0

    :try_start_0
    iget-wide v1, p0, Lco/vine/android/util/LoopManager;->mLastViewedId:J

    cmp-long v1, v1, p1

    if-eqz v1, :cond_1

    .line 63
    new-instance v0, Lco/vine/android/util/LoopManager$Record;

    iget-object v1, p0, Lco/vine/android/util/LoopManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lco/vine/android/util/LoopManager$Record;-><init>(Lco/vine/android/util/LoopManager;JJ)V

    .line 64
    .local v0, record:Lco/vine/android/util/LoopManager$Record;
    invoke-virtual {p0, p1, p2, v0}, Lco/vine/android/util/LoopManager;->addRecord(JLco/vine/android/util/LoopManager$Record;)V

    .line 72
    :cond_0
    :goto_0
    iput-wide p1, p0, Lco/vine/android/util/LoopManager;->mLastViewedId:J

    .line 73
    invoke-virtual {v0}, Lco/vine/android/util/LoopManager$Record;->increment()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    monitor-exit p0

    return-void

    .line 66
    .end local v0           #record:Lco/vine/android/util/LoopManager$Record;
    :cond_1
    :try_start_1
    iget-object v1, p0, Lco/vine/android/util/LoopManager;->mRecords:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/LoopManager$Record;

    .line 67
    .restart local v0       #record:Lco/vine/android/util/LoopManager$Record;
    if-nez v0, :cond_0

    .line 68
    new-instance v0, Lco/vine/android/util/LoopManager$Record;

    .end local v0           #record:Lco/vine/android/util/LoopManager$Record;
    iget-object v1, p0, Lco/vine/android/util/LoopManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lco/vine/android/util/LoopManager$Record;-><init>(Lco/vine/android/util/LoopManager;JJ)V

    .line 69
    .restart local v0       #record:Lco/vine/android/util/LoopManager$Record;
    invoke-virtual {p0, p1, p2, v0}, Lco/vine/android/util/LoopManager;->addRecord(JLco/vine/android/util/LoopManager$Record;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 62
    .end local v0           #record:Lco/vine/android/util/LoopManager$Record;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 102
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .local v2, sb:Ljava/lang/StringBuilder;
    iget-object v3, p0, Lco/vine/android/util/LoopManager;->mFinalRecords:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 104
    .local v1, r:Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 106
    .end local v1           #r:Ljava/lang/String;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
