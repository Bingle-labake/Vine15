.class Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;
.super Landroid/widget/BaseAdapter;
.source "SettingsFragment.java"

# interfaces
.implements Landroid/widget/SpinnerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/SettingsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EditionsSpinnerAdapter"
.end annotation


# instance fields
.field private mCursor:Landroid/database/Cursor;

.field final synthetic this$0:Lco/vine/android/SettingsFragment;


# direct methods
.method constructor <init>(Lco/vine/android/SettingsFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 1271
    iput-object p1, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->this$0:Lco/vine/android/SettingsFragment;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public changeCursor(Landroid/database/Cursor;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 1283
    iput-object p1, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    .line 1284
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->notifyDataSetChanged()V

    .line 1285
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 1276
    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 1277
    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 1279
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCursor()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1363
    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "i"
    .parameter "view"
    .parameter "viewGroup"

    .prologue
    .line 1317
    iget-object v2, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-ge p1, v2, :cond_1

    .line 1319
    if-eqz p2, :cond_0

    .line 1320
    move-object v0, p2

    .line 1324
    .local v0, res:Landroid/view/View;
    :goto_0
    const v2, 0x7f0a008a

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1325
    .local v1, t:Landroid/widget/TextView;
    invoke-virtual {p0, p1}, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->getEditionName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1326
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 1327
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 1330
    .end local v0           #res:Landroid/view/View;
    .end local v1           #t:Landroid/widget/TextView;
    :goto_1
    return-object v0

    .line 1322
    :cond_0
    iget-object v2, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v2}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f03002b

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .restart local v0       #res:Landroid/view/View;
    goto :goto_0

    .end local v0           #res:Landroid/view/View;
    :cond_1
    move-object v0, p2

    .line 1330
    goto :goto_1
.end method

.method public getEditionCode(I)Ljava/lang/String;
    .locals 2
    .parameter "index"

    .prologue
    .line 1355
    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 1356
    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 1357
    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1359
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public getEditionName(I)Ljava/lang/String;
    .locals 2
    .parameter "index"

    .prologue
    .line 1347
    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 1348
    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 1349
    iget-object v0, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1351
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "i"

    .prologue
    .line 1289
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "i"

    .prologue
    .line 1294
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "i"
    .parameter "view"
    .parameter "viewGroup"

    .prologue
    .line 1299
    iget-object v2, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-ge p1, v2, :cond_1

    .line 1301
    if-eqz p2, :cond_0

    .line 1302
    move-object v0, p2

    .line 1306
    .local v0, res:Landroid/view/View;
    :goto_0
    const v2, 0x7f0a008a

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1307
    .local v1, t:Landroid/widget/TextView;
    invoke-virtual {p0, p1}, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->getEditionName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1308
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 1309
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 1312
    .end local v0           #res:Landroid/view/View;
    .end local v1           #t:Landroid/widget/TextView;
    :goto_1
    return-object v0

    .line 1304
    :cond_0
    iget-object v2, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->this$0:Lco/vine/android/SettingsFragment;

    invoke-virtual {v2}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f03002b

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .restart local v0       #res:Landroid/view/View;
    goto :goto_0

    .end local v0           #res:Landroid/view/View;
    :cond_1
    move-object v0, p2

    .line 1312
    goto :goto_1
.end method

.method public setSelectionToUserEdition()V
    .locals 3

    .prologue
    .line 1334
    iget-object v1, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_1

    .line 1335
    iget-object v1, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    const/4 v2, -0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 1336
    :cond_0
    iget-object v1, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1337
    iget-object v1, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1338
    .local v0, editionCode:Ljava/lang/String;
    iget-object v1, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$500(Lco/vine/android/SettingsFragment;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1339
    iget-object v1, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->this$0:Lco/vine/android/SettingsFragment;

    #getter for: Lco/vine/android/SettingsFragment;->mEditionsSpinner:Landroid/widget/Spinner;
    invoke-static {v1}, Lco/vine/android/SettingsFragment;->access$1600(Lco/vine/android/SettingsFragment;)Landroid/widget/Spinner;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getPosition()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 1344
    .end local v0           #editionCode:Ljava/lang/String;
    :cond_1
    return-void
.end method
