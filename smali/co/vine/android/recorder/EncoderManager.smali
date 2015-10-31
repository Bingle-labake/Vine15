.class public Lco/vine/android/recorder/EncoderManager;
.super Ljava/lang/Object;
.source "EncoderManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/recorder/EncoderManager$Encoder;,
        Lco/vine/android/recorder/EncoderManager$EncoderBoss;,
        Lco/vine/android/recorder/EncoderManager$EncodingException;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method public static transcode(Lco/vine/android/recorder/EncoderManager$EncoderBoss;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 1
    .parameter "boss"
    .parameter "input"
    .parameter "output"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/recorder/EncoderManager$EncoderBoss;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/EncoderManager$EncodingException;
        }
    .end annotation

    .prologue
    .line 16
    .local p3, frameInfo:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const-string v0, "Start transcoding from {} to {}."

    invoke-static {v0, p1, p2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    new-instance v0, Lco/vine/android/lifevibes/LifeVibesTranscoder;

    invoke-direct {v0}, Lco/vine/android/lifevibes/LifeVibesTranscoder;-><init>()V

    invoke-virtual {v0, p0, p1, p2, p3}, Lco/vine/android/lifevibes/LifeVibesTranscoder;->transcode(Lco/vine/android/recorder/EncoderManager$EncoderBoss;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 19
    return-void
.end method

.method public static tryLoad()V
    .locals 1

    .prologue
    .line 22
    new-instance v0, Lco/vine/android/lifevibes/LifeVibesTranscoder;

    invoke-direct {v0}, Lco/vine/android/lifevibes/LifeVibesTranscoder;-><init>()V

    .line 23
    return-void
.end method
