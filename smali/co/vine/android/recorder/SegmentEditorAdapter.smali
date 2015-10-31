.class public Lco/vine/android/recorder/SegmentEditorAdapter;
.super Landroid/widget/BaseAdapter;
.source "SegmentEditorAdapter.java"

# interfaces
.implements Landroid/widget/ListAdapter;
.implements Lco/vine/android/dragsort/DragSortWidget$RemoveListener;
.implements Lco/vine/android/dragsort/DragSortWidget$DragListener;


# static fields
.field private static final NO_LAST_DELETION:I = -0x1


# instance fields
.field public hasInitialized:Z

.field private mContext:Landroid/content/Context;

.field private final mData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation
.end field

.field private final mDeleted:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation
.end field

.field private mLastDeletedIndex:I

.field private final mMargin:I

.field private final mSize:I


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/SegmentEditorAdapter;)V
    .locals 1
    .parameter "editorAdapter"

    .prologue
    .line 51
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 34
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    .line 52
    iget-object v0, p1, Lco/vine/android/recorder/SegmentEditorAdapter;->mDeleted:Ljava/util/ArrayList;

    iput-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mDeleted:Ljava/util/ArrayList;

    .line 53
    iget-object v0, p1, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    iput-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    .line 54
    iget-object v0, p1, Lco/vine/android/recorder/SegmentEditorAdapter;->mContext:Landroid/content/Context;

    iput-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mContext:Landroid/content/Context;

    .line 55
    iget v0, p1, Lco/vine/android/recorder/SegmentEditorAdapter;->mMargin:I

    iput v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mMargin:I

    .line 56
    iget v0, p1, Lco/vine/android/recorder/SegmentEditorAdapter;->mSize:I

    iput v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mSize:I

    .line 57
    iget v0, p1, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    iput v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Landroid/content/Context;F)V
    .locals 3
    .parameter
    .parameter "context"
    .parameter "density"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;",
            "Landroid/content/Context;",
            "F)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p1, data:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 34
    const/4 v2, -0x1

    iput v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    .line 38
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mDeleted:Ljava/util/ArrayList;

    .line 39
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    .line 40
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/RecordSegment;

    .line 41
    .local v1, segment:Lco/vine/android/recorder/RecordSegment;
    iget-boolean v2, v1, Lco/vine/android/recorder/RecordSegment;->removed:Z

    if-nez v2, :cond_0

    .line 42
    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 45
    .end local v1           #segment:Lco/vine/android/recorder/RecordSegment;
    :cond_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->hasInitialized:Z

    .line 46
    iput-object p2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mContext:Landroid/content/Context;

    .line 47
    const/high16 v2, 0x4000

    mul-float/2addr v2, p3

    float-to-int v2, v2

    iput v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mMargin:I

    .line 48
    const/high16 v2, 0x4280

    mul-float/2addr v2, p3

    float-to-int v2, v2

    iput v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mSize:I

    .line 49
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x1

    return v0
.end method

.method public canUndoDelete()Z
    .locals 2

    .prologue
    .line 190
    iget v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public commitDelete()V
    .locals 1

    .prologue
    .line 186
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    .line 187
    return-void
.end method

.method public compareTo(Ljava/util/ArrayList;)Z
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, editedSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 199
    if-nez p1, :cond_2

    .line 200
    iget-object v4, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    if-nez v4, :cond_1

    .line 212
    :cond_0
    :goto_0
    return v2

    :cond_1
    move v2, v3

    .line 200
    goto :goto_0

    .line 202
    :cond_2
    iget-object v4, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mDeleted:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-gtz v4, :cond_3

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget-object v5, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-eq v4, v5, :cond_4

    :cond_3
    move v2, v3

    .line 203
    goto :goto_0

    .line 205
    :cond_4
    iget-object v4, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 206
    .local v1, size:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v1, :cond_0

    .line 207
    iget-object v4, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eq v4, v5, :cond_5

    move v2, v3

    .line 208
    goto :goto_0

    .line 206
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public drag(II)V
    .locals 3
    .parameter "from"
    .parameter "to"

    .prologue
    .line 159
    if-eq p1, p2, :cond_0

    .line 160
    iget-object v1, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/RecordSegment;

    .line 161
    .local v0, temp:Lco/vine/android/recorder/RecordSegment;
    iget-object v1, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 162
    iget-object v1, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 163
    invoke-virtual {p0}, Lco/vine/android/recorder/SegmentEditorAdapter;->notifyDataSetChanged()V

    .line 165
    .end local v0           #temp:Lco/vine/android/recorder/RecordSegment;
    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getData()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getDeleted()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mDeleted:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 99
    iget-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 104
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .parameter "position"

    .prologue
    .line 137
    const/4 v0, 0x0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 115
    if-nez p2, :cond_2

    .line 116
    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mContext:Landroid/content/Context;

    if-nez v2, :cond_0

    .line 117
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mContext:Landroid/content/Context;

    .line 119
    :cond_0
    new-instance p2, Landroid/view/View;

    .end local p2
    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p2, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 120
    .restart local p2
    new-instance v1, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mSize:I

    iget v3, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mSize:I

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 124
    .local v1, params:Landroid/view/ViewGroup$MarginLayoutParams;
    :goto_0
    invoke-virtual {p0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne p1, v2, :cond_3

    const/4 v2, 0x0

    :goto_1
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 125
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/RecordSegment;

    .line 127
    .local v0, item:Lco/vine/android/recorder/RecordSegment;
    iget-object v2, v0, Lco/vine/android/recorder/RecordSegment;->drawable:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_1

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSegment;->getThumbnailPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 128
    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSegment;->getThumbnailPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/drawable/BitmapDrawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/recorder/RecordSegment;->drawable:Landroid/graphics/drawable/Drawable;

    .line 130
    :cond_1
    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/recorder/RecordSegment;

    iget-object v2, v2, Lco/vine/android/recorder/RecordSegment;->drawable:Landroid/graphics/drawable/Drawable;

    invoke-static {p2, v2}, Lco/vine/android/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 132
    return-object p2

    .line 122
    .end local v0           #item:Lco/vine/android/recorder/RecordSegment;
    .end local v1           #params:Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_2
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .restart local v1       #params:Landroid/view/ViewGroup$MarginLayoutParams;
    goto :goto_0

    .line 124
    :cond_3
    iget v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mMargin:I

    goto :goto_1
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 142
    const/4 v0, 0x0

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 109
    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEnabled(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 75
    const/4 v0, 0x1

    return v0
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 0
    .parameter "observer"

    .prologue
    .line 80
    if-eqz p1, :cond_0

    .line 81
    invoke-super {p0, p1}, Landroid/widget/BaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 83
    :cond_0
    return-void
.end method

.method public remove(I)V
    .locals 2
    .parameter "which"

    .prologue
    .line 152
    iput p1, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    .line 153
    iget-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mDeleted:Ljava/util/ArrayList;

    iget-object v1, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    invoke-virtual {p0}, Lco/vine/android/recorder/SegmentEditorAdapter;->notifyDataSetChanged()V

    .line 155
    return-void
.end method

.method public reverse()V
    .locals 3

    .prologue
    .line 168
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 169
    .local v1, newData:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 170
    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 172
    :cond_0
    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 173
    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 174
    invoke-virtual {p0}, Lco/vine/android/recorder/SegmentEditorAdapter;->notifyDataSetChanged()V

    .line 175
    return-void
.end method

.method public undoDelete()V
    .locals 4

    .prologue
    .line 178
    iget v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    if-ltz v0, :cond_0

    .line 179
    iget-object v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mData:Ljava/util/ArrayList;

    iget v1, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    iget-object v2, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mDeleted:Ljava/util/ArrayList;

    iget-object v3, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mDeleted:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 180
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/recorder/SegmentEditorAdapter;->mLastDeletedIndex:I

    .line 181
    invoke-virtual {p0}, Lco/vine/android/recorder/SegmentEditorAdapter;->notifyDataSetChanged()V

    .line 183
    :cond_0
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 0
    .parameter "observer"

    .prologue
    .line 87
    if-eqz p1, :cond_0

    .line 88
    invoke-super {p0, p1}, Landroid/widget/BaseAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 90
    :cond_0
    return-void
.end method
