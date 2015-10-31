.class Lco/vine/android/ReshareFragment$1;
.super Ljava/lang/Object;
.source "ReshareFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/ReshareFragment;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/ReshareFragment;


# direct methods
.method constructor <init>(Lco/vine/android/ReshareFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 297
    iput-object p1, p0, Lco/vine/android/ReshareFragment$1;->this$0:Lco/vine/android/ReshareFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 300
    iget-object v0, p0, Lco/vine/android/ReshareFragment$1;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0e0138

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 301
    return-void
.end method
