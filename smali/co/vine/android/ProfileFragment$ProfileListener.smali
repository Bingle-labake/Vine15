.class Lco/vine/android/ProfileFragment$ProfileListener;
.super Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ProfileListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/ProfileFragment;


# direct methods
.method constructor <init>(Lco/vine/android/ProfileFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 840
    iput-object p1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-direct {p0, p1}, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;-><init>(Lco/vine/android/BaseTimelineFragment;)V

    return-void
.end method

.method private isUsernameValid()Z
    .locals 1

    .prologue
    .line 1124
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v0}, Lco/vine/android/ProfileFragment;->access$200(Lco/vine/android/ProfileFragment;)Lco/vine/android/api/VineUser;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v0}, Lco/vine/android/ProfileFragment;->access$200(Lco/vine/android/ProfileFragment;)Lco/vine/android/api/VineUser;

    move-result-object v0

    iget-object v0, v0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onBlockUserComplete(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 8
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "userBlocked"

    .prologue
    const v3, 0x7f0e01d7

    const/4 v4, 0x1

    .line 1034
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_2

    .line 1035
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #setter for: Lco/vine/android/ProfileFragment;->mIsUserBlocked:Z
    invoke-static {v1, p4}, Lco/vine/android/ProfileFragment;->access$702(Lco/vine/android/ProfileFragment;Z)Z

    .line 1036
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->supportInvalidateOptionsMenu()V

    .line 1038
    if-eqz p4, :cond_1

    .line 1039
    invoke-direct {p0}, Lco/vine/android/ProfileFragment$ProfileListener;->isUsernameValid()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$200(Lco/vine/android/ProfileFragment;)Lco/vine/android/api/VineUser;

    move-result-object v1

    iget-object v6, v1, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    .line 1041
    .local v6, username:Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v3, 0x7f0e01d6

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-virtual {v2, v3, v5}, Lco/vine/android/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1043
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v0

    .line 1044
    .local v0, dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUserId:J
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$600(Lco/vine/android/ProfileFragment;)J

    move-result-wide v1

    const/4 v3, 0x2

    sget-object v5, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_FOLLOWERS:Landroid/net/Uri;

    invoke-virtual/range {v0 .. v5}, Lco/vine/android/provider/VineDatabaseHelper;->removeUserWithType(JIZLandroid/net/Uri;)Z

    .line 1052
    .end local v0           #dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    .end local v6           #username:Ljava/lang/String;
    :goto_1
    return-void

    .line 1039
    :cond_0
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v2, 0x7f0e01df

    invoke-virtual {v1, v2}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 1047
    :cond_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v2, v3}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    .line 1050
    :cond_2
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v2, v3}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onDeletePostComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    .line 1129
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_0

    .line 1130
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #calls: Lco/vine/android/ProfileFragment;->bindProfileDataAndCounts()V
    invoke-static {v0}, Lco/vine/android/ProfileFragment;->access$900(Lco/vine/android/ProfileFragment;)V

    .line 1132
    :cond_0
    return-void
.end method

.method public onDisableUserRepostsComplete(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 6
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "success"

    .prologue
    const v5, 0x7f0e013f

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1096
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_3

    .line 1097
    iget-object v4, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    if-nez p4, :cond_0

    move v1, v2

    :goto_0
    #setter for: Lco/vine/android/ProfileFragment;->mRepostsEnabled:Z
    invoke-static {v4, v1}, Lco/vine/android/ProfileFragment;->access$802(Lco/vine/android/ProfileFragment;Z)Z

    .line 1098
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->supportInvalidateOptionsMenu()V

    .line 1100
    if-eqz p4, :cond_2

    .line 1101
    invoke-direct {p0}, Lco/vine/android/ProfileFragment$ProfileListener;->isUsernameValid()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$200(Lco/vine/android/ProfileFragment;)Lco/vine/android/api/VineUser;

    move-result-object v1

    iget-object v0, v1, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    .line 1103
    .local v0, username:Ljava/lang/String;
    :goto_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v4, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v5, 0x7f0e013e

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-virtual {v4, v5, v2}, Lco/vine/android/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1110
    .end local v0           #username:Ljava/lang/String;
    :goto_2
    return-void

    :cond_0
    move v1, v3

    .line 1097
    goto :goto_0

    .line 1101
    :cond_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v4, 0x7f0e01e0

    invoke-virtual {v1, v4}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 1105
    :cond_2
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v2, v5}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_2

    .line 1108
    :cond_3
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v2, v5}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_2
.end method

.method public onEnableUserRepostsComplete(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 6
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "success"

    .prologue
    const v3, 0x7f0e0141

    .line 1077
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_2

    .line 1078
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #setter for: Lco/vine/android/ProfileFragment;->mRepostsEnabled:Z
    invoke-static {v1, p4}, Lco/vine/android/ProfileFragment;->access$802(Lco/vine/android/ProfileFragment;Z)Z

    .line 1079
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->supportInvalidateOptionsMenu()V

    .line 1081
    if-eqz p4, :cond_1

    .line 1082
    invoke-direct {p0}, Lco/vine/android/ProfileFragment$ProfileListener;->isUsernameValid()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$200(Lco/vine/android/ProfileFragment;)Lco/vine/android/api/VineUser;

    move-result-object v1

    iget-object v0, v1, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    .line 1084
    .local v0, username:Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v3, 0x7f0e0140

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {v2, v3, v4}, Lco/vine/android/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1091
    .end local v0           #username:Ljava/lang/String;
    :goto_1
    return-void

    .line 1082
    :cond_0
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v2, 0x7f0e01e0

    invoke-virtual {v1, v2}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1086
    :cond_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v2, v3}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    .line 1089
    :cond_2
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v2, v3}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onGetBlockedUsersComplete(Ljava/lang/String;ILjava/lang/String;Ljava/util/ArrayList;)V
    .locals 6
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1020
    .local p4, blockedUsers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    const/16 v2, 0xc8

    if-ne p2, v2, :cond_2

    .line 1021
    invoke-virtual {p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineUser;

    .line 1022
    .local v1, user:Lco/vine/android/api/VineUser;
    iget-wide v2, v1, Lco/vine/android/api/VineUser;->userId:J

    iget-object v4, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUserId:J
    invoke-static {v4}, Lco/vine/android/ProfileFragment;->access$600(Lco/vine/android/ProfileFragment;)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 1023
    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const/4 v3, 0x1

    #setter for: Lco/vine/android/ProfileFragment;->mIsUserBlocked:Z
    invoke-static {v2, v3}, Lco/vine/android/ProfileFragment;->access$702(Lco/vine/android/ProfileFragment;Z)Z

    .line 1027
    .end local v1           #user:Lco/vine/android/api/VineUser;
    :cond_1
    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v2}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->supportInvalidateOptionsMenu()V

    .line 1029
    .end local v0           #i$:Ljava/util/Iterator;
    :cond_2
    return-void
.end method

.method public onGetTimeLineComplete(Ljava/lang/String;ILjava/lang/String;IIZLjava/util/ArrayList;Ljava/lang/String;IIIJZILjava/lang/String;)V
    .locals 22
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "type"
    .parameter "count"
    .parameter "memory"
    .parameter
    .parameter "tag"
    .parameter "pageType"
    .parameter "next"
    .parameter "previous"
    .parameter "anchor"
    .parameter "userInitiated"
    .parameter "size"
    .parameter "title"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "IIZ",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;",
            "Ljava/lang/String;",
            "IIIJZI",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 847
    .local p7, posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lco/vine/android/ProfileFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v20

    .line 848
    .local v20, req:Lco/vine/android/PendingRequest;
    if-eqz v20, :cond_b

    .line 849
    const/4 v2, 0x2

    move/from16 v0, p4

    if-eq v0, v2, :cond_0

    const/16 v2, 0xa

    move/from16 v0, p4

    if-ne v0, v2, :cond_c

    :cond_0
    const/16 v16, 0x1

    .line 853
    .local v16, isUserTimelineType:Z
    :goto_0
    if-eqz v16, :cond_1

    const/16 v2, 0xc8

    move/from16 v0, p2

    if-ne v0, v2, :cond_1

    .line 854
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    move/from16 v0, p15

    invoke-virtual {v2, v0}, Lco/vine/android/ProfileHeaderAdapter;->updatePostsCount(I)V

    .line 855
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v2}, Lco/vine/android/ProfileHeaderAdapter;->notifyDataSetChanged()V

    .line 858
    :cond_1
    if-eqz p6, :cond_9

    const/16 v2, 0xc8

    move/from16 v0, p2

    if-ne v0, v2, :cond_9

    .line 860
    const/4 v2, 0x3

    move/from16 v0, p4

    if-ne v0, v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mCurrentTab:I
    invoke-static {v2}, Lco/vine/android/ProfileFragment;->access$000(Lco/vine/android/ProfileFragment;)I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    :cond_2
    if-eqz v16, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mCurrentTab:I
    invoke-static {v2}, Lco/vine/android/ProfileFragment;->access$000(Lco/vine/android/ProfileFragment;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_7

    .line 863
    :cond_3
    const/4 v14, 0x0

    .line 864
    .local v14, existingPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v12

    .line 865
    .local v12, currentCursor:Landroid/database/Cursor;
    if-eqz v12, :cond_4

    invoke-interface {v12}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_4

    .line 866
    new-instance v21, Landroid/os/Bundle;

    invoke-direct/range {v21 .. v21}, Landroid/os/Bundle;-><init>()V

    .line 867
    .local v21, response:Landroid/os/Bundle;
    const-string v2, "include_list"

    const/4 v3, 0x1

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 868
    move-object/from16 v0, v21

    invoke-interface {v12, v0}, Landroid/database/Cursor;->respond(Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 869
    invoke-interface {v12}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v15

    .line 870
    .local v15, extras:Landroid/os/Bundle;
    const-string v2, "extra_posts"

    invoke-virtual {v15, v2}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v14

    .line 873
    .end local v15           #extras:Landroid/os/Bundle;
    .end local v21           #response:Landroid/os/Bundle;
    :cond_4
    invoke-static/range {p4 .. p4}, Lco/vine/android/api/VineComparatorFactory;->get(I)Lco/vine/android/api/VineComparatorFactory$VineComparator;

    move-result-object v2

    const/4 v3, 0x0

    move-object/from16 v0, p7

    invoke-static {v14, v0, v2, v3}, Lco/vine/android/provider/HybridPostCursor;->mergePosts(Ljava/util/ArrayList;Ljava/util/ArrayList;Lco/vine/android/api/VineComparatorFactory$VineComparator;Z)Ljava/util/ArrayList;

    move-result-object v17

    .line 877
    .local v17, mergedPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    if-eqz v17, :cond_7

    .line 878
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mCurrentTab:I
    invoke-static {v2}, Lco/vine/android/ProfileFragment;->access$000(Lco/vine/android/ProfileFragment;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_d

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget v0, v2, Lco/vine/android/ProfileFragment;->mCursorQuerySizePosts:I

    move/from16 v19, v0

    .line 882
    .local v19, querySize:I
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v2}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 883
    new-instance v13, Lco/vine/android/provider/HybridPostCursorExplore;

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-direct {v13, v0, v1}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Ljava/util/ArrayList;I)V

    .line 888
    .local v13, cursor:Lco/vine/android/provider/HybridPostCursor;
    :goto_2
    if-gtz p10, :cond_5

    .line 889
    invoke-virtual {v13}, Lco/vine/android/provider/HybridPostCursor;->markLast()V

    .line 891
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    if-eqz v2, :cond_f

    .line 892
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2, v13}, Landroid/support/v4/widget/CursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v18

    .line 893
    .local v18, oldCursor:Landroid/database/Cursor;
    if-eqz v18, :cond_6

    .line 894
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    move-object/from16 v0, v18

    invoke-interface {v0, v2}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 896
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-virtual {v13, v2}, Lco/vine/android/provider/HybridPostCursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 901
    .end local v18           #oldCursor:Landroid/database/Cursor;
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 904
    .end local v12           #currentCursor:Landroid/database/Cursor;
    .end local v13           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .end local v14           #existingPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v17           #mergedPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v19           #querySize:I
    :cond_7
    if-eqz v16, :cond_10

    .line 905
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v3, v3, Lco/vine/android/ProfileFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v3}, Landroid/support/v4/widget/CursorAdapter;->getCount()I

    move-result v3

    iput v3, v2, Lco/vine/android/ProfileFragment;->mCursorQuerySizePosts:I

    .line 911
    :cond_8
    :goto_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    const/4 v11, 0x0

    move-object/from16 v3, p7

    move/from16 v4, p4

    move-object/from16 v5, p8

    move/from16 v6, p9

    move/from16 v7, p10

    move/from16 v8, p11

    move-wide/from16 v9, p12

    invoke-virtual/range {v2 .. v11}, Lco/vine/android/client/AppController;->saveLoadedPosts(Ljava/util/ArrayList;ILjava/lang/String;IIIJZ)Ljava/lang/String;

    .line 915
    :cond_9
    if-nez v16, :cond_a

    const/4 v2, 0x3

    move/from16 v0, p4

    if-ne v0, v2, :cond_b

    .line 916
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    move-object/from16 v0, v20

    iget v3, v0, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {v2, v3}, Lco/vine/android/ProfileFragment;->hideProgress(I)V

    .line 919
    .end local v16           #isUserTimelineType:Z
    :cond_b
    return-void

    .line 849
    :cond_c
    const/16 v16, 0x0

    goto/16 :goto_0

    .line 878
    .restart local v12       #currentCursor:Landroid/database/Cursor;
    .restart local v14       #existingPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .restart local v16       #isUserTimelineType:Z
    .restart local v17       #mergedPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget v0, v2, Lco/vine/android/ProfileFragment;->mCursorQuerySizeLikes:I

    move/from16 v19, v0

    goto/16 :goto_1

    .line 885
    .restart local v19       #querySize:I
    :cond_e
    new-instance v13, Lco/vine/android/provider/HybridPostCursor;

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-direct {v13, v0, v1}, Lco/vine/android/provider/HybridPostCursor;-><init>(Ljava/util/ArrayList;I)V

    .restart local v13       #cursor:Lco/vine/android/provider/HybridPostCursor;
    goto/16 :goto_2

    .line 898
    :cond_f
    new-instance v2, Lco/vine/android/VineException;

    const-string v3, "Invalid observer"

    invoke-direct {v2, v3}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_3

    .line 907
    .end local v12           #currentCursor:Landroid/database/Cursor;
    .end local v13           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .end local v14           #existingPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v17           #mergedPosts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v19           #querySize:I
    :cond_10
    const/4 v2, 0x3

    move/from16 v0, p4

    if-ne v0, v2, :cond_8

    .line 908
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v3, v3, Lco/vine/android/ProfileFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v3}, Landroid/support/v4/widget/CursorAdapter;->getCount()I

    move-result v3

    iput v3, v2, Lco/vine/android/ProfileFragment;->mCursorQuerySizeLikes:I

    goto :goto_4
.end method

.method public onGetUserComplete(Ljava/lang/String;ILjava/lang/String;Lco/vine/android/api/VineUser;)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "user"

    .prologue
    .line 966
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/ProfileFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 968
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_2

    .line 969
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_1

    .line 970
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #setter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v1, p4}, Lco/vine/android/ProfileFragment;->access$202(Lco/vine/android/ProfileFragment;Lco/vine/android/api/VineUser;)Lco/vine/android/api/VineUser;

    .line 971
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #calls: Lco/vine/android/ProfileFragment;->isLocked()Z
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$300(Lco/vine/android/ProfileFragment;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 972
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const/4 v2, 0x0

    #setter for: Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;
    invoke-static {v1, v2}, Lco/vine/android/ProfileFragment;->access$402(Lco/vine/android/ProfileFragment;Lco/vine/android/widget/SectionAdapter;)Lco/vine/android/widget/SectionAdapter;

    .line 973
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #calls: Lco/vine/android/ProfileFragment;->setup()V
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$500(Lco/vine/android/ProfileFragment;)V

    .line 975
    :cond_0
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v1, v1, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    if-eqz v1, :cond_1

    .line 976
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v2}, Lco/vine/android/ProfileFragment;->access$200(Lco/vine/android/ProfileFragment;)Lco/vine/android/api/VineUser;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/ProfileFragment;->bindUserData(Lco/vine/android/api/VineUser;)V

    .line 978
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v1, v1, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v1}, Lco/vine/android/ProfileHeaderAdapter;->notifyDataSetChanged()V

    .line 981
    :cond_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget v2, v0, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {v1, v2}, Lco/vine/android/ProfileFragment;->hideProgress(I)V

    .line 983
    :cond_2
    return-void
.end method

.method public onGetUserIdComplete(Ljava/lang/String;ILjava/lang/String;J)V
    .locals 7
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "userId"

    .prologue
    const/4 v1, 0x0

    .line 1157
    const-wide/16 v2, 0x0

    cmp-long v0, p4, v2

    if-lez v0, :cond_2

    .line 1158
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #setter for: Lco/vine/android/ProfileFragment;->mUserId:J
    invoke-static {v0, p4, p5}, Lco/vine/android/ProfileFragment;->access$602(Lco/vine/android/ProfileFragment;J)J

    .line 1159
    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUserId:J
    invoke-static {v0}, Lco/vine/android/ProfileFragment;->access$600(Lco/vine/android/ProfileFragment;)J

    move-result-wide v3

    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v0, v0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    #setter for: Lco/vine/android/ProfileFragment;->mIsMe:Z
    invoke-static {v2, v0}, Lco/vine/android/ProfileFragment;->access$102(Lco/vine/android/ProfileFragment;Z)Z

    .line 1160
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mIsMe:Z
    invoke-static {v0}, Lco/vine/android/ProfileFragment;->access$100(Lco/vine/android/ProfileFragment;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1161
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v2}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "profile_hide_reposts"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    #setter for: Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z
    invoke-static {v0, v1}, Lco/vine/android/ProfileFragment;->access$1102(Lco/vine/android/ProfileFragment;Z)Z

    .line 1163
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #calls: Lco/vine/android/ProfileFragment;->setup()V
    invoke-static {v0}, Lco/vine/android/ProfileFragment;->access$500(Lco/vine/android/ProfileFragment;)V

    .line 1164
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #calls: Lco/vine/android/ProfileFragment;->initProfile()V
    invoke-static {v0}, Lco/vine/android/ProfileFragment;->access$1200(Lco/vine/android/ProfileFragment;)V

    .line 1173
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 1159
    goto :goto_0

    .line 1166
    :cond_1
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v0, v0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getBlockedUsers()Ljava/lang/String;

    .line 1167
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v0}, Lco/vine/android/ProfileFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    iget-object v3, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_1

    .line 1171
    :cond_2
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_1
.end method

.method public onGetUsersMeComplete(Ljava/lang/String;ILjava/lang/String;JLco/vine/android/api/VineUser;)V
    .locals 3
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "sessionOwnerId"
    .parameter "user"

    .prologue
    .line 933
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/ProfileFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 935
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_1

    .line 936
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_0

    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mIsMe:Z
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$100(Lco/vine/android/ProfileFragment;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 937
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #setter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v1, p6}, Lco/vine/android/ProfileFragment;->access$202(Lco/vine/android/ProfileFragment;Lco/vine/android/api/VineUser;)Lco/vine/android/api/VineUser;

    .line 938
    if-eqz p6, :cond_0

    .line 939
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1, p6}, Lco/vine/android/ProfileFragment;->bindUserData(Lco/vine/android/api/VineUser;)V

    .line 941
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v1, v1, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v1}, Lco/vine/android/ProfileHeaderAdapter;->notifyDataSetChanged()V

    .line 944
    :cond_0
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget v2, v0, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {v1, v2}, Lco/vine/android/ProfileFragment;->hideProgress(I)V

    .line 946
    :cond_1
    return-void
.end method

.method public onLikePost(Ljava/lang/String;ILjava/lang/String;J)V
    .locals 2
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"

    .prologue
    .line 995
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/ProfileFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 996
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 997
    const/16 v1, 0xc8

    if-eq p2, v1, :cond_0

    .line 998
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v1, v1, Lco/vine/android/ProfileFragment;->mLikeCache:Lco/vine/android/LikeCache;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/LikeCache;->removeEntry(J)V

    .line 999
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v1, v1, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/widget/GenericTimelineAdapter;->showUnlikedByMe(J)V

    .line 1000
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v1, v1, Lco/vine/android/ProfileFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 1003
    :cond_0
    return-void
.end method

.method public onPhotoImageError(Lco/vine/android/util/image/ImageKey;Lco/vine/android/network/HttpResult;)V
    .locals 0
    .parameter "key"
    .parameter "result"

    .prologue
    .line 961
    return-void
.end method

.method public onPhotoImageLoaded(Ljava/util/HashMap;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/image/ImageKey;",
            "Lco/vine/android/util/image/UrlImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 987
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v0, v0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    if-eqz v0, :cond_0

    .line 988
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v0, v0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/ProfileHeaderAdapter;->onImageLoaded(Ljava/util/HashMap;)V

    .line 989
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v0, v0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/widget/GenericTimelineAdapter;->setImages(Ljava/util/HashMap;)V

    .line 991
    :cond_0
    return-void
.end method

.method public onReportUserComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 6
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    .line 1114
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_1

    .line 1115
    invoke-direct {p0}, Lco/vine/android/ProfileFragment$ProfileListener;->isUsernameValid()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$200(Lco/vine/android/ProfileFragment;)Lco/vine/android/api/VineUser;

    move-result-object v1

    iget-object v0, v1, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    .line 1117
    .local v0, username:Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v3, 0x7f0e01db

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-virtual {v2, v3, v4}, Lco/vine/android/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1121
    .end local v0           #username:Ljava/lang/String;
    :goto_1
    return-void

    .line 1115
    :cond_0
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v2, 0x7f0e01e0

    invoke-virtual {v1, v2}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1119
    :cond_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v3, 0x7f0e01dc

    invoke-virtual {v2, v3}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onRespondFollowRequestComplete(Ljava/lang/String;ILjava/lang/String;ZJ)V
    .locals 4
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "accept"
    .parameter "userId"

    .prologue
    .line 1138
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_1

    .line 1139
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mFollowHeader:Landroid/widget/LinearLayout;
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$1000(Lco/vine/android/ProfileFragment;)Landroid/widget/LinearLayout;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1140
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mFollowHeader:Landroid/widget/LinearLayout;
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$1000(Lco/vine/android/ProfileFragment;)Landroid/widget/LinearLayout;

    move-result-object v1

    const v2, 0x7f0a0099

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1141
    .local v0, inner:Landroid/view/View;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1143
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mFollowHeader:Landroid/widget/LinearLayout;
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$1000(Lco/vine/android/ProfileFragment;)Landroid/widget/LinearLayout;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1152
    .end local v0           #inner:Landroid/view/View;
    :cond_0
    :goto_0
    return-void

    .line 1146
    :cond_1
    if-eqz p4, :cond_2

    .line 1147
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e0039

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0

    .line 1149
    :cond_2
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0e0094

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method public onTrimMemory(I)V
    .locals 2
    .parameter "level"

    .prologue
    .line 923
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;->onTrimMemory(I)V

    .line 924
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v0, v1, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    .line 925
    .local v0, adapter:Lco/vine/android/widget/GenericTimelineAdapter;
    if-eqz v0, :cond_0

    .line 926
    invoke-virtual {v0, p1}, Lco/vine/android/widget/GenericTimelineAdapter;->onTrimMemory(I)V

    .line 928
    :cond_0
    return-void
.end method

.method public onUnblockUserComplete(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 6
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "userUnblocked"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1057
    const/16 v1, 0xc8

    if-ne p2, v1, :cond_3

    .line 1058
    iget-object v4, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    if-nez p4, :cond_0

    move v1, v2

    :goto_0
    #setter for: Lco/vine/android/ProfileFragment;->mIsUserBlocked:Z
    invoke-static {v4, v1}, Lco/vine/android/ProfileFragment;->access$702(Lco/vine/android/ProfileFragment;Z)Z

    .line 1059
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->supportInvalidateOptionsMenu()V

    .line 1061
    if-eqz p4, :cond_2

    .line 1062
    invoke-direct {p0}, Lco/vine/android/ProfileFragment$ProfileListener;->isUsernameValid()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;
    invoke-static {v1}, Lco/vine/android/ProfileFragment;->access$200(Lco/vine/android/ProfileFragment;)Lco/vine/android/api/VineUser;

    move-result-object v1

    iget-object v0, v1, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    .line 1064
    .local v0, username:Ljava/lang/String;
    :goto_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v4, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v5, 0x7f0e01dd

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-virtual {v4, v5, v2}, Lco/vine/android/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1065
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v2, v2, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v3, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    #getter for: Lco/vine/android/ProfileFragment;->mUserId:J
    invoke-static {v3}, Lco/vine/android/ProfileFragment;->access$600(Lco/vine/android/ProfileFragment;)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lco/vine/android/client/AppController;->fetchUser(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 1072
    .end local v0           #username:Ljava/lang/String;
    :goto_2
    return-void

    :cond_0
    move v1, v3

    .line 1058
    goto :goto_0

    .line 1062
    :cond_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v4, 0x7f0e01df

    invoke-virtual {v1, v4}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 1067
    :cond_2
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v3, 0x7f0e01d7

    invoke-virtual {v2, v3}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_2

    .line 1070
    :cond_3
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    const v3, 0x7f0e01de

    invoke-virtual {v2, v3}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/vine/android/util/Util;->showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_2
.end method

.method public onUnlikePost(Ljava/lang/String;ILjava/lang/String;J)V
    .locals 2
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "postId"

    .prologue
    .line 1007
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    invoke-virtual {v1, p1}, Lco/vine/android/ProfileFragment;->removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;

    move-result-object v0

    .line 1008
    .local v0, req:Lco/vine/android/PendingRequest;
    if-eqz v0, :cond_0

    .line 1009
    const/16 v1, 0xc8

    if-eq p2, v1, :cond_0

    .line 1010
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v1, v1, Lco/vine/android/ProfileFragment;->mLikeCache:Lco/vine/android/LikeCache;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/LikeCache;->like(J)V

    .line 1011
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v1, v1, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v1, p4, p5}, Lco/vine/android/widget/GenericTimelineAdapter;->showLikedByMe(J)V

    .line 1012
    iget-object v1, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v1, v1, Lco/vine/android/ProfileFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 1015
    :cond_0
    return-void
.end method

.method public onVideoPathError(Lco/vine/android/util/video/VideoKey;Lco/vine/android/network/HttpResult;)V
    .locals 0
    .parameter "key"
    .parameter "result"

    .prologue
    .line 956
    return-void
.end method

.method public onVideoPathObtained(Ljava/util/HashMap;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/video/VideoKey;",
            "Lco/vine/android/util/video/UrlVideo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 950
    .local p1, videos:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/video/VideoKey;Lco/vine/android/util/video/UrlVideo;>;"
    iget-object v0, p0, Lco/vine/android/ProfileFragment$ProfileListener;->this$0:Lco/vine/android/ProfileFragment;

    iget-object v0, v0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/widget/GenericTimelineAdapter;->onVideoPathObtained(Ljava/util/HashMap;)V

    .line 951
    return-void
.end method
