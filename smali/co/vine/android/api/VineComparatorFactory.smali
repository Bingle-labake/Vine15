.class public Lco/vine/android/api/VineComparatorFactory;
.super Ljava/lang/Object;
.source "VineComparatorFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/api/VineComparatorFactory$1;,
        Lco/vine/android/api/VineComparatorFactory$DefaultComparator;,
        Lco/vine/android/api/VineComparatorFactory$VinePopularComparator;,
        Lco/vine/android/api/VineComparatorFactory$ProfileTimelineComparator;,
        Lco/vine/android/api/VineComparatorFactory$HomeTimelineComparator;,
        Lco/vine/android/api/VineComparatorFactory$VineComparator;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    return-void
.end method

.method public static get(I)Lco/vine/android/api/VineComparatorFactory$VineComparator;
    .locals 2
    .parameter "type"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lco/vine/android/api/VineComparatorFactory$VineComparator",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 14
    invoke-static {p0}, Lco/vine/android/util/Util;->isPopularTimeline(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 15
    new-instance v0, Lco/vine/android/api/VineComparatorFactory$VinePopularComparator;

    invoke-direct {v0, v1}, Lco/vine/android/api/VineComparatorFactory$VinePopularComparator;-><init>(Lco/vine/android/api/VineComparatorFactory$1;)V

    .line 25
    :goto_0
    return-object v0

    .line 17
    :cond_0
    packed-switch p0, :pswitch_data_0

    .line 25
    new-instance v0, Lco/vine/android/api/VineComparatorFactory$DefaultComparator;

    invoke-direct {v0, v1}, Lco/vine/android/api/VineComparatorFactory$DefaultComparator;-><init>(Lco/vine/android/api/VineComparatorFactory$1;)V

    goto :goto_0

    .line 19
    :pswitch_0
    new-instance v0, Lco/vine/android/api/VineComparatorFactory$HomeTimelineComparator;

    invoke-direct {v0, v1}, Lco/vine/android/api/VineComparatorFactory$HomeTimelineComparator;-><init>(Lco/vine/android/api/VineComparatorFactory$1;)V

    goto :goto_0

    .line 22
    :pswitch_1
    new-instance v0, Lco/vine/android/api/VineComparatorFactory$ProfileTimelineComparator;

    invoke-direct {v0, v1}, Lco/vine/android/api/VineComparatorFactory$ProfileTimelineComparator;-><init>(Lco/vine/android/api/VineComparatorFactory$1;)V

    goto :goto_0

    .line 17
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
