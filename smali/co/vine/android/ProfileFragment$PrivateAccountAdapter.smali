.class Lco/vine/android/ProfileFragment$PrivateAccountAdapter;
.super Landroid/widget/BaseAdapter;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PrivateAccountAdapter"
.end annotation


# instance fields
.field blocked:Z

.field priv:Z

.field final synthetic this$0:Lco/vine/android/ProfileFragment;


# direct methods
.method public constructor <init>(Lco/vine/android/ProfileFragment;ZZ)V
    .locals 0
    .parameter
    .parameter "blocked"
    .parameter "priv"

    .prologue
    .line 1180
    iput-object p1, p0, Lco/vine/android/ProfileFragment$PrivateAccountAdapter;->this$0:Lco/vine/android/ProfileFragment;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 1181
    iput-boolean p2, p0, Lco/vine/android/ProfileFragment$PrivateAccountAdapter;->blocked:Z

    .line 1182
    iput-boolean p3, p0, Lco/vine/android/ProfileFragment$PrivateAccountAdapter;->priv:Z

    .line 1183
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 1187
    const/4 v0, 0x1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "i"

    .prologue
    .line 1192
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "i"

    .prologue
    .line 1197
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .parameter "i"
    .parameter "view"
    .parameter "root"

    .prologue
    const/4 v2, 0x0

    .line 1202
    iget-boolean v0, p0, Lco/vine/android/ProfileFragment$PrivateAccountAdapter;->blocked:Z

    if-eqz v0, :cond_0

    .line 1203
    iget-object v0, p0, Lco/vine/android/ProfileFragment$PrivateAccountAdapter;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03004f

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 1206
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lco/vine/android/ProfileFragment$PrivateAccountAdapter;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030052

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    goto :goto_0
.end method
