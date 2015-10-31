.class public Lco/vine/android/api/VineEntity;
.super Ljava/lang/Object;
.source "VineEntity.java"

# interfaces
.implements Ljava/io/Externalizable;
.implements Ljava/lang/Comparable;
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/api/VineEntity$Range;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Externalizable;",
        "Ljava/lang/Comparable",
        "<",
        "Lco/vine/android/api/VineEntity;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_MENTION:Ljava/lang/String; = "mention"

.field public static final TYPE_POST:Ljava/lang/String; = "post"

.field public static final TYPE_TAG:Ljava/lang/String; = "tag"

.field public static final TYPE_USER:Ljava/lang/String; = "user"

.field private static final serialVersionUID:J = -0x37c0049c1cf0f8cbL


# instance fields
.field public adjusted:Z

.field public end:I

.field public id:J

.field public link:Ljava/lang/String;

.field public start:I

.field public title:Ljava/lang/String;

.field public type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 162
    new-instance v0, Lco/vine/android/api/VineEntity$1;

    invoke-direct {v0}, Lco/vine/android/api/VineEntity$1;-><init>()V

    sput-object v0, Lco/vine/android/api/VineEntity;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .parameter "in"

    .prologue
    const/4 v0, 0x0

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-boolean v0, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    .line 137
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    .line 138
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    .line 139
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    .line 140
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lco/vine/android/api/VineEntity;->start:I

    .line 141
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lco/vine/android/api/VineEntity;->end:I

    .line 142
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/api/VineEntity;->id:J

    .line 143
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    .line 144
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJ)V
    .locals 1
    .parameter "type"
    .parameter "title"
    .parameter "link"
    .parameter "start"
    .parameter "end"
    .parameter "id"

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-boolean v0, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    .line 42
    iput-object p1, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    .line 43
    iput-object p2, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    .line 44
    iput-object p3, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    .line 45
    iput p4, p0, Lco/vine/android/api/VineEntity;->start:I

    .line 46
    iput p5, p0, Lco/vine/android/api/VineEntity;->end:I

    .line 47
    iput-wide p6, p0, Lco/vine/android/api/VineEntity;->id:J

    .line 48
    iput-boolean v0, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    .line 49
    return-void
.end method


# virtual methods
.method public clone()Lco/vine/android/api/VineEntity;
    .locals 8

    .prologue
    .line 63
    new-instance v0, Lco/vine/android/api/VineEntity;

    iget-object v1, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    iget-object v2, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    iget-object v3, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    iget v4, p0, Lco/vine/android/api/VineEntity;->start:I

    iget v5, p0, Lco/vine/android/api/VineEntity;->end:I

    iget-wide v6, p0, Lco/vine/android/api/VineEntity;->id:J

    invoke-direct/range {v0 .. v7}, Lco/vine/android/api/VineEntity;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJ)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 17
    invoke-virtual {p0}, Lco/vine/android/api/VineEntity;->clone()Lco/vine/android/api/VineEntity;

    move-result-object v0

    return-object v0
.end method

.method public compareTo(Lco/vine/android/api/VineEntity;)I
    .locals 2
    .parameter "vineEntity"

    .prologue
    .line 109
    iget v0, p0, Lco/vine/android/api/VineEntity;->end:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p1, Lco/vine/android/api/VineEntity;->end:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 17
    check-cast p1, Lco/vine/android/api/VineEntity;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/api/VineEntity;->compareTo(Lco/vine/android/api/VineEntity;)I

    move-result v0

    return v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 159
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 79
    if-ne p0, p1, :cond_1

    .line 92
    :cond_0
    :goto_0
    return v1

    .line 80
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

    .line 82
    check-cast v0, Lco/vine/android/api/VineEntity;

    .line 84
    .local v0, entity:Lco/vine/android/api/VineEntity;
    iget-boolean v3, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    iget-boolean v4, v0, Lco/vine/android/api/VineEntity;->adjusted:Z

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 85
    :cond_4
    iget v3, p0, Lco/vine/android/api/VineEntity;->end:I

    iget v4, v0, Lco/vine/android/api/VineEntity;->end:I

    if-eq v3, v4, :cond_5

    move v1, v2

    goto :goto_0

    .line 86
    :cond_5
    iget-wide v3, p0, Lco/vine/android/api/VineEntity;->id:J

    iget-wide v5, v0, Lco/vine/android/api/VineEntity;->id:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_6

    move v1, v2

    goto :goto_0

    .line 87
    :cond_6
    iget v3, p0, Lco/vine/android/api/VineEntity;->start:I

    iget v4, v0, Lco/vine/android/api/VineEntity;->start:I

    if-eq v3, v4, :cond_7

    move v1, v2

    goto :goto_0

    .line 88
    :cond_7
    iget-object v3, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    if-eqz v3, :cond_9

    iget-object v3, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    :cond_8
    move v1, v2

    goto :goto_0

    :cond_9
    iget-object v3, v0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    if-nez v3, :cond_8

    .line 89
    :cond_a
    iget-object v3, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    if-eqz v3, :cond_c

    iget-object v3, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    :cond_b
    move v1, v2

    goto :goto_0

    :cond_c
    iget-object v3, v0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    if-nez v3, :cond_b

    .line 90
    :cond_d
    iget-object v3, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    goto :goto_0

    :cond_e
    iget-object v3, v0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 97
    iget-object v2, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 98
    .local v0, result:I
    :goto_0
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int v0, v3, v2

    .line 99
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int v0, v3, v2

    .line 100
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lco/vine/android/api/VineEntity;->start:I

    add-int v0, v2, v3

    .line 101
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lco/vine/android/api/VineEntity;->end:I

    add-int v0, v2, v3

    .line 102
    mul-int/lit8 v2, v0, 0x1f

    iget-wide v3, p0, Lco/vine/android/api/VineEntity;->id:J

    iget-wide v5, p0, Lco/vine/android/api/VineEntity;->id:J

    const/16 v7, 0x20

    ushr-long/2addr v5, v7

    xor-long/2addr v3, v5

    long-to-int v3, v3

    add-int v0, v2, v3

    .line 103
    mul-int/lit8 v2, v0, 0x1f

    iget-boolean v3, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    if-eqz v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    add-int v0, v2, v1

    .line 104
    return v0

    .end local v0           #result:I
    :cond_1
    move v0, v1

    .line 97
    goto :goto_0

    .restart local v0       #result:I
    :cond_2
    move v2, v1

    .line 98
    goto :goto_1

    :cond_3
    move v2, v1

    .line 99
    goto :goto_2
.end method

.method public isTagType()Z
    .locals 2

    .prologue
    .line 118
    const-string v0, "tag"

    iget-object v1, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isUserType()Z
    .locals 2

    .prologue
    .line 113
    const-string v0, "user"

    iget-object v1, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "mention"

    iget-object v1, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "post"

    iget-object v1, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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
    .line 53
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    .line 54
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    .line 55
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    .line 56
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineEntity;->start:I

    .line 57
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/api/VineEntity;->end:I

    .line 58
    invoke-interface {p1}, Ljava/io/ObjectInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/api/VineEntity;->id:J

    .line 59
    invoke-interface {p1}, Ljava/io/ObjectInput;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    .line 60
    return-void
.end method

.method public toMap()Ljava/util/HashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 123
    .local v0, objectHashMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "id"

    iget-wide v3, p0, Lco/vine/android/api/VineEntity;->id:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    const-string v2, "type"

    iget-object v3, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    const-string v2, "text"

    iget-object v3, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .local v1, range:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget v2, p0, Lco/vine/android/api/VineEntity;->start:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    iget v2, p0, Lco/vine/android/api/VineEntity;->end:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    const-string v2, "range"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    return-object v0
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
    .line 68
    iget-object v0, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 69
    iget-object v0, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 70
    iget-object v0, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 71
    iget v0, p0, Lco/vine/android/api/VineEntity;->start:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 72
    iget v0, p0, Lco/vine/android/api/VineEntity;->end:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 73
    iget-wide v0, p0, Lco/vine/android/api/VineEntity;->id:J

    invoke-interface {p1, v0, v1}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 74
    iget-boolean v0, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeBoolean(Z)V

    .line 75
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 148
    iget-object v0, p0, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 149
    iget-object v0, p0, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 150
    iget-object v0, p0, Lco/vine/android/api/VineEntity;->link:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 151
    iget v0, p0, Lco/vine/android/api/VineEntity;->start:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 152
    iget v0, p0, Lco/vine/android/api/VineEntity;->end:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 153
    iget-wide v0, p0, Lco/vine/android/api/VineEntity;->id:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 154
    iget-boolean v0, p0, Lco/vine/android/api/VineEntity;->adjusted:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 155
    return-void

    .line 154
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
