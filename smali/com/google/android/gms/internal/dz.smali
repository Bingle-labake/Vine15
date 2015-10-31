.class public Lcom/google/android/gms/internal/dz;
.super Landroid/widget/LinearLayout;

# interfaces
.implements Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/dz$b;,
        Lcom/google/android/gms/internal/dz$c;,
        Lcom/google/android/gms/internal/dz$a;
    }
.end annotation


# static fields
.field private static final hr:I


# instance fields
.field private K:I

.field protected bi:I

.field protected gY:Lcom/google/android/gms/plus/PlusClient;

.field private hA:I

.field private hB:[Landroid/net/Uri;

.field private hC:[Ljava/lang/String;

.field private hD:[Ljava/lang/String;

.field protected hE:Ljava/lang/String;

.field protected hF:Lcom/google/android/gms/internal/du;

.field protected final hG:Landroid/content/res/Resources;

.field protected final hH:Landroid/view/LayoutInflater;

.field private hI:Lcom/google/android/gms/internal/dz$b;

.field protected hs:Z

.field protected ht:I

.field protected final hu:Landroid/widget/LinearLayout;

.field protected final hv:Landroid/widget/FrameLayout;

.field protected final hw:Landroid/widget/CompoundButton;

.field private final hx:Landroid/widget/ProgressBar;

.field protected final hy:Lcom/google/android/gms/internal/ea;

.field private final hz:[Lcom/google/android/gms/internal/dt;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "#666666"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/gms/internal/dz;->hr:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 9

    const/4 v8, 0x4

    const/4 v3, 0x1

    const/4 v1, 0x0

    const/16 v7, 0x11

    const/4 v4, 0x0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput v1, p0, Lcom/google/android/gms/internal/dz;->ht:I

    new-array v0, v8, [Lcom/google/android/gms/internal/dt;

    iput-object v0, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    iput v3, p0, Lcom/google/android/gms/internal/dz;->bi:I

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/gms/internal/dz;->hA:I

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/internal/dz;->K:I

    new-instance v0, Lcom/google/android/gms/internal/dz$b;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/dz$b;-><init>(Lcom/google/android/gms/internal/dz;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/dz;->hI:Lcom/google/android/gms/internal/dz$b;

    const-string v0, "Context must not be null."

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/x;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_0

    iput-object v4, p0, Lcom/google/android/gms/internal/dz;->hG:Landroid/content/res/Resources;

    iput-object v4, p0, Lcom/google/android/gms/internal/dz;->hH:Landroid/view/LayoutInflater;

    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/dz;->a(Landroid/content/Context;Landroid/util/AttributeSet;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/dz;->K:I

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/dz;->b(Landroid/content/Context;Landroid/util/AttributeSet;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/dz;->hA:I

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/dz;->a(Landroid/graphics/Point;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setGravity(I)V

    const-string v2, "[ +1 ]"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-direct {v2, v3, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/internal/dz;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v4, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    iput-object v4, p0, Lcom/google/android/gms/internal/dz;->hx:Landroid/widget/ProgressBar;

    iput-object v4, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    iput-object v4, p0, Lcom/google/android/gms/internal/dz;->hv:Landroid/widget/FrameLayout;

    iput-object v4, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    :goto_1
    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/dz;->k(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/dz;->hG:Landroid/content/res/Resources;

    const-string v2, "layout_inflater"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/google/android/gms/internal/dz;->hH:Landroid/view/LayoutInflater;

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/dz;->setFocusable(Z)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/dz;->addView(Landroid/view/View;)V

    new-instance v2, Lcom/google/android/gms/internal/dz$c;

    invoke-direct {v2, p0, p1}, Lcom/google/android/gms/internal/dz$c;-><init>(Lcom/google/android/gms/internal/dz;Landroid/content/Context;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v2, v4}, Landroid/widget/CompoundButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/dz;->n(Landroid/content/Context;)Lcom/google/android/gms/internal/ea;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/dz;->l(Landroid/content/Context;)Landroid/widget/FrameLayout;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/dz;->hv:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hv:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    iget v5, v0, Landroid/graphics/Point;->x:I

    iget v6, v0, Landroid/graphics/Point;->y:I

    invoke-direct {v4, v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/dz;->b(Landroid/graphics/Point;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/dz;->m(Landroid/content/Context;)Landroid/widget/ProgressBar;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/dz;->hx:Landroid/widget/ProgressBar;

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hx:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v8}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hv:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/google/android/gms/internal/dz;->hx:Landroid/widget/ProgressBar;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    iget v5, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-direct {v4, v5, v0, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    array-length v2, v0

    move v0, v1

    :goto_2
    if-ge v0, v2, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/google/android/gms/internal/dz;->o(Landroid/content/Context;)Lcom/google/android/gms/internal/dt;

    move-result-object v3

    aput-object v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bm()V

    goto/16 :goto_1
.end method

.method private a(Landroid/content/Context;Landroid/util/AttributeSet;)I
    .locals 8

    const/4 v7, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x0

    const-string v0, "http://schemas.android.com/apk/lib/com.google.android.gms.plus"

    const-string v1, "size"

    const-string v6, "PlusOneButton"

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/ab;->a(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "SMALL"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return v5

    :cond_0
    const-string v1, "MEDIUM"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v5, v4

    goto :goto_0

    :cond_1
    const-string v1, "TALL"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v5, 0x2

    goto :goto_0

    :cond_2
    const-string v1, "STANDARD"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v5, v7

    goto :goto_0

    :cond_3
    move v5, v7

    goto :goto_0
.end method

.method private a(Landroid/graphics/Point;)V
    .locals 7

    const/16 v1, 0x18

    const/16 v0, 0x14

    const/4 v5, 0x1

    const-wide/high16 v3, 0x3fe0

    iget v2, p0, Lcom/google/android/gms/internal/dz;->K:I

    packed-switch v2, :pswitch_data_0

    const/16 v0, 0x26

    move v6, v1

    move v1, v0

    move v0, v6

    :goto_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    int-to-float v1, v1

    invoke-static {v5, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    int-to-float v0, v0

    invoke-static {v5, v0, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-double v1, v1

    add-double/2addr v1, v3

    double-to-int v1, v1

    iput v1, p1, Landroid/graphics/Point;->x:I

    float-to-double v0, v0

    add-double/2addr v0, v3

    double-to-int v0, v0

    iput v0, p1, Landroid/graphics/Point;->y:I

    return-void

    :pswitch_0
    const/16 v1, 0x20

    goto :goto_0

    :pswitch_1
    const/16 v0, 0xe

    goto :goto_0

    :pswitch_2
    const/16 v1, 0x32

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private a([Landroid/net/Uri;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->hB:[Landroid/net/Uri;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bq()V

    return-void
.end method

.method private b(Landroid/content/Context;Landroid/util/AttributeSet;)I
    .locals 7

    const/4 v5, 0x0

    const/4 v4, 0x1

    const-string v0, "http://schemas.android.com/apk/lib/com.google.android.gms.plus"

    const-string v1, "annotation"

    const-string v6, "PlusOneButton"

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/ab;->a(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "INLINE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v4, 0x2

    :cond_0
    :goto_0
    return v4

    :cond_1
    const-string v1, "NONE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    move v4, v5

    goto :goto_0

    :cond_2
    const-string v1, "BUBBLE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0
.end method

.method private b(Landroid/graphics/Point;)V
    .locals 4

    iget v0, p1, Landroid/graphics/Point;->y:I

    int-to-float v0, v0

    const/4 v1, 0x1

    const/high16 v2, 0x40c0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    sub-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p1, Landroid/graphics/Point;->y:I

    iget v0, p1, Landroid/graphics/Point;->y:I

    iput v0, p1, Landroid/graphics/Point;->x:I

    return-void
.end method

.method private bh()V
    .locals 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/high16 v2, 0x40a0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v0, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v3, v2

    const/high16 v2, 0x3f80

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    invoke-static {v0, v2, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v4, v2

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    array-length v5, v2

    move v2, v1

    :goto_0
    if-ge v2, v5, :cond_2

    iget-object v6, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v6, v6, v2

    invoke-virtual {v6}, Lcom/google/android/gms/internal/dt;->getVisibility()I

    move-result v6

    if-eqz v6, :cond_0

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v7, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v7, v7, v2

    invoke-virtual {v7}, Lcom/google/android/gms/internal/dt;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz v0, :cond_1

    invoke-virtual {v6, v3, v1, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    move v0, v1

    :goto_2
    iget-object v7, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v7, v7, v2

    invoke-virtual {v7, v6}, Lcom/google/android/gms/internal/dt;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    :cond_1
    invoke-virtual {v6, v4, v1, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    goto :goto_2

    :cond_2
    return-void
.end method

.method private bj()Landroid/widget/LinearLayout$LayoutParams;
    .locals 6

    const/4 v5, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, -0x2

    iget v0, p0, Lcom/google/android/gms/internal/dz;->hA:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    :goto_0
    iget v1, p0, Lcom/google/android/gms/internal/dz;->K:I

    if-ne v1, v5, :cond_0

    move v1, v2

    :goto_1
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget v1, p0, Lcom/google/android/gms/internal/dz;->K:I

    if-ne v1, v5, :cond_1

    :goto_2
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    return-object v0

    :pswitch_0
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v4, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    goto :goto_0

    :pswitch_1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    goto :goto_0

    :cond_0
    move v1, v3

    goto :goto_1

    :cond_1
    move v3, v2

    goto :goto_2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private bp()V
    .locals 3

    const/4 v2, 0x0

    iget v0, p0, Lcom/google/android/gms/internal/dz;->hA:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ea;->f([Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ea;->setVisibility(I)V

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hC:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ea;->f([Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/ea;->setVisibility(I)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hD:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ea;->f([Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/ea;->setVisibility(I)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private bq()V
    .locals 11

    const/16 v10, 0x8

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hB:[Landroid/net/Uri;

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/google/android/gms/internal/dz;->hA:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    invoke-direct {p0, v3}, Lcom/google/android/gms/internal/dz;->a(Landroid/graphics/Point;)V

    iget v1, v3, Landroid/graphics/Point;->y:I

    iput v1, v3, Landroid/graphics/Point;->x:I

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    array-length v4, v1

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hB:[Landroid/net/Uri;

    array-length v5, v1

    move v2, v0

    :goto_0
    if-ge v2, v4, :cond_3

    if-ge v2, v5, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hB:[Landroid/net/Uri;

    aget-object v1, v1, v2

    :goto_1
    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v1, v1, v2

    invoke-virtual {v1, v10}, Lcom/google/android/gms/internal/dt;->setVisibility(I)V

    :goto_2
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    iget-object v6, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v6, v6, v2

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    iget v8, v3, Landroid/graphics/Point;->x:I

    iget v9, v3, Landroid/graphics/Point;->y:I

    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7}, Lcom/google/android/gms/internal/dt;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v6, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v6, v6, v2

    iget v7, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {v6, v1, v7}, Lcom/google/android/gms/internal/dt;->a(Landroid/net/Uri;I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v1, v1, v2

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/dt;->setVisibility(I)V

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    array-length v1, v1

    :goto_3
    if-ge v0, v1, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v2, v2, v0

    invoke-virtual {v2, v10}, Lcom/google/android/gms/internal/dt;->setVisibility(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_3
    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bh()V

    return-void
.end method

.method private br()Landroid/graphics/drawable/Drawable;
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hG:Landroid/content/res/Resources;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hG:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hG:Landroid/content/res/Resources;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bs()Ljava/lang/String;

    move-result-object v2

    const-string v3, "drawable"

    const-string v4, "com.google.android.gms"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0
.end method

.method private bs()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/dz;->K:I

    packed-switch v0, :pswitch_data_0

    const-string v0, "ic_plusone_standard"

    :goto_0
    return-object v0

    :pswitch_0
    const-string v0, "ic_plusone_small"

    goto :goto_0

    :pswitch_1
    const-string v0, "ic_plusone_medium"

    goto :goto_0

    :pswitch_2
    const-string v0, "ic_plusone_tall"

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private bt()Landroid/net/Uri;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bu()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/y;->i(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private bu()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/dz;->K:I

    packed-switch v0, :pswitch_data_0

    const-string v0, "global_count_bubble_standard"

    :goto_0
    return-object v0

    :pswitch_0
    const-string v0, "global_count_bubble_medium"

    goto :goto_0

    :pswitch_1
    const-string v0, "global_count_bubble_small"

    goto :goto_0

    :pswitch_2
    const-string v0, "global_count_bubble_tall"

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private c(II)V
    .locals 0

    iput p2, p0, Lcom/google/android/gms/internal/dz;->bi:I

    iput p1, p0, Lcom/google/android/gms/internal/dz;->K:I

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bi()V

    return-void
.end method

.method private c(Landroid/view/View;)V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v1, 0x0

    const/high16 v0, 0x4040

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v4, v0, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v2, v0

    const/high16 v0, 0x40a0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v4, v0, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    iget v3, p0, Lcom/google/android/gms/internal/dz;->hA:I

    if-ne v3, v5, :cond_0

    :goto_0
    iget v3, p0, Lcom/google/android/gms/internal/dz;->K:I

    if-ne v3, v5, :cond_1

    iget v3, p0, Lcom/google/android/gms/internal/dz;->hA:I

    if-ne v3, v4, :cond_1

    :goto_1
    invoke-virtual {p1, v0, v1, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    return-void

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    move v2, v1

    goto :goto_1
.end method

.method private static d(II)I
    .locals 2

    const/16 v0, 0xd

    packed-switch p0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return v0

    :pswitch_1
    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    const/16 v0, 0xf

    goto :goto_0

    :pswitch_2
    const/16 v0, 0xb

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private d([Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->hC:[Ljava/lang/String;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bp()V

    return-void
.end method

.method private e([Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->hD:[Ljava/lang/String;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bp()V

    return-void
.end method

.method private k(Landroid/content/Context;)Landroid/content/Context;
    .locals 3

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "com.google.android.gms"

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const-string v0, "PlusOneButton"

    const/4 v1, 0x5

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "PlusOneButton"

    const-string v1, "Google Play services is not installed"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private l(Landroid/content/Context;)Landroid/widget/FrameLayout;
    .locals 2

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    return-object v0
.end method

.method private m(Landroid/content/Context;)Landroid/widget/ProgressBar;
    .locals 3

    new-instance v0, Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    const v2, 0x1010288

    invoke-direct {v0, p1, v1, v2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setFocusable(Z)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    return-object v0
.end method

.method private n(Landroid/content/Context;)Lcom/google/android/gms/internal/ea;
    .locals 5

    const/4 v4, 0x0

    new-instance v0, Lcom/google/android/gms/internal/ea;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ea;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v4}, Lcom/google/android/gms/internal/ea;->setFocusable(Z)V

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ea;->setGravity(I)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/ea;->setSingleLine()V

    const/4 v1, 0x2

    iget v2, p0, Lcom/google/android/gms/internal/dz;->K:I

    iget v3, p0, Lcom/google/android/gms/internal/dz;->hA:I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/dz;->d(II)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    invoke-virtual {v0, v4, v1}, Lcom/google/android/gms/internal/ea;->setTextSize(IF)V

    sget v1, Lcom/google/android/gms/internal/dz;->hr:I

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ea;->setTextColor(I)V

    invoke-virtual {v0, v4}, Lcom/google/android/gms/internal/ea;->setVisibility(I)V

    return-object v0
.end method

.method private o(Landroid/content/Context;)Lcom/google/android/gms/internal/dt;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/dt;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/dt;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/dt;->setVisibility(I)V

    return-object v0
.end method


# virtual methods
.method protected bc()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hF:Lcom/google/android/gms/internal/du;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hF:Lcom/google/android/gms/internal/du;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/du;->bf()[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/dz;->d([Ljava/lang/String;)V

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hF:Lcom/google/android/gms/internal/du;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/du;->be()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/dz;->e([Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hF:Lcom/google/android/gms/internal/du;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/du;->bg()[Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/dz;->a([Landroid/net/Uri;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hF:Lcom/google/android/gms/internal/du;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/du;->bd()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bn()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bm()V

    goto :goto_0
.end method

.method protected bi()V
    .locals 9

    const/16 v8, 0x11

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/dz;->a(Landroid/graphics/Point;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    iget v4, v1, Landroid/graphics/Point;->x:I

    iget v5, v1, Landroid/graphics/Point;->y:I

    invoke-direct {v3, v4, v5, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3}, Landroid/widget/CompoundButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/dz;->b(Landroid/graphics/Point;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hx:Landroid/widget/ProgressBar;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    iget v4, v1, Landroid/graphics/Point;->x:I

    iget v1, v1, Landroid/graphics/Point;->y:I

    invoke-direct {v3, v4, v1, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget v1, p0, Lcom/google/android/gms/internal/dz;->hA:I

    if-ne v1, v6, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bt()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/ea;->a(Landroid/net/Uri;)V

    :goto_1
    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bq()V

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bj()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/ea;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget v1, p0, Lcom/google/android/gms/internal/dz;->K:I

    iget v2, p0, Lcom/google/android/gms/internal/dz;->hA:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/dz;->d(II)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v7, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-virtual {v2, v0, v1}, Lcom/google/android/gms/internal/ea;->setTextSize(IF)V

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/dz;->c(Landroid/view/View;)V

    iget v1, p0, Lcom/google/android/gms/internal/dz;->K:I

    if-ne v1, v7, :cond_2

    iget v1, p0, Lcom/google/android/gms/internal/dz;->hA:I

    if-ne v1, v6, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hv:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :goto_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->requestLayout()V

    goto/16 :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/ea;->a(Landroid/net/Uri;)V

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hv:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    array-length v1, v1

    :goto_3
    if-ge v0, v1, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hu:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_2
.end method

.method public bk()V
    .locals 2

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dz;->setType(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hx:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bo()V

    return-void
.end method

.method public bl()V
    .locals 2

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dz;->setType(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hx:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bo()V

    return-void
.end method

.method protected bm()V
    .locals 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dz;->setType(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hx:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bo()V

    return-void
.end method

.method protected bn()V
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dz;->setType(I)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hx:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bo()V

    return-void
.end method

.method protected bo()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->br()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    iget v0, p0, Lcom/google/android/gms/internal/dz;->bi:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public initialize(Lcom/google/android/gms/plus/PlusClient;Ljava/lang/String;I)V
    .locals 3
    .parameter "plusClient"
    .parameter "url"
    .parameter "activityRequestCode"

    .prologue
    const/4 v1, 0x0

    const-string v0, "Plus client must not be null."

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/x;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "URL must not be null."

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/x;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-ltz p3, :cond_1

    const v0, 0xffff

    if-gt p3, v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    const-string v2, "activityRequestCode must be an unsigned 16 bit integer."

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/x;->a(ZLjava/lang/Object;)V

    iput p3, p0, Lcom/google/android/gms/internal/dz;->ht:I

    iput-object p2, p0, Lcom/google/android/gms/internal/dz;->hE:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    array-length v0, v0

    :goto_1
    if-ge v1, v0, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hz:[Lcom/google/android/gms/internal/dt;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Lcom/google/android/gms/internal/dt;->a(Lcom/google/android/gms/plus/PlusClient;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dz;->onConnected(Landroid/os/Bundle;)V

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bi()V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->registerConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->registerConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    :cond_1
    return-void
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .locals 3
    .parameter "connectionHint"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hE:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    iget-object v1, p0, Lcom/google/android/gms/internal/dz;->hI:Lcom/google/android/gms/internal/dz$b;

    iget-object v2, p0, Lcom/google/android/gms/internal/dz;->hE:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/plus/PlusClient;->a(Lcom/google/android/gms/plus/PlusClient$b;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 0
    .parameter "status"

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bl()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->isConnectionCallbacksRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->gY:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/plus/PlusClient;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    :cond_1
    return-void
.end method

.method public onDisconnected()V
    .locals 0

    return-void
.end method

.method public performClick()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0}, Landroid/widget/CompoundButton;->performClick()Z

    move-result v0

    return v0
.end method

.method public setAnnotation(I)V
    .locals 2
    .parameter "annotation"

    .prologue
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "Annotation must not be null."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/x;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput p1, p0, Lcom/google/android/gms/internal/dz;->hA:I

    invoke-direct {p0}, Lcom/google/android/gms/internal/dz;->bp()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/dz;->bi()V

    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hw:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p1}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/dz;->hy:Lcom/google/android/gms/internal/ea;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/ea;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setOnPlusOneClickListener(Lcom/google/android/gms/plus/PlusOneButton$OnPlusOneClickListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    new-instance v0, Lcom/google/android/gms/internal/dz$a;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/dz$a;-><init>(Lcom/google/android/gms/internal/dz;Lcom/google/android/gms/plus/PlusOneButton$OnPlusOneClickListener;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/dz;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setSize(I)V
    .locals 1
    .parameter "size"

    .prologue
    iget v0, p0, Lcom/google/android/gms/internal/dz;->bi:I

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/dz;->c(II)V

    return-void
.end method

.method public setType(I)V
    .locals 1
    .parameter "type"

    .prologue
    iget v0, p0, Lcom/google/android/gms/internal/dz;->K:I

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/dz;->c(II)V

    return-void
.end method
