.class Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;
.super Landroid/os/AsyncTask;
.source "GCMRegistrationService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/service/GCMRegistrationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GCMRegisterTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mUserId:J

.field final synthetic this$0:Lco/vine/android/service/GCMRegistrationService;


# direct methods
.method public constructor <init>(Lco/vine/android/service/GCMRegistrationService;J)V
    .locals 0
    .parameter
    .parameter "userId"

    .prologue
    .line 200
    iput-object p1, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->this$0:Lco/vine/android/service/GCMRegistrationService;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 201
    iput-wide p2, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->mUserId:J

    .line 202
    return-void
.end method

.method private getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->this$0:Lco/vine/android/service/GCMRegistrationService;

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 196
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 6
    .parameter "params"

    .prologue
    .line 206
    iget-object v3, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->this$0:Lco/vine/android/service/GCMRegistrationService;

    #getter for: Lco/vine/android/service/GCMRegistrationService;->mGcm:Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    invoke-static {v3}, Lco/vine/android/service/GCMRegistrationService;->access$100(Lco/vine/android/service/GCMRegistrationService;)Lcom/google/android/gms/gcm/GoogleCloudMessaging;

    move-result-object v3

    if-nez v3, :cond_0

    .line 207
    iget-object v3, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->this$0:Lco/vine/android/service/GCMRegistrationService;

    invoke-direct {p0}, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/gcm/GoogleCloudMessaging;

    move-result-object v4

    #setter for: Lco/vine/android/service/GCMRegistrationService;->mGcm:Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    invoke-static {v3, v4}, Lco/vine/android/service/GCMRegistrationService;->access$102(Lco/vine/android/service/GCMRegistrationService;Lcom/google/android/gms/gcm/GoogleCloudMessaging;)Lcom/google/android/gms/gcm/GoogleCloudMessaging;

    .line 210
    :cond_0
    invoke-direct {p0}, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/util/BuildUtil;->get(Landroid/content/Context;)Lco/vine/android/util/BuildUtil;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/util/BuildUtil;->getSenderId()Ljava/lang/String;

    move-result-object v2

    .line 212
    .local v2, senderId:Ljava/lang/String;
    :try_start_0
    const-string v3, "GCMRegService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Registering with senderId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    iget-object v3, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->this$0:Lco/vine/android/service/GCMRegistrationService;

    #getter for: Lco/vine/android/service/GCMRegistrationService;->mGcm:Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    invoke-static {v3}, Lco/vine/android/service/GCMRegistrationService;->access$100(Lco/vine/android/service/GCMRegistrationService;)Lcom/google/android/gms/gcm/GoogleCloudMessaging;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    invoke-virtual {v3, v4}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->register([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 215
    .local v1, regId:Ljava/lang/String;
    const-string v3, "GCM: Registration complete with regId={}"

    invoke-static {v3, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 216
    iget-object v3, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->this$0:Lco/vine/android/service/GCMRegistrationService;

    #calls: Lco/vine/android/service/GCMRegistrationService;->setRegistrationId(Ljava/lang/String;)V
    invoke-static {v3, v1}, Lco/vine/android/service/GCMRegistrationService;->access$200(Lco/vine/android/service/GCMRegistrationService;Ljava/lang/String;)V

    .line 217
    iget-object v3, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->this$0:Lco/vine/android/service/GCMRegistrationService;

    #getter for: Lco/vine/android/service/GCMRegistrationService;->mAppController:Lco/vine/android/client/AppController;
    invoke-static {v3}, Lco/vine/android/service/GCMRegistrationService;->access$300(Lco/vine/android/service/GCMRegistrationService;)Lco/vine/android/client/AppController;

    move-result-object v3

    iget-wide v4, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->mUserId:J

    invoke-virtual {v3, v1, v4, v5}, Lco/vine/android/client/AppController;->sendGcmRegId(Ljava/lang/String;J)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    .line 223
    .end local v1           #regId:Ljava/lang/String;
    :goto_0
    const/4 v3, 0x0

    return-object v3

    .line 218
    :catch_0
    move-exception v0

    .line 219
    .local v0, e:Ljava/io/IOException;
    const-string v3, "GCMRegService"

    const-string v4, "Failed to register with GCM service."

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 220
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 196
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1
    .parameter "aVoid"

    .prologue
    .line 228
    iget-object v0, p0, Lco/vine/android/service/GCMRegistrationService$GCMRegisterTask;->this$0:Lco/vine/android/service/GCMRegistrationService;

    #calls: Lco/vine/android/service/GCMRegistrationService;->stopService()V
    invoke-static {v0}, Lco/vine/android/service/GCMRegistrationService;->access$400(Lco/vine/android/service/GCMRegistrationService;)V

    .line 229
    return-void
.end method
