.class public Lco/vine/android/ExploreFragment;
.super Lco/vine/android/BaseControllerFragment;
.source "ExploreFragment.java"

# interfaces
.implements Lco/vine/android/widget/OnTabChangedListener;
.implements Lcom/twitter/android/widget/TopScrollable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/ExploreFragment$VineVideoListWebViewClient;,
        Lco/vine/android/ExploreFragment$ExploreListener;
    }
.end annotation


# static fields
#the value of this static final field might be set in the static constructor
.field private static final LOGGABLE:Z = false

.field private static final PARAM_EDITION:Ljava/lang/String; = "ed"

.field private static final PARAM_MODEL:Ljava/lang/String; = "model"

.field private static final PARAM_OS:Ljava/lang/String; = "os"

.field private static final PARAM_VERSION:Ljava/lang/String; = "v"

.field private static final PREF_LAST_REFRESH_TIME:Ljava/lang/String; = "last_explore"

.field private static final REFRESH_INTERVAL:J = 0xdbba0L

.field private static final TAG:Ljava/lang/String; = "ExploreFragment"

.field private static final VALUE_OS:Ljava/lang/String; = "android"

.field private static final VALUE_UNDEFINED:Ljava/lang/String; = "undefined"


# instance fields
.field private mEmpty:Landroid/view/View;

.field private mEmptyText:Landroid/widget/TextView;

.field private mPrefs:Landroid/content/SharedPreferences;

.field private mProgressContainer:Landroid/widget/RelativeLayout;

.field private mSadface:Landroid/widget/ImageView;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 57
    const-string v0, "ExploreFragment"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lco/vine/android/ExploreFragment;->LOGGABLE:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Lco/vine/android/BaseControllerFragment;-><init>()V

    .line 194
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 42
    sget-boolean v0, Lco/vine/android/ExploreFragment;->LOGGABLE:Z

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/ExploreFragment;)Landroid/widget/RelativeLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lco/vine/android/ExploreFragment;->mProgressContainer:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/ExploreFragment;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lco/vine/android/ExploreFragment;->mEmpty:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/ExploreFragment;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lco/vine/android/ExploreFragment;->mSadface:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$400(Lco/vine/android/ExploreFragment;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 42
    iget-object v0, p0, Lco/vine/android/ExploreFragment;->mEmptyText:Landroid/widget/TextView;

    return-object v0
.end method

.method private getExploreUrl()Ljava/lang/String;
    .locals 10

    .prologue
    .line 141
    invoke-virtual {p0}, Lco/vine/android/ExploreFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v5}, Lco/vine/android/util/BuildUtil;->get(Landroid/content/Context;)Lco/vine/android/util/BuildUtil;

    move-result-object v5

    invoke-virtual {v5}, Lco/vine/android/util/BuildUtil;->getExploreUrl()Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, baseUrl:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/ExploreFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v5}, Lco/vine/android/util/Util;->getVersionName(Landroid/content/Context;)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 152
    .local v4, versionName:Ljava/lang/String;
    :goto_0
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%s_%s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    sget-object v9, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    sget-object v9, Landroid/os/Build;->MODEL:Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 154
    .local v2, model:Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v1, data:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    const-string v6, "model"

    const-string v7, "\\s+"

    const-string v8, "-"

    invoke-virtual {v2, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 157
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    const-string v6, "v"

    invoke-direct {v5, v6, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    const-string v6, "os"

    const-string v7, "android"

    invoke-direct {v5, v6, v7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    const-string v6, "ed"

    invoke-virtual {p0}, Lco/vine/android/ExploreFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-static {v7}, Lco/vine/android/provider/SettingsManager;->getEdition(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "?"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v1, v6}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 147
    .end local v1           #data:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v2           #model:Ljava/lang/String;
    .end local v4           #versionName:Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 148
    .local v3, nnfe:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "undefined"

    .restart local v4       #versionName:Ljava/lang/String;
    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "ofJoy"

    .prologue
    .line 69
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 70
    new-instance v0, Lco/vine/android/ExploreFragment$ExploreListener;

    invoke-direct {v0, p0}, Lco/vine/android/ExploreFragment$ExploreListener;-><init>(Lco/vine/android/ExploreFragment;)V

    iput-object v0, p0, Lco/vine/android/ExploreFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 71
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 91
    const v1, 0x7f03002d

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 92
    .local v0, v:Landroid/view/View;
    const v1, 0x7f0a008e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ExploreFragment;->mEmpty:Landroid/view/View;

    .line 93
    const v1, 0x7f0a0061

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/vine/android/ExploreFragment;->mEmptyText:Landroid/widget/TextView;

    .line 94
    const v1, 0x7f0a0144

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lco/vine/android/ExploreFragment;->mProgressContainer:Landroid/widget/RelativeLayout;

    .line 95
    const v1, 0x7f0a008f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lco/vine/android/ExploreFragment;->mSadface:Landroid/widget/ImageView;

    .line 96
    const v1, 0x7f0a008d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/webkit/WebView;

    iput-object v1, p0, Lco/vine/android/ExploreFragment;->mWebView:Landroid/webkit/WebView;

    .line 97
    invoke-virtual {p0}, Lco/vine/android/ExploreFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ExploreFragment;->mPrefs:Landroid/content/SharedPreferences;

    .line 98
    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 252
    iget-object v1, p0, Lco/vine/android/ExploreFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 253
    .local v0, parent:Landroid/view/ViewGroup;
    iget-object v1, p0, Lco/vine/android/ExploreFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 254
    iget-object v1, p0, Lco/vine/android/ExploreFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->destroy()V

    .line 255
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onDestroy()V

    .line 256
    return-void
.end method

.method public onMoveAway(I)V
    .locals 0
    .parameter "newPosition"

    .prologue
    .line 167
    return-void
.end method

.method public onMoveTo(I)V
    .locals 9
    .parameter "oldPosition"

    .prologue
    const-wide/16 v7, 0x0

    .line 171
    iget-object v5, p0, Lco/vine/android/ExploreFragment;->mPrefs:Landroid/content/SharedPreferences;

    const-string v6, "last_explore"

    invoke-interface {v5, v6, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    .line 172
    .local v1, lastTime:J
    iget-object v5, p0, Lco/vine/android/ExploreFragment;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 173
    .local v0, edit:Landroid/content/SharedPreferences$Editor;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 174
    .local v3, now:J
    if-eqz v0, :cond_0

    .line 175
    cmp-long v5, v1, v7

    if-lez v5, :cond_1

    const-wide/32 v5, 0xdbba0

    add-long/2addr v5, v1

    cmp-long v5, v5, v3

    if-gez v5, :cond_1

    .line 176
    invoke-virtual {p0}, Lco/vine/android/ExploreFragment;->reloadWebView()V

    .line 177
    const-string v5, "last_explore"

    invoke-interface {v0, v5, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 182
    :cond_0
    :goto_0
    return-void

    .line 178
    :cond_1
    cmp-long v5, v1, v7

    if-gtz v5, :cond_0

    .line 179
    const-string v5, "last_explore"

    invoke-interface {v0, v5, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 75
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onPause()V

    .line 76
    iget-object v0, p0, Lco/vine/android/ExploreFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ExploreFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->addListener(Lco/vine/android/client/AppSessionListener;)V

    .line 77
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    .line 103
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseControllerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 104
    invoke-virtual {p0}, Lco/vine/android/ExploreFragment;->reloadWebView()V

    .line 105
    return-void
.end method

.method public reloadWebView()V
    .locals 10

    .prologue
    const/4 v8, 0x1

    .line 108
    invoke-virtual {p0}, Lco/vine/android/ExploreFragment;->getView()Landroid/view/View;

    move-result-object v5

    .line 109
    .local v5, v:Landroid/view/View;
    if-eqz v5, :cond_3

    .line 110
    const v7, 0x7f0a008d

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/webkit/WebView;

    .line 111
    .local v6, webView:Landroid/webkit/WebView;
    if-eqz v6, :cond_3

    .line 112
    new-instance v7, Lco/vine/android/ExploreFragment$VineVideoListWebViewClient;

    invoke-direct {v7, p0}, Lco/vine/android/ExploreFragment$VineVideoListWebViewClient;-><init>(Lco/vine/android/ExploreFragment;)V

    invoke-virtual {v6, v7}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 113
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 114
    invoke-virtual {v6}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v4

    .line 116
    .local v4, s:Landroid/webkit/WebSettings;
    const/4 v7, 0x1

    :try_start_0
    invoke-virtual {v4, v7}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :goto_0
    const/4 v7, 0x2

    invoke-virtual {v4, v7}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 121
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v8}, Ljava/util/HashMap;-><init>(I)V

    .line 122
    .local v2, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lco/vine/android/util/Util;->getLocale()Ljava/lang/String;

    move-result-object v3

    .line 123
    .local v3, language:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 124
    const-string v7, "Accept-Language"

    invoke-interface {v2, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/ExploreFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-static {v7}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v0

    .line 127
    .local v0, api:Lco/vine/android/client/VineAPI;
    const-string v7, "X-Vine-Client"

    invoke-virtual {v0}, Lco/vine/android/client/VineAPI;->getVineClientHeader()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isProduction()Z

    move-result v7

    if-nez v7, :cond_1

    .line 129
    const-string v7, "X-Vine-Auth"

    invoke-virtual {v0}, Lco/vine/android/client/VineAPI;->getAuthHeaderSecret()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    :cond_1
    invoke-direct {p0}, Lco/vine/android/ExploreFragment;->getExploreUrl()Ljava/lang/String;

    move-result-object v1

    .line 132
    .local v1, exploreUrl:Ljava/lang/String;
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 133
    const-string v7, "ExploreFragment"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Accessing explore url: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    :cond_2
    invoke-virtual {v6, v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 138
    .end local v0           #api:Lco/vine/android/client/VineAPI;
    .end local v1           #exploreUrl:Ljava/lang/String;
    .end local v2           #headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3           #language:Ljava/lang/String;
    .end local v4           #s:Landroid/webkit/WebSettings;
    .end local v6           #webView:Landroid/webkit/WebView;
    :cond_3
    return-void

    .line 117
    .restart local v4       #s:Landroid/webkit/WebSettings;
    .restart local v6       #webView:Landroid/webkit/WebView;
    :catch_0
    move-exception v7

    goto :goto_0
.end method

.method public scrollTop()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 186
    iget-object v1, p0, Lco/vine/android/ExploreFragment;->mWebView:Landroid/webkit/WebView;

    if-eqz v1, :cond_0

    .line 187
    iget-object v1, p0, Lco/vine/android/ExploreFragment;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v0, v0}, Landroid/webkit/WebView;->scrollTo(II)V

    .line 188
    const/4 v0, 0x1

    .line 190
    :cond_0
    return v0
.end method
