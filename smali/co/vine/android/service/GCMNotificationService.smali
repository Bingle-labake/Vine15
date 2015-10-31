.class public Lco/vine/android/service/GCMNotificationService;
.super Landroid/app/Service;
.source "GCMNotificationService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/service/GCMNotificationService$1;,
        Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;,
        Lco/vine/android/service/GCMNotificationService$Notification;
    }
.end annotation


# static fields
.field public static final ACTION_CLEAR_NOTIFICATIONS:Ljava/lang/String; = "clearNotifications"

.field public static final ACTION_SHOW_NOTIFICATION:Ljava/lang/String; = "showNotification"

.field public static final EXTRA_NOTIFICATIONS_JSON:Ljava/lang/String; = "notifications"

.field private static final NOTIFICATION_ID:I = 0x0

.field private static final NOTIFICATION_TAG:Ljava/lang/String; = "gcmGenericNotification"

.field private static final TAG:Ljava/lang/String; = "GCMNotifService"


# instance fields
.field private mAppController:Lco/vine/android/client/AppController;

.field private mAppSessionListener:Lco/vine/android/client/AppSessionListener;

.field private mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

.field private mIconRequested:Z

.field private mImageKey:Lco/vine/android/util/image/ImageKey;

.field private mStartIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 233
    return-void
.end method

.method static synthetic access$100(Lco/vine/android/service/GCMNotificationService;)Lco/vine/android/util/image/ImageKey;
    .locals 1
    .parameter "x0"

    .prologue
    .line 47
    iget-object v0, p0, Lco/vine/android/service/GCMNotificationService;->mImageKey:Lco/vine/android/util/image/ImageKey;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/service/GCMNotificationService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 47
    iget-boolean v0, p0, Lco/vine/android/service/GCMNotificationService;->mIconRequested:Z

    return v0
.end method

.method static synthetic access$202(Lco/vine/android/service/GCMNotificationService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 47
    iput-boolean p1, p0, Lco/vine/android/service/GCMNotificationService;->mIconRequested:Z

    return p1
.end method

.method static synthetic access$300(Lco/vine/android/service/GCMNotificationService;Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lco/vine/android/service/GCMNotificationService;->showNotification(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private clearNotification()V
    .locals 3

    .prologue
    .line 172
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lco/vine/android/service/GCMNotificationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 173
    .local v0, manager:Landroid/app/NotificationManager;
    const-string v1, "gcmGenericNotification"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V

    .line 174
    invoke-direct {p0}, Lco/vine/android/service/GCMNotificationService;->stopService()V

    .line 175
    return-void
.end method

.method public static getClearNotificationIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2
    .parameter "context"

    .prologue
    .line 214
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/service/GCMNotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 215
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "clearNotifications"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 216
    return-object v0
.end method

.method private getPendingIntent(I)Landroid/app/PendingIntent;
    .locals 3
    .parameter "notificationType"

    .prologue
    const/4 v2, 0x0

    .line 208
    new-instance v0, Landroid/content/Intent;

    const-string v1, "co.vine.android.NOTIFICATION_PRESSED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 209
    .local v0, intent:Landroid/content/Intent;
    const-class v1, Lco/vine/android/StartActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 210
    invoke-static {p0, v2, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method private prepareNotification(Ljava/lang/String;)V
    .locals 24
    .parameter "notifications"

    .prologue
    .line 92
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_0

    .line 95
    :try_start_0
    invoke-static/range {p1 .. p1}, Lco/vine/android/api/VineParsers;->createParser(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object v15

    .line 96
    .local v15, p:Lcom/fasterxml/jackson/core/JsonParser;
    invoke-static {v15}, Lco/vine/android/api/VineParsers;->parsePushNotification(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineNotification;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v21

    .line 102
    .local v21, vineNotification:Lco/vine/android/api/VineNotification;
    if-nez v21, :cond_1

    .line 103
    const-string v22, "GCM: Invalid GCM notification payload, notifications={}"

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 104
    const-string v22, "Invalid GCM notification payload."

    invoke-static/range {v22 .. v22}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 169
    .end local v15           #p:Lcom/fasterxml/jackson/core/JsonParser;
    .end local v21           #vineNotification:Lco/vine/android/api/VineNotification;
    :cond_0
    :goto_0
    return-void

    .line 97
    :catch_0
    move-exception v9

    .line 98
    .local v9, e:Ljava/io/IOException;
    const-string v22, "Exception while parsing GCM push notification payload."

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v9, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 108
    .end local v9           #e:Ljava/io/IOException;
    .restart local v15       #p:Lcom/fasterxml/jackson/core/JsonParser;
    .restart local v21       #vineNotification:Lco/vine/android/api/VineNotification;
    :cond_1
    move-object/from16 v0, v21

    iget-object v3, v0, Lco/vine/android/api/VineNotification;->avatarUrl:Ljava/lang/String;

    .line 109
    .local v3, avatarUrl:Ljava/lang/String;
    move-object/from16 v0, v21

    iget-object v5, v0, Lco/vine/android/api/VineNotification;->comment:Ljava/lang/String;

    .line 110
    .local v5, comment:Ljava/lang/String;
    move-object/from16 v0, v21

    iget v14, v0, Lco/vine/android/api/VineNotification;->notificationType:I

    .line 111
    .local v14, notificationType:I
    move-object/from16 v0, v21

    iget-object v10, v0, Lco/vine/android/api/VineNotification;->entities:Ljava/util/ArrayList;

    .line 113
    .local v10, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lco/vine/android/service/GCMNotificationService;->getPendingIntent(I)Landroid/app/PendingIntent;

    move-result-object v16

    .line 114
    .local v16, pendingIntent:Landroid/app/PendingIntent;
    new-instance v6, Landroid/text/SpannableStringBuilder;

    invoke-direct {v6, v5}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 115
    .local v6, content:Landroid/text/SpannableStringBuilder;
    const/16 v22, 0x0

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    invoke-static {v10, v6, v0, v1}, Lco/vine/android/util/Util;->adjustEntities(Ljava/util/ArrayList;Landroid/text/Editable;IZ)V

    .line 117
    invoke-static/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v7

    .line 118
    .local v7, dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    invoke-virtual {v6}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v7, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->mergeNotification(Lco/vine/android/api/VineNotification;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v20

    .line 119
    .local v20, uri:Landroid/net/Uri;
    if-eqz v20, :cond_0

    .line 122
    new-instance v22, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-virtual/range {v22 .. v23}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 125
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v22, v0

    const v23, 0x7f0e0100

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lco/vine/android/service/GCMNotificationService;->getString(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Landroid/support/v4/app/NotificationCompat$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 126
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v22, v0

    const v23, 0x7f0201a2

    invoke-virtual/range {v22 .. v23}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 130
    invoke-virtual {v7}, Lco/vine/android/provider/VineDatabaseHelper;->getUnclearedNotifications()Ljava/util/ArrayList;

    move-result-object v19

    .line 131
    .local v19, unclearedNotifications:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/service/GCMNotificationService$Notification;>;"
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v22

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_3

    .line 132
    new-instance v12, Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-direct {v12}, Landroid/support/v4/app/NotificationCompat$InboxStyle;-><init>()V

    .line 133
    .local v12, inboxStyle:Landroid/support/v4/app/NotificationCompat$InboxStyle;
    const v22, 0x7f0e00fe

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/service/GCMNotificationService;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 134
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/vine/android/service/GCMNotificationService$Notification;

    .line 135
    .local v13, notification:Lco/vine/android/service/GCMNotificationService$Notification;
    iget-object v0, v13, Lco/vine/android/service/GCMNotificationService$Notification;->message:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    goto :goto_1

    .line 137
    .end local v13           #notification:Lco/vine/android/service/GCMNotificationService$Notification;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 138
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v22, v0

    invoke-virtual {v7}, Lco/vine/android/provider/VineDatabaseHelper;->getUnclearedNotificationCount()I

    move-result v23

    invoke-virtual/range {v22 .. v23}, Landroid/support/v4/app/NotificationCompat$Builder;->setNumber(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 142
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v12           #inboxStyle:Landroid/support/v4/app/NotificationCompat$InboxStyle;
    :cond_3
    invoke-static/range {p0 .. p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v18

    .line 143
    .local v18, sp:Landroid/content/SharedPreferences;
    const/4 v8, 0x0

    .line 144
    .local v8, defaults:I
    const-string v22, "pref_notifications_sound"

    const/16 v23, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v22

    if-eqz v22, :cond_4

    .line 146
    const-string v22, "pref_notifications_ringtone"

    const-string v23, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 147
    .local v17, ringtonePath:Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_7

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v22, v0

    invoke-static/range {v17 .. v17}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 153
    .end local v17           #ringtonePath:Ljava/lang/String;
    :cond_4
    :goto_2
    const-string v22, "pref_notifications_vibrate"

    const/16 v23, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v22

    if-eqz v22, :cond_5

    .line 154
    or-int/lit8 v8, v8, 0x2

    .line 156
    :cond_5
    const-string v22, "pref_notifications_light"

    const/16 v23, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v22

    if-eqz v22, :cond_6

    .line 157
    or-int/lit8 v8, v8, 0x4

    .line 159
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 161
    new-instance v22, Lco/vine/android/util/image/ImageKey;

    move-object/from16 v0, v22

    invoke-direct {v0, v3}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/service/GCMNotificationService;->mImageKey:Lco/vine/android/util/image/ImageKey;

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/GCMNotificationService;->mImageKey:Lco/vine/android/util/image/ImageKey;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 163
    .local v4, bm:Landroid/graphics/Bitmap;
    if-eqz v4, :cond_8

    .line 164
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lco/vine/android/service/GCMNotificationService;->showNotification(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 150
    .end local v4           #bm:Landroid/graphics/Bitmap;
    .restart local v17       #ringtonePath:Ljava/lang/String;
    :cond_7
    or-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 166
    .end local v17           #ringtonePath:Ljava/lang/String;
    .restart local v4       #bm:Landroid/graphics/Bitmap;
    :cond_8
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/service/GCMNotificationService;->mIconRequested:Z

    goto/16 :goto_0
.end method

.method private showNotification(Landroid/graphics/Bitmap;)V
    .locals 5
    .parameter "bm"

    .prologue
    .line 178
    if-nez p1, :cond_0

    .line 179
    invoke-virtual {p0}, Lco/vine/android/service/GCMNotificationService;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020151

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 181
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/service/GCMNotificationService;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b003e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 182
    .local v0, l:I
    iget-object v3, p0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    const/4 v4, 0x1

    invoke-static {p1, v0, v0, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 184
    const-string v3, "notification"

    invoke-virtual {p0, v3}, Lco/vine/android/service/GCMNotificationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 186
    .local v1, manager:Landroid/app/NotificationManager;
    iget-object v3, p0, Lco/vine/android/service/GCMNotificationService;->mBuilder:Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-virtual {v3}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    .line 187
    .local v2, notification:Landroid/app/Notification;
    const v3, -0xff0100

    iput v3, v2, Landroid/app/Notification;->ledARGB:I

    .line 188
    const-string v3, "gcmGenericNotification"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v2}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 189
    invoke-direct {p0}, Lco/vine/android/service/GCMNotificationService;->stopService()V

    .line 190
    return-void
.end method

.method private stopService()V
    .locals 5

    .prologue
    .line 201
    iget-object v2, p0, Lco/vine/android/service/GCMNotificationService;->mStartIds:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 202
    .local v1, startId:I
    const-string v2, "GCMNotifService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Stopping service for startId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    invoke-virtual {p0, v1}, Lco/vine/android/service/GCMNotificationService;->stopSelf(I)V

    goto :goto_0

    .line 205
    .end local v1           #startId:I
    :cond_0
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 250
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 68
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 69
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/service/GCMNotificationService;->mAppController:Lco/vine/android/client/AppController;

    .line 70
    new-instance v0, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lco/vine/android/service/GCMNotificationService$GCMBroadcastReceiverListener;-><init>(Lco/vine/android/service/GCMNotificationService;Lco/vine/android/service/GCMNotificationService$1;)V

    iput-object v0, p0, Lco/vine/android/service/GCMNotificationService;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 71
    iget-object v0, p0, Lco/vine/android/service/GCMNotificationService;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/service/GCMNotificationService;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->addListener(Lco/vine/android/client/AppSessionListener;)V

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/service/GCMNotificationService;->mStartIds:Ljava/util/ArrayList;

    .line 73
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 194
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 195
    iget-object v0, p0, Lco/vine/android/service/GCMNotificationService;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    if-eqz v0, :cond_0

    .line 196
    iget-object v0, p0, Lco/vine/android/service/GCMNotificationService;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/service/GCMNotificationService;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->removeListener(Lco/vine/android/client/AppSessionListener;)V

    .line 198
    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 5
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    .line 77
    const-string v2, "GCMNotifService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onStartCommand, startId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", startIds="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/service/GCMNotificationService;->mStartIds:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v2, p0, Lco/vine/android/service/GCMNotificationService;->mStartIds:Ljava/util/ArrayList;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    if-eqz p1, :cond_0

    .line 80
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, action:Ljava/lang/String;
    const-string v2, "clearNotifications"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 82
    invoke-direct {p0}, Lco/vine/android/service/GCMNotificationService;->clearNotification()V

    .line 88
    .end local v0           #action:Ljava/lang/String;
    :cond_0
    :goto_0
    const/4 v2, 0x2

    return v2

    .line 84
    .restart local v0       #action:Ljava/lang/String;
    :cond_1
    const-string v2, "notifications"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 85
    .local v1, payload:Ljava/lang/String;
    invoke-direct {p0, v1}, Lco/vine/android/service/GCMNotificationService;->prepareNotification(Ljava/lang/String;)V

    goto :goto_0
.end method
