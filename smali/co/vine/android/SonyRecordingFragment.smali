.class public Lco/vine/android/SonyRecordingFragment;
.super Lco/vine/android/RecordingFragment;
.source "SonyRecordingFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lco/vine/android/RecordingFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onResume()V
    .locals 1

    .prologue
    .line 9
    invoke-super {p0}, Lco/vine/android/RecordingFragment;->onResume()V

    .line 10
    invoke-virtual {p0}, Lco/vine/android/SonyRecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/SonyRecordingActivity;

    invoke-virtual {v0}, Lco/vine/android/SonyRecordingActivity;->setupSonyOverlay()V

    .line 11
    return-void
.end method
