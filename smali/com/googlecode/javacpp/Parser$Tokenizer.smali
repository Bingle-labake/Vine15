.class Lcom/googlecode/javacpp/Parser$Tokenizer;
.super Ljava/lang/Object;
.source "Parser.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacpp/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Tokenizer"
.end annotation


# instance fields
.field buffer:Ljava/lang/StringBuilder;

.field file:Ljava/io/File;

.field lastChar:I

.field lineNumber:I

.field lineSeparator:Ljava/lang/String;

.field reader:Ljava/io/Reader;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .locals 2
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 294
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 299
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->file:Ljava/io/File;

    .line 300
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->reader:Ljava/io/Reader;

    .line 301
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineSeparator:Ljava/lang/String;

    .line 302
    const/4 v0, -0x1

    iput v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineNumber:I

    .line 303
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    .line 295
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->file:Ljava/io/File;

    .line 296
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->reader:Ljava/io/Reader;

    .line 297
    return-void
.end method

.method constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .parameter "reader"

    .prologue
    const/4 v0, 0x0

    .line 291
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 299
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->file:Ljava/io/File;

    .line 300
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->reader:Ljava/io/Reader;

    .line 301
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineSeparator:Ljava/lang/String;

    .line 302
    const/4 v0, -0x1

    iput v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineNumber:I

    .line 303
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    .line 292
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->reader:Ljava/io/Reader;

    .line 293
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 306
    iget-object v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->reader:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 307
    return-void
.end method

.method public nextToken()Lcom/googlecode/javacpp/Parser$Token;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const/16 v11, 0x2e

    const/16 v10, 0x22

    const/4 v9, -0x1

    const/16 v8, 0x2f

    .line 332
    new-instance v4, Lcom/googlecode/javacpp/Parser$Token;

    invoke-direct {v4}, Lcom/googlecode/javacpp/Parser$Token;-><init>()V

    .line 333
    .local v4, token:Lcom/googlecode/javacpp/Parser$Token;
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->readChar()I

    move-result v0

    .line 335
    .local v0, c:I
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 336
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 337
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    int-to-char v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 338
    :goto_0
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->readChar()I

    move-result v0

    if-eq v0, v9, :cond_0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 339
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    int-to-char v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 342
    :cond_0
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->file:Ljava/io/File;

    iput-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->file:Ljava/io/File;

    .line 343
    iget v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineNumber:I

    iput v6, v4, Lcom/googlecode/javacpp/Parser$Token;->lineNumber:I

    .line 344
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    .line 346
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 347
    invoke-static {v0}, Ljava/lang/Character;->isLetter(I)Z

    move-result v6

    if-nez v6, :cond_1

    const/16 v6, 0x5f

    if-ne v0, v6, :cond_4

    .line 348
    :cond_1
    const/4 v6, 0x5

    iput v6, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 349
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    int-to-char v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 350
    :goto_1
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->readChar()I

    move-result v0

    if-eq v0, v9, :cond_3

    invoke-static {v0}, Ljava/lang/Character;->isDigit(I)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-static {v0}, Ljava/lang/Character;->isLetter(I)Z

    move-result v6

    if-nez v6, :cond_2

    const/16 v6, 0x5f

    if-ne v0, v6, :cond_3

    .line 351
    :cond_2
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    int-to-char v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 353
    :cond_3
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 354
    iput v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    :goto_2
    move-object v5, v4

    .line 428
    .end local v4           #token:Lcom/googlecode/javacpp/Parser$Token;
    .local v5, token:Ljava/lang/Object;
    :goto_3
    return-object v5

    .line 355
    .end local v5           #token:Ljava/lang/Object;
    .restart local v4       #token:Lcom/googlecode/javacpp/Parser$Token;
    :cond_4
    invoke-static {v0}, Ljava/lang/Character;->isDigit(I)Z

    move-result v6

    if-nez v6, :cond_5

    if-eq v0, v11, :cond_5

    const/16 v6, 0x2d

    if-eq v0, v6, :cond_5

    const/16 v6, 0x2b

    if-ne v0, v6, :cond_10

    .line 356
    :cond_5
    if-ne v0, v11, :cond_b

    const/4 v6, 0x2

    :goto_4
    iput v6, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 357
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    int-to-char v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 358
    const/4 v2, 0x0

    .line 359
    .local v2, prevc:I
    :goto_5
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->readChar()I

    move-result v0

    if-eq v0, v9, :cond_c

    invoke-static {v0}, Ljava/lang/Character;->isDigit(I)Z

    move-result v6

    if-nez v6, :cond_8

    if-eq v0, v11, :cond_8

    const/16 v6, 0x2d

    if-eq v0, v6, :cond_8

    const/16 v6, 0x2b

    if-eq v0, v6, :cond_8

    const/16 v6, 0x61

    if-lt v0, v6, :cond_6

    const/16 v6, 0x66

    if-le v0, v6, :cond_8

    :cond_6
    const/16 v6, 0x6c

    if-eq v0, v6, :cond_8

    const/16 v6, 0x75

    if-eq v0, v6, :cond_8

    const/16 v6, 0x78

    if-eq v0, v6, :cond_8

    const/16 v6, 0x41

    if-lt v0, v6, :cond_7

    const/16 v6, 0x46

    if-le v0, v6, :cond_8

    :cond_7
    const/16 v6, 0x4c

    if-eq v0, v6, :cond_8

    const/16 v6, 0x55

    if-eq v0, v6, :cond_8

    const/16 v6, 0x58

    if-ne v0, v6, :cond_c

    .line 362
    :cond_8
    if-ne v0, v11, :cond_9

    .line 363
    const/4 v6, 0x2

    iput v6, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 365
    :cond_9
    const/16 v6, 0x75

    if-eq v0, v6, :cond_a

    const/16 v6, 0x55

    if-eq v0, v6, :cond_a

    .line 366
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    int-to-char v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 368
    :cond_a
    move v2, v0

    goto :goto_5

    .line 356
    .end local v2           #prevc:I
    :cond_b
    const/4 v6, 0x1

    goto :goto_4

    .line 370
    .restart local v2       #prevc:I
    :cond_c
    const/16 v6, 0x66

    if-eq v2, v6, :cond_d

    const/16 v6, 0x46

    if-ne v2, v6, :cond_e

    .line 371
    :cond_d
    const/4 v6, 0x2

    iput v6, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 373
    :cond_e
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 374
    iget v6, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_f

    iget-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    const-string v7, "LL"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_f

    .line 375
    iget-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    iget-object v7, v4, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v12, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 377
    :cond_f
    iput v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    goto/16 :goto_2

    .line 378
    .end local v2           #prevc:I
    :cond_10
    if-ne v0, v10, :cond_13

    .line 379
    const/4 v6, 0x3

    iput v6, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 380
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 381
    const/4 v2, 0x0

    .line 382
    .restart local v2       #prevc:I
    :goto_6
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->readChar()I

    move-result v0

    if-eq v0, v9, :cond_12

    const/16 v6, 0x5c

    if-eq v2, v6, :cond_11

    if-eq v0, v10, :cond_12

    .line 383
    :cond_11
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    int-to-char v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 384
    move v2, v0

    goto :goto_6

    .line 386
    :cond_12
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 387
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    goto/16 :goto_2

    .line 388
    .end local v2           #prevc:I
    :cond_13
    if-ne v0, v8, :cond_1a

    .line 389
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->readChar()I

    move-result v0

    .line 390
    if-ne v0, v8, :cond_16

    .line 391
    const/4 v6, 0x4

    iput v6, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 392
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 393
    const/4 v2, 0x0

    .line 394
    .restart local v2       #prevc:I
    :goto_7
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->readChar()I

    move-result v0

    if-eq v0, v9, :cond_15

    const/16 v6, 0x5c

    if-eq v2, v6, :cond_14

    const/16 v6, 0xa

    if-eq v0, v6, :cond_15

    .line 395
    :cond_14
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    int-to-char v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 396
    move v2, v0

    goto :goto_7

    .line 398
    :cond_15
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    .line 399
    iput v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    goto/16 :goto_2

    .line 400
    .end local v2           #prevc:I
    :cond_16
    const/16 v6, 0x2a

    if-ne v0, v6, :cond_19

    .line 401
    const/4 v6, 0x4

    iput v6, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    .line 402
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x2a

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 403
    const/4 v2, 0x0

    .line 404
    .restart local v2       #prevc:I
    :goto_8
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->readChar()I

    move-result v0

    if-eq v0, v9, :cond_18

    const/16 v6, 0x2a

    if-ne v2, v6, :cond_17

    if-eq v0, v8, :cond_18

    .line 405
    :cond_17
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    int-to-char v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 406
    move v2, v0

    goto :goto_8

    .line 408
    :cond_18
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 409
    iget-object v6, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->buffer:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    goto/16 :goto_2

    .line 411
    .end local v2           #prevc:I
    :cond_19
    iput v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    .line 412
    iput v8, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    goto/16 :goto_2

    .line 415
    :cond_1a
    const/16 v6, 0x5c

    if-ne v0, v6, :cond_1c

    .line 416
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->readChar()I

    move-result v1

    .line 417
    .local v1, c2:I
    const/16 v6, 0xa

    if-ne v1, v6, :cond_1b

    .line 418
    iget-object v3, v4, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    .line 419
    .local v3, s:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Tokenizer;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v4

    .line 420
    iput-object v3, v4, Lcom/googlecode/javacpp/Parser$Token;->spacing:Ljava/lang/String;

    move-object v5, v4

    .line 421
    .restart local v5       #token:Ljava/lang/Object;
    goto/16 :goto_3

    .line 423
    .end local v3           #s:Ljava/lang/String;
    .end local v5           #token:Ljava/lang/Object;
    :cond_1b
    iput v1, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    .line 426
    .end local v1           #c2:I
    :cond_1c
    iput v0, v4, Lcom/googlecode/javacpp/Parser$Token;->type:I

    goto/16 :goto_2
.end method

.method readChar()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0xa

    const/4 v2, -0x1

    const/16 v4, 0xd

    .line 310
    iget v3, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    if-eq v3, v2, :cond_0

    .line 311
    iget v0, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    .line 312
    .local v0, c:I
    iput v2, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    move v1, v0

    .line 328
    .end local v0           #c:I
    .local v1, c:I
    :goto_0
    return v1

    .line 315
    .end local v1           #c:I
    :cond_0
    iget-object v3, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->reader:Ljava/io/Reader;

    invoke-virtual {v3}, Ljava/io/Reader;->read()I

    move-result v0

    .line 316
    .restart local v0       #c:I
    if-eq v0, v4, :cond_1

    if-ne v0, v5, :cond_5

    .line 317
    :cond_1
    iget v3, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineNumber:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineNumber:I

    .line 318
    if-ne v0, v4, :cond_2

    iget-object v3, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->reader:Ljava/io/Reader;

    invoke-virtual {v3}, Ljava/io/Reader;->read()I

    move-result v2

    .line 319
    .local v2, c2:I
    :cond_2
    iget-object v3, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineSeparator:Ljava/lang/String;

    if-nez v3, :cond_3

    .line 320
    if-ne v0, v4, :cond_6

    if-ne v2, v5, :cond_6

    const-string v3, "\r\n"

    :goto_1
    iput-object v3, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lineSeparator:Ljava/lang/String;

    .line 323
    :cond_3
    if-eq v2, v5, :cond_4

    .line 324
    iput v2, p0, Lcom/googlecode/javacpp/Parser$Tokenizer;->lastChar:I

    .line 326
    :cond_4
    const/16 v0, 0xa

    .end local v2           #c2:I
    :cond_5
    move v1, v0

    .line 328
    .end local v0           #c:I
    .restart local v1       #c:I
    goto :goto_0

    .line 320
    .end local v1           #c:I
    .restart local v0       #c:I
    .restart local v2       #c2:I
    :cond_6
    if-ne v0, v4, :cond_7

    const-string v3, "\r"

    goto :goto_1

    :cond_7
    const-string v3, "\n"

    goto :goto_1
.end method
