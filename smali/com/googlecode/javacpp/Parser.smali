.class public Lcom/googlecode/javacpp/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/googlecode/javacpp/Parser$Parameters;,
        Lcom/googlecode/javacpp/Parser$Declarator;,
        Lcom/googlecode/javacpp/Parser$TemplateMap;,
        Lcom/googlecode/javacpp/Parser$Tokenizer;,
        Lcom/googlecode/javacpp/Parser$Token;,
        Lcom/googlecode/javacpp/Parser$InfoMapper;,
        Lcom/googlecode/javacpp/Parser$InfoMap;,
        Lcom/googlecode/javacpp/Parser$Info;,
        Lcom/googlecode/javacpp/Parser$Exception;
    }
.end annotation


# instance fields
.field infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

.field properties:Ljava/util/Properties;

.field tokenArray:[Lcom/googlecode/javacpp/Parser$Token;

.field tokenIndex:I


# direct methods
.method public constructor <init>(Ljava/util/Properties;Lcom/googlecode/javacpp/Parser$InfoMap;)V
    .locals 1
    .parameter "properties"
    .parameter "infoMap"

    .prologue
    const/4 v0, 0x0

    .line 433
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 438
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser;->properties:Ljava/util/Properties;

    .line 439
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    .line 440
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser;->tokenArray:[Lcom/googlecode/javacpp/Parser$Token;

    .line 441
    const/4 v0, 0x0

    iput v0, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 434
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser;->properties:Ljava/util/Properties;

    .line 435
    iput-object p2, p0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    .line 436
    return-void
.end method


# virtual methods
.method attribute()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x28

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 767
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v4

    new-array v5, v3, [Ljava/lang/Object;

    const/4 v6, 0x5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {v4, v5}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 782
    :goto_0
    return v2

    .line 770
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v4

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {v4, v5}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    move v2, v3

    .line 771
    goto :goto_0

    .line 774
    :cond_1
    const/4 v0, 0x1

    .line 775
    .local v0, count:I
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    .local v1, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_1
    new-array v4, v3, [Ljava/lang/Object;

    sget-object v5, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v5, v4, v2

    invoke-virtual {v1, v4}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    if-lez v0, :cond_4

    .line 776
    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-virtual {v1, v4}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 777
    add-int/lit8 v0, v0, 0x1

    .line 775
    :cond_2
    :goto_2
    invoke-virtual {p0, v2}, Lcom/googlecode/javacpp/Parser;->nextToken(Z)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    goto :goto_1

    .line 778
    :cond_3
    new-array v4, v3, [Ljava/lang/Object;

    const/16 v5, 0x29

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-virtual {v1, v4}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 779
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :cond_4
    move v2, v3

    .line 782
    goto :goto_0
.end method

.method body()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x7b

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 786
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v4

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {v4, v5}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 798
    :goto_0
    return v2

    .line 790
    :cond_0
    const/4 v0, 0x1

    .line 791
    .local v0, count:I
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    .local v1, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_1
    new-array v4, v3, [Ljava/lang/Object;

    sget-object v5, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v5, v4, v2

    invoke-virtual {v1, v4}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    if-lez v0, :cond_3

    .line 792
    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-virtual {v1, v4}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 793
    add-int/lit8 v0, v0, 0x1

    .line 791
    :cond_1
    :goto_2
    invoke-virtual {p0, v2}, Lcom/googlecode/javacpp/Parser;->nextToken(Z)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    goto :goto_1

    .line 794
    :cond_2
    new-array v4, v3, [Ljava/lang/Object;

    const/16 v5, 0x7d

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-virtual {v1, v4}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 795
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :cond_3
    move v2, v3

    .line 798
    goto :goto_0
.end method

.method commentAfter()Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x1

    const/4 v7, 0x4

    const/4 v6, 0x0

    .line 748
    const-string v0, ""

    .line 749
    .local v0, comment:Ljava/lang/String;
    :goto_0
    iget v3, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    if-lez v3, :cond_0

    const/4 v3, -0x1

    invoke-virtual {p0, v3}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v3

    new-array v4, v8, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v3, v4}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 750
    iget v3, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    goto :goto_0

    .line 752
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    .local v1, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_1
    new-array v3, v8, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v3}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 753
    iget-object v3, v1, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v9, :cond_1

    iget-object v3, v1, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x3c

    if-ne v3, v4, :cond_1

    .line 754
    iget-object v2, v1, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 755
    .local v2, value:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    const-string v3, " * "

    :goto_2
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 752
    .end local v2           #value:Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v6}, Lcom/googlecode/javacpp/Parser;->nextToken(Z)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    goto :goto_1

    .line 755
    .restart local v2       #value:Ljava/lang/String;
    :cond_2
    const-string v3, "/**"

    goto :goto_2

    .line 758
    .end local v2           #value:Ljava/lang/String;
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4

    .line 759
    const-string v3, "*/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 760
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " */"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 763
    :cond_4
    return-object v0
.end method

.method commentBefore()Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 735
    const-string v0, ""

    .line 736
    .local v0, comment:Ljava/lang/String;
    :goto_0
    iget v2, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    if-lez v2, :cond_0

    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 737
    iget v2, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    goto :goto_0

    .line 739
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    .local v1, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_1
    new-array v2, v6, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 740
    iget-object v2, v1, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v7, :cond_1

    iget-object v2, v1, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3c

    if-eq v2, v3, :cond_2

    .line 741
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 739
    :cond_2
    invoke-virtual {p0, v5}, Lcom/googlecode/javacpp/Parser;->nextToken(Z)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    goto :goto_1

    .line 744
    :cond_3
    return-object v0
.end method

.method declaration(Ljava/lang/String;Lcom/googlecode/javacpp/Parser$TemplateMap;)Ljava/lang/String;
    .locals 8
    .parameter "group"
    .parameter "templateMap"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 1413
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->commentBefore()Ljava/lang/String;

    move-result-object v0

    .line 1414
    .local v0, comment:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v4

    .line 1415
    .local v4, token:Lcom/googlecode/javacpp/Parser$Token;
    iget-object v2, v4, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    .line 1416
    .local v2, spacing:Ljava/lang/String;
    invoke-virtual {p0, p2}, Lcom/googlecode/javacpp/Parser;->template(Lcom/googlecode/javacpp/Parser$TemplateMap;)Lcom/googlecode/javacpp/Parser$TemplateMap;

    move-result-object v1

    .line 1417
    .local v1, map:Lcom/googlecode/javacpp/Parser$TemplateMap;
    if-eq v1, p2, :cond_0

    .line 1418
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    const/16 v7, 0xa

    invoke-virtual {v2, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1420
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->macro()Ljava/lang/String;

    move-result-object v3

    .local v3, text:Ljava/lang/String;
    if-eqz v3, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1426
    :goto_0
    return-object v5

    .line 1421
    :cond_1
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->enumeration()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 1422
    :cond_2
    invoke-virtual {p0, v1}, Lcom/googlecode/javacpp/Parser;->group(Lcom/googlecode/javacpp/Parser$TemplateMap;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 1423
    :cond_3
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->typedef()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 1424
    :cond_4
    invoke-virtual {p0, p1, v1}, Lcom/googlecode/javacpp/Parser;->function(Ljava/lang/String;Lcom/googlecode/javacpp/Parser$TemplateMap;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 1425
    :cond_5
    invoke-virtual {p0, p1}, Lcom/googlecode/javacpp/Parser;->variable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_6

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 1426
    :cond_6
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->attribute()Z

    move-result v5

    if-eqz v5, :cond_7

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0

    .line 1427
    :cond_7
    new-instance v5, Lcom/googlecode/javacpp/Parser$Exception;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v4, Lcom/googlecode/javacpp/Parser$Token;->file:Ljava/io/File;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v4, Lcom/googlecode/javacpp/Parser$Token;->lineNumber:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": Could not parse declaration at \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/googlecode/javacpp/Parser$Exception;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method declarator(Lcom/googlecode/javacpp/Parser$TemplateMap;Ljava/lang/String;IIZZ)Lcom/googlecode/javacpp/Parser$Declarator;
    .locals 31
    .parameter "typeMap"
    .parameter "defaultName"
    .parameter "infoNumber"
    .parameter "varNumber"
    .parameter "arrayAsPointer"
    .parameter "pointerAsArray"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 505
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    sget-object v30, Lcom/googlecode/javacpp/Parser$Token;->TYPEDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v30, v28, v29

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v17

    .line 506
    .local v17, isTypedef:Z
    new-instance v8, Lcom/googlecode/javacpp/Parser$Declarator;

    invoke-direct {v8}, Lcom/googlecode/javacpp/Parser$Declarator;-><init>()V

    .line 507
    .local v8, decl:Lcom/googlecode/javacpp/Parser$Declarator;
    const-string v7, ""

    .line 508
    .local v7, cppName:Ljava/lang/String;
    const/16 v25, 0x0

    .line 509
    .local v25, simpleType:Z
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    .local v26, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_0
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_0

    .line 510
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x5

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_3

    .line 538
    :cond_0
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 539
    if-eqz p1, :cond_1

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Lcom/googlecode/javacpp/Parser$TemplateMap;->containsKey(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_1

    .line 540
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Lcom/googlecode/javacpp/Parser$TemplateMap;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 542
    :cond_1
    iput-object v7, v8, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    iput-object v7, v8, Lcom/googlecode/javacpp/Parser$Declarator;->cppType:Ljava/lang/String;

    .line 543
    const-string v27, "..."

    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v28

    move-object/from16 v0, v28

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_a

    .line 544
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 545
    const/4 v8, 0x0

    .line 731
    .end local v8           #decl:Lcom/googlecode/javacpp/Parser$Declarator;
    :cond_2
    :goto_1
    return-object v8

    .line 512
    .restart local v8       #decl:Lcom/googlecode/javacpp/Parser$Declarator;
    :cond_3
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->CONST:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_5

    .line 513
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->constValue:Z

    .line 509
    :cond_4
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    goto :goto_0

    .line 515
    :cond_5
    const/16 v27, 0x5

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->TYPEDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    const/16 v28, 0x1

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->ENUM:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    const/16 v28, 0x2

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->CLASS:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    const/16 v28, 0x3

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->STRUCT:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    const/16 v28, 0x4

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->UNION:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_4

    .line 517
    const/16 v27, 0x9

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const-string v29, "signed"

    aput-object v29, v27, v28

    const/16 v28, 0x1

    const-string v29, "unsigned"

    aput-object v29, v27, v28

    const/16 v28, 0x2

    const-string v29, "char"

    aput-object v29, v27, v28

    const/16 v28, 0x3

    const-string v29, "short"

    aput-object v29, v27, v28

    const/16 v28, 0x4

    const-string v29, "int"

    aput-object v29, v27, v28

    const/16 v28, 0x5

    const-string v29, "long"

    aput-object v29, v27, v28

    const/16 v28, 0x6

    const-string v29, "bool"

    aput-object v29, v27, v28

    const/16 v28, 0x7

    const-string v29, "float"

    aput-object v29, v27, v28

    const/16 v28, 0x8

    const-string v29, "double"

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_7

    .line 518
    if-nez v25, :cond_6

    .line 519
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 523
    :goto_3
    const/16 v25, 0x1

    goto/16 :goto_2

    .line 521
    :cond_6
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_3

    .line 524
    :cond_7
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v27

    if-lez v27, :cond_8

    const/16 v27, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    const/16 v28, 0x4

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x2a

    invoke-static/range {v30 .. v30}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v30

    aput-object v30, v28, v29

    const/16 v29, 0x1

    const/16 v30, 0x26

    invoke-static/range {v30 .. v30}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v30

    aput-object v30, v28, v29

    const/16 v29, 0x2

    const/16 v30, 0x5

    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v30

    aput-object v30, v28, v29

    const/16 v29, 0x3

    sget-object v30, Lcom/googlecode/javacpp/Parser$Token;->CONST:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v30, v28, v29

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_0

    .line 528
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    move-object/from16 v27, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v16

    .line 529
    .local v16, infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/LinkedList;->size()I

    move-result v27

    if-lez v27, :cond_9

    invoke-virtual/range {v16 .. v16}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/googlecode/javacpp/Parser$Info;

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Info;->annotations:[Ljava/lang/String;

    move-object/from16 v27, v0

    if-eqz v27, :cond_9

    .line 530
    invoke-virtual/range {v16 .. v16}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/googlecode/javacpp/Parser$Info;

    move-object/from16 v0, v27

    iget-object v3, v0, Lcom/googlecode/javacpp/Parser$Info;->annotations:[Ljava/lang/String;

    .local v3, arr$:[Ljava/lang/String;
    array-length v0, v3

    move/from16 v19, v0

    .local v19, len$:I
    const/4 v10, 0x0

    .local v10, i$:I
    :goto_4
    move/from16 v0, v19

    if-ge v10, v0, :cond_4

    aget-object v24, v3, v10

    .line 531
    .local v24, s:Ljava/lang/String;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    .line 530
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 534
    .end local v3           #arr$:[Ljava/lang/String;
    .end local v10           #i$:I
    .end local v19           #len$:I
    .end local v24           #s:Ljava/lang/String;
    :cond_9
    move-object/from16 v0, v26

    iget-object v7, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    goto/16 :goto_2

    .line 548
    .end local v16           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    :cond_a
    const/4 v6, 0x0

    .line 549
    .local v6, count:I
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    :goto_5
    if-lez p4, :cond_f

    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_f

    .line 550
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x28

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_c

    .line 551
    add-int/lit8 v6, v6, 0x1

    .line 549
    :cond_b
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    goto :goto_5

    .line 552
    :cond_c
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x29

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_d

    .line 553
    add-int/lit8 v6, v6, -0x1

    goto :goto_6

    .line 554
    :cond_d
    if-nez v6, :cond_b

    .line 556
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x2c

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_e

    .line 557
    add-int/lit8 p4, p4, -0x1

    goto :goto_6

    .line 558
    :cond_e
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x3b

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_b

    .line 559
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 560
    const/4 v8, 0x0

    goto/16 :goto_1

    .line 564
    :cond_f
    move-object v5, v7

    .line 565
    .local v5, cast:Ljava/lang/String;
    const/4 v12, 0x0

    .line 566
    .local v12, indirections:I
    const/16 v23, 0x0

    .line 567
    .local v23, reference:Z
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    :goto_7
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_12

    .line 568
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x2a

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_10

    .line 569
    add-int/lit8 v12, v12, 0x1

    .line 577
    :goto_8
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v26 .. v26}, Lcom/googlecode/javacpp/Parser$Token;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 567
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    goto :goto_7

    .line 570
    :cond_10
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x26

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_11

    .line 571
    const/16 v23, 0x1

    goto :goto_8

    .line 572
    :cond_11
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->CONST:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_12

    .line 573
    const/16 v27, 0x1

    move/from16 v0, v27

    iput-boolean v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->constPointer:Z

    goto :goto_8

    .line 580
    :cond_12
    const/4 v13, 0x0

    .line 581
    .local v13, indirections2:I
    move-object/from16 v0, p2

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    .line 582
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x28

    invoke-static/range {v30 .. v30}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v30

    aput-object v30, v28, v29

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_19

    .line 583
    :goto_9
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x28

    invoke-static/range {v30 .. v30}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v30

    aput-object v30, v28, v29

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_13

    .line 584
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    goto :goto_9

    .line 586
    :cond_13
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    :goto_a
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_18

    .line 587
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x5

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_15

    .line 588
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    .line 586
    :cond_14
    :goto_b
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    goto :goto_a

    .line 589
    :cond_15
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x2a

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_16

    .line 590
    add-int/lit8 v13, v13, 0x1

    .line 591
    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->convention:Ljava/lang/String;

    .line 592
    move-object/from16 v0, p2

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    goto :goto_b

    .line 593
    :cond_16
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x5b

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_17

    .line 594
    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, 0x1

    move/from16 v0, v27

    iput v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    goto :goto_b

    .line 595
    :cond_17
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x29

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_14

    .line 596
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 600
    :cond_18
    :goto_c
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x29

    invoke-static/range {v30 .. v30}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v30

    aput-object v30, v28, v29

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_1a

    .line 601
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    goto :goto_c

    .line 603
    :cond_19
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x5

    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v30

    aput-object v30, v28, v29

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_1a

    .line 604
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    .line 605
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 608
    :cond_1a
    const/4 v4, 0x0

    .line 609
    .local v4, bracket:Z
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    :goto_d
    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    sget-object v29, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_1d

    .line 610
    if-nez v4, :cond_1c

    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x5b

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_1c

    .line 611
    const/4 v4, 0x1

    .line 612
    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, 0x1

    move/from16 v0, v27

    iput v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    .line 609
    :cond_1b
    :goto_e
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    goto :goto_d

    .line 613
    :cond_1c
    if-nez v4, :cond_1e

    .line 619
    :cond_1d
    :goto_f
    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    move/from16 v27, v0

    if-lez v27, :cond_1f

    if-lez v13, :cond_1f

    .line 621
    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, 0x1

    move/from16 v0, v27

    iput v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    .line 622
    add-int/lit8 v13, v13, -0x1

    goto :goto_f

    .line 615
    :cond_1e
    if-eqz v4, :cond_1b

    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x5d

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_1b

    .line 616
    const/4 v4, 0x0

    goto :goto_e

    .line 624
    :cond_1f
    if-eqz p5, :cond_20

    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    move/from16 v27, v0

    if-lez v27, :cond_20

    .line 627
    add-int/lit8 v12, v12, 0x1

    .line 628
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "*"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 630
    :cond_20
    if-eqz p6, :cond_21

    const/16 v27, 0x1

    move/from16 v0, v27

    if-le v12, v0, :cond_21

    .line 632
    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, 0x1

    move/from16 v0, v27

    iput v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    .line 633
    add-int/lit8 v12, v12, -0x1

    .line 634
    const/16 v27, 0x0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v28

    add-int/lit8 v28, v28, -0x1

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 637
    :cond_21
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x3a

    invoke-static/range {v30 .. v30}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v30

    aput-object v30, v28, v29

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_22

    .line 639
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "@NoOffset "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    .line 640
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x1

    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v30

    aput-object v30, v28, v29

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    .line 641
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v27

    const/16 v28, 0x2

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x2c

    invoke-static/range {v30 .. v30}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v30

    aput-object v30, v28, v29

    const/16 v29, 0x1

    const/16 v30, 0x3b

    invoke-static/range {v30 .. v30}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v30

    aput-object v30, v28, v29

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    .line 644
    :cond_22
    const/4 v15, 0x1

    .line 645
    .local v15, infoLength:I
    const/16 v22, 0x0

    .local v22, primitive:Z
    const/16 v20, 0x0

    .local v20, needCast:Z
    const/4 v11, 0x0

    .line 646
    .local v11, implicitConst:Z
    iget-boolean v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->constValue:Z

    move/from16 v27, v0

    if-eqz v27, :cond_2b

    const/16 v27, 0x2

    move/from16 v0, v27

    if-ge v12, v0, :cond_2b

    if-nez v23, :cond_2b

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "const "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->cppType:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 647
    .local v18, key:Ljava/lang/String;
    :goto_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v16

    .line 648
    .restart local v16       #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/LinkedList;->size()I

    move-result v27

    if-lez v27, :cond_23

    .line 649
    invoke-virtual/range {v16 .. v16}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/googlecode/javacpp/Parser$Info;

    .line 650
    .local v14, info:Lcom/googlecode/javacpp/Parser$Info;
    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes:[Ljava/lang/String;

    move-object/from16 v27, v0

    if-eqz v27, :cond_2c

    if-nez v12, :cond_2c

    if-nez v23, :cond_2c

    const/16 v22, 0x1

    .line 651
    :goto_11
    iget-boolean v0, v14, Lcom/googlecode/javacpp/Parser$Info;->cast:Z

    move/from16 v20, v0

    .line 652
    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aget-object v27, v27, v28

    const-string v28, "const "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    .line 653
    if-eqz v22, :cond_2d

    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes:[Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v15, v0

    .line 655
    :goto_12
    if-gez p3, :cond_2f

    const/16 v27, 0x0

    :goto_13
    move/from16 v0, v27

    iput v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->infoNumber:I

    .line 656
    if-eqz v22, :cond_30

    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes:[Ljava/lang/String;

    move-object/from16 v27, v0

    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->infoNumber:I

    move/from16 v28, v0

    aget-object v27, v27, v28

    :goto_14
    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    .line 660
    .end local v14           #info:Lcom/googlecode/javacpp/Parser$Info;
    :cond_23
    if-nez v22, :cond_25

    .line 661
    if-nez v12, :cond_32

    if-nez v23, :cond_32

    .line 662
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "@ByVal "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    .line 681
    :cond_24
    :goto_15
    if-nez v20, :cond_25

    iget-boolean v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->constValue:Z

    move/from16 v27, v0

    if-eqz v27, :cond_25

    if-nez v11, :cond_25

    .line 682
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "@Const "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    .line 685
    :cond_25
    if-nez v20, :cond_26

    if-eqz p5, :cond_28

    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    move/from16 v27, v0

    const/16 v28, 0x1

    move/from16 v0, v27

    move/from16 v1, v28

    if-le v0, v1, :cond_28

    .line 686
    :cond_26
    iget-boolean v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->constValue:Z

    move/from16 v27, v0

    if-eqz v27, :cond_27

    .line 687
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "const "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 689
    :cond_27
    if-nez v22, :cond_36

    if-nez v12, :cond_36

    if-nez v23, :cond_36

    .line 690
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "@Cast(\""

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "*\") "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    .line 696
    :cond_28
    :goto_16
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Parser;->parameters(Lcom/googlecode/javacpp/Parser$TemplateMap;I)Lcom/googlecode/javacpp/Parser$Parameters;

    move-result-object v21

    .line 697
    .local v21, params:Lcom/googlecode/javacpp/Parser$Parameters;
    if-eqz v21, :cond_2a

    .line 698
    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->infoNumber:I

    move/from16 v27, v0

    move-object/from16 v0, v21

    iget v0, v0, Lcom/googlecode/javacpp/Parser$Parameters;->infoNumber:I

    move/from16 v28, v0

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->max(II)I

    move-result v27

    move/from16 v0, v27

    iput v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->infoNumber:I

    .line 699
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Parameters;->definitions:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->length()I

    move-result v27

    if-lez v27, :cond_29

    .line 700
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->definitions:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Parameters;->definitions:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\n"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->definitions:Ljava/lang/String;

    .line 702
    :cond_29
    if-nez v13, :cond_37

    .line 703
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Parameters;->list:Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->parameters:Ljava/lang/String;

    .line 723
    :cond_2a
    :goto_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    move-object/from16 v27, v0

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v16

    .line 724
    invoke-virtual/range {v16 .. v16}, Ljava/util/LinkedList;->size()I

    move-result v27

    if-lez v27, :cond_2

    .line 725
    invoke-virtual/range {v16 .. v16}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/googlecode/javacpp/Parser$Info;

    .line 726
    .restart local v14       #info:Lcom/googlecode/javacpp/Parser$Info;
    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    move-object/from16 v27, v0

    if-eqz v27, :cond_2

    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    if-lez v27, :cond_2

    .line 727
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "@Name(\""

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\") "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    .line 728
    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aget-object v27, v27, v28

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    goto/16 :goto_1

    .line 646
    .end local v14           #info:Lcom/googlecode/javacpp/Parser$Info;
    .end local v16           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    .end local v18           #key:Ljava/lang/String;
    .end local v21           #params:Lcom/googlecode/javacpp/Parser$Parameters;
    :cond_2b
    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->cppType:Ljava/lang/String;

    move-object/from16 v18, v0

    goto/16 :goto_10

    .line 650
    .restart local v14       #info:Lcom/googlecode/javacpp/Parser$Info;
    .restart local v16       #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    .restart local v18       #key:Ljava/lang/String;
    :cond_2c
    const/16 v22, 0x0

    goto/16 :goto_11

    .line 653
    :cond_2d
    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    move-object/from16 v27, v0

    if-eqz v27, :cond_2e

    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v15, v0

    goto/16 :goto_12

    :cond_2e
    const/4 v15, 0x1

    goto/16 :goto_12

    .line 655
    :cond_2f
    rem-int v27, p3, v15

    goto/16 :goto_13

    .line 656
    :cond_30
    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    move-object/from16 v27, v0

    if-eqz v27, :cond_31

    iget-object v0, v14, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    move-object/from16 v27, v0

    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->infoNumber:I

    move/from16 v28, v0

    aget-object v27, v27, v28

    goto/16 :goto_14

    :cond_31
    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->cppType:Ljava/lang/String;

    move-object/from16 v27, v0

    goto/16 :goto_14

    .line 663
    .end local v14           #info:Lcom/googlecode/javacpp/Parser$Info;
    :cond_32
    if-nez v12, :cond_33

    if-eqz v23, :cond_33

    .line 664
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "@ByRef "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    goto/16 :goto_15

    .line 665
    :cond_33
    const/16 v27, 0x1

    move/from16 v0, v27

    if-ne v12, v0, :cond_34

    if-eqz v23, :cond_34

    .line 666
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "@ByPtrRef "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    goto/16 :goto_15

    .line 667
    :cond_34
    const/16 v27, 0x2

    move/from16 v0, v27

    if-ne v12, v0, :cond_35

    if-nez v23, :cond_35

    if-ltz p3, :cond_35

    .line 668
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "@ByPtrPtr "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    .line 669
    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->cppType:Ljava/lang/String;

    move-object/from16 v27, v0

    const-string v28, "void"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_24

    .line 670
    const/16 v20, 0x1

    goto/16 :goto_15

    .line 672
    :cond_35
    const/16 v27, 0x2

    move/from16 v0, v27

    if-lt v12, v0, :cond_24

    .line 673
    iget v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->infoNumber:I

    move/from16 v27, v0

    add-int v27, v27, v15

    move/from16 v0, v27

    iput v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->infoNumber:I

    .line 674
    const/16 v20, 0x1

    .line 675
    const-string v27, "PointerPointer"

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    .line 676
    if-eqz v23, :cond_24

    .line 677
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "@ByRef "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    goto/16 :goto_15

    .line 692
    :cond_36
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "@Cast(\""

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\") "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    goto/16 :goto_16

    .line 705
    .restart local v21       #params:Lcom/googlecode/javacpp/Parser$Parameters;
    :cond_37
    if-eqz v17, :cond_39

    iget-object v9, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    .line 707
    .local v9, functionType:Ljava/lang/String;
    :goto_18
    move-object/from16 v0, v21

    iget v0, v0, Lcom/googlecode/javacpp/Parser$Parameters;->infoNumber:I

    move/from16 v27, v0

    move/from16 v0, p3

    move/from16 v1, v27

    if-gt v0, v1, :cond_38

    .line 708
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->definitions:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "public static class "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " extends FunctionPointer {\n"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "    static { Loader.load(); }\n"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "    public    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "(Pointer p) { super(p); }\n"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "    protected "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "() { allocate(); }\n"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "    private native void allocate();\n"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "    public native "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " call"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Parameters;->list:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";\n"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "}\n"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->definitions:Ljava/lang/String;

    .line 717
    :cond_38
    const-string v27, ""

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    .line 718
    iput-object v9, v8, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    .line 719
    const-string v27, ""

    move-object/from16 v0, v27

    iput-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->parameters:Ljava/lang/String;

    goto/16 :goto_17

    .line 705
    .end local v9           #functionType:Ljava/lang/String;
    :cond_39
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->charAt(I)C

    move-result v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    move-object/from16 v28, v0

    const/16 v29, 0x1

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Parameters;->signature:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_18
.end method

.method enumeration()Ljava/lang/String;
    .locals 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 1295
    move-object/from16 v0, p0

    iget v2, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1296
    .local v2, backIndex:I
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v9, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    .line 1297
    .local v9, enumSpacing:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->TYPEDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    invoke-virtual/range {v25 .. v26}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v14

    .line 1298
    .local v14, isTypedef:Z
    const/4 v13, 0x0

    .line 1299
    .local v13, foundEnum:Z
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v24

    .local v24, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_0
    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    sget-object v27, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v27, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_0

    .line 1300
    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    sget-object v27, Lcom/googlecode/javacpp/Parser$Token;->ENUM:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v27, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_1

    .line 1301
    const/4 v13, 0x1

    .line 1307
    :cond_0
    if-nez v13, :cond_2

    .line 1308
    move-object/from16 v0, p0

    iput v2, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1309
    const/16 v25, 0x0

    .line 1409
    :goto_1
    return-object v25

    .line 1303
    :cond_1
    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    const/16 v27, 0x5

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 1299
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v24

    goto :goto_0

    .line 1312
    :cond_2
    if-eqz v14, :cond_3

    const/16 v25, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x7b

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-virtual/range {v25 .. v26}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_3

    const/16 v25, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x5

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-virtual/range {v25 .. v26}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_3

    .line 1313
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 1315
    :cond_3
    const/4 v12, 0x1

    .line 1316
    .local v12, first:Z
    const/4 v5, 0x0

    .line 1317
    .local v5, count:I
    const-string v7, " "

    .line 1318
    .local v7, countPrefix:Ljava/lang/String;
    const-string v11, ""

    .line 1319
    .local v11, enumerators:Ljava/lang/String;
    const-string v15, ""

    .line 1320
    .local v15, macroText:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    const/16 v26, 0x2

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x5

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    const/16 v27, 0x1

    const/16 v28, 0x7b

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-virtual/range {v25 .. v26}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 1321
    .local v16, name:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x7b

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-virtual/range {v25 .. v26}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_4

    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x7b

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-virtual/range {v25 .. v26}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_4

    .line 1322
    move-object/from16 v0, p0

    iput v2, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1323
    const/16 v25, 0x0

    goto/16 :goto_1

    .line 1325
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v24

    :goto_2
    const/16 v25, 0x2

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    sget-object v27, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v27, v25, v26

    const/16 v26, 0x1

    const/16 v27, 0x7d

    invoke-static/range {v27 .. v27}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_12

    .line 1326
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->macro()Ljava/lang/String;

    move-result-object v19

    .line 1327
    .local v19, s:Ljava/lang/String;
    if-eqz v19, :cond_5

    .line 1328
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 1325
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v24

    goto :goto_2

    .line 1331
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->commentBefore()Ljava/lang/String;

    move-result-object v3

    .line 1332
    .local v3, comment:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    .line 1333
    .local v10, enumerator:Lcom/googlecode/javacpp/Parser$Token;
    const-string v22, " "

    .line 1334
    .local v22, spacing2:Ljava/lang/String;
    if-eqz v12, :cond_9

    const-string v20, ""

    .line 1335
    .local v20, separator:Ljava/lang/String;
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x3d

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-virtual/range {v25 .. v26}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_c

    .line 1336
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v22, v0

    .line 1337
    const-string v7, " "

    .line 1338
    const/4 v6, 0x0

    .line 1339
    .local v6, count2:I
    new-instance v18, Lcom/googlecode/javacpp/Parser$Token;

    invoke-direct/range {v18 .. v18}, Lcom/googlecode/javacpp/Parser$Token;-><init>()V

    .line 1340
    .local v18, prevToken:Lcom/googlecode/javacpp/Parser$Token;
    const/4 v4, 0x0

    .line 1341
    .local v4, complex:Z
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v24

    :goto_5
    const/16 v25, 0x3

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    sget-object v27, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v27, v25, v26

    const/16 v26, 0x1

    const/16 v27, 0x2c

    invoke-static/range {v27 .. v27}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v27

    aput-object v27, v25, v26

    const/16 v26, 0x2

    const/16 v27, 0x7d

    invoke-static/range {v27 .. v27}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_6

    if-lez v6, :cond_b

    .line 1342
    :cond_6
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1343
    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    const/16 v27, 0x28

    invoke-static/range {v27 .. v27}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_a

    .line 1344
    add-int/lit8 v6, v6, 0x1

    .line 1348
    :cond_7
    :goto_6
    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    const/16 v27, 0x5

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    aput-object v27, v25, v26

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_8

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    const/16 v27, 0x28

    invoke-static/range {v27 .. v27}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_8

    .line 1349
    const/4 v4, 0x1

    .line 1351
    :cond_8
    move-object/from16 v18, v24

    .line 1341
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v24

    goto/16 :goto_5

    .line 1334
    .end local v4           #complex:Z
    .end local v6           #count2:I
    .end local v18           #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    .end local v20           #separator:Ljava/lang/String;
    :cond_9
    const-string v20, ","

    goto/16 :goto_4

    .line 1345
    .restart local v4       #complex:Z
    .restart local v6       #count2:I
    .restart local v18       #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    .restart local v20       #separator:Ljava/lang/String;
    :cond_a
    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    const/16 v27, 0x29

    invoke-static/range {v27 .. v27}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_7

    .line 1346
    add-int/lit8 v6, v6, -0x1

    goto :goto_6

    .line 1354
    :cond_b
    :try_start_0
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 1355
    const-string v7, " "
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1368
    .end local v4           #complex:Z
    .end local v6           #count2:I
    .end local v18           #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    :cond_c
    :goto_7
    const/4 v12, 0x0

    .line 1369
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1370
    const-string v15, ""

    .line 1371
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->commentAfter()Ljava/lang/String;

    move-result-object v3

    .line 1372
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v25

    if-nez v25, :cond_d

    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x2c

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-virtual/range {v25 .. v26}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_d

    .line 1373
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 1374
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->commentAfter()Ljava/lang/String;

    move-result-object v3

    .line 1376
    :cond_d
    iget-object v0, v10, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v21, v0

    .line 1377
    .local v21, spacing:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v25

    if-lez v25, :cond_e

    .line 1378
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1379
    const/16 v25, 0xa

    move-object/from16 v0, v21

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v17

    .line 1380
    .local v17, newline:I
    if-lez v17, :cond_e

    .line 1381
    move-object/from16 v0, v21

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v21

    .line 1384
    .end local v17           #newline:I
    :cond_e
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    iget-object v0, v10, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1385
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->length()I

    move-result v25

    if-lez v25, :cond_11

    .line 1386
    if-lez v5, :cond_f

    .line 1387
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " + "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1392
    :cond_f
    :goto_8
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_3

    .line 1356
    .end local v21           #spacing:Ljava/lang/String;
    .restart local v4       #complex:Z
    .restart local v6       #count2:I
    .restart local v18       #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    :catch_0
    move-exception v8

    .line 1357
    .local v8, e:Ljava/lang/NumberFormatException;
    const/4 v5, 0x0

    .line 1358
    if-eqz v4, :cond_c

    .line 1359
    if-nez v12, :cond_10

    .line 1360
    const-string v20, ";\n"

    .line 1361
    const/4 v12, 0x1

    .line 1363
    :cond_10
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "public static native @MemberGetter int "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    iget-object v0, v10, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "();\npublic static final int"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 1364
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, " "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    iget-object v0, v10, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "()"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_7

    .line 1390
    .end local v4           #complex:Z
    .end local v6           #count2:I
    .end local v8           #e:Ljava/lang/NumberFormatException;
    .end local v18           #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    .restart local v21       #spacing:Ljava/lang/String;
    :cond_11
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_8

    .line 1394
    .end local v3           #comment:Ljava/lang/String;
    .end local v10           #enumerator:Lcom/googlecode/javacpp/Parser$Token;
    .end local v19           #s:Ljava/lang/String;
    .end local v20           #separator:Ljava/lang/String;
    .end local v21           #spacing:Ljava/lang/String;
    .end local v22           #spacing2:Ljava/lang/String;
    :cond_12
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->commentBefore()Ljava/lang/String;

    move-result-object v3

    .line 1395
    .restart local v3       #comment:Ljava/lang/String;
    const-string v23, ""

    .line 1396
    .local v23, text:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v24

    .line 1397
    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    const/16 v27, 0x5

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_13

    .line 1398
    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 1399
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v24

    .line 1401
    :cond_13
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "/** enum "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " */\n"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 1402
    const/16 v25, 0xa

    move/from16 v0, v25

    invoke-virtual {v9, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v17

    .line 1403
    .restart local v17       #newline:I
    if-ltz v17, :cond_14

    .line 1404
    add-int/lit8 v25, v17, 0x1

    move/from16 v0, v25

    invoke-virtual {v9, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 1406
    :cond_14
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "public static final int"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x3b

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ";"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 1407
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    move-object/from16 v25, v0

    new-instance v26, Lcom/googlecode/javacpp/Parser$Info;

    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aput-object v16, v27, v28

    invoke-direct/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const-string v29, "int"

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v26

    const/16 v27, 0x3

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const-string v29, "IntPointer"

    aput-object v29, v27, v28

    const/16 v28, 0x1

    const-string v29, "IntBuffer"

    aput-object v29, v27, v28

    const/16 v28, 0x2

    const-string v29, "int[]"

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v26

    const/16 v27, 0x1

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    .line 1408
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 1409
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    goto/16 :goto_1
.end method

.method function(Ljava/lang/String;Lcom/googlecode/javacpp/Parser$TemplateMap;)Ljava/lang/String;
    .locals 32
    .parameter "group"
    .parameter "templateMap"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 847
    move-object/from16 v0, p0

    iget v10, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 848
    .local v10, backIndex:I
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    iget-object v0, v2, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v27, v0

    .line 849
    .local v27, spacing:Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    :cond_0
    const-string v9, "public static native "

    .line 850
    .local v9, access:Ljava/lang/String;
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v31

    .local v31, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_1
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    sget-object v4, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v4, v2, v3

    move-object/from16 v0, v31

    invoke-virtual {v0, v2}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 851
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    sget-object v4, Lcom/googlecode/javacpp/Parser$Token;->STATIC:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v4, v2, v3

    move-object/from16 v0, v31

    invoke-virtual {v0, v2}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 852
    const-string v9, "public static native "

    .line 850
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v31

    goto :goto_1

    .line 849
    .end local v9           #access:Ljava/lang/String;
    .end local v31           #token:Lcom/googlecode/javacpp/Parser$Token;
    :cond_2
    const-string v9, "public native "

    goto :goto_0

    .line 853
    .restart local v9       #access:Ljava/lang/String;
    .restart local v31       #token:Lcom/googlecode/javacpp/Parser$Token;
    :cond_3
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    sget-object v4, Lcom/googlecode/javacpp/Parser$Token;->INLINE:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v4, v2, v3

    move-object/from16 v0, v31

    invoke-virtual {v0, v2}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 857
    :cond_4
    move-object/from16 v0, p0

    iget v0, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    move/from16 v28, v0

    .line 858
    .local v28, startIndex:I
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p2

    invoke-virtual/range {v2 .. v8}, Lcom/googlecode/javacpp/Parser;->declarator(Lcom/googlecode/javacpp/Parser$TemplateMap;Ljava/lang/String;IIZZ)Lcom/googlecode/javacpp/Parser$Declarator;

    move-result-object v15

    .line 859
    .local v15, decl:Lcom/googlecode/javacpp/Parser$Declarator;
    iget-object v0, v15, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    move-object/from16 v23, v0

    .line 860
    .local v23, name:Ljava/lang/String;
    if-eqz v23, :cond_5

    iget-object v2, v15, Lcom/googlecode/javacpp/Parser$Declarator;->parameters:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_7

    .line 861
    :cond_5
    move-object/from16 v0, p0

    iput v10, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 862
    const/16 v30, 0x0

    .line 932
    :cond_6
    return-object v30

    .line 865
    :cond_7
    const-string v30, ""

    .line 866
    .local v30, text:Ljava/lang/String;
    const-string v29, ""

    .line 867
    .local v29, statements:Ljava/lang/String;
    const-string v16, ""

    .line 868
    .local v16, definitions:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v21

    .line 869
    .local v21, infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    invoke-virtual/range {v21 .. v21}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-nez v2, :cond_8

    .line 870
    const/4 v2, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 872
    :cond_8
    invoke-virtual/range {v21 .. v21}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_2
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_13

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/googlecode/javacpp/Parser$Info;

    .line 873
    .local v20, info:Lcom/googlecode/javacpp/Parser$Info;
    if-eqz v20, :cond_b

    .line 874
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    if-eqz v2, :cond_a

    if-eqz p2, :cond_a

    .line 875
    const/4 v12, 0x0

    .line 876
    .local v12, count:I
    invoke-virtual/range {p2 .. p2}, Lcom/googlecode/javacpp/Parser$TemplateMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .local v19, i$:Ljava/util/Iterator;
    :cond_9
    :goto_3
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    .line 877
    .local v22, key:Ljava/lang/String;
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    array-length v2, v2

    if-ge v12, v2, :cond_9

    .line 878
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    add-int/lit8 v13, v12, 0x1

    .end local v12           #count:I
    .local v13, count:I
    aget-object v2, v2, v12

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacpp/Parser$TemplateMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v12, v13

    .end local v13           #count:I
    .restart local v12       #count:I
    goto :goto_3

    .line 882
    .end local v12           #count:I
    .end local v19           #i$:Ljava/util/Iterator;
    .end local v22           #key:Ljava/lang/String;
    :cond_a
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    if-nez v2, :cond_c

    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v23, v2, v3

    .line 883
    :goto_4
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_b

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_b

    .line 884
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "@Name(\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v20

    iget-object v3, v0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\") "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 888
    :cond_b
    new-instance v25, Ljava/util/LinkedList;

    invoke-direct/range {v25 .. v25}, Ljava/util/LinkedList;-><init>()V

    .line 889
    .local v25, prevDecl:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Declarator;>;"
    const/4 v5, -0x1

    .local v5, n:I
    :goto_5
    const v2, 0x7fffffff

    if-ge v5, v2, :cond_f

    .line 890
    move/from16 v0, v28

    move-object/from16 v1, p0

    iput v0, v1, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 891
    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p2

    invoke-virtual/range {v2 .. v8}, Lcom/googlecode/javacpp/Parser;->declarator(Lcom/googlecode/javacpp/Parser$TemplateMap;Ljava/lang/String;IIZZ)Lcom/googlecode/javacpp/Parser$Declarator;

    move-result-object v15

    .line 892
    const/16 v17, 0x0

    .line 893
    .local v17, found:Z
    invoke-virtual/range {v25 .. v25}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .restart local v19       #i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/googlecode/javacpp/Parser$Declarator;

    .line 894
    .local v14, d:Lcom/googlecode/javacpp/Parser$Declarator;
    iget-object v2, v15, Lcom/googlecode/javacpp/Parser$Declarator;->parameters:Ljava/lang/String;

    iget-object v3, v14, Lcom/googlecode/javacpp/Parser$Declarator;->parameters:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    or-int v17, v17, v2

    .line 895
    goto :goto_6

    .line 882
    .end local v5           #n:I
    .end local v14           #d:Lcom/googlecode/javacpp/Parser$Declarator;
    .end local v17           #found:Z
    .end local v19           #i$:Ljava/util/Iterator;
    .end local v25           #prevDecl:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Declarator;>;"
    :cond_c
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    array-length v2, v2

    if-nez v2, :cond_d

    const-string v23, ""

    goto :goto_4

    :cond_d
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v23, v2, v3

    goto/16 :goto_4

    .line 896
    .restart local v5       #n:I
    .restart local v17       #found:Z
    .restart local v19       #i$:Ljava/util/Iterator;
    .restart local v25       #prevDecl:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Declarator;>;"
    :cond_e
    if-eqz v17, :cond_10

    if-lez v5, :cond_10

    .line 905
    .end local v17           #found:Z
    .end local v19           #i$:Ljava/util/Iterator;
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->attribute()Z

    move-result v2

    if-nez v2, :cond_f

    .line 906
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/16 v6, 0x7b

    invoke-static {v6}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 907
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->body()Z

    goto/16 :goto_2

    .line 899
    .restart local v17       #found:Z
    .restart local v19       #i$:Ljava/util/Iterator;
    :cond_10
    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_11

    if-nez v17, :cond_11

    .line 900
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v15, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v15, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v15, Lcom/googlecode/javacpp/Parser$Declarator;->parameters:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ";\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    .line 901
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v15, Lcom/googlecode/javacpp/Parser$Declarator;->definitions:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 903
    :cond_11
    move-object/from16 v0, v25

    invoke-virtual {v0, v15}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 889
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_5

    .line 909
    .end local v17           #found:Z
    .end local v19           #i$:Ljava/util/Iterator;
    :cond_12
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    goto/16 :goto_2

    .line 912
    .end local v5           #n:I
    .end local v20           #info:Lcom/googlecode/javacpp/Parser$Info;
    .end local v25           #prevDecl:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Declarator;>;"
    :cond_13
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->commentAfter()Ljava/lang/String;

    move-result-object v11

    .line 913
    .local v11, comment:Ljava/lang/String;
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_14

    .line 914
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    .line 916
    :cond_14
    new-instance v26, Ljava/util/Scanner;

    move-object/from16 v0, v26

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 917
    .local v26, scanner:Ljava/util/Scanner;
    :cond_15
    :goto_7
    invoke-virtual/range {v26 .. v26}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 918
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {v26 .. v26}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    .line 919
    const/16 v2, 0xa

    move-object/from16 v0, v27

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v24

    .line 920
    .local v24, newline:I
    if-lez v24, :cond_15

    .line 921
    move-object/from16 v0, v27

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v27

    goto :goto_7

    .line 924
    .end local v24           #newline:I
    :cond_16
    new-instance v26, Ljava/util/Scanner;

    .end local v26           #scanner:Ljava/util/Scanner;
    move-object/from16 v0, v26

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 925
    .restart local v26       #scanner:Ljava/util/Scanner;
    :cond_17
    :goto_8
    invoke-virtual/range {v26 .. v26}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 926
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {v26 .. v26}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    .line 927
    const/16 v2, 0xa

    move-object/from16 v0, v27

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v24

    .line 928
    .restart local v24       #newline:I
    if-lez v24, :cond_17

    .line 929
    move-object/from16 v0, v27

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v27

    goto :goto_8
.end method

.method getToken()Lcom/googlecode/javacpp/Parser$Token;
    .locals 1

    .prologue
    .line 444
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v0

    return-object v0
.end method

.method getToken(I)Lcom/googlecode/javacpp/Parser$Token;
    .locals 2
    .parameter "i"

    .prologue
    .line 447
    iget v0, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    add-int/2addr v0, p1

    iget-object v1, p0, Lcom/googlecode/javacpp/Parser;->tokenArray:[Lcom/googlecode/javacpp/Parser$Token;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/googlecode/javacpp/Parser;->tokenArray:[Lcom/googlecode/javacpp/Parser$Token;

    iget v1, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    add-int/2addr v1, p1

    aget-object v0, v0, v1

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    goto :goto_0
.end method

.method group(Lcom/googlecode/javacpp/Parser$TemplateMap;)Ljava/lang/String;
    .locals 14
    .parameter "templateMap"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 1201
    iget v0, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1202
    .local v0, backIndex:I
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    iget-object v7, v10, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    .line 1203
    .local v7, spacing:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    sget-object v13, Lcom/googlecode/javacpp/Parser$Token;->TYPEDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v5

    .line 1204
    .local v5, isTypedef:Z
    const/4 v2, 0x0

    .local v2, foundGroup:Z
    const/4 v1, 0x1

    .line 1205
    .local v1, doOutput:Z
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v9

    .local v9, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_0
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    sget-object v12, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v12, v10, v11

    invoke-virtual {v9, v10}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 1206
    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    sget-object v12, Lcom/googlecode/javacpp/Parser$Token;->CLASS:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    sget-object v12, Lcom/googlecode/javacpp/Parser$Token;->STRUCT:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v12, v10, v11

    const/4 v11, 0x2

    sget-object v12, Lcom/googlecode/javacpp/Parser$Token;->UNION:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v12, v10, v11

    invoke-virtual {v9, v10}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1207
    const/4 v2, 0x1

    .line 1217
    :cond_0
    :goto_1
    if-nez v2, :cond_3

    .line 1218
    iput v0, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1219
    const/4 v8, 0x0

    .line 1291
    :goto_2
    return-object v8

    .line 1209
    :cond_1
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    sget-object v12, Lcom/googlecode/javacpp/Parser$Token;->EXTERN:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v12, v10, v11

    invoke-virtual {v9, v10}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/4 v13, 0x3

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 1210
    const/4 v2, 0x1

    .line 1211
    const/4 v1, 0x0

    .line 1212
    goto :goto_1

    .line 1213
    :cond_2
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const/4 v12, 0x5

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v9, v10}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1205
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v9

    goto :goto_0

    .line 1222
    :cond_3
    if-eqz v5, :cond_4

    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/16 v13, 0x7b

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    const/4 v10, 0x2

    invoke-virtual {p0, v10}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/4 v13, 0x5

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 1223
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 1225
    :cond_4
    const-string v8, ""

    .line 1226
    .local v8, text:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/4 v13, 0x3

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const/4 v13, 0x5

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    const/16 v13, 0x7b

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    iget-object v6, v10, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 1227
    .local v6, name:Ljava/lang/String;
    const/4 v10, 0x0

    invoke-virtual {p0, v10}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/16 v13, 0x7b

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const/16 v13, 0x3b

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_5

    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Lcom/googlecode/javacpp/Parser;->getToken(I)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/16 v13, 0x7b

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const/16 v13, 0x3b

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_5

    .line 1228
    iput v0, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1229
    const/4 v8, 0x0

    goto/16 :goto_2

    .line 1231
    :cond_5
    if-eqz v1, :cond_d

    .line 1232
    iget-object v10, p0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    invoke-virtual {v10, v6}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v4

    .line 1233
    .local v4, infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/4 v13, 0x5

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/16 v13, 0x3b

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 1234
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 1235
    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v10

    if-eqz v10, :cond_6

    invoke-virtual {v4}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/googlecode/javacpp/Parser$Info;

    iget-boolean v10, v10, Lcom/googlecode/javacpp/Parser$Info;->forwardDeclared:Z

    if-nez v10, :cond_7

    .line 1236
    :cond_6
    iget-object v10, p0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    new-instance v11, Lcom/googlecode/javacpp/Parser$Info;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/String;

    const/4 v13, 0x0

    aput-object v6, v12, v13

    invoke-direct {v11, v12}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Lcom/googlecode/javacpp/Parser$Info;->forwardDeclared(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    .line 1237
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "@Opaque public static class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " extends Pointer {\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    public "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "() { }\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    public "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(Pointer p) { super(p); }\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "}"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_2

    .line 1243
    :cond_7
    const-string v8, ""

    goto/16 :goto_2

    .line 1246
    :cond_8
    iget v3, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1247
    .local v3, index:I
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->body()Z

    move-result v10

    if-eqz v10, :cond_9

    if-eqz v5, :cond_9

    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/4 v13, 0x5

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 1248
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    iget-object v6, v10, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 1249
    iget-object v10, p0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    invoke-virtual {v10, v6}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v4

    .line 1251
    :cond_9
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_c

    .line 1253
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v9

    :goto_3
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    sget-object v12, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v12, v10, v11

    invoke-virtual {v9, v10}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_a

    .line 1254
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const/16 v12, 0x3b

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v9, v10}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b

    .line 1255
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 1259
    :cond_a
    const-string v8, ""

    goto/16 :goto_2

    .line 1253
    :cond_b
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v9

    goto :goto_3

    .line 1261
    :cond_c
    iput v3, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1262
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "public static class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " extends Pointer {\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    static { Loader.load(); }\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    public "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "() { allocate(); }\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    public "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(int size) { allocateArray(size); }\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    public "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "(Pointer p) { super(p); }\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    private native void allocate();\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    private native void allocateArray(int size);\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    @Override public "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " position(int position) {\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "        return ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")super.position(position);\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    }\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1275
    .end local v3           #index:I
    .end local v4           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    :cond_d
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/16 v13, 0x7b

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_e

    .line 1276
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 1278
    :cond_e
    :goto_4
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    sget-object v13, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const/16 v13, 0x7d

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_f

    .line 1279
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0, v6, p1}, Lcom/googlecode/javacpp/Parser;->declaration(Ljava/lang/String;Lcom/googlecode/javacpp/Parser$TemplateMap;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_4

    .line 1282
    :cond_f
    if-eqz v1, :cond_11

    .line 1283
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v11

    iget-object v11, v11, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/16 v11, 0x7d

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1284
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v9

    .line 1285
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const/4 v12, 0x5

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v9, v10}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_10

    .line 1286
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v9

    .line 1288
    :cond_10
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/16 v13, 0x3b

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v9, v11}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v11

    iget-object v11, v11, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1290
    :cond_11
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    goto/16 :goto_2
.end method

.method macro()Ljava/lang/String;
    .locals 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 1008
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x23

    invoke-static/range {v29 .. v29}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v29

    aput-object v29, v27, v28

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_1

    .line 1009
    const/16 v22, 0x0

    .line 1169
    :cond_0
    :goto_0
    return-object v22

    .line 1011
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v20, v0

    .line 1012
    .local v20, spacing:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v14

    .line 1014
    .local v14, keyword:Lcom/googlecode/javacpp/Parser$Token;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 1015
    move-object/from16 v0, p0

    iget v2, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1016
    .local v2, beginIndex:I
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    .local v23, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_1
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_2

    .line 1017
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x4

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_2

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v26, v0

    const/16 v27, 0xa

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->indexOf(I)I

    move-result v26

    if-ltz v26, :cond_6

    .line 1021
    :cond_2
    move-object/from16 v0, p0

    iget v8, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1023
    .local v8, endIndex:I
    const-string v22, ""

    .line 1024
    .local v22, text:Ljava/lang/String;
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->DEFINE:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    move-object/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_1f

    add-int/lit8 v26, v2, 0x1

    move/from16 v0, v26

    if-ge v0, v8, :cond_1f

    .line 1025
    move-object/from16 v0, p0

    iput v2, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1026
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v26

    move-object/from16 v0, v26

    iget-object v15, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 1027
    .local v15, name:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v9

    .line 1028
    .local v9, first:Lcom/googlecode/javacpp/Parser$Token;
    const-string v21, ""

    .line 1029
    .local v21, statements:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v13

    .line 1030
    .local v13, infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    iget-object v0, v9, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v26

    if-nez v26, :cond_c

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x28

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_c

    .line 1032
    invoke-virtual {v13}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :cond_3
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_14

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/googlecode/javacpp/Parser$Info;

    .line 1033
    .local v12, info:Lcom/googlecode/javacpp/Parser$Info;
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    if-eqz v26, :cond_3

    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    if-eqz v26, :cond_3

    .line 1037
    const/4 v6, 0x1

    .line 1038
    .local v6, count:I
    add-int/lit8 v26, v2, 0x2

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1039
    const-string v24, ""

    .local v24, type:Ljava/lang/String;
    const-string v17, "("

    .line 1040
    .local v17, params:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    :goto_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v0, v8, :cond_8

    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v6, v0, :cond_8

    .line 1042
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x5

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_7

    .line 1043
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    aget-object v24, v26, v6

    .line 1044
    move-object/from16 v0, v23

    iget-object v15, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 1045
    const-string v26, "..."

    move-object/from16 v0, v26

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_4

    .line 1046
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "arg"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 1048
    :cond_4
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1049
    add-int/lit8 v6, v6, 0x1

    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v6, v0, :cond_5

    .line 1050
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, ", "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1041
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    goto/16 :goto_3

    .line 1016
    .end local v6           #count:I
    .end local v8           #endIndex:I
    .end local v9           #first:Lcom/googlecode/javacpp/Parser$Token;
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v12           #info:Lcom/googlecode/javacpp/Parser$Info;
    .end local v13           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    .end local v15           #name:Ljava/lang/String;
    .end local v17           #params:Ljava/lang/String;
    .end local v21           #statements:Ljava/lang/String;
    .end local v22           #text:Ljava/lang/String;
    .end local v24           #type:Ljava/lang/String;
    :cond_6
    const/16 v26, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser;->nextToken(Z)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    goto/16 :goto_1

    .line 1052
    .restart local v6       #count:I
    .restart local v8       #endIndex:I
    .restart local v9       #first:Lcom/googlecode/javacpp/Parser$Token;
    .restart local v11       #i$:Ljava/util/Iterator;
    .restart local v12       #info:Lcom/googlecode/javacpp/Parser$Info;
    .restart local v13       #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    .restart local v15       #name:Ljava/lang/String;
    .restart local v17       #params:Ljava/lang/String;
    .restart local v21       #statements:Ljava/lang/String;
    .restart local v22       #text:Ljava/lang/String;
    .restart local v24       #type:Ljava/lang/String;
    :cond_7
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x29

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_5

    .line 1056
    :cond_8
    :goto_4
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v6, v0, :cond_9

    .line 1057
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    aget-object v24, v26, v6

    .line 1058
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "arg"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 1059
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1060
    add-int/lit8 v6, v6, 0x1

    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v6, v0, :cond_8

    .line 1061
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, ", "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    goto :goto_4

    .line 1064
    :cond_9
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, ")"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1066
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget-object v24, v26, v27

    .line 1067
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    move-object/from16 v26, v0

    if-nez v26, :cond_b

    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget-object v15, v26, v27

    .line 1068
    :goto_5
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget-object v26, v26, v27

    move-object/from16 v0, v26

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_a

    .line 1069
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "@Name(\""

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aget-object v27, v27, v28

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "\") "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 1071
    :cond_a
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "public static native "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, ";\n"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 1072
    goto/16 :goto_2

    .line 1067
    :cond_b
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget-object v15, v26, v27

    goto :goto_5

    .line 1073
    .end local v6           #count:I
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v12           #info:Lcom/googlecode/javacpp/Parser$Info;
    .end local v17           #params:Ljava/lang/String;
    .end local v24           #type:Ljava/lang/String;
    :cond_c
    invoke-virtual {v13}, Ljava/util/LinkedList;->size()I

    move-result v26

    if-eqz v26, :cond_d

    invoke-virtual {v13}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/googlecode/javacpp/Parser$Info;

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    if-eqz v26, :cond_d

    invoke-virtual {v13}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/googlecode/javacpp/Parser$Info;

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    if-lez v26, :cond_14

    .line 1077
    :cond_d
    const-string v25, ""

    .line 1078
    .local v25, value:Ljava/lang/String;
    const-string v24, "int"

    .line 1079
    .restart local v24       #type:Ljava/lang/String;
    const-string v3, ""

    .line 1080
    .local v3, cat:Ljava/lang/String;
    add-int/lit8 v26, v2, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1081
    new-instance v18, Lcom/googlecode/javacpp/Parser$Token;

    invoke-direct/range {v18 .. v18}, Lcom/googlecode/javacpp/Parser$Token;-><init>()V

    .line 1082
    .local v18, prevToken:Lcom/googlecode/javacpp/Parser$Token;
    const/4 v5, 0x0

    .line 1083
    .local v5, complex:Z
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    :goto_6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v0, v8, :cond_e

    .line 1084
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x3

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_17

    .line 1085
    const-string v24, "String"

    const-string v3, " + "

    .line 1095
    :cond_e
    :goto_7
    invoke-virtual {v13}, Ljava/util/LinkedList;->size()I

    move-result v26

    if-lez v26, :cond_11

    .line 1096
    invoke-virtual {v13}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/googlecode/javacpp/Parser$Info;

    .line 1097
    .restart local v12       #info:Lcom/googlecode/javacpp/Parser$Info;
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    if-eqz v26, :cond_f

    .line 1098
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget-object v24, v26, v27

    .line 1100
    :cond_f
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget-object v15, v26, v27

    .line 1101
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    move-object/from16 v26, v0

    if-eqz v26, :cond_10

    .line 1102
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    aget-object v15, v26, v27

    .line 1104
    :cond_10
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Parser$Info;->complex:Z

    move/from16 v26, v0

    if-eqz v26, :cond_11

    .line 1105
    const/4 v5, 0x1

    .line 1108
    .end local v12           #info:Lcom/googlecode/javacpp/Parser$Info;
    :cond_11
    add-int/lit8 v26, v2, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1109
    if-eqz v5, :cond_1d

    .line 1110
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "public static native @MemberGetter "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "();\n"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 1111
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, " "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "()"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 1117
    :cond_12
    const/16 v26, 0x20

    move-object/from16 v0, v24

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v10

    .line 1118
    .local v10, i:I
    if-lez v10, :cond_13

    .line 1119
    add-int/lit8 v26, v10, 0x1

    move-object/from16 v0, v24

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v24

    .line 1121
    :cond_13
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "public static final "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " ="

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, ";\n"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 1123
    .end local v3           #cat:Ljava/lang/String;
    .end local v5           #complex:Z
    .end local v10           #i:I
    .end local v18           #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    .end local v24           #type:Ljava/lang/String;
    .end local v25           #value:Ljava/lang/String;
    :cond_14
    move-object/from16 v0, p0

    iput v8, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1124
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->commentAfter()Ljava/lang/String;

    move-result-object v4

    .line 1125
    .local v4, comment:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v26

    if-lez v26, :cond_15

    .line 1126
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "\n"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 1128
    :cond_15
    new-instance v19, Ljava/util/Scanner;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 1129
    .local v19, scanner:Ljava/util/Scanner;
    :cond_16
    :goto_8
    invoke-virtual/range {v19 .. v19}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v26

    if-eqz v26, :cond_0

    .line 1130
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v19 .. v19}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 1131
    const/16 v26, 0xa

    move-object/from16 v0, v20

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v16

    .line 1132
    .local v16, newline:I
    if-lez v16, :cond_16

    .line 1133
    move-object/from16 v0, v20

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    goto :goto_8

    .line 1086
    .end local v4           #comment:Ljava/lang/String;
    .end local v16           #newline:I
    .end local v19           #scanner:Ljava/util/Scanner;
    .restart local v3       #cat:Ljava/lang/String;
    .restart local v5       #complex:Z
    .restart local v18       #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    .restart local v24       #type:Ljava/lang/String;
    .restart local v25       #value:Ljava/lang/String;
    :cond_17
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x2

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_18

    .line 1087
    const-string v24, "double"

    const-string v3, ""

    goto/16 :goto_7

    .line 1088
    :cond_18
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x1

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_19

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    move-object/from16 v26, v0

    const-string v27, "L"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v26

    if-eqz v26, :cond_19

    .line 1089
    const-string v24, "long"

    const-string v3, ""

    goto/16 :goto_7

    .line 1090
    :cond_19
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x5

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_1a

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x28

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_1b

    :cond_1a
    const/16 v26, 0x2

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x7b

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    const/16 v27, 0x1

    const/16 v28, 0x7d

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_1c

    .line 1091
    :cond_1b
    const/4 v5, 0x1

    .line 1093
    :cond_1c
    move-object/from16 v18, v23

    .line 1083
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    goto/16 :goto_6

    .line 1113
    :cond_1d
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    :goto_9
    move-object/from16 v0, p0

    iget v0, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v0, v8, :cond_12

    .line 1114
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, p0

    iget v0, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v0, v8, :cond_1e

    move-object/from16 v26, v3

    :goto_a
    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 1113
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    goto :goto_9

    .line 1114
    :cond_1e
    const-string v26, ""

    goto :goto_a

    .line 1136
    .end local v3           #cat:Ljava/lang/String;
    .end local v5           #complex:Z
    .end local v9           #first:Lcom/googlecode/javacpp/Parser$Token;
    .end local v13           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    .end local v15           #name:Ljava/lang/String;
    .end local v18           #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    .end local v21           #statements:Ljava/lang/String;
    .end local v24           #type:Ljava/lang/String;
    .end local v25           #value:Ljava/lang/String;
    :cond_1f
    const/16 v26, 0x4

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->IF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    const/16 v27, 0x1

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->IFDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    const/16 v27, 0x2

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->IFNDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    const/16 v27, 0x3

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->ELIF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    move-object/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_27

    if-ge v2, v8, :cond_27

    .line 1137
    move-object/from16 v0, p0

    iput v2, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1138
    const-string v25, ""

    .line 1139
    .restart local v25       #value:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    :goto_b
    move-object/from16 v0, p0

    iget v0, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v0, v8, :cond_20

    .line 1140
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 1139
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    goto :goto_b

    .line 1142
    :cond_20
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "// #"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 1143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v13

    .line 1144
    .restart local v13       #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    const/4 v7, 0x1

    .line 1145
    .local v7, define:Z
    invoke-virtual {v13}, Ljava/util/LinkedList;->size()I

    move-result v26

    if-lez v26, :cond_21

    .line 1146
    invoke-virtual {v13}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/googlecode/javacpp/Parser$Info;

    .line 1147
    .restart local v12       #info:Lcom/googlecode/javacpp/Parser$Info;
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->IFNDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    move-object/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_24

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Parser$Info;->define:Z

    move/from16 v26, v0

    if-nez v26, :cond_23

    const/4 v7, 0x1

    .line 1149
    .end local v12           #info:Lcom/googlecode/javacpp/Parser$Info;
    :cond_21
    :goto_c
    if-nez v7, :cond_0

    .line 1150
    const/4 v6, 0x1

    .line 1151
    .restart local v6       #count:I
    new-instance v18, Lcom/googlecode/javacpp/Parser$Token;

    invoke-direct/range {v18 .. v18}, Lcom/googlecode/javacpp/Parser$Token;-><init>()V

    .line 1152
    .restart local v18       #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    :goto_d
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_26

    if-lez v6, :cond_26

    .line 1153
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x23

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_25

    const/16 v26, 0x3

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->IF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    const/16 v27, 0x1

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->IFDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    const/16 v27, 0x2

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->IFNDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_25

    .line 1154
    add-int/lit8 v6, v6, 0x1

    .line 1158
    :cond_22
    :goto_e
    move-object/from16 v18, v23

    .line 1152
    const/16 v26, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser;->nextToken(Z)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    goto :goto_d

    .line 1147
    .end local v6           #count:I
    .end local v18           #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    .restart local v12       #info:Lcom/googlecode/javacpp/Parser$Info;
    :cond_23
    const/4 v7, 0x0

    goto :goto_c

    :cond_24
    iget-boolean v7, v12, Lcom/googlecode/javacpp/Parser$Info;->define:Z

    goto :goto_c

    .line 1155
    .end local v12           #info:Lcom/googlecode/javacpp/Parser$Info;
    .restart local v6       #count:I
    .restart local v18       #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    :cond_25
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const/16 v28, 0x23

    invoke-static/range {v28 .. v28}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v18

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_22

    const/16 v26, 0x3

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->ELIF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    const/16 v27, 0x1

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->ELSE:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    const/16 v27, 0x2

    sget-object v28, Lcom/googlecode/javacpp/Parser$Token;->ENDIF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v28, v26, v27

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_22

    .line 1156
    add-int/lit8 v6, v6, -0x1

    goto :goto_e

    .line 1160
    :cond_26
    move-object/from16 v0, p0

    iget v0, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    move/from16 v26, v0

    add-int/lit8 v26, v26, -0x2

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    goto/16 :goto_0

    .line 1163
    .end local v6           #count:I
    .end local v7           #define:Z
    .end local v13           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    .end local v18           #prevToken:Lcom/googlecode/javacpp/Parser$Token;
    .end local v25           #value:Ljava/lang/String;
    :cond_27
    move-object/from16 v0, p0

    iput v2, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1164
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "// #"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 1165
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    :goto_f
    move-object/from16 v0, p0

    iget v0, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v0, v8, :cond_0

    .line 1166
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 1165
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v23

    goto :goto_f
.end method

.method nextToken()Lcom/googlecode/javacpp/Parser$Token;
    .locals 1

    .prologue
    .line 450
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/googlecode/javacpp/Parser;->nextToken(Z)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v0

    return-object v0
.end method

.method nextToken(Z)Lcom/googlecode/javacpp/Parser$Token;
    .locals 4
    .parameter "skipComment"

    .prologue
    .line 453
    iget v0, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 454
    :goto_0
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 455
    iget v0, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    goto :goto_0

    .line 457
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v0

    return-object v0
.end method

.method parameters(Lcom/googlecode/javacpp/Parser$TemplateMap;I)Lcom/googlecode/javacpp/Parser$Parameters;
    .locals 18
    .parameter "templateMap"
    .parameter "infoNumber"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 808
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/16 v4, 0x28

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 809
    const/4 v15, 0x0

    .line 843
    :cond_0
    :goto_0
    return-object v15

    .line 812
    :cond_1
    const/4 v10, 0x0

    .line 813
    .local v10, count:I
    new-instance v15, Lcom/googlecode/javacpp/Parser$Parameters;

    invoke-direct {v15}, Lcom/googlecode/javacpp/Parser$Parameters;-><init>()V

    .line 814
    .local v15, params:Lcom/googlecode/javacpp/Parser$Parameters;
    const-string v1, "("

    iput-object v1, v15, Lcom/googlecode/javacpp/Parser$Parameters;->list:Ljava/lang/String;

    .line 815
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v17

    .local v17, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_1
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v3, v1, v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 816
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 817
    .local v16, spacing:Ljava/lang/String;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/16 v3, 0x29

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    aput-object v3, v1, v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 818
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v15, Lcom/googlecode/javacpp/Parser$Parameters;->list:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/googlecode/javacpp/Parser$Parameters;->list:Ljava/lang/String;

    .line 819
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    goto :goto_0

    .line 822
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "arg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v11, v10, 0x1

    .end local v10           #count:I
    .local v11, count:I
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v4, p2

    invoke-virtual/range {v1 .. v7}, Lcom/googlecode/javacpp/Parser;->declarator(Lcom/googlecode/javacpp/Parser$TemplateMap;Ljava/lang/String;IIZZ)Lcom/googlecode/javacpp/Parser$Declarator;

    move-result-object v12

    .line 823
    .local v12, decl:Lcom/googlecode/javacpp/Parser$Declarator;
    if-eqz v12, :cond_8

    iget-object v1, v12, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    const-string v2, "void"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 824
    iget v1, v15, Lcom/googlecode/javacpp/Parser$Parameters;->infoNumber:I

    iget v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->infoNumber:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v15, Lcom/googlecode/javacpp/Parser$Parameters;->infoNumber:I

    .line 825
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v15, Lcom/googlecode/javacpp/Parser$Parameters;->list:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v1, 0x1

    if-le v11, v1, :cond_5

    const-string v1, ","

    :goto_2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/googlecode/javacpp/Parser$Parameters;->list:Ljava/lang/String;

    .line 826
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v15, Lcom/googlecode/javacpp/Parser$Parameters;->definitions:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->definitions:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/googlecode/javacpp/Parser$Parameters;->definitions:Ljava/lang/String;

    .line 827
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v15, Lcom/googlecode/javacpp/Parser$Parameters;->signature:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/googlecode/javacpp/Parser$Parameters;->signature:Ljava/lang/String;

    .line 828
    iget-object v1, v12, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    iget-object v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v8

    .local v8, arr$:[C
    array-length v14, v8

    .local v14, len$:I
    const/4 v13, 0x0

    .local v13, i$:I
    :goto_3
    if-ge v13, v14, :cond_6

    aget-char v9, v8, v13

    .line 829
    .local v9, c:C
    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {v9}, Ljava/lang/Character;->isLetter(C)Z

    move-result v1

    if-nez v1, :cond_3

    const/16 v1, 0x5f

    if-ne v9, v1, :cond_4

    .line 830
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v15, Lcom/googlecode/javacpp/Parser$Parameters;->signature:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/googlecode/javacpp/Parser$Parameters;->signature:Ljava/lang/String;

    .line 828
    :cond_4
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 825
    .end local v8           #arr$:[C
    .end local v9           #c:C
    .end local v13           #i$:I
    .end local v14           #len$:I
    :cond_5
    const-string v1, ""

    goto/16 :goto_2

    .line 833
    .restart local v8       #arr$:[C
    .restart local v13       #i$:I
    .restart local v14       #len$:I
    :cond_6
    iget-object v1, v12, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    const-string v2, "arg"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 835
    :try_start_0
    iget-object v1, v12, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    add-int/lit8 v10, v1, 0x1

    .line 839
    .end local v8           #arr$:[C
    .end local v11           #count:I
    .end local v13           #i$:I
    .end local v14           #len$:I
    .restart local v10       #count:I
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/16 v4, 0x2c

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const/16 v4, 0x29

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/16 v4, 0x2c

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 840
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 815
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v17

    goto/16 :goto_1

    .line 836
    .end local v10           #count:I
    .restart local v8       #arr$:[C
    .restart local v11       #count:I
    .restart local v13       #i$:I
    .restart local v14       #len$:I
    :catch_0
    move-exception v1

    move v10, v11

    .end local v11           #count:I
    .restart local v10       #count:I
    goto :goto_4

    .end local v8           #arr$:[C
    .end local v10           #count:I
    .end local v13           #i$:I
    .end local v14           #len$:I
    .restart local v11       #count:I
    :cond_8
    move v10, v11

    .end local v11           #count:I
    .restart local v10       #count:I
    goto :goto_4
.end method

.method public parse(Ljava/io/File;Ljava/lang/Class;)Ljava/io/File;
    .locals 17
    .parameter "outputDirectory"
    .parameter "cls"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 1498
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Parser;->properties:Ljava/util/Properties;

    const/4 v15, 0x1

    move-object/from16 v0, p2

    invoke-static {v0, v14, v15}, Lcom/googlecode/javacpp/Loader;->loadProperties(Ljava/lang/Class;Ljava/util/Properties;Z)Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-result-object v2

    .line 1499
    .local v2, allProperties:Lcom/googlecode/javacpp/Loader$ClassProperties;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Parser;->properties:Ljava/util/Properties;

    const/4 v15, 0x0

    move-object/from16 v0, p2

    invoke-static {v0, v14, v15}, Lcom/googlecode/javacpp/Loader;->loadProperties(Ljava/lang/Class;Ljava/util/Properties;Z)Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-result-object v5

    .line 1500
    .local v5, clsProperties:Lcom/googlecode/javacpp/Loader$ClassProperties;
    invoke-virtual {v2}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getHeaderFiles()Ljava/util/LinkedList;

    move-result-object v1

    .line 1501
    .local v1, allFiles:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/io/File;>;"
    invoke-virtual {v5}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getHeaderFiles()Ljava/util/LinkedList;

    move-result-object v4

    .line 1502
    .local v4, clsFiles:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/io/File;>;"
    const-string v14, "parser.target"

    invoke-virtual {v2, v14}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v3

    .line 1503
    .local v3, allTargets:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const-string v14, "parser.target"

    invoke-virtual {v5, v14}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v6

    .line 1504
    .local v6, clsTargets:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-virtual {v6}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 1506
    .local v11, target:Ljava/lang/String;
    const-string v13, "/* DO NOT EDIT THIS FILE - IT IS MACHINE GENERATED */\n\n"

    .line 1507
    .local v13, text:Ljava/lang/String;
    const/16 v14, 0x2e

    invoke-virtual {v11, v14}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    .line 1508
    .local v9, n:I
    if-lez v9, :cond_0

    .line 1509
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "package "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v11, v15, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ";\n\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1511
    :cond_0
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "import com.googlecode.javacpp.*;\nimport com.googlecode.javacpp.annotation.*;\nimport java.nio.*;\n\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1514
    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 1515
    .local v10, s:Ljava/lang/String;
    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_1

    .line 1516
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "import static "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ".*;\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_0

    .line 1519
    .end local v10           #s:Ljava/lang/String;
    :cond_2
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v14

    const/4 v15, 0x1

    if-le v14, v15, :cond_3

    .line 1520
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1522
    :cond_3
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "public class "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    add-int/lit8 v15, v9, 0x1

    invoke-virtual {v11, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " extends "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1523
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    new-instance v15, Lcom/googlecode/javacpp/Parser$Info;

    invoke-direct {v15}, Lcom/googlecode/javacpp/Parser$Info;-><init>()V

    invoke-virtual {v15, v13}, Lcom/googlecode/javacpp/Parser$Info;->textBefore(Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    .line 1525
    new-instance v12, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v15, 0x2e

    const/16 v16, 0x2f

    move/from16 v0, v16

    invoke-virtual {v11, v15, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ".java"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-direct {v12, v0, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1526
    .local v12, targetFile:Ljava/io/File;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Targeting file: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1527
    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/io/File;

    .line 1528
    .local v7, f:Ljava/io/File;
    invoke-virtual {v4, v7}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_4

    .line 1529
    const/4 v14, 0x0

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/io/File;

    const/16 v16, 0x0

    aput-object v7, v15, v16

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/googlecode/javacpp/Parser;->parse(Ljava/io/File;[Ljava/io/File;)V

    goto :goto_1

    .line 1532
    .end local v7           #f:Ljava/io/File;
    :cond_5
    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v14

    new-array v14, v14, [Ljava/io/File;

    invoke-virtual {v4, v14}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v14

    check-cast v14, [Ljava/io/File;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v14}, Lcom/googlecode/javacpp/Parser;->parse(Ljava/io/File;[Ljava/io/File;)V

    .line 1533
    return-object v12
.end method

.method public parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/io/File;
    .locals 1
    .parameter "outputDirectory"
    .parameter "cls"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 1495
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lcom/googlecode/javacpp/Parser;->parse(Ljava/io/File;Ljava/lang/Class;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public varargs parse(Ljava/io/File;[Ljava/io/File;)V
    .locals 17
    .parameter "outputFile"
    .parameter "inputFiles"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 1438
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 1439
    .local v12, tokens:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/googlecode/javacpp/Parser$Token;>;"
    const-string v8, "\n"

    .line 1440
    .local v8, lineSeparator:Ljava/lang/String;
    move-object/from16 v1, p2

    .local v1, arr$:[Ljava/io/File;
    array-length v7, v1

    .local v7, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v7, :cond_3

    aget-object v3, v1, v4

    .line 1441
    .local v3, file:Ljava/io/File;
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Parsing header file: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1442
    new-instance v10, Lcom/googlecode/javacpp/Parser$Token;

    invoke-direct {v10}, Lcom/googlecode/javacpp/Parser$Token;-><init>()V

    .line 1443
    .local v10, token:Lcom/googlecode/javacpp/Parser$Token;
    const/4 v13, 0x4

    iput v13, v10, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 1444
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "\n/* Wrapper for header file "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " */\n\n"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v10, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 1445
    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1446
    new-instance v11, Lcom/googlecode/javacpp/Parser$Tokenizer;

    invoke-direct {v11, v3}, Lcom/googlecode/javacpp/Parser$Tokenizer;-><init>(Ljava/io/File;)V

    .line 1447
    .local v11, tokenizer:Lcom/googlecode/javacpp/Parser$Tokenizer;
    :goto_1
    invoke-virtual {v11}, Lcom/googlecode/javacpp/Parser$Tokenizer;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v10

    invoke-virtual {v10}, Lcom/googlecode/javacpp/Parser$Token;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_1

    .line 1448
    iget v13, v10, Lcom/googlecode/javacpp/Parser$Token;->type:I

    const/4 v14, -0x1

    if-ne v13, v14, :cond_0

    .line 1449
    const/4 v13, 0x4

    iput v13, v10, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 1451
    :cond_0
    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1453
    :cond_1
    if-nez v8, :cond_2

    .line 1454
    iget-object v8, v11, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineSeparator:Ljava/lang/String;

    .line 1456
    :cond_2
    invoke-virtual {v11}, Lcom/googlecode/javacpp/Parser$Tokenizer;->close()V

    .line 1457
    new-instance v10, Lcom/googlecode/javacpp/Parser$Token;

    .end local v10           #token:Lcom/googlecode/javacpp/Parser$Token;
    invoke-direct {v10}, Lcom/googlecode/javacpp/Parser$Token;-><init>()V

    .line 1458
    .restart local v10       #token:Lcom/googlecode/javacpp/Parser$Token;
    const/4 v13, 0x4

    iput v13, v10, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 1459
    const-string v13, "\n"

    iput-object v13, v10, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    .line 1460
    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1440
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1462
    .end local v3           #file:Ljava/io/File;
    .end local v10           #token:Lcom/googlecode/javacpp/Parser$Token;
    .end local v11           #tokenizer:Lcom/googlecode/javacpp/Parser$Tokenizer;
    :cond_3
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v13

    new-array v13, v13, [Lcom/googlecode/javacpp/Parser$Token;

    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Lcom/googlecode/javacpp/Parser$Token;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/googlecode/javacpp/Parser;->tokenArray:[Lcom/googlecode/javacpp/Parser$Token;

    .line 1463
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 1465
    if-eqz p1, :cond_5

    new-instance v9, Ljava/io/FileWriter;

    move-object/from16 v0, p1

    invoke-direct {v9, v0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 1470
    .local v9, out:Ljava/io/Writer;
    :goto_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v6

    .line 1471
    .local v6, infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    invoke-virtual {v6}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_4
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javacpp/Parser$Info;

    .line 1472
    .local v5, info:Lcom/googlecode/javacpp/Parser$Info;
    iget-object v13, v5, Lcom/googlecode/javacpp/Parser$Info;->textBefore:Ljava/lang/String;

    if-eqz v13, :cond_4

    .line 1473
    iget-object v13, v5, Lcom/googlecode/javacpp/Parser$Info;->textBefore:Ljava/lang/String;

    const-string v14, "\n"

    invoke-virtual {v13, v14, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    goto :goto_3

    .line 1465
    .end local v5           #info:Lcom/googlecode/javacpp/Parser$Info;
    .end local v6           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    .end local v9           #out:Ljava/io/Writer;
    .local v4, i$:I
    :cond_5
    new-instance v9, Lcom/googlecode/javacpp/Parser$1;

    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Lcom/googlecode/javacpp/Parser$1;-><init>(Lcom/googlecode/javacpp/Parser;)V

    goto :goto_2

    .line 1476
    .local v4, i$:Ljava/util/Iterator;
    .restart local v6       #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    .restart local v9       #out:Ljava/io/Writer;
    :cond_6
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "{"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 1477
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "    static { Loader.load(); }"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 1478
    invoke-virtual {v6}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_7
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javacpp/Parser$Info;

    .line 1479
    .restart local v5       #info:Lcom/googlecode/javacpp/Parser$Info;
    iget-object v13, v5, Lcom/googlecode/javacpp/Parser$Info;->textAfter:Ljava/lang/String;

    if-eqz v13, :cond_7

    .line 1480
    iget-object v13, v5, Lcom/googlecode/javacpp/Parser$Info;->textAfter:Ljava/lang/String;

    const-string v14, "\n"

    invoke-virtual {v13, v14, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    goto :goto_4

    .line 1483
    .end local v5           #info:Lcom/googlecode/javacpp/Parser$Info;
    :cond_8
    :goto_5
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v13

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    sget-object v16, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v16, v14, v15

    invoke-virtual {v13, v14}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_9

    .line 1484
    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/googlecode/javacpp/Parser;->declaration(Ljava/lang/String;Lcom/googlecode/javacpp/Parser$TemplateMap;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "\n"

    invoke-virtual {v13, v14, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    goto :goto_5

    .line 1486
    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->commentBefore()Ljava/lang/String;

    move-result-object v2

    .line 1487
    .local v2, comment:Ljava/lang/String;
    if-eqz v2, :cond_a

    .line 1488
    const-string v13, "\n"

    invoke-virtual {v2, v13, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 1490
    :cond_a
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "}"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 1491
    invoke-virtual {v9}, Ljava/io/Writer;->close()V

    .line 1492
    return-void
.end method

.method public varargs parse(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .parameter "outputFilename"
    .parameter "inputFilenames"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 1431
    array-length v2, p2

    new-array v0, v2, [Ljava/io/File;

    .line 1432
    .local v0, files:[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 1433
    new-instance v2, Ljava/io/File;

    aget-object v3, p2, v1

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    .line 1432
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1435
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2, v0}, Lcom/googlecode/javacpp/Parser;->parse(Ljava/io/File;[Ljava/io/File;)V

    .line 1436
    return-void
.end method

.method template(Lcom/googlecode/javacpp/Parser$TemplateMap;)Lcom/googlecode/javacpp/Parser$TemplateMap;
    .locals 9
    .parameter "defaults"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    const/16 v8, 0x3e

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 478
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    new-array v3, v6, [Ljava/lang/Object;

    sget-object v4, Lcom/googlecode/javacpp/Parser$Token;->TEMPLATE:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 493
    .end local p1
    :goto_0
    return-object p1

    .line 481
    .restart local p1
    :cond_0
    new-instance v0, Lcom/googlecode/javacpp/Parser$TemplateMap;

    invoke-direct {v0, p1}, Lcom/googlecode/javacpp/Parser$TemplateMap;-><init>(Lcom/googlecode/javacpp/Parser$TemplateMap;)V

    .line 483
    .local v0, map:Lcom/googlecode/javacpp/Parser$TemplateMap;
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    new-array v3, v6, [Ljava/lang/Object;

    const/16 v4, 0x3c

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    .line 484
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    .local v1, token:Lcom/googlecode/javacpp/Parser$Token;
    :goto_1
    new-array v2, v6, [Ljava/lang/Object;

    sget-object v3, Lcom/googlecode/javacpp/Parser$Token;->EOF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v3, v2, v5

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 485
    new-array v2, v7, [Ljava/lang/Object;

    sget-object v3, Lcom/googlecode/javacpp/Parser$Token;->CLASS:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v3, v2, v5

    sget-object v3, Lcom/googlecode/javacpp/Parser$Token;->TYPENAME:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 486
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    iget-object v2, v2, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/googlecode/javacpp/Parser$TemplateMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 488
    :cond_1
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    new-array v3, v7, [Ljava/lang/Object;

    const/16 v4, 0x2c

    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v8}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Parser$Token;->expect([Ljava/lang/Object;)Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 489
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    :cond_2
    move-object p1, v0

    .line 493
    goto :goto_0

    .line 484
    :cond_3
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v1

    goto :goto_1
.end method

.method typedef()Ljava/lang/String;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 1173
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lcom/googlecode/javacpp/Parser$Token;->TYPEDEF:Lcom/googlecode/javacpp/Parser$Token;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1174
    const/4 v14, 0x0

    .line 1197
    :cond_0
    return-object v14

    .line 1176
    :cond_1
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v0

    iget-object v13, v0, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    .line 1177
    .local v13, spacing:Ljava/lang/String;
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/googlecode/javacpp/Parser;->declarator(Lcom/googlecode/javacpp/Parser$TemplateMap;Ljava/lang/String;IIZZ)Lcom/googlecode/javacpp/Parser$Declarator;

    move-result-object v8

    .line 1178
    .local v8, decl:Lcom/googlecode/javacpp/Parser$Declarator;
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    .line 1180
    iget-object v0, p0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    iget-object v1, v8, Lcom/googlecode/javacpp/Parser$Declarator;->cppType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v10

    .line 1181
    .local v10, infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    invoke-virtual {v10}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_4

    invoke-virtual {v10}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacpp/Parser$Info;

    invoke-virtual {v0}, Lcom/googlecode/javacpp/Parser$Info;->clone()Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v9

    .line 1182
    .local v9, info:Lcom/googlecode/javacpp/Parser$Info;
    :goto_0
    iget-object v0, p0, Lcom/googlecode/javacpp/Parser;->infoMap:Lcom/googlecode/javacpp/Parser$InfoMap;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, v8, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-virtual {v9, v1}, Lcom/googlecode/javacpp/Parser$Info;->cppNames([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    .line 1184
    const-string v14, ""

    .line 1185
    .local v14, text:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser;->commentAfter()Ljava/lang/String;

    move-result-object v7

    .line 1186
    .local v7, comment:Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 1187
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 1189
    :cond_2
    new-instance v12, Ljava/util/Scanner;

    iget-object v0, v8, Lcom/googlecode/javacpp/Parser$Declarator;->definitions:Ljava/lang/String;

    invoke-direct {v12, v0}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 1190
    .local v12, scanner:Ljava/util/Scanner;
    :cond_3
    :goto_1
    invoke-virtual {v12}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1191
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v12}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 1192
    const/16 v0, 0xa

    invoke-virtual {v13, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    .line 1193
    .local v11, newline:I
    if-lez v11, :cond_3

    .line 1194
    invoke-virtual {v13, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    goto :goto_1

    .line 1181
    .end local v7           #comment:Ljava/lang/String;
    .end local v9           #info:Lcom/googlecode/javacpp/Parser$Info;
    .end local v11           #newline:I
    .end local v12           #scanner:Ljava/util/Scanner;
    .end local v14           #text:Ljava/lang/String;
    :cond_4
    new-instance v9, Lcom/googlecode/javacpp/Parser$Info;

    invoke-direct {v9}, Lcom/googlecode/javacpp/Parser$Info;-><init>()V

    goto :goto_0
.end method

.method variable(Ljava/lang/String;)Ljava/lang/String;
    .locals 23
    .parameter "group"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/googlecode/javacpp/Parser$Exception;
        }
    .end annotation

    .prologue
    .line 936
    move-object/from16 v0, p0

    iget v10, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 937
    .local v10, backIndex:I
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    iget-object v0, v2, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object/from16 v20, v0

    .line 938
    .local v20, spacing:Ljava/lang/String;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v8}, Lcom/googlecode/javacpp/Parser;->declarator(Lcom/googlecode/javacpp/Parser$TemplateMap;Ljava/lang/String;IIZZ)Lcom/googlecode/javacpp/Parser$Declarator;

    move-result-object v12

    .line 939
    .local v12, decl:Lcom/googlecode/javacpp/Parser$Declarator;
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 940
    .local v16, name:Ljava/lang/String;
    if-eqz v16, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->getToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v2

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/16 v5, 0x5b

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const/16 v5, 0x3d

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const/16 v5, 0x2c

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const/16 v5, 0x3a

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const/16 v5, 0x3b

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Parser$Token;->match([Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 941
    :cond_0
    move-object/from16 v0, p0

    iput v10, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 942
    const/16 v22, 0x0

    .line 1004
    :cond_1
    return-object v22

    .line 945
    :cond_2
    const-string v22, ""

    .line 946
    .local v22, text:Ljava/lang/String;
    const-string v21, ""

    .line 947
    .local v21, statements:Ljava/lang/String;
    const-string v13, ""

    .line 948
    .local v13, definitions:Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, n:I
    :goto_0
    const v2, 0x7fffffff

    if-ge v6, v2, :cond_3

    .line 949
    move-object/from16 v0, p0

    iput v10, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 950
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v8}, Lcom/googlecode/javacpp/Parser;->declarator(Lcom/googlecode/javacpp/Parser$TemplateMap;Ljava/lang/String;IIZZ)Lcom/googlecode/javacpp/Parser$Declarator;

    move-result-object v12

    .line 951
    if-nez v12, :cond_6

    .line 984
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/googlecode/javacpp/Parser;->commentAfter()Ljava/lang/String;

    move-result-object v11

    .line 985
    .local v11, comment:Ljava/lang/String;
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_4

    .line 986
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 988
    :cond_4
    new-instance v18, Ljava/util/Scanner;

    move-object/from16 v0, v18

    invoke-direct {v0, v13}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 989
    .local v18, scanner:Ljava/util/Scanner;
    :cond_5
    :goto_1
    invoke-virtual/range {v18 .. v18}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 990
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {v18 .. v18}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 991
    const/16 v2, 0xa

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v17

    .line 992
    .local v17, newline:I
    if-lez v17, :cond_5

    .line 993
    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    goto :goto_1

    .line 954
    .end local v11           #comment:Ljava/lang/String;
    .end local v17           #newline:I
    .end local v18           #scanner:Ljava/util/Scanner;
    :cond_6
    if-eqz p1, :cond_7

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_a

    :cond_7
    const-string v9, "public static native "

    .line 955
    .local v9, access:Ljava/lang/String;
    :goto_2
    if-eqz p1, :cond_8

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_b

    :cond_8
    const-string v19, "void "

    .line 956
    .local v19, setterType:Ljava/lang/String;
    :goto_3
    iget-object v0, v12, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 957
    const-string v15, ""

    .line 958
    .local v15, indices:Ljava/lang/String;
    const/4 v14, 0x0

    .local v14, i:I
    :goto_4
    iget v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    if-ge v14, v2, :cond_c

    .line 959
    if-lez v14, :cond_9

    .line 960
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 962
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "int "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v3, v14, 0x69

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 958
    add-int/lit8 v14, v14, 0x1

    goto :goto_4

    .line 954
    .end local v9           #access:Ljava/lang/String;
    .end local v14           #i:I
    .end local v15           #indices:Ljava/lang/String;
    .end local v19           #setterType:Ljava/lang/String;
    :cond_a
    const-string v9, "public native "

    goto :goto_2

    .line 955
    .restart local v9       #access:Ljava/lang/String;
    :cond_b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    goto :goto_3

    .line 964
    .restart local v14       #i:I
    .restart local v15       #indices:Ljava/lang/String;
    .restart local v19       #setterType:Ljava/lang/String;
    :cond_c
    iget-boolean v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->constValue:Z

    if-eqz v2, :cond_d

    .line 965
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@MemberGetter "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 967
    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v12, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v12, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ");"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 968
    iget-boolean v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->constValue:Z

    if-nez v2, :cond_f

    .line 969
    iget v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    if-lez v2, :cond_e

    .line 970
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 972
    :cond_e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v12, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ");"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 974
    :cond_f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 975
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v12, Lcom/googlecode/javacpp/Parser$Declarator;->definitions:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 977
    iget v2, v12, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    if-lez v2, :cond_10

    .line 979
    move-object/from16 v0, p0

    iput v10, v0, Lcom/googlecode/javacpp/Parser;->tokenIndex:I

    .line 980
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, -0x1

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v8}, Lcom/googlecode/javacpp/Parser;->declarator(Lcom/googlecode/javacpp/Parser$TemplateMap;Ljava/lang/String;IIZZ)Lcom/googlecode/javacpp/Parser$Declarator;

    move-result-object v12

    .line 981
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@MemberGetter "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v12, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v12, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "();\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 948
    :cond_10
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 996
    .end local v9           #access:Ljava/lang/String;
    .end local v14           #i:I
    .end local v15           #indices:Ljava/lang/String;
    .end local v19           #setterType:Ljava/lang/String;
    .restart local v11       #comment:Ljava/lang/String;
    .restart local v18       #scanner:Ljava/util/Scanner;
    :cond_11
    new-instance v18, Ljava/util/Scanner;

    .end local v18           #scanner:Ljava/util/Scanner;
    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 997
    .restart local v18       #scanner:Ljava/util/Scanner;
    :cond_12
    :goto_5
    invoke-virtual/range {v18 .. v18}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 998
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {v18 .. v18}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 999
    const/16 v2, 0xa

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v17

    .line 1000
    .restart local v17       #newline:I
    if-lez v17, :cond_12

    .line 1001
    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    goto :goto_5
.end method
