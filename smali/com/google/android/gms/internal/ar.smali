.class public Lcom/google/android/gms/internal/ar;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/google/android/gms/internal/aq;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a(Lcom/google/android/gms/internal/aq;Landroid/os/Parcel;I)V
    .locals 4

    const/4 v3, 0x0

    invoke-static {p1}, Lcom/google/android/gms/internal/ad;->d(Landroid/os/Parcel;)I

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/aq;->u()I

    move-result v2

    invoke-static {p1, v1, v2}, Lcom/google/android/gms/internal/ad;->c(Landroid/os/Parcel;II)V

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/aq;->V()Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/internal/ad;->b(Landroid/os/Parcel;ILjava/util/List;Z)V

    const/4 v1, 0x3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/aq;->W()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v1, v2, v3}, Lcom/google/android/gms/internal/ad;->a(Landroid/os/Parcel;ILjava/lang/String;Z)V

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/ad;->C(Landroid/os/Parcel;I)V

    return-void
.end method


# virtual methods
.method public synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ar;->k(Landroid/os/Parcel;)Lcom/google/android/gms/internal/aq;

    move-result-object v0

    return-object v0
.end method

.method public k(Landroid/os/Parcel;)Lcom/google/android/gms/internal/aq;
    .locals 6

    const/4 v0, 0x0

    invoke-static {p1}, Lcom/google/android/gms/internal/ac;->c(Landroid/os/Parcel;)I

    move-result v3

    const/4 v2, 0x0

    move-object v1, v0

    :goto_0
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    if-ge v4, v3, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/internal/ac;->b(Landroid/os/Parcel;)I

    move-result v4

    invoke-static {v4}, Lcom/google/android/gms/internal/ac;->j(I)I

    move-result v5

    packed-switch v5, :pswitch_data_0

    invoke-static {p1, v4}, Lcom/google/android/gms/internal/ac;->b(Landroid/os/Parcel;I)V

    goto :goto_0

    :pswitch_0
    invoke-static {p1, v4}, Lcom/google/android/gms/internal/ac;->f(Landroid/os/Parcel;I)I

    move-result v2

    goto :goto_0

    :pswitch_1
    sget-object v1, Lcom/google/android/gms/internal/aq$a;->CREATOR:Lcom/google/android/gms/internal/as;

    invoke-static {p1, v4, v1}, Lcom/google/android/gms/internal/ac;->c(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_0

    :pswitch_2
    invoke-static {p1, v4}, Lcom/google/android/gms/internal/ac;->l(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    if-eq v4, v3, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/ac$a;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Overread allowed size end="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/ac$a;-><init>(Ljava/lang/String;Landroid/os/Parcel;)V

    throw v0

    :cond_1
    new-instance v3, Lcom/google/android/gms/internal/aq;

    invoke-direct {v3, v2, v1, v0}, Lcom/google/android/gms/internal/aq;-><init>(ILjava/util/ArrayList;Ljava/lang/String;)V

    return-object v3

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ar;->q(I)[Lcom/google/android/gms/internal/aq;

    move-result-object v0

    return-object v0
.end method

.method public q(I)[Lcom/google/android/gms/internal/aq;
    .locals 1

    new-array v0, p1, [Lcom/google/android/gms/internal/aq;

    return-object v0
.end method
