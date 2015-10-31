.class Lco/vine/android/PostFragment$2;
.super Ljava/lang/Object;
.source "PostFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/PostFragment;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/PostFragment;


# direct methods
.method constructor <init>(Lco/vine/android/PostFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 561
    iput-object p1, p0, Lco/vine/android/PostFragment$2;->this$0:Lco/vine/android/PostFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 564
    iget-object v0, p0, Lco/vine/android/PostFragment$2;->this$0:Lco/vine/android/PostFragment;

    invoke-virtual {v0}, Lco/vine/android/PostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0e0138

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 565
    return-void
.end method
