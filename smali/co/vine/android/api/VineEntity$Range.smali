.class public Lco/vine/android/api/VineEntity$Range;
.super Ljava/lang/Object;
.source "VineEntity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/api/VineEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Range"
.end annotation


# instance fields
.field public entity:Lco/vine/android/api/VineEntity;

.field public span:Landroid/text/style/ForegroundColorSpan;

.field public upper:I


# direct methods
.method public constructor <init>(ILco/vine/android/api/VineEntity;Landroid/text/style/ForegroundColorSpan;)V
    .locals 0
    .parameter "upper"
    .parameter "entity"
    .parameter "span"

    .prologue
    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    iput p1, p0, Lco/vine/android/api/VineEntity$Range;->upper:I

    .line 181
    iput-object p2, p0, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    .line 182
    iput-object p3, p0, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    .line 183
    return-void
.end method
