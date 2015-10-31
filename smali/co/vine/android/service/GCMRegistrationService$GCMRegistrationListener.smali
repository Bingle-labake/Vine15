.class Lco/vine/android/service/GCMRegistrationService$GCMRegistrationListener;
.super Lco/vine/android/client/AppSessionListener;
.source "GCMRegistrationService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/service/GCMRegistrationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GCMRegistrationListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/service/GCMRegistrationService;


# direct methods
.method private constructor <init>(Lco/vine/android/service/GCMRegistrationService;)V
    .locals 0
    .parameter

    .prologue
    .line 276
    iput-object p1, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegistrationListener;->this$0:Lco/vine/android/service/GCMRegistrationService;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/service/GCMRegistrationService;Lco/vine/android/service/GCMRegistrationService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 276
    invoke-direct {p0, p1}, Lco/vine/android/service/GCMRegistrationService$GCMRegistrationListener;-><init>(Lco/vine/android/service/GCMRegistrationService;)V

    return-void
.end method


# virtual methods
.method public onGcmRegistrationComplete(Ljava/lang/String;ILjava/lang/String;J)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "userId"

    .prologue
    .line 279
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_0

    const-wide/16 v1, 0x0

    cmp-long v1, p4, v1

    if-lez v1, :cond_0

    .line 280
    const-string v1, "GCMRegService"

    const-string v2, "GCM registration completed successfully; saving regId and stopping service now."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    iget-object v1, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegistrationListener;->this$0:Lco/vine/android/service/GCMRegistrationService;

    invoke-static {v1}, Lco/vine/android/service/GCMRegistrationService;->getGCMPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 282
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v1, "registrationIdSent"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 283
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 285
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_0
    iget-object v1, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegistrationListener;->this$0:Lco/vine/android/service/GCMRegistrationService;

    #calls: Lco/vine/android/service/GCMRegistrationService;->stopService()V
    invoke-static {v1}, Lco/vine/android/service/GCMRegistrationService;->access$400(Lco/vine/android/service/GCMRegistrationService;)V

    .line 286
    return-void
.end method
