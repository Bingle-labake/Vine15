.class public Lcom/googlecode/javacpp/Builder$UserClassLoader;
.super Ljava/net/URLClassLoader;
.source "Builder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacpp/Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserClassLoader"
.end annotation


# instance fields
.field private paths:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 460
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/net/URL;

    invoke-direct {p0, v0}, Ljava/net/URLClassLoader;-><init>([Ljava/net/URL;)V

    .line 458
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javacpp/Builder$UserClassLoader;->paths:Ljava/util/LinkedList;

    .line 461
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .locals 1
    .parameter "parent"

    .prologue
    .line 463
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/net/URL;

    invoke-direct {p0, v0, p1}, Ljava/net/URLClassLoader;-><init>([Ljava/net/URL;Ljava/lang/ClassLoader;)V

    .line 458
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javacpp/Builder$UserClassLoader;->paths:Ljava/util/LinkedList;

    .line 464
    return-void
.end method


# virtual methods
.method public varargs addPaths([Ljava/lang/String;)V
    .locals 7
    .parameter "paths"

    .prologue
    .line 466
    if-nez p1, :cond_1

    .line 481
    :cond_0
    return-void

    .line 469
    :cond_1
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/String;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v0, v3

    .line 470
    .local v5, path:Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 471
    .local v2, f:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_2

    .line 469
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 474
    :cond_2
    iget-object v6, p0, Lcom/googlecode/javacpp/Builder$UserClassLoader;->paths:Ljava/util/LinkedList;

    invoke-virtual {v6, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 476
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/googlecode/javacpp/Builder$UserClassLoader;->addURL(Ljava/net/URL;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 477
    :catch_0
    move-exception v1

    .line 478
    .local v1, e:Ljava/net/MalformedURLException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method

.method protected findClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .parameter "name"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 490
    iget-object v0, p0, Lcom/googlecode/javacpp/Builder$UserClassLoader;->paths:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 491
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "user.dir"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/googlecode/javacpp/Builder$UserClassLoader;->addPaths([Ljava/lang/String;)V

    .line 493
    :cond_0
    invoke-super {p0, p1}, Ljava/net/URLClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getPaths()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 483
    iget-object v0, p0, Lcom/googlecode/javacpp/Builder$UserClassLoader;->paths:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 484
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "user.dir"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/googlecode/javacpp/Builder$UserClassLoader;->addPaths([Ljava/lang/String;)V

    .line 486
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javacpp/Builder$UserClassLoader;->paths:Ljava/util/LinkedList;

    iget-object v1, p0, Lcom/googlecode/javacpp/Builder$UserClassLoader;->paths:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method
