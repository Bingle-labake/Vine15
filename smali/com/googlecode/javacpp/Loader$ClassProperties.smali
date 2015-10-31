.class public Lcom/googlecode/javacpp/Loader$ClassProperties;
.super Ljava/util/HashMap;
.source "Loader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacpp/Loader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ClassProperties"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/util/LinkedList",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field pathSeparator:Ljava/lang/String;

.field platformName:Ljava/lang/String;

.field platformRoot:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 180
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/Properties;)V
    .locals 6
    .parameter "properties"

    .prologue
    .line 181
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 182
    const-string v4, "platform.name"

    invoke-virtual {p1, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformName:Ljava/lang/String;

    .line 183
    const-string v4, "platform.root"

    invoke-virtual {p1, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformRoot:Ljava/lang/String;

    .line 184
    const-string v4, "path.separator"

    invoke-virtual {p1, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->pathSeparator:Ljava/lang/String;

    .line 185
    iget-object v4, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformRoot:Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformRoot:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 186
    :cond_0
    const-string v4, "."

    iput-object v4, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformRoot:Ljava/lang/String;

    .line 188
    :cond_1
    iget-object v4, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformRoot:Ljava/lang/String;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 189
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformRoot:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformRoot:Ljava/lang/String;

    .line 191
    :cond_2
    invoke-virtual {p1}, Ljava/util/Properties;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 192
    .local v0, e:Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .local v2, k:Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 193
    .local v3, v:Ljava/lang/String;
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_3

    .line 196
    const-string v4, "compiler.includepath"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v4, "compiler.include"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v4, "compiler.linkpath"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v4, "compiler.link"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v4, "compiler.framework"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 199
    :cond_4
    iget-object v4, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->pathSeparator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2, v4}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 201
    :cond_5
    invoke-virtual {p0, v2, v3}, Lcom/googlecode/javacpp/Loader$ClassProperties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 204
    .end local v0           #e:Ljava/util/Map$Entry;
    .end local v2           #k:Ljava/lang/String;
    .end local v3           #v:Ljava/lang/String;
    :cond_6
    return-void
.end method


# virtual methods
.method public addAll(Ljava/lang/String;Ljava/util/Collection;)V
    .locals 6
    .parameter "key"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 222
    .local p2, values:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz p2, :cond_4

    .line 223
    const/4 v1, 0x0

    .line 224
    .local v1, root:Ljava/lang/String;
    const-string v4, "compiler.path"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "compiler.sysroot"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "compiler.includepath"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "compiler.linkpath"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 226
    :cond_0
    iget-object v1, p0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformRoot:Ljava/lang/String;

    .line 229
    :cond_1
    invoke-virtual {p0, p1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v3

    .line 230
    .local v3, values2:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 231
    .local v2, value:Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 232
    if-eqz v1, :cond_3

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->isAbsolute()Z

    move-result v4

    if-nez v4, :cond_3

    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 234
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 236
    :cond_3
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 240
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #root:Ljava/lang/String;
    .end local v2           #value:Ljava/lang/String;
    .end local v3           #values2:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_4
    return-void
.end method

.method public varargs addAll(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1
    .parameter "key"
    .parameter "values"

    .prologue
    .line 217
    if-eqz p2, :cond_0

    .line 218
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;Ljava/util/Collection;)V

    .line 220
    :cond_0
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/util/LinkedList;
    .locals 1
    .parameter "key"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 209
    invoke-super {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    .line 210
    .local v0, list:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 211
    new-instance v0, Ljava/util/LinkedList;

    .end local v0           #list:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .restart local v0       #list:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javacpp/Loader$ClassProperties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    :cond_0
    return-object v0
.end method

.method getHeaderFiles()Ljava/util/LinkedList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 332
    const-string v8, "compiler.includepath"

    invoke-virtual {p0, v8}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v7

    .line 333
    .local v7, paths:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    .line 334
    .local v5, includes:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const-string v8, "generator.include"

    invoke-virtual {p0, v8}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 335
    const-string v8, "generator.cinclude"

    invoke-virtual {p0, v8}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 336
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 337
    .local v1, files:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/io/File;>;"
    invoke-virtual {v5}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 338
    .local v4, include:Ljava/lang/String;
    const-string v8, "<"

    invoke-virtual {v4, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    const-string v8, ">"

    invoke-virtual {v4, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 339
    const/4 v8, 0x1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 347
    :cond_1
    invoke-virtual {v7}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 348
    .local v6, path:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    .local v0, f:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 350
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 341
    .end local v0           #f:Ljava/io/File;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v6           #path:Ljava/lang/String;
    :cond_3
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 342
    .restart local v0       #f:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 343
    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 355
    .end local v0           #f:Ljava/io/File;
    .end local v4           #include:Ljava/lang/String;
    :cond_4
    return-object v1
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "key"

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "key"
    .parameter "defaultValue"

    .prologue
    .line 246
    invoke-virtual {p0, p1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v0

    .line 247
    .local v0, values:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .end local p2
    :goto_0
    return-object p2

    .restart local p2
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object p2, v1

    goto :goto_0
.end method

.method public load(Ljava/lang/Class;Z)V
    .locals 35
    .parameter "cls"
    .parameter "inherit"

    .prologue
    .line 258
    invoke-static/range {p1 .. p1}, Lcom/googlecode/javacpp/Loader;->getEnclosingClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v5

    .line 260
    .local v5, c:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :goto_0
    const-class v32, Lcom/googlecode/javacpp/annotation/Properties;

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v32

    if-nez v32, :cond_0

    const-class v32, Lcom/googlecode/javacpp/annotation/Platform;

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v32

    if-nez v32, :cond_0

    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v32

    if-eqz v32, :cond_0

    .line 261
    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    goto :goto_0

    .line 263
    :cond_0
    const-class v32, Lcom/googlecode/javacpp/annotation/Properties;

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v8

    check-cast v8, Lcom/googlecode/javacpp/annotation/Properties;

    .line 266
    .local v8, classProperties:Lcom/googlecode/javacpp/annotation/Properties;
    if-nez v8, :cond_4

    .line 267
    const-class v32, Lcom/googlecode/javacpp/annotation/Platform;

    move-object/from16 v0, v32

    invoke-virtual {v5, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v26

    check-cast v26, Lcom/googlecode/javacpp/annotation/Platform;

    .line 268
    .local v26, platform:Lcom/googlecode/javacpp/annotation/Platform;
    if-nez v26, :cond_1

    .line 329
    .end local v26           #platform:Lcom/googlecode/javacpp/annotation/Platform;
    :goto_1
    return-void

    .line 271
    .restart local v26       #platform:Lcom/googlecode/javacpp/annotation/Platform;
    :cond_1
    const/16 v32, 0x1

    move/from16 v0, v32

    new-array v0, v0, [Lcom/googlecode/javacpp/annotation/Platform;

    move-object/from16 v27, v0

    const/16 v32, 0x0

    aput-object v26, v27, v32

    .line 290
    .end local v26           #platform:Lcom/googlecode/javacpp/annotation/Platform;
    .local v27, platforms:[Lcom/googlecode/javacpp/annotation/Platform;
    :cond_2
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v10, v0, [Ljava/lang/String;

    .local v10, define:[Ljava/lang/String;
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v15, v0, [Ljava/lang/String;

    .local v15, include:[Ljava/lang/String;
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v7, v0, [Ljava/lang/String;

    .local v7, cinclude:[Ljava/lang/String;
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    .local v16, includepath:[Ljava/lang/String;
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    .line 291
    .local v24, options:[Ljava/lang/String;
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    .local v21, linkpath:[Ljava/lang/String;
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    .local v20, link:[Ljava/lang/String;
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v11, v0, [Ljava/lang/String;

    .local v11, framework:[Ljava/lang/String;
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v29, v0

    .local v29, preloadpath:[Ljava/lang/String;
    const/16 v32, 0x0

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v28, v0

    .line 292
    .local v28, preload:[Ljava/lang/String;
    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "jni"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 293
    .local v19, library:Ljava/lang/String;
    move-object/from16 v3, v27

    .local v3, arr$:[Lcom/googlecode/javacpp/annotation/Platform;
    array-length v0, v3

    move/from16 v17, v0

    .local v17, len$:I
    const/4 v13, 0x0

    .local v13, i$:I
    move v14, v13

    .end local v3           #arr$:[Lcom/googlecode/javacpp/annotation/Platform;
    .end local v13           #i$:I
    .end local v17           #len$:I
    .local v14, i$:I
    :goto_2
    move/from16 v0, v17

    if-ge v14, v0, :cond_16

    aget-object v25, v3, v14

    .line 294
    .local v25, p:Lcom/googlecode/javacpp/annotation/Platform;
    const/16 v32, 0x2

    move/from16 v0, v32

    new-array v0, v0, [[Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v32, 0x0

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->value()[Ljava/lang/String;

    move-result-object v33

    aput-object v33, v23, v32

    const/16 v32, 0x1

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->not()[Ljava/lang/String;

    move-result-object v33

    aput-object v33, v23, v32

    .line 295
    .local v23, names:[[Ljava/lang/String;
    const/16 v32, 0x2

    move/from16 v0, v32

    new-array v0, v0, [Z

    move-object/from16 v22, v0

    fill-array-data v22, :array_0

    .line 296
    .local v22, matches:[Z
    const/4 v12, 0x0

    .end local v14           #i$:I
    .local v12, i:I
    :goto_3
    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v32, v0

    move/from16 v0, v32

    if-ge v12, v0, :cond_8

    .line 297
    aget-object v4, v23, v12

    .local v4, arr$:[Ljava/lang/String;
    array-length v0, v4

    move/from16 v18, v0

    .local v18, len$:I
    const/4 v13, 0x0

    .restart local v13       #i$:I
    :goto_4
    move/from16 v0, v18

    if-ge v13, v0, :cond_3

    aget-object v30, v4, v13

    .line 298
    .local v30, s:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Loader$ClassProperties;->platformName:Ljava/lang/String;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v32

    if-eqz v32, :cond_7

    .line 299
    const/16 v32, 0x1

    aput-boolean v32, v22, v12

    .line 296
    .end local v30           #s:Ljava/lang/String;
    :cond_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 274
    .end local v4           #arr$:[Ljava/lang/String;
    .end local v7           #cinclude:[Ljava/lang/String;
    .end local v10           #define:[Ljava/lang/String;
    .end local v11           #framework:[Ljava/lang/String;
    .end local v12           #i:I
    .end local v13           #i$:I
    .end local v15           #include:[Ljava/lang/String;
    .end local v16           #includepath:[Ljava/lang/String;
    .end local v18           #len$:I
    .end local v19           #library:Ljava/lang/String;
    .end local v20           #link:[Ljava/lang/String;
    .end local v21           #linkpath:[Ljava/lang/String;
    .end local v22           #matches:[Z
    .end local v23           #names:[[Ljava/lang/String;
    .end local v24           #options:[Ljava/lang/String;
    .end local v25           #p:Lcom/googlecode/javacpp/annotation/Platform;
    .end local v27           #platforms:[Lcom/googlecode/javacpp/annotation/Platform;
    .end local v28           #preload:[Ljava/lang/String;
    .end local v29           #preloadpath:[Ljava/lang/String;
    :cond_4
    invoke-interface {v8}, Lcom/googlecode/javacpp/annotation/Properties;->inherit()[Ljava/lang/Class;

    move-result-object v9

    .line 275
    .local v9, classes:[Ljava/lang/Class;
    if-eqz p2, :cond_5

    if-eqz v9, :cond_5

    .line 276
    move-object v3, v9

    .local v3, arr$:[Ljava/lang/Class;
    array-length v0, v3

    move/from16 v17, v0

    .restart local v17       #len$:I
    const/4 v13, 0x0

    .restart local v13       #i$:I
    :goto_5
    move/from16 v0, v17

    if-ge v13, v0, :cond_5

    aget-object v6, v3, v13

    .line 277
    .local v6, c2:Ljava/lang/Class;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v6, v1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->load(Ljava/lang/Class;Z)V

    .line 276
    add-int/lit8 v13, v13, 0x1

    goto :goto_5

    .line 280
    .end local v3           #arr$:[Ljava/lang/Class;
    .end local v6           #c2:Ljava/lang/Class;
    .end local v13           #i$:I
    .end local v17           #len$:I
    :cond_5
    invoke-interface {v8}, Lcom/googlecode/javacpp/annotation/Properties;->target()Ljava/lang/String;

    move-result-object v31

    .line 281
    .local v31, target:Ljava/lang/String;
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v32

    if-lez v32, :cond_6

    .line 282
    const-string v32, "parser.target"

    const/16 v33, 0x1

    move/from16 v0, v33

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    aput-object v31, v33, v34

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 284
    :cond_6
    invoke-interface {v8}, Lcom/googlecode/javacpp/annotation/Properties;->value()[Lcom/googlecode/javacpp/annotation/Platform;

    move-result-object v27

    .line 285
    .restart local v27       #platforms:[Lcom/googlecode/javacpp/annotation/Platform;
    if-nez v27, :cond_2

    goto/16 :goto_1

    .line 297
    .end local v9           #classes:[Ljava/lang/Class;
    .end local v31           #target:Ljava/lang/String;
    .restart local v4       #arr$:[Ljava/lang/String;
    .restart local v7       #cinclude:[Ljava/lang/String;
    .restart local v10       #define:[Ljava/lang/String;
    .restart local v11       #framework:[Ljava/lang/String;
    .restart local v12       #i:I
    .restart local v13       #i$:I
    .restart local v15       #include:[Ljava/lang/String;
    .restart local v16       #includepath:[Ljava/lang/String;
    .restart local v18       #len$:I
    .restart local v19       #library:Ljava/lang/String;
    .restart local v20       #link:[Ljava/lang/String;
    .restart local v21       #linkpath:[Ljava/lang/String;
    .restart local v22       #matches:[Z
    .restart local v23       #names:[[Ljava/lang/String;
    .restart local v24       #options:[Ljava/lang/String;
    .restart local v25       #p:Lcom/googlecode/javacpp/annotation/Platform;
    .restart local v28       #preload:[Ljava/lang/String;
    .restart local v29       #preloadpath:[Ljava/lang/String;
    .restart local v30       #s:Ljava/lang/String;
    :cond_7
    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    .line 304
    .end local v4           #arr$:[Ljava/lang/String;
    .end local v13           #i$:I
    .end local v18           #len$:I
    .end local v30           #s:Ljava/lang/String;
    :cond_8
    const/16 v32, 0x0

    aget-object v32, v23, v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-eqz v32, :cond_9

    const/16 v32, 0x0

    aget-boolean v32, v22, v32

    if-eqz v32, :cond_15

    :cond_9
    const/16 v32, 0x1

    aget-object v32, v23, v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-eqz v32, :cond_a

    const/16 v32, 0x1

    aget-boolean v32, v22, v32

    if-nez v32, :cond_15

    .line 305
    :cond_a
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->define()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_b

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->define()[Ljava/lang/String;

    move-result-object v10

    .line 306
    :cond_b
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->include()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_c

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->include()[Ljava/lang/String;

    move-result-object v15

    .line 307
    :cond_c
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->cinclude()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_d

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->cinclude()[Ljava/lang/String;

    move-result-object v7

    .line 308
    :cond_d
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->includepath()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_e

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->includepath()[Ljava/lang/String;

    move-result-object v16

    .line 309
    :cond_e
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->options()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_f

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->options()[Ljava/lang/String;

    move-result-object v24

    .line 310
    :cond_f
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->linkpath()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_10

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->linkpath()[Ljava/lang/String;

    move-result-object v21

    .line 311
    :cond_10
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->link()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_11

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->link()[Ljava/lang/String;

    move-result-object v20

    .line 312
    :cond_11
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->framework()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_12

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->framework()[Ljava/lang/String;

    move-result-object v11

    .line 313
    :cond_12
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->preloadpath()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_13

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->preloadpath()[Ljava/lang/String;

    move-result-object v29

    .line 314
    :cond_13
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->preload()[Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    if-lez v32, :cond_14

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->preload()[Ljava/lang/String;

    move-result-object v28

    .line 315
    :cond_14
    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->library()Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/String;->length()I

    move-result v32

    if-lez v32, :cond_15

    invoke-interface/range {v25 .. v25}, Lcom/googlecode/javacpp/annotation/Platform;->library()Ljava/lang/String;

    move-result-object v19

    .line 293
    :cond_15
    add-int/lit8 v13, v14, 0x1

    .restart local v13       #i$:I
    move v14, v13

    .end local v13           #i$:I
    .restart local v14       #i$:I
    goto/16 :goto_2

    .line 318
    .end local v12           #i:I
    .end local v22           #matches:[Z
    .end local v23           #names:[[Ljava/lang/String;
    .end local v25           #p:Lcom/googlecode/javacpp/annotation/Platform;
    :cond_16
    const-string v32, "generator.define"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v10}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 319
    const-string v32, "generator.include"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v15}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 320
    const-string v32, "generator.cinclude"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v7}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 321
    const-string v32, "compiler.includepath"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 322
    const-string v32, "compiler.options"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 323
    const-string v32, "compiler.linkpath"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 324
    const-string v32, "compiler.link"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 325
    const-string v32, "compiler.framework"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v11}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 326
    const-string v32, "loader.preloadpath"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 327
    const-string v32, "loader.preload"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 328
    const-string v32, "loader.library"

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_1

    .line 295
    nop

    :array_0
    .array-data 0x1
        0x0t
        0x0t
    .end array-data
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "key"
    .parameter "value"

    .prologue
    const/4 v3, 0x0

    .line 250
    invoke-virtual {p0, p1}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v1

    .line 251
    .local v1, values:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x0

    .line 252
    .local v0, oldValue:Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 253
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    aput-object p2, v2, v3

    invoke-virtual {p0, p1, v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->addAll(Ljava/lang/String;[Ljava/lang/String;)V

    .line 254
    return-object v0

    .line 251
    .end local v0           #oldValue:Ljava/lang/String;
    :cond_0
    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    move-object v0, v2

    goto :goto_0
.end method
