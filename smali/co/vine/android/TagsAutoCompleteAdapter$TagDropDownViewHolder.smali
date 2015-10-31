.class Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;
.super Ljava/lang/Object;
.source "TagsAutoCompleteAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/TagsAutoCompleteAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TagDropDownViewHolder"
.end annotation


# instance fields
.field public final tagName:Landroid/widget/TextView;

.field final synthetic this$0:Lco/vine/android/TagsAutoCompleteAdapter;

.field public userId:J


# direct methods
.method public constructor <init>(Lco/vine/android/TagsAutoCompleteAdapter;Landroid/view/View;)V
    .locals 1
    .parameter
    .parameter "rowView"

    .prologue
    .line 80
    iput-object p1, p0, Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;->this$0:Lco/vine/android/TagsAutoCompleteAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    const v0, 0x7f0a017d

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/TagsAutoCompleteAdapter$TagDropDownViewHolder;->tagName:Landroid/widget/TextView;

    .line 82
    return-void
.end method
