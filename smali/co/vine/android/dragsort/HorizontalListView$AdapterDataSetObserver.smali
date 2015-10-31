.class Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;
.super Landroid/database/DataSetObserver;
.source "HorizontalListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/dragsort/HorizontalListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AdapterDataSetObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/dragsort/HorizontalListView;


# direct methods
.method public constructor <init>(Lco/vine/android/dragsort/HorizontalListView;)V
    .locals 0
    .parameter

    .prologue
    .line 1132
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 1133
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 2

    .prologue
    .line 1137
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    iget-object v1, p0, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;
    invoke-static {v1}, Lco/vine/android/dragsort/HorizontalListView;->access$500(Lco/vine/android/dragsort/HorizontalListView;)Landroid/widget/ListAdapter;

    move-result-object v1

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I
    invoke-static {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->access$402(Lco/vine/android/dragsort/HorizontalListView;I)I

    .line 1138
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    const/4 v1, 0x1

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z
    invoke-static {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->access$102(Lco/vine/android/dragsort/HorizontalListView;Z)Z

    .line 1139
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v0}, Lco/vine/android/dragsort/HorizontalListView;->requestLayout()V

    .line 1140
    return-void
.end method

.method public onInvalidated()V
    .locals 2

    .prologue
    .line 1144
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    const/4 v1, 0x0

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I
    invoke-static {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->access$402(Lco/vine/android/dragsort/HorizontalListView;I)I

    .line 1145
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    const/4 v1, 0x1

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z
    invoke-static {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->access$102(Lco/vine/android/dragsort/HorizontalListView;Z)Z

    .line 1146
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v0}, Lco/vine/android/dragsort/HorizontalListView;->requestLayout()V

    .line 1147
    return-void
.end method
