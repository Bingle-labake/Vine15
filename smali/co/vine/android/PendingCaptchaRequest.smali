.class public Lco/vine/android/PendingCaptchaRequest;
.super Ljava/lang/Object;
.source "PendingCaptchaRequest.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CAPTCHA_STATE_FAIL_REQUEST:I = 0x3

.field public static final CAPTCHA_STATE_RETRY_REQUEST:I = 0x2

.field public static final CAPTCHA_STATE_UNHANDLED:I = 0x1

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lco/vine/android/PendingCaptchaRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final actionCode:I

.field public final bundle:Landroid/os/Bundle;

.field public final reqId:Ljava/lang/String;

.field public state:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    new-instance v0, Lco/vine/android/PendingCaptchaRequest$1;

    invoke-direct {v0}, Lco/vine/android/PendingCaptchaRequest$1;-><init>()V

    sput-object v0, Lco/vine/android/PendingCaptchaRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .parameter "in"

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/PendingCaptchaRequest;->reqId:Ljava/lang/String;

    .line 42
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/PendingCaptchaRequest;->actionCode:I

    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/PendingCaptchaRequest;->bundle:Landroid/os/Bundle;

    .line 44
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/PendingCaptchaRequest;->state:I

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 1
    .parameter "reqId"
    .parameter "actionCode"
    .parameter "b"

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lco/vine/android/PendingCaptchaRequest;->reqId:Ljava/lang/String;

    .line 35
    iput p2, p0, Lco/vine/android/PendingCaptchaRequest;->actionCode:I

    .line 36
    iput-object p3, p0, Lco/vine/android/PendingCaptchaRequest;->bundle:Landroid/os/Bundle;

    .line 37
    const/4 v0, 0x1

    iput v0, p0, Lco/vine/android/PendingCaptchaRequest;->state:I

    .line 38
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .parameter "out"
    .parameter "flags"

    .prologue
    .line 52
    iget-object v0, p0, Lco/vine/android/PendingCaptchaRequest;->reqId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 53
    iget v0, p0, Lco/vine/android/PendingCaptchaRequest;->actionCode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 54
    iget-object v0, p0, Lco/vine/android/PendingCaptchaRequest;->bundle:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 55
    iget v0, p0, Lco/vine/android/PendingCaptchaRequest;->state:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 56
    return-void
.end method
