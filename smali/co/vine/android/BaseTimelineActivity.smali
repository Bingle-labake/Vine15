.class public abstract Lco/vine/android/BaseTimelineActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "BaseTimelineActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract getCurrentTimeLineFragment()Lco/vine/android/BaseTimelineFragment;
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 12
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 13
    invoke-virtual {p0}, Lco/vine/android/BaseTimelineActivity;->getCurrentTimeLineFragment()Lco/vine/android/BaseTimelineFragment;

    move-result-object v0

    .line 14
    .local v0, fragment:Lco/vine/android/BaseTimelineFragment;
    if-eqz v0, :cond_0

    .line 15
    invoke-virtual {v0}, Lco/vine/android/BaseTimelineFragment;->onBackPressed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 21
    .end local v0           #fragment:Lco/vine/android/BaseTimelineFragment;
    :goto_0
    return-void

    .line 20
    :cond_0
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onBackPressed()V

    goto :goto_0
.end method
