.class Lco/vine/android/util/LoopManager$Record;
.super Ljava/lang/Object;
.source "LoopManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/util/LoopManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Record"
.end annotation


# instance fields
.field public loopCount:I

.field public postId:J

.field final synthetic this$0:Lco/vine/android/util/LoopManager;

.field private timeStamp:J

.field public userId:J


# direct methods
.method public constructor <init>(Lco/vine/android/util/LoopManager;JJ)V
    .locals 1
    .parameter
    .parameter "userId"
    .parameter "postId"

    .prologue
    .line 34
    iput-object p1, p0, Lco/vine/android/util/LoopManager$Record;->this$0:Lco/vine/android/util/LoopManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-wide p2, p0, Lco/vine/android/util/LoopManager$Record;->userId:J

    .line 36
    iput-wide p4, p0, Lco/vine/android/util/LoopManager$Record;->postId:J

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/util/LoopManager$Record;->loopCount:I

    .line 38
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/util/LoopManager$Record;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 28
    iget-wide v0, p0, Lco/vine/android/util/LoopManager$Record;->timeStamp:J

    return-wide v0
.end method


# virtual methods
.method public increment()V
    .locals 2

    .prologue
    .line 41
    iget v0, p0, Lco/vine/android/util/LoopManager$Record;->loopCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lco/vine/android/util/LoopManager$Record;->loopCount:I

    .line 42
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/util/LoopManager$Record;->timeStamp:J

    .line 43
    return-void
.end method
