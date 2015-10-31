.class Lco/vine/android/HomeTabActivity$TabScrollListener;
.super Ljava/lang/Object;
.source "HomeTabActivity.java"

# interfaces
.implements Lco/vine/android/BaseListFragment$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/HomeTabActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TabScrollListener"
.end annotation


# instance fields
.field private final mActivity:Lco/vine/android/BaseControllerActionBarActivity;

.field private final mTabIndex:I


# direct methods
.method public constructor <init>(Lco/vine/android/BaseControllerActionBarActivity;I)V
    .locals 0
    .parameter "activity"
    .parameter "position"

    .prologue
    .line 788
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 789
    iput p2, p0, Lco/vine/android/HomeTabActivity$TabScrollListener;->mTabIndex:I

    .line 790
    iput-object p1, p0, Lco/vine/android/HomeTabActivity$TabScrollListener;->mActivity:Lco/vine/android/BaseControllerActionBarActivity;

    .line 791
    return-void
.end method


# virtual methods
.method public onScrollFirstItem()V
    .locals 0

    .prologue
    .line 795
    return-void
.end method
