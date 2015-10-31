.class public Lco/vine/android/CommentsFragment;
.super Lco/vine/android/BaseListFragment;
.source "CommentsFragment.java"

# interfaces
.implements Lco/vine/android/widget/SpanClickListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/widget/Filterable;
.implements Lco/vine/android/widget/PopupEditText$PopupEditTextListener;
.implements Lco/vine/android/widget/ConversationList$GetMoreListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/CommentsFragment$CommentsAppSessionListener;
    }
.end annotation


# static fields
.field public static final ARG_HIDE_KEYBOARD:Ljava/lang/String; = "hide_keyboard"

.field public static final ARG_POST_AUTHOR_ID:Ljava/lang/String; = "post_author_id"

.field public static final ARG_POST_ID:Ljava/lang/String; = "post_id"

.field public static final DEFAULT_PAGE_SIZE:I = 0x14

.field private static final EVENT_SOURCE_TITLE:Ljava/lang/String; = "Comments List"

.field private static final MAX_CHARS:I = 0x8c

.field private static final STATE_FETCHED:Ljava/lang/String; = "fetched"

.field private static mActionMode:Landroid/support/v7/view/ActionMode;

.field private static mSelectedCommentId:Ljava/lang/String;


# instance fields
.field private final DATE_FORMAT:Ljava/text/SimpleDateFormat;

.field private final mActionModeCallback:Landroid/support/v7/view/ActionMode$Callback;

.field private mEdit:Lco/vine/android/widget/PopupEditText;

.field private mFetched:Z

.field private mFilter:Landroid/widget/Filter;

.field private mLastTopItemId:J

.field private mLastTopItemPixelOffset:I

.field private mPostAuthorId:J

.field private mPostId:J

.field private mSelectedView:Landroid/view/View;

.field private mTagsAdapter:Lco/vine/android/TagsAutoCompleteAdapter;

.field private mTokenizer:Lco/vine/android/ComposeTokenizer;

.field private mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

.field private mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 53
    invoke-direct {p0}, Lco/vine/android/BaseListFragment;-><init>()V

    .line 69
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0}, Ljava/text/SimpleDateFormat;-><init>()V

    iput-object v0, p0, Lco/vine/android/CommentsFragment;->DATE_FORMAT:Ljava/text/SimpleDateFormat;

    .line 82
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lco/vine/android/CommentsFragment;->mLastTopItemId:J

    .line 83
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/CommentsFragment;->mLastTopItemPixelOffset:I

    .line 378
    new-instance v0, Lco/vine/android/CommentsFragment$1;

    invoke-direct {v0, p0}, Lco/vine/android/CommentsFragment$1;-><init>(Lco/vine/android/CommentsFragment;)V

    iput-object v0, p0, Lco/vine/android/CommentsFragment;->mActionModeCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 502
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/CommentsFragment;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 53
    iget-wide v0, p0, Lco/vine/android/CommentsFragment;->mPostId:J

    return-wide v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lco/vine/android/CommentsFragment;->mSelectedCommentId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/CommentsFragment;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mSelectedView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$302(Landroid/support/v7/view/ActionMode;)Landroid/support/v7/view/ActionMode;
    .locals 0
    .parameter "x0"

    .prologue
    .line 53
    sput-object p0, Lco/vine/android/CommentsFragment;->mActionMode:Landroid/support/v7/view/ActionMode;

    return-object p0
.end method

.method static synthetic access$400(Lco/vine/android/CommentsFragment;)Lco/vine/android/UsersAutoCompleteAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;

    return-object v0
.end method

.method static synthetic access$500(Lco/vine/android/CommentsFragment;)Lco/vine/android/widget/PopupEditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    return-object v0
.end method

.method private editTextLength()I
    .locals 1

    .prologue
    .line 292
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v0}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method private fetchContent(I)V
    .locals 6
    .parameter "fetchType"

    .prologue
    const/16 v5, 0x14

    const/4 v4, 0x3

    const/4 v3, 0x1

    .line 229
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->hasPendingRequest()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 249
    :goto_0
    return-void

    .line 232
    :cond_0
    iput-boolean v3, p0, Lco/vine/android/CommentsFragment;->mFetched:Z

    .line 233
    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 241
    :pswitch_1
    invoke-virtual {p0, v3}, Lco/vine/android/CommentsFragment;->showProgress(I)V

    .line 242
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v1, p0, Lco/vine/android/CommentsFragment;->mPostId:J

    invoke-virtual {v0, v1, v2, v4, v5}, Lco/vine/android/client/AppController;->fetchComments(JII)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/CommentsFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 235
    :pswitch_2
    invoke-virtual {p0, v4}, Lco/vine/android/CommentsFragment;->showProgress(I)V

    .line 236
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v1, p0, Lco/vine/android/CommentsFragment;->mPostId:J

    invoke-virtual {v0, v1, v2, v3, v5}, Lco/vine/android/client/AppController;->fetchComments(JII)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/CommentsFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 233
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private insertText(Ljava/lang/String;)V
    .locals 3
    .parameter "toInsert"

    .prologue
    .line 183
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    if-eqz v2, :cond_0

    .line 184
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->getSelectionStart()I

    move-result v1

    .line 185
    .local v1, selStart:I
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->getSelectionEnd()I

    move-result v0

    .line 186
    .local v0, selEnd:I
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    if-eqz v2, :cond_0

    if-ltz v1, :cond_0

    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->length()I

    move-result v2

    if-gt v0, v2, :cond_0

    .line 187
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v2}, Lco/vine/android/widget/PopupEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v1, v0, p1}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 190
    .end local v0           #selEnd:I
    .end local v1           #selStart:I
    :cond_0
    return-void
.end method

.method private saveTopItemInfo()V
    .locals 4

    .prologue
    .line 252
    iget-object v1, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->getCount()I

    move-result v1

    if-nez v1, :cond_1

    .line 260
    :cond_0
    :goto_0
    return-void

    .line 255
    :cond_1
    iget-object v1, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/CursorAdapter;->getItemId(I)J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/CommentsFragment;->mLastTopItemId:J

    .line 256
    iget-object v1, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    iget-object v3, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 257
    .local v0, topChild:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 258
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v1

    iput v1, p0, Lco/vine/android/CommentsFragment;->mLastTopItemPixelOffset:I

    goto :goto_0
.end method

.method private sendComment()V
    .locals 3

    .prologue
    .line 368
    invoke-direct {p0}, Lco/vine/android/CommentsFragment;->editTextLength()I

    move-result v0

    const/16 v1, 0x8c

    if-le v0, v1, :cond_0

    .line 369
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0e005d

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showTopToast(Landroid/content/Context;I)V

    .line 375
    :goto_0
    return-void

    .line 371
    :cond_0
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {p0, v0}, Lco/vine/android/CommentsFragment;->postComment(Landroid/widget/EditText;)V

    .line 372
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lco/vine/android/util/Util;->setSoftInputVisibility(Landroid/content/Context;Landroid/view/View;Z)V

    .line 373
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v0}, Lco/vine/android/widget/PopupEditText;->clearFocus()V

    goto :goto_0
.end method

.method private validate(Landroid/widget/EditText;)Z
    .locals 1
    .parameter "editText"

    .prologue
    .line 288
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/widget/EditText;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getFilter()Landroid/widget/Filter;
    .locals 3

    .prologue
    .line 426
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mFilter:Landroid/widget/Filter;

    if-nez v2, :cond_0

    .line 427
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v0

    .line 428
    .local v0, activeId:J
    new-instance v2, Lco/vine/android/ComposeFilter;

    invoke-direct {v2, p0, v0, v1}, Lco/vine/android/ComposeFilter;-><init>(Lco/vine/android/widget/PopupEditText$PopupEditTextListener;J)V

    iput-object v2, p0, Lco/vine/android/CommentsFragment;->mFilter:Landroid/widget/Filter;

    .line 430
    .end local v0           #activeId:J
    :cond_0
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mFilter:Landroid/widget/Filter;

    return-object v2
.end method

.method public getMore()V
    .locals 1

    .prologue
    .line 483
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lco/vine/android/CommentsFragment;->fetchContent(I)V

    .line 484
    return-void
.end method

.method public getPopupAdapter()Landroid/support/v4/widget/CursorAdapter;
    .locals 1

    .prologue
    .line 411
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    return-object v0
.end method

.method public hideProgress(I)V
    .locals 1
    .parameter "fetchType"

    .prologue
    .line 496
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->hideProgress(I)V

    .line 497
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 498
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    check-cast v0, Lco/vine/android/widget/ConversationList;

    invoke-virtual {v0}, Lco/vine/android/widget/ConversationList;->hideProgress()V

    .line 500
    :cond_0
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 133
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 134
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "hide_keyboard"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 135
    .local v0, hideKeyboard:Z
    if-nez v0, :cond_0

    .line 136
    iget-object v1, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v1}, Lco/vine/android/widget/PopupEditText;->requestFocus()Z

    .line 137
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lco/vine/android/util/Util;->setSoftInputVisibility(Landroid/content/Context;Landroid/view/View;Z)V

    .line 139
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "view"

    .prologue
    .line 297
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 303
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/CommentViewHolder;

    .line 304
    .local v0, h:Lco/vine/android/CommentViewHolder;
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-wide v2, v0, Lco/vine/android/CommentViewHolder;->userId:J

    const-string v4, "Comments List"

    invoke-static {v1, v2, v3, v4}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    .line 308
    .end local v0           #h:Lco/vine/android/CommentViewHolder;
    :goto_0
    return-void

    .line 299
    :pswitch_0
    invoke-direct {p0}, Lco/vine/android/CommentsFragment;->sendComment()V

    goto :goto_0

    .line 297
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0063
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 87
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 88
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->DATE_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0e0089

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    .line 90
    if-eqz p1, :cond_0

    .line 91
    const-string v0, "fetched"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    const-string v0, "fetched"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/CommentsFragment;->mFetched:Z

    .line 96
    :cond_0
    new-instance v0, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;

    invoke-direct {v0, p0}, Lco/vine/android/CommentsFragment$CommentsAppSessionListener;-><init>(Lco/vine/android/CommentsFragment;)V

    iput-object v0, p0, Lco/vine/android/CommentsFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 97
    new-instance v0, Lco/vine/android/UsersAutoCompleteAdapter;

    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-direct {v0, v1, v2}, Lco/vine/android/UsersAutoCompleteAdapter;-><init>(Landroid/app/Activity;Lco/vine/android/client/AppController;)V

    iput-object v0, p0, Lco/vine/android/CommentsFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;

    .line 98
    new-instance v0, Lco/vine/android/TagsAutoCompleteAdapter;

    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-direct {v0, v1, v2}, Lco/vine/android/TagsAutoCompleteAdapter;-><init>(Landroid/app/Activity;Lco/vine/android/client/AppController;)V

    iput-object v0, p0, Lco/vine/android/CommentsFragment;->mTagsAdapter:Lco/vine/android/TagsAutoCompleteAdapter;

    .line 99
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mTagsAdapter:Lco/vine/android/TagsAutoCompleteAdapter;

    iput-object v0, p0, Lco/vine/android/CommentsFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 101
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/CommentsFragment;->setHasOptionsMenu(Z)V

    .line 102
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 9
    .parameter "id"
    .parameter "args"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 200
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$Comments;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$CommentsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v4, "post_id=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    iget-wide v7, p0, Lco/vine/android/CommentsFragment;->mPostId:J

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 160
    const v0, 0x7f100001

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 161
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 162
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 107
    const v0, 0x7f030021

    invoke-virtual {p0, p1, v0, p2}, Lco/vine/android/CommentsFragment;->createView(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 153
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onDestroy()V

    .line 154
    invoke-static {}, Lco/vine/android/provider/VineSuggestionsProvider;->clearRealtimeUserSuggestions()V

    .line 155
    invoke-static {}, Lco/vine/android/provider/VineSuggestionsProvider;->clearRealtimeTagSuggestions()V

    .line 156
    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "actionId"
    .parameter "event"

    .prologue
    .line 354
    invoke-virtual {p1}, Landroid/widget/TextView;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 362
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 356
    :pswitch_0
    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    .line 357
    invoke-direct {p0}, Lco/vine/android/CommentsFragment;->sendComment()V

    .line 359
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 354
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0064
        :pswitch_0
    .end packed-switch
.end method

.method public onFiltering(Ljava/lang/CharSequence;)V
    .locals 7
    .parameter "constraint"

    .prologue
    const/4 v5, 0x0

    const/4 v0, 0x1

    .line 443
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 445
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 448
    .local v3, selection:Ljava/lang/String;
    const-string v6, "@"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 449
    const-string v4, "mention"

    .line 450
    .local v4, type:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 458
    .local v2, query:Ljava/lang/String;
    :goto_0
    iget-object v6, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v6, v4}, Lco/vine/android/client/AppController;->getTypeaheadFetchThreshold(Ljava/lang/String;)I

    move-result v1

    .line 460
    .local v1, fetchThreshold:I
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-lt v6, v1, :cond_0

    .line 462
    const-string v6, "mention"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 463
    invoke-static {v2}, Lco/vine/android/provider/VineSuggestionsProvider;->getRealtimeUserSuggestions(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    if-nez v6, :cond_3

    .line 470
    .local v0, fetch:Z
    :goto_1
    if-eqz v0, :cond_0

    .line 471
    const-string v5, "mention"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 472
    iget-object v5, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v2}, Lco/vine/android/client/AppController;->fetchUserTypeahead(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lco/vine/android/CommentsFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 479
    .end local v0           #fetch:Z
    .end local v1           #fetchThreshold:I
    .end local v2           #query:Ljava/lang/String;
    .end local v3           #selection:Ljava/lang/String;
    .end local v4           #type:Ljava/lang/String;
    :cond_0
    :goto_2
    return-void

    .line 451
    .restart local v3       #selection:Ljava/lang/String;
    :cond_1
    const-string v6, "#"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 452
    const-string v4, "tag"

    .line 453
    .restart local v4       #type:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #query:Ljava/lang/String;
    goto :goto_0

    .line 455
    .end local v2           #query:Ljava/lang/String;
    .end local v4           #type:Ljava/lang/String;
    :cond_2
    const/4 v4, 0x0

    .line 456
    .restart local v4       #type:Ljava/lang/String;
    const/4 v2, 0x0

    .restart local v2       #query:Ljava/lang/String;
    goto :goto_0

    .restart local v1       #fetchThreshold:I
    :cond_3
    move v0, v5

    .line 463
    goto :goto_1

    .line 464
    :cond_4
    const-string v6, "tag"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 465
    invoke-static {v2}, Lco/vine/android/provider/VineSuggestionsProvider;->getRealtimeTagSuggestions(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    if-nez v6, :cond_5

    .restart local v0       #fetch:Z
    :goto_3
    goto :goto_1

    .end local v0           #fetch:Z
    :cond_5
    move v0, v5

    goto :goto_3

    .line 467
    :cond_6
    const/4 v0, 0x0

    .restart local v0       #fetch:Z
    goto :goto_1

    .line 473
    :cond_7
    const-string v5, "tag"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 474
    iget-object v5, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v2}, Lco/vine/android/client/AppController;->fetchTagTypeahead(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lco/vine/android/CommentsFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_2
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .parameter
    .parameter "view"
    .parameter "i"
    .parameter "l"
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
    .line 283
    .local p1, adapterView:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/CommentViewHolder;

    .line 284
    .local v0, h:Lco/vine/android/CommentViewHolder;
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-wide v2, v0, Lco/vine/android/CommentViewHolder;->userId:J

    const-string v4, "Comments List"

    invoke-static {v1, v2, v3, v4}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    .line 285
    return-void
.end method

.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 7
    .parameter
    .parameter "view"
    .parameter "i"
    .parameter "l"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .local p1, adapterView:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 329
    sget-object v5, Lco/vine/android/CommentsFragment;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-eqz v5, :cond_1

    .line 349
    :cond_0
    :goto_0
    return v3

    .line 334
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    instance-of v5, v5, Lco/vine/android/CommentViewHolder;

    if-eqz v5, :cond_0

    .line 337
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/CommentViewHolder;

    .line 340
    .local v0, commentViewHolder:Lco/vine/android/CommentViewHolder;
    iget-object v5, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v1

    .line 341
    .local v1, userId:J
    iget-wide v5, v0, Lco/vine/android/CommentViewHolder;->userId:J

    cmp-long v5, v1, v5

    if-eqz v5, :cond_2

    iget-wide v5, p0, Lco/vine/android/CommentsFragment;->mPostAuthorId:J

    cmp-long v5, v1, v5

    if-nez v5, :cond_0

    .line 345
    :cond_2
    iput-object p2, p0, Lco/vine/android/CommentsFragment;->mSelectedView:Landroid/view/View;

    .line 346
    iget-object v3, p0, Lco/vine/android/CommentsFragment;->mSelectedView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setSelected(Z)V

    .line 347
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/CommentViewHolder;

    iget-object v3, v3, Lco/vine/android/CommentViewHolder;->commentId:Ljava/lang/String;

    sput-object v3, Lco/vine/android/CommentsFragment;->mSelectedCommentId:Ljava/lang/String;

    .line 348
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    check-cast v3, Landroid/support/v7/app/ActionBarActivity;

    iget-object v5, p0, Lco/vine/android/CommentsFragment;->mActionModeCallback:Landroid/support/v7/view/ActionMode$Callback;

    invoke-virtual {v3, v5}, Landroid/support/v7/app/ActionBarActivity;->startSupportActionMode(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;

    move-result-object v3

    sput-object v3, Lco/vine/android/CommentsFragment;->mActionMode:Landroid/support/v7/view/ActionMode;

    move v3, v4

    .line 349
    goto :goto_0
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 0
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 278
    invoke-super/range {p0 .. p5}, Lco/vine/android/BaseListFragment;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V

    .line 279
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 4
    .parameter
    .parameter "cursor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    const/4 v2, 0x3

    const/4 v1, 0x0

    .line 209
    invoke-direct {p0}, Lco/vine/android/CommentsFragment;->saveTopItemInfo()V

    .line 210
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    .line 211
    iget-boolean v0, p0, Lco/vine/android/CommentsFragment;->mFetched:Z

    if-nez v0, :cond_1

    .line 212
    invoke-direct {p0, v2}, Lco/vine/android/CommentsFragment;->fetchContent(I)V

    .line 223
    :goto_0
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    check-cast v0, Lco/vine/android/CommentsAdapter;

    invoke-virtual {v0}, Lco/vine/android/CommentsAdapter;->atLastPage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 224
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    check-cast v0, Lco/vine/android/widget/ConversationList;

    invoke-virtual {v0}, Lco/vine/android/widget/ConversationList;->deactivateRefresh()V

    .line 226
    :cond_0
    return-void

    .line 214
    :cond_1
    invoke-virtual {p0, v2}, Lco/vine/android/CommentsFragment;->hideProgress(I)V

    .line 215
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 216
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lco/vine/android/CommentsFragment;->showSadface(ZZ)V

    goto :goto_0

    .line 218
    :cond_2
    invoke-virtual {p0, v1}, Lco/vine/android/CommentsFragment;->showSadface(Z)V

    .line 219
    iget-object v1, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    check-cast v0, Lco/vine/android/CommentsAdapter;

    iget-wide v2, p0, Lco/vine/android/CommentsFragment;->mLastTopItemId:J

    invoke-virtual {v0, v2, v3}, Lco/vine/android/CommentsAdapter;->getPositionForId(J)I

    move-result v0

    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v2

    add-int/2addr v0, v2

    iget v2, p0, Lco/vine/android/CommentsFragment;->mLastTopItemPixelOffset:I

    invoke-virtual {v1, v0, v2}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    goto :goto_0
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 53
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/CommentsFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 166
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 176
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    .line 179
    :goto_0
    return v0

    .line 168
    :pswitch_0
    const-string v0, "@"

    invoke-direct {p0, v0}, Lco/vine/android/CommentsFragment;->insertText(Ljava/lang/String;)V

    .line 179
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 172
    :pswitch_1
    const-string v0, "#"

    invoke-direct {p0, v0}, Lco/vine/android/CommentsFragment;->insertText(Ljava/lang/String;)V

    goto :goto_1

    .line 166
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a018b
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onPopupItemSelected(IILjava/lang/CharSequence;J)V
    .locals 0
    .parameter "tokenStart"
    .parameter "tokenEnd"
    .parameter "selection"
    .parameter "userId"

    .prologue
    .line 435
    return-void
.end method

.method public onPopupShown()V
    .locals 0

    .prologue
    .line 439
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 143
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onResume()V

    .line 144
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_1

    .line 145
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->initLoader()V

    .line 149
    :cond_0
    :goto_0
    return-void

    .line 146
    :cond_1
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/CommentsFragment;->mFetched:Z

    if-nez v0, :cond_0

    .line 147
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lco/vine/android/CommentsFragment;->fetchContent(I)V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 194
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 195
    const-string v0, "fetched"

    iget-boolean v1, p0, Lco/vine/android/CommentsFragment;->mFetched:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 196
    return-void
.end method

.method public onSpanClicked(Landroid/view/View;ILjava/lang/Object;)V
    .locals 4
    .parameter "view"
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 312
    packed-switch p2, :pswitch_data_0

    .line 325
    .end local p3
    :goto_0
    :pswitch_0
    return-void

    .line 314
    .restart local p3
    :pswitch_1
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast p3, Ljava/lang/Long;

    .end local p3
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-string v3, "Comments List"

    invoke-static {v0, v1, v2, v3}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    goto :goto_0

    .line 318
    .restart local p3
    :pswitch_2
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast p3, Ljava/lang/String;

    .end local p3
    invoke-static {v0, p3}, Lco/vine/android/HashtagActivity;->start(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 312
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    .line 112
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 113
    const v2, 0x7f0a0064

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lco/vine/android/widget/PopupEditText;

    .line 114
    .local v1, edit:Lco/vine/android/widget/PopupEditText;
    invoke-virtual {v1, p0}, Lco/vine/android/widget/PopupEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 115
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1, v2}, Lco/vine/android/widget/PopupEditText;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 116
    new-instance v2, Lco/vine/android/ComposeTokenizer;

    invoke-direct {v2, p0}, Lco/vine/android/ComposeTokenizer;-><init>(Lco/vine/android/widget/PopupEditText$PopupEditTextListener;)V

    iput-object v2, p0, Lco/vine/android/CommentsFragment;->mTokenizer:Lco/vine/android/ComposeTokenizer;

    .line 117
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mTokenizer:Lco/vine/android/ComposeTokenizer;

    iget-object v3, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getTypeaheadThrottle()J

    move-result-wide v3

    invoke-virtual {v1, v2, p0, v3, v4}, Lco/vine/android/widget/PopupEditText;->setTokenizer(Landroid/widget/MultiAutoCompleteTextView$Tokenizer;Landroid/widget/Filterable;J)V

    .line 118
    invoke-virtual {v1, p0}, Lco/vine/android/widget/PopupEditText;->setPopupEditTextListener(Lco/vine/android/widget/PopupEditText$PopupEditTextListener;)V

    .line 119
    iput-object v1, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    .line 120
    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 121
    .local v0, args:Landroid/os/Bundle;
    const-string v2, "post_id"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lco/vine/android/CommentsFragment;->mPostId:J

    .line 122
    const-string v2, "post_author_id"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lco/vine/android/CommentsFragment;->mPostAuthorId:J

    .line 123
    const v2, 0x7f0a0063

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2, p0}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 125
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 126
    new-instance v2, Lco/vine/android/CommentsAdapter;

    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-direct {v2, v3, v4, p0}, Lco/vine/android/CommentsAdapter;-><init>(Landroid/content/Context;Lco/vine/android/client/AppController;Lco/vine/android/widget/SpanClickListener;)V

    iput-object v2, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 127
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    check-cast v2, Lco/vine/android/widget/ConversationList;

    invoke-virtual {v2, p0}, Lco/vine/android/widget/ConversationList;->setGetMoreListener(Lco/vine/android/widget/ConversationList$GetMoreListener;)V

    .line 128
    iget-object v2, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    iget-object v3, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 129
    return-void
.end method

.method public postComment(Landroid/widget/EditText;)V
    .locals 7
    .parameter "editText"

    .prologue
    .line 263
    invoke-direct {p0, p1}, Lco/vine/android/CommentsFragment;->validate(Landroid/widget/EditText;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 264
    new-instance v6, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/CommentsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0f0028

    invoke-direct {v6, v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 266
    .local v6, dialog:Landroid/app/ProgressDialog;
    const v0, 0x7f0e0060

    invoke-virtual {p0, v0}, Lco/vine/android/CommentsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 267
    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 268
    invoke-virtual {v6}, Landroid/app/ProgressDialog;->show()V

    .line 269
    iput-object v6, p0, Lco/vine/android/CommentsFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 270
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v1, p0, Lco/vine/android/CommentsFragment;->mPostId:J

    iget-object v3, p0, Lco/vine/android/CommentsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    invoke-virtual {v5}, Lco/vine/android/widget/PopupEditText;->getEntities()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lco/vine/android/client/AppController;->postComment(JLco/vine/android/client/Session;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/CommentsFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 272
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    .line 274
    .end local v6           #dialog:Landroid/app/ProgressDialog;
    :cond_0
    return-void
.end method

.method public setPopupAdapter(Ljava/lang/String;)V
    .locals 2
    .parameter "type"

    .prologue
    .line 416
    const-string v0, "users_adapter"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 417
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mUsersAdapter:Lco/vine/android/UsersAutoCompleteAdapter;

    iput-object v0, p0, Lco/vine/android/CommentsFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 421
    :cond_0
    :goto_0
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mEdit:Lco/vine/android/widget/PopupEditText;

    iget-object v1, p0, Lco/vine/android/CommentsFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0, v1}, Lco/vine/android/widget/PopupEditText;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 422
    return-void

    .line 418
    :cond_1
    const-string v0, "tags_adapter"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mTagsAdapter:Lco/vine/android/TagsAutoCompleteAdapter;

    iput-object v0, p0, Lco/vine/android/CommentsFragment;->mTypeaheadAdapter:Landroid/support/v4/widget/CursorAdapter;

    goto :goto_0
.end method

.method public showProgress(I)V
    .locals 1
    .parameter "fetchType"

    .prologue
    .line 488
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->showProgress(I)V

    .line 489
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    check-cast v0, Lco/vine/android/CommentsAdapter;

    invoke-virtual {v0}, Lco/vine/android/CommentsAdapter;->atLastPage()Z

    move-result v0

    if-nez v0, :cond_0

    .line 490
    iget-object v0, p0, Lco/vine/android/CommentsFragment;->mListView:Landroid/widget/ListView;

    check-cast v0, Lco/vine/android/widget/ConversationList;

    invoke-virtual {v0}, Lco/vine/android/widget/ConversationList;->showProgress()V

    .line 492
    :cond_0
    return-void
.end method
