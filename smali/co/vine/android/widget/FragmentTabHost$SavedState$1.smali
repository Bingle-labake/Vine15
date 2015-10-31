.class final Lco/vine/android/widget/FragmentTabHost$SavedState$1;
.super Ljava/lang/Object;
.source "FragmentTabHost.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/widget/FragmentTabHost$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lco/vine/android/widget/FragmentTabHost$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lco/vine/android/widget/FragmentTabHost$SavedState;
    .locals 2
    .parameter "in"

    .prologue
    .line 124
    new-instance v0, Lco/vine/android/widget/FragmentTabHost$SavedState;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lco/vine/android/widget/FragmentTabHost$SavedState;-><init>(Landroid/os/Parcel;Lco/vine/android/widget/FragmentTabHost$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    invoke-virtual {p0, p1}, Lco/vine/android/widget/FragmentTabHost$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lco/vine/android/widget/FragmentTabHost$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lco/vine/android/widget/FragmentTabHost$SavedState;
    .locals 1
    .parameter "size"

    .prologue
    .line 128
    new-array v0, p1, [Lco/vine/android/widget/FragmentTabHost$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 122
    invoke-virtual {p0, p1}, Lco/vine/android/widget/FragmentTabHost$SavedState$1;->newArray(I)[Lco/vine/android/widget/FragmentTabHost$SavedState;

    move-result-object v0

    return-object v0
.end method
