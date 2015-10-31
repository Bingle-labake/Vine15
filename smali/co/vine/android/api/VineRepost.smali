.class public Lco/vine/android/api/VineRepost;
.super Ljava/lang/Object;
.source "VineRepost.java"

# interfaces
.implements Ljava/io/Externalizable;


# static fields
.field private static final serialVersionUID:J = -0x5734b3fcc28d8ad9L


# instance fields
.field public avatarUrl:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public location:Ljava/lang/String;

.field public postId:J

.field public priv:I

.field public repostId:J

.field public unflaggable:I

.field public userId:J

.field public username:Ljava/lang/String;

.field public verified:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJJIII)V
    .locals 0
    .parameter "username"
    .parameter "avatarUrl"
    .parameter "location"
    .parameter "description"
    .parameter "userId"
    .parameter "postId"
    .parameter "repostId"
    .parameter "verified"
    .parameter "priv"
    .parameter "unflaggable"

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lco/vine/android/api/VineRepost;->avatarUrl:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lco/vine/android/api/VineRepost;->location:Ljava/lang/String;

    .line 36
    iput-object p4, p0, Lco/vine/android/api/VineRepost;->description:Ljava/lang/String;

    .line 37
    iput-wide p5, p0, Lco/vine/android/api/VineRepost;->userId:J

    .line 38
    iput-wide p7, p0, Lco/vine/android/api/VineRepost;->postId:J

    .line 39
    iput-wide p9, p0, Lco/vine/android/api/VineRepost;->repostId:J

    .line 40
    iput p11, p0, Lco/vine/android/api/VineRepost;->verified:I

    .line 41
    iput p12, p0, Lco/vine/android/api/VineRepost;->priv:I

    .line 42
    iput p13, p0, Lco/vine/android/api/VineRepost;->unflaggable:I

    .line 43
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 75
    if-ne p0, p1, :cond_1

    .line 95
    :cond_0
    :goto_0
    return v1

    .line 76
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

    .line 78
    check-cast v0, Lco/vine/android/api/VineRepost;

    .line 80
    .local v0, that:Lco/vine/android/api/VineRepost;
    iget-wide v3, p0, Lco/vine/android/api/VineRepost;->postId:J

    iget-wide v5, v0, Lco/vine/android/api/VineRepost;->postId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_0

    .line 81
    :cond_4
    iget v3, p0, Lco/vine/android/api/VineRepost;->priv:I

    iget v4, v0, Lco/vine/android/api/VineRepost;->priv:I

    if-eq v3, v4, :cond_5

    move v1, v2

    goto :goto_0

    .line 82
    :cond_5
    iget-wide v3, p0, Lco/vine/android/api/VineRepost;->repostId:J

    iget-wide v5, v0, Lco/vine/android/api/VineRepost;->repostId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_6

    move v1, v2

    goto :goto_0

    .line 83
    :cond_6
    iget v3, p0, Lco/vine/android/api/VineRepost;->unflaggable:I

    iget v4, v0, Lco/vine/android/api/VineRepost;->unflaggable:I

    if-eq v3, v4, :cond_7

    move v1, v2

    goto :goto_0

    .line 84
    :cond_7
    iget-wide v3, p0, Lco/vine/android/api/VineRepost;->userId:J

    iget-wide v5, v0, Lco/vine/android/api/VineRepost;->userId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_8

    move v1, v2

    goto :goto_0

    .line 85
    :cond_8
    iget v3, p0, Lco/vine/android/api/VineRepost;->verified:I

    iget v4, v0, Lco/vine/android/api/VineRepost;->verified:I

    if-eq v3, v4, :cond_9

    move v1, v2

    goto :goto_0

    .line 86
    :cond_9
    iget-object v3, p0, Lco/vine/android/api/VineRepost;->avatarUrl:Ljava/lang/String;

    if-eqz v3, :cond_b

    iget-object v3, p0, Lco/vine/android/api/VineRepost;->avatarUrl:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineRepost;->avatarUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    :cond_a
    move v1, v2

    .line 87
    goto :goto_0

    .line 86
    :cond_b
    iget-object v3, v0, Lco/vine/android/api/VineRepost;->avatarUrl:Ljava/lang/String;

    if-nez v3, :cond_a

    .line 88
    :cond_c
    iget-object v3, p0, Lco/vine/android/api/VineRepost;->description:Ljava/lang/String;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lco/vine/android/api/VineRepost;->description:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineRepost;->description:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    :cond_d
    move v1, v2

    .line 89
    goto :goto_0

    .line 88
    :cond_e
    iget-object v3, v0, Lco/vine/android/api/VineRepost;->description:Ljava/lang/String;

    if-nez v3, :cond_d

    .line 90
    :cond_f
    iget-object v3, p0, Lco/vine/android/api/VineRepost;->location:Ljava/lang/String;

    if-eqz v3, :cond_11

    iget-object v3, p0, Lco/vine/android/api/VineRepost;->location:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineRepost;->location:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move v1, v2

    .line 91
    goto :goto_0

    .line 90
    :cond_11
    iget-object v3, v0, Lco/vine/android/api/VineRepost;->location:Ljava/lang/String;

    if-nez v3, :cond_10

    .line 92
    :cond_12
    iget-object v3, p0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    if-eqz v3, :cond_13

    iget-object v3, p0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 93
    goto/16 :goto_0

    .line 92
    :cond_13
    iget-object v3, v0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 7

    .prologue
    const/16 v6, 0x20

    const/4 v1, 0x0

    .line 100
    iget-object v2, p0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 101
    .local v0, result:I
    :goto_0
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lco/vine/android/api/VineRepost;->avatarUrl:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lco/vine/android/api/VineRepost;->avatarUrl:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int v0, v3, v2

    .line 102
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lco/vine/android/api/VineRepost;->location:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lco/vine/android/api/VineRepost;->location:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int v0, v3, v2

    .line 103
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lco/vine/android/api/VineRepost;->description:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lco/vine/android/api/VineRepost;->description:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 104
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lco/vine/android/api/VineRepost;->userId:J

    iget-wide v4, p0, Lco/vine/android/api/VineRepost;->userId:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 105
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lco/vine/android/api/VineRepost;->postId:J

    iget-wide v4, p0, Lco/vine/android/api/VineRepost;->postId:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 106
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lco/vine/android/api/VineRepost;->repostId:J

    iget-wide v4, p0, Lco/vine/android/api/VineRepost;->repostId:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 107
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineRepost;->verified:I

    add-int v0, v1, v2

    .line 108
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineRepost;->priv:I

    add-int v0, v1, v2

    .line 109
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineRepost;->unflaggable:I

    add-int v0, v1, v2

    .line 110
    return v0

    .end local v0           #result:I
    :cond_1
    move v0, v1

    .line 100
    goto :goto_0

    .restart local v0       #result:I
    :cond_2
    move v2, v1

    .line 101
    goto :goto_1

    :cond_3
    move v2, v1

    .line 102
    goto :goto_2
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .locals 2
    .parameter "objectInput"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    .line 48
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/api/VineRepost;->avatarUrl:Ljava/lang/String;

    .line 49
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/api/VineRepost;->location:Ljava/lang/String;

    .line 50
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/api/VineRepost;->description:Ljava/lang/String;

    .line 51
    invoke-interface {p1}, Ljava/io/ObjectInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/api/VineRepost;->userId:J

    .line 52
    invoke-interface {p1}, Ljava/io/ObjectInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/api/VineRepost;->postId:J

    .line 53
    invoke-interface {p1}, Ljava/io/ObjectInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/api/VineRepost;->repostId:J

    .line 54
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineRepost;->verified:I

    .line 55
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineRepost;->priv:I

    .line 56
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineRepost;->unflaggable:I

    .line 57
    return-void
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .locals 2
    .parameter "objectOutput"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 62
    iget-object v0, p0, Lco/vine/android/api/VineRepost;->avatarUrl:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 63
    iget-object v0, p0, Lco/vine/android/api/VineRepost;->location:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 64
    iget-object v0, p0, Lco/vine/android/api/VineRepost;->description:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 65
    iget-wide v0, p0, Lco/vine/android/api/VineRepost;->userId:J

    invoke-interface {p1, v0, v1}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 66
    iget-wide v0, p0, Lco/vine/android/api/VineRepost;->postId:J

    invoke-interface {p1, v0, v1}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 67
    iget-wide v0, p0, Lco/vine/android/api/VineRepost;->repostId:J

    invoke-interface {p1, v0, v1}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 68
    iget v0, p0, Lco/vine/android/api/VineRepost;->verified:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 69
    iget v0, p0, Lco/vine/android/api/VineRepost;->priv:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 70
    iget v0, p0, Lco/vine/android/api/VineRepost;->unflaggable:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 71
    return-void
.end method
