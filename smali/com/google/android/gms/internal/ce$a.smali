.class final Lcom/google/android/gms/internal/ce$a;
.super Lcom/google/android/gms/internal/p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/p",
        "<",
        "Lcom/google/android/gms/internal/cc;",
        ">.b<",
        "Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;",
        ">;"
    }
.end annotation


# instance fields
.field private final eL:[Ljava/lang/String;

.field final synthetic eM:Lcom/google/android/gms/internal/ce;

.field private final p:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ce;Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;I[Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/ce$a;->eM:Lcom/google/android/gms/internal/ce;

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/p$b;-><init>(Lcom/google/android/gms/internal/p;Ljava/lang/Object;)V

    invoke-static {p3}, Lcom/google/android/gms/location/LocationStatusCodes;->J(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/ce$a;->p:I

    iput-object p4, p0, Lcom/google/android/gms/internal/ce$a;->eL:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected a(Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;)V
    .locals 2

    if-eqz p1, :cond_0

    iget v0, p0, Lcom/google/android/gms/internal/ce$a;->p:I

    iget-object v1, p0, Lcom/google/android/gms/internal/ce$a;->eL:[Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;->onAddGeofencesResult(I[Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ce$a;->a(Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;)V

    return-void
.end method
