.class Lco/vine/android/LocaleDialog$1;
.super Ljava/lang/Object;
.source "LocaleDialog.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/LocaleDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/LocaleDialog;


# direct methods
.method constructor <init>(Lco/vine/android/LocaleDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 117
    iput-object p1, p0, Lco/vine/android/LocaleDialog$1;->this$0:Lco/vine/android/LocaleDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 3
    .parameter "group"
    .parameter "checkedId"

    .prologue
    const/4 v1, 0x1

    .line 120
    iget-object v0, p0, Lco/vine/android/LocaleDialog$1;->this$0:Lco/vine/android/LocaleDialog;

    #getter for: Lco/vine/android/LocaleDialog;->mLocales:Landroid/widget/Spinner;
    invoke-static {v0}, Lco/vine/android/LocaleDialog;->access$100(Lco/vine/android/LocaleDialog;)Landroid/widget/Spinner;

    move-result-object v2

    const v0, 0x7f0a00a8

    if-ne p2, v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 121
    iget-object v0, p0, Lco/vine/android/LocaleDialog$1;->this$0:Lco/vine/android/LocaleDialog;

    #setter for: Lco/vine/android/LocaleDialog;->mChanges:Z
    invoke-static {v0, v1}, Lco/vine/android/LocaleDialog;->access$202(Lco/vine/android/LocaleDialog;Z)Z

    .line 122
    return-void

    .line 120
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
