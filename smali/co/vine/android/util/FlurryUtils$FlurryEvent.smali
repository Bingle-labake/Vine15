.class public Lco/vine/android/util/FlurryUtils$FlurryEvent;
.super Ljava/lang/Object;
.source "FlurryUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/util/FlurryUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FlurryEvent"
.end annotation


# instance fields
.field private final mEventName:Ljava/lang/String;

.field public mInfo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "eventName"

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lco/vine/android/util/FlurryUtils$FlurryEvent;->mEventName:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public static log(Ljava/lang/String;)V
    .locals 0
    .parameter "event"

    .prologue
    .line 31
    invoke-static {p0}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;)V

    .line 32
    return-void
.end method

.method public static log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .parameter "eventName"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 27
    new-instance v0, Lco/vine/android/util/FlurryUtils$FlurryEvent;

    invoke-direct {v0, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log()V

    .line 28
    return-void
.end method

.method public static log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .parameter "eventName"
    .parameter "key"
    .parameter "value"
    .parameter "key2"
    .parameter "value2"

    .prologue
    .line 23
    new-instance v0, Lco/vine/android/util/FlurryUtils$FlurryEvent;

    invoke-direct {v0, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log()V

    .line 24
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;
    .locals 2
    .parameter "name"
    .parameter "value"

    .prologue
    .line 35
    iget-object v0, p0, Lco/vine/android/util/FlurryUtils$FlurryEvent;->mInfo:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/vine/android/util/FlurryUtils$FlurryEvent;->mInfo:Ljava/util/HashMap;

    .line 38
    :cond_0
    iget-object v0, p0, Lco/vine/android/util/FlurryUtils$FlurryEvent;->mInfo:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    return-object p0
.end method

.method public log()V
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lco/vine/android/util/FlurryUtils$FlurryEvent;->mInfo:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lco/vine/android/util/FlurryUtils$FlurryEvent;->mEventName:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/util/FlurryUtils$FlurryEvent;->mInfo:Ljava/util/HashMap;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 52
    :goto_0
    return-void

    .line 50
    :cond_0
    iget-object v0, p0, Lco/vine/android/util/FlurryUtils$FlurryEvent;->mEventName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;)V

    goto :goto_0
.end method
