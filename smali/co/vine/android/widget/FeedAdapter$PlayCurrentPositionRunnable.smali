.class public Lco/vine/android/widget/FeedAdapter$PlayCurrentPositionRunnable;
.super Ljava/lang/Object;
.source "FeedAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/widget/FeedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PlayCurrentPositionRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/widget/FeedAdapter;


# direct methods
.method public constructor <init>(Lco/vine/android/widget/FeedAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 869
    iput-object p1, p0, Lco/vine/android/widget/FeedAdapter$PlayCurrentPositionRunnable;->this$0:Lco/vine/android/widget/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized run()V
    .locals 2

    .prologue
    .line 872
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter$PlayCurrentPositionRunnable;->this$0:Lco/vine/android/widget/FeedAdapter;

    #calls: Lco/vine/android/widget/FeedAdapter;->calculateCurrentPosition()I
    invoke-static {v1}, Lco/vine/android/widget/FeedAdapter;->access$600(Lco/vine/android/widget/FeedAdapter;)I

    move-result v0

    .line 873
    .local v0, calculatedPosition:I
    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    .line 874
    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter$PlayCurrentPositionRunnable;->this$0:Lco/vine/android/widget/FeedAdapter;

    #calls: Lco/vine/android/widget/FeedAdapter;->getExplicit(I)Z
    invoke-static {v1, v0}, Lco/vine/android/widget/FeedAdapter;->access$700(Lco/vine/android/widget/FeedAdapter;I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 875
    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter$PlayCurrentPositionRunnable;->this$0:Lco/vine/android/widget/FeedAdapter;

    invoke-virtual {v1, v0}, Lco/vine/android/widget/FeedAdapter;->play(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 880
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 877
    :cond_1
    :try_start_1
    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter$PlayCurrentPositionRunnable;->this$0:Lco/vine/android/widget/FeedAdapter;

    invoke-virtual {v1}, Lco/vine/android/widget/FeedAdapter;->pauseCurrentPlayer()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 872
    .end local v0           #calculatedPosition:I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
