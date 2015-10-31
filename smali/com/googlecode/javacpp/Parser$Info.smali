.class public Lcom/googlecode/javacpp/Parser$Info;
.super Ljava/lang/Object;
.source "Parser.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacpp/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Info"
.end annotation


# instance fields
.field annotations:[Ljava/lang/String;

.field cast:Z

.field complex:Z

.field cppNames:[Ljava/lang/String;

.field define:Z

.field forwardDeclared:Z

.field genericTypes:[Ljava/lang/String;

.field javaNames:[Ljava/lang/String;

.field pointerTypes:[Ljava/lang/String;

.field primitiveTypes:[Ljava/lang/String;

.field textAfter:Ljava/lang/String;

.field textBefore:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->annotations:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    .line 49
    iput-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->cast:Z

    iput-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->define:Z

    iput-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->complex:Z

    iput-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->forwardDeclared:Z

    .line 50
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->textBefore:Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->textAfter:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/String;)V
    .locals 2
    .parameter "cppNames"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->annotations:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    .line 49
    iput-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->cast:Z

    iput-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->define:Z

    iput-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->complex:Z

    iput-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->forwardDeclared:Z

    .line 50
    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->textBefore:Ljava/lang/String;

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Info;->textAfter:Ljava/lang/String;

    .line 45
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public varargs annotations([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "annotations"

    .prologue
    .line 54
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Info;->annotations:[Ljava/lang/String;

    return-object p0
.end method

.method public cast(Z)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "cast"

    .prologue
    .line 58
    iput-boolean p1, p0, Lcom/googlecode/javacpp/Parser$Info;->cast:Z

    return-object p0
.end method

.method public clone()Lcom/googlecode/javacpp/Parser$Info;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 66
    new-instance v0, Lcom/googlecode/javacpp/Parser$Info;

    invoke-direct {v0}, Lcom/googlecode/javacpp/Parser$Info;-><init>()V

    .line 67
    .local v0, i:Lcom/googlecode/javacpp/Parser$Info;
    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    invoke-virtual {v1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    :goto_0
    iput-object v1, v0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    .line 68
    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    invoke-virtual {v1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    :goto_1
    iput-object v1, v0, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    .line 69
    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->annotations:[Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->annotations:[Ljava/lang/String;

    invoke-virtual {v1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    :goto_2
    iput-object v1, v0, Lcom/googlecode/javacpp/Parser$Info;->annotations:[Ljava/lang/String;

    .line 70
    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes:[Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes:[Ljava/lang/String;

    invoke-virtual {v1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    :goto_3
    iput-object v1, v0, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes:[Ljava/lang/String;

    .line 71
    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    invoke-virtual {v1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    :goto_4
    iput-object v1, v0, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    .line 72
    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    invoke-virtual {v1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    :goto_5
    iput-object v1, v0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    .line 73
    iget-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->cast:Z

    iput-boolean v1, v0, Lcom/googlecode/javacpp/Parser$Info;->cast:Z

    .line 74
    iget-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->define:Z

    iput-boolean v1, v0, Lcom/googlecode/javacpp/Parser$Info;->define:Z

    .line 75
    iget-boolean v1, p0, Lcom/googlecode/javacpp/Parser$Info;->forwardDeclared:Z

    iput-boolean v1, v0, Lcom/googlecode/javacpp/Parser$Info;->forwardDeclared:Z

    .line 76
    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->textBefore:Ljava/lang/String;

    iput-object v1, v0, Lcom/googlecode/javacpp/Parser$Info;->textBefore:Ljava/lang/String;

    .line 77
    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$Info;->textAfter:Ljava/lang/String;

    iput-object v1, v0, Lcom/googlecode/javacpp/Parser$Info;->textAfter:Ljava/lang/String;

    .line 78
    return-object v0

    :cond_0
    move-object v1, v2

    .line 67
    goto :goto_0

    :cond_1
    move-object v1, v2

    .line 68
    goto :goto_1

    :cond_2
    move-object v1, v2

    .line 69
    goto :goto_2

    :cond_3
    move-object v1, v2

    .line 70
    goto :goto_3

    :cond_4
    move-object v1, v2

    .line 71
    goto :goto_4

    :cond_5
    move-object v1, v2

    .line 72
    goto :goto_5
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/googlecode/javacpp/Parser$Info;->clone()Lcom/googlecode/javacpp/Parser$Info;

    move-result-object v0

    return-object v0
.end method

.method public complex(Z)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "complex"

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/googlecode/javacpp/Parser$Info;->complex:Z

    return-object p0
.end method

.method public varargs cppNames([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "cppNames"

    .prologue
    .line 52
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Info;->cppNames:[Ljava/lang/String;

    return-object p0
.end method

.method public define(Z)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "define"

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/googlecode/javacpp/Parser$Info;->define:Z

    return-object p0
.end method

.method public forwardDeclared(Z)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "forwardDeclared"

    .prologue
    .line 61
    iput-boolean p1, p0, Lcom/googlecode/javacpp/Parser$Info;->forwardDeclared:Z

    return-object p0
.end method

.method public varargs genericTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "genericTypes"

    .prologue
    .line 57
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Info;->genericTypes:[Ljava/lang/String;

    return-object p0
.end method

.method public varargs javaNames([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "javaNames"

    .prologue
    .line 53
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Info;->javaNames:[Ljava/lang/String;

    return-object p0
.end method

.method public varargs pointerTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "pointerTypes"

    .prologue
    .line 56
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Info;->pointerTypes:[Ljava/lang/String;

    return-object p0
.end method

.method public varargs primitiveTypes([Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "primitiveTypes"

    .prologue
    .line 55
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Info;->primitiveTypes:[Ljava/lang/String;

    return-object p0
.end method

.method public textAfter(Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "textAfter"

    .prologue
    .line 63
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Info;->textAfter:Ljava/lang/String;

    return-object p0
.end method

.method public textBefore(Ljava/lang/String;)Lcom/googlecode/javacpp/Parser$Info;
    .locals 0
    .parameter "textBefore"

    .prologue
    .line 62
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$Info;->textBefore:Ljava/lang/String;

    return-object p0
.end method
