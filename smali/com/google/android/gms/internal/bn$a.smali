.class public final Lcom/google/android/gms/internal/bn$a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/bn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public bottom:I

.field public di:Landroid/os/IBinder;

.field public dj:I

.field public gravity:I

.field public left:I

.field public right:I

.field public top:I


# direct methods
.method private constructor <init>(I)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/bn$a;->di:Landroid/os/IBinder;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/bn$a;->dj:I

    iput v1, p0, Lcom/google/android/gms/internal/bn$a;->left:I

    iput v1, p0, Lcom/google/android/gms/internal/bn$a;->top:I

    iput v1, p0, Lcom/google/android/gms/internal/bn$a;->right:I

    iput v1, p0, Lcom/google/android/gms/internal/bn$a;->bottom:I

    iput p1, p0, Lcom/google/android/gms/internal/bn$a;->gravity:I

    new-instance v0, Landroid/os/Binder;

    invoke-direct {v0}, Landroid/os/Binder;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/bn$a;->di:Landroid/os/IBinder;

    return-void
.end method

.method synthetic constructor <init>(ILcom/google/android/gms/internal/bn$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/bn$a;-><init>(I)V

    return-void
.end method


# virtual methods
.method public ap()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "popupLocationInfo.gravity"

    iget v2, p0, Lcom/google/android/gms/internal/bn$a;->gravity:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "popupLocationInfo.displayId"

    iget v2, p0, Lcom/google/android/gms/internal/bn$a;->dj:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "popupLocationInfo.left"

    iget v2, p0, Lcom/google/android/gms/internal/bn$a;->left:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "popupLocationInfo.top"

    iget v2, p0, Lcom/google/android/gms/internal/bn$a;->top:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "popupLocationInfo.right"

    iget v2, p0, Lcom/google/android/gms/internal/bn$a;->right:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "popupLocationInfo.bottom"

    iget v2, p0, Lcom/google/android/gms/internal/bn$a;->bottom:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method
