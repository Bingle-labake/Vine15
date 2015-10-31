.class Lcom/googlecode/javacpp/Parser$Declarator;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacpp/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Declarator"
.end annotation


# instance fields
.field annotations:Ljava/lang/String;

.field constPointer:Z

.field constValue:Z

.field convention:Ljava/lang/String;

.field cppType:Ljava/lang/String;

.field definitions:Ljava/lang/String;

.field indices:I

.field infoNumber:I

.field javaType:Ljava/lang/String;

.field objectName:Ljava/lang/String;

.field parameters:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 497
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 498
    iput v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->infoNumber:I

    iput v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->indices:I

    .line 499
    iput-boolean v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->constValue:Z

    iput-boolean v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->constPointer:Z

    .line 500
    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->annotations:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->cppType:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->javaType:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->objectName:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->convention:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->definitions:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Declarator;->parameters:Ljava/lang/String;

    return-void
.end method
