.class public Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;
.super Ljava/lang/Object;
.source "RecordSessionManager.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/RecordSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RecordSessionInfo"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final folder:Ljava/io/File;

.field public final meta:Lco/vine/android/recorder/RecordSessionMeta;

.field public final thumb:Ljava/io/File;

.field public final video:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/io/File;Ljava/io/File;Lco/vine/android/recorder/RecordSessionMeta;)V
    .locals 0
    .parameter "folder"
    .parameter "thumb"
    .parameter "video"
    .parameter "meta"

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    iput-object p1, p0, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->folder:Ljava/io/File;

    .line 146
    iput-object p2, p0, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->thumb:Ljava/io/File;

    .line 147
    iput-object p3, p0, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->video:Ljava/io/File;

    .line 148
    iput-object p4, p0, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->meta:Lco/vine/android/recorder/RecordSessionMeta;

    .line 149
    return-void
.end method


# virtual methods
.method public compareTo(Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;)I
    .locals 2
    .parameter "another"

    .prologue
    .line 153
    iget-object v0, p0, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->folder:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p1, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->folder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 138
    check-cast p1, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->compareTo(Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;)I

    move-result v0

    return v0
.end method
