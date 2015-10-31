.class Lcom/googlecode/javacpp/Parser$TemplateMap;
.super Ljava/util/LinkedHashMap;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacpp/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TemplateMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field defaults:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/googlecode/javacpp/Parser$TemplateMap;)V
    .locals 1
    .parameter "defaults"

    .prologue
    .line 462
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 465
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/googlecode/javacpp/Parser$TemplateMap;->defaults:Ljava/util/LinkedHashMap;

    .line 463
    iput-object p1, p0, Lcom/googlecode/javacpp/Parser$TemplateMap;->defaults:Ljava/util/LinkedHashMap;

    .line 464
    return-void
.end method


# virtual methods
.method get(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "key"

    .prologue
    .line 468
    invoke-super {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 469
    .local v0, value:Ljava/lang/String;
    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$TemplateMap;->defaults:Ljava/util/LinkedHashMap;

    if-eqz v1, :cond_0

    .line 470
    iget-object v1, p0, Lcom/googlecode/javacpp/Parser$TemplateMap;->defaults:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 472
    :goto_0
    return-object v1

    :cond_0
    move-object v1, v0

    goto :goto_0
.end method
