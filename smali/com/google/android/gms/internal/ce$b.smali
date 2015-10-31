.class final Lcom/google/android/gms/internal/ce$b;
.super Lcom/google/android/gms/internal/cb$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/ce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "b"
.end annotation


# instance fields
.field final synthetic eM:Lcom/google/android/gms/internal/ce;

.field private final eN:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

.field private final eO:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ce;Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/ce$b;->eM:Lcom/google/android/gms/internal/ce;

    invoke-direct {p0}, Lcom/google/android/gms/internal/cb$a;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/ce$b;->eN:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/ce$b;->eO:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/ce;Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/ce$b;->eM:Lcom/google/android/gms/internal/ce;

    invoke-direct {p0}, Lcom/google/android/gms/internal/cb$a;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/ce$b;->eO:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/ce$b;->eN:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    return-void
.end method


# virtual methods
.method public onAddGeofencesResult(I[Ljava/lang/String;)V
    .locals 4
    .parameter "statusCode"
    .parameter "geofenceRequestIds"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/ce$b;->eM:Lcom/google/android/gms/internal/ce;

    new-instance v1, Lcom/google/android/gms/internal/ce$a;

    iget-object v2, p0, Lcom/google/android/gms/internal/ce$b;->eM:Lcom/google/android/gms/internal/ce;

    iget-object v3, p0, Lcom/google/android/gms/internal/ce$b;->eN:Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;

    invoke-direct {v1, v2, v3, p1, p2}, Lcom/google/android/gms/internal/ce$a;-><init>(Lcom/google/android/gms/internal/ce;Lcom/google/android/gms/location/LocationClient$OnAddGeofencesResultListener;I[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ce;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public onRemoveGeofencesByPendingIntentResult(ILandroid/app/PendingIntent;)V
    .locals 7
    .parameter "statusCode"
    .parameter "pendingIntent"

    .prologue
    iget-object v6, p0, Lcom/google/android/gms/internal/ce$b;->eM:Lcom/google/android/gms/internal/ce;

    new-instance v0, Lcom/google/android/gms/internal/ce$d;

    iget-object v1, p0, Lcom/google/android/gms/internal/ce$b;->eM:Lcom/google/android/gms/internal/ce;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/android/gms/internal/ce$b;->eO:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    move v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/ce$d;-><init>(Lcom/google/android/gms/internal/ce;ILcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;ILandroid/app/PendingIntent;)V

    invoke-virtual {v6, v0}, Lcom/google/android/gms/internal/ce;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method

.method public onRemoveGeofencesByRequestIdsResult(I[Ljava/lang/String;)V
    .locals 7
    .parameter "statusCode"
    .parameter "geofenceRequestIds"

    .prologue
    iget-object v6, p0, Lcom/google/android/gms/internal/ce$b;->eM:Lcom/google/android/gms/internal/ce;

    new-instance v0, Lcom/google/android/gms/internal/ce$d;

    iget-object v1, p0, Lcom/google/android/gms/internal/ce$b;->eM:Lcom/google/android/gms/internal/ce;

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/android/gms/internal/ce$b;->eO:Lcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;

    move v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/ce$d;-><init>(Lcom/google/android/gms/internal/ce;ILcom/google/android/gms/location/LocationClient$OnRemoveGeofencesResultListener;I[Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Lcom/google/android/gms/internal/ce;->a(Lcom/google/android/gms/internal/p$b;)V

    return-void
.end method
