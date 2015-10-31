.class public Lcom/googlecode/javacpp/Parser$InfoMap;
.super Ljava/util/HashMap;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacpp/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InfoMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/util/LinkedList",
        "<",
        "Lcom/googlecode/javacpp/Parser$Info;",
        ">;>;"
    }
.end annotation


# static fields
.field static final defaults:Lcom/googlecode/javacpp/Parser$InfoMap;


# instance fields
.field parent:Lcom/googlecode/javacpp/Parser$InfoMap;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 87
    new-instance v0, Lcom/googlecode/javacpp/Parser$InfoMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;-><init>(Lcom/googlecode/javacpp/Parser$InfoMap;)V

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "void"

    aput-object v3, v2, v6

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "void"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "Pointer"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "FILE"

    aput-object v3, v2, v6

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "Pointer"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "va_list"

    aput-object v3, v2, v6

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "Pointer"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "int8_t"

    aput-object v3, v2, v6

    const-string v3, "jbyte"

    aput-object v3, v2, v5

    const-string v3, "signed char"

    aput-object v3, v2, v7

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "byte"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "BytePointer"

    aput-object v3, v2, v6

    const-string v3, "ByteBuffer"

    aput-object v3, v2, v5

    const-string v3, "byte[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "uint8_t"

    aput-object v3, v2, v6

    const-string v3, "char"

    aput-object v3, v2, v5

    const-string v3, "unsigned char"

    aput-object v3, v2, v7

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "byte"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "BytePointer"

    aput-object v3, v2, v6

    const-string v3, "ByteBuffer"

    aput-object v3, v2, v5

    const-string v3, "byte[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "int16_t"

    aput-object v3, v2, v6

    const-string v3, "jshort"

    aput-object v3, v2, v5

    const-string v3, "short"

    aput-object v3, v2, v7

    const-string v3, "signed short"

    aput-object v3, v2, v8

    const-string v3, "short int"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "signed short int"

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "short"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "ShortPointer"

    aput-object v3, v2, v6

    const-string v3, "ShortBuffer"

    aput-object v3, v2, v5

    const-string v3, "short[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "uint16_t"

    aput-object v3, v2, v6

    const-string v3, "unsigned short"

    aput-object v3, v2, v5

    const-string v3, "unsigned short int"

    aput-object v3, v2, v7

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "short"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "ShortPointer"

    aput-object v3, v2, v6

    const-string v3, "ShortBuffer"

    aput-object v3, v2, v5

    const-string v3, "short[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "int32_t"

    aput-object v3, v2, v6

    const-string v3, "jint"

    aput-object v3, v2, v5

    const-string v3, "int"

    aput-object v3, v2, v7

    const-string v3, "signed int"

    aput-object v3, v2, v8

    const-string v3, "signed"

    aput-object v3, v2, v9

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "int"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "IntPointer"

    aput-object v3, v2, v6

    const-string v3, "IntBuffer"

    aput-object v3, v2, v5

    const-string v3, "int[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "uint32_t"

    aput-object v3, v2, v6

    const-string v3, "unsigned int"

    aput-object v3, v2, v5

    const-string v3, "unsigned"

    aput-object v3, v2, v7

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "int"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "IntPointer"

    aput-object v3, v2, v6

    const-string v3, "IntBuffer"

    aput-object v3, v2, v5

    const-string v3, "int[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "int64_t"

    aput-object v3, v2, v6

    const-string v3, "__int64"

    aput-object v3, v2, v5

    const-string v3, "jlong"

    aput-object v3, v2, v7

    const-string v3, "long long"

    aput-object v3, v2, v8

    const-string v3, "signed long long"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "long long int"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "signed long long int"

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "long"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "LongPointer"

    aput-object v3, v2, v6

    const-string v3, "LongBuffer"

    aput-object v3, v2, v5

    const-string v3, "long[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "uint64_t"

    aput-object v3, v2, v6

    const-string v3, "__uint64"

    aput-object v3, v2, v5

    const-string v3, "unsigned long long"

    aput-object v3, v2, v7

    const-string v3, "unsigned long long int"

    aput-object v3, v2, v8

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "long"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "LongPointer"

    aput-object v3, v2, v6

    const-string v3, "LongBuffer"

    aput-object v3, v2, v5

    const-string v3, "long[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "long"

    aput-object v3, v2, v6

    const-string v3, "signed long"

    aput-object v3, v2, v5

    const-string v3, "long int"

    aput-object v3, v2, v7

    const-string v3, "signed long int"

    aput-object v3, v2, v8

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "long"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "CLongPointer"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "unsigned long"

    aput-object v3, v2, v6

    const-string v3, "unsigned long int"

    aput-object v3, v2, v5

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "long"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "CLongPointer"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "size_t"

    aput-object v3, v2, v6

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "long"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "SizeTPointer"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "float"

    aput-object v3, v2, v6

    const-string v3, "jfloat"

    aput-object v3, v2, v5

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "float"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "FloatPointer"

    aput-object v3, v2, v6

    const-string v3, "FloatBuffer"

    aput-object v3, v2, v5

    const-string v3, "float[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "double"

    aput-object v3, v2, v6

    const-string v3, "jdouble"

    aput-object v3, v2, v5

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "double"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "DoublePointer"

    aput-object v3, v2, v6

    const-string v3, "DoubleBuffer"

    aput-object v3, v2, v5

    const-string v3, "double[]"

    aput-object v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "bool"

    aput-object v3, v2, v6

    const-string v3, "jboolean"

    aput-object v3, v2, v5

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "boolean"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BoolPointer"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/googlecode/javacpp/Parser$Info;->cast(Z)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "const char"

    aput-object v3, v2, v6

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "byte"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "@Cast(\"const char*\") BytePointer"

    aput-object v3, v2, v6

    const-string v3, "String"

    aput-object v3, v2, v5

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "position"

    aput-object v3, v2, v6

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "_position"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->javaNames([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "limit"

    aput-object v3, v2, v6

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "_limit"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->javaNames([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    new-instance v1, Lcom/googlecode/javacpp/Parser$Info;

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "capacity"

    aput-object v3, v2, v6

    invoke-direct {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;-><init>([Ljava/lang/String;)V

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "_capacity"

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/googlecode/javacpp/Parser$Info;->javaNames([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Parser$InfoMap;->put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;

    move-result-object v0

    sput-object v0, Lcom/googlecode/javacpp/Parser$InfoMap;->defaults:Lcom/googlecode/javacpp/Parser$InfoMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 86
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$InfoMap;->parent:Lcom/googlecode/javacpp/Parser$InfoMap;

    .line 83
    sget-object v0, Lcom/googlecode/javacpp/Parser$InfoMap;->defaults:Lcom/googlecode/javacpp/Parser$InfoMap;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$InfoMap;->parent:Lcom/googlecode/javacpp/Parser$InfoMap;

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Parser$InfoMap;)V
    .locals 1
    .parameter "parent"

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 86
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$InfoMap;->parent:Lcom/googlecode/javacpp/Parser$InfoMap;

    .line 84
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$InfoMap;->parent:Lcom/googlecode/javacpp/Parser$InfoMap;

    return-void
.end method

.method static sort(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "name"

    .prologue
    .line 128
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/googlecode/javacpp/Parser$InfoMap;->sort(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static sort(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 9
    .parameter "name"
    .parameter "unconst"

    .prologue
    .line 131
    if-nez p0, :cond_0

    .line 132
    const/4 v7, 0x0

    .line 156
    :goto_0
    return-object v7

    .line 134
    :cond_0
    new-instance v4, Ljava/util/TreeSet;

    invoke-direct {v4}, Ljava/util/TreeSet;-><init>()V

    .line 136
    .local v4, set:Ljava/util/TreeSet;,"Ljava/util/TreeSet<Ljava/lang/String;>;"
    :try_start_0
    new-instance v6, Lcom/googlecode/javacpp/Parser$Tokenizer;

    new-instance v7, Ljava/io/StringReader;

    invoke-direct {v7, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7}, Lcom/googlecode/javacpp/Parser$Tokenizer;-><init>(Ljava/io/Reader;)V

    .line 138
    .local v6, tokenizer:Lcom/googlecode/javacpp/Parser$Tokenizer;
    :goto_1
    invoke-virtual {v6}, Lcom/googlecode/javacpp/Parser$Tokenizer;->nextToken()Lcom/googlecode/javacpp/Parser$Token;

    move-result-object v5

    .local v5, token:Lcom/googlecode/javacpp/Parser$Token;
    invoke-virtual {v5}, Lcom/googlecode/javacpp/Parser$Token;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1

    .line 139
    iget-object v7, v5, Lcom/googlecode/javacpp/Parser$Token;->value:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 141
    .end local v5           #token:Lcom/googlecode/javacpp/Parser$Token;
    .end local v6           #tokenizer:Lcom/googlecode/javacpp/Parser$Tokenizer;
    :catch_0
    move-exception v0

    .line 142
    .local v0, ex:Ljava/io/IOException;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 144
    .end local v0           #ex:Ljava/io/IOException;
    .restart local v5       #token:Lcom/googlecode/javacpp/Parser$Token;
    .restart local v6       #tokenizer:Lcom/googlecode/javacpp/Parser$Tokenizer;
    :cond_1
    const/4 v1, 0x0

    .line 145
    .local v1, foundConst:Z
    const-string p0, ""

    .line 146
    invoke-virtual {v4}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 147
    .local v3, s:Ljava/lang/String;
    const-string v7, "const"

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 148
    const/4 v1, 0x1

    goto :goto_2

    .line 150
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_2

    .line 153
    .end local v3           #s:Ljava/lang/String;
    :cond_3
    if-nez p1, :cond_4

    if-eqz v1, :cond_4

    .line 154
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "const "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 156
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/util/LinkedList;
    .locals 3
    .parameter "cppName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/googlecode/javacpp/Parser$Info;",
            ">;"
        }
    .end annotation

    .prologue
    .line 161
    const/4 v2, 0x0

    invoke-static {p1, v2}, Lcom/googlecode/javacpp/Parser$InfoMap;->sort(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, key:Ljava/lang/String;
    invoke-super {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    .line 163
    .local v0, infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    if-nez v0, :cond_0

    .line 164
    const/4 v2, 0x1

    invoke-static {p1, v2}, Lcom/googlecode/javacpp/Parser$InfoMap;->sort(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 165
    invoke-super {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    check-cast v0, Ljava/util/LinkedList;

    .line 167
    .restart local v0       #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    :cond_0
    if-nez v0, :cond_1

    iget-object v2, p0, Lcom/googlecode/javacpp/Parser$InfoMap;->parent:Lcom/googlecode/javacpp/Parser$InfoMap;

    if-eqz v2, :cond_1

    .line 168
    iget-object v2, p0, Lcom/googlecode/javacpp/Parser$InfoMap;->parent:Lcom/googlecode/javacpp/Parser$InfoMap;

    invoke-virtual {v2, p1}, Lcom/googlecode/javacpp/Parser$InfoMap;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v0

    .line 170
    :cond_1
    if-nez v0, :cond_2

    .line 171
    new-instance v0, Ljava/util/LinkedList;

    .end local v0           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 173
    .restart local v0       #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    :cond_2
    return-object v0
.end method

.method public put(Lcom/googlecode/javacpp/Parser$Info;)Lcom/googlecode/javacpp/Parser$InfoMap;
    .locals 8
    .parameter "info"

    .prologue
    const/4 v7, 0x0

    .line 177
    iget-object v6, p1, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    if-eqz v6, :cond_2

    iget-object v0, p1, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    .local v0, arr$:[Ljava/lang/String;
    :goto_0
    array-length v5, v0

    .local v5, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v5, :cond_3

    aget-object v1, v0, v2

    .line 178
    .local v1, cppName:Ljava/lang/String;
    invoke-static {v1, v7}, Lcom/googlecode/javacpp/Parser$InfoMap;->sort(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 179
    .local v4, key:Ljava/lang/String;
    invoke-super {p0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/LinkedList;

    .line 180
    .local v3, infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    if-nez v3, :cond_0

    .line 181
    new-instance v3, Ljava/util/LinkedList;

    .end local v3           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 183
    .restart local v3       #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    :cond_0
    invoke-virtual {v3, p1}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 184
    invoke-virtual {v3, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 186
    :cond_1
    invoke-super {p0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #cppName:Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #infoList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Lcom/googlecode/javacpp/Parser$Info;>;"
    .end local v4           #key:Ljava/lang/String;
    .end local v5           #len$:I
    :cond_2
    const/4 v6, 0x1

    new-array v0, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v6, v0, v7

    goto :goto_0

    .line 188
    .restart local v0       #arr$:[Ljava/lang/String;
    .restart local v2       #i$:I
    .restart local v5       #len$:I
    :cond_3
    return-object p0
.end method
