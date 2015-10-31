.class Lco/vine/android/BaseListFragment$3;
.super Ljava/lang/Object;
.source "BaseListFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/BaseListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/BaseListFragment;


# direct methods
.method constructor <init>(Lco/vine/android/BaseListFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 136
    iput-object p1, p0, Lco/vine/android/BaseListFragment$3;->this$0:Lco/vine/android/BaseListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 138
    iget-object v0, p0, Lco/vine/android/BaseListFragment$3;->this$0:Lco/vine/android/BaseListFragment;

    iget-object v0, v0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lco/vine/android/BaseListFragment$3;->this$0:Lco/vine/android/BaseListFragment;

    iget-object v1, v1, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->focusableViewAvailable(Landroid/view/View;)V

    .line 139
    return-void
.end method
