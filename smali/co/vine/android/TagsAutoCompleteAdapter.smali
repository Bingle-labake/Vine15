.class public Lco/vine/android/TagsAutoCompleteAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "TagsAutoCompleteAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;
    }
.end annotation


# instance fields
.field protected final mViewHolders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lco/vine/android/client/AppController;)V
    .locals 2
    .parameter "activity"
    .parameter "appController"

    .prologue
    .line 30
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/TagsAutoCompleteAdapter;->mViewHolders:Ljava/util/ArrayList;

    .line 32
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 4
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 46
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;

    .line 47
    .local v0, holder:Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;
    const/4 v1, 0x1

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;->userId:J

    .line 48
    iget-object v1, v0, Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;->tagName:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x2

    invoke-interface {p3, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    return-void
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 6
    .parameter "position"

    .prologue
    .line 53
    invoke-super {p0, p1}, Landroid/support/v4/widget/CursorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 56
    .local v0, c:Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 57
    const/4 v4, 0x1

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 58
    .local v1, id:J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "#"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x2

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 63
    .local v3, tagName:Ljava/lang/String;
    :goto_0
    new-instance v4, Lco/vine/android/api/VineTypeAhead;

    const-string v5, "tag"

    invoke-direct {v4, v5, v3, v1, v2}, Lco/vine/android/api/VineTypeAhead;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    return-object v4

    .line 60
    .end local v1           #id:J
    .end local v3           #tagName:Ljava/lang/String;
    :cond_0
    const-wide/16 v1, 0x0

    .line 61
    .restart local v1       #id:J
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3}, Ljava/lang/String;-><init>()V

    .restart local v3       #tagName:Ljava/lang/String;
    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 3
    .parameter "position"

    .prologue
    .line 68
    invoke-super {p0, p1}, Landroid/support/v4/widget/CursorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 69
    .local v0, c:Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 70
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 72
    :goto_0
    return-wide v1

    :cond_0
    const-wide/16 v1, 0x0

    goto :goto_0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "context"
    .parameter "cursor"
    .parameter "parent"

    .prologue
    .line 36
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 37
    .local v0, layoutInflater:Landroid/view/LayoutInflater;
    const v3, 0x7f03006a

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 38
    .local v1, rowView:Landroid/view/View;
    new-instance v2, Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;

    invoke-direct {v2, p0, v1}, Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;-><init>(Lco/vine/android/TagsAutoCompleteAdapter;Landroid/view/View;)V

    .line 39
    .local v2, vh:Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;
    iget-object v3, p0, Lco/vine/android/TagsAutoCompleteAdapter;->mViewHolders:Ljava/util/ArrayList;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 41
    return-object v1
.end method
