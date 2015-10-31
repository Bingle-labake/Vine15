.class Lco/vine/android/ChannelsListFragment$ChannelsAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "ChannelsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ChannelsListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChannelsAdapter"
.end annotation


# instance fields
.field private final mViewHolders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/ChannelsListFragment$ChannelViewHolder;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lco/vine/android/ChannelsListFragment;


# direct methods
.method public constructor <init>(Lco/vine/android/ChannelsListFragment;Landroid/content/Context;Lco/vine/android/client/AppController;I)V
    .locals 1
    .parameter
    .parameter "context"
    .parameter "appController"
    .parameter "flags"

    .prologue
    .line 178
    iput-object p1, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->this$0:Lco/vine/android/ChannelsListFragment;

    .line 179
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p4}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 180
    iput-object p3, p1, Lco/vine/android/ChannelsListFragment;->mAppController:Lco/vine/android/client/AppController;

    .line 181
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->mViewHolders:Ljava/util/ArrayList;

    .line 182
    return-void
.end method

.method private setChannelImage(Lco/vine/android/ChannelsListFragment$ChannelViewHolder;Landroid/graphics/Bitmap;)V
    .locals 3
    .parameter "holder"
    .parameter "bmp"

    .prologue
    .line 236
    if-eqz p2, :cond_0

    .line 237
    iget-object v0, p1, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;->channelImage:Landroid/widget/ImageView;

    new-instance v1, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v2, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2, p2}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 243
    :goto_0
    return-void

    .line 239
    :cond_0
    iget-object v0, p1, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;->channelImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 240
    iget-object v0, p1, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;->channelImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090065

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    goto :goto_0
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 8
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 198
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;

    .line 199
    .local v1, holder:Lco/vine/android/ChannelsListFragment$ChannelViewHolder;
    iget-object v4, v1, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;->channelTitle:Landroid/widget/TextView;

    const/4 v5, 0x2

    invoke-interface {p3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    const/4 v4, 0x1

    invoke-interface {p3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, v1, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;->channelId:J

    .line 201
    iget-wide v4, v1, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;->channelId:J

    iget-object v6, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->this$0:Lco/vine/android/ChannelsListFragment;

    #getter for: Lco/vine/android/ChannelsListFragment;->mSelectedChannel:J
    invoke-static {v6}, Lco/vine/android/ChannelsListFragment;->access$000(Lco/vine/android/ChannelsListFragment;)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 202
    iget-object v4, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->this$0:Lco/vine/android/ChannelsListFragment;

    invoke-virtual {v4}, Lco/vine/android/ChannelsListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f090043

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 206
    :goto_0
    const/4 v4, 0x4

    invoke-interface {p3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 207
    .local v3, path:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 208
    iget-object v4, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->this$0:Lco/vine/android/ChannelsListFragment;

    invoke-virtual {v4}, Lco/vine/android/ChannelsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/client/VineAPI;->getBaseCdnUrl()Ljava/lang/String;

    move-result-object v0

    .line 209
    .local v0, baseUrl:Ljava/lang/String;
    new-instance v2, Lco/vine/android/util/image/ImageKey;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    .line 210
    .local v2, key:Lco/vine/android/util/image/ImageKey;
    iput-object v2, v1, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;->channelImageKey:Lco/vine/android/util/image/ImageKey;

    .line 211
    iget-object v4, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->this$0:Lco/vine/android/ChannelsListFragment;

    iget-object v4, v4, Lco/vine/android/ChannelsListFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v4, v2}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-direct {p0, v1, v4}, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->setChannelImage(Lco/vine/android/ChannelsListFragment$ChannelViewHolder;Landroid/graphics/Bitmap;)V

    .line 215
    .end local v0           #baseUrl:Ljava/lang/String;
    .end local v2           #key:Lco/vine/android/util/image/ImageKey;
    :goto_1
    return-void

    .line 204
    .end local v3           #path:Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->this$0:Lco/vine/android/ChannelsListFragment;

    invoke-virtual {v4}, Lco/vine/android/ChannelsListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f090066

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_0

    .line 213
    .restart local v3       #path:Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    invoke-direct {p0, v1, v4}, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->setChannelImage(Lco/vine/android/ChannelsListFragment$ChannelViewHolder;Landroid/graphics/Bitmap;)V

    goto :goto_1
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .parameter "context"
    .parameter "cursor"
    .parameter "parent"

    .prologue
    .line 186
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 187
    .local v1, layoutInflater:Landroid/view/LayoutInflater;
    const v3, 0x7f03001e

    const/4 v4, 0x0

    invoke-virtual {v1, v3, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 189
    .local v2, v:Landroid/view/View;
    new-instance v0, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;

    iget-object v3, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->this$0:Lco/vine/android/ChannelsListFragment;

    invoke-direct {v0, v3, v2}, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;-><init>(Lco/vine/android/ChannelsListFragment;Landroid/view/View;)V

    .line 191
    .local v0, holder:Lco/vine/android/ChannelsListFragment$ChannelViewHolder;
    iget-object v3, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->mViewHolders:Ljava/util/ArrayList;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 193
    return-object v2
.end method

.method public declared-synchronized setChannelImages(Ljava/util/HashMap;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/image/ImageKey;",
            "Lco/vine/android/util/image/UrlImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 218
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    monitor-enter p0

    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 219
    .local v5, toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Lco/vine/android/ChannelsListFragment$ChannelViewHolder;>;>;"
    iget-object v6, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/ref/WeakReference;

    .line 220
    .local v4, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/ChannelsListFragment$ChannelViewHolder;>;"
    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;

    .line 221
    .local v0, holder:Lco/vine/android/ChannelsListFragment$ChannelViewHolder;
    if-nez v0, :cond_1

    .line 222
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 218
    .end local v0           #holder:Lco/vine/android/ChannelsListFragment$ChannelViewHolder;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v4           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/ChannelsListFragment$ChannelViewHolder;>;"
    .end local v5           #toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Lco/vine/android/ChannelsListFragment$ChannelViewHolder;>;>;"
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 224
    .restart local v0       #holder:Lco/vine/android/ChannelsListFragment$ChannelViewHolder;
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v4       #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/ChannelsListFragment$ChannelViewHolder;>;"
    .restart local v5       #toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Lco/vine/android/ChannelsListFragment$ChannelViewHolder;>;>;"
    :cond_1
    :try_start_1
    iget-object v6, v0, Lco/vine/android/ChannelsListFragment$ChannelViewHolder;->channelImageKey:Lco/vine/android/util/image/ImageKey;

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/util/image/UrlImage;

    .line 225
    .local v2, image:Lco/vine/android/util/image/UrlImage;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lco/vine/android/util/image/UrlImage;->isValid()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 226
    iget-object v6, v2, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0, v0, v6}, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->setChannelImage(Lco/vine/android/ChannelsListFragment$ChannelViewHolder;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 230
    .end local v0           #holder:Lco/vine/android/ChannelsListFragment$ChannelViewHolder;
    .end local v2           #image:Lco/vine/android/util/image/UrlImage;
    .end local v4           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/ChannelsListFragment$ChannelViewHolder;>;"
    :cond_2
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 231
    .local v3, r:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/ChannelsListFragment$ChannelViewHolder;>;"
    iget-object v6, p0, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 233
    .end local v3           #r:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/ChannelsListFragment$ChannelViewHolder;>;"
    :cond_3
    monitor-exit p0

    return-void
.end method
