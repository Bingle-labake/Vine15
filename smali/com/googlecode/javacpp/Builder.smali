.class public Lcom/googlecode/javacpp/Builder;
.super Ljava/lang/Object;
.source "Builder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/googlecode/javacpp/Builder$ClassScanner;,
        Lcom/googlecode/javacpp/Builder$UserClassLoader;,
        Lcom/googlecode/javacpp/Builder$Piper;
    }
.end annotation


# instance fields
.field classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

.field compile:Z

.field compilerOptions:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field copyLibs:Z

.field environmentVariables:Ljava/util/Map;
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

.field header:Z

.field jarPrefix:Ljava/lang/String;

.field outputDirectory:Ljava/io/File;

.field outputName:Ljava/lang/String;

.field properties:Ljava/util/Properties;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 601
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 611
    iput-object v1, p0, Lcom/googlecode/javacpp/Builder;->outputDirectory:Ljava/io/File;

    .line 614
    iput-object v1, p0, Lcom/googlecode/javacpp/Builder;->outputName:Ljava/lang/String;

    .line 616
    iput-object v1, p0, Lcom/googlecode/javacpp/Builder;->jarPrefix:Ljava/lang/String;

    .line 618
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/googlecode/javacpp/Builder;->compile:Z

    .line 620
    iput-boolean v2, p0, Lcom/googlecode/javacpp/Builder;->header:Z

    .line 622
    iput-boolean v2, p0, Lcom/googlecode/javacpp/Builder;->copyLibs:Z

    .line 624
    iput-object v1, p0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    .line 626
    iput-object v1, p0, Lcom/googlecode/javacpp/Builder;->classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

    .line 628
    iput-object v1, p0, Lcom/googlecode/javacpp/Builder;->environmentVariables:Ljava/util/Map;

    .line 630
    iput-object v1, p0, Lcom/googlecode/javacpp/Builder;->compilerOptions:Ljava/util/Collection;

    .line 602
    sput-boolean v2, Lcom/googlecode/javacpp/Loader;->loadLibraries:Z

    .line 603
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->loadProperties()Ljava/util/Properties;

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    .line 604
    new-instance v0, Lcom/googlecode/javacpp/Builder$ClassScanner;

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    new-instance v2, Lcom/googlecode/javacpp/Builder$UserClassLoader;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/googlecode/javacpp/Builder$UserClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    invoke-direct {v0, v1, v2}, Lcom/googlecode/javacpp/Builder$ClassScanner;-><init>(Ljava/util/Collection;Lcom/googlecode/javacpp/Builder$UserClassLoader;)V

    iput-object v0, p0, Lcom/googlecode/javacpp/Builder;->classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

    .line 606
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javacpp/Builder;->compilerOptions:Ljava/util/Collection;

    .line 607
    return-void
.end method

.method public static varargs createJar(Ljava/io/File;[Ljava/lang/String;[Ljava/io/File;)V
    .locals 17
    .parameter "jarFile"
    .parameter "classpath"
    .parameter "files"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 414
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Creating JAR file: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 415
    new-instance v8, Ljava/util/jar/JarOutputStream;

    new-instance v14, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v8, v14}, Ljava/util/jar/JarOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 416
    .local v8, jos:Ljava/util/jar/JarOutputStream;
    move-object/from16 v1, p2

    .local v1, arr$:[Ljava/io/File;
    array-length v9, v1

    .local v9, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    :goto_0
    if-ge v7, v9, :cond_5

    aget-object v4, v1, v7

    .line 417
    .local v4, f:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    .line 418
    .local v11, name:Ljava/lang/String;
    if-eqz p1, :cond_3

    .line 422
    move-object/from16 v0, p1

    array-length v14, v0

    new-array v12, v14, [Ljava/lang/String;

    .line 423
    .local v12, names:[Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1
    move-object/from16 v0, p1

    array-length v14, v0

    if-ge v6, v14, :cond_1

    .line 424
    new-instance v14, Ljava/io/File;

    aget-object v15, p1, v6

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v13

    .line 425
    .local v13, path:Ljava/lang/String;
    invoke-virtual {v11, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 426
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v14

    add-int/lit8 v14, v14, 0x1

    invoke-virtual {v11, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v6

    .line 423
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 430
    .end local v13           #path:Ljava/lang/String;
    :cond_1
    const/4 v6, 0x0

    :goto_2
    array-length v14, v12

    if-ge v6, v14, :cond_3

    .line 431
    aget-object v14, v12, v6

    if-eqz v14, :cond_2

    aget-object v14, v12, v6

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v15

    if-ge v14, v15, :cond_2

    .line 432
    aget-object v11, v12, v6

    .line 430
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 436
    .end local v6           #i:I
    .end local v12           #names:[Ljava/lang/String;
    :cond_3
    new-instance v3, Ljava/util/zip/ZipEntry;

    sget-char v14, Ljava/io/File;->separatorChar:C

    const/16 v15, 0x2f

    invoke-virtual {v11, v14, v15}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v3, v14}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 437
    .local v3, e:Ljava/util/zip/ZipEntry;
    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v14

    invoke-virtual {v3, v14, v15}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 438
    invoke-virtual {v8, v3}, Ljava/util/jar/JarOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 439
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 440
    .local v5, fis:Ljava/io/FileInputStream;
    const/16 v14, 0x400

    new-array v2, v14, [B

    .line 442
    .local v2, buffer:[B
    :goto_3
    invoke-virtual {v5, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v10

    .local v10, length:I
    const/4 v14, -0x1

    if-eq v10, v14, :cond_4

    .line 443
    const/4 v14, 0x0

    invoke-virtual {v8, v2, v14, v10}, Ljava/util/jar/JarOutputStream;->write([BII)V

    goto :goto_3

    .line 445
    :cond_4
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 446
    invoke-virtual {v8}, Ljava/util/jar/JarOutputStream;->closeEntry()V

    .line 416
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    .line 450
    .end local v2           #buffer:[B
    .end local v3           #e:Ljava/util/zip/ZipEntry;
    .end local v4           #f:Ljava/io/File;
    .end local v5           #fis:Ljava/io/FileInputStream;
    .end local v10           #length:I
    .end local v11           #name:Ljava/lang/String;
    :cond_5
    invoke-virtual {v8}, Ljava/util/jar/JarOutputStream;->close()V

    .line 451
    return-void
.end method

.method public static includeJavaPaths(Lcom/googlecode/javacpp/Loader$ClassProperties;Z)V
    .locals 22
    .parameter "properties"
    .parameter "header"

    .prologue
    .line 87
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->getPlatformName()Ljava/lang/String;

    move-result-object v17

    .line 88
    .local v17, platformName:Ljava/lang/String;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "compiler.link.prefix"

    const-string v20, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "jvm"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "compiler.link.suffix"

    const-string v20, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 90
    .local v13, jvmlink:Ljava/lang/String;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "library.prefix"

    const-string v20, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "jvm"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "library.suffix"

    const-string v20, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 92
    .local v12, jvmlib:Ljava/lang/String;
    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v11, v0, [Ljava/lang/String;

    .line 93
    .local v11, jnipath:[Ljava/lang/String;
    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v14, v0, [Ljava/lang/String;

    .line 94
    .local v14, jvmpath:[Ljava/lang/String;
    new-instance v8, Lcom/googlecode/javacpp/Builder$1;

    invoke-direct {v8, v11, v13, v14, v12}, Lcom/googlecode/javacpp/Builder$1;-><init>([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .local v8, filter:Ljava/io/FilenameFilter;
    new-instance v18, Ljava/io/File;

    const-string v19, "java.home"

    invoke-static/range {v19 .. v19}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v10

    .line 113
    .local v10, javaHome:Ljava/io/File;
    :try_start_0
    invoke-virtual {v10}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 115
    :goto_0
    new-instance v5, Ljava/util/LinkedList;

    invoke-virtual {v10, v8}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v5, v0}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 116
    .local v5, dirs:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/io/File;>;"
    :cond_0
    invoke-virtual {v5}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_2

    .line 117
    invoke-virtual {v5}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 118
    .local v4, d:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 119
    .local v6, dpath:Ljava/lang/String;
    invoke-virtual {v4, v8}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v3

    .local v3, arr$:[Ljava/io/File;
    array-length v15, v3

    .local v15, len$:I
    const/4 v9, 0x0

    .local v9, i$:I
    :goto_1
    if-ge v9, v15, :cond_0

    aget-object v7, v3, v9

    .line 121
    .local v7, f:Ljava/io/File;
    :try_start_1
    invoke-virtual {v7}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v7

    .line 123
    :goto_2
    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_1

    .line 124
    invoke-virtual {v5, v7}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 119
    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 128
    .end local v3           #arr$:[Ljava/io/File;
    .end local v4           #d:Ljava/io/File;
    .end local v6           #dpath:Ljava/lang/String;
    .end local v7           #f:Ljava/io/File;
    .end local v9           #i$:I
    .end local v15           #len$:I
    :cond_2
    const/16 v18, 0x0

    aget-object v18, v11, v18

    if-eqz v18, :cond_7

    const/16 v18, 0x0

    aget-object v18, v11, v18

    const/16 v19, 0x1

    aget-object v19, v11, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_7

    .line 129
    const/16 v18, 0x1

    const/16 v19, 0x0

    aput-object v19, v11, v18

    .line 136
    :cond_3
    :goto_3
    const/16 v18, 0x0

    aget-object v18, v14, v18

    if-eqz v18, :cond_4

    const/16 v18, 0x0

    aget-object v18, v14, v18

    const/16 v19, 0x1

    aget-object v19, v14, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 137
    const/16 v18, 0x1

    const/16 v19, 0x0

    aput-object v19, v14, v18

    .line 139
    :cond_4
    const-string v18, "compiler.includepath"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v11}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 140
    const-string v18, "platform.name"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 141
    if-eqz p1, :cond_5

    .line 143
    const-string v18, "compiler.link"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v18

    const/16 v19, 0x0

    const-string v20, "jvm"

    invoke-virtual/range {v18 .. v20}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 144
    const-string v18, "compiler.linkpath"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v14}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 146
    :cond_5
    const-string v18, "macosx"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 147
    const-string v18, "compiler.framework"

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-string v21, "JavaVM"

    aput-object v21, v19, v20

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 150
    :cond_6
    return-void

    .line 130
    :cond_7
    const/16 v18, 0x0

    aget-object v18, v11, v18

    if-nez v18, :cond_3

    .line 131
    const-string v16, "/System/Library/Frameworks/JavaVM.framework/Headers/"

    .line 132
    .local v16, macpath:Ljava/lang/String;
    new-instance v18, Ljava/io/File;

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->isDirectory()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 133
    const/16 v18, 0x0

    aput-object v16, v11, v18

    goto/16 :goto_3

    .line 114
    .end local v5           #dirs:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/io/File;>;"
    .end local v16           #macpath:Ljava/lang/String;
    :catch_0
    move-exception v18

    goto/16 :goto_0

    .line 122
    .restart local v3       #arr$:[Ljava/io/File;
    .restart local v4       #d:Ljava/io/File;
    .restart local v5       #dirs:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/io/File;>;"
    .restart local v6       #dpath:Ljava/lang/String;
    .restart local v7       #f:Ljava/io/File;
    .restart local v9       #i$:I
    .restart local v15       #len$:I
    :catch_1
    move-exception v18

    goto/16 :goto_2
.end method

.method public static main([Ljava/lang/String;)V
    .locals 8
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 882
    const/4 v0, 0x0

    .line 883
    .local v0, addedClasses:Z
    new-instance v1, Lcom/googlecode/javacpp/Builder;

    invoke-direct {v1}, Lcom/googlecode/javacpp/Builder;-><init>()V

    .line 884
    .local v1, builder:Lcom/googlecode/javacpp/Builder;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_10

    .line 885
    const-string v3, "-help"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "--help"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 886
    :cond_0
    invoke-static {}, Lcom/googlecode/javacpp/Builder;->printHelp()V

    .line 887
    invoke-static {v7}, Ljava/lang/System;->exit(I)V

    .line 884
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 888
    :cond_1
    const-string v3, "-classpath"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "-cp"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "-lib"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 889
    :cond_2
    add-int/lit8 v2, v2, 0x1

    aget-object v3, p0, v2

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->classPaths(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    goto :goto_1

    .line 890
    :cond_3
    const-string v3, "-d"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 891
    add-int/lit8 v2, v2, 0x1

    aget-object v3, p0, v2

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->outputDirectory(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    goto :goto_1

    .line 892
    :cond_4
    const-string v3, "-o"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 893
    add-int/lit8 v2, v2, 0x1

    aget-object v3, p0, v2

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->outputName(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    goto :goto_1

    .line 894
    :cond_5
    const-string v3, "-cpp"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "-nocompile"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 895
    :cond_6
    invoke-virtual {v1, v7}, Lcom/googlecode/javacpp/Builder;->compile(Z)Lcom/googlecode/javacpp/Builder;

    goto :goto_1

    .line 896
    :cond_7
    const-string v3, "-header"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 897
    invoke-virtual {v1, v6}, Lcom/googlecode/javacpp/Builder;->header(Z)Lcom/googlecode/javacpp/Builder;

    goto :goto_1

    .line 898
    :cond_8
    const-string v3, "-copylibs"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 899
    invoke-virtual {v1, v6}, Lcom/googlecode/javacpp/Builder;->copyLibs(Z)Lcom/googlecode/javacpp/Builder;

    goto :goto_1

    .line 900
    :cond_9
    const-string v3, "-jarprefix"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 901
    add-int/lit8 v2, v2, 0x1

    aget-object v3, p0, v2

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->jarPrefix(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    goto/16 :goto_1

    .line 902
    :cond_a
    const-string v3, "-properties"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 903
    add-int/lit8 v2, v2, 0x1

    aget-object v3, p0, v2

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->properties(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    goto/16 :goto_1

    .line 904
    :cond_b
    const-string v3, "-propertyfile"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 905
    add-int/lit8 v2, v2, 0x1

    aget-object v3, p0, v2

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->propertyFile(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    goto/16 :goto_1

    .line 906
    :cond_c
    aget-object v3, p0, v2

    const-string v4, "-D"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 907
    aget-object v3, p0, v2

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->property(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    goto/16 :goto_1

    .line 908
    :cond_d
    const-string v3, "-Xcompiler"

    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 909
    new-array v3, v6, [Ljava/lang/String;

    add-int/lit8 v2, v2, 0x1

    aget-object v4, p0, v2

    aput-object v4, v3, v7

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->compilerOptions([Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    goto/16 :goto_1

    .line 910
    :cond_e
    aget-object v3, p0, v2

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 911
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error: Invalid option \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p0, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 912
    invoke-static {}, Lcom/googlecode/javacpp/Builder;->printHelp()V

    .line 913
    invoke-static {v6}, Ljava/lang/System;->exit(I)V

    goto/16 :goto_1

    .line 915
    :cond_f
    new-array v3, v6, [Ljava/lang/String;

    aget-object v4, p0, v2

    aput-object v4, v3, v7

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->classesOrPackages([Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    .line 916
    const/4 v0, 0x1

    goto/16 :goto_1

    .line 919
    :cond_10
    if-nez v0, :cond_11

    .line 920
    const/4 v3, 0x0

    check-cast v3, [Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Builder;->classesOrPackages([Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    .line 922
    :cond_11
    invoke-virtual {v1}, Lcom/googlecode/javacpp/Builder;->build()[Ljava/io/File;

    .line 923
    return-void
.end method

.method public static printHelp()V
    .locals 4

    .prologue
    .line 845
    const-class v1, Lcom/googlecode/javacpp/Builder;

    invoke-virtual {v1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Package;->getImplementationVersion()Ljava/lang/String;

    move-result-object v0

    .line 846
    .local v0, version:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 847
    const-string v0, "unknown"

    .line 849
    :cond_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JavaCPP version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Copyright (C) 2011-2013 Samuel Audet <samuel.audet@gmail.com>\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Project site: http://code.google.com/p/javacpp/\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Licensed under the GNU General Public License version 2 (GPLv2) with Classpath exception.\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Please refer to LICENSE.txt or http://www.gnu.org/licenses/ for details."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 856
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/io/PrintStream;->println()V

    .line 857
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Usage: java -jar javacpp.jar [options] [class or package (suffixed with .* or .**)]"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 858
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/io/PrintStream;->println()V

    .line 859
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "where options include:"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 860
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/io/PrintStream;->println()V

    .line 861
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -classpath <path>      Load user classes from path"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 862
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -d <directory>         Output all generated files to directory"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 863
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -o <name>              Output everything in a file named after given name"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 864
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -nocompile             Do not compile or delete the generated source files"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 865
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -header                Generate header file with declarations of callbacks functions"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 866
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -copylibs              Copy to output directory dependent libraries (link and preload)"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 867
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -jarprefix <prefix>    Also create a JAR file named \"<prefix>-<platform.name>.jar\""

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 868
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -properties <resource> Load all properties from resource"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 869
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -propertyfile <file>   Load all properties from file"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 870
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -D<property>=<value>   Set property to value"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 871
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "    -Xcompiler <option>    Pass option directly to compiler"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 872
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/io/PrintStream;->println()V

    .line 873
    return-void
.end method


# virtual methods
.method public build()[Ljava/io/File;
    .locals 31
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 757
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/googlecode/javacpp/Builder$ClassScanner;->getClasses()Ljava/util/Collection;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Ljava/util/Collection;->isEmpty()Z

    move-result v28

    if-eqz v28, :cond_1

    .line 758
    const/4 v12, 0x0

    .line 838
    :cond_0
    :goto_0
    return-object v12

    .line 761
    :cond_1
    new-instance v22, Ljava/util/LinkedList;

    invoke-direct/range {v22 .. v22}, Ljava/util/LinkedList;-><init>()V

    .line 762
    .local v22, outputFiles:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/io/File;>;"
    new-instance v21, Ljava/util/LinkedHashMap;

    invoke-direct/range {v21 .. v21}, Ljava/util/LinkedHashMap;-><init>()V

    .line 763
    .local v21, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/LinkedList<Ljava/lang/Class;>;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/googlecode/javacpp/Builder$ClassScanner;->getClasses()Ljava/util/Collection;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_6

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 764
    .local v4, c:Ljava/lang/Class;
    invoke-static {v4}, Lcom/googlecode/javacpp/Loader;->getEnclosingClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v28

    move-object/from16 v0, v28

    if-ne v0, v4, :cond_2

    .line 767
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    move-object/from16 v0, v28

    move/from16 v1, v29

    invoke-static {v4, v0, v1}, Lcom/googlecode/javacpp/Loader;->loadProperties(Ljava/lang/Class;Ljava/util/Properties;Z)Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-result-object v23

    .line 768
    .local v23, p:Lcom/googlecode/javacpp/Loader$ClassProperties;
    const-string v28, "parser.target"

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 769
    .local v26, target:Ljava/lang/String;
    if-eqz v26, :cond_3

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-nez v28, :cond_3

    .line 770
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/googlecode/javacpp/Builder;->parse(Ljava/lang/Class;)Ljava/io/File;

    move-result-object v10

    .line 771
    .local v10, f:Ljava/io/File;
    if-eqz v10, :cond_2

    .line 772
    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 776
    .end local v10           #f:Ljava/io/File;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->outputName:Ljava/lang/String;

    move-object/from16 v28, v0

    if-eqz v28, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->outputName:Ljava/lang/String;

    move-object/from16 v20, v0

    .line 777
    .local v20, libraryName:Ljava/lang/String;
    :goto_2
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v28

    if-eqz v28, :cond_2

    .line 780
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/LinkedList;

    .line 781
    .local v6, classList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/Class;>;"
    if-nez v6, :cond_4

    .line 782
    new-instance v6, Ljava/util/LinkedList;

    .end local v6           #classList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/Class;>;"
    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    .restart local v6       #classList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/Class;>;"
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 784
    :cond_4
    invoke-virtual {v6, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 776
    .end local v6           #classList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/Class;>;"
    .end local v20           #libraryName:Ljava/lang/String;
    :cond_5
    const-string v28, "loader.library"

    const-string v29, ""

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    goto :goto_2

    .line 786
    .end local v4           #c:Ljava/lang/Class;
    .end local v23           #p:Lcom/googlecode/javacpp/Loader$ClassProperties;
    .end local v26           #target:Ljava/lang/String;
    :cond_6
    invoke-interface/range {v21 .. v21}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .end local v16           #i$:Ljava/util/Iterator;
    :cond_7
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_a

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 787
    .restart local v20       #libraryName:Ljava/lang/String;
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/LinkedList;

    .line 788
    .restart local v6       #classList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/Class;>;"
    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v28

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    invoke-virtual {v6, v0}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/Class;

    .line 789
    .local v5, classArray:[Ljava/lang/Class;
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v5, v1}, Lcom/googlecode/javacpp/Builder;->generateAndCompile([Ljava/lang/Class;Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 790
    .restart local v10       #f:Ljava/io/File;
    if-eqz v10, :cond_7

    .line 791
    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 792
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Builder;->copyLibs:Z

    move/from16 v28, v0

    if-eqz v28, :cond_7

    .line 794
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    move-object/from16 v0, v28

    move/from16 v1, v29

    invoke-static {v5, v0, v1}, Lcom/googlecode/javacpp/Loader;->loadProperties([Ljava/lang/Class;Ljava/util/Properties;Z)Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-result-object v23

    .line 795
    .restart local v23       #p:Lcom/googlecode/javacpp/Loader$ClassProperties;
    new-instance v24, Ljava/util/LinkedList;

    invoke-direct/range {v24 .. v24}, Ljava/util/LinkedList;-><init>()V

    .line 796
    .local v24, preloads:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const-string v28, "loader.preload"

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v28

    move-object/from16 v0, v24

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 797
    const-string v28, "compiler.link"

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v28

    move-object/from16 v0, v24

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 799
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    move-object/from16 v28, v0

    const/16 v29, 0x1

    move-object/from16 v0, v28

    move/from16 v1, v29

    invoke-static {v5, v0, v1}, Lcom/googlecode/javacpp/Loader;->loadProperties([Ljava/lang/Class;Ljava/util/Properties;Z)Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-result-object v23

    .line 801
    invoke-virtual {v10}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v8

    .line 802
    .local v8, directory:Ljava/io/File;
    invoke-virtual/range {v24 .. v24}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, i$:Ljava/util/Iterator;
    :cond_8
    :goto_3
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_7

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 803
    .local v25, s:Ljava/lang/String;
    const/16 v28, 0x0

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    move-object/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/googlecode/javacpp/Loader;->findLibrary(Ljava/lang/Class;Lcom/googlecode/javacpp/Loader$ClassProperties;Ljava/lang/String;)[Ljava/net/URL;

    move-result-object v27

    .line 806
    .local v27, urls:[Ljava/net/URL;
    :try_start_0
    new-instance v11, Ljava/io/File;

    const/16 v28, 0x0

    aget-object v28, v27, v28

    invoke-virtual/range {v28 .. v28}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/net/URI;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 810
    .local v11, fi:Ljava/io/File;
    new-instance v14, Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-direct {v14, v8, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 811
    .local v14, fo:Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_8

    move-object/from16 v0, v22

    invoke-virtual {v0, v14}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v28

    if-nez v28, :cond_8

    .line 812
    sget-object v28, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Copying library file: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 813
    new-instance v13, Ljava/io/FileInputStream;

    invoke-direct {v13, v11}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 814
    .local v13, fis:Ljava/io/FileInputStream;
    new-instance v15, Ljava/io/FileOutputStream;

    invoke-direct {v15, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 815
    .local v15, fos:Ljava/io/FileOutputStream;
    const/16 v28, 0x400

    move/from16 v0, v28

    new-array v3, v0, [B

    .line 817
    .local v3, buffer:[B
    :goto_4
    invoke-virtual {v13, v3}, Ljava/io/FileInputStream;->read([B)I

    move-result v19

    .local v19, length:I
    const/16 v28, -0x1

    move/from16 v0, v19

    move/from16 v1, v28

    if-eq v0, v1, :cond_9

    .line 818
    const/16 v28, 0x0

    move/from16 v0, v28

    move/from16 v1, v19

    invoke-virtual {v15, v3, v0, v1}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_4

    .line 807
    .end local v3           #buffer:[B
    .end local v11           #fi:Ljava/io/File;
    .end local v13           #fis:Ljava/io/FileInputStream;
    .end local v14           #fo:Ljava/io/File;
    .end local v15           #fos:Ljava/io/FileOutputStream;
    .end local v19           #length:I
    :catch_0
    move-exception v9

    .line 808
    .local v9, e:Ljava/lang/Exception;
    goto/16 :goto_3

    .line 820
    .end local v9           #e:Ljava/lang/Exception;
    .restart local v3       #buffer:[B
    .restart local v11       #fi:Ljava/io/File;
    .restart local v13       #fis:Ljava/io/FileInputStream;
    .restart local v14       #fo:Ljava/io/File;
    .restart local v15       #fos:Ljava/io/FileOutputStream;
    .restart local v19       #length:I
    :cond_9
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V

    .line 821
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V

    .line 822
    move-object/from16 v0, v22

    invoke-virtual {v0, v14}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 829
    .end local v3           #buffer:[B
    .end local v5           #classArray:[Ljava/lang/Class;
    .end local v6           #classList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/Class;>;"
    .end local v8           #directory:Ljava/io/File;
    .end local v10           #f:Ljava/io/File;
    .end local v11           #fi:Ljava/io/File;
    .end local v13           #fis:Ljava/io/FileInputStream;
    .end local v14           #fo:Ljava/io/File;
    .end local v15           #fos:Ljava/io/FileOutputStream;
    .end local v17           #i$:Ljava/util/Iterator;
    .end local v19           #length:I
    .end local v20           #libraryName:Ljava/lang/String;
    .end local v23           #p:Lcom/googlecode/javacpp/Loader$ClassProperties;
    .end local v24           #preloads:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    .end local v25           #s:Ljava/lang/String;
    .end local v27           #urls:[Ljava/net/URL;
    :cond_a
    invoke-virtual/range {v22 .. v22}, Ljava/util/LinkedList;->size()I

    move-result v28

    move/from16 v0, v28

    new-array v0, v0, [Ljava/io/File;

    move-object/from16 v28, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Ljava/io/File;

    .line 830
    .local v12, files:[Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->jarPrefix:Ljava/lang/String;

    move-object/from16 v28, v0

    if-eqz v28, :cond_0

    array-length v0, v12

    move/from16 v28, v0

    if-lez v28, :cond_0

    .line 831
    new-instance v18, Ljava/io/File;

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->jarPrefix:Ljava/lang/String;

    move-object/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "-"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    move-object/from16 v29, v0

    const-string v30, "platform.name"

    invoke-virtual/range {v29 .. v30}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, ".jar"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v18

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 832
    .local v18, jarFile:Ljava/io/File;
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    .line 833
    .local v7, d:Ljava/io/File;
    if-eqz v7, :cond_b

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v28

    if-nez v28, :cond_b

    .line 834
    invoke-virtual {v7}, Ljava/io/File;->mkdir()Z

    .line 836
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->outputDirectory:Ljava/io/File;

    move-object/from16 v28, v0

    if-nez v28, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/googlecode/javacpp/Builder$ClassScanner;->getClassLoader()Lcom/googlecode/javacpp/Builder$UserClassLoader;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Lcom/googlecode/javacpp/Builder$UserClassLoader;->getPaths()[Ljava/lang/String;

    move-result-object v28

    :goto_5
    move-object/from16 v0, v18

    move-object/from16 v1, v28

    invoke-static {v0, v1, v12}, Lcom/googlecode/javacpp/Builder;->createJar(Ljava/io/File;[Ljava/lang/String;[Ljava/io/File;)V

    goto/16 :goto_0

    :cond_c
    const/16 v28, 0x0

    goto :goto_5
.end method

.method public classPaths(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 1
    .parameter "classPaths"

    .prologue
    .line 634
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/googlecode/javacpp/Builder;->classPaths([Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    .line 635
    return-object p0

    .line 634
    :cond_0
    sget-object v0, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public varargs classPaths([Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 1
    .parameter "classPaths"

    .prologue
    .line 639
    iget-object v0, p0, Lcom/googlecode/javacpp/Builder;->classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

    invoke-virtual {v0}, Lcom/googlecode/javacpp/Builder$ClassScanner;->getClassLoader()Lcom/googlecode/javacpp/Builder$UserClassLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/googlecode/javacpp/Builder$UserClassLoader;->addPaths([Ljava/lang/String;)V

    .line 640
    return-object p0
.end method

.method public varargs classesOrPackages([Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 7
    .parameter "classesOrPackages"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 729
    if-nez p1, :cond_1

    .line 730
    iget-object v4, p0, Lcom/googlecode/javacpp/Builder;->classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lcom/googlecode/javacpp/Builder$ClassScanner;->addPackage(Ljava/lang/String;Z)V

    .line 734
    :cond_0
    return-object p0

    .line 731
    :cond_1
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 732
    .local v3, s:Ljava/lang/String;
    iget-object v4, p0, Lcom/googlecode/javacpp/Builder;->classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

    invoke-virtual {v4, v3}, Lcom/googlecode/javacpp/Builder$ClassScanner;->addClassOrPackage(Ljava/lang/String;)V

    .line 731
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public compile(Ljava/lang/String;Ljava/lang/String;Lcom/googlecode/javacpp/Loader$ClassProperties;)I
    .locals 22
    .parameter "sourceFilename"
    .parameter "outputFilename"
    .parameter "properties"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 191
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 193
    .local v4, command:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Builder;->header:Z

    move/from16 v19, v0

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-static {v0, v1}, Lcom/googlecode/javacpp/Builder;->includeJavaPaths(Lcom/googlecode/javacpp/Loader$ClassProperties;Z)V

    .line 195
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->getPlatformName()Ljava/lang/String;

    move-result-object v15

    .line 196
    .local v15, platformName:Ljava/lang/String;
    const-string v19, "compiler.path"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 197
    .local v5, compilerPath:Ljava/lang/String;
    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 200
    const-string v19, "compiler.sysroot.prefix"

    const-string v20, ""

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 201
    .local v12, p:Ljava/lang/String;
    const-string v19, "compiler.sysroot"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 202
    .local v16, s:Ljava/lang/String;
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->isDirectory()Z

    move-result v19

    if-eqz v19, :cond_0

    .line 203
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 204
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 206
    :cond_1
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 213
    .end local v16           #s:Ljava/lang/String;
    :cond_2
    const-string v19, "compiler.includepath.prefix"

    const-string v20, ""

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 214
    const-string v19, "compiler.includepath"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_3
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 215
    .restart local v16       #s:Ljava/lang/String;
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->isDirectory()Z

    move-result v19

    if-eqz v19, :cond_3

    .line 216
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 217
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 219
    :cond_4
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 225
    .end local v16           #s:Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 227
    const-string v19, "compiler.options"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v3

    .line 228
    .local v3, allOptions:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_6

    .line 229
    const-string v19, "default"

    move-object/from16 v0, v19

    invoke-interface {v3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 231
    :cond_6
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_7
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_9

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 232
    .restart local v16       #s:Ljava/lang/String;
    if-eqz v16, :cond_7

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v19

    if-eqz v19, :cond_7

    .line 235
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "compiler.options."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 236
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 237
    .local v10, options:Ljava/lang/String;
    if-eqz v10, :cond_8

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_8

    .line 238
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 239
    :cond_8
    const-string v19, "default"

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_7

    .line 240
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Warning: Could not get the property named \""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 244
    .end local v10           #options:Ljava/lang/String;
    .end local v16           #s:Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->compilerOptions:Ljava/util/Collection;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 246
    const-string v19, "compiler.output.prefix"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 247
    .local v11, outputPrefix:Ljava/lang/String;
    if-eqz v11, :cond_a

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_a

    .line 248
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 251
    :cond_a
    if-eqz v11, :cond_b

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v19

    if-eqz v19, :cond_b

    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_d

    .line 252
    :cond_b
    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 258
    :goto_3
    const-string v19, "compiler.linkpath.prefix"

    const-string v20, ""

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 259
    const-string v19, "compiler.linkpath.prefix2"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 260
    .local v13, p2:Ljava/lang/String;
    const-string v19, "compiler.linkpath"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_c
    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_10

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 261
    .restart local v16       #s:Ljava/lang/String;
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->isDirectory()Z

    move-result v19

    if-eqz v19, :cond_c

    .line 262
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_e

    .line 263
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 267
    :goto_5
    if-eqz v13, :cond_c

    .line 268
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_f

    .line 269
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 254
    .end local v13           #p2:Ljava/lang/String;
    .end local v16           #s:Ljava/lang/String;
    :cond_d
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 265
    .restart local v13       #p2:Ljava/lang/String;
    .restart local v16       #s:Ljava/lang/String;
    :cond_e
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 271
    :cond_f
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 279
    .end local v16           #s:Ljava/lang/String;
    :cond_10
    const-string v19, "compiler.link.prefix"

    const-string v20, ""

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 280
    const-string v19, "compiler.link.suffix"

    const-string v20, ""

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 281
    .local v18, x:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v7

    .line 282
    .local v7, i:I
    const-string v19, "compiler.link"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_15

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 283
    .restart local v16       #s:Ljava/lang/String;
    const-string v19, "@"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 284
    .local v9, libnameversion:[Ljava/lang/String;
    array-length v0, v9

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_11

    const/16 v19, 0x1

    aget-object v19, v9, v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    if-nez v19, :cond_11

    .line 286
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v20, 0x0

    aget-object v20, v9, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x2

    aget-object v20, v9, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 290
    :goto_7
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_12

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_12

    .line 291
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v7, v0}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    add-int/lit8 v19, v7, 0x1

    move/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v4, v0, v1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    add-int/lit8 v19, v7, 0x2

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    goto :goto_6

    .line 288
    :cond_11
    const/16 v19, 0x0

    aget-object v16, v9, v19

    goto :goto_7

    .line 292
    :cond_12
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_13

    .line 293
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v7, v0}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    add-int/lit8 v19, v7, 0x1

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    goto/16 :goto_6

    .line 294
    :cond_13
    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_14

    .line 295
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v7, v0}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    add-int/lit8 v19, v7, 0x1

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    goto/16 :goto_6

    .line 297
    :cond_14
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v7, v0}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    goto/16 :goto_6

    .line 303
    .end local v9           #libnameversion:[Ljava/lang/String;
    .end local v16           #s:Ljava/lang/String;
    :cond_15
    const-string v19, "compiler.framework.prefix"

    const-string v20, ""

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 304
    const-string v19, "compiler.framework.suffix"

    const-string v20, ""

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 305
    const-string v19, "compiler.framework"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_19

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 306
    .restart local v16       #s:Ljava/lang/String;
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_16

    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_16

    .line 307
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 308
    :cond_16
    const-string v19, " "

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_17

    .line 309
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 310
    :cond_17
    const-string v19, " "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_18

    .line 311
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_8

    .line 313
    :cond_18
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_8

    .line 318
    .end local v16           #s:Ljava/lang/String;
    :cond_19
    const-string v19, "windows"

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    .line 319
    .local v17, windows:Z
    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_9
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_1f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 320
    .restart local v16       #s:Ljava/lang/String;
    const-string v19, " "

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v19

    if-lez v19, :cond_1c

    const/4 v6, 0x1

    .line 321
    .local v6, hasSpaces:Z
    :goto_a
    if-eqz v6, :cond_1a

    .line 322
    sget-object v20, Ljava/lang/System;->out:Ljava/io/PrintStream;

    if-eqz v17, :cond_1d

    const-string v19, "\""

    :goto_b
    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 324
    :cond_1a
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 325
    if-eqz v6, :cond_1b

    .line 326
    sget-object v20, Ljava/lang/System;->out:Ljava/io/PrintStream;

    if-eqz v17, :cond_1e

    const-string v19, "\""

    :goto_c
    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 328
    :cond_1b
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_9

    .line 320
    .end local v6           #hasSpaces:Z
    :cond_1c
    const/4 v6, 0x0

    goto :goto_a

    .line 322
    .restart local v6       #hasSpaces:Z
    :cond_1d
    const-string v19, "\'"

    goto :goto_b

    .line 326
    :cond_1e
    const-string v19, "\'"

    goto :goto_c

    .line 330
    .end local v6           #hasSpaces:Z
    .end local v16           #s:Ljava/lang/String;
    :cond_1f
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual/range {v19 .. v19}, Ljava/io/PrintStream;->println()V

    .line 332
    new-instance v14, Ljava/lang/ProcessBuilder;

    invoke-direct {v14, v4}, Ljava/lang/ProcessBuilder;-><init>(Ljava/util/List;)V

    .line 333
    .local v14, pb:Ljava/lang/ProcessBuilder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->environmentVariables:Ljava/util/Map;

    move-object/from16 v19, v0

    if-eqz v19, :cond_20

    .line 334
    invoke-virtual {v14}, Ljava/lang/ProcessBuilder;->environment()Ljava/util/Map;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->environmentVariables:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-interface/range {v19 .. v20}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 336
    :cond_20
    invoke-virtual {v14}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v12

    .line 337
    .local v12, p:Ljava/lang/Process;
    new-instance v19, Lcom/googlecode/javacpp/Builder$Piper;

    invoke-virtual {v12}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v20

    sget-object v21, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-direct/range {v19 .. v21}, Lcom/googlecode/javacpp/Builder$Piper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual/range {v19 .. v19}, Lcom/googlecode/javacpp/Builder$Piper;->start()V

    .line 338
    new-instance v19, Lcom/googlecode/javacpp/Builder$Piper;

    invoke-virtual {v12}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v20

    sget-object v21, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct/range {v19 .. v21}, Lcom/googlecode/javacpp/Builder$Piper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual/range {v19 .. v19}, Lcom/googlecode/javacpp/Builder$Piper;->start()V

    .line 339
    invoke-virtual {v12}, Ljava/lang/Process;->waitFor()I

    move-result v19

    return v19
.end method

.method public compile(Z)Lcom/googlecode/javacpp/Builder;
    .locals 0
    .parameter "compile"

    .prologue
    .line 654
    iput-boolean p1, p0, Lcom/googlecode/javacpp/Builder;->compile:Z

    .line 655
    return-object p0
.end method

.method public varargs compilerOptions([Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 2
    .parameter "options"

    .prologue
    .line 743
    if-eqz p1, :cond_0

    .line 744
    iget-object v0, p0, Lcom/googlecode/javacpp/Builder;->compilerOptions:Ljava/util/Collection;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 746
    :cond_0
    return-object p0
.end method

.method public copyLibs(Z)Lcom/googlecode/javacpp/Builder;
    .locals 0
    .parameter "copyLibs"

    .prologue
    .line 664
    iput-boolean p1, p0, Lcom/googlecode/javacpp/Builder;->copyLibs:Z

    .line 665
    return-object p0
.end method

.method public environmentVariables(Ljava/util/Map;)Lcom/googlecode/javacpp/Builder;
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/googlecode/javacpp/Builder;"
        }
    .end annotation

    .prologue
    .line 738
    .local p1, environmentVariables:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/googlecode/javacpp/Builder;->environmentVariables:Ljava/util/Map;

    .line 739
    return-object p0
.end method

.method public generateAndCompile([Ljava/lang/Class;Ljava/lang/String;)Ljava/io/File;
    .locals 28
    .parameter "classes"
    .parameter "outputName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 353
    const/4 v13, 0x0

    .line 354
    .local v13, outputFile:Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    move-object/from16 v23, v0

    const/16 v24, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/googlecode/javacpp/Loader;->loadProperties([Ljava/lang/Class;Ljava/util/Properties;Z)Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-result-object v15

    .line 355
    .local v15, p:Lcom/googlecode/javacpp/Loader$ClassProperties;
    const-string v23, "platform.name"

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 356
    .local v17, platformName:Ljava/lang/String;
    const-string v23, "source.suffix"

    const-string v24, ".cpp"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v15, v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 357
    .local v22, sourceSuffix:Ljava/lang/String;
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "library.prefix"

    const-string v25, ""

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v15, v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "library.suffix"

    const-string v25, ""

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v15, v0, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 359
    .local v12, libraryName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->outputDirectory:Ljava/io/File;

    move-object/from16 v23, v0

    if-nez v23, :cond_1

    .line 361
    const/16 v23, 0x0

    :try_start_0
    aget-object v23, p1, v23

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v25, 0x2f

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v24

    const/16 v25, 0x0

    aget-object v25, p1, v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    const/16 v26, 0x2e

    const/16 v27, 0x2f

    invoke-virtual/range {v25 .. v27}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, ".class"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v18

    .line 362
    .local v18, resourceURL:Ljava/net/URL;
    new-instance v23, Ljava/io/File;

    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v16

    .line 363
    .local v16, packageDir:Ljava/io/File;
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v14, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 364
    .local v14, outputPath:Ljava/io/File;
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    sget-object v24, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v21

    .line 372
    .end local v16           #packageDir:Ljava/io/File;
    .end local v18           #resourceURL:Ljava/net/URL;
    .local v21, sourcePrefix:Ljava/lang/String;
    :goto_0
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v23

    if-nez v23, :cond_0

    .line 373
    invoke-virtual {v14}, Ljava/io/File;->mkdirs()Z

    .line 375
    :cond_0
    new-instance v7, Lcom/googlecode/javacpp/Generator;

    invoke-direct {v7, v15}, Lcom/googlecode/javacpp/Generator;-><init>(Lcom/googlecode/javacpp/Loader$ClassProperties;)V

    .line 376
    .local v7, generator:Lcom/googlecode/javacpp/Generator;
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 377
    .local v20, sourceFilename:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Builder;->header:Z

    move/from16 v23, v0

    if-eqz v23, :cond_2

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ".h"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 378
    .local v8, headerFilename:Ljava/lang/String;
    :goto_1
    const-string v23, "java.class.path"

    invoke-static/range {v23 .. v23}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 379
    .local v4, classPath:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Builder;->classScanner:Lcom/googlecode/javacpp/Builder$ClassScanner;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/googlecode/javacpp/Builder$ClassScanner;->getClassLoader()Lcom/googlecode/javacpp/Builder$UserClassLoader;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/googlecode/javacpp/Builder$UserClassLoader;->getPaths()[Ljava/lang/String;

    move-result-object v3

    .local v3, arr$:[Ljava/lang/String;
    array-length v10, v3

    .local v10, len$:I
    const/4 v9, 0x0

    .local v9, i$:I
    :goto_2
    if-ge v9, v10, :cond_3

    aget-object v19, v3, v9

    .line 380
    .local v19, s:Ljava/lang/String;
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    sget-object v24, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 379
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 365
    .end local v3           #arr$:[Ljava/lang/String;
    .end local v4           #classPath:Ljava/lang/String;
    .end local v7           #generator:Lcom/googlecode/javacpp/Generator;
    .end local v8           #headerFilename:Ljava/lang/String;
    .end local v9           #i$:I
    .end local v10           #len$:I
    .end local v14           #outputPath:Ljava/io/File;
    .end local v19           #s:Ljava/lang/String;
    .end local v20           #sourceFilename:Ljava/lang/String;
    .end local v21           #sourcePrefix:Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 366
    .local v5, e:Ljava/net/URISyntaxException;
    new-instance v23, Ljava/lang/RuntimeException;

    move-object/from16 v0, v23

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v23

    .line 369
    .end local v5           #e:Ljava/net/URISyntaxException;
    :cond_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Builder;->outputDirectory:Ljava/io/File;

    .line 370
    .restart local v14       #outputPath:Ljava/io/File;
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    sget-object v24, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .restart local v21       #sourcePrefix:Ljava/lang/String;
    goto/16 :goto_0

    .line 377
    .restart local v7       #generator:Lcom/googlecode/javacpp/Generator;
    .restart local v20       #sourceFilename:Ljava/lang/String;
    :cond_2
    const/4 v8, 0x0

    goto :goto_1

    .line 382
    .restart local v3       #arr$:[Ljava/lang/String;
    .restart local v4       #classPath:Ljava/lang/String;
    .restart local v8       #headerFilename:Ljava/lang/String;
    .restart local v9       #i$:I
    .restart local v10       #len$:I
    :cond_3
    sget-object v23, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Generating source file: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 383
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v7, v0, v8, v4, v1}, Lcom/googlecode/javacpp/Generator;->generate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Z

    move-result v23

    if-eqz v23, :cond_6

    .line 384
    invoke-virtual {v7}, Lcom/googlecode/javacpp/Generator;->close()V

    .line 385
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Builder;->compile:Z

    move/from16 v23, v0

    if-eqz v23, :cond_5

    .line 386
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    sget-object v24, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 387
    .local v11, libraryFilename:Ljava/lang/String;
    sget-object v23, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Compiling library file: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 388
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v11, v15}, Lcom/googlecode/javacpp/Builder;->compile(Ljava/lang/String;Ljava/lang/String;Lcom/googlecode/javacpp/Loader$ClassProperties;)I

    move-result v6

    .line 389
    .local v6, exitValue:I
    if-nez v6, :cond_4

    .line 390
    new-instance v23, Ljava/io/File;

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    .line 391
    new-instance v13, Ljava/io/File;

    .end local v13           #outputFile:Ljava/io/File;
    invoke-direct {v13, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 401
    .end local v6           #exitValue:I
    .end local v11           #libraryFilename:Ljava/lang/String;
    .restart local v13       #outputFile:Ljava/io/File;
    :goto_3
    return-object v13

    .line 393
    .restart local v6       #exitValue:I
    .restart local v11       #libraryFilename:Ljava/lang/String;
    :cond_4
    invoke-static {v6}, Ljava/lang/System;->exit(I)V

    goto :goto_3

    .line 396
    .end local v6           #exitValue:I
    .end local v11           #libraryFilename:Ljava/lang/String;
    :cond_5
    new-instance v13, Ljava/io/File;

    .end local v13           #outputFile:Ljava/io/File;
    move-object/from16 v0, v20

    invoke-direct {v13, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v13       #outputFile:Ljava/io/File;
    goto :goto_3

    .line 399
    :cond_6
    sget-object v23, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Source file not generated: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_3
.end method

.method public header(Z)Lcom/googlecode/javacpp/Builder;
    .locals 0
    .parameter "header"

    .prologue
    .line 659
    iput-boolean p1, p0, Lcom/googlecode/javacpp/Builder;->header:Z

    .line 660
    return-object p0
.end method

.method public jarPrefix(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 0
    .parameter "jarPrefix"

    .prologue
    .line 674
    iput-object p1, p0, Lcom/googlecode/javacpp/Builder;->jarPrefix:Ljava/lang/String;

    .line 675
    return-object p0
.end method

.method public outputDirectory(Ljava/io/File;)Lcom/googlecode/javacpp/Builder;
    .locals 0
    .parameter "outputDirectory"

    .prologue
    .line 649
    iput-object p1, p0, Lcom/googlecode/javacpp/Builder;->outputDirectory:Ljava/io/File;

    .line 650
    return-object p0
.end method

.method public outputDirectory(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 1
    .parameter "outputDirectory"

    .prologue
    .line 644
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/googlecode/javacpp/Builder;->outputDirectory(Ljava/io/File;)Lcom/googlecode/javacpp/Builder;

    .line 645
    return-object p0

    .line 644
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public outputName(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 0
    .parameter "outputName"

    .prologue
    .line 669
    iput-object p1, p0, Lcom/googlecode/javacpp/Builder;->outputName:Ljava/lang/String;

    .line 670
    return-object p0
.end method

.method public parse(Ljava/lang/Class;)Ljava/io/File;
    .locals 4
    .parameter "cls"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Lcom/googlecode/javacpp/Parser$InfoMap;

    invoke-direct {v0}, Lcom/googlecode/javacpp/Parser$InfoMap;-><init>()V

    .line 68
    .local v0, infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .line 69
    .local v1, obj:Ljava/lang/Object;
    instance-of v2, v1, Lcom/googlecode/javacpp/Parser$InfoMapper;

    if-eqz v2, :cond_0

    .line 70
    check-cast v1, Lcom/googlecode/javacpp/Parser$InfoMapper;

    .end local v1           #obj:Ljava/lang/Object;
    invoke-interface {v1, v0}, Lcom/googlecode/javacpp/Parser$InfoMapper;->map(Lcom/googlecode/javacpp/Parser$InfoMap;)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :cond_0
    :goto_0
    new-instance v2, Lcom/googlecode/javacpp/Parser;

    iget-object v3, p0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    invoke-direct {v2, v3, v0}, Lcom/googlecode/javacpp/Parser;-><init>(Ljava/util/Properties;Lcom/googlecode/javacpp/Parser$InfoMap;)V

    iget-object v3, p0, Lcom/googlecode/javacpp/Builder;->outputDirectory:Ljava/io/File;

    invoke-virtual {v2, v3, p1}, Lcom/googlecode/javacpp/Parser;->parse(Ljava/io/File;Ljava/lang/Class;)Ljava/io/File;

    move-result-object v2

    return-object v2

    .line 73
    :catch_0
    move-exception v2

    goto :goto_0

    .line 72
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method public properties(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 1
    .parameter "platformName"

    .prologue
    .line 679
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/googlecode/javacpp/Builder;->properties(Ljava/util/Properties;)Lcom/googlecode/javacpp/Builder;

    .line 680
    return-object p0

    .line 679
    :cond_0
    invoke-static {p1}, Lcom/googlecode/javacpp/Loader;->loadProperties(Ljava/lang/String;)Ljava/util/Properties;

    move-result-object v0

    goto :goto_0
.end method

.method public properties(Ljava/util/Properties;)Lcom/googlecode/javacpp/Builder;
    .locals 1
    .parameter "properties"

    .prologue
    .line 684
    if-eqz p1, :cond_0

    .line 685
    iget-object v0, p0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->putAll(Ljava/util/Map;)V

    .line 687
    :cond_0
    return-object p0
.end method

.method public property(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 3
    .parameter "keyValue"

    .prologue
    .line 711
    const/16 v1, 0x3d

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 712
    .local v0, equalIndex:I
    if-gez v0, :cond_0

    .line 713
    const/16 v1, 0x3a

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 715
    :cond_0
    const/4 v1, 0x2

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/googlecode/javacpp/Builder;->property(Ljava/lang/String;Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;

    .line 717
    return-object p0
.end method

.method public property(Ljava/lang/String;Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 1
    .parameter "key"
    .parameter "value"

    .prologue
    .line 721
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 722
    iget-object v0, p0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    invoke-virtual {v0, p1, p2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    :cond_0
    return-object p0
.end method

.method public propertyFile(Ljava/io/File;)Lcom/googlecode/javacpp/Builder;
    .locals 4
    .parameter "propertyFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 696
    if-nez p1, :cond_0

    .line 707
    :goto_0
    return-object p0

    .line 699
    :cond_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 700
    .local v1, fis:Ljava/io/FileInputStream;
    new-instance v2, Ljava/util/Properties;

    iget-object v3, p0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    invoke-direct {v2, v3}, Ljava/util/Properties;-><init>(Ljava/util/Properties;)V

    iput-object v2, p0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    .line 702
    :try_start_0
    iget-object v2, p0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v2, v3}, Ljava/util/Properties;->load(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 706
    :goto_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    goto :goto_0

    .line 703
    :catch_0
    move-exception v0

    .line 704
    .local v0, e:Ljava/lang/NoSuchMethodError;
    iget-object v2, p0, Lcom/googlecode/javacpp/Builder;->properties:Ljava/util/Properties;

    invoke-virtual {v2, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    goto :goto_1
.end method

.method public propertyFile(Ljava/lang/String;)Lcom/googlecode/javacpp/Builder;
    .locals 1
    .parameter "filename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 691
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/googlecode/javacpp/Builder;->propertyFile(Ljava/io/File;)Lcom/googlecode/javacpp/Builder;

    .line 692
    return-object p0

    .line 691
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method
