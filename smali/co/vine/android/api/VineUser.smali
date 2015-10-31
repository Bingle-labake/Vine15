.class public Lco/vine/android/api/VineUser;
.super Ljava/lang/Object;
.source "VineUser.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;"
        }
    .end annotation
.end field

.field public static final FOLLOW_STATUS_APPROVAL_PENDING:I = 0x1

.field public static final FOLLOW_STATUS_REQUESTED:I = 0x2


# instance fields
.field public authoredPostCount:I

.field public avatarUrl:Ljava/lang/String;

.field public blocked:I

.field public blocking:I

.field public description:Ljava/lang/String;

.field public edition:Ljava/lang/String;

.field public email:Ljava/lang/String;

.field public explicit:I

.field public followStatus:I

.field public followerCount:I

.field public following:I

.field public followingCount:I

.field public includePromoted:I

.field public likeCount:I

.field public location:Ljava/lang/String;

.field public orderId:J

.field public phoneNumber:Ljava/lang/String;

.field public postCount:I

.field public privateAccount:I

.field public repostsEnabled:I

.field public twitterConnected:I

.field public userId:J

.field public username:Ljava/lang/String;

.field public verified:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 260
    new-instance v0, Lco/vine/android/api/VineUser$1;

    invoke-direct {v0}, Lco/vine/android/api/VineUser$1;-><init>()V

    sput-object v0, Lco/vine/android/api/VineUser;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .parameter "in"

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/api/VineUser;->userId:J

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/api/VineUser;->orderId:J

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->blocked:I

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->blocking:I

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->explicit:I

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->followerCount:I

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->followingCount:I

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->following:I

    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->likeCount:I

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->postCount:I

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->verified:I

    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->twitterConnected:I

    .line 102
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->includePromoted:I

    .line 103
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->privateAccount:I

    .line 104
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->followStatus:I

    .line 105
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->repostsEnabled:I

    .line 106
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    .line 107
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineUser;->authoredPostCount:I

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJIIIIIIIIILjava/lang/String;Ljava/lang/String;IIIILjava/lang/String;I)V
    .locals 1
    .parameter "username"
    .parameter "avatarUrl"
    .parameter "description"
    .parameter "location"
    .parameter "userId"
    .parameter "orderId"
    .parameter "blocked"
    .parameter "blocking"
    .parameter "explicit"
    .parameter "followerCount"
    .parameter "followingCount"
    .parameter "following"
    .parameter "likeCount"
    .parameter "postCount"
    .parameter "verified"
    .parameter "email"
    .parameter "phoneNumber"
    .parameter "twitterConnected"
    .parameter "includePromoted"
    .parameter "privateAccount"
    .parameter "repostsEnabled"
    .parameter "edition"
    .parameter "authoredPostCount"

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    .line 59
    iput-object p2, p0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    .line 60
    iput-object p3, p0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    .line 61
    iput-object p4, p0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    .line 62
    iput-wide p5, p0, Lco/vine/android/api/VineUser;->userId:J

    .line 63
    iput-wide p7, p0, Lco/vine/android/api/VineUser;->orderId:J

    .line 64
    iput p9, p0, Lco/vine/android/api/VineUser;->blocked:I

    .line 65
    iput p10, p0, Lco/vine/android/api/VineUser;->blocking:I

    .line 66
    iput p11, p0, Lco/vine/android/api/VineUser;->explicit:I

    .line 67
    iput p12, p0, Lco/vine/android/api/VineUser;->followerCount:I

    .line 68
    iput p13, p0, Lco/vine/android/api/VineUser;->followingCount:I

    .line 69
    iput p14, p0, Lco/vine/android/api/VineUser;->following:I

    .line 70
    move/from16 v0, p15

    iput v0, p0, Lco/vine/android/api/VineUser;->likeCount:I

    .line 71
    move/from16 v0, p16

    iput v0, p0, Lco/vine/android/api/VineUser;->postCount:I

    .line 72
    move/from16 v0, p17

    iput v0, p0, Lco/vine/android/api/VineUser;->verified:I

    .line 73
    move-object/from16 v0, p18

    iput-object v0, p0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    .line 74
    move-object/from16 v0, p19

    iput-object v0, p0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    .line 75
    move/from16 v0, p20

    iput v0, p0, Lco/vine/android/api/VineUser;->twitterConnected:I

    .line 76
    move/from16 v0, p21

    iput v0, p0, Lco/vine/android/api/VineUser;->includePromoted:I

    .line 77
    move/from16 v0, p22

    iput v0, p0, Lco/vine/android/api/VineUser;->privateAccount:I

    .line 78
    move/from16 v0, p23

    iput v0, p0, Lco/vine/android/api/VineUser;->repostsEnabled:I

    .line 79
    move-object/from16 v0, p24

    iput-object v0, p0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    .line 80
    move/from16 v0, p25

    iput v0, p0, Lco/vine/android/api/VineUser;->authoredPostCount:I

    .line 81
    return-void
.end method


# virtual methods
.method public areRepostsEnabled()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 203
    iget v1, p0, Lco/vine/android/api/VineUser;->repostsEnabled:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 112
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 145
    if-ne p0, p1, :cond_1

    .line 183
    :cond_0
    :goto_0
    return v1

    .line 146
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

    .line 148
    check-cast v0, Lco/vine/android/api/VineUser;

    .line 150
    .local v0, vineUser:Lco/vine/android/api/VineUser;
    iget v3, p0, Lco/vine/android/api/VineUser;->blocked:I

    iget v4, v0, Lco/vine/android/api/VineUser;->blocked:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 151
    :cond_4
    iget v3, p0, Lco/vine/android/api/VineUser;->blocking:I

    iget v4, v0, Lco/vine/android/api/VineUser;->blocking:I

    if-eq v3, v4, :cond_5

    move v1, v2

    goto :goto_0

    .line 152
    :cond_5
    iget v3, p0, Lco/vine/android/api/VineUser;->explicit:I

    iget v4, v0, Lco/vine/android/api/VineUser;->explicit:I

    if-eq v3, v4, :cond_6

    move v1, v2

    goto :goto_0

    .line 153
    :cond_6
    iget v3, p0, Lco/vine/android/api/VineUser;->followerCount:I

    iget v4, v0, Lco/vine/android/api/VineUser;->followerCount:I

    if-eq v3, v4, :cond_7

    move v1, v2

    goto :goto_0

    .line 154
    :cond_7
    iget v3, p0, Lco/vine/android/api/VineUser;->following:I

    iget v4, v0, Lco/vine/android/api/VineUser;->following:I

    if-eq v3, v4, :cond_8

    move v1, v2

    goto :goto_0

    .line 155
    :cond_8
    iget v3, p0, Lco/vine/android/api/VineUser;->followingCount:I

    iget v4, v0, Lco/vine/android/api/VineUser;->followingCount:I

    if-eq v3, v4, :cond_9

    move v1, v2

    goto :goto_0

    .line 156
    :cond_9
    iget v3, p0, Lco/vine/android/api/VineUser;->likeCount:I

    iget v4, v0, Lco/vine/android/api/VineUser;->likeCount:I

    if-eq v3, v4, :cond_a

    move v1, v2

    goto :goto_0

    .line 157
    :cond_a
    iget-wide v3, p0, Lco/vine/android/api/VineUser;->orderId:J

    iget-wide v5, v0, Lco/vine/android/api/VineUser;->orderId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_b

    move v1, v2

    goto :goto_0

    .line 158
    :cond_b
    iget v3, p0, Lco/vine/android/api/VineUser;->postCount:I

    iget v4, v0, Lco/vine/android/api/VineUser;->postCount:I

    if-eq v3, v4, :cond_c

    move v1, v2

    goto :goto_0

    .line 159
    :cond_c
    iget v3, p0, Lco/vine/android/api/VineUser;->twitterConnected:I

    iget v4, v0, Lco/vine/android/api/VineUser;->twitterConnected:I

    if-eq v3, v4, :cond_d

    move v1, v2

    goto :goto_0

    .line 160
    :cond_d
    iget v3, p0, Lco/vine/android/api/VineUser;->includePromoted:I

    iget v4, v0, Lco/vine/android/api/VineUser;->includePromoted:I

    if-eq v3, v4, :cond_e

    move v1, v2

    goto :goto_0

    .line 161
    :cond_e
    iget-wide v3, p0, Lco/vine/android/api/VineUser;->userId:J

    iget-wide v5, v0, Lco/vine/android/api/VineUser;->userId:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_f

    move v1, v2

    goto :goto_0

    .line 162
    :cond_f
    iget v3, p0, Lco/vine/android/api/VineUser;->verified:I

    iget v4, v0, Lco/vine/android/api/VineUser;->verified:I

    if-eq v3, v4, :cond_10

    move v1, v2

    goto :goto_0

    .line 163
    :cond_10
    iget v3, p0, Lco/vine/android/api/VineUser;->privateAccount:I

    iget v4, v0, Lco/vine/android/api/VineUser;->privateAccount:I

    if-eq v3, v4, :cond_11

    move v1, v2

    goto/16 :goto_0

    .line 164
    :cond_11
    iget v3, p0, Lco/vine/android/api/VineUser;->followStatus:I

    iget v4, v0, Lco/vine/android/api/VineUser;->followStatus:I

    if-eq v3, v4, :cond_12

    move v1, v2

    goto/16 :goto_0

    .line 165
    :cond_12
    iget-object v3, p0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    if-eqz v3, :cond_14

    iget-object v3, p0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    :cond_13
    move v1, v2

    .line 166
    goto/16 :goto_0

    .line 165
    :cond_14
    iget-object v3, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    if-nez v3, :cond_13

    .line 167
    :cond_15
    iget-object v3, p0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    if-eqz v3, :cond_17

    iget-object v3, p0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18

    :cond_16
    move v1, v2

    .line 169
    goto/16 :goto_0

    .line 167
    :cond_17
    iget-object v3, v0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    if-nez v3, :cond_16

    .line 170
    :cond_18
    iget-object v3, p0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    if-eqz v3, :cond_1a

    iget-object v3, p0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    :cond_19
    move v1, v2

    goto/16 :goto_0

    :cond_1a
    iget-object v3, v0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    if-nez v3, :cond_19

    .line 171
    :cond_1b
    iget-object v3, p0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    if-eqz v3, :cond_1d

    iget-object v3, p0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1e

    :cond_1c
    move v1, v2

    .line 172
    goto/16 :goto_0

    .line 171
    :cond_1d
    iget-object v3, v0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    if-nez v3, :cond_1c

    .line 173
    :cond_1e
    iget-object v3, p0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    if-eqz v3, :cond_20

    iget-object v3, p0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_21

    :cond_1f
    move v1, v2

    .line 175
    goto/16 :goto_0

    .line 173
    :cond_20
    iget-object v3, v0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    if-nez v3, :cond_1f

    .line 176
    :cond_21
    iget-object v3, p0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    if-eqz v3, :cond_23

    iget-object v3, p0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_24

    :cond_22
    move v1, v2

    .line 177
    goto/16 :goto_0

    .line 176
    :cond_23
    iget-object v3, v0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    if-nez v3, :cond_22

    .line 178
    :cond_24
    iget v3, p0, Lco/vine/android/api/VineUser;->repostsEnabled:I

    iget v4, v0, Lco/vine/android/api/VineUser;->repostsEnabled:I

    if-eq v3, v4, :cond_25

    move v1, v2

    goto/16 :goto_0

    .line 179
    :cond_25
    iget-object v3, p0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    if-eqz v3, :cond_27

    iget-object v3, p0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28

    :cond_26
    move v1, v2

    .line 180
    goto/16 :goto_0

    .line 179
    :cond_27
    iget-object v3, v0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    if-nez v3, :cond_26

    .line 181
    :cond_28
    iget v3, p0, Lco/vine/android/api/VineUser;->authoredPostCount:I

    iget v4, v0, Lco/vine/android/api/VineUser;->authoredPostCount:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto/16 :goto_0
.end method

.method public hasFollowApprovalPending()Z
    .locals 1

    .prologue
    .line 210
    iget v0, p0, Lco/vine/android/api/VineUser;->followStatus:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasFollowRequested()Z
    .locals 1

    .prologue
    .line 217
    iget v0, p0, Lco/vine/android/api/VineUser;->followStatus:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 7

    .prologue
    const/16 v6, 0x20

    const/4 v1, 0x0

    .line 234
    iget-object v2, p0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 235
    .local v0, result:I
    :goto_0
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int v0, v3, v2

    .line 236
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int v0, v3, v2

    .line 237
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_3
    add-int v0, v3, v2

    .line 238
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_4
    add-int v0, v3, v2

    .line 239
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_5
    add-int v0, v3, v2

    .line 240
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 241
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lco/vine/android/api/VineUser;->userId:J

    iget-wide v4, p0, Lco/vine/android/api/VineUser;->userId:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 242
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lco/vine/android/api/VineUser;->orderId:J

    iget-wide v4, p0, Lco/vine/android/api/VineUser;->orderId:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 243
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->blocked:I

    add-int v0, v1, v2

    .line 244
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->blocking:I

    add-int v0, v1, v2

    .line 245
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->explicit:I

    add-int v0, v1, v2

    .line 246
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->followerCount:I

    add-int v0, v1, v2

    .line 247
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->followingCount:I

    add-int v0, v1, v2

    .line 248
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->following:I

    add-int v0, v1, v2

    .line 249
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->likeCount:I

    add-int v0, v1, v2

    .line 250
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->postCount:I

    add-int v0, v1, v2

    .line 251
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->verified:I

    add-int v0, v1, v2

    .line 252
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->twitterConnected:I

    add-int v0, v1, v2

    .line 253
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->includePromoted:I

    add-int v0, v1, v2

    .line 254
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->privateAccount:I

    add-int v0, v1, v2

    .line 255
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->followStatus:I

    add-int v0, v1, v2

    .line 256
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lco/vine/android/api/VineUser;->repostsEnabled:I

    add-int v0, v1, v2

    .line 257
    return v0

    .end local v0           #result:I
    :cond_1
    move v0, v1

    .line 234
    goto/16 :goto_0

    .restart local v0       #result:I
    :cond_2
    move v2, v1

    .line 235
    goto/16 :goto_1

    :cond_3
    move v2, v1

    .line 236
    goto/16 :goto_2

    :cond_4
    move v2, v1

    .line 237
    goto/16 :goto_3

    :cond_5
    move v2, v1

    .line 238
    goto/16 :goto_4

    :cond_6
    move v2, v1

    .line 239
    goto/16 :goto_5
.end method

.method public isBlocked()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 199
    iget v1, p0, Lco/vine/android/api/VineUser;->blocked:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFollowing()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 191
    iget v1, p0, Lco/vine/android/api/VineUser;->following:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPrivate()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 187
    iget v1, p0, Lco/vine/android/api/VineUser;->privateAccount:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPrivateLocked()Z
    .locals 1

    .prologue
    .line 195
    invoke-virtual {p0}, Lco/vine/android/api/VineUser;->isPrivate()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lco/vine/android/api/VineUser;->isFollowing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lco/vine/android/api/VineUser;->hasFollowRequested()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isVerified()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 229
    iget v1, p0, Lco/vine/android/api/VineUser;->verified:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setApprovalPending()V
    .locals 1

    .prologue
    .line 221
    iget v0, p0, Lco/vine/android/api/VineUser;->followStatus:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lco/vine/android/api/VineUser;->followStatus:I

    .line 222
    return-void
.end method

.method public setFollowRequested()V
    .locals 1

    .prologue
    .line 225
    iget v0, p0, Lco/vine/android/api/VineUser;->followStatus:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lco/vine/android/api/VineUser;->followStatus:I

    .line 226
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 117
    iget-object v0, p0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 119
    iget-object v0, p0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 120
    iget-object v0, p0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 121
    iget-object v0, p0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 122
    iget-object v0, p0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 123
    iget-wide v0, p0, Lco/vine/android/api/VineUser;->userId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 124
    iget-wide v0, p0, Lco/vine/android/api/VineUser;->orderId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 125
    iget v0, p0, Lco/vine/android/api/VineUser;->blocked:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 126
    iget v0, p0, Lco/vine/android/api/VineUser;->blocking:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 127
    iget v0, p0, Lco/vine/android/api/VineUser;->explicit:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 128
    iget v0, p0, Lco/vine/android/api/VineUser;->followerCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 129
    iget v0, p0, Lco/vine/android/api/VineUser;->followingCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 130
    iget v0, p0, Lco/vine/android/api/VineUser;->following:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 131
    iget v0, p0, Lco/vine/android/api/VineUser;->likeCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 132
    iget v0, p0, Lco/vine/android/api/VineUser;->postCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 133
    iget v0, p0, Lco/vine/android/api/VineUser;->verified:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 134
    iget v0, p0, Lco/vine/android/api/VineUser;->twitterConnected:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 135
    iget v0, p0, Lco/vine/android/api/VineUser;->includePromoted:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 136
    iget v0, p0, Lco/vine/android/api/VineUser;->privateAccount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 137
    iget v0, p0, Lco/vine/android/api/VineUser;->followStatus:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 138
    iget v0, p0, Lco/vine/android/api/VineUser;->repostsEnabled:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 139
    iget-object v0, p0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 140
    iget v0, p0, Lco/vine/android/api/VineUser;->authoredPostCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 141
    return-void
.end method
