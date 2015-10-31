.class final Lco/vine/android/widget/FragmentTabHost$TabInfo;
.super Ljava/lang/Object;
.source "FragmentTabHost.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/widget/FragmentTabHost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TabInfo"
.end annotation


# instance fields
.field private final args:Landroid/os/Bundle;

.field private final clss:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private fragment:Landroid/support/v4/app/Fragment;

.field private final tag:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 0
    .parameter "_tag"
    .parameter
    .parameter "_args"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 73
    .local p2, _class:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lco/vine/android/widget/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;

    .line 75
    iput-object p2, p0, Lco/vine/android/widget/FragmentTabHost$TabInfo;->clss:Ljava/lang/Class;

    .line 76
    iput-object p3, p0, Lco/vine/android/widget/FragmentTabHost$TabInfo;->args:Landroid/os/Bundle;

    .line 77
    return-void
.end method

.method static synthetic access$100(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/support/v4/app/Fragment;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;

    return-object v0
.end method

.method static synthetic access$102(Lco/vine/android/widget/FragmentTabHost$TabInfo;Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/Fragment;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 67
    iput-object p1, p0, Lco/vine/android/widget/FragmentTabHost$TabInfo;->fragment:Landroid/support/v4/app/Fragment;

    return-object p1
.end method

.method static synthetic access$200(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lco/vine/android/widget/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Ljava/lang/Class;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lco/vine/android/widget/FragmentTabHost$TabInfo;->clss:Ljava/lang/Class;

    return-object v0
.end method

.method static synthetic access$400(Lco/vine/android/widget/FragmentTabHost$TabInfo;)Landroid/os/Bundle;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lco/vine/android/widget/FragmentTabHost$TabInfo;->args:Landroid/os/Bundle;

    return-object v0
.end method
