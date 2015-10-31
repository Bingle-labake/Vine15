.class public Lco/vine/android/TagsAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "TagsAdapter.java"


# instance fields
.field protected final mAppController:Lco/vine/android/client/AppController;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lco/vine/android/client/AppController;I)V
    .locals 1
    .parameter "context"
    .parameter "appController"
    .parameter "flags"

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p3}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 44
    iput-object p2, p0, Lco/vine/android/TagsAdapter;->mAppController:Lco/vine/android/client/AppController;

    .line 45
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 8
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 60
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/widget/TagViewHolder;

    .line 62
    .local v2, holder:Lco/vine/android/widget/TagViewHolder;
    const/4 v5, 0x2

    invoke-interface {p3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 63
    .local v4, tagName:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 64
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090069

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 65
    .local v1, grayColor:I
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v0, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 66
    .local v0, colorSpan:Landroid/text/style/ForegroundColorSpan;
    new-instance v3, Landroid/text/SpannableStringBuilder;

    const-string v5, "#"

    invoke-direct {v3, v5}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 67
    .local v3, ssb:Landroid/text/SpannableStringBuilder;
    const/4 v5, 0x0

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    const/16 v7, 0x21

    invoke-static {v3, v0, v5, v6, v7}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 68
    invoke-virtual {v3, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 69
    iget-object v5, v2, Lco/vine/android/widget/TagViewHolder;->tagTitle:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    iput-object v4, v2, Lco/vine/android/widget/TagViewHolder;->tagName:Ljava/lang/String;

    .line 72
    .end local v0           #colorSpan:Landroid/text/style/ForegroundColorSpan;
    .end local v1           #grayColor:I
    .end local v3           #ssb:Landroid/text/SpannableStringBuilder;
    :cond_0
    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "context"
    .parameter "cursor"
    .parameter "parent"

    .prologue
    .line 49
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 50
    .local v1, layoutInflater:Landroid/view/LayoutInflater;
    const v3, 0x7f03006a

    const/4 v4, 0x0

    invoke-virtual {v1, v3, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 52
    .local v2, v:Landroid/view/View;
    new-instance v0, Lco/vine/android/widget/TagViewHolder;

    invoke-direct {v0, v2}, Lco/vine/android/widget/TagViewHolder;-><init>(Landroid/view/View;)V

    .line 54
    .local v0, holder:Lco/vine/android/widget/TagViewHolder;
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 55
    return-object v2
.end method
