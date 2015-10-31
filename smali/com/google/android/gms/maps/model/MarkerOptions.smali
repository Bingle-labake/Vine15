.class public final Lcom/google/android/gms/maps/model/MarkerOptions;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/ae;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/maps/model/MarkerOptionsCreator;


# instance fields
.field private final T:I

.field private fV:Z

.field private gd:F

.field private ge:F

.field private gk:Lcom/google/android/gms/maps/model/LatLng;

.field private gl:Ljava/lang/String;

.field private gm:Ljava/lang/String;

.field private gn:Lcom/google/android/gms/maps/model/BitmapDescriptor;

.field private go:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/maps/model/MarkerOptionsCreator;

    invoke-direct {v0}, Lcom/google/android/gms/maps/model/MarkerOptionsCreator;-><init>()V

    sput-object v0, Lcom/google/android/gms/maps/model/MarkerOptions;->CREATOR:Lcom/google/android/gms/maps/model/MarkerOptionsCreator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f00

    iput v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gd:F

    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ge:F

    iput-boolean v1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->fV:Z

    iput v1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->T:I

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/maps/model/LatLng;Ljava/lang/String;Ljava/lang/String;Landroid/os/IBinder;FFZZ)V
    .locals 2
    .parameter "versionCode"
    .parameter "position"
    .parameter "title"
    .parameter "snippet"
    .parameter "wrappedIcon"
    .parameter "anchorU"
    .parameter "anchorV"
    .parameter "draggable"
    .parameter "visible"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f00

    iput v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gd:F

    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ge:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->fV:Z

    iput p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->T:I

    iput-object p2, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gk:Lcom/google/android/gms/maps/model/LatLng;

    iput-object p3, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gl:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gm:Ljava/lang/String;

    if-nez p5, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gn:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    iput p6, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gd:F

    iput p7, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ge:F

    iput-boolean p8, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->go:Z

    iput-boolean p9, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->fV:Z

    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/maps/model/BitmapDescriptor;

    invoke-static {p5}, Lcom/google/android/gms/internal/bc$a;->j(Landroid/os/IBinder;)Lcom/google/android/gms/internal/bc;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/maps/model/BitmapDescriptor;-><init>(Lcom/google/android/gms/internal/bc;)V

    goto :goto_0
.end method


# virtual methods
.method public aY()Landroid/os/IBinder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gn:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gn:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/BitmapDescriptor;->aD()Lcom/google/android/gms/internal/bc;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/bc;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    goto :goto_0
.end method

.method public anchor(FF)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0
    .parameter "u"
    .parameter "v"

    .prologue
    iput p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gd:F

    iput p2, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ge:F

    return-object p0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public draggable(Z)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0
    .parameter "draggable"

    .prologue
    iput-boolean p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->go:Z

    return-object p0
.end method

.method public getAnchorU()F
    .locals 1

    iget v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gd:F

    return v0
.end method

.method public getAnchorV()F
    .locals 1

    iget v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->ge:F

    return v0
.end method

.method public getIcon()Lcom/google/android/gms/maps/model/BitmapDescriptor;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gn:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    return-object v0
.end method

.method public getPosition()Lcom/google/android/gms/maps/model/LatLng;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gk:Lcom/google/android/gms/maps/model/LatLng;

    return-object v0
.end method

.method public getSnippet()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gm:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gl:Ljava/lang/String;

    return-object v0
.end method

.method public icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0
    .parameter "icon"

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gn:Lcom/google/android/gms/maps/model/BitmapDescriptor;

    return-object p0
.end method

.method public isDraggable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->go:Z

    return v0
.end method

.method public isVisible()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->fV:Z

    return v0
.end method

.method public position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0
    .parameter "position"

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gk:Lcom/google/android/gms/maps/model/LatLng;

    return-object p0
.end method

.method public snippet(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0
    .parameter "snippet"

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gm:Ljava/lang/String;

    return-object p0
.end method

.method public title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0
    .parameter "title"

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->gl:Ljava/lang/String;

    return-object p0
.end method

.method public u()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->T:I

    return v0
.end method

.method public visible(Z)Lcom/google/android/gms/maps/model/MarkerOptions;
    .locals 0
    .parameter "visible"

    .prologue
    iput-boolean p1, p0, Lcom/google/android/gms/maps/model/MarkerOptions;->fV:Z

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

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/dd;->a(Lcom/google/android/gms/maps/model/MarkerOptions;Landroid/os/Parcel;I)V

    :goto_0
    return-void

    :cond_0
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/maps/model/MarkerOptionsCreator;->a(Lcom/google/android/gms/maps/model/MarkerOptions;Landroid/os/Parcel;I)V

    goto :goto_0
.end method
