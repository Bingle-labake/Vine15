.class public Lco/vine/android/util/PlayerUtil;
.super Ljava/lang/Object;
.source "PlayerUtil.java"


# static fields
.field private static sAuthority:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAuthority(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "suffix"

    .prologue
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lco/vine/android/util/PlayerUtil;->sAuthority:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static setup(Ljava/lang/String;)V
    .locals 0
    .parameter "authority"

    .prologue
    .line 11
    sput-object p0, Lco/vine/android/util/PlayerUtil;->sAuthority:Ljava/lang/String;

    .line 12
    return-void
.end method
