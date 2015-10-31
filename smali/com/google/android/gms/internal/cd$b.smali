.class Lcom/google/android/gms/internal/cd$b;
.super Lcom/google/android/gms/internal/ca$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/cd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# instance fields
.field private final eI:Landroid/os/Handler;


# direct methods
.method constructor <init>(Lcom/google/android/gms/location/LocationListener;Landroid/os/Looper;)V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/ca$a;-><init>()V

    if-nez p2, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/cd$a;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/cd$a;-><init>(Lcom/google/android/gms/location/LocationListener;)V

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/internal/cd$b;->eI:Landroid/os/Handler;

    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/cd$a;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/cd$a;-><init>(Lcom/google/android/gms/location/LocationListener;Landroid/os/Looper;)V

    goto :goto_0
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .locals 2
    .parameter "location"

    .prologue
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/cd$b;->eI:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
