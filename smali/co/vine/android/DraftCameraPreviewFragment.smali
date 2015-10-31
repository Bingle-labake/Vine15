.class public Lco/vine/android/DraftCameraPreviewFragment;
.super Lco/vine/android/BaseFragment;
.source "DraftCameraPreviewFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mDimen:I

.field private mIcon:Landroid/widget/ImageView;

.field private mMasksAdjusted:Z

.field private mPreviewView:Landroid/view/View;

.field private mRes:Landroid/content/res/Resources;

.field private mScreenSize:Landroid/graphics/Point;

.field private final onMaskTouchListener:Landroid/view/View$OnTouchListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lco/vine/android/BaseFragment;-><init>()V

    .line 28
    new-instance v0, Lco/vine/android/DraftCameraPreviewFragment$1;

    invoke-direct {v0, p0}, Lco/vine/android/DraftCameraPreviewFragment$1;-><init>(Lco/vine/android/DraftCameraPreviewFragment;)V

    iput-object v0, p0, Lco/vine/android/DraftCameraPreviewFragment;->onMaskTouchListener:Landroid/view/View$OnTouchListener;

    .line 37
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "dimen"

    .prologue
    .line 42
    invoke-direct {p0}, Lco/vine/android/BaseFragment;-><init>()V

    .line 28
    new-instance v0, Lco/vine/android/DraftCameraPreviewFragment$1;

    invoke-direct {v0, p0}, Lco/vine/android/DraftCameraPreviewFragment$1;-><init>(Lco/vine/android/DraftCameraPreviewFragment;)V

    iput-object v0, p0, Lco/vine/android/DraftCameraPreviewFragment;->onMaskTouchListener:Landroid/view/View$OnTouchListener;

    .line 43
    iput p1, p0, Lco/vine/android/DraftCameraPreviewFragment;->mDimen:I

    .line 44
    return-void
.end method


# virtual methods
.method public getIconView()Landroid/view/View;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lco/vine/android/DraftCameraPreviewFragment;->mPreviewView:Landroid/view/View;

    return-object v0
.end method

.method public declared-synchronized initMasks(Landroid/view/View;II)V
    .locals 11
    .parameter "rootView"
    .parameter "actualWidth"
    .parameter "actualHeight"

    .prologue
    .line 98
    monitor-enter p0

    :try_start_0
    iget-boolean v9, p0, Lco/vine/android/DraftCameraPreviewFragment;->mMasksAdjusted:Z

    if-nez v9, :cond_0

    .line 99
    const/4 v9, 0x1

    iput-boolean v9, p0, Lco/vine/android/DraftCameraPreviewFragment;->mMasksAdjusted:Z

    .line 100
    const v9, 0x7f0a007b

    invoke-virtual {p1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 101
    .local v7, topMask:Landroid/view/View;
    const v9, 0x7f0a007c

    invoke-virtual {p1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 103
    .local v1, bottomMask:Landroid/view/View;
    iget-object v9, p0, Lco/vine/android/DraftCameraPreviewFragment;->onMaskTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v7, v9}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 104
    iget-object v9, p0, Lco/vine/android/DraftCameraPreviewFragment;->onMaskTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v1, v9}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 105
    iget v3, p0, Lco/vine/android/DraftCameraPreviewFragment;->mDimen:I

    .line 106
    .local v3, desiredHeight:I
    if-le p3, v3, :cond_0

    .line 108
    iget-object v9, p0, Lco/vine/android/DraftCameraPreviewFragment;->mRes:Landroid/content/res/Resources;

    const v10, 0x7f0b001e

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    .line 110
    .local v4, draftProgress:I
    iget-object v9, p0, Lco/vine/android/DraftCameraPreviewFragment;->mRes:Landroid/content/res/Resources;

    const v10, 0x7f0b0042

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v5

    .line 113
    .local v5, progress:I
    mul-int/lit8 v9, v4, 0x3

    add-int v6, v9, v5

    .line 114
    .local v6, topHeight:I
    sub-int v9, p3, v6

    iget v10, p0, Lco/vine/android/DraftCameraPreviewFragment;->mDimen:I

    sub-int v0, v9, v10

    .line 116
    .local v0, bottomHeight:I
    if-lez v0, :cond_0

    .line 117
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    .line 118
    .local v8, topMaskParams:Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 119
    .local v2, bottomMaskParams:Landroid/view/ViewGroup$LayoutParams;
    iput v6, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 120
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 121
    invoke-virtual {v7, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    .end local v0           #bottomHeight:I
    .end local v1           #bottomMask:Landroid/view/View;
    .end local v2           #bottomMaskParams:Landroid/view/ViewGroup$LayoutParams;
    .end local v3           #desiredHeight:I
    .end local v4           #draftProgress:I
    .end local v5           #progress:I
    .end local v6           #topHeight:I
    .end local v7           #topMask:Landroid/view/View;
    .end local v8           #topMaskParams:Landroid/view/ViewGroup$LayoutParams;
    :cond_0
    monitor-exit p0

    return-void

    .line 98
    :catchall_0
    move-exception v9

    monitor-exit p0

    throw v9
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 131
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 141
    :goto_0
    return-void

    .line 133
    :pswitch_0
    invoke-virtual {p0}, Lco/vine/android/DraftCameraPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/AbstractRecordingActivity;

    .line 134
    .local v0, activity:Lco/vine/android/AbstractRecordingActivity;
    iget-object v1, p0, Lco/vine/android/DraftCameraPreviewFragment;->mPreviewView:Landroid/view/View;

    iget-object v2, p0, Lco/vine/android/DraftCameraPreviewFragment;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v1, v2}, Lco/vine/android/AbstractRecordingActivity;->cameraPreviewToRecorder(Landroid/view/View;Landroid/view/View;)V

    goto :goto_0

    .line 131
    :pswitch_data_0
    .packed-switch 0x7f0a007a
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 48
    invoke-super {p0, p1}, Lco/vine/android/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    .line 49
    invoke-virtual {p0}, Lco/vine/android/DraftCameraPreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/DraftCameraPreviewFragment;->mRes:Landroid/content/res/Resources;

    .line 50
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 12
    .parameter "inflater"
    .parameter "root"
    .parameter "savedInstanceState"

    .prologue
    .line 55
    const v10, 0x7f030027

    const/4 v11, 0x0

    invoke-virtual {p1, v10, p2, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 57
    .local v8, rootView:Landroid/view/View;
    if-nez v8, :cond_0

    .line 58
    const/4 v8, 0x0

    .line 93
    .end local v8           #rootView:Landroid/view/View;
    :goto_0
    return-object v8

    .line 61
    .restart local v8       #rootView:Landroid/view/View;
    :cond_0
    iget-object v10, p0, Lco/vine/android/DraftCameraPreviewFragment;->mRes:Landroid/content/res/Resources;

    const v11, 0x7f0b001e

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    .line 63
    .local v3, draftProgressDimen:I
    iget-object v10, p0, Lco/vine/android/DraftCameraPreviewFragment;->mRes:Landroid/content/res/Resources;

    const v11, 0x7f0b0042

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v7

    .line 64
    .local v7, progressDimen:I
    iget-object v10, p0, Lco/vine/android/DraftCameraPreviewFragment;->mRes:Landroid/content/res/Resources;

    const v11, 0x7f0b0021

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    .line 66
    .local v6, offset:I
    const v10, 0x7f0a007a

    invoke-virtual {v8, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    .line 68
    .local v1, container:Landroid/widget/RelativeLayout;
    invoke-virtual {v1, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    const v10, 0x7f0a007d

    invoke-virtual {v1, v10}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    .line 72
    .local v4, icon:Landroid/widget/RelativeLayout;
    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 75
    .local v5, iconParams:Landroid/widget/RelativeLayout$LayoutParams;
    iget v10, p0, Lco/vine/android/DraftCameraPreviewFragment;->mDimen:I

    iput v10, v5, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 76
    iget v10, p0, Lco/vine/android/DraftCameraPreviewFragment;->mDimen:I

    iput v10, v5, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 77
    mul-int/lit8 v10, v3, 0x2

    add-int/2addr v10, v7

    iput v10, v5, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 79
    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    iput-object v4, p0, Lco/vine/android/DraftCameraPreviewFragment;->mPreviewView:Landroid/view/View;

    .line 82
    const v10, 0x7f0a007e

    invoke-virtual {v4, v10}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/ImageView;

    iput-object v10, p0, Lco/vine/android/DraftCameraPreviewFragment;->mIcon:Landroid/widget/ImageView;

    .line 84
    invoke-virtual {p0}, Lco/vine/android/DraftCameraPreviewFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v10

    check-cast v10, Lco/vine/android/AbstractRecordingActivity;

    invoke-virtual {v10}, Lco/vine/android/AbstractRecordingActivity;->getScreenSize()Landroid/graphics/Point;

    move-result-object v9

    .line 85
    .local v9, screenSize:Landroid/graphics/Point;
    iput-object v9, p0, Lco/vine/android/DraftCameraPreviewFragment;->mScreenSize:Landroid/graphics/Point;

    .line 87
    iget-object v10, p0, Lco/vine/android/DraftCameraPreviewFragment;->mRes:Landroid/content/res/Resources;

    const v11, 0x7f0b001b

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    .line 89
    .local v2, dotsHeight:I
    iget v10, v9, Landroid/graphics/Point;->x:I

    add-int/2addr v10, v7

    add-int v0, v10, v2

    .line 91
    .local v0, actualHeight:I
    iget v10, v9, Landroid/graphics/Point;->x:I

    invoke-virtual {p0, v8, v10, v0}, Lco/vine/android/DraftCameraPreviewFragment;->initMasks(Landroid/view/View;II)V

    goto :goto_0
.end method
