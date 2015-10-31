.class Lco/vine/android/recorder/VineRecorder$22;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder;->onUiResumed(Landroid/app/Activity;Ljava/lang/Runnable;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter

    .prologue
    .line 2047
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$22;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "v"
    .parameter "event"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 2050
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 2052
    .local v0, action:I
    packed-switch v0, :pswitch_data_0

    .line 2064
    :goto_0
    return v2

    .line 2054
    :pswitch_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$22;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V
    invoke-static {v1, v3}, Lco/vine/android/recorder/VineRecorder;->access$6400(Lco/vine/android/recorder/VineRecorder;I)V

    goto :goto_0

    .line 2057
    :pswitch_1
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$22;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V
    invoke-static {v1, v3}, Lco/vine/android/recorder/VineRecorder;->access$6400(Lco/vine/android/recorder/VineRecorder;I)V

    goto :goto_0

    .line 2060
    :pswitch_2
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$22;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V
    invoke-static {v1, v2}, Lco/vine/android/recorder/VineRecorder;->access$6400(Lco/vine/android/recorder/VineRecorder;I)V

    goto :goto_0

    .line 2052
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
