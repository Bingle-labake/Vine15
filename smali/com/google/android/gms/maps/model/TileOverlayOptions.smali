.class public final Lcom/google/android/gms/maps/model/TileOverlayOptions;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/ae;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/maps/model/TileOverlayOptionsCreator;


# instance fields
.field private final T:I

.field private fU:F

.field private fV:Z

.field private gv:Lcom/google/android/gms/internal/dp;

.field private gw:Lcom/google/android/gms/maps/model/TileProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/maps/model/TileOverlayOptionsCreator;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/TileOverlayOptionsCreator;-><init>()V

    sput-object v0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->CREATOR:Lcom/google/android/gms/maps/model/TileOverlayOptionsCreator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->fV:Z

    iput v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->T:I

    return-void
.end method

.method constructor <init>(ILandroid/os/IBinder;ZF)V
    .locals 1
    .parameter "versionCode"
    .parameter "delegate"
    .parameter "visible"
    .parameter "zIndex"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->fV:Z

    iput p1, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->T:I

    invoke-static {p2}, Lcom/google/android/gms/internal/dp$a;->Q(Landroid/os/IBinder;)Lcom/google/android/gms/internal/dp;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->gv:Lcom/google/android/gms/internal/dp;

    iget-object v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->gv:Lcom/google/android/gms/internal/dp;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->gw:Lcom/google/android/gms/maps/model/TileProvider;

    iput-boolean p3, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->fV:Z

    iput p4, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->fU:F

    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/maps/model/TileOverlayOptions$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/maps/model/TileOverlayOptions$1;-><init>(Lcom/google/android/gms/maps/model/TileOverlayOptions;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/google/android/gms/maps/model/TileOverlayOptions;)Lcom/google/android/gms/internal/dp;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->gv:Lcom/google/android/gms/internal/dp;

    return-object v0
.end method


# virtual methods
.method public ba()Landroid/os/IBinder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->gv:Lcom/google/android/gms/internal/dp;

    invoke-interface {v0}, Lcom/google/android/gms/internal/dp;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getTileProvider()Lcom/google/android/gms/maps/model/TileProvider;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->gw:Lcom/google/android/gms/maps/model/TileProvider;

    return-object v0
.end method

.method public getZIndex()F
    .locals 1

    iget v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->fU:F

    return v0
.end method

.method public isVisible()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->fV:Z

    return v0
.end method

.method public tileProvider(Lcom/google/android/gms/maps/model/TileProvider;)Lcom/google/android/gms/maps/model/TileOverlayOptions;
    .locals 1
    .parameter "tileProvider"

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->gw:Lcom/google/android/gms/maps/model/TileProvider;

    iget-object v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->gw:Lcom/google/android/gms/maps/model/TileProvider;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->gv:Lcom/google/android/gms/internal/dp;

    return-object p0

    :cond_0
    new-instance v0, Lcom/google/android/gms/maps/model/TileOverlayOptions$2;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/maps/model/TileOverlayOptions$2;-><init>(Lcom/google/android/gms/maps/model/TileOverlayOptions;Lcom/google/android/gms/maps/model/TileProvider;)V

    goto :goto_0
.end method

.method public u()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->T:I

    return v0
.end method

.method public visible(Z)Lcom/google/android/gms/maps/model/TileOverlayOptions;
    .locals 0
    .parameter "visible"

    .prologue
    iput-boolean p1, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->fV:Z

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .parameter "out"
    .parameter "flags"

    .prologue
    invoke-static {}, Lcom/google/android/gms/internal/cx;->aV()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/dh;->a(Lcom/google/android/gms/maps/model/TileOverlayOptions;Landroid/os/Parcel;I)V

    :goto_0
    return-void

    :cond_0
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/maps/model/TileOverlayOptionsCreator;->a(Lcom/google/android/gms/maps/model/TileOverlayOptions;Landroid/os/Parcel;I)V

    goto :goto_0
.end method

.method public zIndex(F)Lcom/google/android/gms/maps/model/TileOverlayOptions;
    .locals 0
    .parameter "zIndex"

    .prologue
    iput p1, p0, Lcom/google/android/gms/maps/model/TileOverlayOptions;->fU:F

    return-object p0
.end method
