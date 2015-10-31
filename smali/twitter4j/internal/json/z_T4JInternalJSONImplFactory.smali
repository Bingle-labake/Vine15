.class public Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;
.super Ljava/lang/Object;
.source "z_T4JInternalJSONImplFactory.java"

# interfaces
.implements Ltwitter4j/internal/json/z_T4JInternalFactory;


# static fields
.field private static final serialVersionUID:J = 0x4868b7d54ca3e042L


# instance fields
.field private conf:Ltwitter4j/conf/Configuration;


# direct methods
.method public constructor <init>(Ltwitter4j/conf/Configuration;)V
    .locals 0
    .parameter "conf"

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;->conf:Ltwitter4j/conf/Configuration;

    .line 40
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 316
    if-ne p0, p1, :cond_1

    .line 324
    :cond_0
    :goto_0
    return v1

    .line 317
    :cond_1
    instance-of v3, p1, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;

    if-nez v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 319
    check-cast v0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;

    .line 321
    .local v0, that:Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;
    iget-object v3, p0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;->conf:Ltwitter4j/conf/Configuration;

    if-eqz v3, :cond_3

    iget-object v3, p0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;->conf:Ltwitter4j/conf/Configuration;

    iget-object v4, v0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;->conf:Ltwitter4j/conf/Configuration;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 322
    goto :goto_0

    .line 321
    :cond_3
    iget-object v3, v0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;->conf:Ltwitter4j/conf/Configuration;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;->conf:Ltwitter4j/conf/Configuration;

    if-eqz v0, :cond_0

    iget-object v0, p0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;->conf:Ltwitter4j/conf/Configuration;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 334
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "JSONImplFactory{conf="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;->conf:Ltwitter4j/conf/Configuration;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
