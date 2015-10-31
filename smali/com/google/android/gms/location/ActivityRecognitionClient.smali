.class public Lcom/google/android/gms/location/ActivityRecognitionClient;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/GooglePlayServicesClient;


# instance fields
.field private final em:Lcom/google/android/gms/internal/ce;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 2
    .parameter "context"
    .parameter "connectedListener"
    .parameter "connectionFailedListener"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/ce;

    const-string v1, "activity_recognition"

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/google/android/gms/internal/ce;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    return-void
.end method


# virtual methods
.method public connect()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ce;->connect()V

    return-void
.end method

.method public disconnect()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ce;->disconnect()V

    return-void
.end method

.method public isConnected()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ce;->isConnected()Z

    move-result v0

    return v0
.end method

.method public isConnecting()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ce;->isConnecting()Z

    move-result v0

    return v0
.end method

.method public isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ce;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    return v0
.end method

.method public isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ce;->isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z

    move-result v0

    return v0
.end method

.method public registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ce;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ce;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method

.method public removeActivityUpdates(Landroid/app/PendingIntent;)V
    .locals 1
    .parameter "callbackIntent"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ce;->removeActivityUpdates(Landroid/app/PendingIntent;)V

    return-void
.end method

.method public requestActivityUpdates(JLandroid/app/PendingIntent;)V
    .locals 1
    .parameter "detectionIntervalMillis"
    .parameter "callbackIntent"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/gms/internal/ce;->requestActivityUpdates(JLandroid/app/PendingIntent;)V

    return-void
.end method

.method public unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ce;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    return-void
.end method

.method public unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/location/ActivityRecognitionClient;->em:Lcom/google/android/gms/internal/ce;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ce;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    return-void
.end method
