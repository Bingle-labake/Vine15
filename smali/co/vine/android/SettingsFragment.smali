.class public Lco/vine/android/SettingsFragment;
.super Lco/vine/android/BaseControllerFragment;
.source "SettingsFragment.java"

# interfaces
.implements Lco/vine/android/SetThumbnailTask$SetThumbnailListener;
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;
.implements Landroid/view/View$OnClickListener;
.implements Lco/vine/android/ImagePicker$Listener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;,
        Lco/vine/android/SettingsFragment$SettingsListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lco/vine/android/BaseControllerFragment;",
        "Lco/vine/android/SetThumbnailTask$SetThumbnailListener;",
        "Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;",
        "Landroid/view/View$OnClickListener;",
        "Lco/vine/android/ImagePicker$Listener;",
        "Landroid/widget/CompoundButton$OnCheckedChangeListener;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEBUG_TAP_THRESHOLD:I = 0x6

.field private static final DIALOG_CLEAR_CACHE:I = 0x6

.field private static final DIALOG_DEACTIVATE_ACCOUNT:I = 0x7

.field private static final DIALOG_DISCONNECT_TWITTER:I = 0x5

.field private static final DIALOG_LOGOUT:I = 0x4

.field private static final DIALOG_REMOVE_TAKE_OR_CHOOSE_PHOTO:I = 0x2

.field private static final DIALOG_TAKE_OR_CHOOSE_PHOTO:I = 0x1

.field private static final DIALOG_UNSAVED_CHANGES:I = 0x3

.field private static final LOADER_ID_DEFAULT:I = 0x0

.field private static final REQUEST_CODE_CHOOSE_PHOTO:I = 0x5

.field private static final REQUEST_CODE_CROP:I = 0x4

.field private static final REQUEST_CODE_TAKE_PHOTO:I = 0x3

.field private static final REQUEST_GMS_RESOLUTION:I = 0x6

.field public static final RESULT_CACHE_CLEARED:I = 0x1

.field private static final STATE_AVATAR_URI:Ljava/lang/String; = "state_avatar_url"

.field private static final STATE_DESCRIPTION:Ljava/lang/String; = "state_desc"

.field private static final STATE_EDITION:Ljava/lang/String; = "state_edition"

.field private static final STATE_EDITIONS_FETCHED:Ljava/lang/String; = "state_editions_fetched"

.field private static final STATE_EMAIL:Ljava/lang/String; = "state_email"

.field private static final STATE_LOCATION:Ljava/lang/String; = "state_loc"

.field private static final STATE_NAME:Ljava/lang/String; = "state_name"

.field private static final STATE_PHONE:Ljava/lang/String; = "state_phone"

.field private static final TAG:Ljava/lang/String; = "SettingsFragment"


# instance fields
.field private mAlertIcon:Landroid/widget/ImageView;

.field private mAppController:Lco/vine/android/client/AppController;

.field private mAvatarBorderImageView:Landroid/widget/ImageView;

.field private mAvatarImageView:Landroid/widget/ImageView;

.field private mAvatarKey:Lco/vine/android/util/image/ImageKey;

.field private mAvatarUri:Landroid/net/Uri;

.field private mClearCacheValue:Landroid/widget/TextView;

.field private mDescription:Ljava/lang/String;

.field private mEdition:Ljava/lang/String;

.field private mEditionsFetched:Z

.field private mEditionsSpinner:Landroid/widget/Spinner;

.field private mEditor:Landroid/content/SharedPreferences$Editor;

.field private mEmail:Ljava/lang/String;

.field private mImagePicker:Lco/vine/android/ImagePicker;

.field private mLocation:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field private mNotifications:Landroid/widget/FrameLayout;

.field private mOriginalAvatarUrl:Ljava/lang/String;

.field private mOriginalDescription:Ljava/lang/String;

.field private mOriginalEdition:Ljava/lang/String;

.field private mOriginalEmail:Ljava/lang/String;

.field private mOriginalLocation:Ljava/lang/String;

.field private mOriginalName:Ljava/lang/String;

.field private mOriginalPhone:Ljava/lang/String;

.field private mPhone:Ljava/lang/String;

.field private mPhotoChanged:Z

.field private mPrefs:Landroid/content/SharedPreferences;

.field private mProgress:Landroid/app/ProgressDialog;

.field private mSpinnerAdapter:Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;

.field private mThumbnail:Landroid/graphics/Bitmap;

.field private mTwitterConnected:Z

.field private mTwitterLogin:Z

.field private mVersionTapCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 75
    invoke-direct {p0}, Lco/vine/android/BaseControllerFragment;-><init>()V

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/SettingsFragment;->mEditionsFetched:Z

    .line 1271
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/SettingsFragment;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Lco/vine/android/SettingsFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 75
    iput-object p1, p0, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lco/vine/android/SettingsFragment;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lco/vine/android/SettingsFragment;)Landroid/content/SharedPreferences$Editor;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mEditor:Landroid/content/SharedPreferences$Editor;

    return-object v0
.end method

.method static synthetic access$102(Lco/vine/android/SettingsFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 75
    iput-object p1, p0, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lco/vine/android/SettingsFragment;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mClearCacheValue:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1200(Lco/vine/android/SettingsFragment;)Lco/vine/android/client/AppController;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    return-object v0
.end method

.method static synthetic access$1302(Lco/vine/android/SettingsFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 75
    iput-boolean p1, p0, Lco/vine/android/SettingsFragment;->mTwitterLogin:Z

    return p1
.end method

.method static synthetic access$1400(Lco/vine/android/SettingsFragment;)Landroid/content/SharedPreferences;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mPrefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$1502(Lco/vine/android/SettingsFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 75
    iput-boolean p1, p0, Lco/vine/android/SettingsFragment;->mEditionsFetched:Z

    return p1
.end method

.method static synthetic access$1600(Lco/vine/android/SettingsFragment;)Landroid/widget/Spinner;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mEditionsSpinner:Landroid/widget/Spinner;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/SettingsFragment;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lco/vine/android/SettingsFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 75
    iput-object p1, p0, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lco/vine/android/SettingsFragment;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Lco/vine/android/SettingsFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 75
    iput-object p1, p0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lco/vine/android/SettingsFragment;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mPhone:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Lco/vine/android/SettingsFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 75
    iput-object p1, p0, Lco/vine/android/SettingsFragment;->mPhone:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lco/vine/android/SettingsFragment;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Lco/vine/android/SettingsFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 75
    iput-object p1, p0, Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lco/vine/android/SettingsFragment;)Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mSpinnerAdapter:Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;

    return-object v0
.end method

.method static synthetic access$700(Lco/vine/android/SettingsFragment;)Lco/vine/android/util/image/ImageKey;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mAvatarKey:Lco/vine/android/util/image/ImageKey;

    return-object v0
.end method

.method static synthetic access$800(Lco/vine/android/SettingsFragment;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$900(Lco/vine/android/SettingsFragment;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method private isDirty()Z
    .locals 2

    .prologue
    .line 163
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalName:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalEmail:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalDescription:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalLocation:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalPhone:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mPhone:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalEdition:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/SettingsFragment;->mPhotoChanged:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private resetPrefs()V
    .locals 3

    .prologue
    .line 151
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mEditor:Landroid/content/SharedPreferences$Editor;

    .line 152
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v1, "settings_profile_name"

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mOriginalName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 153
    const-string v1, "settings_profile_description"

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mOriginalDescription:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 154
    const-string v1, "settings_profile_location"

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mOriginalLocation:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 155
    const-string v1, "settings_profile_email"

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mOriginalEmail:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 156
    const-string v1, "settings_profile_phone"

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mOriginalPhone:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 157
    const-string v1, "settings_profile_avatar_url"

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mOriginalAvatarUrl:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 158
    const-string v1, "settings_edition"

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mOriginalEdition:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 159
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 160
    return-void
.end method

.method private setOriginalPreferenceValues()V
    .locals 3

    .prologue
    .line 195
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mPrefs:Landroid/content/SharedPreferences;

    .line 196
    .local v0, prefs:Landroid/content/SharedPreferences;
    const-string v1, "settings_profile_name"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalName:Ljava/lang/String;

    .line 197
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalName:Ljava/lang/String;

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    .line 198
    const-string v1, "settings_profile_description"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalDescription:Ljava/lang/String;

    .line 199
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalDescription:Ljava/lang/String;

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    .line 200
    const-string v1, "settings_profile_location"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalLocation:Ljava/lang/String;

    .line 201
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalLocation:Ljava/lang/String;

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    .line 202
    const-string v1, "settings_profile_email"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalEmail:Ljava/lang/String;

    .line 203
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalEmail:Ljava/lang/String;

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    .line 204
    const-string v1, "settings_profile_phone"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalPhone:Ljava/lang/String;

    .line 205
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalPhone:Ljava/lang/String;

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mPhone:Ljava/lang/String;

    .line 206
    const-string v1, "settings_edition"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalEdition:Ljava/lang/String;

    .line 207
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalEdition:Ljava/lang/String;

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;

    .line 208
    const-string v1, "settings_twitter_connected"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/SettingsFragment;->mTwitterConnected:Z

    .line 211
    const-string v1, "settings_profile_avatar_url"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    .line 212
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mOriginalAvatarUrl:Ljava/lang/String;

    .line 213
    return-void
.end method

.method private updateProfile(Landroid/net/Uri;)V
    .locals 8
    .parameter "avatarUri"

    .prologue
    .line 1257
    invoke-direct {p0}, Lco/vine/android/SettingsFragment;->validate()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1258
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalName:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackChangedName()V

    .line 1259
    :cond_0
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalDescription:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackChangedDescription()V

    .line 1260
    :cond_1
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalLocation:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackChangedLocation()V

    .line 1261
    :cond_2
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalEmail:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackChangedEmail()V

    .line 1262
    :cond_3
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mOriginalEdition:Ljava/lang/String;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackChangedEdition()V

    .line 1264
    :cond_4
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    iget-object v3, p0, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    iget-object v4, p0, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    iget-object v5, p0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    iget-object v6, p0, Lco/vine/android/SettingsFragment;->mPhone:Ljava/lang/String;

    iget-boolean v7, p0, Lco/vine/android/SettingsFragment;->mPhotoChanged:Z

    if-eqz v7, :cond_6

    move-object v7, p1

    :goto_0
    invoke-virtual/range {v0 .. v7}, Lco/vine/android/client/AppController;->updateProfile(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    .line 1267
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lco/vine/android/client/AppController;->updateEdition(Lco/vine/android/client/Session;Ljava/lang/String;)Ljava/lang/String;

    .line 1269
    :cond_5
    return-void

    .line 1264
    :cond_6
    const/4 v7, 0x0

    goto :goto_0
.end method

.method private validate()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 1220
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 1221
    .local v0, activity:Landroid/support/v4/app/FragmentActivity;
    iget-object v3, p0, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1222
    if-eqz v0, :cond_0

    .line 1223
    const v3, 0x7f0e00f5

    invoke-static {v0, v3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 1248
    :cond_0
    :goto_0
    return v2

    .line 1227
    :cond_1
    iget-object v3, p0, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x20

    if-le v3, v4, :cond_2

    .line 1228
    if-eqz v0, :cond_0

    .line 1229
    const v3, 0x7f0e0014

    invoke-static {v0, v3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0

    .line 1234
    :cond_2
    iget-object v3, p0, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x8c

    if-le v3, v4, :cond_3

    .line 1235
    if-eqz v0, :cond_0

    .line 1236
    const v3, 0x7f0e0009

    invoke-static {v0, v3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0

    .line 1241
    :cond_3
    if-eqz v0, :cond_4

    .line 1242
    new-instance v1, Landroid/app/ProgressDialog;

    const v2, 0x7f0f0028

    invoke-direct {v1, v0, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 1244
    .local v1, progressDialog:Landroid/app/ProgressDialog;
    const v2, 0x7f0e018c

    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1245
    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 1246
    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 1248
    .end local v1           #progressDialog:Landroid/app/ProgressDialog;
    :cond_4
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 15
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "extras"

    .prologue
    .line 794
    invoke-super/range {p0 .. p3}, Lco/vine/android/BaseControllerFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 795
    packed-switch p1, :pswitch_data_0

    .line 885
    invoke-super/range {p0 .. p3}, Lco/vine/android/BaseControllerFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 888
    :cond_0
    :goto_0
    return-void

    .line 798
    :pswitch_0
    const/4 v1, -0x1

    move/from16 v0, p2

    if-ne v0, v1, :cond_2

    .line 800
    const/4 v1, 0x3

    move/from16 v0, p1

    if-ne v0, v1, :cond_1

    .line 801
    iget-object v12, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    .line 805
    .local v12, uri:Landroid/net/Uri;
    :goto_1
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v13, Lco/vine/android/EditProfileCropActivity;

    invoke-direct {v1, v2, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "uri"

    invoke-virtual {v1, v2, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v11

    .line 807
    .local v11, intent:Landroid/content/Intent;
    const/4 v1, 0x4

    invoke-virtual {p0, v11, v1}, Lco/vine/android/SettingsFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 803
    .end local v11           #intent:Landroid/content/Intent;
    .end local v12           #uri:Landroid/net/Uri;
    :cond_1
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v12

    .restart local v12       #uri:Landroid/net/Uri;
    goto :goto_1

    .line 809
    .end local v12           #uri:Landroid/net/Uri;
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    goto :goto_0

    .line 814
    :pswitch_1
    const/4 v1, -0x1

    move/from16 v0, p2

    if-ne v0, v1, :cond_4

    if-eqz p3, :cond_4

    .line 815
    const-string v1, "uri"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;

    .line 816
    .local v8, croppedUri:Landroid/net/Uri;
    if-eqz v8, :cond_3

    .line 817
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    invoke-static {v1}, Lco/vine/android/util/image/ImageUtils;->deleteTempPic(Landroid/net/Uri;)Z

    .line 818
    iput-object v8, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    .line 819
    new-instance v1, Lco/vine/android/SetThumbnailTask;

    invoke-direct {v1, p0}, Lco/vine/android/SetThumbnailTask;-><init>(Landroid/support/v4/app/Fragment;)V

    const/4 v2, 0x1

    new-array v2, v2, [Landroid/net/Uri;

    const/4 v13, 0x0

    aput-object v8, v2, v13

    invoke-virtual {v1, v2}, Lco/vine/android/SetThumbnailTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 821
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/SettingsFragment;->mPhotoChanged:Z

    goto :goto_0

    .line 823
    .end local v8           #croppedUri:Landroid/net/Uri;
    :cond_4
    const/4 v1, 0x0

    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    goto :goto_0

    .line 828
    :pswitch_2
    const/4 v1, -0x1

    move/from16 v0, p2

    if-ne v0, v1, :cond_5

    .line 829
    const-string v1, "screen_name"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 830
    .local v3, username:Ljava/lang/String;
    const-string v1, "tk"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 831
    .local v4, token:Ljava/lang/String;
    const-string v1, "ts"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 832
    .local v5, secret:Ljava/lang/String;
    const-string v1, "user_id"

    const-wide/16 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v1, v13, v14}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v6

    .line 833
    .local v6, userId:J
    new-instance v9, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0f0028

    invoke-direct {v9, v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 835
    .local v9, d:Landroid/app/ProgressDialog;
    const v1, 0x7f0e01a1

    invoke-virtual {p0, v1}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 836
    const/4 v1, 0x0

    invoke-virtual {v9, v1}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 837
    invoke-virtual {v9}, Landroid/app/ProgressDialog;->show()V

    .line 838
    iput-object v9, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 839
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v2

    invoke-virtual/range {v1 .. v7}, Lco/vine/android/client/AppController;->connectTwitter(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    goto/16 :goto_0

    .line 842
    .end local v3           #username:Ljava/lang/String;
    .end local v4           #token:Ljava/lang/String;
    .end local v5           #secret:Ljava/lang/String;
    .end local v6           #userId:J
    .end local v9           #d:Landroid/app/ProgressDialog;
    :cond_5
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e00a6

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 847
    :pswitch_3
    const/4 v1, -0x1

    move/from16 v0, p2

    if-ne v0, v1, :cond_6

    .line 848
    const-string v1, "screen_name"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 850
    .restart local v3       #username:Ljava/lang/String;
    const-string v1, "token"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 851
    .restart local v4       #token:Ljava/lang/String;
    const-string v1, "secret"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 852
    .restart local v5       #secret:Ljava/lang/String;
    const-string v1, "user_id"

    const-wide/16 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v1, v13, v14}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v6

    .line 853
    .restart local v6       #userId:J
    new-instance v9, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0f0028

    invoke-direct {v9, v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 855
    .restart local v9       #d:Landroid/app/ProgressDialog;
    const v1, 0x7f0e01a1

    invoke-virtual {p0, v1}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 856
    const/4 v1, 0x0

    invoke-virtual {v9, v1}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 857
    invoke-virtual {v9}, Landroid/app/ProgressDialog;->show()V

    .line 858
    iput-object v9, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 859
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v2

    invoke-virtual/range {v1 .. v7}, Lco/vine/android/client/AppController;->connectTwitter(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    goto/16 :goto_0

    .line 861
    .end local v3           #username:Ljava/lang/String;
    .end local v4           #token:Ljava/lang/String;
    .end local v5           #secret:Ljava/lang/String;
    .end local v6           #userId:J
    .end local v9           #d:Landroid/app/ProgressDialog;
    :cond_6
    if-eqz p2, :cond_0

    .line 863
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e00a8

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 868
    :pswitch_4
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v10

    .line 869
    .local v10, errorCode:I
    if-nez v10, :cond_9

    .line 870
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mNotifications:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_7

    .line 871
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mNotifications:Landroid/widget/FrameLayout;

    invoke-virtual {v1, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 873
    :cond_7
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mAlertIcon:Landroid/widget/ImageView;

    if-eqz v1, :cond_8

    .line 874
    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mAlertIcon:Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 877
    :cond_8
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v13, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v13}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v13

    invoke-static {v2, v13, v14}, Lco/vine/android/service/GCMRegistrationService;->getRegisterIntent(Landroid/content/Context;J)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto/16 :goto_0

    .line 880
    :cond_9
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e01c2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 795
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public onBackPressed()V
    .locals 3

    .prologue
    .line 541
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 542
    .local v0, activity:Landroid/support/v4/app/FragmentActivity;
    invoke-direct {p0}, Lco/vine/android/SettingsFragment;->isDirty()Z

    move-result v2

    if-eqz v2, :cond_1

    if-eqz v0, :cond_1

    .line 543
    const/4 v2, 0x3

    invoke-static {v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v1

    .line 545
    .local v1, p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v2, 0x7f0e018a

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 546
    const v2, 0x7f0e0168

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNeutralButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 547
    const v2, 0x7f0e016f

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 548
    const/4 v2, 0x0

    invoke-virtual {v1, p0, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 549
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    .line 558
    .end local v1           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_0
    :goto_0
    return-void

    .line 551
    :cond_1
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    if-eqz v2, :cond_2

    .line 552
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->dismiss()V

    .line 554
    :cond_2
    if-eqz v0, :cond_0

    .line 555
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 535
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 13
    .parameter "view"

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x5

    const v8, 0x7f0e0052

    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 1055
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    .line 1217
    :cond_0
    :goto_0
    return-void

    .line 1057
    :sswitch_0
    iget-object v7, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lco/vine/android/util/Util;->isDefaultAvatarUrl(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 1058
    invoke-static {v10}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v5

    .line 1060
    .local v5, p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    invoke-virtual {v5, p0, v12}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 1061
    const v7, 0x7f0e01a2

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v7

    const v8, 0x7f0e013a

    invoke-virtual {v7, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v7

    const v8, 0x7f0e01bb

    invoke-virtual {v7, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNeutralButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v7

    const v8, 0x7f0e0055

    invoke-virtual {v7, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v7

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0

    .line 1067
    .end local v5           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_1
    invoke-static {v11}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v5

    .line 1069
    .restart local v5       #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    invoke-virtual {v5, p0, v12}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 1070
    const v7, 0x7f0e01a2

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v7

    const v8, 0x7f0e01bb

    invoke-virtual {v7, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v7

    const v8, 0x7f0e0055

    invoke-virtual {v7, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNeutralButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v7

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v8

    invoke-virtual {v7, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0

    .line 1078
    .end local v5           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :sswitch_1
    iget-boolean v7, p0, Lco/vine/android/SettingsFragment;->mTwitterLogin:Z

    if-eqz v7, :cond_2

    .line 1079
    invoke-static {v9}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v5

    .line 1081
    .restart local v5       #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v7, 0x7f0e0171

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1082
    const v7, 0x7f0e0170

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1083
    invoke-virtual {v5, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1084
    invoke-virtual {v5, p0, v12}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 1085
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v7

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto/16 :goto_0

    .line 1087
    .end local v5           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_2
    iget-object v7, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v7}, Lco/vine/android/client/AppController;->getTwitter()Lcom/twitter/android/sdk/Twitter;

    move-result-object v6

    .line 1088
    .local v6, twitter:Lcom/twitter/android/sdk/Twitter;
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 1089
    .local v0, activity:Landroid/app/Activity;
    invoke-static {v6, v0}, Lco/vine/android/client/AppController;->startTwitterAuthWithFinish(Lcom/twitter/android/sdk/Twitter;Landroid/app/Activity;)V

    goto/16 :goto_0

    .line 1094
    .end local v0           #activity:Landroid/app/Activity;
    .end local v6           #twitter:Lcom/twitter/android/sdk/Twitter;
    :sswitch_2
    const/4 v7, 0x4

    invoke-static {v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v5

    .line 1096
    .restart local v5       #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v7, 0x7f0e00ef

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1097
    const v7, 0x7f0e00ee

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1098
    invoke-virtual {v5, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1099
    invoke-virtual {v5, p0, v12}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 1101
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v7

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1102
    :catch_0
    move-exception v1

    .line 1103
    .local v1, e:Ljava/lang/Exception;
    invoke-static {v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1108
    .end local v1           #e:Ljava/lang/Exception;
    .end local v5           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :sswitch_3
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    const-class v8, Lco/vine/android/ResetPasswordActivity;

    invoke-direct {v2, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1109
    .local v2, i:Landroid/content/Intent;
    iget-object v7, p0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 1110
    const-string v7, "email"

    iget-object v8, p0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1112
    :cond_3
    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1116
    .end local v2           #i:Landroid/content/Intent;
    :sswitch_4
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackContentControls()V

    .line 1117
    new-instance v7, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    const-class v9, Lco/vine/android/ContentControlsActivity;

    invoke-direct {v7, v8, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v7}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1121
    :sswitch_5
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackNotificationSettings()V

    .line 1122
    new-instance v7, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    const-class v9, Lco/vine/android/NotificationSettingsActivity;

    invoke-direct {v7, v8, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v7}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1126
    :sswitch_6
    const-string v7, "Settings"

    invoke-static {v7}, Lco/vine/android/util/FlurryUtils;->trackVisitFindFriends(Ljava/lang/String;)V

    .line 1127
    new-instance v7, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    const-class v9, Lco/vine/android/FindFriendsActivity;

    invoke-direct {v7, v8, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v7}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1131
    :sswitch_7
    const-string v7, "email"

    const-string v8, "Settings"

    invoke-static {v7, v8}, Lco/vine/android/util/FlurryUtils;->trackInvite(Ljava/lang/String;Ljava/lang/String;)V

    .line 1132
    new-instance v3, Landroid/content/Intent;

    const-string v7, "android.intent.action.SENDTO"

    const-string v8, "mailto"

    const-string v9, ""

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v3, v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1134
    .local v3, intent:Landroid/content/Intent;
    const-string v7, "android.intent.extra.SUBJECT"

    const v8, 0x7f0e00b7

    invoke-virtual {p0, v8}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1136
    const-string v7, "android.intent.extra.TEXT"

    invoke-static {}, Lco/vine/android/util/Util;->getEmailMessageId()I

    move-result v8

    new-array v9, v11, [Ljava/lang/Object;

    iget-object v10, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v10}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-virtual {p0, v8, v9}, Lco/vine/android/SettingsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1138
    const v7, 0x7f0e00b4

    invoke-virtual {p0, v7}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {p0, v7}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1143
    .end local v3           #intent:Landroid/content/Intent;
    :sswitch_8
    const-string v7, "sms"

    const-string v8, "Settings"

    invoke-static {v7, v8}, Lco/vine/android/util/FlurryUtils;->trackInvite(Ljava/lang/String;Ljava/lang/String;)V

    .line 1144
    new-instance v3, Landroid/content/Intent;

    const-string v7, "android.intent.action.VIEW"

    invoke-direct {v3, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1145
    .restart local v3       #intent:Landroid/content/Intent;
    const-string v7, "vnd.android-dir/mms-sms"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1146
    const-string v7, "sms_body"

    invoke-static {}, Lco/vine/android/util/Util;->getSmsMessageId()I

    move-result v8

    new-array v9, v11, [Ljava/lang/Object;

    iget-object v10, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v10}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-virtual {p0, v8, v9}, Lco/vine/android/SettingsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1148
    const v7, 0x7f0e0150

    invoke-virtual {p0, v7}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {p0, v7}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1153
    .end local v3           #intent:Landroid/content/Intent;
    :sswitch_9
    const/4 v7, 0x6

    invoke-static {v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v5

    .line 1155
    .restart local v5       #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v7, 0x7f0e0162

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1156
    invoke-virtual {v5, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1157
    const v7, 0x7f0e0161

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1158
    invoke-virtual {v5, p0, v12}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 1159
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v7

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto/16 :goto_0

    .line 1163
    .end local v5           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :sswitch_a
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackPrivacyPolicy()V

    .line 1164
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    const-class v8, Lco/vine/android/WebViewActivity;

    invoke-direct {v2, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1165
    .restart local v2       #i:Landroid/content/Intent;
    const-string v7, "type"

    invoke-virtual {v2, v7, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1167
    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1171
    .end local v2           #i:Landroid/content/Intent;
    :sswitch_b
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackTos()V

    .line 1172
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    const-class v8, Lco/vine/android/WebViewActivity;

    invoke-direct {v2, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1173
    .restart local v2       #i:Landroid/content/Intent;
    const-string v7, "type"

    invoke-virtual {v2, v7, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1174
    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1178
    .end local v2           #i:Landroid/content/Intent;
    :sswitch_c
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackAttribution()V

    .line 1179
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    const-class v8, Lco/vine/android/WebViewActivity;

    invoke-direct {v2, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1180
    .restart local v2       #i:Landroid/content/Intent;
    const-string v7, "type"

    invoke-virtual {v2, v7, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1181
    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1185
    .end local v2           #i:Landroid/content/Intent;
    :sswitch_d
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackDeactivateAccount()V

    .line 1186
    const/4 v7, 0x7

    invoke-static {v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v5

    .line 1188
    .restart local v5       #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v7, 0x7f0e016b

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1189
    const v7, 0x7f0e016c

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1190
    invoke-virtual {v5, v8}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1191
    const v7, 0x7f0e016a

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 1192
    invoke-virtual {v5, p0, v12}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 1193
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v7

    invoke-virtual {v5, v7}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto/16 :goto_0

    .line 1197
    .end local v5           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :sswitch_e
    iget v7, p0, Lco/vine/android/SettingsFragment;->mVersionTapCount:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lco/vine/android/SettingsFragment;->mVersionTapCount:I

    .line 1198
    iget v7, p0, Lco/vine/android/SettingsFragment;->mVersionTapCount:I

    const/4 v8, 0x6

    if-lt v7, v8, :cond_4

    .line 1199
    iput v12, p0, Lco/vine/android/SettingsFragment;->mVersionTapCount:I

    .line 1200
    new-instance v7, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    const-class v9, Lco/vine/android/DebugHomeActivity;

    invoke-direct {v7, v8, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v7}, Lco/vine/android/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1201
    :cond_4
    iget v7, p0, Lco/vine/android/SettingsFragment;->mVersionTapCount:I

    if-ne v7, v9, :cond_0

    .line 1202
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    const-string v8, "One more!"

    invoke-static {v7, v8}, Lco/vine/android/util/Util;->showShortCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1207
    :sswitch_f
    invoke-static {}, Lco/vine/android/LocaleDialog;->newInstance()Lco/vine/android/LocaleDialog;

    move-result-object v4

    .line 1208
    .local v4, ldf:Lco/vine/android/LocaleDialog;
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v7

    const-string v8, "locale"

    invoke-virtual {v4, v7, v8}, Lco/vine/android/LocaleDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1213
    .end local v4           #ldf:Lco/vine/android/LocaleDialog;
    :sswitch_10
    iget-object v7, p0, Lco/vine/android/SettingsFragment;->mEditionsSpinner:Landroid/widget/Spinner;

    invoke-virtual {v7}, Landroid/widget/Spinner;->performClick()Z

    goto/16 :goto_0

    .line 1055
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0a0051 -> :sswitch_0
        0x7f0a00ad -> :sswitch_3
        0x7f0a0153 -> :sswitch_4
        0x7f0a0154 -> :sswitch_5
        0x7f0a0156 -> :sswitch_10
        0x7f0a0157 -> :sswitch_10
        0x7f0a0159 -> :sswitch_6
        0x7f0a015a -> :sswitch_8
        0x7f0a015b -> :sswitch_7
        0x7f0a015c -> :sswitch_1
        0x7f0a0162 -> :sswitch_9
        0x7f0a0165 -> :sswitch_b
        0x7f0a0166 -> :sswitch_a
        0x7f0a0167 -> :sswitch_c
        0x7f0a0168 -> :sswitch_f
        0x7f0a0169 -> :sswitch_d
        0x7f0a016a -> :sswitch_2
        0x7f0a016b -> :sswitch_e
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 217
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 218
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/SettingsFragment;->setHasOptionsMenu(Z)V

    .line 219
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/SettingsFragment;->mPrefs:Landroid/content/SharedPreferences;

    .line 220
    new-instance v0, Lco/vine/android/SettingsFragment$SettingsListener;

    invoke-direct {v0, p0}, Lco/vine/android/SettingsFragment$SettingsListener;-><init>(Lco/vine/android/SettingsFragment;)V

    iput-object v0, p0, Lco/vine/android/SettingsFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 221
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    .line 222
    new-instance v0, Lco/vine/android/ImagePicker;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    invoke-direct {v0, v1, p0, v2, v3}, Lco/vine/android/ImagePicker;-><init>(Landroid/app/Activity;Lco/vine/android/ImagePicker$Listener;J)V

    iput-object v0, p0, Lco/vine/android/SettingsFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    .line 223
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/SettingsFragment;->mEditor:Landroid/content/SharedPreferences$Editor;

    .line 224
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 7
    .parameter "i"
    .parameter "bundle"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 570
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$Editions;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$EditionsQuery;->PROJECTION:[Ljava/lang/String;

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4
    .parameter "menu"
    .parameter "inflater"

    .prologue
    const v3, 0x7f0a018d

    const/4 v2, 0x1

    .line 562
    const v1, 0x7f10000d

    invoke-virtual {p2, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 563
    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 564
    .local v0, mMenuItem:Landroid/view/MenuItem;
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 565
    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 566
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 43
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 240
    const v39, 0x7f030060

    const/16 v40, 0x0

    const/16 v41, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v39

    move-object/from16 v2, v40

    move/from16 v3, v41

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v37

    .line 242
    .local v37, v:Landroid/view/View;
    invoke-direct/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->setOriginalPreferenceValues()V

    .line 244
    if-eqz p3, :cond_0

    .line 245
    const-string v39, "state_name"

    move-object/from16 v0, p3

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    .line 246
    const-string v39, "state_desc"

    move-object/from16 v0, p3

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    .line 247
    const-string v39, "state_loc"

    move-object/from16 v0, p3

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    .line 248
    const-string v39, "state_phone"

    move-object/from16 v0, p3

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mPhone:Ljava/lang/String;

    .line 249
    const-string v39, "state_email"

    move-object/from16 v0, p3

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    .line 250
    const-string v39, "state_editions_fetched"

    move-object/from16 v0, p3

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v39

    move/from16 v0, v39

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/SettingsFragment;->mEditionsFetched:Z

    .line 251
    const-string v39, "state_edition"

    move-object/from16 v0, p3

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;

    .line 252
    const-string v39, "state_avatar_url"

    move-object/from16 v0, p3

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v39

    check-cast v39, Landroid/net/Uri;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    .line 255
    :cond_0
    const v39, 0x7f0a0051

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v39

    check-cast v39, Landroid/widget/ImageView;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    .line 256
    const v39, 0x7f0a0150

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v39

    check-cast v39, Landroid/widget/ImageView;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mAvatarBorderImageView:Landroid/widget/ImageView;

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    move-object/from16 v39, v0

    if-nez v39, :cond_2

    const-string v7, ""

    .line 258
    .local v7, avatarUrl:Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mThumbnail:Landroid/graphics/Bitmap;

    move-object/from16 v39, v0

    if-eqz v39, :cond_3

    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    new-instance v40, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v41

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mThumbnail:Landroid/graphics/Bitmap;

    move-object/from16 v42, v0

    invoke-direct/range {v40 .. v42}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 286
    :goto_1
    const v39, 0x7f0a0151

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/EditText;

    .line 287
    .local v17, editTextName:Landroid/widget/EditText;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 288
    new-instance v39, Lco/vine/android/SettingsFragment$1;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/SettingsFragment$1;-><init>(Lco/vine/android/SettingsFragment;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 303
    const v39, 0x7f0a0101

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/EditText;

    .line 304
    .local v14, editTextDescription:Landroid/widget/EditText;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    invoke-virtual {v14, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 305
    const v39, 0x7f0e016e

    move/from16 v0, v39

    invoke-virtual {v14, v0}, Landroid/widget/EditText;->setHint(I)V

    .line 306
    new-instance v39, Lco/vine/android/SettingsFragment$2;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/SettingsFragment$2;-><init>(Lco/vine/android/SettingsFragment;)V

    move-object/from16 v0, v39

    invoke-virtual {v14, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 321
    const v39, 0x7f0a00c6

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/EditText;

    .line 322
    .local v16, editTextLocation:Landroid/widget/EditText;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 323
    const v39, 0x7f0e017c

    move-object/from16 v0, v16

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(I)V

    .line 324
    new-instance v39, Lco/vine/android/SettingsFragment$3;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/SettingsFragment$3;-><init>(Lco/vine/android/SettingsFragment;)V

    move-object/from16 v0, v16

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 339
    const v39, 0x7f0a0142

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/EditText;

    .line 340
    .local v15, editTextEmail:Landroid/widget/EditText;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    invoke-virtual {v15, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 341
    const v39, 0x7f0e009e

    move/from16 v0, v39

    invoke-virtual {v15, v0}, Landroid/widget/EditText;->setHint(I)V

    .line 342
    const/16 v39, 0x20

    move/from16 v0, v39

    invoke-virtual {v15, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 343
    new-instance v39, Lco/vine/android/SettingsFragment$4;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/SettingsFragment$4;-><init>(Lco/vine/android/SettingsFragment;)V

    move-object/from16 v0, v39

    invoke-virtual {v15, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 358
    const v39, 0x7f0a0152

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/EditText;

    .line 359
    .local v18, editTextPhone:Landroid/widget/EditText;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mPhone:Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 360
    const v39, 0x7f0e009e

    move-object/from16 v0, v18

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(I)V

    .line 361
    const/16 v39, 0x3

    move-object/from16 v0, v18

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 362
    new-instance v39, Lco/vine/android/SettingsFragment$5;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/SettingsFragment$5;-><init>(Lco/vine/android/SettingsFragment;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 377
    const v39, 0x7f0a0158

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v39

    check-cast v39, Landroid/widget/Spinner;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mEditionsSpinner:Landroid/widget/Spinner;

    .line 378
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mEditionsSpinner:Landroid/widget/Spinner;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    invoke-virtual/range {v39 .. v40}, Landroid/widget/Spinner;->setFocusable(Z)V

    .line 379
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mEditionsSpinner:Landroid/widget/Spinner;

    move-object/from16 v39, v0

    new-instance v40, Lco/vine/android/SettingsFragment$6;

    move-object/from16 v0, v40

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/SettingsFragment$6;-><init>(Lco/vine/android/SettingsFragment;)V

    invoke-virtual/range {v39 .. v40}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 390
    const v39, 0x7f0a0156

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 391
    const v39, 0x7f0a0157

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v39

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 393
    new-instance v39, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;-><init>(Lco/vine/android/SettingsFragment;)V

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mSpinnerAdapter:Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;

    .line 395
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mEditionsSpinner:Landroid/widget/Spinner;

    move-object/from16 v39, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mSpinnerAdapter:Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;

    move-object/from16 v40, v0

    invoke-virtual/range {v39 .. v40}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 397
    const v39, 0x7f0a00ad

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v29

    check-cast v29, Landroid/widget/LinearLayout;

    .line 398
    .local v29, password:Landroid/widget/LinearLayout;
    move-object/from16 v0, v29

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 400
    const v39, 0x7f0a0153

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/LinearLayout;

    .line 401
    .local v11, content:Landroid/widget/LinearLayout;
    move-object/from16 v0, p0

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 403
    const v39, 0x7f0a0154

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v39

    check-cast v39, Landroid/widget/FrameLayout;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mNotifications:Landroid/widget/FrameLayout;

    .line 404
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isGoogle()Z

    move-result v39

    if-eqz v39, :cond_8

    .line 405
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mNotifications:Landroid/widget/FrameLayout;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    invoke-virtual/range {v39 .. v40}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 406
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mNotifications:Landroid/widget/FrameLayout;

    move-object/from16 v39, v0

    const v40, 0x7f0a0155

    invoke-virtual/range {v39 .. v40}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v39

    check-cast v39, Landroid/widget/ImageView;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mAlertIcon:Landroid/widget/ImageView;

    .line 407
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v19

    .line 408
    .local v19, errorCode:I
    if-eqz v19, :cond_7

    .line 409
    new-instance v26, Lco/vine/android/SettingsFragment$7;

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lco/vine/android/SettingsFragment$7;-><init>(Lco/vine/android/SettingsFragment;I)V

    .line 417
    .local v26, listener:Landroid/view/View$OnClickListener;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAlertIcon:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 418
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAlertIcon:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 419
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mNotifications:Landroid/widget/FrameLayout;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 435
    .end local v19           #errorCode:I
    .end local v26           #listener:Landroid/view/View$OnClickListener;
    :goto_2
    const v39, 0x7f0a0159

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v23

    check-cast v23, Landroid/widget/LinearLayout;

    .line 436
    .local v23, findFriends:Landroid/widget/LinearLayout;
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 438
    const v39, 0x7f0a015a

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v25

    check-cast v25, Landroid/widget/LinearLayout;

    .line 439
    .local v25, inviteViaText:Landroid/widget/LinearLayout;
    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 441
    const v39, 0x7f0a015b

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v24

    check-cast v24, Landroid/widget/LinearLayout;

    .line 442
    .local v24, inviteViaEmail:Landroid/widget/LinearLayout;
    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 444
    const v39, 0x7f0a015c

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v34

    check-cast v34, Landroid/widget/LinearLayout;

    .line 445
    .local v34, twitterConnect:Landroid/widget/LinearLayout;
    const v39, 0x7f020070

    move-object/from16 v0, v34

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 446
    const v39, 0x7f0a015d

    move-object/from16 v0, v34

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v35

    check-cast v35, Landroid/widget/TextView;

    .line 448
    .local v35, twitterConnectedLabelTextView:Landroid/widget/TextView;
    const v39, 0x7f0a015e

    move-object/from16 v0, v34

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v36

    check-cast v36, Landroid/widget/TextView;

    .line 451
    .local v36, twitterConnectedTextView:Landroid/widget/TextView;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v5

    .line 452
    .local v5, am:Landroid/accounts/AccountManager;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v39

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v40, v0

    invoke-virtual/range {v40 .. v40}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v40

    invoke-static/range {v39 .. v40}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v4

    .line 454
    .local v4, acc:Landroid/accounts/Account;
    if-eqz v4, :cond_9

    invoke-static {v5, v4}, Lco/vine/android/client/VineAccountHelper;->getLoginType(Landroid/accounts/AccountManager;Landroid/accounts/Account;)I

    move-result v39

    const/16 v40, 0x2

    move/from16 v0, v39

    move/from16 v1, v40

    if-ne v0, v1, :cond_9

    .line 456
    const v39, 0x7f0e0167

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 457
    new-instance v39, Ljava/lang/StringBuilder;

    invoke-direct/range {v39 .. v39}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v40, 0x40

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v39

    invoke-static {v5, v4}, Lco/vine/android/client/VineAccountHelper;->getTwitterUsername(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v36

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 458
    const/16 v39, 0x1

    move/from16 v0, v39

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/SettingsFragment;->mTwitterLogin:Z

    .line 469
    :goto_3
    move-object/from16 v0, v34

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 471
    const v39, 0x7f0a015f

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/LinearLayout;

    .line 472
    .local v20, facebookConnect:Landroid/widget/LinearLayout;
    const v39, 0x7f0a0160

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/TextView;

    .line 473
    .local v21, facebookLabel:Landroid/widget/TextView;
    const v39, 0x7f0e00ad

    move-object/from16 v0, v21

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 474
    const v39, 0x7f0a0161

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v22

    check-cast v22, Landroid/widget/TextView;

    .line 475
    .local v22, facebookValue:Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v39, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Lco/vine/android/client/AppController;->isConnectedToFacebook(Landroid/app/Activity;)Z

    move-result v39

    if-eqz v39, :cond_b

    .line 476
    const v39, 0x7f0e0166

    move-object/from16 v0, v22

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 480
    :goto_4
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 482
    const v39, 0x7f0a0162

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/LinearLayout;

    .line 483
    .local v9, clearCache:Landroid/widget/LinearLayout;
    move-object/from16 v0, p0

    invoke-virtual {v9, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 485
    const v39, 0x7f0a0163

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 486
    .local v10, clearCacheLabel:Landroid/widget/TextView;
    const v39, 0x7f0e0160

    move-object/from16 v0, p0

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v39

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 488
    const v39, 0x7f0a0164

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v39

    check-cast v39, Landroid/widget/TextView;

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mClearCacheValue:Landroid/widget/TextView;

    .line 490
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mClearCacheValue:Landroid/widget/TextView;

    move-object/from16 v39, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v40

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v41

    invoke-static/range {v41 .. v41}, Lco/vine/android/util/Util;->getCacheSize(Landroid/content/Context;)J

    move-result-wide v41

    invoke-static/range {v40 .. v42}, Lco/vine/android/util/Util;->formatFileSize(Landroid/content/res/Resources;J)Ljava/lang/String;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lco/vine/android/VineException; {:try_start_0 .. :try_end_0} :catch_0

    .line 496
    :goto_5
    const v39, 0x7f0a0165

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v32

    check-cast v32, Landroid/widget/LinearLayout;

    .line 497
    .local v32, termsOfService:Landroid/widget/LinearLayout;
    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 499
    const v39, 0x7f0a0166

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v31

    check-cast v31, Landroid/widget/LinearLayout;

    .line 500
    .local v31, privacyPolicy:Landroid/widget/LinearLayout;
    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 502
    const v39, 0x7f0a0167

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    .line 503
    .local v6, attribution:Landroid/widget/LinearLayout;
    move-object/from16 v0, p0

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 505
    const v39, 0x7f0a0169

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/LinearLayout;

    .line 506
    .local v12, deactivateAccount:Landroid/widget/LinearLayout;
    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 508
    const v39, 0x7f0a016a

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v28

    check-cast v28, Landroid/widget/LinearLayout;

    .line 509
    .local v28, logout:Landroid/widget/LinearLayout;
    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 511
    const v39, 0x7f0a016b

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v38

    check-cast v38, Landroid/widget/LinearLayout;

    .line 512
    .local v38, version:Landroid/widget/LinearLayout;
    const v39, 0x7f0a016c

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v33

    check-cast v33, Landroid/widget/TextView;

    .line 515
    .local v33, tv:Landroid/widget/TextView;
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Landroid/support/v4/app/FragmentActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v39

    const-string v40, "co.vine.android"

    const/16 v41, 0x0

    invoke-virtual/range {v39 .. v41}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v30

    .line 516
    .local v30, pi:Landroid/content/pm/PackageInfo;
    const v39, 0x7f0e0156

    const/16 v40, 0x1

    move/from16 v0, v40

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v40, v0

    const/16 v41, 0x0

    move-object/from16 v0, v30

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v42, v0

    aput-object v42, v40, v41

    move-object/from16 v0, p0

    move/from16 v1, v39

    move-object/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Lco/vine/android/SettingsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v0, v33

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 521
    .end local v30           #pi:Landroid/content/pm/PackageInfo;
    :goto_6
    move-object/from16 v0, v38

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 523
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isI18nOn()Z

    move-result v39

    if-eqz v39, :cond_1

    .line 524
    const v39, 0x7f0a0168

    move-object/from16 v0, v37

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v27

    check-cast v27, Landroid/widget/LinearLayout;

    .line 525
    .local v27, locale:Landroid/widget/LinearLayout;
    move-object/from16 v0, v27

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 526
    const/16 v39, 0x0

    move-object/from16 v0, v27

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 529
    .end local v27           #locale:Landroid/widget/LinearLayout;
    :cond_1
    return-object v37

    .line 257
    .end local v4           #acc:Landroid/accounts/Account;
    .end local v5           #am:Landroid/accounts/AccountManager;
    .end local v6           #attribution:Landroid/widget/LinearLayout;
    .end local v7           #avatarUrl:Ljava/lang/String;
    .end local v9           #clearCache:Landroid/widget/LinearLayout;
    .end local v10           #clearCacheLabel:Landroid/widget/TextView;
    .end local v11           #content:Landroid/widget/LinearLayout;
    .end local v12           #deactivateAccount:Landroid/widget/LinearLayout;
    .end local v14           #editTextDescription:Landroid/widget/EditText;
    .end local v15           #editTextEmail:Landroid/widget/EditText;
    .end local v16           #editTextLocation:Landroid/widget/EditText;
    .end local v17           #editTextName:Landroid/widget/EditText;
    .end local v18           #editTextPhone:Landroid/widget/EditText;
    .end local v20           #facebookConnect:Landroid/widget/LinearLayout;
    .end local v21           #facebookLabel:Landroid/widget/TextView;
    .end local v22           #facebookValue:Landroid/widget/TextView;
    .end local v23           #findFriends:Landroid/widget/LinearLayout;
    .end local v24           #inviteViaEmail:Landroid/widget/LinearLayout;
    .end local v25           #inviteViaText:Landroid/widget/LinearLayout;
    .end local v28           #logout:Landroid/widget/LinearLayout;
    .end local v29           #password:Landroid/widget/LinearLayout;
    .end local v31           #privacyPolicy:Landroid/widget/LinearLayout;
    .end local v32           #termsOfService:Landroid/widget/LinearLayout;
    .end local v33           #tv:Landroid/widget/TextView;
    .end local v34           #twitterConnect:Landroid/widget/LinearLayout;
    .end local v35           #twitterConnectedLabelTextView:Landroid/widget/TextView;
    .end local v36           #twitterConnectedTextView:Landroid/widget/TextView;
    .end local v38           #version:Landroid/widget/LinearLayout;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    move-object/from16 v39, v0

    invoke-virtual/range {v39 .. v39}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_0

    .line 261
    .restart local v7       #avatarUrl:Ljava/lang/String;
    :cond_3
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v39

    if-nez v39, :cond_6

    .line 262
    invoke-static {v7}, Lco/vine/android/util/Util;->isDefaultAvatarUrl(Ljava/lang/String;)Z

    move-result v39

    if-eqz v39, :cond_4

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v40

    const v41, 0x7f020076

    invoke-virtual/range {v40 .. v41}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 265
    const/16 v39, 0x0

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mThumbnail:Landroid/graphics/Bitmap;

    goto/16 :goto_1

    .line 267
    :cond_4
    new-instance v39, Lco/vine/android/util/image/ImageKey;

    move-object/from16 v0, v39

    invoke-direct {v0, v7}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mAvatarKey:Lco/vine/android/util/image/ImageKey;

    .line 268
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v39, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarKey:Lco/vine/android/util/image/ImageKey;

    move-object/from16 v40, v0

    invoke-virtual/range {v39 .. v40}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 269
    .local v8, bmp:Landroid/graphics/Bitmap;
    if-eqz v8, :cond_5

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    new-instance v40, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    move-object/from16 v41, v0

    invoke-virtual/range {v41 .. v41}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v41

    move-object/from16 v0, v40

    move-object/from16 v1, v41

    invoke-direct {v0, v1, v8}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarBorderImageView:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v40

    const v41, 0x7f020105

    invoke-virtual/range {v40 .. v41}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 273
    move-object/from16 v0, p0

    iput-object v8, v0, Lco/vine/android/SettingsFragment;->mThumbnail:Landroid/graphics/Bitmap;

    goto/16 :goto_1

    .line 275
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v40

    const v41, 0x7f02006c

    invoke-virtual/range {v40 .. v41}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarBorderImageView:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 278
    const/16 v39, 0x0

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/SettingsFragment;->mThumbnail:Landroid/graphics/Bitmap;

    goto/16 :goto_1

    .line 282
    .end local v8           #bmp:Landroid/graphics/Bitmap;
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v40

    const v41, 0x7f020076

    invoke-virtual/range {v40 .. v41}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v40

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 283
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAvatarBorderImageView:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    const/16 v40, 0x0

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1

    .line 421
    .restart local v11       #content:Landroid/widget/LinearLayout;
    .restart local v14       #editTextDescription:Landroid/widget/EditText;
    .restart local v15       #editTextEmail:Landroid/widget/EditText;
    .restart local v16       #editTextLocation:Landroid/widget/EditText;
    .restart local v17       #editTextName:Landroid/widget/EditText;
    .restart local v18       #editTextPhone:Landroid/widget/EditText;
    .restart local v19       #errorCode:I
    .restart local v29       #password:Landroid/widget/LinearLayout;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mAlertIcon:Landroid/widget/ImageView;

    move-object/from16 v39, v0

    const/16 v40, 0x8

    invoke-virtual/range {v39 .. v40}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 422
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mNotifications:Landroid/widget/FrameLayout;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_2

    .line 426
    .end local v19           #errorCode:I
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/SettingsFragment;->mNotifications:Landroid/widget/FrameLayout;

    move-object/from16 v39, v0

    const/16 v40, 0x8

    invoke-virtual/range {v39 .. v40}, Landroid/widget/FrameLayout;->setVisibility(I)V

    goto/16 :goto_2

    .line 459
    .restart local v4       #acc:Landroid/accounts/Account;
    .restart local v5       #am:Landroid/accounts/AccountManager;
    .restart local v23       #findFriends:Landroid/widget/LinearLayout;
    .restart local v24       #inviteViaEmail:Landroid/widget/LinearLayout;
    .restart local v25       #inviteViaText:Landroid/widget/LinearLayout;
    .restart local v34       #twitterConnect:Landroid/widget/LinearLayout;
    .restart local v35       #twitterConnectedLabelTextView:Landroid/widget/TextView;
    .restart local v36       #twitterConnectedTextView:Landroid/widget/TextView;
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/SettingsFragment;->mTwitterConnected:Z

    move/from16 v39, v0

    if-eqz v39, :cond_a

    .line 461
    const v39, 0x7f0e0167

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 462
    const-string v39, ""

    move-object/from16 v0, v36

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 463
    const/16 v39, 0x1

    move/from16 v0, v39

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/SettingsFragment;->mTwitterLogin:Z

    goto/16 :goto_3

    .line 465
    :cond_a
    const v39, 0x7f0e0165

    move-object/from16 v0, v36

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 466
    const v39, 0x7f0e0164

    move-object/from16 v0, v35

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 467
    const/16 v39, 0x0

    move/from16 v0, v39

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/SettingsFragment;->mTwitterLogin:Z

    goto/16 :goto_3

    .line 478
    .restart local v20       #facebookConnect:Landroid/widget/LinearLayout;
    .restart local v21       #facebookLabel:Landroid/widget/TextView;
    .restart local v22       #facebookValue:Landroid/widget/TextView;
    :cond_b
    const v39, 0x7f0e017d

    move-object/from16 v0, v22

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_4

    .line 492
    .restart local v9       #clearCache:Landroid/widget/LinearLayout;
    .restart local v10       #clearCacheLabel:Landroid/widget/TextView;
    :catch_0
    move-exception v13

    .line 493
    .local v13, e:Lco/vine/android/VineException;
    invoke-static {v13}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto/16 :goto_5

    .line 518
    .end local v13           #e:Lco/vine/android/VineException;
    .restart local v6       #attribution:Landroid/widget/LinearLayout;
    .restart local v12       #deactivateAccount:Landroid/widget/LinearLayout;
    .restart local v28       #logout:Landroid/widget/LinearLayout;
    .restart local v31       #privacyPolicy:Landroid/widget/LinearLayout;
    .restart local v32       #termsOfService:Landroid/widget/LinearLayout;
    .restart local v33       #tv:Landroid/widget/TextView;
    .restart local v38       #version:Landroid/widget/LinearLayout;
    :catch_1
    move-exception v13

    .line 519
    .local v13, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v39, "SettingsFragment"

    const-string v40, "Error retrieving package info:"

    move-object/from16 v0, v39

    move-object/from16 v1, v40

    invoke-static {v0, v1, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_6
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 8
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x3

    const/4 v5, 0x1

    const v4, 0x7f0f0028

    const/4 v3, 0x0

    .line 925
    packed-switch p2, :pswitch_data_0

    .line 1051
    :cond_0
    :goto_0
    return-void

    .line 927
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    :pswitch_1
    goto :goto_0

    .line 933
    :pswitch_2
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    invoke-virtual {v2, v7}, Lco/vine/android/ImagePicker;->chooseImage(I)V

    goto :goto_0

    .line 929
    :pswitch_3
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    invoke-virtual {v2, v6}, Lco/vine/android/ImagePicker;->captureImage(I)V

    goto :goto_0

    .line 940
    :pswitch_4
    packed-switch p3, :pswitch_data_2

    goto :goto_0

    .line 948
    :pswitch_5
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    invoke-virtual {v2, v6}, Lco/vine/android/ImagePicker;->captureImage(I)V

    goto :goto_0

    .line 942
    :pswitch_6
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->setThumbnailImage(Landroid/graphics/Bitmap;)V

    .line 943
    iput-boolean v5, p0, Lco/vine/android/SettingsFragment;->mPhotoChanged:Z

    .line 944
    const-string v2, ""

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    goto :goto_0

    .line 952
    :pswitch_7
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mImagePicker:Lco/vine/android/ImagePicker;

    invoke-virtual {v2, v7}, Lco/vine/android/ImagePicker;->chooseImage(I)V

    goto :goto_0

    .line 959
    :pswitch_8
    packed-switch p3, :pswitch_data_3

    goto :goto_0

    .line 961
    :pswitch_9
    invoke-direct {p0}, Lco/vine/android/SettingsFragment;->resetPrefs()V

    .line 962
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 963
    .local v0, activity:Landroid/support/v4/app/FragmentActivity;
    if-eqz v0, :cond_0

    .line 964
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 975
    .end local v0           #activity:Landroid/support/v4/app/FragmentActivity;
    :pswitch_a
    packed-switch p3, :pswitch_data_4

    goto :goto_0

    .line 977
    :pswitch_b
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackLogout()V

    .line 978
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2, v4}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 980
    .local v1, d:Landroid/app/ProgressDialog;
    const v2, 0x7f0e00dc

    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 981
    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 982
    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 983
    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 984
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v3, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    invoke-virtual {v2, v3}, Lco/vine/android/client/AppController;->logout(Lco/vine/android/client/Session;)Ljava/lang/String;

    goto :goto_0

    .line 994
    .end local v1           #d:Landroid/app/ProgressDialog;
    :pswitch_c
    packed-switch p3, :pswitch_data_5

    goto :goto_0

    .line 996
    :pswitch_d
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2, v4}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 998
    .restart local v1       #d:Landroid/app/ProgressDialog;
    const v2, 0x7f0e0172

    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 999
    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 1000
    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 1001
    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 1002
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v3, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    invoke-virtual {v2, v3}, Lco/vine/android/client/AppController;->disconnectTwitter(Lco/vine/android/client/Session;)Ljava/lang/String;

    goto/16 :goto_0

    .line 1012
    .end local v1           #d:Landroid/app/ProgressDialog;
    :pswitch_e
    packed-switch p3, :pswitch_data_6

    goto/16 :goto_0

    .line 1014
    :pswitch_f
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2, v4}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 1016
    .restart local v1       #d:Landroid/app/ProgressDialog;
    const v2, 0x7f0e0163

    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1017
    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 1018
    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 1019
    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 1020
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2, v5}, Lco/vine/android/client/AppController;->clearDbCache(Z)Ljava/lang/String;

    goto/16 :goto_0

    .line 1030
    .end local v1           #d:Landroid/app/ProgressDialog;
    :pswitch_10
    packed-switch p3, :pswitch_data_7

    goto/16 :goto_0

    .line 1032
    :pswitch_11
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2, v4}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 1034
    .restart local v1       #d:Landroid/app/ProgressDialog;
    const v2, 0x7f0e016d

    invoke-virtual {p0, v2}, Lco/vine/android/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1035
    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 1036
    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 1037
    iput-object v1, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    .line 1038
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->deactivateAccount()Ljava/lang/String;

    goto/16 :goto_0

    .line 925
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_4
        :pswitch_8
        :pswitch_a
        :pswitch_c
        :pswitch_e
        :pswitch_10
    .end packed-switch

    .line 927
    :pswitch_data_1
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch

    .line 940
    :pswitch_data_2
    .packed-switch -0x3
        :pswitch_5
        :pswitch_7
        :pswitch_6
    .end packed-switch

    .line 959
    :pswitch_data_3
    .packed-switch -0x1
        :pswitch_9
    .end packed-switch

    .line 975
    :pswitch_data_4
    .packed-switch -0x1
        :pswitch_b
    .end packed-switch

    .line 994
    :pswitch_data_5
    .packed-switch -0x1
        :pswitch_d
    .end packed-switch

    .line 1012
    :pswitch_data_6
    .packed-switch -0x1
        :pswitch_f
    .end packed-switch

    .line 1030
    :pswitch_data_7
    .packed-switch -0x1
        :pswitch_11
    .end packed-switch
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 1
    .parameter
    .parameter "cursor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 578
    .local p1, cursorLoader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    iget-boolean v0, p0, Lco/vine/android/SettingsFragment;->mEditionsFetched:Z

    if-nez v0, :cond_0

    .line 579
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getEditions()V

    .line 580
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/SettingsFragment;->mEditionsFetched:Z

    .line 582
    :cond_0
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mSpinnerAdapter:Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;

    invoke-virtual {v0, p2}, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 583
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mSpinnerAdapter:Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->setSelectionToUserEdition()V

    .line 584
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 75
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/SettingsFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 587
    .local p1, cursorLoader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 903
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 918
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 905
    :pswitch_0
    invoke-direct {p0}, Lco/vine/android/SettingsFragment;->isDirty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 906
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    invoke-direct {p0, v0}, Lco/vine/android/SettingsFragment;->updateProfile(Landroid/net/Uri;)V

    .line 915
    :cond_0
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 908
    :cond_1
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_2

    .line 909
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 911
    :cond_2
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 912
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_1

    .line 903
    :pswitch_data_0
    .packed-switch 0x7f0a018d
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 175
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onPause()V

    .line 176
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 177
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 179
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 228
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onResume()V

    .line 229
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mSpinnerAdapter:Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->getCursor()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    .line 230
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 231
    :cond_1
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mSpinnerAdapter:Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment$EditionsSpinnerAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/SettingsFragment;->mEditionsFetched:Z

    if-nez v0, :cond_0

    .line 232
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/SettingsFragment;->mEditionsFetched:Z

    .line 233
    iget-object v0, p0, Lco/vine/android/SettingsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getEditions()V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 183
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 184
    const-string v0, "state_name"

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    const-string v0, "state_desc"

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mDescription:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    const-string v0, "state_loc"

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mLocation:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const-string v0, "state_phone"

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mPhone:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    const-string v0, "state_email"

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mEmail:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    const-string v0, "state_edition"

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mEdition:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    const-string v0, "state_editions_fetched"

    iget-boolean v1, p0, Lco/vine/android/SettingsFragment;->mEditionsFetched:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 191
    const-string v0, "state_avatar_url"

    iget-object v1, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 192
    return-void
.end method

.method public setAvatarUrl(Landroid/net/Uri;)V
    .locals 0
    .parameter "url"

    .prologue
    .line 892
    iput-object p1, p0, Lco/vine/android/SettingsFragment;->mAvatarUri:Landroid/net/Uri;

    .line 893
    return-void
.end method

.method public setThumbnailImage(Landroid/graphics/Bitmap;)V
    .locals 5
    .parameter "bitmap"

    .prologue
    .line 777
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getView()Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a0051

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    .line 778
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getView()Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a0150

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lco/vine/android/SettingsFragment;->mAvatarBorderImageView:Landroid/widget/ImageView;

    .line 779
    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 780
    .local v1, res:Landroid/content/res/Resources;
    if-eqz p1, :cond_0

    .line 781
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    new-instance v3, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    invoke-virtual {p0}, Lco/vine/android/SettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-direct {v3, v4, p1}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 782
    const v2, 0x7f020108

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 783
    .local v0, border:Landroid/graphics/drawable/Drawable;
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAvatarBorderImageView:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 784
    iput-object p1, p0, Lco/vine/android/SettingsFragment;->mThumbnail:Landroid/graphics/Bitmap;

    .line 790
    .end local v0           #border:Landroid/graphics/drawable/Drawable;
    :goto_0
    return-void

    .line 786
    :cond_0
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAvatarImageView:Landroid/widget/ImageView;

    const v3, 0x7f020076

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 787
    iget-object v2, p0, Lco/vine/android/SettingsFragment;->mAvatarBorderImageView:Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 788
    iput-object p1, p0, Lco/vine/android/SettingsFragment;->mThumbnail:Landroid/graphics/Bitmap;

    goto :goto_0
.end method
