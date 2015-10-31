.class public final Lcom/vandalsoftware/io/DiskLruCache$Editor;
.super Ljava/lang/Object;
.source "DiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vandalsoftware/io/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Editor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vandalsoftware/io/DiskLruCache$Editor$ErrorCatchingOutputStream;
    }
.end annotation


# instance fields
.field private final entry:Lcom/vandalsoftware/io/DiskLruCache$Entry;

.field private hasErrors:Z

.field final synthetic this$0:Lcom/vandalsoftware/io/DiskLruCache;


# direct methods
.method private constructor <init>(Lcom/vandalsoftware/io/DiskLruCache;Lcom/vandalsoftware/io/DiskLruCache$Entry;)V
    .locals 0
    .parameter
    .parameter "entry"

    .prologue
    .line 653
    iput-object p1, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->this$0:Lcom/vandalsoftware/io/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 654
    iput-object p2, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->entry:Lcom/vandalsoftware/io/DiskLruCache$Entry;

    .line 655
    return-void
.end method

.method synthetic constructor <init>(Lcom/vandalsoftware/io/DiskLruCache;Lcom/vandalsoftware/io/DiskLruCache$Entry;Lcom/vandalsoftware/io/DiskLruCache$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 649
    invoke-direct {p0, p1, p2}, Lcom/vandalsoftware/io/DiskLruCache$Editor;-><init>(Lcom/vandalsoftware/io/DiskLruCache;Lcom/vandalsoftware/io/DiskLruCache$Entry;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/vandalsoftware/io/DiskLruCache$Editor;)Lcom/vandalsoftware/io/DiskLruCache$Entry;
    .locals 1
    .parameter "x0"

    .prologue
    .line 649
    iget-object v0, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->entry:Lcom/vandalsoftware/io/DiskLruCache$Entry;

    return-object v0
.end method

.method static synthetic access$1402(Lcom/vandalsoftware/io/DiskLruCache$Editor;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 649
    iput-boolean p1, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->hasErrors:Z

    return p1
.end method


# virtual methods
.method public abort()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 690
    iget-object v0, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->this$0:Lcom/vandalsoftware/io/DiskLruCache;

    const/4 v1, 0x0

    #calls: Lcom/vandalsoftware/io/DiskLruCache;->completeEdit(Lcom/vandalsoftware/io/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/vandalsoftware/io/DiskLruCache;->access$1300(Lcom/vandalsoftware/io/DiskLruCache;Lcom/vandalsoftware/io/DiskLruCache$Editor;Z)V

    .line 691
    return-void
.end method

.method public commit()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 677
    iget-boolean v0, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->hasErrors:Z

    if-eqz v0, :cond_0

    .line 678
    iget-object v0, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->this$0:Lcom/vandalsoftware/io/DiskLruCache;

    const/4 v1, 0x0

    #calls: Lcom/vandalsoftware/io/DiskLruCache;->completeEdit(Lcom/vandalsoftware/io/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/vandalsoftware/io/DiskLruCache;->access$1300(Lcom/vandalsoftware/io/DiskLruCache;Lcom/vandalsoftware/io/DiskLruCache$Editor;Z)V

    .line 679
    iget-object v0, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->this$0:Lcom/vandalsoftware/io/DiskLruCache;

    iget-object v1, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->entry:Lcom/vandalsoftware/io/DiskLruCache$Entry;

    #getter for: Lcom/vandalsoftware/io/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v1}, Lcom/vandalsoftware/io/DiskLruCache$Entry;->access$900(Lcom/vandalsoftware/io/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vandalsoftware/io/DiskLruCache;->remove(Ljava/lang/String;)Z

    .line 683
    :goto_0
    return-void

    .line 681
    :cond_0
    iget-object v0, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->this$0:Lcom/vandalsoftware/io/DiskLruCache;

    const/4 v1, 0x1

    #calls: Lcom/vandalsoftware/io/DiskLruCache;->completeEdit(Lcom/vandalsoftware/io/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/vandalsoftware/io/DiskLruCache;->access$1300(Lcom/vandalsoftware/io/DiskLruCache;Lcom/vandalsoftware/io/DiskLruCache$Editor;Z)V

    goto :goto_0
.end method

.method public newOutputStream(I)Ljava/io/OutputStream;
    .locals 4
    .parameter "index"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 663
    iget-object v1, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->this$0:Lcom/vandalsoftware/io/DiskLruCache;

    monitor-enter v1

    .line 664
    :try_start_0
    iget-object v0, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->entry:Lcom/vandalsoftware/io/DiskLruCache$Entry;

    #getter for: Lcom/vandalsoftware/io/DiskLruCache$Entry;->currentEditor:Lcom/vandalsoftware/io/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/vandalsoftware/io/DiskLruCache$Entry;->access$600(Lcom/vandalsoftware/io/DiskLruCache$Entry;)Lcom/vandalsoftware/io/DiskLruCache$Editor;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 665
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 669
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 667
    :cond_0
    :try_start_1
    new-instance v0, Lcom/vandalsoftware/io/DiskLruCache$Editor$ErrorCatchingOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/vandalsoftware/io/DiskLruCache$Editor;->entry:Lcom/vandalsoftware/io/DiskLruCache$Entry;

    invoke-virtual {v3, p1}, Lcom/vandalsoftware/io/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/4 v3, 0x0

    invoke-direct {v0, p0, v2, v3}, Lcom/vandalsoftware/io/DiskLruCache$Editor$ErrorCatchingOutputStream;-><init>(Lcom/vandalsoftware/io/DiskLruCache$Editor;Ljava/io/OutputStream;Lcom/vandalsoftware/io/DiskLruCache$1;)V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v0
.end method
