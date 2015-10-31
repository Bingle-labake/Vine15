.class public Lco/vine/android/recorder/RotatingEditorAdapter;
.super Landroid/widget/BaseAdapter;
.source "RotatingEditorAdapter.java"

# interfaces
.implements Landroid/widget/ListAdapter;
.implements Lco/vine/android/dragsort/DragSortWidget$RemoveListener;
.implements Lco/vine/android/dragsort/DragSortWidget$DragListener;


# instance fields
.field mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

.field private mFirstPosition:I


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/SegmentEditorAdapter;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mFirstPosition:I

    .line 18
    iput-object p1, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    .line 19
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public drag(II)V
    .locals 3
    .parameter "from"
    .parameter "to"

    .prologue
    .line 94
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {p0, p1}, Lco/vine/android/recorder/RotatingEditorAdapter;->getPositionInAdapter(I)I

    move-result v1

    invoke-virtual {p0, p2}, Lco/vine/android/recorder/RotatingEditorAdapter;->getPositionInAdapter(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/SegmentEditorAdapter;->drag(II)V

    .line 95
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 2
    .parameter "position"

    .prologue
    .line 54
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {p0, p1}, Lco/vine/android/recorder/RotatingEditorAdapter;->getPositionInAdapter(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 59
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {p0, p1}, Lco/vine/android/recorder/RotatingEditorAdapter;->getPositionInAdapter(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 2
    .parameter "position"

    .prologue
    .line 74
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {p0, p1}, Lco/vine/android/recorder/RotatingEditorAdapter;->getPositionInAdapter(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method public getPositionInAdapter(I)I
    .locals 2
    .parameter "position"

    .prologue
    .line 108
    iget v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mFirstPosition:I

    add-int/2addr v0, p1

    iget-object v1, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v1

    rem-int/2addr v0, v1

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 69
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {p0, p1}, Lco/vine/android/recorder/RotatingEditorAdapter;->getPositionInAdapter(I)I

    move-result v1

    invoke-virtual {v0, v1, p2, p3}, Lco/vine/android/recorder/SegmentEditorAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .locals 2
    .parameter "position"

    .prologue
    .line 28
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {p0, p1}, Lco/vine/android/recorder/RotatingEditorAdapter;->getPositionInAdapter(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->isEnabled(I)Z

    move-result v0

    return v0
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .parameter "observer"

    .prologue
    .line 33
    if-eqz p1, :cond_0

    .line 34
    invoke-super {p0, p1}, Landroid/widget/BaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 36
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/recorder/SegmentEditorAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 37
    return-void
.end method

.method public remove(I)V
    .locals 2
    .parameter "which"

    .prologue
    .line 89
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {p0, p1}, Lco/vine/android/recorder/RotatingEditorAdapter;->getPositionInAdapter(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->remove(I)V

    .line 90
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mFirstPosition:I

    .line 104
    invoke-virtual {p0}, Lco/vine/android/recorder/RotatingEditorAdapter;->notifyDataSetChanged()V

    .line 105
    return-void
.end method

.method public setFirstPosition(I)V
    .locals 2
    .parameter "position"

    .prologue
    .line 98
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v0

    add-int/2addr v0, p1

    iget-object v1, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v1

    rem-int/2addr v0, v1

    iput v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mFirstPosition:I

    .line 99
    invoke-virtual {p0}, Lco/vine/android/recorder/RotatingEditorAdapter;->notifyDataSetChanged()V

    .line 100
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .parameter "observer"

    .prologue
    .line 41
    if-eqz p1, :cond_0

    .line 42
    invoke-super {p0, p1}, Landroid/widget/BaseAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 44
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/RotatingEditorAdapter;->mAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/recorder/SegmentEditorAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 45
    return-void
.end method
