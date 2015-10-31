.class Lcom/google/android/gms/internal/dz$c;
.super Landroid/widget/CompoundButton;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/dz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "c"
.end annotation


# instance fields
.field final synthetic hK:Lcom/google/android/gms/internal/dz;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/dz;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dz$c;->hK:Lcom/google/android/gms/internal/dz;

    invoke-direct {p0, p2}, Landroid/widget/CompoundButton;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public toggle()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/dz$c;->hK:Lcom/google/android/gms/internal/dz;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/dz;->hs:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Landroid/widget/CompoundButton;->toggle()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dz$c;->hK:Lcom/google/android/gms/internal/dz;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/google/android/gms/internal/dz;->hs:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/dz$c;->hK:Lcom/google/android/gms/internal/dz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/dz;->bk()V

    goto :goto_0
.end method
