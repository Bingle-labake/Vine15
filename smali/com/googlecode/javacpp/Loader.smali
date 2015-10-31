.class public Lcom/googlecode/javacpp/Loader;
.super Ljava/lang/Object;
.source "Loader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/googlecode/javacpp/Loader$ClassProperties;
    }
.end annotation


# static fields
.field static loadLibraries:Z

.field static loadedLibraries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static memberOffsets:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lcom/googlecode/javacpp/Pointer;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final platformName:Ljava/lang/String;

.field private static platformProperties:Ljava/util/Properties;

.field static tempDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 57
    sput-object v6, Lcom/googlecode/javacpp/Loader;->platformProperties:Ljava/util/Properties;

    .line 60
    const-string v4, "java.vm.name"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, jvmName:Ljava/lang/String;
    const-string v4, "os.name"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 62
    .local v2, osName:Ljava/lang/String;
    const-string v4, "os.arch"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 63
    .local v1, osArch:Ljava/lang/String;
    const-string v4, "dalvik"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "linux"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 64
    const-string v2, "android"

    .line 73
    :cond_0
    :goto_0
    const-string v4, "i386"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "i486"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "i586"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "i686"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 74
    :cond_1
    const-string v1, "x86"

    .line 80
    :cond_2
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/googlecode/javacpp/Loader;->platformName:Ljava/lang/String;

    .line 491
    sput-object v6, Lcom/googlecode/javacpp/Loader;->tempDir:Ljava/io/File;

    .line 493
    const/4 v4, 0x1

    sput-boolean v4, Lcom/googlecode/javacpp/Loader;->loadLibraries:Z

    .line 495
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-static {v4}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    sput-object v4, Lcom/googlecode/javacpp/Loader;->loadedLibraries:Ljava/util/Map;

    .line 727
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->getPlatformName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "windows"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 728
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    new-instance v5, Lcom/googlecode/javacpp/Loader$2;

    invoke-direct {v5}, Lcom/googlecode/javacpp/Loader$2;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/Runtime;->addShutdownHook(Ljava/lang/Thread;)V

    .line 776
    :cond_3
    new-instance v4, Ljava/util/WeakHashMap;

    invoke-direct {v4}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v4, Lcom/googlecode/javacpp/Loader;->memberOffsets:Ljava/util/WeakHashMap;

    return-void

    .line 65
    :cond_4
    const-string v4, "mac os x"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 66
    const-string v2, "macosx"

    goto :goto_0

    .line 68
    :cond_5
    const/16 v4, 0x20

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 69
    .local v3, spaceIndex:I
    if-lez v3, :cond_0

    .line 70
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 75
    .end local v3           #spaceIndex:I
    :cond_6
    const-string v4, "amd64"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    const-string v4, "x86-64"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    const-string v4, "x64"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 76
    :cond_7
    const-string v1, "x86_64"

    goto :goto_1

    .line 77
    :cond_8
    const-string v4, "arm"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 78
    const-string v1, "arm"

    goto/16 :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    return-void
.end method

.method public static extractResource(Ljava/lang/Class;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .parameter "cls"
    .parameter "name"
    .parameter "directory"
    .parameter "prefix"
    .parameter "suffix"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 440
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    invoke-static {v0, p2, p3, p4}, Lcom/googlecode/javacpp/Loader;->extractResource(Ljava/net/URL;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static extractResource(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .parameter "name"
    .parameter "directory"
    .parameter "prefix"
    .parameter "suffix"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 428
    const/4 v1, 0x2

    invoke-static {v1}, Lcom/googlecode/javacpp/Loader;->getCallerClass(I)Ljava/lang/Class;

    move-result-object v0

    .line 429
    .local v0, cls:Ljava/lang/Class;
    invoke-static {v0, p0, p1, p2, p3}, Lcom/googlecode/javacpp/Loader;->extractResource(Ljava/lang/Class;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method public static extractResource(Ljava/net/URL;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 11
    .parameter "resourceURL"
    .parameter "directory"
    .parameter "prefix"
    .parameter "suffix"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 456
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v6

    .line 457
    .local v6, is:Ljava/io/InputStream;
    :goto_0
    if-nez v6, :cond_1

    .line 486
    :goto_1
    return-object v3

    .end local v6           #is:Ljava/io/InputStream;
    :cond_0
    move-object v6, v3

    .line 456
    goto :goto_0

    .line 460
    .restart local v6       #is:Ljava/io/InputStream;
    :cond_1
    const/4 v3, 0x0

    .line 461
    .local v3, file:Ljava/io/File;
    const/4 v5, 0x0

    .line 463
    .local v5, fileExisted:Z
    if-nez p2, :cond_4

    if-nez p3, :cond_4

    .line 464
    if-nez p1, :cond_2

    .line 465
    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v9, "java.io.tmpdir"

    invoke-static {v9}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v1, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .end local p1
    .local v1, directory:Ljava/io/File;
    move-object p1, v1

    .line 467
    .end local v1           #directory:Ljava/io/File;
    .restart local p1
    :cond_2
    new-instance v4, Ljava/io/File;

    new-instance v9, Ljava/io/File;

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, p1, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 468
    .end local v3           #file:Ljava/io/File;
    .local v4, file:Ljava/io/File;
    :try_start_1
    invoke-virtual {v4}, Ljava/io/File;->exists()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v5

    move-object v3, v4

    .line 472
    .end local v4           #file:Ljava/io/File;
    .restart local v3       #file:Ljava/io/File;
    :goto_2
    :try_start_2
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 473
    .local v8, os:Ljava/io/FileOutputStream;
    const/16 v9, 0x400

    new-array v0, v9, [B

    .line 475
    .local v0, buffer:[B
    :goto_3
    invoke-virtual {v6, v0}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .local v7, length:I
    const/4 v9, -0x1

    if-eq v7, v9, :cond_5

    .line 476
    const/4 v9, 0x0

    invoke-virtual {v8, v0, v9, v7}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3

    .line 480
    .end local v0           #buffer:[B
    .end local v7           #length:I
    .end local v8           #os:Ljava/io/FileOutputStream;
    :catch_0
    move-exception v2

    .line 481
    .local v2, e:Ljava/io/IOException;
    :goto_4
    if-eqz v3, :cond_3

    if-nez v5, :cond_3

    .line 482
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 484
    :cond_3
    throw v2

    .line 470
    .end local v2           #e:Ljava/io/IOException;
    :cond_4
    :try_start_3
    invoke-static {p2, p3, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    goto :goto_2

    .line 478
    .restart local v0       #buffer:[B
    .restart local v7       #length:I
    .restart local v8       #os:Ljava/io/FileOutputStream;
    :cond_5
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 479
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 480
    .end local v0           #buffer:[B
    .end local v3           #file:Ljava/io/File;
    .end local v7           #length:I
    .end local v8           #os:Ljava/io/FileOutputStream;
    .restart local v4       #file:Ljava/io/File;
    :catch_1
    move-exception v2

    move-object v3, v4

    .end local v4           #file:Ljava/io/File;
    .restart local v3       #file:Ljava/io/File;
    goto :goto_4
.end method

.method public static findLibrary(Ljava/lang/Class;Lcom/googlecode/javacpp/Loader$ClassProperties;Ljava/lang/String;)[Ljava/net/URL;
    .locals 24
    .parameter "cls"
    .parameter "properties"
    .parameter "libnameversion"

    .prologue
    .line 598
    const-string v21, "@"

    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 599
    .local v14, s:[Ljava/lang/String;
    const/16 v21, 0x0

    aget-object v10, v14, v21

    .line 600
    .local v10, libname:Ljava/lang/String;
    array-length v0, v14

    move/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_0

    array-length v0, v14

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    aget-object v20, v14, v21

    .line 603
    .local v20, version:Ljava/lang/String;
    :goto_0
    sget-object v21, Lcom/googlecode/javacpp/Loader;->loadedLibraries:Ljava/util/Map;

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 604
    .local v5, filename:Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 606
    const/16 v21, 0x1

    :try_start_0
    move/from16 v0, v21

    new-array v0, v0, [Ljava/net/URL;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    new-instance v23, Ljava/io/File;

    move-object/from16 v0, v23

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v23

    aput-object v23, v21, v22
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 646
    :goto_1
    return-object v21

    .line 600
    .end local v5           #filename:Ljava/lang/String;
    .end local v20           #version:Ljava/lang/String;
    :cond_0
    const-string v20, ""

    goto :goto_0

    .line 607
    .restart local v5       #filename:Ljava/lang/String;
    .restart local v20       #version:Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 608
    .local v3, ex:Ljava/io/IOException;
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/net/URL;

    move-object/from16 v21, v0

    goto :goto_1

    .line 612
    .end local v3           #ex:Ljava/io/IOException;
    :cond_1
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "platform.name"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x2f

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 613
    .local v16, subdir:Ljava/lang/String;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "library.prefix"

    const-string v23, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 614
    .local v13, prefix:Ljava/lang/String;
    const-string v21, "library.suffix"

    const-string v22, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 615
    .local v17, suffix:Ljava/lang/String;
    const/16 v21, 0x3

    move/from16 v0, v21

    new-array v15, v0, [Ljava/lang/String;

    const/16 v21, 0x0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    aput-object v22, v15, v21

    const/16 v21, 0x1

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    aput-object v22, v15, v21

    const/16 v21, 0x2

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    aput-object v22, v15, v21

    .line 621
    .local v15, styles:[Ljava/lang/String;
    const/4 v8, 0x0

    .line 622
    .local v8, k:I
    new-instance v12, Ljava/util/LinkedList;

    invoke-direct {v12}, Ljava/util/LinkedList;-><init>()V

    .line 623
    .local v12, paths:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const-string v21, "loader.preloadpath"

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 624
    const-string v21, "compiler.linkpath"

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 625
    array-length v0, v15

    move/from16 v21, v0

    invoke-virtual {v12}, Ljava/util/LinkedList;->size()I

    move-result v22

    add-int/lit8 v22, v22, 0x1

    mul-int v21, v21, v22

    move/from16 v0, v21

    new-array v0, v0, [Ljava/net/URL;

    move-object/from16 v19, v0

    .line 626
    .local v19, urls:[Ljava/net/URL;
    const/4 v6, 0x0

    .local v6, i:I
    move v9, v8

    .end local v8           #k:I
    .local v9, k:I
    :goto_2
    if-eqz p0, :cond_2

    array-length v0, v15

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v6, v0, :cond_2

    .line 628
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    aget-object v22, v15, v6

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v18

    .line 629
    .local v18, u:Ljava/net/URL;
    if-eqz v18, :cond_6

    .line 630
    add-int/lit8 v8, v9, 0x1

    .end local v9           #k:I
    .restart local v8       #k:I
    aput-object v18, v19, v9

    .line 626
    :goto_3
    add-int/lit8 v6, v6, 0x1

    move v9, v8

    .end local v8           #k:I
    .restart local v9       #k:I
    goto :goto_2

    .line 634
    .end local v18           #u:Ljava/net/URL;
    :cond_2
    const/4 v6, 0x0

    move v8, v9

    .end local v9           #k:I
    .restart local v8       #k:I
    :goto_4
    invoke-virtual {v12}, Ljava/util/LinkedList;->size()I

    move-result v21

    if-lez v21, :cond_5

    array-length v0, v15

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v6, v0, :cond_5

    .line 635
    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_3
    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 636
    .local v11, path:Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    aget-object v21, v15, v6

    move-object/from16 v0, v21

    invoke-direct {v4, v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 637
    .local v4, file:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v21

    if-eqz v21, :cond_3

    .line 639
    add-int/lit8 v9, v8, 0x1

    .end local v8           #k:I
    .restart local v9       #k:I
    :try_start_1
    invoke-virtual {v4}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v21

    aput-object v21, v19, v8
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move v8, v9

    .line 642
    .end local v9           #k:I
    .restart local v8       #k:I
    goto :goto_5

    .line 640
    .end local v8           #k:I
    .restart local v9       #k:I
    :catch_1
    move-exception v3

    .line 641
    .restart local v3       #ex:Ljava/io/IOException;
    new-instance v21, Ljava/lang/RuntimeException;

    move-object/from16 v0, v21

    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v21

    .line 634
    .end local v3           #ex:Ljava/io/IOException;
    .end local v4           #file:Ljava/io/File;
    .end local v9           #k:I
    .end local v11           #path:Ljava/lang/String;
    .restart local v8       #k:I
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 646
    .end local v7           #i$:Ljava/util/Iterator;
    :cond_5
    move-object/from16 v0, v19

    invoke-static {v0, v8}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [Ljava/net/URL;

    goto/16 :goto_1

    .end local v8           #k:I
    .restart local v9       #k:I
    .restart local v18       #u:Ljava/net/URL;
    :cond_6
    move v8, v9

    .end local v9           #k:I
    .restart local v8       #k:I
    goto :goto_3
.end method

.method public static getCallerClass(I)Ljava/lang/Class;
    .locals 5
    .parameter "i"

    .prologue
    .line 395
    new-instance v3, Lcom/googlecode/javacpp/Loader$1;

    invoke-direct {v3}, Lcom/googlecode/javacpp/Loader$1;-><init>()V

    invoke-virtual {v3}, Lcom/googlecode/javacpp/Loader$1;->getClassContext()[Ljava/lang/Class;

    move-result-object v0

    .line 400
    .local v0, classContext:[Ljava/lang/Class;
    if-eqz v0, :cond_1

    .line 401
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_3

    .line 402
    aget-object v3, v0, v2

    const-class v4, Lcom/googlecode/javacpp/Loader;

    if-ne v3, v4, :cond_0

    .line 403
    add-int v3, p0, v2

    aget-object v3, v0, v3

    .line 417
    .end local v2           #j:I
    :goto_1
    return-object v3

    .line 401
    .restart local v2       #j:I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 409
    .end local v2           #j:I
    :cond_1
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 410
    .local v1, classNames:[Ljava/lang/StackTraceElement;
    const/4 v2, 0x0

    .restart local v2       #j:I
    :goto_2
    array-length v3, v1

    if-ge v2, v3, :cond_3

    .line 411
    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-class v4, Lcom/googlecode/javacpp/Loader;

    if-ne v3, v4, :cond_2

    .line 412
    add-int v3, p0, v2

    aget-object v3, v1, v3

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_1

    .line 410
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 415
    .end local v1           #classNames:[Ljava/lang/StackTraceElement;
    .end local v2           #j:I
    :catch_0
    move-exception v3

    .line 417
    :cond_3
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static getEnclosingClass(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 3
    .parameter "cls"

    .prologue
    .line 151
    move-object v0, p0

    .line 153
    .local v0, c:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 154
    const-class v2, Lcom/googlecode/javacpp/annotation/Properties;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 168
    :cond_0
    return-object v0

    .line 157
    :cond_1
    const-class v2, Lcom/googlecode/javacpp/annotation/Platform;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 158
    const-class v2, Lcom/googlecode/javacpp/annotation/Platform;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/googlecode/javacpp/annotation/Platform;

    .line 159
    .local v1, p:Lcom/googlecode/javacpp/annotation/Platform;
    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->define()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->include()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->cinclude()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->includepath()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->options()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->linkpath()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->link()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->framework()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->preloadpath()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->preload()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-gtz v2, :cond_0

    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Platform;->library()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_0

    .line 166
    .end local v1           #p:Lcom/googlecode/javacpp/annotation/Platform;
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method

.method public static getPlatformName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 91
    const-string v0, "com.googlecode.javacpp.platform.name"

    sget-object v1, Lcom/googlecode/javacpp/Loader;->platformName:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTempDir()Ljava/io/File;
    .locals 6

    .prologue
    .line 504
    sget-object v3, Lcom/googlecode/javacpp/Loader;->tempDir:Ljava/io/File;

    if-nez v3, :cond_0

    .line 505
    new-instance v2, Ljava/io/File;

    const-string v3, "java.io.tmpdir"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 506
    .local v2, tmpdir:Ljava/io/File;
    const/4 v0, 0x0

    .line 507
    .local v0, f:Ljava/io/File;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    const/16 v3, 0x3e8

    if-ge v1, v3, :cond_0

    .line 508
    new-instance v0, Ljava/io/File;

    .end local v0           #f:Ljava/io/File;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "javacpp"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 509
    .restart local v0       #f:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 510
    sput-object v0, Lcom/googlecode/javacpp/Loader;->tempDir:Ljava/io/File;

    .line 511
    sget-object v3, Lcom/googlecode/javacpp/Loader;->tempDir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->deleteOnExit()V

    .line 516
    :cond_0
    sget-object v3, Lcom/googlecode/javacpp/Loader;->tempDir:Ljava/io/File;

    return-object v3

    .line 507
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static isLoadLibraries()Z
    .locals 1

    .prologue
    .line 521
    sget-boolean v0, Lcom/googlecode/javacpp/Loader;->loadLibraries:Z

    return v0
.end method

.method public static load()Ljava/lang/String;
    .locals 2

    .prologue
    .line 531
    const/4 v1, 0x2

    invoke-static {v1}, Lcom/googlecode/javacpp/Loader;->getCallerClass(I)Ljava/lang/Class;

    move-result-object v0

    .line 532
    .local v0, cls:Ljava/lang/Class;
    invoke-static {v0}, Lcom/googlecode/javacpp/Loader;->load(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static load(Ljava/lang/Class;)Ljava/lang/String;
    .locals 13
    .parameter "cls"

    .prologue
    const/4 v12, 0x1

    .line 544
    sget-boolean v9, Lcom/googlecode/javacpp/Loader;->loadLibraries:Z

    if-eqz v9, :cond_0

    if-nez p0, :cond_1

    .line 545
    :cond_0
    const/4 v9, 0x0

    .line 578
    :goto_0
    return-object v9

    .line 549
    :cond_1
    invoke-static {p0}, Lcom/googlecode/javacpp/Loader;->getEnclosingClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p0

    .line 553
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v11

    invoke-static {v9, v10, v11}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object p0

    .line 561
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->loadProperties()Ljava/util/Properties;

    move-result-object v9

    invoke-static {p0, v9, v12}, Lcom/googlecode/javacpp/Loader;->loadProperties(Ljava/lang/Class;Ljava/util/Properties;Z)Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-result-object v4

    .line 562
    .local v4, p:Lcom/googlecode/javacpp/Loader$ClassProperties;
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 563
    .local v7, preloads:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const-string v9, "loader.preload"

    invoke-virtual {v4, v9}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 564
    const-string v9, "compiler.link"

    invoke-virtual {v4, v9}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 565
    const/4 v6, 0x0

    .line 566
    .local v6, preloadError:Ljava/lang/UnsatisfiedLinkError;
    invoke-virtual {v7}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 568
    .local v5, preload:Ljava/lang/String;
    :try_start_1
    invoke-static {p0, v4, v5}, Lcom/googlecode/javacpp/Loader;->findLibrary(Ljava/lang/Class;Lcom/googlecode/javacpp/Loader$ClassProperties;Ljava/lang/String;)[Ljava/net/URL;

    move-result-object v8

    .line 569
    .local v8, urls:[Ljava/net/URL;
    invoke-static {v8, v5}, Lcom/googlecode/javacpp/Loader;->loadLibrary([Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 570
    .end local v8           #urls:[Ljava/net/URL;
    :catch_0
    move-exception v0

    .line 571
    .local v0, e:Ljava/lang/UnsatisfiedLinkError;
    move-object v6, v0

    goto :goto_1

    .line 554
    .end local v0           #e:Ljava/lang/UnsatisfiedLinkError;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v4           #p:Lcom/googlecode/javacpp/Loader$ClassProperties;
    .end local v5           #preload:Ljava/lang/String;
    .end local v6           #preloadError:Ljava/lang/UnsatisfiedLinkError;
    .end local v7           #preloads:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :catch_1
    move-exception v1

    .line 555
    .local v1, ex:Ljava/lang/ClassNotFoundException;
    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v9}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    .line 556
    .local v0, e:Ljava/lang/Error;
    invoke-virtual {v0, v1}, Ljava/lang/Error;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 557
    throw v0

    .line 576
    .end local v0           #e:Ljava/lang/Error;
    .end local v1           #ex:Ljava/lang/ClassNotFoundException;
    .restart local v2       #i$:Ljava/util/Iterator;
    .restart local v4       #p:Lcom/googlecode/javacpp/Loader$ClassProperties;
    .restart local v6       #preloadError:Ljava/lang/UnsatisfiedLinkError;
    .restart local v7       #preloads:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_2
    :try_start_2
    const-string v9, "loader.library"

    invoke-virtual {v4, v9}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 577
    .local v3, library:Ljava/lang/String;
    invoke-static {p0, v4, v3}, Lcom/googlecode/javacpp/Loader;->findLibrary(Ljava/lang/Class;Lcom/googlecode/javacpp/Loader$ClassProperties;Ljava/lang/String;)[Ljava/net/URL;

    move-result-object v8

    .line 578
    .restart local v8       #urls:[Ljava/net/URL;
    invoke-static {v8, v3}, Lcom/googlecode/javacpp/Loader;->loadLibrary([Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v9

    goto :goto_0

    .line 579
    .end local v3           #library:Ljava/lang/String;
    .end local v8           #urls:[Ljava/net/URL;
    :catch_2
    move-exception v0

    .line 580
    .local v0, e:Ljava/lang/UnsatisfiedLinkError;
    if-eqz v6, :cond_3

    .line 581
    invoke-virtual {v0, v6}, Ljava/lang/UnsatisfiedLinkError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 583
    :cond_3
    throw v0
.end method

.method public static loadLibrary([Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .parameter "urls"
    .parameter "libnameversion"

    .prologue
    const/4 v4, 0x0

    .line 660
    sget-boolean v11, Lcom/googlecode/javacpp/Loader;->loadLibraries:Z

    if-nez v11, :cond_1

    .line 719
    :cond_0
    :goto_0
    return-object v4

    .line 665
    :cond_1
    sget-object v11, Lcom/googlecode/javacpp/Loader;->loadedLibraries:Ljava/util/Map;

    invoke-interface {v11, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 666
    .local v4, filename:Ljava/lang/String;
    if-nez v4, :cond_0

    .line 670
    const/4 v9, 0x0

    .line 671
    .local v9, tempFile:Ljava/io/File;
    const/4 v8, 0x0

    .line 673
    .local v8, loadError:Ljava/lang/UnsatisfiedLinkError;
    move-object v0, p0

    .local v0, arr$:[Ljava/net/URL;
    :try_start_0
    array-length v6, v0

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_1
    if-ge v5, v6, :cond_4

    aget-object v10, v0, v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 677
    .local v10, url:Ljava/net/URL;
    :try_start_1
    new-instance v3, Ljava/io/File;

    invoke-virtual {v10}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v11

    invoke-direct {v3, v11}, Ljava/io/File;-><init>(Ljava/net/URI;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 685
    .local v3, file:Ljava/io/File;
    :goto_2
    if-eqz v3, :cond_3

    :try_start_2
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 686
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    move-result-object v4

    .line 689
    :try_start_3
    sget-object v11, Lcom/googlecode/javacpp/Loader;->loadedLibraries:Ljava/util/Map;

    invoke-interface {v11, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 690
    invoke-static {v4}, Ljava/lang/System;->load(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 718
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 719
    invoke-virtual {v9}, Ljava/io/File;->deleteOnExit()V

    goto :goto_0

    .line 678
    .end local v3           #file:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 679
    .local v1, e:Ljava/lang/Exception;
    if-eqz v9, :cond_2

    :try_start_4
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 680
    invoke-virtual {v9}, Ljava/io/File;->deleteOnExit()V

    .line 683
    :cond_2
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->getTempDir()Ljava/io/File;

    move-result-object v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static {v10, v11, v12, v13}, Lcom/googlecode/javacpp/Loader;->extractResource(Ljava/net/URL;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v9

    move-object v3, v9

    .restart local v3       #file:Ljava/io/File;
    goto :goto_2

    .line 692
    .end local v1           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 693
    .local v1, e:Ljava/lang/UnsatisfiedLinkError;
    move-object v8, v1

    .line 694
    sget-object v11, Lcom/googlecode/javacpp/Loader;->loadedLibraries:Ljava/util/Map;

    invoke-interface {v11, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    .end local v1           #e:Ljava/lang/UnsatisfiedLinkError;
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 699
    .end local v3           #file:Ljava/io/File;
    .end local v10           #url:Ljava/net/URL;
    :cond_4
    const-string v11, "@"

    invoke-virtual {p1, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    aget-object v7, v11, v12

    .line 700
    .local v7, libname:Ljava/lang/String;
    sget-object v11, Lcom/googlecode/javacpp/Loader;->loadedLibraries:Ljava/util/Map;

    invoke-interface {v11, p1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    invoke-static {v7}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 718
    if-eqz v9, :cond_5

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 719
    invoke-virtual {v9}, Ljava/io/File;->deleteOnExit()V

    :cond_5
    move-object v4, v7

    goto :goto_0

    .line 703
    .end local v5           #i$:I
    .end local v6           #len$:I
    .end local v7           #libname:Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 704
    .restart local v1       #e:Ljava/lang/UnsatisfiedLinkError;
    :try_start_5
    sget-object v11, Lcom/googlecode/javacpp/Loader;->loadedLibraries:Ljava/util/Map;

    invoke-interface {v11, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    if-eqz v8, :cond_6

    .line 706
    invoke-virtual {v1, v8}, Ljava/lang/UnsatisfiedLinkError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 708
    :cond_6
    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 718
    .end local v1           #e:Ljava/lang/UnsatisfiedLinkError;
    :catchall_0
    move-exception v11

    if-eqz v9, :cond_7

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_7

    .line 719
    invoke-virtual {v9}, Ljava/io/File;->deleteOnExit()V

    :cond_7
    throw v11

    .line 709
    :catch_3
    move-exception v2

    .line 710
    .local v2, ex:Ljava/io/IOException;
    :try_start_6
    sget-object v11, Lcom/googlecode/javacpp/Loader;->loadedLibraries:Ljava/util/Map;

    invoke-interface {v11, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 711
    if-eqz v8, :cond_8

    .line 712
    invoke-virtual {v2, v8}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 714
    :cond_8
    new-instance v1, Ljava/lang/UnsatisfiedLinkError;

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v1, v11}, Ljava/lang/UnsatisfiedLinkError;-><init>(Ljava/lang/String;)V

    .line 715
    .local v1, e:Ljava/lang/Error;
    invoke-virtual {v1, v2}, Ljava/lang/Error;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 716
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method

.method public static loadProperties(Ljava/lang/Class;Ljava/util/Properties;Z)Lcom/googlecode/javacpp/Loader$ClassProperties;
    .locals 1
    .parameter "cls"
    .parameter "properties"
    .parameter "inherit"

    .prologue
    .line 383
    new-instance v0, Lcom/googlecode/javacpp/Loader$ClassProperties;

    invoke-direct {v0, p1}, Lcom/googlecode/javacpp/Loader$ClassProperties;-><init>(Ljava/util/Properties;)V

    .line 384
    .local v0, cp:Lcom/googlecode/javacpp/Loader$ClassProperties;
    invoke-virtual {v0, p0, p2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->load(Ljava/lang/Class;Z)V

    .line 385
    return-object v0
.end method

.method public static loadProperties([Ljava/lang/Class;Ljava/util/Properties;Z)Lcom/googlecode/javacpp/Loader$ClassProperties;
    .locals 5
    .parameter "cls"
    .parameter "properties"
    .parameter "inherit"

    .prologue
    .line 364
    new-instance v2, Lcom/googlecode/javacpp/Loader$ClassProperties;

    invoke-direct {v2, p1}, Lcom/googlecode/javacpp/Loader$ClassProperties;-><init>(Ljava/util/Properties;)V

    .line 365
    .local v2, cp:Lcom/googlecode/javacpp/Loader$ClassProperties;
    move-object v0, p0

    .local v0, arr$:[Ljava/lang/Class;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 366
    .local v1, c:Ljava/lang/Class;
    invoke-virtual {v2, v1, p2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->load(Ljava/lang/Class;Z)V

    .line 365
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 368
    .end local v1           #c:Ljava/lang/Class;
    :cond_0
    return-object v2
.end method

.method public static loadProperties()Ljava/util/Properties;
    .locals 3

    .prologue
    .line 100
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->getPlatformName()Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, name:Ljava/lang/String;
    sget-object v1, Lcom/googlecode/javacpp/Loader;->platformProperties:Ljava/util/Properties;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/googlecode/javacpp/Loader;->platformProperties:Ljava/util/Properties;

    const-string v2, "platform.name"

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    sget-object v1, Lcom/googlecode/javacpp/Loader;->platformProperties:Ljava/util/Properties;

    .line 104
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lcom/googlecode/javacpp/Loader;->loadProperties(Ljava/lang/String;)Ljava/util/Properties;

    move-result-object v1

    sput-object v1, Lcom/googlecode/javacpp/Loader;->platformProperties:Ljava/util/Properties;

    goto :goto_0
.end method

.method public static loadProperties(Ljava/lang/String;)Ljava/util/Properties;
    .locals 7
    .parameter "name"

    .prologue
    .line 113
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 114
    .local v3, p:Ljava/util/Properties;
    const-string v4, "platform.name"

    invoke-virtual {v3, v4, p0}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "properties/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".properties"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 116
    const-class v4, Lcom/googlecode/javacpp/Loader;

    invoke-virtual {v4, p0}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 119
    .local v2, is:Ljava/io/InputStream;
    :try_start_0
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v3, v4}, Ljava/util/Properties;->load(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 137
    :goto_0
    return-object v3

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, e:Ljava/lang/NoSuchMethodError;
    :try_start_1
    invoke-virtual {v3, v2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 123
    .end local v0           #e:Ljava/lang/NoSuchMethodError;
    :catch_1
    move-exception v0

    .line 124
    .local v0, e:Ljava/lang/Exception;
    const-string p0, "properties/generic.properties"

    .line 125
    const-class v4, Lcom/googlecode/javacpp/Loader;

    invoke-virtual {v4, p0}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 128
    :try_start_2
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v3, v4}, Ljava/util/Properties;->load(Ljava/io/Reader;)V
    :try_end_2
    .catch Ljava/lang/NoSuchMethodError; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_0

    .line 129
    :catch_2
    move-exception v1

    .line 130
    .local v1, e2:Ljava/lang/NoSuchMethodError;
    :try_start_3
    invoke-virtual {v3, v2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_0

    .line 132
    .end local v1           #e2:Ljava/lang/NoSuchMethodError;
    :catch_3
    move-exception v1

    .line 133
    .local v1, e2:Ljava/lang/Exception;
    new-instance v4, Ljava/util/MissingResourceException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not even get generic properties: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-class v6, Lcom/googlecode/javacpp/Loader;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, p0}, Ljava/util/MissingResourceException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    throw v4
.end method

.method public static main([Ljava/lang/String;)V
    .locals 8
    .parameter "args"

    .prologue
    .line 752
    new-instance v5, Ljava/io/File;

    const-string v6, "java.io.tmpdir"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 753
    .local v5, tmpdir:Ljava/io/File;
    new-instance v4, Ljava/io/File;

    const/4 v6, 0x0

    aget-object v6, p0, v6

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 754
    .local v4, tempDir:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "javacpp"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 767
    :cond_0
    :goto_0
    return-void

    .line 759
    :cond_1
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, arr$:[Ljava/io/File;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_3

    aget-object v1, v0, v2

    .line 760
    .local v1, file:Ljava/io/File;
    :goto_2
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v6

    if-nez v6, :cond_2

    .line 762
    const-wide/16 v6, 0x64

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 763
    :catch_0
    move-exception v6

    goto :goto_2

    .line 759
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 766
    .end local v1           #file:Ljava/io/File;
    :cond_3
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    goto :goto_0
.end method

.method public static offsetof(Ljava/lang/Class;Ljava/lang/String;)I
    .locals 1
    .parameter
    .parameter "member"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/googlecode/javacpp/Pointer;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 816
    .local p0, type:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/googlecode/javacpp/Pointer;>;"
    sget-object v0, Lcom/googlecode/javacpp/Loader;->memberOffsets:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method static declared-synchronized putMemberOffset(Ljava/lang/Class;Ljava/lang/String;I)V
    .locals 3
    .parameter
    .parameter "member"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/googlecode/javacpp/Pointer;",
            ">;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 800
    .local p0, type:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/googlecode/javacpp/Pointer;>;"
    const-class v2, Lcom/googlecode/javacpp/Loader;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/googlecode/javacpp/Loader;->memberOffsets:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 801
    .local v0, offsets:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez v0, :cond_0

    .line 802
    sget-object v1, Lcom/googlecode/javacpp/Loader;->memberOffsets:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/util/HashMap;

    .end local v0           #offsets:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .restart local v0       #offsets:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 804
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 805
    monitor-exit v2

    return-void

    .line 800
    .end local v0           #offsets:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method static putMemberOffset(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 4
    .parameter "typeName"
    .parameter "member"
    .parameter "offset"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 789
    const/16 v1, 0x2f

    const/16 v2, 0x2e

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const-class v3, Lcom/googlecode/javacpp/Loader;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {v1, v2, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 790
    .local v0, c:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-class v1, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1, p2}, Lcom/googlecode/javacpp/Loader;->putMemberOffset(Ljava/lang/Class;Ljava/lang/String;I)V

    .line 791
    return-void
.end method

.method public static sizeof(Ljava/lang/Class;)I
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/googlecode/javacpp/Pointer;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 827
    .local p0, type:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/googlecode/javacpp/Pointer;>;"
    sget-object v0, Lcom/googlecode/javacpp/Loader;->memberOffsets:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "sizeof"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method
