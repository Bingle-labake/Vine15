.class public Lco/vine/android/ComposeFilter;
.super Landroid/widget/Filter;
.source "ComposeFilter.java"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mCallback:Lco/vine/android/widget/PopupEditText$PopupEditTextListener;

.field private mUserId:J


# direct methods
.method public constructor <init>(Lco/vine/android/widget/PopupEditText$PopupEditTextListener;J)V
    .locals 1
    .parameter "callback"
    .parameter "userId"

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    move-object v0, p1

    .line 26
    check-cast v0, Landroid/support/v4/app/Fragment;

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/ComposeFilter;->mActivity:Landroid/app/Activity;

    .line 27
    iput-object p1, p0, Lco/vine/android/ComposeFilter;->mCallback:Lco/vine/android/widget/PopupEditText$PopupEditTextListener;

    .line 28
    iput-wide p2, p0, Lco/vine/android/ComposeFilter;->mUserId:J

    .line 29
    return-void
.end method


# virtual methods
.method protected performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .locals 9
    .parameter "constraint"

    .prologue
    const/4 v2, 0x0

    .line 33
    new-instance v7, Landroid/widget/Filter$FilterResults;

    invoke-direct {v7}, Landroid/widget/Filter$FilterResults;-><init>()V

    .line 34
    .local v7, filterResults:Landroid/widget/Filter$FilterResults;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 35
    const/4 v0, 0x1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-interface {p1, v0, v4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v8

    .line 38
    .local v8, plainConstraint:Ljava/lang/CharSequence;
    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 39
    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 44
    .local v3, selection:Ljava/lang/String;
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "@"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 45
    sget-object v0, Lco/vine/android/provider/VineSuggestionsProvider;->USERS_URI:Landroid/net/Uri;

    iget-wide v4, p0, Lco/vine/android/ComposeFilter;->mUserId:J

    invoke-static {v0, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 51
    .local v1, uri:Landroid/net/Uri;
    :goto_1
    if-eqz v1, :cond_0

    .line 52
    iget-object v0, p0, Lco/vine/android/ComposeFilter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 58
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 59
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    iput v0, v7, Landroid/widget/Filter$FilterResults;->count:I

    .line 60
    iput-object v6, v7, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 64
    .end local v1           #uri:Landroid/net/Uri;
    .end local v3           #selection:Ljava/lang/String;
    .end local v6           #cursor:Landroid/database/Cursor;
    .end local v8           #plainConstraint:Ljava/lang/CharSequence;
    :cond_0
    return-object v7

    .line 41
    .restart local v8       #plainConstraint:Ljava/lang/CharSequence;
    :cond_1
    const/4 v3, 0x0

    .restart local v3       #selection:Ljava/lang/String;
    goto :goto_0

    .line 46
    :cond_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "#"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 47
    sget-object v1, Lco/vine/android/provider/VineSuggestionsProvider;->TAGS_URI:Landroid/net/Uri;

    .restart local v1       #uri:Landroid/net/Uri;
    goto :goto_1

    .line 49
    .end local v1           #uri:Landroid/net/Uri;
    :cond_3
    const/4 v1, 0x0

    .restart local v1       #uri:Landroid/net/Uri;
    goto :goto_1
.end method

.method protected publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .locals 4
    .parameter "constraint"
    .parameter "results"

    .prologue
    .line 69
    iget-object v3, p0, Lco/vine/android/ComposeFilter;->mCallback:Lco/vine/android/widget/PopupEditText$PopupEditTextListener;

    invoke-interface {v3}, Lco/vine/android/widget/PopupEditText$PopupEditTextListener;->getPopupAdapter()Landroid/support/v4/widget/CursorAdapter;

    move-result-object v2

    .line 70
    .local v2, typeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;
    invoke-virtual {v2}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    .line 71
    .local v1, prevCursor:Landroid/database/Cursor;
    if-eqz v1, :cond_0

    .line 72
    iget-object v3, p0, Lco/vine/android/ComposeFilter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3, v1}, Landroid/app/Activity;->stopManagingCursor(Landroid/database/Cursor;)V

    .line 74
    :cond_0
    iget-object v0, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast v0, Landroid/database/Cursor;

    .line 75
    .local v0, cursor:Landroid/database/Cursor;
    if-eqz v0, :cond_1

    .line 76
    iget-object v3, p0, Lco/vine/android/ComposeFilter;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3, v0}, Landroid/app/Activity;->startManagingCursor(Landroid/database/Cursor;)V

    .line 78
    :cond_1
    invoke-virtual {v2, v0}, Landroid/support/v4/widget/CursorAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 79
    return-void
.end method
