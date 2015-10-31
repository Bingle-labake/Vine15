.class public final Lcom/google/android/gms/internal/eq$a;
.super Lcom/google/android/gms/internal/an;

# interfaces
.implements Lcom/google/android/gms/internal/ae;
.implements Lcom/google/android/gms/plus/model/people/Person$AgeRange;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/eq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/ei;

.field private static final hR:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/an$a",
            "<**>;>;"
        }
    .end annotation
.end field


# instance fields
.field private final T:I

.field private final hS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private jr:I

.field private js:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/ei;

    invoke-direct {v0}, Lcom/google/android/gms/internal/ei;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/eq$a;->CREATOR:Lcom/google/android/gms/internal/ei;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/eq$a;->hR:Ljava/util/HashMap;

    sget-object v0, Lcom/google/android/gms/internal/eq$a;->hR:Ljava/util/HashMap;

    const-string v1, "max"

    const-string v2, "max"

    const/4 v3, 0x2

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/an$a;->c(Ljava/lang/String;I)Lcom/google/android/gms/internal/an$a;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/google/android/gms/internal/eq$a;->hR:Ljava/util/HashMap;

    const-string v1, "min"

    const-string v2, "min"

    const/4 v3, 0x3

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/an$a;->c(Ljava/lang/String;I)Lcom/google/android/gms/internal/an$a;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/an;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/eq$a;->T:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/eq$a;->hS:Ljava/util/Set;

    return-void
.end method

.method constructor <init>(Ljava/util/Set;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;III)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/an;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/eq$a;->hS:Ljava/util/Set;

    iput p2, p0, Lcom/google/android/gms/internal/eq$a;->T:I

    iput p3, p0, Lcom/google/android/gms/internal/eq$a;->jr:I

    iput p4, p0, Lcom/google/android/gms/internal/eq$a;->js:I

    return-void
.end method


# virtual methods
.method public G()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/an$a",
            "<**>;>;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/eq$a;->hR:Ljava/util/HashMap;

    return-object v0
.end method

.method protected a(Lcom/google/android/gms/internal/an$a;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/eq$a;->hS:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/an$a;->N()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected b(Lcom/google/android/gms/internal/an$a;)Ljava/lang/Object;
    .locals 3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/an$a;->N()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown safe parcelable id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/an$a;->N()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget v0, p0, Lcom/google/android/gms/internal/eq$a;->jr:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_0
    return-object v0

    :pswitch_1
    iget v0, p0, Lcom/google/android/gms/internal/eq$a;->js:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method by()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/eq$a;->hS:Ljava/util/Set;

    return-object v0
.end method

.method public cd()Lcom/google/android/gms/internal/eq$a;
    .locals 0

    return-object p0
.end method

.method public describeContents()I
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/eq$a;->CREATOR:Lcom/google/android/gms/internal/ei;

    const/4 v0, 0x0

    return v0
.end method

.method public synthetic freeze()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/eq$a;->cd()Lcom/google/android/gms/internal/eq$a;

    move-result-object v0

    return-object v0
.end method

.method public getMax()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/eq$a;->jr:I

    return v0
.end method

.method public getMin()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/eq$a;->js:I

    return v0
.end method

.method public hasMax()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/eq$a;->hS:Ljava/util/Set;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasMin()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/eq$a;->hS:Ljava/util/Set;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected j(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected k(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method u()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/eq$a;->T:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .parameter "out"
    .parameter "flags"

    .prologue
    sget-object v0, Lcom/google/android/gms/internal/eq$a;->CREATOR:Lcom/google/android/gms/internal/ei;

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/ei;->a(Lcom/google/android/gms/internal/eq$a;Landroid/os/Parcel;I)V

    return-void
.end method
