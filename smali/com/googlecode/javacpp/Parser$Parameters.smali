.class Lcom/googlecode/javacpp/Parser$Parameters;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacpp/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Parameters"
.end annotation


# instance fields
.field definitions:Ljava/lang/String;

.field infoNumber:I

.field list:Ljava/lang/String;

.field signature:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 802
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 803
    const/4 v0, 0x0

    iput v0, p0, Lcom/googlecode/javacpp/Parser$Parameters;->infoNumber:I

    .line 804
    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Parameters;->list:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Parameters;->definitions:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$Parameters;->signature:Ljava/lang/String;

    return-void
.end method
