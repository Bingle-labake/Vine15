.class public Lco/vine/android/RecordingFragment;
.super Lco/vine/android/BaseFragment;
.source "RecordingFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/RecordingFragment$OnRecordingFinishRunnable;
    }
.end annotation


# static fields
.field public static final ARG_SCREEN_SIZE:Ljava/lang/String; = "screen_size"

.field public static final ARG_TOP_OVERLAY:Ljava/lang/String; = "arg_top_overlay"


# instance fields
.field private mDismissGridAnimation:Landroid/view/animation/AlphaAnimation;

.field private mDraftOverlayIcon:Landroid/view/View;

.field private mDraftsButton:Landroid/widget/TextView;

.field private mFadeIn:Landroid/view/animation/Animation;

.field private final mFadeInListener:Landroid/view/animation/Animation$AnimationListener;

.field private mFadeOut:Landroid/view/animation/Animation;

.field private final mFadeOutListener:Landroid/view/animation/Animation$AnimationListener;

.field private mFileFileToUse:Lco/vine/android/recorder/RecordingFile;

.field private mFocusButton:Landroid/view/View;

.field private mFolder:Ljava/io/File;

.field private mGhostButton:Landroid/widget/ToggleButton;

.field private mGrid:Landroid/view/View;

.field private mGridButton:Landroid/widget/ToggleButton;

.field private mNoDraftsOverlay:Landroid/view/View;

.field private mNumDrafts:I

.field final mOnNoDraftOverlayTouchListener:Landroid/view/View$OnTouchListener;

.field private mRecorder:Lco/vine/android/recorder/VineRecorder;

.field private mRecordingOptions:Landroid/view/View;

.field private mRsm:Lco/vine/android/recorder/RecordSessionManager;

.field private mScreenSize:Landroid/graphics/Point;

.field private mShowGridAnimation:Landroid/view/animation/AlphaAnimation;

.field private final mStartDraftsRunnable:Ljava/lang/Runnable;

.field private mStartWithEdit:Z

.field private mTopOverlay:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lco/vine/android/BaseFragment;-><init>()V

    .line 70
    new-instance v0, Lco/vine/android/RecordingFragment$1;

    invoke-direct {v0, p0}, Lco/vine/android/RecordingFragment$1;-><init>(Lco/vine/android/RecordingFragment;)V

    iput-object v0, p0, Lco/vine/android/RecordingFragment;->mFadeOutListener:Landroid/view/animation/Animation$AnimationListener;

    .line 88
    new-instance v0, Lco/vine/android/RecordingFragment$2;

    invoke-direct {v0, p0}, Lco/vine/android/RecordingFragment$2;-><init>(Lco/vine/android/RecordingFragment;)V

    iput-object v0, p0, Lco/vine/android/RecordingFragment;->mFadeInListener:Landroid/view/animation/Animation$AnimationListener;

    .line 104
    new-instance v0, Lco/vine/android/RecordingFragment$3;

    invoke-direct {v0, p0}, Lco/vine/android/RecordingFragment$3;-><init>(Lco/vine/android/RecordingFragment;)V

    iput-object v0, p0, Lco/vine/android/RecordingFragment;->mOnNoDraftOverlayTouchListener:Landroid/view/View$OnTouchListener;

    .line 112
    new-instance v0, Lco/vine/android/RecordingFragment$4;

    invoke-direct {v0, p0}, Lco/vine/android/RecordingFragment$4;-><init>(Lco/vine/android/RecordingFragment;)V

    iput-object v0, p0, Lco/vine/android/RecordingFragment;->mStartDraftsRunnable:Ljava/lang/Runnable;

    .line 651
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/RecordingFragment;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mDraftOverlayIcon:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lco/vine/android/RecordingFragment;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mNoDraftsOverlay:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1000(Lco/vine/android/RecordingFragment;Ljava/lang/String;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lco/vine/android/RecordingFragment;->notifyActivity(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$200(Lco/vine/android/RecordingFragment;)Landroid/view/animation/Animation$AnimationListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mFadeOutListener:Landroid/view/animation/Animation$AnimationListener;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/RecordingFragment;)Landroid/view/animation/Animation;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mFadeOut:Landroid/view/animation/Animation;

    return-object v0
.end method

.method static synthetic access$400(Lco/vine/android/RecordingFragment;)Landroid/widget/ToggleButton;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;

    return-object v0
.end method

.method static synthetic access$500(Lco/vine/android/RecordingFragment;)Landroid/widget/ToggleButton;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mGhostButton:Landroid/widget/ToggleButton;

    return-object v0
.end method

.method static synthetic access$600(Lco/vine/android/RecordingFragment;)Lco/vine/android/recorder/VineRecorder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    return-object v0
.end method

.method static synthetic access$700(Lco/vine/android/RecordingFragment;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mGrid:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$800(Lco/vine/android/RecordingFragment;)Landroid/view/animation/AlphaAnimation;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mShowGridAnimation:Landroid/view/animation/AlphaAnimation;

    return-object v0
.end method

.method static synthetic access$900(Lco/vine/android/RecordingFragment;)Landroid/view/animation/AlphaAnimation;
    .locals 1
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mDismissGridAnimation:Landroid/view/animation/AlphaAnimation;

    return-object v0
.end method

.method private determineSessionFileForSwap(Z)Lco/vine/android/recorder/RecordingFile;
    .locals 15
    .parameter "useFinalFile"

    .prologue
    .line 179
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    check-cast v7, Lco/vine/android/AbstractRecordingActivity;

    .line 181
    .local v7, activity:Lco/vine/android/AbstractRecordingActivity;
    :try_start_0
    invoke-static {v7}, Lco/vine/android/recorder/RecordSessionManager;->getValidSessions(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v13

    .line 182
    .local v13, sessions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    const/4 v9, 0x0

    .line 183
    .local v9, extraFolder:Ljava/io/File;
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v6, 0x9

    if-le v1, v6, :cond_0

    .line 184
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    iget-object v9, v1, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->folder:Ljava/io/File;

    .line 186
    :cond_0
    const/4 v2, 0x0

    .line 187
    .local v2, folder:Ljava/io/File;
    iget-object v10, p0, Lco/vine/android/RecordingFragment;->mFileFileToUse:Lco/vine/android/recorder/RecordingFile;

    .line 188
    .local v10, file:Lco/vine/android/recorder/RecordingFile;
    if-eqz p1, :cond_2

    if-eqz v10, :cond_2

    .line 189
    const-string v1, "Is from preview, use existing final file."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    .line 190
    iget-boolean v1, v10, Lco/vine/android/recorder/RecordingFile;->isSavedSession:Z

    if-nez v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, v10, Lco/vine/android/recorder/RecordingFile;->isDirty:Z

    .line 255
    .end local v2           #folder:Ljava/io/File;
    .end local v9           #extraFolder:Ljava/io/File;
    .end local v10           #file:Lco/vine/android/recorder/RecordingFile;
    .end local v13           #sessions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    :goto_1
    return-object v10

    .line 190
    .restart local v2       #folder:Ljava/io/File;
    .restart local v9       #extraFolder:Ljava/io/File;
    .restart local v10       #file:Lco/vine/android/recorder/RecordingFile;
    .restart local v13       #sessions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 193
    :cond_2
    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mFolder:Ljava/io/File;

    if-eqz v1, :cond_4

    const/4 v4, 0x1

    .line 194
    .local v4, savedSession:Z
    :goto_2
    const/4 v5, 0x0

    .line 195
    .local v5, dirty:Z
    const/4 v3, 0x0

    .line 196
    .local v3, session:Lco/vine/android/recorder/RecordSession;
    if-eqz v10, :cond_5

    .line 197
    invoke-virtual {v10}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v3

    .line 198
    iget-object v2, v10, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    .line 250
    :cond_3
    :goto_3
    new-instance v1, Lco/vine/android/recorder/RecordingFile;

    if-ne v2, v9, :cond_e

    const/4 v6, 0x1

    :goto_4
    invoke-direct/range {v1 .. v6}, Lco/vine/android/recorder/RecordingFile;-><init>(Ljava/io/File;Lco/vine/android/recorder/RecordSession;ZZZ)V

    move-object v10, v1

    goto :goto_1

    .line 193
    .end local v3           #session:Lco/vine/android/recorder/RecordSession;
    .end local v4           #savedSession:Z
    .end local v5           #dirty:Z
    :cond_4
    const/4 v4, 0x0

    goto :goto_2

    .line 200
    .restart local v3       #session:Lco/vine/android/recorder/RecordSession;
    .restart local v4       #savedSession:Z
    .restart local v5       #dirty:Z
    :cond_5
    if-nez v9, :cond_a

    if-nez v4, :cond_a

    const/4 v11, 0x1

    .line 201
    .local v11, makeNewSession:Z
    :goto_5
    if-nez v11, :cond_8

    .line 202
    if-eqz v4, :cond_6

    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mFolder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_7

    :cond_6
    if-eqz v9, :cond_8

    invoke-virtual {v9}, Ljava/io/File;->exists()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    if-nez v1, :cond_8

    .line 203
    :cond_7
    const/4 v11, 0x1

    .line 204
    const/4 v4, 0x0

    .line 208
    :cond_8
    if-eqz v11, :cond_c

    .line 210
    :try_start_1
    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mRsm:Lco/vine/android/recorder/RecordSessionManager;

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordSessionManager;->getCrashedSession()Ljava/util/HashMap;

    move-result-object v12

    .line 211
    .local v12, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/recorder/RecordSession;Ljava/io/File;>;"
    if-eqz v12, :cond_9

    .line 212
    invoke-virtual {v12}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lco/vine/android/recorder/RecordSession;

    move-object v3, v0

    .line 213
    new-instance v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    invoke-direct {v1, v7}, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v1}, Lco/vine/android/recorder/RecordSession;->setConfig(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)V

    .line 214
    invoke-virtual {v12, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/io/File;

    move-object v2, v0

    .line 215
    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSession;->getSegments()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_b

    const/4 v5, 0x1

    .line 216
    :goto_6
    const-string v1, "Restore from crashed session."

    invoke-static {v1}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 221
    .end local v12           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/recorder/RecordSession;Ljava/io/File;>;"
    :cond_9
    :goto_7
    if-nez v3, :cond_3

    .line 222
    :try_start_2
    const-string v1, "Creating new session."

    invoke-static {v1}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 224
    :try_start_3
    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mRsm:Lco/vine/android/recorder/RecordSessionManager;

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordSessionManager;->createFolderForSession()Ljava/io/File;

    move-result-object v2

    .line 225
    new-instance v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    invoke-direct {v1, v7}, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;-><init>(Landroid/content/Context;)V

    invoke-static {v1}, Lco/vine/android/recorder/RecordSession;->newSession(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)Lco/vine/android/recorder/RecordSession;

    move-result-object v3

    .line 227
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    move-result v1

    const/16 v6, 0x9

    if-ne v1, v6, :cond_3

    .line 228
    move-object v9, v2

    goto :goto_3

    .line 200
    .end local v11           #makeNewSession:Z
    :cond_a
    const/4 v11, 0x0

    goto :goto_5

    .line 215
    .restart local v11       #makeNewSession:Z
    .restart local v12       #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/recorder/RecordSession;Ljava/io/File;>;"
    :cond_b
    const/4 v5, 0x0

    goto :goto_6

    .line 218
    .end local v12           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/recorder/RecordSession;Ljava/io/File;>;"
    :catch_0
    move-exception v8

    .line 219
    .local v8, e:Ljava/io/IOException;
    :try_start_4
    const-string v1, "Failed to get a crashed session."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_7

    .line 251
    .end local v2           #folder:Ljava/io/File;
    .end local v3           #session:Lco/vine/android/recorder/RecordSession;
    .end local v4           #savedSession:Z
    .end local v5           #dirty:Z
    .end local v8           #e:Ljava/io/IOException;
    .end local v9           #extraFolder:Ljava/io/File;
    .end local v10           #file:Lco/vine/android/recorder/RecordingFile;
    .end local v11           #makeNewSession:Z
    .end local v13           #sessions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    :catch_1
    move-exception v8

    .line 252
    .restart local v8       #e:Ljava/io/IOException;
    const-string v1, "Error creating folder. "

    invoke-static {v1, v8}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 253
    const v1, 0x7f0e01b2

    const/4 v6, 0x0

    invoke-static {v7, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 254
    invoke-virtual {v7}, Lco/vine/android/AbstractRecordingActivity;->finish()V

    .line 255
    const/4 v10, 0x0

    goto/16 :goto_1

    .line 230
    .end local v8           #e:Ljava/io/IOException;
    .restart local v2       #folder:Ljava/io/File;
    .restart local v3       #session:Lco/vine/android/recorder/RecordSession;
    .restart local v4       #savedSession:Z
    .restart local v5       #dirty:Z
    .restart local v9       #extraFolder:Ljava/io/File;
    .restart local v10       #file:Lco/vine/android/recorder/RecordingFile;
    .restart local v11       #makeNewSession:Z
    .restart local v13       #sessions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    :catch_2
    move-exception v8

    .line 231
    .restart local v8       #e:Ljava/io/IOException;
    :try_start_5
    const-string v1, "Cannot create folder."

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v8, v6, v14

    invoke-static {v1, v6}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 232
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 233
    const/4 v10, 0x0

    goto/16 :goto_1

    .line 237
    .end local v8           #e:Ljava/io/IOException;
    :cond_c
    if-eqz v4, :cond_d

    .line 238
    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mFolder:Ljava/io/File;

    .line 243
    :goto_8
    invoke-static {v2}, Lco/vine/android/recorder/RecordSessionManager;->readDataObject(Ljava/io/File;)Lco/vine/android/recorder/RecordSession;

    move-result-object v3

    .line 244
    new-instance v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    invoke-direct {v1, v7}, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v1}, Lco/vine/android/recorder/RecordSession;->setConfig(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)V

    .line 245
    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSession;->calculateAudioCount()I

    move-result v1

    invoke-virtual {v3, v1}, Lco/vine/android/recorder/RecordSession;->setAudioDataCount(I)V

    .line 246
    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSession;->calculateVideoCount()I

    move-result v1

    invoke-virtual {v3, v1}, Lco/vine/android/recorder/RecordSession;->setVideoDataCount(I)V

    .line 247
    const-string v1, "Resume session {}."

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_3

    .line 240
    :cond_d
    move-object v2, v9

    .line 241
    const/4 v5, 0x1

    goto :goto_8

    .line 250
    .end local v11           #makeNewSession:Z
    :cond_e
    const/4 v6, 0x0

    goto/16 :goto_4
.end method

.method private notifyActivity(Ljava/lang/String;Z)V
    .locals 3
    .parameter "source"
    .parameter "detectedInvalidSession"

    .prologue
    .line 329
    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    iget-object v1, v1, Lco/vine/android/recorder/VineRecorder;->finalFile:Lco/vine/android/recorder/RecordingFile;

    if-eqz v1, :cond_0

    .line 330
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/AbstractRecordingActivity;

    .line 331
    .local v0, activity:Lco/vine/android/AbstractRecordingActivity;
    if-eqz v0, :cond_0

    .line 332
    if-eqz p2, :cond_1

    .line 333
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Detected invalid session."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 334
    const v1, 0x7f0e00d5

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 335
    invoke-virtual {v0}, Lco/vine/android/AbstractRecordingActivity;->finish()V

    .line 344
    .end local v0           #activity:Lco/vine/android/AbstractRecordingActivity;
    :cond_0
    :goto_0
    return-void

    .line 337
    .restart local v0       #activity:Lco/vine/android/AbstractRecordingActivity;
    :cond_1
    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v1}, Lco/vine/android/recorder/VineRecorder;->getCameraView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v1

    iput v1, v0, Lco/vine/android/AbstractRecordingActivity;->mProgressContainerWidth:I

    .line 339
    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    iget-wide v1, v1, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    iput-wide v1, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentDuration:J

    .line 340
    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    iget-object v1, v1, Lco/vine/android/recorder/VineRecorder;->finalFile:Lco/vine/android/recorder/RecordingFile;

    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v2}, Lco/vine/android/recorder/VineRecorder;->getThumbnailPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Lco/vine/android/AbstractRecordingActivity;->toPreview(Ljava/lang/String;Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private refreshDraftNumber()V
    .locals 4

    .prologue
    .line 428
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/recorder/RecordSessionManager;->getNumberOfValidSessions(Landroid/content/Context;)I

    move-result v1

    .line 429
    .local v1, numDrafts:I
    if-lez v1, :cond_1

    .line 430
    const/16 v2, 0x9

    if-le v1, v2, :cond_0

    .line 431
    add-int/lit8 v1, v1, -0x1

    .line 433
    :cond_0
    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mDraftsButton:Landroid/widget/TextView;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 437
    :goto_0
    iput v1, p0, Lco/vine/android/RecordingFragment;->mNumDrafts:I

    .line 441
    .end local v1           #numDrafts:I
    :goto_1
    return-void

    .line 435
    .restart local v1       #numDrafts:I
    :cond_1
    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mDraftsButton:Landroid/widget/TextView;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 438
    .end local v1           #numDrafts:I
    :catch_0
    move-exception v0

    .line 439
    .local v0, e:Ljava/io/IOException;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_1
.end method


# virtual methods
.method public discardEditing()V
    .locals 3

    .prologue
    .line 544
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 545
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->setEditMode(ZZ)V

    .line 547
    :cond_0
    return-void
.end method

.method public doOneFrame()V
    .locals 1

    .prologue
    .line 575
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 576
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->doOneFrame()V

    .line 578
    :cond_0
    return-void
.end method

.method public getProgressView()Landroid/view/View;
    .locals 1

    .prologue
    .line 644
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->getProgressView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getThumbnailPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 640
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->getThumbnailPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isEditing()Z
    .locals 1

    .prologue
    .line 450
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->isEditing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEditingDirty()Z
    .locals 1

    .prologue
    .line 454
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->isEditingDirty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isResuming()Z
    .locals 1

    .prologue
    .line 612
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->isResuming()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSavedSession()Z
    .locals 1

    .prologue
    .line 497
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->isSavedSession()Z

    move-result v0

    return v0
.end method

.method public isSessionModified()Z
    .locals 1

    .prologue
    .line 589
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 590
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->isSessionDirty()Z

    move-result v0

    .line 592
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public modifyZoom(Z)V
    .locals 1
    .parameter "zoomIn"

    .prologue
    .line 458
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 459
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0, p1}, Lco/vine/android/recorder/VineRecorder;->modifyZoom(Z)V

    .line 461
    :cond_0
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 48
    .parameter "savedInstanceState"

    .prologue
    .line 261
    invoke-super/range {p0 .. p1}, Lco/vine/android/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 262
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    check-cast v8, Lco/vine/android/AbstractRecordingActivity;

    .line 264
    .local v8, activity:Lco/vine/android/AbstractRecordingActivity;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/recorder/RecordSessionManager;->getInstance(Landroid/content/Context;)Lco/vine/android/recorder/RecordSessionManager;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lco/vine/android/RecordingFragment;->mRsm:Lco/vine/android/recorder/RecordSessionManager;

    .line 265
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/RecordingFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v45

    .line 266
    .local v45, res:Landroid/content/res/Resources;
    new-instance v2, Lco/vine/android/recorder/VineRecorder;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lco/vine/android/RecordingFragment;->mStartWithEdit:Z

    invoke-virtual {v8}, Lco/vine/android/AbstractRecordingActivity;->getScreenSize()Landroid/graphics/Point;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/RecordingFragment;->mFileFileToUse:Lco/vine/android/recorder/RecordingFile;

    if-eqz v5, :cond_1

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lco/vine/android/RecordingFragment;->mStartWithEdit:Z

    if-eqz v5, :cond_1

    const/4 v5, 0x1

    :goto_0
    invoke-virtual {v8}, Lco/vine/android/AbstractRecordingActivity;->hasPreviewedAlready()Z

    move-result v6

    const/4 v7, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lco/vine/android/RecordingFragment;->determineSessionFileForSwap(Z)Lco/vine/android/recorder/RecordingFile;

    move-result-object v7

    const v9, 0x7f0a00f4

    invoke-virtual {v8, v9}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lco/vine/android/player/SdkVideoView;

    const v10, 0x7f0a011f

    const v11, 0x7f0a010c

    const v12, 0x7f0a0121

    const v13, 0x7f0a0128

    const v14, 0x7f0a0114

    const v15, 0x7f02007f

    const v16, 0x7f020145

    const v17, 0x7f0a0122

    const v18, 0x7f0a0084

    const v19, 0x7f0a0113

    const v20, 0x7f0a0120

    const/16 v21, -0x1

    const v22, 0x7f0a011e

    const v23, 0x7f0a011b

    const v24, 0x7f0a00f5

    const v25, 0x7f0a0115

    const v26, 0x7f0a0117

    const v27, 0x7f0a0116

    const v28, 0x7f0a0118

    const v29, 0x7f0a0119

    const v30, 0x7f0a011a

    const v31, 0x7f0e00c8

    const v32, 0x7f0e004f

    const v33, 0x7f0e0110

    const v34, 0x7f0a0110

    const v35, 0x7f0a010d

    const v36, 0x7f0a00b1

    const v37, 0x7f0b0027

    move-object/from16 v0, v45

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v37

    const v38, 0x7f0b0023

    move-object/from16 v0, v45

    move/from16 v1, v38

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v38

    const v39, 0x7f0a010e

    const v40, 0x7f0a0088

    const v41, 0x7f0e01cb

    move-object/from16 v0, p0

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lco/vine/android/RecordingFragment;->getString(I)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/RecordingFragment;->mGhostButton:Landroid/widget/ToggleButton;

    move-object/from16 v42, v0

    const/16 v43, 0x4

    move/from16 v0, v43

    new-array v0, v0, [Ljava/lang/CharSequence;

    move-object/from16 v43, v0

    const/16 v46, 0x0

    const v47, 0x7f0e00d0

    move-object/from16 v0, p0

    move/from16 v1, v47

    invoke-virtual {v0, v1}, Lco/vine/android/RecordingFragment;->getText(I)Ljava/lang/CharSequence;

    move-result-object v47

    aput-object v47, v43, v46

    const/16 v46, 0x1

    const v47, 0x7f0e00c5

    move-object/from16 v0, p0

    move/from16 v1, v47

    invoke-virtual {v0, v1}, Lco/vine/android/RecordingFragment;->getText(I)Ljava/lang/CharSequence;

    move-result-object v47

    aput-object v47, v43, v46

    const/16 v46, 0x2

    const v47, 0x7f0e00c6

    move-object/from16 v0, p0

    move/from16 v1, v47

    invoke-virtual {v0, v1}, Lco/vine/android/RecordingFragment;->getText(I)Ljava/lang/CharSequence;

    move-result-object v47

    aput-object v47, v43, v46

    const/16 v46, 0x3

    const v47, 0x7f0e00c7

    move-object/from16 v0, p0

    move/from16 v1, v47

    invoke-virtual {v0, v1}, Lco/vine/android/RecordingFragment;->getText(I)Ljava/lang/CharSequence;

    move-result-object v47

    aput-object v47, v43, v46

    invoke-direct/range {v2 .. v43}, Lco/vine/android/recorder/VineRecorder;-><init>(ZLandroid/graphics/Point;ZZLco/vine/android/recorder/RecordingFile;Landroid/app/Activity;Lco/vine/android/player/SdkVideoView;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIILjava/lang/String;Landroid/widget/ToggleButton;[Ljava/lang/CharSequence;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    .line 291
    new-instance v2, Lco/vine/android/RecordingFragment$5;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lco/vine/android/RecordingFragment$5;-><init>(Lco/vine/android/RecordingFragment;)V

    invoke-static {v2}, Lco/vine/android/recorder/RecordingAnimations;->getShowGridAinimation(Lco/vine/android/animation/SimpleAnimationListener;)Landroid/view/animation/AlphaAnimation;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lco/vine/android/RecordingFragment;->mShowGridAnimation:Landroid/view/animation/AlphaAnimation;

    .line 307
    new-instance v2, Lco/vine/android/RecordingFragment$6;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lco/vine/android/RecordingFragment$6;-><init>(Lco/vine/android/RecordingFragment;)V

    invoke-static {v2}, Lco/vine/android/recorder/RecordingAnimations;->getGridDimissAnimation(Lco/vine/android/animation/SimpleAnimationListener;)Landroid/view/animation/AlphaAnimation;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lco/vine/android/RecordingFragment;->mDismissGridAnimation:Landroid/view/animation/AlphaAnimation;

    .line 318
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/RecordingFragment;->mGrid:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    .line 319
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/RecordingFragment;->mGrid:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/RecordingFragment;->mDismissGridAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v2, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 326
    .end local v45           #res:Landroid/content/res/Resources;
    :cond_0
    :goto_1
    return-void

    .line 266
    .restart local v45       #res:Landroid/content/res/Resources;
    :cond_1
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 321
    .end local v45           #res:Landroid/content/res/Resources;
    :catch_0
    move-exception v44

    .line 322
    .local v44, e:Ljava/io/IOException;
    const-string v2, "Error creating folder. "

    move-object/from16 v0, v44

    invoke-static {v2, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 323
    const v2, 0x7f0e01b2

    const/4 v3, 0x0

    invoke-static {v8, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 324
    invoke-virtual {v8}, Lco/vine/android/AbstractRecordingActivity;->finish()V

    goto :goto_1
.end method

.method public onCameraSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 470
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 471
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0, p1}, Lco/vine/android/recorder/VineRecorder;->onCameraSwitcherPressed(Landroid/view/View;)V

    .line 473
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 348
    invoke-super {p0, p1}, Lco/vine/android/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    .line 349
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 350
    .local v0, args:Landroid/os/Bundle;
    const-string v1, "arg_top_overlay"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    iput-object v1, p0, Lco/vine/android/RecordingFragment;->mTopOverlay:Landroid/graphics/Bitmap;

    .line 351
    const-string v1, "screen_size"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/graphics/Point;

    iput-object v1, p0, Lco/vine/android/RecordingFragment;->mScreenSize:Landroid/graphics/Point;

    .line 352
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f04000d

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/RecordingFragment;->mFadeIn:Landroid/view/animation/Animation;

    .line 353
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f04000e

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/RecordingFragment;->mFadeOut:Landroid/view/animation/Animation;

    .line 354
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 359
    const v5, 0x7f030055

    invoke-virtual {p1, v5, p2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 360
    .local v4, view:Landroid/view/View;
    const v5, 0x7f0a011b

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 361
    .local v2, topMask:Landroid/view/View;
    const v5, 0x7f0a00f5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 362
    .local v1, bottomMask:Landroid/view/View;
    const v5, 0x7f0a0122

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lco/vine/android/RecordingFragment;->mFocusButton:Landroid/view/View;

    .line 363
    const v5, 0x7f0a0121

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ToggleButton;

    iput-object v5, p0, Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;

    .line 364
    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;

    invoke-virtual {v5, v7}, Landroid/widget/ToggleButton;->setText(Ljava/lang/CharSequence;)V

    .line 365
    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;

    invoke-virtual {v5, v7}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 366
    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;

    invoke-virtual {v5, v7}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V

    .line 367
    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;

    new-instance v6, Lco/vine/android/RecordingFragment$7;

    invoke-direct {v6, p0}, Lco/vine/android/RecordingFragment$7;-><init>(Lco/vine/android/RecordingFragment;)V

    invoke-virtual {v5, v6}, Landroid/widget/ToggleButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 377
    const v5, 0x7f0a0129

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lco/vine/android/RecordingFragment;->mGrid:Landroid/view/View;

    .line 378
    const v5, 0x7f0a0088

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 379
    .local v3, topOverlayView:Landroid/view/View;
    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mTopOverlay:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_0

    .line 380
    invoke-virtual {v3, v8}, Landroid/view/View;->setVisibility(I)V

    .line 381
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-object v6, p0, Lco/vine/android/RecordingFragment;->mTopOverlay:Landroid/graphics/Bitmap;

    invoke-static {v5, v3, v6}, Lco/vine/android/util/ViewUtil;->setBackground(Landroid/content/res/Resources;Landroid/view/View;Landroid/graphics/Bitmap;)V

    .line 385
    :goto_0
    const v5, 0x7f0a0123

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ToggleButton;

    iput-object v5, p0, Lco/vine/android/RecordingFragment;->mGhostButton:Landroid/widget/ToggleButton;

    .line 386
    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mGhostButton:Landroid/widget/ToggleButton;

    invoke-virtual {v5, v7}, Landroid/widget/ToggleButton;->setText(Ljava/lang/CharSequence;)V

    .line 387
    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mGhostButton:Landroid/widget/ToggleButton;

    invoke-virtual {v5, v7}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 388
    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mGhostButton:Landroid/widget/ToggleButton;

    invoke-virtual {v5, v7}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V

    .line 390
    const v5, 0x7f0a0125

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lco/vine/android/RecordingFragment;->mDraftsButton:Landroid/widget/TextView;

    .line 391
    invoke-direct {p0}, Lco/vine/android/RecordingFragment;->refreshDraftNumber()V

    .line 393
    const v5, 0x7f0a011f

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lco/vine/android/RecordingFragment;->mRecordingOptions:Landroid/view/View;

    .line 394
    const v5, 0x7f0a012a

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lco/vine/android/RecordingFragment;->mNoDraftsOverlay:Landroid/view/View;

    .line 396
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/AbstractRecordingActivity;

    .line 398
    .local v0, activity:Lco/vine/android/AbstractRecordingActivity;
    invoke-virtual {v0, v2, v1}, Lco/vine/android/AbstractRecordingActivity;->initMasks(Landroid/view/View;Landroid/view/View;)V

    .line 400
    return-object v4

    .line 383
    .end local v0           #activity:Lco/vine/android/AbstractRecordingActivity;
    :cond_0
    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 168
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onDestroy()V

    .line 169
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_1

    .line 170
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->release()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    const-string v0, "capture"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils;->trackAbandonedStage(Ljava/lang/String;)V

    .line 173
    :cond_0
    iput-object v1, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    .line 174
    iput-object v1, p0, Lco/vine/android/RecordingFragment;->mFileFileToUse:Lco/vine/android/recorder/RecordingFile;

    .line 176
    :cond_1
    return-void
.end method

.method public onFinishPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 464
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 465
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0, p1}, Lco/vine/android/recorder/VineRecorder;->onFinishPressed(Landroid/view/View;)V

    .line 467
    :cond_0
    return-void
.end method

.method public onFocusSwitchPressed(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 476
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 477
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->canChangeFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 478
    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mFocusButton:Landroid/view/View;

    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->isAutoFocusing()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f020146

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 480
    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->isAutoFocusing()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    invoke-virtual {v1, v0}, Lco/vine/android/recorder/VineRecorder;->setAutoFocusing(Z)V

    .line 483
    :cond_0
    return-void

    .line 478
    :cond_1
    const v0, 0x7f020144

    goto :goto_0

    .line 480
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public onGhostSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 538
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 539
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->onGhostSwitchPressed()Z

    .line 541
    :cond_0
    return-void
.end method

.method public onGridSwitchPressed()V
    .locals 2

    .prologue
    .line 530
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mGrid:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 531
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mGrid:Landroid/view/View;

    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mShowGridAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 535
    :goto_0
    return-void

    .line 533
    :cond_0
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mGrid:Landroid/view/View;

    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mDismissGridAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0
.end method

.method public onHideDrafts()V
    .locals 2

    .prologue
    .line 633
    invoke-direct {p0}, Lco/vine/android/RecordingFragment;->refreshDraftNumber()V

    .line 634
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecordingOptions:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 635
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecordingOptions:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 636
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecordingOptions:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 637
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 132
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onPause()V

    .line 133
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->onUiPaused()V

    .line 136
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 140
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onResume()V

    .line 141
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v4, :cond_2

    .line 142
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/AbstractRecordingActivity;

    .line 143
    .local v0, activity:Lco/vine/android/AbstractRecordingActivity;
    invoke-virtual {v0}, Lco/vine/android/AbstractRecordingActivity;->isDraftsShowing()Z

    move-result v2

    .line 145
    .local v2, isDraftsShowing:Z
    if-nez v2, :cond_0

    .line 146
    invoke-direct {p0}, Lco/vine/android/RecordingFragment;->refreshDraftNumber()V

    .line 147
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v4}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v1

    .line 148
    .local v1, file:Lco/vine/android/recorder/RecordingFile;
    if-eqz v1, :cond_0

    .line 149
    iget-object v4, v1, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 150
    new-instance v4, Lco/vine/android/VineException;

    const-string v5, "Invalid folder"

    invoke-direct {v4, v5}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 151
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lco/vine/android/RecordingFragment;->setFileFileToUse(Lco/vine/android/recorder/RecordingFile;)V

    .line 152
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    const-string v5, "Resume invalid."

    invoke-direct {p0, v3}, Lco/vine/android/RecordingFragment;->determineSessionFileForSwap(Z)Lco/vine/android/recorder/RecordingFile;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lco/vine/android/recorder/VineRecorder;->swapSession(Ljava/lang/String;Lco/vine/android/recorder/RecordingFile;)Lco/vine/android/recorder/RecordingFile;

    .line 157
    .end local v1           #file:Lco/vine/android/recorder/RecordingFile;
    :cond_0
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    new-instance v5, Lco/vine/android/RecordingFragment$OnRecordingFinishRunnable;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v5, v6}, Lco/vine/android/RecordingFragment$OnRecordingFinishRunnable;-><init>(Ljava/lang/ref/WeakReference;)V

    invoke-virtual {v4, v0, v5, v2}, Lco/vine/android/recorder/VineRecorder;->onUiResumed(Landroid/app/Activity;Ljava/lang/Runnable;Z)V

    .line 160
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;

    invoke-virtual {v4}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 161
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;

    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mGrid:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v5

    const/16 v6, 0x8

    if-eq v5, v6, :cond_1

    const/4 v3, 0x1

    :cond_1
    invoke-virtual {v4, v3}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 164
    .end local v0           #activity:Lco/vine/android/AbstractRecordingActivity;
    .end local v2           #isDraftsShowing:Z
    :cond_2
    return-void
.end method

.method public onSessionSwitchPressed(Landroid/view/View;)V
    .locals 7
    .parameter "v"

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    .line 501
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v4, :cond_2

    iget v4, p0, Lco/vine/android/RecordingFragment;->mNumDrafts:I

    if-gtz v4, :cond_0

    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v4}, Lco/vine/android/recorder/VineRecorder;->isSessionDirty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 503
    :cond_0
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v4}, Lco/vine/android/recorder/VineRecorder;->isSessionDirty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 504
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    check-cast v4, Lco/vine/android/AbstractRecordingActivity;

    invoke-virtual {v4, v6, p0}, Lco/vine/android/AbstractRecordingActivity;->showUnSavedChangesDialog(ILco/vine/android/RecordingFragment;)V

    .line 527
    :goto_0
    return-void

    .line 506
    :cond_1
    invoke-virtual {p0, v5}, Lco/vine/android/RecordingFragment;->startDrafts(Z)V

    goto :goto_0

    .line 510
    :cond_2
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mDraftOverlayIcon:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 512
    new-array v1, v6, [I

    .line 513
    .local v1, location:[I
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mDraftsButton:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->getLocationOnScreen([I)V

    .line 514
    aget v2, v1, v5

    .line 515
    .local v2, x:I
    const/4 v4, 0x1

    aget v3, v1, v4

    .line 516
    .local v3, y:I
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mDraftOverlayIcon:Landroid/view/View;

    int-to-float v5, v2

    invoke-virtual {v4, v5}, Landroid/view/View;->setX(F)V

    .line 518
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b001c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    .line 521
    .local v0, draftOverlayOffset:I
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mDraftOverlayIcon:Landroid/view/View;

    sub-int v5, v3, v0

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setY(F)V

    .line 523
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mNoDraftsOverlay:Landroid/view/View;

    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mOnNoDraftOverlayTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 524
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mFadeIn:Landroid/view/animation/Animation;

    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mFadeInListener:Landroid/view/animation/Animation$AnimationListener;

    invoke-virtual {v4, v5}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 525
    iget-object v4, p0, Lco/vine/android/RecordingFragment;->mNoDraftsOverlay:Landroid/view/View;

    iget-object v5, p0, Lco/vine/android/RecordingFragment;->mFadeIn:Landroid/view/animation/Animation;

    invoke-virtual {v4, v5}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0
.end method

.method public onShowDrafts()V
    .locals 2

    .prologue
    .line 648
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecordingOptions:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 649
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    .line 405
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 406
    invoke-virtual {p0}, Lco/vine/android/RecordingFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 412
    .local v1, res:Landroid/content/res/Resources;
    iget-object v6, p0, Lco/vine/android/RecordingFragment;->mNoDraftsOverlay:Landroid/view/View;

    const v7, 0x7f0a012b

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 413
    .local v2, sadface:Landroid/view/View;
    const v6, 0x7f0b0042

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    int-to-float v0, v6

    .line 414
    .local v0, progressHeight:F
    const v6, 0x7f0b001f

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    int-to-float v3, v6

    .line 415
    .local v3, sadfaceHeight:F
    iget-object v6, p0, Lco/vine/android/RecordingFragment;->mScreenSize:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    add-float/2addr v6, v0

    sub-float/2addr v6, v3

    invoke-virtual {v2, v6}, Landroid/view/View;->setY(F)V

    .line 418
    iget-object v6, p0, Lco/vine/android/RecordingFragment;->mNoDraftsOverlay:Landroid/view/View;

    const v7, 0x7f0a012c

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 419
    .local v4, sadfaceText:Landroid/view/View;
    const v6, 0x7f0b0020

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    int-to-float v5, v6

    .line 420
    .local v5, spacing:F
    invoke-virtual {v2}, Landroid/view/View;->getY()F

    move-result v6

    add-float/2addr v6, v5

    invoke-virtual {v4, v6}, Landroid/view/View;->setY(F)V

    .line 423
    const v6, 0x7f0a012d

    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lco/vine/android/RecordingFragment;->mDraftOverlayIcon:Landroid/view/View;

    .line 424
    return-void
.end method

.method public resumeFromDraft()V
    .locals 5

    .prologue
    .line 616
    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v2, :cond_0

    .line 617
    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v2}, Lco/vine/android/recorder/VineRecorder;->isResuming()Z

    move-result v2

    if-nez v2, :cond_0

    .line 618
    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v2}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v1

    .line 620
    .local v1, resumeFile:Lco/vine/android/recorder/RecordingFile;
    iget-object v2, v1, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 621
    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    const-string v3, "BackPress, Resume from draft using resumeFile."

    invoke-virtual {v2, v3, v1}, Lco/vine/android/recorder/VineRecorder;->swapSession(Ljava/lang/String;Lco/vine/android/recorder/RecordingFile;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v0

    .line 625
    .local v0, newFile:Lco/vine/android/recorder/RecordingFile;
    :goto_0
    if-eqz v0, :cond_0

    .line 626
    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    const-string v3, "Resume draft"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lco/vine/android/recorder/VineRecorder;->onResume(Ljava/lang/String;Z)V

    .line 630
    .end local v0           #newFile:Lco/vine/android/recorder/RecordingFile;
    .end local v1           #resumeFile:Lco/vine/android/recorder/RecordingFile;
    :cond_0
    return-void

    .line 623
    .restart local v1       #resumeFile:Lco/vine/android/recorder/RecordingFile;
    :cond_1
    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    const-string v3, "BackPress, Resume from draft using determined."

    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lco/vine/android/RecordingFragment;->determineSessionFileForSwap(Z)Lco/vine/android/recorder/RecordingFile;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lco/vine/android/recorder/VineRecorder;->swapSession(Ljava/lang/String;Lco/vine/android/recorder/RecordingFile;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v0

    .restart local v0       #newFile:Lco/vine/android/recorder/RecordingFile;
    goto :goto_0
.end method

.method public reverseFrames()V
    .locals 1

    .prologue
    .line 597
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 598
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->reverseFrames()V

    .line 600
    :cond_0
    return-void
.end method

.method public saveSession()V
    .locals 3

    .prologue
    .line 568
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 569
    const-string v0, "saveNoQuit"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils;->trackSaveSession(Ljava/lang/String;)V

    .line 570
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->saveSession(Ljava/lang/Runnable;Z)V

    .line 572
    :cond_0
    return-void
.end method

.method public saveSessionAndQuit()V
    .locals 3

    .prologue
    .line 550
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 551
    const-string v0, "quit"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils;->trackSaveSession(Ljava/lang/String;)V

    .line 552
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    new-instance v1, Lco/vine/android/RecordingFragment$8;

    invoke-direct {v1, p0}, Lco/vine/android/RecordingFragment$8;-><init>(Lco/vine/android/RecordingFragment;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->saveSession(Ljava/lang/Runnable;Z)V

    .line 562
    :cond_0
    return-void
.end method

.method public setDiscardChangesOnStop()V
    .locals 2

    .prologue
    .line 444
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 445
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineRecorder;->setDiscardChanges(Z)V

    .line 447
    :cond_0
    return-void
.end method

.method public setFileFileToUse(Lco/vine/android/recorder/RecordingFile;)V
    .locals 0
    .parameter "fileFileToUse"

    .prologue
    .line 581
    iput-object p1, p0, Lco/vine/android/RecordingFragment;->mFileFileToUse:Lco/vine/android/recorder/RecordingFile;

    .line 582
    return-void
.end method

.method public setStartWithEdit(Z)V
    .locals 0
    .parameter "startWithEdit"

    .prologue
    .line 585
    iput-boolean p1, p0, Lco/vine/android/RecordingFragment;->mStartWithEdit:Z

    .line 586
    return-void
.end method

.method public startDrafts(Z)V
    .locals 4
    .parameter "save"

    .prologue
    const/4 v3, 0x0

    .line 486
    const-string v0, "Start Drafts: {}."

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 487
    if-eqz p1, :cond_0

    .line 488
    const-string v0, "drafts"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils;->trackSaveSession(Ljava/lang/String;)V

    .line 489
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    iget-object v1, p0, Lco/vine/android/RecordingFragment;->mStartDraftsRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, v3}, Lco/vine/android/recorder/VineRecorder;->saveSession(Ljava/lang/Runnable;Z)V

    .line 494
    :goto_0
    return-void

    .line 491
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/RecordingFragment;->mFileFileToUse:Lco/vine/android/recorder/RecordingFile;

    .line 492
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    const-string v1, "StartDrafts"

    iget-object v2, p0, Lco/vine/android/RecordingFragment;->mStartDraftsRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/recorder/VineRecorder;->stopAndDiscardChanges(Ljava/lang/String;Ljava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method public swapFolder(Ljava/lang/String;Ljava/io/File;)V
    .locals 3
    .parameter "tag"
    .parameter "folder"

    .prologue
    .line 603
    iput-object p2, p0, Lco/vine/android/RecordingFragment;->mFolder:Ljava/io/File;

    .line 604
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    if-eqz v0, :cond_0

    .line 605
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/RecordingFragment;->setFileFileToUse(Lco/vine/android/recorder/RecordingFile;)V

    .line 606
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " swap"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lco/vine/android/RecordingFragment;->determineSessionFileForSwap(Z)Lco/vine/android/recorder/RecordingFile;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->swapSession(Ljava/lang/String;Lco/vine/android/recorder/RecordingFile;)Lco/vine/android/recorder/RecordingFile;

    .line 607
    iget-object v0, p0, Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;

    const-string v1, "Swap folder"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->onResume(Ljava/lang/String;Z)V

    .line 609
    :cond_0
    return-void
.end method
