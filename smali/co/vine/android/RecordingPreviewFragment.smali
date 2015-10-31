.class public Lco/vine/android/RecordingPreviewFragment;
.super Lco/vine/android/BaseFragment;
.source "RecordingPreviewFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;


# static fields
.field public static final AG_THUMBNAIL_PATH:Ljava/lang/String; = "pic_path"

.field public static final AG_UPLOAD_PATH:Ljava/lang/String; = "upload_path"

.field public static final AG_VIDEO_PATH:Ljava/lang/String; = "video_path"

.field public static final ARG_FROM_SONY:Ljava/lang/String; = "f_s"

.field private static final DIALOG_MUST_LOGIN:I = 0x1

.field private static final REQUEST_CODE_LOGIN_TO_POST:I = 0x3039

.field public static final REQUEST_POST:I = 0x7c6

.field private static final TRANSITION_DURATION:J = 0xfaL


# instance fields
.field private mFinalFile:Lco/vine/android/recorder/RecordingFile;

.field private mIsFromSony:Z

.field private mNextButton:Landroid/view/View;

.field private mPreviewButtons:Landroid/view/View;

.field private mThumbnailPath:Ljava/lang/String;

.field private mUploadPath:Ljava/lang/String;

.field private mVideoPath:Ljava/lang/String;

.field private mVideoPlayer:Lco/vine/android/player/SdkVideoView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lco/vine/android/BaseFragment;-><init>()V

    return-void
.end method

.method private animateInViews()V
    .locals 6

    .prologue
    const-wide/16 v4, 0xfa

    const/4 v3, 0x0

    const/high16 v2, 0x3f80

    const/4 v1, 0x0

    .line 161
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mNextButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 162
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mNextButton:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 163
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mNextButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 165
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mPreviewButtons:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 166
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mPreviewButtons:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 167
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mPreviewButtons:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 168
    return-void
.end method

.method private animateOutViews()V
    .locals 4

    .prologue
    const-wide/16 v2, 0xfa

    const/4 v1, 0x0

    .line 171
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mNextButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 172
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mPreviewButtons:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 173
    return-void
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lco/vine/android/RecordingPreviewFragment;
    .locals 3
    .parameter "videoPath"
    .parameter "uploadPath"
    .parameter "thumbnailPath"
    .parameter "isFromSony"

    .prologue
    .line 78
    new-instance v1, Lco/vine/android/RecordingPreviewFragment;

    invoke-direct {v1}, Lco/vine/android/RecordingPreviewFragment;-><init>()V

    .line 79
    .local v1, fragment:Lco/vine/android/RecordingPreviewFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 80
    .local v0, bundle:Landroid/os/Bundle;
    const-string v2, "video_path"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    const-string v2, "pic_path"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const-string v2, "upload_path"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v2, "f_s"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 84
    invoke-virtual {v1, v0}, Lco/vine/android/RecordingPreviewFragment;->setArguments(Landroid/os/Bundle;)V

    .line 85
    return-object v1
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x0

    .line 90
    invoke-super {p0, p1}, Lco/vine/android/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 91
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 92
    .local v0, args:Landroid/os/Bundle;
    const-string v1, "video_path"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/RecordingPreviewFragment;->mVideoPath:Ljava/lang/String;

    .line 93
    const-string v1, "pic_path"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/RecordingPreviewFragment;->mThumbnailPath:Ljava/lang/String;

    .line 94
    const-string v1, "upload_path"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/RecordingPreviewFragment;->mUploadPath:Ljava/lang/String;

    .line 95
    const-string v1, "f_s"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/RecordingPreviewFragment;->mIsFromSony:Z

    .line 96
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/recorder/RecordConfigUtils;->deletePreProcess(Ljava/io/File;)V

    .line 97
    iget-object v1, p0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    iget-object v2, p0, Lco/vine/android/RecordingPreviewFragment;->mVideoPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lco/vine/android/player/SdkVideoView;->setVideoPath(Ljava/lang/String;)V

    .line 98
    const-string v1, "Preview: {}"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lco/vine/android/RecordingPreviewFragment;->mVideoPath:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 99
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 250
    sparse-switch p1, :sswitch_data_0

    .line 271
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 275
    :goto_0
    return-void

    .line 252
    :sswitch_0
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 254
    :pswitch_0
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->uploadAndToPost()V

    goto :goto_0

    .line 262
    :sswitch_1
    packed-switch p2, :pswitch_data_1

    goto :goto_0

    .line 264
    :pswitch_1
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 250
    nop

    :sswitch_data_0
    .sparse-switch
        0x7c6 -> :sswitch_1
        0x3039 -> :sswitch_0
    .end sparse-switch

    .line 252
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch

    .line 262
    :pswitch_data_1
    .packed-switch 0x20
        :pswitch_1
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "view"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 177
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 178
    .local v0, id:I
    packed-switch v0, :pswitch_data_0

    .line 208
    :goto_0
    return-void

    .line 180
    :pswitch_0
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v2

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->isLoggedIn()Z

    move-result v2

    if-nez v2, :cond_0

    .line 181
    invoke-static {v4}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    .line 183
    .local v1, p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v2, 0x7f0e0192

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 184
    const v2, 0x104000a

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 185
    const/high16 v2, 0x104

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNeutralButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 186
    invoke-virtual {v1, p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setListener(Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;)V

    .line 187
    invoke-virtual {v1, p0, v3}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 188
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0

    .line 192
    .end local v1           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->toPost()V

    .line 193
    const-string v2, "post"

    invoke-static {v2}, Lco/vine/android/util/FlurryUtils;->trackPreviewAction(Ljava/lang/String;)V

    goto :goto_0

    .line 198
    :pswitch_1
    invoke-direct {p0}, Lco/vine/android/RecordingPreviewFragment;->animateOutViews()V

    .line 199
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    check-cast v2, Lco/vine/android/AbstractRecordingActivity;

    invoke-virtual {p0, v2, v3}, Lco/vine/android/RecordingPreviewFragment;->previewToRecord(Lco/vine/android/AbstractRecordingActivity;Z)V

    .line 200
    const-string v2, "capture"

    invoke-static {v2}, Lco/vine/android/util/FlurryUtils;->trackPreviewAction(Ljava/lang/String;)V

    goto :goto_0

    .line 203
    :pswitch_2
    invoke-direct {p0}, Lco/vine/android/RecordingPreviewFragment;->animateOutViews()V

    .line 204
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    check-cast v2, Lco/vine/android/AbstractRecordingActivity;

    invoke-virtual {p0, v2, v4}, Lco/vine/android/RecordingPreviewFragment;->previewToRecord(Lco/vine/android/AbstractRecordingActivity;Z)V

    .line 205
    const-string v2, "edit"

    invoke-static {v2}, Lco/vine/android/util/FlurryUtils;->trackPreviewAction(Ljava/lang/String;)V

    goto :goto_0

    .line 178
    :pswitch_data_0
    .packed-switch 0x7f0a00f7
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 21
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 103
    const v18, 0x7f03004d

    const/16 v19, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v18

    move-object/from16 v2, p2

    move/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v16

    .line 104
    .local v16, view:Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/support/v4/app/FragmentActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v6

    .line 105
    .local v6, d:Landroid/view/Display;
    invoke-static {v6}, Lco/vine/android/util/Util;->getDisplaySize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v12

    .line 106
    .local v12, size:Landroid/graphics/Point;
    const v18, 0x7f0a00f6

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/RecordingPreviewFragment;->mPreviewButtons:Landroid/view/View;

    .line 107
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/RecordingPreviewFragment;->mPreviewButtons:Landroid/view/View;

    move-object/from16 v18, v0

    new-instance v19, Lco/vine/android/RecordingPreviewFragment$1;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/RecordingPreviewFragment$1;-><init>(Lco/vine/android/RecordingPreviewFragment;)V

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 113
    const v18, 0x7f0a00f9

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/RecordingPreviewFragment;->mNextButton:Landroid/view/View;

    .line 114
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/RecordingPreviewFragment;->mNextButton:Landroid/view/View;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    const v18, 0x7f0a00f7

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    const v18, 0x7f0a00f8

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 119
    const v18, 0x7f0a00f4

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Lco/vine/android/player/SdkVideoView;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    .line 120
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 121
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lco/vine/android/player/SdkVideoView;->setAutoPlayOnPrepared(Z)V

    .line 122
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lco/vine/android/player/SdkVideoView;->setKeepScreenOn(Z)V

    .line 125
    const v18, 0x7f0a0081

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    .line 126
    .local v15, videoPlayerContainer:Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/RecordingPreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x7f0b0016

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v14

    .line 127
    .local v14, topMaskHeightPx:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v18, v0

    check-cast v18, Lco/vine/android/player/StaticSizeVideoView;

    iget v0, v12, Landroid/graphics/Point;->x:I

    move/from16 v19, v0

    iget v0, v12, Landroid/graphics/Point;->x:I

    move/from16 v20, v0

    invoke-virtual/range {v18 .. v20}, Lco/vine/android/player/StaticSizeVideoView;->setSize(II)V

    .line 129
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lco/vine/android/player/SdkVideoView;->setLooping(Z)V

    .line 130
    new-instance v18, Lco/vine/android/player/OnSingleVideoClickedListener;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v19, v0

    invoke-direct/range {v18 .. v19}, Lco/vine/android/player/OnSingleVideoClickedListener;-><init>(Lco/vine/android/player/VideoViewInterface;)V

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    .line 133
    .local v11, rect:Landroid/graphics/Rect;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/support/v4/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v17

    .line 134
    .local v17, window:Landroid/view/Window;
    invoke-virtual/range {v17 .. v17}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 135
    const/16 v18, 0x10

    invoke-virtual/range {v17 .. v18}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 137
    const v18, 0x7f0a00f9

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    .line 138
    .local v13, toPostButton:Landroid/view/View;
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/widget/RelativeLayout$LayoutParams;

    .line 140
    .local v10, postButtonParams:Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/RecordingPreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x7f0b003f

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 141
    .local v9, postButtonHeight:I
    iget v0, v11, Landroid/graphics/Rect;->bottom:I

    move/from16 v18, v0

    iget v0, v11, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    sub-int v18, v18, v19

    iget v0, v12, Landroid/graphics/Point;->x:I

    move/from16 v19, v0

    sub-int v18, v18, v19

    sub-int v18, v18, v14

    sub-int v18, v18, v9

    div-int/lit8 v7, v18, 0x2

    .line 143
    .local v7, doneButtonBottomMargin:I
    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v10, v0, v1, v2, v7}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 144
    invoke-virtual {v13, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    const v18, 0x7f0a00f5

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 146
    .local v4, bottomMask:Landroid/view/View;
    iget v0, v11, Landroid/graphics/Rect;->bottom:I

    move/from16 v18, v0

    iget v0, v11, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    sub-int v18, v18, v19

    sub-int v18, v18, v14

    iget v0, v12, Landroid/graphics/Point;->x:I

    move/from16 v19, v0

    sub-int v5, v18, v19

    .line 147
    .local v5, bottomMaskHeightPx:I
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/widget/RelativeLayout$LayoutParams;

    .line 148
    .local v8, lp:Landroid/widget/RelativeLayout$LayoutParams;
    iput v5, v8, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 149
    invoke-virtual {v4, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 150
    new-instance v18, Lco/vine/android/RecordingPreviewFragment$2;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/RecordingPreviewFragment$2;-><init>(Lco/vine/android/RecordingPreviewFragment;)V

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 156
    invoke-direct/range {p0 .. p0}, Lco/vine/android/RecordingPreviewFragment;->animateInViews()V

    .line 157
    return-object v16
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 218
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onDestroy()V

    .line 219
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mFinalFile:Lco/vine/android/recorder/RecordingFile;

    .line 220
    return-void
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 4
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    const/4 v3, 0x1

    .line 228
    packed-switch p2, :pswitch_data_0

    .line 246
    :goto_0
    return-void

    .line 230
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    goto :goto_0

    .line 232
    :pswitch_1
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 233
    .local v0, activity:Landroid/app/Activity;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/SonyStartActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 234
    .local v1, i:Landroid/content/Intent;
    const-string v2, "login_request"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-object v2, v0

    .line 235
    check-cast v2, Lco/vine/android/AbstractRecordingActivity;

    invoke-virtual {v2, v3}, Lco/vine/android/AbstractRecordingActivity;->setWaitingForLogin(Z)V

    .line 236
    const/16 v2, 0x3039

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 228
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch

    .line 230
    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_1
    .end packed-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 61
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onPause()V

    .line 62
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->canPause()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->pause()V

    .line 65
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 69
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onResume()V

    .line 70
    invoke-direct {p0}, Lco/vine/android/RecordingPreviewFragment;->animateInViews()V

    .line 71
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    iget v0, v0, Lco/vine/android/player/SdkVideoView;->mCurrentState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 72
    iget-object v0, p0, Lco/vine/android/RecordingPreviewFragment;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->start()V

    .line 74
    :cond_0
    return-void
.end method

.method public previewToRecord(Lco/vine/android/AbstractRecordingActivity;Z)V
    .locals 2
    .parameter "activity"
    .parameter "startWithEdit"

    .prologue
    .line 211
    if-eqz p1, :cond_0

    .line 212
    const/4 v0, 0x0

    iget-object v1, p0, Lco/vine/android/RecordingPreviewFragment;->mFinalFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {p1, v0, p2, v1}, Lco/vine/android/AbstractRecordingActivity;->toRecord(ZZLco/vine/android/recorder/RecordingFile;)V

    .line 214
    :cond_0
    return-void
.end method

.method public setFinalFile(Lco/vine/android/recorder/RecordingFile;)V
    .locals 0
    .parameter "finalFile"

    .prologue
    .line 223
    iput-object p1, p0, Lco/vine/android/RecordingPreviewFragment;->mFinalFile:Lco/vine/android/recorder/RecordingFile;

    .line 224
    return-void
.end method

.method public toPost()V
    .locals 7

    .prologue
    .line 292
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/RecordingPreviewFragment;->mUploadPath:Ljava/lang/String;

    iget-object v2, p0, Lco/vine/android/RecordingPreviewFragment;->mThumbnailPath:Ljava/lang/String;

    iget-object v3, p0, Lco/vine/android/RecordingPreviewFragment;->mVideoPath:Ljava/lang/String;

    const/4 v4, 0x0

    iget-boolean v5, p0, Lco/vine/android/RecordingPreviewFragment;->mIsFromSony:Z

    invoke-static/range {v0 .. v5}, Lco/vine/android/PostActivity;->getIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    move-result-object v6

    .line 294
    .local v6, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const/16 v1, 0x7c6

    invoke-virtual {v0, v6, v1}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 295
    return-void
.end method

.method public uploadAndToPost()V
    .locals 5

    .prologue
    .line 283
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/RecordingPreviewFragment;->mFinalFile:Lco/vine/android/recorder/RecordingFile;

    iget-object v3, p0, Lco/vine/android/RecordingPreviewFragment;->mThumbnailPath:Ljava/lang/String;

    iget-object v4, p0, Lco/vine/android/RecordingPreviewFragment;->mFinalFile:Lco/vine/android/recorder/RecordingFile;

    iget-object v4, v4, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lco/vine/android/util/UploadManager;->addToUploadQueue(Landroid/content/Context;Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/RecordingPreviewFragment;->mUploadPath:Ljava/lang/String;

    .line 285
    invoke-virtual {p0}, Lco/vine/android/RecordingPreviewFragment;->toPost()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    :goto_0
    return-void

    .line 286
    :catch_0
    move-exception v0

    .line 287
    .local v0, e:Ljava/lang/Exception;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
