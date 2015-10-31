.class public Lco/vine/android/SonyRecordingActivity;
.super Lco/vine/android/AbstractRecordingActivity;
.source "SonyRecordingActivity.java"


# static fields
.field private static final MODE_NAME:Ljava/lang/String; = "vine"


# instance fields
.field private mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

.field private mSonyFilterColor:I

.field private mSonyModeName:Ljava/lang/String;

.field private mSonyModeSelectorButton:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/vine/android/SonyRecordingActivity;)Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;
    .locals 1
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    return-object v0
.end method

.method static synthetic access$100(Lco/vine/android/SonyRecordingActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 23
    invoke-direct {p0}, Lco/vine/android/SonyRecordingActivity;->showSonyOverlay()V

    return-void
.end method

.method static synthetic access$200(Lco/vine/android/SonyRecordingActivity;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/SonyRecordingActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 23
    iget v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyFilterColor:I

    return v0
.end method

.method private onHideSonyOverlay()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 218
    const v3, 0x7f0a011f

    invoke-virtual {p0, v3}, Lco/vine/android/SonyRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 219
    .local v2, recordingOptions:Landroid/view/View;
    const v3, 0x7f0a011d

    invoke-virtual {p0, v3}, Lco/vine/android/SonyRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 220
    .local v0, captureX:Landroid/view/View;
    const v3, 0x7f0a0084

    invoke-virtual {p0, v3}, Lco/vine/android/SonyRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 222
    .local v1, progressBar:Landroid/view/View;
    if-eqz v2, :cond_0

    .line 223
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 225
    :cond_0
    if-eqz v0, :cond_1

    .line 226
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 228
    :cond_1
    if-eqz v1, :cond_2

    .line 229
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 231
    :cond_2
    return-void
.end method

.method private onShowSonyOverlay()V
    .locals 5

    .prologue
    const/4 v4, 0x4

    .line 234
    const v3, 0x7f0a011f

    invoke-virtual {p0, v3}, Lco/vine/android/SonyRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 235
    .local v2, recordingOptions:Landroid/view/View;
    const v3, 0x7f0a011d

    invoke-virtual {p0, v3}, Lco/vine/android/SonyRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 236
    .local v0, captureX:Landroid/view/View;
    const v3, 0x7f0a0084

    invoke-virtual {p0, v3}, Lco/vine/android/SonyRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 238
    .local v1, progressBar:Landroid/view/View;
    if-eqz v2, :cond_0

    .line 239
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 241
    :cond_0
    if-eqz v0, :cond_1

    .line 242
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 244
    :cond_1
    if-eqz v1, :cond_2

    .line 245
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 247
    :cond_2
    return-void
.end method

.method private showSonyOverlay()V
    .locals 2

    .prologue
    .line 175
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    iget-object v1, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;->open(Ljava/lang/String;)V

    .line 176
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 177
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 178
    invoke-direct {p0}, Lco/vine/android/SonyRecordingActivity;->onShowSonyOverlay()V

    .line 179
    return-void
.end method


# virtual methods
.method protected createRecordingFragment()Lco/vine/android/RecordingFragment;
    .locals 1

    .prologue
    .line 214
    new-instance v0, Lco/vine/android/SonyRecordingFragment;

    invoke-direct {v0}, Lco/vine/android/SonyRecordingFragment;-><init>()V

    return-object v0
.end method

.method protected createRecordingPreviewFragment(Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;)Lco/vine/android/RecordingPreviewFragment;
    .locals 3
    .parameter "finalFile"
    .parameter "thumbNailPath"

    .prologue
    .line 83
    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getVideoPath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/SonyRecordingActivity;->mUploadFile:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, p2, v2}, Lco/vine/android/RecordingPreviewFragment;->newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lco/vine/android/RecordingPreviewFragment;

    move-result-object v0

    return-object v0
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    invoke-virtual {v0}, Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    invoke-virtual {v0}, Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;->close()V

    .line 54
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 55
    invoke-direct {p0}, Lco/vine/android/SonyRecordingActivity;->onHideSonyOverlay()V

    .line 59
    :goto_0
    return-void

    .line 57
    :cond_0
    invoke-super {p0}, Lco/vine/android/AbstractRecordingActivity;->onBackPressed()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 34
    invoke-super {p0, p1}, Lco/vine/android/AbstractRecordingActivity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    invoke-virtual {p0}, Lco/vine/android/SonyRecordingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 36
    .local v0, res:Landroid/content/res/Resources;
    const v1, 0x7f090067

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lco/vine/android/SonyRecordingActivity;->mSonyFilterColor:I

    .line 37
    const-string v1, "vine"

    iput-object v1, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeName:Ljava/lang/String;

    .line 41
    invoke-static {p0}, Lco/vine/android/util/SonyUtil;->startSession(Landroid/content/Context;)V

    .line 42
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 73
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 77
    :cond_0
    invoke-super {p0}, Lco/vine/android/AbstractRecordingActivity;->onDestroy()V

    .line 78
    return-void
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 1
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    .line 183
    packed-switch p2, :pswitch_data_0

    .line 206
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/AbstractRecordingActivity;->onDialogDone(Landroid/content/DialogInterface;II)V

    .line 210
    :goto_0
    return-void

    .line 185
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    .line 196
    invoke-virtual {p0}, Lco/vine/android/SonyRecordingActivity;->currentlyHoldsRecordingFragment()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->saveSession()V

    .line 199
    :cond_0
    invoke-direct {p0}, Lco/vine/android/SonyRecordingActivity;->showSonyOverlay()V

    goto :goto_0

    .line 188
    :pswitch_1
    invoke-virtual {p0}, Lco/vine/android/SonyRecordingActivity;->currentlyHoldsRecordingFragment()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 189
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->setDiscardChangesOnStop()V

    .line 191
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/SonyRecordingActivity;->discardUpload()V

    .line 192
    invoke-direct {p0}, Lco/vine/android/SonyRecordingActivity;->showSonyOverlay()V

    goto :goto_0

    .line 183
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch

    .line 185
    :pswitch_data_1
    .packed-switch -0x3
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    invoke-virtual {v0}, Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;->release()V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    .line 68
    :cond_0
    invoke-super {p0}, Lco/vine/android/AbstractRecordingActivity;->onPause()V

    .line 69
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 46
    invoke-super {p0}, Lco/vine/android/AbstractRecordingActivity;->onResume()V

    .line 47
    invoke-virtual {p0}, Lco/vine/android/SonyRecordingActivity;->setupSonyOverlay()V

    .line 48
    return-void
.end method

.method public setupSonyOverlay()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 89
    const v2, 0x7f0a0127

    invoke-virtual {p0, v2}, Lco/vine/android/SonyRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 90
    .local v1, mSonySelectorContainer:Landroid/view/ViewGroup;
    const v2, 0x7f0a0126

    invoke-virtual {p0, v2}, Lco/vine/android/SonyRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    .line 92
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    if-nez v1, :cond_1

    .line 169
    :cond_0
    :goto_0
    return-void

    .line 96
    :cond_1
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 97
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    new-instance v3, Lco/vine/android/SonyRecordingActivity$1;

    invoke-direct {v3, p0}, Lco/vine/android/SonyRecordingActivity$1;-><init>(Lco/vine/android/SonyRecordingActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    new-instance v3, Lco/vine/android/SonyRecordingActivity$2;

    invoke-direct {v3, p0}, Lco/vine/android/SonyRecordingActivity$2;-><init>(Lco/vine/android/SonyRecordingActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 133
    :try_start_0
    new-instance v2, Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    invoke-direct {v2, p0, v1}, Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;)V

    iput-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    :goto_1
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    if-eqz v2, :cond_2

    .line 143
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    new-instance v3, Lco/vine/android/SonyRecordingActivity$3;

    invoke-direct {v3, p0}, Lco/vine/android/SonyRecordingActivity$3;-><init>(Lco/vine/android/SonyRecordingActivity;)V

    invoke-virtual {v2, v3}, Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;->setOnModeSelectListener(Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector$OnModeSelectListener;)V

    .line 153
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyCapturingModeSelector:Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;

    new-instance v3, Lco/vine/android/SonyRecordingActivity$4;

    invoke-direct {v3, p0}, Lco/vine/android/SonyRecordingActivity$4;-><init>(Lco/vine/android/SonyRecordingActivity;)V

    invoke-virtual {v2, v3}, Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector;->setOnModeFinishListener(Lcom/sonymobile/camera/addon/capturingmode/CapturingModeSelector$OnModeFinishListener;)V

    .line 163
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 134
    :catch_0
    move-exception v0

    .line 137
    .local v0, e:Ljava/lang/NoClassDefFoundError;
    new-instance v2, Lco/vine/android/VineException;

    const-string v3, "Unable to create Sony Capture Mode selector."

    invoke-direct {v2, v3}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/crashlytics/android/Crashlytics;->logException(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 167
    .end local v0           #e:Ljava/lang/NoClassDefFoundError;
    :cond_2
    iget-object v2, p0, Lco/vine/android/SonyRecordingActivity;->mSonyModeSelectorButton:Landroid/widget/ImageView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method
