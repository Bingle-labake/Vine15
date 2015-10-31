.class public Lco/vine/android/LikeCache;
.super Lco/vine/android/ActionCache;
.source "LikeCache.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lco/vine/android/LikeCache;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    new-instance v0, Lco/vine/android/LikeCache$1;

    invoke-direct {v0}, Lco/vine/android/LikeCache$1;-><init>()V

    sput-object v0, Lco/vine/android/LikeCache;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lco/vine/android/ActionCache;-><init>()V

    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 0
    .parameter "in"

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lco/vine/android/ActionCache;-><init>(Landroid/os/Parcel;)V

    .line 18
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x0

    return v0
.end method

.method public isLike(J)Z
    .locals 3
    .parameter "id"

    .prologue
    .line 29
    iget-object v1, p0, Lco/vine/android/LikeCache;->mCache:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 30
    .local v0, liked:Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 31
    const/4 v1, 0x0

    .line 33
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0
.end method

.method public like(J)V
    .locals 3
    .parameter "id"

    .prologue
    .line 21
    iget-object v0, p0, Lco/vine/android/LikeCache;->mCache:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    return-void
.end method

.method public unlike(J)V
    .locals 3
    .parameter "id"

    .prologue
    .line 25
    iget-object v0, p0, Lco/vine/android/LikeCache;->mCache:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 44
    invoke-super {p0, p1, p2}, Lco/vine/android/ActionCache;->writeToParcel(Landroid/os/Parcel;I)V

    .line 45
    return-void
.end method
