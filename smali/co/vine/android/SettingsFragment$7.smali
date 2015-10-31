.class Lco/vine/android/SettingsFragment$7;
.super Ljava/lang/Object;
.source "SettingsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/SettingsFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/SettingsFragment;

.field final synthetic val$errorCode:I


# direct methods
.method constructor <init>(Lco/vine/android/SettingsFragment;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 409
    iput-object p1, p0, Lco/vine/android/SettingsFragment$7;->this$0:Lco/vine/android/SettingsFragment;

    iput p2, p0, Lco/vine/android/SettingsFragment$7;->val$errorCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 412
    iget v1, p0, Lco/vine/android/SettingsFragment$7;->val$errorCode:I

    iget-object v2, p0, Lco/vine/android/SettingsFragment$7;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v2}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const/4 v3, 0x6

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getErrorDialog(ILandroid/app/Activity;I)Landroid/app/Dialog;

    move-result-object v0

    .line 414
    .local v0, errorDialog:Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 415
    return-void
.end method
