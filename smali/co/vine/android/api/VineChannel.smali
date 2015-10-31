.class public Lco/vine/android/api/VineChannel;
.super Ljava/lang/Object;
.source "VineChannel.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable;",
        "Ljava/lang/Comparable",
        "<",
        "Lco/vine/android/api/VineChannel;",
        ">;"
    }
.end annotation


# instance fields
.field public backgroundColor:Ljava/lang/String;

.field public channel:Ljava/lang/String;

.field public channelId:J

.field public created:J

.field public fontColor:Ljava/lang/String;

.field public isLast:Z

.field public lastUsedTimestamp:J

.field public retinaIconUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .parameter "in"

    .prologue
    const/4 v0, 0x1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VineChannel;->channelId:J

    .line 39
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VineChannel;->created:J

    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VineChannel;->lastUsedTimestamp:J

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    .line 42
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    .line 44
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    .line 45
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lco/vine/android/api/VineChannel;->isLast:Z

    .line 46
    return-void

    .line 45
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static from(Landroid/database/Cursor;)Lco/vine/android/api/VineChannel;
    .locals 4
    .parameter "c"

    .prologue
    const/4 v1, 0x1

    .line 56
    new-instance v0, Lco/vine/android/api/VineChannel;

    invoke-direct {v0}, Lco/vine/android/api/VineChannel;-><init>()V

    .line 58
    .local v0, p:Lco/vine/android/api/VineChannel;
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v0, Lco/vine/android/api/VineChannel;->channelId:J

    .line 59
    const/4 v2, 0x3

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v0, Lco/vine/android/api/VineChannel;->created:J

    .line 60
    const/4 v2, 0x7

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v0, Lco/vine/android/api/VineChannel;->lastUsedTimestamp:J

    .line 61
    const/4 v2, 0x2

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    .line 62
    const/4 v2, 0x4

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    .line 63
    const/4 v2, 0x5

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    .line 64
    const/4 v2, 0x6

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    .line 65
    const/16 v2, 0x8

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-ne v2, v1, :cond_0

    :goto_0
    iput-boolean v1, v0, Lco/vine/android/api/VineChannel;->isLast:Z

    .line 66
    return-object v0

    .line 65
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public compareTo(Lco/vine/android/api/VineChannel;)I
    .locals 3
    .parameter "vinePost"

    .prologue
    .line 125
    iget-wide v0, p1, Lco/vine/android/api/VineChannel;->channelId:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v1, p0, Lco/vine/android/api/VineChannel;->channelId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    check-cast p1, Lco/vine/android/api/VineChannel;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/api/VineChannel;->compareTo(Lco/vine/android/api/VineChannel;)I

    move-result v0

    return v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 88
    if-ne p0, p1, :cond_1

    .line 106
    :cond_0
    :goto_0
    return v1

    .line 89
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 91
    check-cast v0, Lco/vine/android/api/VineChannel;

    .line 93
    .local v0, that:Lco/vine/android/api/VineChannel;
    iget-boolean v3, p0, Lco/vine/android/api/VineChannel;->isLast:Z

    iget-boolean v4, v0, Lco/vine/android/api/VineChannel;->isLast:Z

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 94
    :cond_4
    iget-wide v3, p0, Lco/vine/android/api/VineChannel;->channelId:J

    iget-wide v5, v0, Lco/vine/android/api/VineChannel;->channelId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_5

    move v1, v2

    goto :goto_0

    .line 95
    :cond_5
    iget-wide v3, p0, Lco/vine/android/api/VineChannel;->created:J

    iget-wide v5, v0, Lco/vine/android/api/VineChannel;->created:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_6

    move v1, v2

    goto :goto_0

    .line 96
    :cond_6
    iget-wide v3, p0, Lco/vine/android/api/VineChannel;->lastUsedTimestamp:J

    iget-wide v5, v0, Lco/vine/android/api/VineChannel;->lastUsedTimestamp:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_7

    move v1, v2

    goto :goto_0

    .line 97
    :cond_7
    iget-object v3, p0, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    if-eqz v3, :cond_9

    iget-object v3, p0, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    :cond_8
    move v1, v2

    .line 98
    goto :goto_0

    .line 97
    :cond_9
    iget-object v3, v0, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    if-nez v3, :cond_8

    .line 99
    :cond_a
    iget-object v3, p0, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    if-eqz v3, :cond_c

    iget-object v3, p0, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    :cond_b
    move v1, v2

    .line 100
    goto :goto_0

    .line 99
    :cond_c
    iget-object v3, v0, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    if-nez v3, :cond_b

    .line 101
    :cond_d
    iget-object v3, p0, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    if-eqz v3, :cond_f

    iget-object v3, p0, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10

    :cond_e
    move v1, v2

    .line 102
    goto :goto_0

    .line 101
    :cond_f
    iget-object v3, v0, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    if-nez v3, :cond_e

    .line 103
    :cond_10
    iget-object v3, p0, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    if-eqz v3, :cond_11

    iget-object v3, p0, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 104
    goto/16 :goto_0

    .line 103
    :cond_11
    iget-object v3, v0, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 8

    .prologue
    const/16 v7, 0x20

    const/4 v2, 0x0

    .line 111
    iget-wide v3, p0, Lco/vine/android/api/VineChannel;->channelId:J

    iget-wide v5, p0, Lco/vine/android/api/VineChannel;->channelId:J

    ushr-long/2addr v5, v7

    xor-long/2addr v3, v5

    long-to-int v0, v3

    .line 112
    .local v0, result:I
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v3, p0, Lco/vine/android/api/VineChannel;->created:J

    iget-wide v5, p0, Lco/vine/android/api/VineChannel;->created:J

    ushr-long/2addr v5, v7

    xor-long/2addr v3, v5

    long-to-int v3, v3

    add-int v0, v1, v3

    .line 113
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v3, p0, Lco/vine/android/api/VineChannel;->lastUsedTimestamp:J

    iget-wide v5, p0, Lco/vine/android/api/VineChannel;->lastUsedTimestamp:J

    ushr-long/2addr v5, v7

    xor-long/2addr v3, v5

    long-to-int v3, v3

    add-int v0, v1, v3

    .line 114
    mul-int/lit8 v3, v0, 0x1f

    iget-boolean v1, p0, Lco/vine/android/api/VineChannel;->isLast:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    add-int v0, v3, v1

    .line 115
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_1
    add-int v0, v3, v1

    .line 116
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_2
    add-int v0, v3, v1

    .line 117
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_3
    add-int v0, v3, v1

    .line 118
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v2, p0, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_0
    add-int v0, v1, v2

    .line 119
    return v0

    :cond_1
    move v1, v2

    .line 114
    goto :goto_0

    :cond_2
    move v1, v2

    .line 115
    goto :goto_1

    :cond_3
    move v1, v2

    .line 116
    goto :goto_2

    :cond_4
    move v1, v2

    .line 117
    goto :goto_3
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 76
    iget-wide v0, p0, Lco/vine/android/api/VineChannel;->channelId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 77
    iget-wide v0, p0, Lco/vine/android/api/VineChannel;->created:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 78
    iget-wide v0, p0, Lco/vine/android/api/VineChannel;->lastUsedTimestamp:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 79
    iget-object v0, p0, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 82
    iget-object v0, p0, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 83
    iget-boolean v0, p0, Lco/vine/android/api/VineChannel;->isLast:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 84
    return-void

    .line 83
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
