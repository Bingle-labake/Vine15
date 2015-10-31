.class public abstract Lcom/google/gdata/util/common/base/UnicodeEscaper;
.super Ljava/lang/Object;
.source "UnicodeEscaper.java"

# interfaces
.implements Lcom/google/gdata/util/common/base/Escaper;


# static fields
.field private static final DEST_PAD:I = 0x20

.field private static final DEST_TL:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[C>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 453
    new-instance v0, Lcom/google/gdata/util/common/base/UnicodeEscaper$2;

    invoke-direct {v0}, Lcom/google/gdata/util/common/base/UnicodeEscaper$2;-><init>()V

    sput-object v0, Lcom/google/gdata/util/common/base/UnicodeEscaper;->DEST_TL:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static final codePointAt(Ljava/lang/CharSequence;II)I
    .locals 6
    .parameter "seq"
    .parameter "index"
    .parameter "end"

    .prologue
    .line 407
    if-ge p1, p2, :cond_5

    .line 408
    add-int/lit8 v2, p1, 0x1

    .end local p1
    .local v2, index:I
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 409
    .local v0, c1:C
    const v3, 0xd800

    if-lt v0, v3, :cond_0

    const v3, 0xdfff

    if-le v0, v3, :cond_1

    .line 421
    .end local v0           #c1:C
    :cond_0
    :goto_0
    return v0

    .line 413
    .restart local v0       #c1:C
    :cond_1
    const v3, 0xdbff

    if-gt v0, v3, :cond_4

    .line 415
    if-ne v2, p2, :cond_2

    .line 416
    neg-int v0, v0

    goto :goto_0

    .line 419
    :cond_2
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 420
    .local v1, c2:C
    invoke-static {v1}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 421
    invoke-static {v0, v1}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result v0

    goto :goto_0

    .line 423
    :cond_3
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected low surrogate but got char \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' with value "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " at index "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 427
    .end local v1           #c2:C
    :cond_4
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected low surrogate character \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' with value "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " at index "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v2, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 432
    .end local v0           #c1:C
    .end local v2           #index:I
    .restart local p1
    :cond_5
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    const-string v4, "Index exceeds specified range"

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static final growBuffer([CII)[C
    .locals 2
    .parameter "dest"
    .parameter "index"
    .parameter "size"

    .prologue
    const/4 v1, 0x0

    .line 441
    new-array v0, p2, [C

    .line 442
    .local v0, copy:[C
    if-lez p1, :cond_0

    .line 443
    invoke-static {p0, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 445
    :cond_0
    return-object v0
.end method


# virtual methods
.method public escape(Ljava/lang/Appendable;)Ljava/lang/Appendable;
    .locals 1
    .parameter "out"

    .prologue
    .line 255
    new-instance v0, Lcom/google/gdata/util/common/base/UnicodeEscaper$1;

    invoke-direct {v0, p0, p1}, Lcom/google/gdata/util/common/base/UnicodeEscaper$1;-><init>(Lcom/google/gdata/util/common/base/UnicodeEscaper;Ljava/lang/Appendable;)V

    return-object v0
.end method

.method public escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "string"

    .prologue
    .line 142
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 143
    .local v0, end:I
    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2, v0}, Lcom/google/gdata/util/common/base/UnicodeEscaper;->nextEscapeIndex(Ljava/lang/CharSequence;II)I

    move-result v1

    .line 144
    .local v1, index:I
    if-ne v1, v0, :cond_0

    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    invoke-virtual {p0, p1, v1}, Lcom/google/gdata/util/common/base/UnicodeEscaper;->escapeSlow(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method protected abstract escape(I)[C
.end method

.method protected final escapeSlow(Ljava/lang/String;I)Ljava/lang/String;
    .locals 13
    .parameter "s"
    .parameter "index"

    .prologue
    const/4 v12, 0x0

    .line 165
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 168
    .local v5, end:I
    sget-object v10, Lcom/google/gdata/util/common/base/UnicodeEscaper;->DEST_TL:Ljava/lang/ThreadLocal;

    invoke-virtual {v10}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [C

    .line 169
    .local v2, dest:[C
    const/4 v3, 0x0

    .line 170
    .local v3, destIndex:I
    const/4 v9, 0x0

    .line 172
    .local v9, unescapedChunkStart:I
    :goto_0
    if-ge p2, v5, :cond_5

    .line 173
    invoke-static {p1, p2, v5}, Lcom/google/gdata/util/common/base/UnicodeEscaper;->codePointAt(Ljava/lang/CharSequence;II)I

    move-result v1

    .line 174
    .local v1, cp:I
    if-gez v1, :cond_0

    .line 175
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "Trailing high surrogate at end of input"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 178
    :cond_0
    invoke-virtual {p0, v1}, Lcom/google/gdata/util/common/base/UnicodeEscaper;->escape(I)[C

    move-result-object v7

    .line 179
    .local v7, escaped:[C
    if-eqz v7, :cond_3

    .line 180
    sub-int v0, p2, v9

    .line 184
    .local v0, charsSkipped:I
    add-int v10, v3, v0

    array-length v11, v7

    add-int v8, v10, v11

    .line 185
    .local v8, sizeNeeded:I
    array-length v10, v2

    if-ge v10, v8, :cond_1

    .line 186
    sub-int v10, v5, p2

    add-int/2addr v10, v8

    add-int/lit8 v4, v10, 0x20

    .line 187
    .local v4, destLength:I
    invoke-static {v2, v3, v4}, Lcom/google/gdata/util/common/base/UnicodeEscaper;->growBuffer([CII)[C

    move-result-object v2

    .line 190
    .end local v4           #destLength:I
    :cond_1
    if-lez v0, :cond_2

    .line 191
    invoke-virtual {p1, v9, p2, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 192
    add-int/2addr v3, v0

    .line 194
    :cond_2
    array-length v10, v7

    if-lez v10, :cond_3

    .line 195
    array-length v10, v7

    invoke-static {v7, v12, v2, v3, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 196
    array-length v10, v7

    add-int/2addr v3, v10

    .line 199
    .end local v0           #charsSkipped:I
    .end local v8           #sizeNeeded:I
    :cond_3
    invoke-static {v1}, Ljava/lang/Character;->isSupplementaryCodePoint(I)Z

    move-result v10

    if-eqz v10, :cond_4

    const/4 v10, 0x2

    :goto_1
    add-int v9, p2, v10

    .line 201
    invoke-virtual {p0, p1, v9, v5}, Lcom/google/gdata/util/common/base/UnicodeEscaper;->nextEscapeIndex(Ljava/lang/CharSequence;II)I

    move-result p2

    .line 202
    goto :goto_0

    .line 199
    :cond_4
    const/4 v10, 0x1

    goto :goto_1

    .line 206
    .end local v1           #cp:I
    .end local v7           #escaped:[C
    :cond_5
    sub-int v0, v5, v9

    .line 207
    .restart local v0       #charsSkipped:I
    if-lez v0, :cond_7

    .line 208
    add-int v6, v3, v0

    .line 209
    .local v6, endIndex:I
    array-length v10, v2

    if-ge v10, v6, :cond_6

    .line 210
    invoke-static {v2, v3, v6}, Lcom/google/gdata/util/common/base/UnicodeEscaper;->growBuffer([CII)[C

    move-result-object v2

    .line 212
    :cond_6
    invoke-virtual {p1, v9, v5, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 213
    move v3, v6

    .line 215
    .end local v6           #endIndex:I
    :cond_7
    new-instance v10, Ljava/lang/String;

    invoke-direct {v10, v2, v12, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v10
.end method

.method protected nextEscapeIndex(Ljava/lang/CharSequence;II)I
    .locals 3
    .parameter "csq"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 107
    move v1, p2

    .line 108
    .local v1, index:I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 109
    invoke-static {p1, v1, p3}, Lcom/google/gdata/util/common/base/UnicodeEscaper;->codePointAt(Ljava/lang/CharSequence;II)I

    move-result v0

    .line 110
    .local v0, cp:I
    if-ltz v0, :cond_0

    invoke-virtual {p0, v0}, Lcom/google/gdata/util/common/base/UnicodeEscaper;->escape(I)[C

    move-result-object v2

    if-eqz v2, :cond_1

    .line 115
    .end local v0           #cp:I
    :cond_0
    return v1

    .line 113
    .restart local v0       #cp:I
    :cond_1
    invoke-static {v0}, Ljava/lang/Character;->isSupplementaryCodePoint(I)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v2, 0x2

    :goto_1
    add-int/2addr v1, v2

    .line 114
    goto :goto_0

    .line 113
    :cond_2
    const/4 v2, 0x1

    goto :goto_1
.end method
