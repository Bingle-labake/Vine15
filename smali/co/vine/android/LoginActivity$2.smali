.class Lco/vine/android/LoginActivity$2;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/LoginActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/LoginActivity;

.field final synthetic val$username:Landroid/widget/EditText;

.field final synthetic val$usernameLabel:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lco/vine/android/LoginActivity;Landroid/widget/TextView;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 116
    iput-object p1, p0, Lco/vine/android/LoginActivity$2;->this$0:Lco/vine/android/LoginActivity;

    iput-object p2, p0, Lco/vine/android/LoginActivity$2;->val$usernameLabel:Landroid/widget/TextView;

    iput-object p3, p0, Lco/vine/android/LoginActivity$2;->val$username:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 119
    iget-object v1, p0, Lco/vine/android/LoginActivity$2;->this$0:Lco/vine/android/LoginActivity;

    #getter for: Lco/vine/android/LoginActivity;->mWidthResolved:Z
    invoke-static {v1}, Lco/vine/android/LoginActivity;->access$300(Lco/vine/android/LoginActivity;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 125
    :goto_0
    return-void

    .line 122
    :cond_0
    iget-object v1, p0, Lco/vine/android/LoginActivity$2;->val$usernameLabel:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getWidth()I

    move-result v0

    .line 123
    .local v0, padding:I
    iget-object v1, p0, Lco/vine/android/LoginActivity$2;->val$username:Landroid/widget/EditText;

    invoke-virtual {v1, v0, v2, v2, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 124
    iget-object v1, p0, Lco/vine/android/LoginActivity$2;->this$0:Lco/vine/android/LoginActivity;

    const/4 v2, 0x1

    #setter for: Lco/vine/android/LoginActivity;->mWidthResolved:Z
    invoke-static {v1, v2}, Lco/vine/android/LoginActivity;->access$302(Lco/vine/android/LoginActivity;Z)Z

    goto :goto_0
.end method
