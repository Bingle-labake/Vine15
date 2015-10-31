.class public Lco/vine/android/widget/PopupEditText;
.super Landroid/widget/EditText;
.source "PopupEditText.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/widget/Filter$FilterListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widget/PopupEditText$PopupInputConnection;,
        Lco/vine/android/widget/PopupEditText$PopupEditTextListener;,
        Lco/vine/android/widget/PopupEditText$FilterHandler;,
        Lco/vine/android/widget/PopupEditText$AdapterObserver;,
        Lco/vine/android/widget/PopupEditText$DropDownListView;
    }
.end annotation


# static fields
.field private static final MSG_FILTER:I = 0x0

.field private static final NO_CALLBACK:I = 0x0

.field private static final TRIGGER_CALLBACK:I = 0x1


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field private mClick:Landroid/view/View$OnClickListener;

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field private final mDropDownHorizontalOffset:I

.field private final mDropDownList:Lco/vine/android/widget/PopupEditText$DropDownListView;

.field private final mDropDownVerticalOffset:I

.field private mEntityRanges:Ljava/util/NavigableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/NavigableMap",
            "<",
            "Ljava/lang/Integer;",
            "Lco/vine/android/api/VineEntity$Range;",
            ">;"
        }
    .end annotation
.end field

.field private mFilterable:Landroid/widget/Filterable;

.field private final mHandler:Lco/vine/android/widget/PopupEditText$FilterHandler;

.field private mListener:Lco/vine/android/widget/PopupEditText$PopupEditTextListener;

.field private final mPopup:Landroid/widget/PopupWindow;

.field private mSelectedEntity:Lco/vine/android/api/VineEntity;

.field private mShowRequested:Z

.field private final mThreshold:I

.field private mThrottleDelay:J

.field private mTokenizer:Landroid/widget/MultiAutoCompleteTextView$Tokenizer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/widget/PopupEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 91
    const v0, 0x7f01002d

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/widget/PopupEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 92
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v7, 0x1

    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 95
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 70
    iput-boolean v5, p0, Lco/vine/android/widget/PopupEditText;->mShowRequested:Z

    .line 97
    sget-object v3, Lco/vine/android/R$styleable;->PopupEditText:[I

    invoke-virtual {p1, p2, v3, p3, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 100
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v5, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    iput v3, p0, Lco/vine/android/widget/PopupEditText;->mDropDownVerticalOffset:I

    .line 103
    invoke-virtual {v0, v7, v5}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    iput v3, p0, Lco/vine/android/widget/PopupEditText;->mDropDownHorizontalOffset:I

    .line 106
    const/4 v3, 0x2

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    iput v3, p0, Lco/vine/android/widget/PopupEditText;->mThreshold:I

    .line 108
    new-instance v1, Lco/vine/android/widget/PopupEditText$DropDownListView;

    const/4 v3, 0x0

    const v4, 0x7f01002c

    invoke-direct {v1, p1, v3, v4}, Lco/vine/android/widget/PopupEditText$DropDownListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 110
    .local v1, listView:Lco/vine/android/widget/PopupEditText$DropDownListView;
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0019

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {v1, v3}, Lco/vine/android/widget/PopupEditText$DropDownListView;->setDividerHeight(I)V

    .line 111
    invoke-virtual {v1, p0}, Lco/vine/android/widget/PopupEditText$DropDownListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 112
    iput-object v1, p0, Lco/vine/android/widget/PopupEditText;->mDropDownList:Lco/vine/android/widget/PopupEditText$DropDownListView;

    .line 114
    new-instance v2, Landroid/widget/PopupWindow;

    const v3, 0x7f01002d

    invoke-direct {v2, p1, p2, v3}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 115
    .local v2, popupWindow:Landroid/widget/PopupWindow;
    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->setSoftInputMode(I)V

    .line 116
    invoke-virtual {v2, v5}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 117
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 118
    invoke-virtual {v2, v6}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 119
    invoke-virtual {v2, v6, v6}, Landroid/widget/PopupWindow;->setWindowLayoutMode(II)V

    .line 120
    invoke-virtual {v2, v7}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 121
    iput-object v2, p0, Lco/vine/android/widget/PopupEditText;->mPopup:Landroid/widget/PopupWindow;

    .line 123
    invoke-super {p0, p0}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    new-instance v3, Lco/vine/android/widget/PopupEditText$FilterHandler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4, p0}, Lco/vine/android/widget/PopupEditText$FilterHandler;-><init>(Landroid/os/Looper;Landroid/widget/Filter$FilterListener;)V

    iput-object v3, p0, Lco/vine/android/widget/PopupEditText;->mHandler:Lco/vine/android/widget/PopupEditText$FilterHandler;

    .line 125
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 127
    new-instance v3, Ljava/util/TreeMap;

    invoke-direct {v3}, Ljava/util/TreeMap;-><init>()V

    iput-object v3, p0, Lco/vine/android/widget/PopupEditText;->mEntityRanges:Ljava/util/NavigableMap;

    .line 128
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/widget/PopupEditText;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 54
    iget-boolean v0, p0, Lco/vine/android/widget/PopupEditText;->mShowRequested:Z

    return v0
.end method

.method static synthetic access$002(Lco/vine/android/widget/PopupEditText;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    iput-boolean p1, p0, Lco/vine/android/widget/PopupEditText;->mShowRequested:Z

    return p1
.end method

.method static synthetic access$100(Lco/vine/android/widget/PopupEditText;)Lco/vine/android/api/VineEntity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 54
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mSelectedEntity:Lco/vine/android/api/VineEntity;

    return-object v0
.end method

.method private atomizeEntity(II)V
    .locals 5
    .parameter "selStart"
    .parameter "selEnd"

    .prologue
    .line 156
    invoke-direct {p0, p1, p2}, Lco/vine/android/widget/PopupEditText;->lookupRange(II)Lco/vine/android/api/VineEntity$Range;

    move-result-object v1

    .line 157
    .local v1, range:Lco/vine/android/api/VineEntity$Range;
    if-eqz v1, :cond_0

    iget-object v4, v1, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    if-eqz v4, :cond_0

    .line 158
    iget-object v4, v1, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    iput-object v4, p0, Lco/vine/android/widget/PopupEditText;->mSelectedEntity:Lco/vine/android/api/VineEntity;

    .line 159
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 160
    .local v0, editable:Landroid/text/Editable;
    iget-object v4, v1, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-interface {v0, v4}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    .line 161
    .local v3, spanStart:I
    iget-object v4, v1, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-interface {v0, v4}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    .line 162
    .local v2, spanEnd:I
    invoke-virtual {p0, v3, v2}, Lco/vine/android/widget/PopupEditText;->setSelection(II)V

    .line 166
    .end local v0           #editable:Landroid/text/Editable;
    .end local v2           #spanEnd:I
    .end local v3           #spanStart:I
    :goto_0
    return-void

    .line 164
    :cond_0
    const/4 v4, 0x0

    iput-object v4, p0, Lco/vine/android/widget/PopupEditText;->mSelectedEntity:Lco/vine/android/api/VineEntity;

    goto :goto_0
.end method

.method private isPopupShowing()Z
    .locals 1

    .prologue
    .line 469
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    return v0
.end method

.method private lookupRange(II)Lco/vine/android/api/VineEntity$Range;
    .locals 3
    .parameter "selStart"
    .parameter "selEnd"

    .prologue
    .line 423
    iget-object v1, p0, Lco/vine/android/widget/PopupEditText;->mEntityRanges:Ljava/util/NavigableMap;

    .line 425
    .local v1, ranges:Ljava/util/NavigableMap;,"Ljava/util/NavigableMap<Ljava/lang/Integer;Lco/vine/android/api/VineEntity$Range;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/NavigableMap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 426
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/NavigableMap;->floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    .line 427
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Lco/vine/android/api/VineEntity$Range;>;"
    if-nez v0, :cond_0

    .line 428
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/NavigableMap;->floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    .line 430
    :cond_0
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/api/VineEntity$Range;

    iget v2, v2, Lco/vine/android/api/VineEntity$Range;->upper:I

    if-le p1, v2, :cond_1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/api/VineEntity$Range;

    iget v2, v2, Lco/vine/android/api/VineEntity$Range;->upper:I

    if-gt p2, v2, :cond_2

    .line 432
    :cond_1
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/api/VineEntity$Range;

    .line 435
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Lco/vine/android/api/VineEntity$Range;>;"
    :goto_0
    return-object v2

    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public clearSelectedEntity(IZ)Z
    .locals 7
    .parameter "start"
    .parameter "usingBackspace"

    .prologue
    .line 304
    iget-object v2, p0, Lco/vine/android/widget/PopupEditText;->mSelectedEntity:Lco/vine/android/api/VineEntity;

    .line 305
    .local v2, selectedEntity:Lco/vine/android/api/VineEntity;
    if-eqz v2, :cond_2

    .line 306
    const/4 v5, 0x0

    iput-object v5, p0, Lco/vine/android/widget/PopupEditText;->mSelectedEntity:Lco/vine/android/api/VineEntity;

    .line 307
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 308
    .local v0, editable:Landroid/text/Editable;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 309
    iget-object v5, p0, Lco/vine/android/widget/PopupEditText;->mEntityRanges:Ljava/util/NavigableMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/NavigableMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineEntity$Range;

    .line 310
    .local v1, range:Lco/vine/android/api/VineEntity$Range;
    iget-object v5, v1, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-interface {v0, v5}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    .line 311
    .local v4, spanStart:I
    iget-object v5, v1, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-interface {v0, v5}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v3

    .line 312
    .local v3, spanEnd:I
    iget-object v5, v1, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-interface {v0, v5}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    .line 313
    if-eqz p2, :cond_1

    .line 314
    invoke-interface {v0, v4, v3}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 315
    invoke-virtual {p0, v4}, Lco/vine/android/widget/PopupEditText;->setSelection(I)V

    .line 320
    .end local v1           #range:Lco/vine/android/api/VineEntity$Range;
    .end local v3           #spanEnd:I
    .end local v4           #spanStart:I
    :cond_0
    :goto_0
    const/4 v5, 0x1

    .line 322
    .end local v0           #editable:Landroid/text/Editable;
    :goto_1
    return v5

    .line 317
    .restart local v0       #editable:Landroid/text/Editable;
    .restart local v1       #range:Lco/vine/android/api/VineEntity$Range;
    .restart local v3       #spanEnd:I
    .restart local v4       #spanStart:I
    :cond_1
    add-int/lit8 v5, v4, 0x1

    invoke-virtual {p0, v5}, Lco/vine/android/widget/PopupEditText;->setSelection(I)V

    goto :goto_0

    .line 322
    .end local v0           #editable:Landroid/text/Editable;
    .end local v1           #range:Lco/vine/android/api/VineEntity$Range;
    .end local v3           #spanEnd:I
    .end local v4           #spanStart:I
    :cond_2
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public dismissDropDown()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 298
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 299
    iput-boolean v1, p0, Lco/vine/android/widget/PopupEditText;->mShowRequested:Z

    .line 300
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mHandler:Lco/vine/android/widget/PopupEditText$FilterHandler;

    invoke-virtual {v0, v1}, Lco/vine/android/widget/PopupEditText$FilterHandler;->removeMessages(I)V

    .line 301
    return-void
.end method

.method public getEntities()Ljava/util/ArrayList;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 326
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v10

    .line 327
    .local v10, text:Landroid/text/Editable;
    if-eqz v10, :cond_0

    invoke-interface {v10}, Landroid/text/Editable;->length()I

    move-result v11

    if-lez v11, :cond_0

    .line 331
    :goto_0
    const/4 v11, 0x0

    :try_start_0
    invoke-interface {v10, v11}, Landroid/text/Editable;->charAt(I)C

    move-result v11

    invoke-static {v11}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 332
    const/4 v11, 0x0

    const/4 v12, 0x1

    const-string v13, ""

    invoke-interface {v10, v11, v12, v13}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 334
    :catch_0
    move-exception v11

    .line 338
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 339
    .local v1, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    iget-object v9, p0, Lco/vine/android/widget/PopupEditText;->mEntityRanges:Ljava/util/NavigableMap;

    .line 341
    .local v9, ranges:Ljava/util/NavigableMap;,"Ljava/util/NavigableMap<Ljava/lang/Integer;Lco/vine/android/api/VineEntity$Range;>;"
    if-eqz v10, :cond_3

    .line 342
    const/4 v0, 0x1

    .line 343
    .local v0, adjustedRanges:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    invoke-interface {v10}, Landroid/text/Editable;->length()I

    move-result v11

    if-ge v3, v11, :cond_3

    .line 344
    invoke-interface {v10, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v11

    invoke-static {v11}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 345
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/NavigableMap;->ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v2

    .line 346
    .local v2, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Lco/vine/android/api/VineEntity$Range;>;"
    :goto_2
    if-eqz v2, :cond_1

    .line 347
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/vine/android/api/VineEntity$Range;

    .line 348
    .local v8, range:Lco/vine/android/api/VineEntity$Range;
    iget-object v11, v8, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-interface {v10, v11}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v11

    sub-int v7, v11, v0

    .line 349
    .local v7, newStart:I
    iget-object v11, v8, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-interface {v10, v11}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v11

    sub-int v5, v11, v0

    .line 350
    .local v5, newEnd:I
    iget-object v11, v8, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    iput v7, v11, Lco/vine/android/api/VineEntity;->start:I

    .line 351
    iget-object v11, v8, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    iput v5, v11, Lco/vine/android/api/VineEntity;->end:I

    .line 353
    new-instance v6, Lco/vine/android/api/VineEntity$Range;

    iget-object v11, v8, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    iget-object v12, v8, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v6, v5, v11, v12}, Lco/vine/android/api/VineEntity$Range;-><init>(ILco/vine/android/api/VineEntity;Landroid/text/style/ForegroundColorSpan;)V

    .line 355
    .local v6, newRange:Lco/vine/android/api/VineEntity$Range;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/NavigableMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v9, v11, v6}, Ljava/util/NavigableMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    iget-object v11, v8, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    iget v11, v11, Lco/vine/android/api/VineEntity;->end:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/NavigableMap;->ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v2

    .line 358
    goto :goto_2

    .line 359
    .end local v5           #newEnd:I
    .end local v6           #newRange:Lco/vine/android/api/VineEntity$Range;
    .end local v7           #newStart:I
    .end local v8           #range:Lco/vine/android/api/VineEntity$Range;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 343
    .end local v2           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Lco/vine/android/api/VineEntity$Range;>;"
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 363
    .end local v0           #adjustedRanges:I
    .end local v3           #i:I
    :cond_3
    invoke-interface {v9}, Ljava/util/NavigableMap;->values()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/vine/android/api/VineEntity$Range;

    .line 364
    .restart local v8       #range:Lco/vine/android/api/VineEntity$Range;
    iget-object v11, v8, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 366
    .end local v8           #range:Lco/vine/android/api/VineEntity$Range;
    :cond_4
    invoke-interface {v9}, Ljava/util/NavigableMap;->clear()V

    .line 367
    return-object v1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 371
    invoke-direct {p0}, Lco/vine/android/widget/PopupEditText;->isPopupShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 372
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mPopup:Landroid/widget/PopupWindow;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 373
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->showDropDown()V

    .line 375
    :cond_0
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mClick:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_1

    .line 376
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mClick:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 378
    :cond_1
    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 3
    .parameter "outAttrs"

    .prologue
    .line 582
    new-instance v0, Lco/vine/android/widget/PopupEditText$PopupInputConnection;

    invoke-super {p0, p1}, Landroid/widget/EditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lco/vine/android/widget/PopupEditText$PopupInputConnection;-><init>(Lco/vine/android/widget/PopupEditText;Landroid/view/inputmethod/InputConnection;Z)V

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 261
    invoke-super {p0}, Landroid/widget/EditText;->onDetachedFromWindow()V

    .line 262
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->dismissDropDown()V

    .line 263
    return-void
.end method

.method public onFilterComplete(I)V
    .locals 4
    .parameter "count"

    .prologue
    .line 225
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getSelectionEnd()I

    move-result v0

    .line 226
    .local v0, end:I
    iget-object v2, p0, Lco/vine/android/widget/PopupEditText;->mTokenizer:Landroid/widget/MultiAutoCompleteTextView$Tokenizer;

    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Landroid/widget/MultiAutoCompleteTextView$Tokenizer;->findTokenStart(Ljava/lang/CharSequence;I)I

    move-result v1

    .line 227
    .local v1, tokenStart:I
    sub-int v2, v0, v1

    iget v3, p0, Lco/vine/android/widget/PopupEditText;->mThreshold:I

    if-lt v2, v3, :cond_0

    .line 228
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->showDropDown()V

    .line 232
    :goto_0
    return-void

    .line 230
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->dismissDropDown()V

    goto :goto_0
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 0
    .parameter "focused"
    .parameter "direction"
    .parameter "previouslyFocusedRect"

    .prologue
    .line 245
    invoke-super {p0, p1, p2, p3}, Landroid/widget/EditText;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 246
    if-nez p1, :cond_0

    .line 247
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->dismissDropDown()V

    .line 249
    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 18
    .parameter
    .parameter "view"
    .parameter "pos"
    .parameter "userId"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 386
    .local p1, adapterView:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/widget/PopupEditText;->clearComposingText()V

    .line 388
    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lco/vine/android/api/VineTypeAhead;

    if-eqz v3, :cond_1

    .line 389
    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lco/vine/android/api/VineTypeAhead;

    .line 394
    .local v15, item:Lco/vine/android/api/VineTypeAhead;
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/PopupEditText;->mFilterable:Landroid/widget/Filterable;

    if-nez v3, :cond_2

    .line 395
    const-string v3, "Invalid state: mFilterable=null, type={}, token={}"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v8, v15, Lco/vine/android/api/VineTypeAhead;->type:Ljava/lang/String;

    aput-object v8, v4, v5

    const/4 v5, 0x1

    iget-object v8, v15, Lco/vine/android/api/VineTypeAhead;->token:Ljava/lang/String;

    aput-object v8, v4, v5

    invoke-static {v3, v4}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 419
    :cond_0
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/widget/PopupEditText;->dismissDropDown()V

    .line 420
    .end local v15           #item:Lco/vine/android/api/VineTypeAhead;
    :cond_1
    return-void

    .line 398
    .restart local v15       #item:Lco/vine/android/api/VineTypeAhead;
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v14

    .line 399
    .local v14, editable:Landroid/text/Editable;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/widget/PopupEditText;->getSelectionEnd()I

    move-result v10

    .line 400
    .local v10, end:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/PopupEditText;->mTokenizer:Landroid/widget/MultiAutoCompleteTextView$Tokenizer;

    invoke-interface {v3, v14, v10}, Landroid/widget/MultiAutoCompleteTextView$Tokenizer;->findTokenStart(Ljava/lang/CharSequence;I)I

    move-result v6

    .line 401
    .local v6, tokenStart:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/PopupEditText;->mTokenizer:Landroid/widget/MultiAutoCompleteTextView$Tokenizer;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/widget/PopupEditText;->mFilterable:Landroid/widget/Filterable;

    invoke-interface {v4}, Landroid/widget/Filterable;->getFilter()Landroid/widget/Filter;

    move-result-object v4

    iget-object v5, v15, Lco/vine/android/api/VineTypeAhead;->token:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/Filter;->convertResultToString(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v3, v4}, Landroid/widget/MultiAutoCompleteTextView$Tokenizer;->terminateToken(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v11

    .line 403
    .local v11, replacement:Ljava/lang/CharSequence;
    iget-object v3, v15, Lco/vine/android/api/VineTypeAhead;->token:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int v7, v6, v3

    .line 405
    .local v7, tokenEnd:I
    new-instance v2, Lco/vine/android/api/VineEntity;

    iget-object v3, v15, Lco/vine/android/api/VineTypeAhead;->type:Ljava/lang/String;

    iget-object v4, v15, Lco/vine/android/api/VineTypeAhead;->token:Ljava/lang/String;

    const/4 v5, 0x0

    move-wide/from16 v8, p4

    invoke-direct/range {v2 .. v9}, Lco/vine/android/api/VineEntity;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJ)V

    .line 408
    .local v2, entity:Lco/vine/android/api/VineEntity;
    new-instance v17, Landroid/text/SpannableStringBuilder;

    move-object/from16 v0, v17

    invoke-direct {v0, v11}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 409
    .local v17, ssb:Landroid/text/SpannableStringBuilder;
    new-instance v16, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/widget/PopupEditText;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f090076

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    move-object/from16 v0, v16

    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 411
    .local v16, span:Landroid/text/style/ForegroundColorSpan;
    const/4 v3, 0x0

    iget-object v4, v15, Lco/vine/android/api/VineTypeAhead;->token:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-static {v0, v1, v3, v4, v5}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 412
    move-object/from16 v0, v17

    invoke-interface {v14, v6, v10, v0}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 413
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/PopupEditText;->mEntityRanges:Ljava/util/NavigableMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-instance v5, Lco/vine/android/api/VineEntity$Range;

    move-object/from16 v0, v16

    invoke-direct {v5, v7, v2, v0}, Lco/vine/android/api/VineEntity$Range;-><init>(ILco/vine/android/api/VineEntity;Landroid/text/style/ForegroundColorSpan;)V

    invoke-interface {v3, v4, v5}, Ljava/util/NavigableMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/PopupEditText;->mListener:Lco/vine/android/widget/PopupEditText$PopupEditTextListener;

    if-eqz v3, :cond_0

    .line 416
    move-object/from16 v0, p0

    iget-object v8, v0, Lco/vine/android/widget/PopupEditText;->mListener:Lco/vine/android/widget/PopupEditText$PopupEditTextListener;

    move v9, v6

    move-wide/from16 v12, p4

    invoke-interface/range {v8 .. v13}, Lco/vine/android/widget/PopupEditText$PopupEditTextListener;->onPopupItemSelected(IILjava/lang/CharSequence;J)V

    goto/16 :goto_0
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v0, 0x1

    .line 451
    const/4 v1, 0x4

    if-ne p1, v1, :cond_1

    invoke-direct {p0}, Lco/vine/android/widget/PopupEditText;->isPopupShowing()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 454
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v1

    if-nez v1, :cond_0

    .line 455
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object v1

    invoke-virtual {v1, p2, p0}, Landroid/view/KeyEvent$DispatcherState;->startTracking(Landroid/view/KeyEvent;Ljava/lang/Object;)V

    .line 465
    :goto_0
    return v0

    .line 457
    :cond_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_1

    .line 458
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/view/KeyEvent$DispatcherState;->handleUpEvent(Landroid/view/KeyEvent;)V

    .line 459
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isTracking()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCanceled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 460
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->dismissDropDown()V

    goto :goto_0

    .line 465
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onSelectionChanged(II)V
    .locals 0
    .parameter "selStart"
    .parameter "selEnd"

    .prologue
    .line 147
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onSelectionChanged(II)V

    .line 148
    invoke-direct {p0, p1, p2}, Lco/vine/android/widget/PopupEditText;->atomizeEntity(II)V

    .line 149
    return-void
.end method

.method protected onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 9
    .parameter "text"
    .parameter "start"
    .parameter "lengthBefore"
    .parameter "lengthAfter"

    .prologue
    .line 170
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/EditText;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 173
    iget-object v6, p0, Lco/vine/android/widget/PopupEditText;->mEntityRanges:Ljava/util/NavigableMap;

    .line 174
    .local v6, ranges:Ljava/util/NavigableMap;,"Ljava/util/NavigableMap<Ljava/lang/Integer;Lco/vine/android/api/VineEntity$Range;>;"
    if-eqz v6, :cond_0

    invoke-interface {v6}, Ljava/util/NavigableMap;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 175
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/NavigableMap;->ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 176
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Lco/vine/android/api/VineEntity$Range;>;"
    :goto_0
    if-eqz v1, :cond_0

    .line 177
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/vine/android/api/VineEntity$Range;

    .line 178
    .local v5, range:Lco/vine/android/api/VineEntity$Range;
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 179
    .local v0, editable:Landroid/text/Editable;
    iget-object v7, v5, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-interface {v0, v7}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    .line 180
    .local v4, newStart:I
    iget-object v7, v5, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-interface {v0, v7}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v2

    .line 181
    .local v2, newEnd:I
    iget-object v7, v5, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    iput v4, v7, Lco/vine/android/api/VineEntity;->start:I

    .line 182
    iget-object v7, v5, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    iput v2, v7, Lco/vine/android/api/VineEntity;->end:I

    .line 184
    new-instance v3, Lco/vine/android/api/VineEntity$Range;

    iget-object v7, v5, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    iget-object v8, v5, Lco/vine/android/api/VineEntity$Range;->span:Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v3, v2, v7, v8}, Lco/vine/android/api/VineEntity$Range;-><init>(ILco/vine/android/api/VineEntity;Landroid/text/style/ForegroundColorSpan;)V

    .line 185
    .local v3, newRange:Lco/vine/android/api/VineEntity$Range;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/NavigableMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7, v3}, Ljava/util/NavigableMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    iget-object v7, v5, Lco/vine/android/api/VineEntity$Range;->entity:Lco/vine/android/api/VineEntity;

    iget v7, v7, Lco/vine/android/api/VineEntity;->end:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/NavigableMap;->ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 188
    goto :goto_0

    .line 191
    .end local v0           #editable:Landroid/text/Editable;
    .end local v1           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Lco/vine/android/api/VineEntity$Range;>;"
    .end local v2           #newEnd:I
    .end local v3           #newRange:Lco/vine/android/api/VineEntity$Range;
    .end local v4           #newStart:I
    .end local v5           #range:Lco/vine/android/api/VineEntity$Range;
    :cond_0
    iget-object v7, p0, Lco/vine/android/widget/PopupEditText;->mSelectedEntity:Lco/vine/android/api/VineEntity;

    if-eqz v7, :cond_2

    .line 192
    iget-object v7, p0, Lco/vine/android/widget/PopupEditText;->mSelectedEntity:Lco/vine/android/api/VineEntity;

    iget v7, v7, Lco/vine/android/api/VineEntity;->start:I

    const/4 v8, 0x0

    invoke-virtual {p0, v7, v8}, Lco/vine/android/widget/PopupEditText;->clearSelectedEntity(IZ)Z

    .line 196
    :goto_1
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x10

    if-ge v7, v8, :cond_1

    .line 198
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getSelectionStart()I

    move-result v7

    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getSelectionEnd()I

    move-result v8

    invoke-direct {p0, v7, v8}, Lco/vine/android/widget/PopupEditText;->atomizeEntity(II)V

    .line 200
    :cond_1
    return-void

    .line 194
    :cond_2
    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Lco/vine/android/widget/PopupEditText;->performFilter(Z)V

    goto :goto_1
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .parameter "hasWindowFocus"

    .prologue
    .line 253
    invoke-super {p0, p1}, Landroid/widget/EditText;->onWindowFocusChanged(Z)V

    .line 254
    if-nez p1, :cond_0

    .line 255
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->dismissDropDown()V

    .line 257
    :cond_0
    return-void
.end method

.method public performFilter(Z)V
    .locals 7
    .parameter "triggerCallback"

    .prologue
    const/4 v5, 0x0

    .line 203
    iget-object v4, p0, Lco/vine/android/widget/PopupEditText;->mTokenizer:Landroid/widget/MultiAutoCompleteTextView$Tokenizer;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lco/vine/android/widget/PopupEditText;->mFilterable:Landroid/widget/Filterable;

    if-nez v4, :cond_1

    .line 219
    :cond_0
    :goto_0
    return-void

    .line 207
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getSelectionEnd()I

    move-result v0

    .line 208
    .local v0, end:I
    if-ltz v0, :cond_0

    .line 212
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    .line 213
    .local v2, text:Ljava/lang/CharSequence;
    iget-object v4, p0, Lco/vine/android/widget/PopupEditText;->mTokenizer:Landroid/widget/MultiAutoCompleteTextView$Tokenizer;

    invoke-interface {v4, v2, v0}, Landroid/widget/MultiAutoCompleteTextView$Tokenizer;->findTokenStart(Ljava/lang/CharSequence;I)I

    move-result v3

    .line 214
    .local v3, tokenStart:I
    iget-object v1, p0, Lco/vine/android/widget/PopupEditText;->mHandler:Lco/vine/android/widget/PopupEditText$FilterHandler;

    .line 215
    .local v1, handler:Landroid/os/Handler;
    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 216
    if-eqz p1, :cond_2

    const/4 v4, 0x1

    :goto_1
    invoke-interface {v2, v3, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v1, v5, v4, v5, v6}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    iget-wide v5, p0, Lco/vine/android/widget/PopupEditText;->mThrottleDelay:J

    invoke-virtual {v1, v4, v5, v6}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    :cond_2
    move v4, v5

    goto :goto_1
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2
    .parameter "adapter"

    .prologue
    .line 439
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    .line 440
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lco/vine/android/widget/PopupEditText;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 444
    :goto_0
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mDropDownList:Lco/vine/android/widget/PopupEditText$DropDownListView;

    invoke-virtual {v0, p1}, Lco/vine/android/widget/PopupEditText$DropDownListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 445
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 446
    iput-object p1, p0, Lco/vine/android/widget/PopupEditText;->mAdapter:Landroid/widget/ListAdapter;

    .line 447
    return-void

    .line 442
    :cond_0
    new-instance v0, Lco/vine/android/widget/PopupEditText$AdapterObserver;

    invoke-direct {v0, p0}, Lco/vine/android/widget/PopupEditText$AdapterObserver;-><init>(Lco/vine/android/widget/PopupEditText;)V

    iput-object v0, p0, Lco/vine/android/widget/PopupEditText;->mDataSetObserver:Landroid/database/DataSetObserver;

    goto :goto_0
.end method

.method protected setFrame(IIII)Z
    .locals 2
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 236
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/EditText;->setFrame(IIII)Z

    move-result v0

    .line 237
    .local v0, result:Z
    invoke-direct {p0}, Lco/vine/android/widget/PopupEditText;->isPopupShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 238
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->showDropDown()V

    .line 240
    :cond_0
    return v0
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 267
    iput-object p1, p0, Lco/vine/android/widget/PopupEditText;->mClick:Landroid/view/View$OnClickListener;

    .line 268
    return-void
.end method

.method public setPopupEditTextListener(Lco/vine/android/widget/PopupEditText$PopupEditTextListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 381
    iput-object p1, p0, Lco/vine/android/widget/PopupEditText;->mListener:Lco/vine/android/widget/PopupEditText$PopupEditTextListener;

    .line 382
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mHandler:Lco/vine/android/widget/PopupEditText$FilterHandler;

    invoke-virtual {v0, p1}, Lco/vine/android/widget/PopupEditText$FilterHandler;->setOnFilterListener(Lco/vine/android/widget/PopupEditText$PopupEditTextListener;)V

    .line 383
    return-void
.end method

.method public setTokenizer(Landroid/widget/MultiAutoCompleteTextView$Tokenizer;Landroid/widget/Filterable;J)V
    .locals 2
    .parameter "tokenizer"
    .parameter "filter"
    .parameter "throttleDelay"

    .prologue
    .line 132
    if-nez p1, :cond_0

    .line 133
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "tokenizer cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_0
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mAdapter:Landroid/widget/ListAdapter;

    if-nez v0, :cond_1

    .line 136
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setAdapter must be called first with a non-null adapter"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 139
    :cond_1
    iput-object p2, p0, Lco/vine/android/widget/PopupEditText;->mFilterable:Landroid/widget/Filterable;

    .line 140
    iput-object p1, p0, Lco/vine/android/widget/PopupEditText;->mTokenizer:Landroid/widget/MultiAutoCompleteTextView$Tokenizer;

    .line 141
    iput-wide p3, p0, Lco/vine/android/widget/PopupEditText;->mThrottleDelay:J

    .line 142
    iget-object v0, p0, Lco/vine/android/widget/PopupEditText;->mHandler:Lco/vine/android/widget/PopupEditText$FilterHandler;

    invoke-virtual {v0, p2}, Lco/vine/android/widget/PopupEditText$FilterHandler;->setFilterable(Landroid/widget/Filterable;)V

    .line 143
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .locals 3
    .parameter "tf"
    .parameter "style"

    .prologue
    .line 81
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 83
    .local v0, context:Landroid/content/Context;
    invoke-static {v0}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p2, v2}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 84
    return-void
.end method

.method public showDropDown()V
    .locals 5

    .prologue
    .line 272
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getWindowVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_0

    .line 295
    :goto_0
    return-void

    .line 276
    :cond_0
    iget-object v3, p0, Lco/vine/android/widget/PopupEditText;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    .line 277
    .local v0, count:I
    if-nez v0, :cond_1

    .line 279
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->dismissDropDown()V

    .line 280
    const/4 v3, 0x1

    iput-boolean v3, p0, Lco/vine/android/widget/PopupEditText;->mShowRequested:Z

    goto :goto_0

    .line 285
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/widget/PopupEditText;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v2

    .line 286
    .local v2, width:I
    iget-object v1, p0, Lco/vine/android/widget/PopupEditText;->mPopup:Landroid/widget/PopupWindow;

    .line 287
    .local v1, p:Landroid/widget/PopupWindow;
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v3

    if-nez v3, :cond_2

    .line 288
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 289
    iget v3, p0, Lco/vine/android/widget/PopupEditText;->mDropDownHorizontalOffset:I

    iget v4, p0, Lco/vine/android/widget/PopupEditText;->mDropDownVerticalOffset:I

    invoke-virtual {v1, p0, v3, v4}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 290
    iget-object v3, p0, Lco/vine/android/widget/PopupEditText;->mListener:Lco/vine/android/widget/PopupEditText$PopupEditTextListener;

    if-eqz v3, :cond_2

    .line 291
    iget-object v3, p0, Lco/vine/android/widget/PopupEditText;->mListener:Lco/vine/android/widget/PopupEditText$PopupEditTextListener;

    invoke-interface {v3}, Lco/vine/android/widget/PopupEditText$PopupEditTextListener;->onPopupShown()V

    .line 294
    :cond_2
    iget-object v3, p0, Lco/vine/android/widget/PopupEditText;->mDropDownList:Lco/vine/android/widget/PopupEditText$DropDownListView;

    invoke-virtual {v3}, Lco/vine/android/widget/PopupEditText$DropDownListView;->setSelectionAfterHeaderView()V

    goto :goto_0
.end method
