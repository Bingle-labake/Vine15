.class public abstract Lco/vine/android/player/SensitiveImageClickListener;
.super Ljava/lang/Object;
.source "SensitiveImageClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field protected final mExplicitDismissed:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected mPosition:I


# direct methods
.method public constructor <init>(Ljava/util/HashSet;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p1, explicitDismissed:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lco/vine/android/player/SensitiveImageClickListener;->mExplicitDismissed:Ljava/util/HashSet;

    .line 20
    return-void
.end method


# virtual methods
.method public setPosition(I)V
    .locals 0
    .parameter "position"

    .prologue
    .line 23
    iput p1, p0, Lco/vine/android/player/SensitiveImageClickListener;->mPosition:I

    .line 24
    return-void
.end method
