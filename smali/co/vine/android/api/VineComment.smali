.class public Lco/vine/android/api/VineComment;
.super Ljava/lang/Object;
.source "VineComment.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lco/vine/android/api/VineComment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public avatarUrl:Ljava/lang/String;

.field public comment:Ljava/lang/String;

.field public commentId:J

.field public commentSb:Landroid/text/SpannableStringBuilder;

.field public entities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;"
        }
    .end annotation
.end field

.field public isLast:Z

.field public location:Ljava/lang/String;

.field public postId:J

.field public timestamp:J

.field public transientEntities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;"
        }
    .end annotation
.end field

.field public user:Lco/vine/android/api/VineUser;

.field public userId:J

.field public username:Ljava/lang/String;

.field public verified:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 169
    new-instance v0, Lco/vine/android/api/VineComment$1;

    invoke-direct {v0}, Lco/vine/android/api/VineComment$1;-><init>()V

    sput-object v0, Lco/vine/android/api/VineComment;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineUser;JLjava/lang/String;JLjava/lang/String;ZJLjava/util/ArrayList;Z)V
    .locals 1
    .parameter "commentId"
    .parameter "comment"
    .parameter "avatarUrl"
    .parameter "user"
    .parameter "timestamp"
    .parameter "location"
    .parameter "userId"
    .parameter "username"
    .parameter "verified"
    .parameter "postId"
    .parameter
    .parameter "isLast"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lco/vine/android/api/VineUser;",
            "J",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "ZJ",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p15, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-wide p1, p0, Lco/vine/android/api/VineComment;->commentId:J

    .line 49
    iput-object p4, p0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    .line 50
    iput-object p3, p0, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    .line 51
    iput-object p5, p0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    .line 52
    iput-wide p6, p0, Lco/vine/android/api/VineComment;->timestamp:J

    .line 53
    iput-object p8, p0, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    .line 54
    iput-wide p9, p0, Lco/vine/android/api/VineComment;->userId:J

    .line 55
    iput-object p11, p0, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    .line 56
    iput-boolean p12, p0, Lco/vine/android/api/VineComment;->verified:Z

    .line 57
    iput-wide p13, p0, Lco/vine/android/api/VineComment;->postId:J

    .line 58
    move-object/from16 v0, p15

    iput-object v0, p0, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    .line 59
    move/from16 v0, p16

    iput-boolean v0, p0, Lco/vine/android/api/VineComment;->isLast:Z

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 5
    .parameter "in"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    iput-wide v3, p0, Lco/vine/android/api/VineComment;->commentId:J

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    .line 93
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lco/vine/android/api/VineUser;

    iput-object v0, p0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    iput-wide v3, p0, Lco/vine/android/api/VineComment;->timestamp:J

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    iput-wide v3, p0, Lco/vine/android/api/VineComment;->userId:J

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lco/vine/android/api/VineComment;->verified:Z

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    iput-wide v3, p0, Lco/vine/android/api/VineComment;->postId:J

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_1

    :goto_1
    iput-boolean v1, p0, Lco/vine/android/api/VineComment;->isLast:Z

    .line 102
    return-void

    :cond_0
    move v0, v2

    .line 98
    goto :goto_0

    :cond_1
    move v1, v2

    .line 101
    goto :goto_1
.end method

.method public static from(Landroid/database/Cursor;)Lco/vine/android/api/VineComment;
    .locals 20
    .parameter "c"

    .prologue
    .line 72
    new-instance v2, Lco/vine/android/api/VineComment;

    const/16 v3, 0x22

    move-object/from16 v0, p0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/16 v5, 0x23

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x24

    move-object/from16 v0, p0

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/16 v8, 0x26

    move-object/from16 v0, p0

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    const/16 v10, 0x27

    move-object/from16 v0, p0

    invoke-interface {v0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0x25

    move-object/from16 v0, p0

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    const/16 v13, 0x28

    move-object/from16 v0, p0

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x29

    move-object/from16 v0, p0

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_0

    const/4 v14, 0x1

    :goto_0
    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-interface {v0, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    const/16 v17, 0x2b

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lco/vine/android/util/Util;->fromByteArray([B)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/ArrayList;

    const/16 v18, 0x2a

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_1

    const/16 v18, 0x1

    :goto_1
    invoke-direct/range {v2 .. v18}, Lco/vine/android/api/VineComment;-><init>(JLjava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineUser;JLjava/lang/String;JLjava/lang/String;ZJLjava/util/ArrayList;Z)V

    return-object v2

    :cond_0
    const/4 v14, 0x0

    goto :goto_0

    :cond_1
    const/16 v18, 0x0

    goto :goto_1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 127
    if-ne p0, p1, :cond_1

    .line 149
    :cond_0
    :goto_0
    return v1

    .line 128
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

    .line 130
    check-cast v0, Lco/vine/android/api/VineComment;

    .line 132
    .local v0, that:Lco/vine/android/api/VineComment;
    iget-wide v3, p0, Lco/vine/android/api/VineComment;->commentId:J

    iget-wide v5, v0, Lco/vine/android/api/VineComment;->commentId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_0

    .line 133
    :cond_4
    iget-wide v3, p0, Lco/vine/android/api/VineComment;->postId:J

    iget-wide v5, v0, Lco/vine/android/api/VineComment;->postId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_5

    move v1, v2

    goto :goto_0

    .line 134
    :cond_5
    iget-wide v3, p0, Lco/vine/android/api/VineComment;->timestamp:J

    iget-wide v5, v0, Lco/vine/android/api/VineComment;->timestamp:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_6

    move v1, v2

    goto :goto_0

    .line 135
    :cond_6
    iget-wide v3, p0, Lco/vine/android/api/VineComment;->userId:J

    iget-wide v5, v0, Lco/vine/android/api/VineComment;->userId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_7

    move v1, v2

    goto :goto_0

    .line 136
    :cond_7
    iget-boolean v3, p0, Lco/vine/android/api/VineComment;->verified:Z

    iget-boolean v4, v0, Lco/vine/android/api/VineComment;->verified:Z

    if-eq v3, v4, :cond_8

    move v1, v2

    goto :goto_0

    .line 137
    :cond_8
    iget-object v3, p0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    if-eqz v3, :cond_a

    iget-object v3, p0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    :cond_9
    move v1, v2

    .line 138
    goto :goto_0

    .line 137
    :cond_a
    iget-object v3, v0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    if-nez v3, :cond_9

    .line 139
    :cond_b
    iget-object v3, p0, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    if-eqz v3, :cond_d

    iget-object v3, p0, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e

    :cond_c
    move v1, v2

    goto :goto_0

    :cond_d
    iget-object v3, v0, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    if-nez v3, :cond_c

    .line 140
    :cond_e
    iget-object v3, p0, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    if-eqz v3, :cond_10

    iget-object v3, p0, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    iget-object v4, v0, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    :cond_f
    move v1, v2

    .line 141
    goto :goto_0

    .line 140
    :cond_10
    iget-object v3, v0, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    if-nez v3, :cond_f

    .line 142
    :cond_11
    iget-object v3, p0, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    if-eqz v3, :cond_13

    iget-object v3, p0, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    :cond_12
    move v1, v2

    .line 143
    goto/16 :goto_0

    .line 142
    :cond_13
    iget-object v3, v0, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    if-nez v3, :cond_12

    .line 144
    :cond_14
    iget-object v3, p0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    if-eqz v3, :cond_16

    iget-object v3, p0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    iget-object v4, v0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v3, v4}, Lco/vine/android/api/VineUser;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    :cond_15
    move v1, v2

    goto/16 :goto_0

    :cond_16
    iget-object v3, v0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    if-nez v3, :cond_15

    .line 145
    :cond_17
    iget-object v3, p0, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    if-eqz v3, :cond_19

    iget-object v3, p0, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a

    :cond_18
    move v1, v2

    .line 146
    goto/16 :goto_0

    .line 145
    :cond_19
    iget-object v3, v0, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    if-nez v3, :cond_18

    .line 147
    :cond_1a
    iget-boolean v3, p0, Lco/vine/android/api/VineComment;->isLast:Z

    iget-boolean v4, v0, Lco/vine/android/api/VineComment;->isLast:Z

    if-eq v3, v4, :cond_0

    move v1, v2

    goto/16 :goto_0
.end method

.method public hashCode()I
    .locals 9

    .prologue
    const/4 v3, 0x1

    const/16 v8, 0x20

    const/4 v2, 0x0

    .line 154
    iget-wide v4, p0, Lco/vine/android/api/VineComment;->commentId:J

    iget-wide v6, p0, Lco/vine/android/api/VineComment;->commentId:J

    ushr-long/2addr v6, v8

    xor-long/2addr v4, v6

    long-to-int v0, v4

    .line 155
    .local v0, result:I
    mul-int/lit8 v4, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v4, v1

    .line 156
    mul-int/lit8 v4, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_1
    add-int v0, v4, v1

    .line 157
    mul-int/lit8 v4, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v1}, Lco/vine/android/api/VineUser;->hashCode()I

    move-result v1

    :goto_2
    add-int v0, v4, v1

    .line 158
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v4, p0, Lco/vine/android/api/VineComment;->timestamp:J

    iget-wide v6, p0, Lco/vine/android/api/VineComment;->timestamp:J

    ushr-long/2addr v6, v8

    xor-long/2addr v4, v6

    long-to-int v4, v4

    add-int v0, v1, v4

    .line 159
    mul-int/lit8 v4, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_3
    add-int v0, v4, v1

    .line 160
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v4, p0, Lco/vine/android/api/VineComment;->userId:J

    iget-wide v6, p0, Lco/vine/android/api/VineComment;->userId:J

    ushr-long/2addr v6, v8

    xor-long/2addr v4, v6

    long-to-int v4, v4

    add-int v0, v1, v4

    .line 161
    mul-int/lit8 v4, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_4
    add-int v0, v4, v1

    .line 162
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v1, p0, Lco/vine/android/api/VineComment;->verified:Z

    if-eqz v1, :cond_5

    move v1, v3

    :goto_5
    add-int v0, v4, v1

    .line 163
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v4, p0, Lco/vine/android/api/VineComment;->postId:J

    iget-wide v6, p0, Lco/vine/android/api/VineComment;->postId:J

    ushr-long/2addr v6, v8

    xor-long/2addr v4, v6

    long-to-int v4, v4

    add-int v0, v1, v4

    .line 164
    mul-int/lit8 v4, v0, 0x1f

    iget-object v1, p0, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->hashCode()I

    move-result v1

    :goto_6
    add-int v0, v4, v1

    .line 165
    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v4, p0, Lco/vine/android/api/VineComment;->verified:Z

    if-eqz v4, :cond_7

    :goto_7
    add-int v0, v1, v3

    .line 166
    return v0

    :cond_0
    move v1, v2

    .line 155
    goto :goto_0

    :cond_1
    move v1, v2

    .line 156
    goto :goto_1

    :cond_2
    move v1, v2

    .line 157
    goto :goto_2

    :cond_3
    move v1, v2

    .line 159
    goto :goto_3

    :cond_4
    move v1, v2

    .line 161
    goto :goto_4

    :cond_5
    move v1, v2

    .line 162
    goto :goto_5

    :cond_6
    move v1, v2

    .line 164
    goto :goto_6

    :cond_7
    move v3, v2

    .line 165
    goto :goto_7
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .parameter "dest"
    .parameter "flags"

    .prologue
    .line 111
    iget-wide v0, p0, Lco/vine/android/api/VineComment;->commentId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 112
    iget-object v0, p0, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 113
    iget-object v0, p0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 114
    iget-object v0, p0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 115
    iget-wide v0, p0, Lco/vine/android/api/VineComment;->timestamp:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 116
    iget-object v0, p0, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 117
    iget-wide v0, p0, Lco/vine/android/api/VineComment;->userId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 118
    iget-object v0, p0, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 119
    iget-boolean v0, p0, Lco/vine/android/api/VineComment;->verified:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 120
    iget-wide v0, p0, Lco/vine/android/api/VineComment;->postId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 121
    iget-object v0, p0, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 122
    iget-boolean v0, p0, Lco/vine/android/api/VineComment;->isLast:Z

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x1

    :goto_1
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 123
    return-void

    .line 119
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 122
    :cond_1
    const-wide/16 v0, 0x0

    goto :goto_1
.end method
