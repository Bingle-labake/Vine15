.class public Lco/vine/android/util/Util;
.super Ljava/lang/Object;
.source "Util.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/util/Util$ContentType;
    }
.end annotation


# static fields
.field public static final CURSOR_INCREMENT:I = 0x14

.field public static final DATE_TIME_RFC1123:Ljava/text/SimpleDateFormat; = null

.field public static final DAY_MILLIS:J = 0x5265c00L

.field private static final DAY_MONTH_YEAR:Ljava/text/SimpleDateFormat; = null

.field public static final DECIMAL_FORMAT:Ljava/text/DecimalFormat; = null

.field public static final DECIMAL_FORMAT_SYMBOLS:Ljava/text/DecimalFormatSymbols; = null

.field public static final DEFAULT_PAGE_SIZE:I = 0xa

.field public static final GLOBAL_LIMIT:I = 0x190

.field public static final HOUR_MILLIS:J = 0x36ee80L

.field public static final HTTP_BAD_REQUEST:I = 0x190

.field public static final HTTP_NOT_FOUND:I = 0x194

.field public static final HTTP_OK:I = 0xc8

.field public static final HTTP_UNAUTHORIZED:I = 0x191

.field public static final IO_BUFFER_SIZE:I = 0x1000

.field public static final KB_BYTES:I = 0x400

.field public static final MARKER_COLON:C = ':'

.field public static final MARKER_QUOTES:C = '\"'

.field public static final MARKER_SEMI_COLON:C = ';'

.field public static final MAX_FOLLOW_REQUESTS:I = 0x5

.field public static final MB_BYTES:I = 0x100000

.field public static final MINUTE_MILLIS:J = 0xea60L

.field public static final MIN_PASSWORD_CHARS:I = 0x8

.field public static final MIN_USERNAME_CHARS:I = 0x3

.field public static final MONTH_MILLIS:J = 0x9ca41900L

.field private static final PATTERN_COMMENT:Ljava/util/regex/Pattern; = null

.field private static final PATTERN_POST:Ljava/util/regex/Pattern; = null

.field private static final PATTERN_USERNAME:Ljava/util/regex/Pattern; = null

.field public static final SECOND_MILLIS:J = 0x3e8L

.field public static final WEEK_MILLIS:J = 0x240c8400L

.field public static final YEAR_MILLIS:J = 0x757b12c00L

.field private static final numbersAndLetters:[C

.field public static final sRandom:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 93
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd MMM yy"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lco/vine/android/util/Util;->DAY_MONTH_YEAR:Ljava/text/SimpleDateFormat;

    .line 95
    new-instance v0, Ljava/text/DecimalFormat;

    invoke-direct {v0}, Ljava/text/DecimalFormat;-><init>()V

    sput-object v0, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    .line 96
    new-instance v0, Ljava/text/DecimalFormatSymbols;

    invoke-direct {v0}, Ljava/text/DecimalFormatSymbols;-><init>()V

    sput-object v0, Lco/vine/android/util/Util;->DECIMAL_FORMAT_SYMBOLS:Ljava/text/DecimalFormatSymbols;

    .line 122
    const-string v0, "<:\\s*?user\\s*?\\|\\s*?.*?:>([\\w\\s-]*?)<:>"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lco/vine/android/util/Util;->PATTERN_USERNAME:Ljava/util/regex/Pattern;

    .line 123
    const-string v0, "<:\\s*?post\\s*?\\|\\s*?.*?:>([\\w\\s]*?)<:>"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lco/vine/android/util/Util;->PATTERN_POST:Ljava/util/regex/Pattern;

    .line 125
    const-string v0, "\"(.+?)\\\\?\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lco/vine/android/util/Util;->PATTERN_COMMENT:Ljava/util/regex/Pattern;

    .line 130
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lco/vine/android/util/Util;->sRandom:Ljava/security/SecureRandom;

    .line 138
    const-string v0, "0123456789abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lco/vine/android/util/Util;->numbersAndLetters:[C

    .line 142
    new-instance v0, Lco/vine/android/util/SynchronizedDateFormat;

    const-string v1, "EEE, dd MMM yyyy HH:mm:ss zzz"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Lco/vine/android/util/SynchronizedDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lco/vine/android/util/Util;->DATE_TIME_RFC1123:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    return-void
.end method

.method public static adjustEntities(Ljava/util/ArrayList;Landroid/text/Editable;IZ)V
    .locals 11
    .parameter
    .parameter "contentSb"
    .parameter "offset"
    .parameter "xmlEntity"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;",
            "Landroid/text/Editable;",
            "IZ)V"
        }
    .end annotation

    .prologue
    .local p0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    const/4 v10, 0x1

    .line 740
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v7

    if-ge v4, v7, :cond_3

    .line 741
    invoke-interface {p1, v4}, Landroid/text/Editable;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 742
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/api/VineEntity;

    .line 743
    .local v3, entity:Lco/vine/android/api/VineEntity;
    iget-boolean v7, v3, Lco/vine/android/api/VineEntity;->adjusted:Z

    if-nez v7, :cond_0

    .line 746
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    add-int v6, v7, p2

    .line 747
    .local v6, startWithOffset:I
    iget v7, v3, Lco/vine/android/api/VineEntity;->end:I

    add-int v2, v7, p2

    .line 748
    .local v2, endWithOffset:I
    if-le v6, v4, :cond_0

    .line 749
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-ge v6, v7, :cond_1

    .line 750
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    add-int/lit8 v7, v7, 0x1

    iput v7, v3, Lco/vine/android/api/VineEntity;->start:I

    .line 752
    :cond_1
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-ge v2, v7, :cond_0

    .line 753
    iget v7, v3, Lco/vine/android/api/VineEntity;->end:I

    add-int/lit8 v7, v7, 0x1

    iput v7, v3, Lco/vine/android/api/VineEntity;->end:I

    goto :goto_1

    .line 740
    .end local v2           #endWithOffset:I
    .end local v3           #entity:Lco/vine/android/api/VineEntity;
    .end local v5           #i$:Ljava/util/Iterator;
    .end local v6           #startWithOffset:I
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 760
    :cond_3
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5       #i$:Ljava/util/Iterator;
    :cond_4
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/api/VineEntity;

    .line 761
    .restart local v3       #entity:Lco/vine/android/api/VineEntity;
    iget-boolean v7, v3, Lco/vine/android/api/VineEntity;->adjusted:Z

    if-nez v7, :cond_4

    .line 764
    invoke-virtual {v3}, Lco/vine/android/api/VineEntity;->isUserType()Z

    move-result v7

    if-eqz v7, :cond_b

    .line 765
    iget-object v7, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    if-nez v7, :cond_6

    .line 766
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 767
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Entity title is null, you should find out why!"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 769
    :cond_5
    iput-boolean v10, v3, Lco/vine/android/api/VineEntity;->adjusted:Z

    goto :goto_2

    .line 772
    :cond_6
    if-nez p3, :cond_9

    .line 773
    iget-object v7, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    .line 774
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 775
    .local v0, cStart:I
    const/4 v7, -0x1

    if-ne v0, v7, :cond_8

    .line 776
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    add-int/2addr v7, p2

    iput v7, v3, Lco/vine/android/api/VineEntity;->start:I

    .line 777
    iget v7, v3, Lco/vine/android/api/VineEntity;->end:I

    add-int/2addr v7, p2

    iput v7, v3, Lco/vine/android/api/VineEntity;->end:I

    .line 786
    .end local v0           #cStart:I
    :goto_3
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v7

    if-eqz v7, :cond_a

    .line 787
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    iget v8, v3, Lco/vine/android/api/VineEntity;->end:I

    iget-object v9, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-interface {p1, v7, v8, v9}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 795
    :goto_4
    iget v7, v3, Lco/vine/android/api/VineEntity;->end:I

    iget v8, v3, Lco/vine/android/api/VineEntity;->start:I

    sub-int/2addr v7, v8

    iget-object v8, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v7, v8

    sub-int/2addr p2, v7

    .line 796
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    iget-object v8, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    iput v7, v3, Lco/vine/android/api/VineEntity;->end:I

    .line 813
    :cond_7
    :goto_5
    iput-boolean v10, v3, Lco/vine/android/api/VineEntity;->adjusted:Z

    goto :goto_2

    .line 779
    .restart local v0       #cStart:I
    :cond_8
    iput v0, v3, Lco/vine/android/api/VineEntity;->start:I

    .line 780
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    iget-object v8, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    iput v7, v3, Lco/vine/android/api/VineEntity;->end:I

    goto :goto_3

    .line 783
    .end local v0           #cStart:I
    :cond_9
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    add-int/2addr v7, p2

    iput v7, v3, Lco/vine/android/api/VineEntity;->start:I

    .line 784
    iget v7, v3, Lco/vine/android/api/VineEntity;->end:I

    add-int/2addr v7, p2

    iput v7, v3, Lco/vine/android/api/VineEntity;->end:I

    goto :goto_3

    .line 790
    :cond_a
    :try_start_0
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    iget v8, v3, Lco/vine/android/api/VineEntity;->end:I

    iget-object v9, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-interface {p1, v7, v8, v9}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    .line 791
    :catch_0
    move-exception v1

    .line 792
    .local v1, e:Ljava/lang/IndexOutOfBoundsException;
    const-string v7, "Supressing IOOBE with replace"

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v1, v7, v8}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_4

    .line 797
    .end local v1           #e:Ljava/lang/IndexOutOfBoundsException;
    :cond_b
    invoke-virtual {v3}, Lco/vine/android/api/VineEntity;->isTagType()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 798
    iget-object v7, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    if-nez v7, :cond_d

    .line 799
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v7

    if-eqz v7, :cond_c

    .line 800
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Entity title is null, you should find out why!"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 802
    :cond_c
    iput-boolean v10, v3, Lco/vine/android/api/VineEntity;->adjusted:Z

    goto/16 :goto_2

    .line 805
    :cond_d
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "#"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    .line 806
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    add-int/2addr v7, p2

    iput v7, v3, Lco/vine/android/api/VineEntity;->start:I

    .line 807
    iget v7, v3, Lco/vine/android/api/VineEntity;->end:I

    add-int/2addr v7, p2

    iput v7, v3, Lco/vine/android/api/VineEntity;->end:I

    .line 808
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    iget v8, v3, Lco/vine/android/api/VineEntity;->end:I

    iget-object v9, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-interface {p1, v7, v8, v9}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 809
    iget v7, v3, Lco/vine/android/api/VineEntity;->end:I

    iget v8, v3, Lco/vine/android/api/VineEntity;->start:I

    sub-int/2addr v7, v8

    sub-int/2addr p2, v7

    .line 810
    iget-object v7, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr p2, v7

    .line 811
    iget v7, v3, Lco/vine/android/api/VineEntity;->start:I

    iget-object v8, v3, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    iput v7, v3, Lco/vine/android/api/VineEntity;->end:I

    goto/16 :goto_5

    .line 815
    .end local v3           #entity:Lco/vine/android/api/VineEntity;
    :cond_e
    return-void
.end method

.method public static cleanse(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "text"

    .prologue
    .line 721
    const-string v0, "\n"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static closeSilently(Ljava/io/Closeable;)V
    .locals 1
    .parameter "closeable"

    .prologue
    .line 146
    if-eqz p0, :cond_0

    .line 148
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    :cond_0
    :goto_0
    return-void

    .line 149
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static deleteFileRecursively(Ljava/io/File;)V
    .locals 6
    .parameter "file"

    .prologue
    .line 832
    if-eqz p0, :cond_1

    .line 833
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 834
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 835
    .local v2, files:[Ljava/io/File;
    if-eqz v2, :cond_1

    .line 836
    move-object v0, v2

    .local v0, arr$:[Ljava/io/File;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 837
    .local v1, f:Ljava/io/File;
    invoke-static {v1}, Lco/vine/android/util/Util;->deleteFileRecursively(Ljava/io/File;)V

    .line 836
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 841
    .end local v0           #arr$:[Ljava/io/File;
    .end local v1           #f:Ljava/io/File;
    .end local v2           #files:[Ljava/io/File;
    .end local v3           #i$:I
    .end local v4           #len$:I
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 844
    :cond_1
    return-void
.end method

.method public static forceCustomLocale(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 1054
    invoke-static {p0}, Lco/vine/android/util/Util;->getCustomLocale(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lco/vine/android/util/Util;->forceCustomLocale(Landroid/content/Context;Ljava/util/Locale;Z)V

    .line 1055
    return-void
.end method

.method public static forceCustomLocale(Landroid/content/Context;Ljava/util/Locale;Z)V
    .locals 3
    .parameter "context"
    .parameter "locale"
    .parameter "updateResources"

    .prologue
    .line 1041
    if-eqz p1, :cond_0

    .line 1042
    invoke-static {p1}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 1043
    invoke-static {p0}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v2

    invoke-virtual {v2}, Lco/vine/android/client/VineAPI;->refreshLocale()V

    .line 1044
    if-eqz p2, :cond_0

    .line 1045
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1046
    .local v1, resources:Landroid/content/res/Resources;
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 1047
    .local v0, config:Landroid/content/res/Configuration;
    iput-object p1, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 1048
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 1051
    .end local v0           #config:Landroid/content/res/Configuration;
    .end local v1           #resources:Landroid/content/res/Resources;
    :cond_0
    return-void
.end method

.method public static formatFileSize(Landroid/content/res/Resources;J)Ljava/lang/String;
    .locals 11
    .parameter "res"
    .parameter "bytes"

    .prologue
    const-wide/32 v9, 0xf4240

    const-wide/16 v7, 0x3e8

    const-wide/16 v4, 0x1

    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 891
    sget-object v1, Lco/vine/android/util/Util;->DECIMAL_FORMAT_SYMBOLS:Ljava/text/DecimalFormatSymbols;

    const v2, 0x7f0e0109

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/text/DecimalFormatSymbols;->setGroupingSeparator(C)V

    .line 893
    const/4 v0, 0x3

    .line 895
    .local v0, groupingSize:I
    const v1, 0x7f0e0104

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 898
    :goto_0
    sget-object v1, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    invoke-virtual {v1, v0}, Ljava/text/DecimalFormat;->setGroupingSize(I)V

    .line 899
    sget-object v1, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    invoke-virtual {v1, v3}, Ljava/text/DecimalFormat;->setGroupingUsed(Z)V

    .line 900
    sget-object v1, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    sget-object v2, Lco/vine/android/util/Util;->DECIMAL_FORMAT_SYMBOLS:Ljava/text/DecimalFormatSymbols;

    invoke-virtual {v1, v2}, Ljava/text/DecimalFormat;->setDecimalFormatSymbols(Ljava/text/DecimalFormatSymbols;)V

    .line 901
    const-wide/32 v1, 0x3b9aca00

    div-long v1, p1, v1

    cmp-long v1, v1, v4

    if-ltz v1, :cond_0

    .line 902
    const v1, 0x7f0e0103

    new-array v2, v3, [Ljava/lang/Object;

    sget-object v3, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    const-wide/32 v4, 0x3b9aca00

    div-long v4, p1, v4

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {p0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 908
    :goto_1
    return-object v1

    .line 903
    :cond_0
    div-long v1, p1, v9

    cmp-long v1, v1, v4

    if-ltz v1, :cond_1

    .line 904
    const v1, 0x7f0e0106

    new-array v2, v3, [Ljava/lang/Object;

    sget-object v3, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    div-long v4, p1, v9

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {p0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 905
    :cond_1
    div-long v1, p1, v7

    cmp-long v1, v1, v4

    if-ltz v1, :cond_2

    .line 906
    const v1, 0x7f0e0105

    new-array v2, v3, [Ljava/lang/Object;

    sget-object v3, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    div-long v4, p1, v7

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {p0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 908
    :cond_2
    const v1, 0x7f0e0101

    new-array v2, v3, [Ljava/lang/Object;

    sget-object v3, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    invoke-virtual {v3, p1, p2}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {p0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 896
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static fromByteArray([B)Ljava/lang/Object;
    .locals 5
    .parameter "bytes"

    .prologue
    const/4 v4, 0x0

    .line 617
    if-nez p0, :cond_0

    .line 631
    :goto_0
    return-object v4

    .line 620
    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 621
    .local v0, bis:Ljava/io/ByteArrayInputStream;
    const/4 v2, 0x0

    .line 623
    .local v2, ois:Ljava/io/ObjectInputStream;
    :try_start_0
    new-instance v3, Ljava/io/ObjectInputStream;

    invoke-direct {v3, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 624
    .end local v2           #ois:Ljava/io/ObjectInputStream;
    .local v3, ois:Ljava/io/ObjectInputStream;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v4

    .line 630
    invoke-static {v3}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 631
    invoke-static {v0}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_0

    .line 625
    .end local v3           #ois:Ljava/io/ObjectInputStream;
    .restart local v2       #ois:Ljava/io/ObjectInputStream;
    :catch_0
    move-exception v1

    .line 630
    .local v1, e:Ljava/io/IOException;
    :goto_1
    invoke-static {v2}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 631
    invoke-static {v0}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_0

    .line 627
    .end local v1           #e:Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 630
    .local v1, e:Ljava/lang/ClassNotFoundException;
    :goto_2
    invoke-static {v2}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 631
    invoke-static {v0}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_0

    .line 630
    .end local v1           #e:Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v4

    :goto_3
    invoke-static {v2}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 631
    invoke-static {v0}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    throw v4

    .line 630
    .end local v2           #ois:Ljava/io/ObjectInputStream;
    .restart local v3       #ois:Ljava/io/ObjectInputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3           #ois:Ljava/io/ObjectInputStream;
    .restart local v2       #ois:Ljava/io/ObjectInputStream;
    goto :goto_3

    .line 627
    .end local v2           #ois:Ljava/io/ObjectInputStream;
    .restart local v3       #ois:Ljava/io/ObjectInputStream;
    :catch_2
    move-exception v1

    move-object v2, v3

    .end local v3           #ois:Ljava/io/ObjectInputStream;
    .restart local v2       #ois:Ljava/io/ObjectInputStream;
    goto :goto_2

    .line 625
    .end local v2           #ois:Ljava/io/ObjectInputStream;
    .restart local v3       #ois:Ljava/io/ObjectInputStream;
    :catch_3
    move-exception v1

    move-object v2, v3

    .end local v3           #ois:Ljava/io/ObjectInputStream;
    .restart local v2       #ois:Ljava/io/ObjectInputStream;
    goto :goto_1
.end method

.method public static getAddressJson(Landroid/content/ContentResolver;)Ljava/lang/String;
    .locals 13
    .parameter "resolver"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 584
    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    move-object v0, p0

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 587
    .local v7, cursor:Landroid/database/Cursor;
    new-instance v8, Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-direct {v8}, Lcom/fasterxml/jackson/core/JsonFactory;-><init>()V

    .line 588
    .local v8, jf:Lcom/fasterxml/jackson/core/JsonFactory;
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 589
    .local v6, ba:Ljava/io/ByteArrayOutputStream;
    move-object v11, v6

    .line 590
    .local v11, os:Ljava/io/OutputStream;
    invoke-virtual {v8, v11}, Lcom/fasterxml/jackson/core/JsonFactory;->createJsonGenerator(Ljava/io/OutputStream;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v9

    .line 592
    .local v9, jg:Lcom/fasterxml/jackson/core/JsonGenerator;
    if-eqz v7, :cond_2

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 593
    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 594
    :cond_0
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 595
    const-string v0, "display_name"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 599
    .local v10, name:Ljava/lang/String;
    const-string v0, "data1"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 602
    .local v12, phone:Ljava/lang/String;
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 603
    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 604
    const-string v0, "name"

    invoke-virtual {v9, v0, v10}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 605
    const-string v0, "phoneNumber"

    invoke-virtual {v9, v0, v12}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 606
    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    goto :goto_0

    .line 609
    .end local v10           #name:Ljava/lang/String;
    .end local v12           #phone:Ljava/lang/String;
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 610
    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 611
    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V

    .line 613
    :cond_2
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCacheDir(Landroid/content/Context;)Ljava/io/File;
    .locals 1
    .parameter "context"

    .prologue
    .line 286
    invoke-static {p0}, Lco/vine/android/util/Util;->getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 287
    .local v0, externalCacheDir:Ljava/io/File;
    if-eqz v0, :cond_0

    .line 290
    .end local v0           #externalCacheDir:Ljava/io/File;
    :goto_0
    return-object v0

    .restart local v0       #externalCacheDir:Ljava/io/File;
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method public static getCacheSize(Landroid/content/Context;)J
    .locals 7
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/VineException;
        }
    .end annotation

    .prologue
    .line 853
    const-wide/16 v3, 0x0

    .line 854
    .local v3, size:J
    :try_start_0
    invoke-static {p0}, Lco/vine/android/util/Util;->getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 856
    .local v0, cacheDir:Ljava/io/File;
    if-eqz v0, :cond_0

    .line 857
    invoke-static {v0}, Lorg/apache/commons/io/FileUtils;->sizeOfDirectory(Ljava/io/File;)J

    move-result-wide v5

    add-long/2addr v3, v5

    .line 860
    :cond_0
    if-eqz v0, :cond_1

    .line 861
    invoke-static {p0}, Lco/vine/android/util/Util;->getExternalFilesDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 864
    :cond_1
    invoke-static {v0}, Lorg/apache/commons/io/FileUtils;->sizeOfDirectory(Ljava/io/File;)J

    move-result-wide v5

    add-long/2addr v3, v5

    .line 866
    const/4 v5, 0x1

    invoke-static {v5}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseName(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 869
    .local v2, f:Ljava/io/File;
    if-eqz v2, :cond_2

    .line 870
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v5

    add-long/2addr v3, v5

    .line 873
    :cond_2
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_4

    .line 882
    .end local v3           #size:J
    :cond_3
    :goto_0
    return-wide v3

    .line 879
    .restart local v3       #size:J
    :cond_4
    const-wide/32 v5, 0x7a120

    cmp-long v5, v3, v5

    if-gtz v5, :cond_3

    .line 882
    const-wide/16 v3, 0x0

    goto :goto_0

    .line 885
    .end local v0           #cacheDir:Ljava/io/File;
    .end local v2           #f:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 886
    .local v1, e:Ljava/lang/Throwable;
    new-instance v5, Lco/vine/android/VineException;

    invoke-direct {v5, v1}, Lco/vine/android/VineException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public static getCustomLocale(Landroid/content/Context;)Ljava/util/Locale;
    .locals 7
    .parameter "context"

    .prologue
    const/4 v4, 0x0

    .line 1021
    invoke-static {p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 1022
    .local v3, prefs:Landroid/content/SharedPreferences;
    const-string v5, "pref_custom_locale_enabled"

    const/4 v6, 0x0

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1023
    const-string v5, "pref_custom_locale"

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1024
    .local v2, localeCode:Ljava/lang/String;
    const-string v5, "pref_custom_locale_country"

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1025
    .local v0, countryCode:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1027
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1028
    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v2, v0}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1032
    .local v1, locale:Ljava/util/Locale;
    :goto_0
    invoke-virtual {v1}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1037
    .end local v0           #countryCode:Ljava/lang/String;
    .end local v1           #locale:Ljava/util/Locale;
    .end local v2           #localeCode:Ljava/lang/String;
    :goto_1
    return-object v1

    .line 1030
    .restart local v0       #countryCode:Ljava/lang/String;
    .restart local v2       #localeCode:Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    .restart local v1       #locale:Ljava/util/Locale;
    goto :goto_0

    .end local v0           #countryCode:Ljava/lang/String;
    .end local v1           #locale:Ljava/util/Locale;
    .end local v2           #localeCode:Ljava/lang/String;
    :cond_1
    move-object v1, v4

    .line 1037
    goto :goto_1
.end method

.method public static getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2
    .parameter "context"

    .prologue
    .line 951
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_preferences"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public static getDisplaySize(Landroid/view/Display;)Landroid/graphics/Point;
    .locals 4
    .parameter "display"

    .prologue
    .line 1008
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_0

    .line 1009
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 1010
    .local v0, p:Landroid/graphics/Point;
    invoke-virtual {p0, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    move-object v1, v0

    .line 1016
    .end local v0           #p:Landroid/graphics/Point;
    .local v1, p:Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 1013
    .end local v1           #p:Ljava/lang/Object;
    :cond_0
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 1014
    .restart local v0       #p:Landroid/graphics/Point;
    invoke-virtual {p0}, Landroid/view/Display;->getWidth()I

    move-result v2

    iput v2, v0, Landroid/graphics/Point;->x:I

    .line 1015
    invoke-virtual {p0}, Landroid/view/Display;->getHeight()I

    move-result v2

    iput v2, v0, Landroid/graphics/Point;->y:I

    move-object v1, v0

    .line 1016
    .restart local v1       #p:Ljava/lang/Object;
    goto :goto_0
.end method

.method public static getEmailMessageId()I
    .locals 1

    .prologue
    .line 979
    invoke-static {}, Lco/vine/android/util/BuildUtil;->getMarket()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 985
    const v0, 0x7f0e00b5

    :goto_0
    return v0

    .line 981
    :pswitch_0
    const v0, 0x7f0e00b6

    goto :goto_0

    .line 979
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public static getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;
    .locals 3
    .parameter "c"
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    .line 297
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v2, 0x7

    if-le v1, v2, :cond_1

    .line 298
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    .line 307
    :cond_0
    :goto_0
    return-object v0

    .line 302
    :cond_1
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/Android/data/co.vine.android/cache"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 304
    .local v0, path:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v1

    if-nez v1, :cond_0

    .line 307
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getExternalFilesDir(Landroid/content/Context;)Ljava/io/File;
    .locals 2
    .parameter "c"
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    .line 354
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x7

    if-le v0, v1, :cond_0

    .line 355
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 357
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method public static getFileSize(Landroid/content/Context;Landroid/net/Uri;)F
    .locals 4
    .parameter "context"
    .parameter "uri"

    .prologue
    .line 369
    const/4 v1, 0x0

    .line 371
    .local v1, is:Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    .line 372
    invoke-virtual {v1}, Ljava/io/InputStream;->available()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x4480

    div-float/2addr v2, v3

    .line 376
    invoke-static {v1}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    :goto_0
    return v2

    .line 373
    :catch_0
    move-exception v0

    .line 374
    .local v0, e:Ljava/io/IOException;
    const/4 v2, 0x0

    .line 376
    invoke-static {v1}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_0

    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v2

    invoke-static {v1}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    throw v2
.end method

.method public static getFilesDir(Landroid/content/Context;)Ljava/io/File;
    .locals 1
    .parameter "context"

    .prologue
    .line 344
    invoke-static {p0}, Lco/vine/android/util/Util;->getExternalFilesDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 345
    .local v0, f:Ljava/io/File;
    if-eqz v0, :cond_0

    .line 348
    .end local v0           #f:Ljava/io/File;
    :goto_0
    return-object v0

    .restart local v0       #f:Ljava/io/File;
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method public static getLocale()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1082
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 1083
    .local v0, current:Ljava/util/Locale;
    sget-object v1, Ljava/util/Locale;->TRADITIONAL_CHINESE:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Ljava/util/Locale;->TRADITIONAL_CHINESE:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    sget-object v1, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1087
    :cond_1
    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1089
    :goto_0
    return-object v1

    :cond_2
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getNextCursorSize(I)I
    .locals 1
    .parameter "currentSize"

    .prologue
    .line 939
    add-int/lit8 v0, p0, 0x14

    return v0
.end method

.method public static getRelativeTimeString(Landroid/content/res/Resources;JZ)Ljava/lang/String;
    .locals 13
    .parameter "res"
    .parameter "timestamp"
    .parameter "verbose"

    .prologue
    .line 489
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long v3, v9, p1

    .line 490
    .local v3, diff:J
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-ltz v9, :cond_9

    .line 491
    const-wide/32 v9, 0xea60

    cmp-long v9, v3, v9

    if-gez v9, :cond_1

    .line 492
    const-wide/16 v9, 0x3e8

    div-long v9, v3, v9

    long-to-int v8, v9

    .line 493
    .local v8, secs:I
    if-eqz p3, :cond_0

    const v9, 0x7f0d000c

    :goto_0
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {p0, v9, v8, v10}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 527
    .end local v8           #secs:I
    :goto_1
    return-object v9

    .line 493
    .restart local v8       #secs:I
    :cond_0
    const v9, 0x7f0d000b

    goto :goto_0

    .line 495
    .end local v8           #secs:I
    :cond_1
    const-wide/32 v9, 0x36ee80

    cmp-long v9, v3, v9

    if-gez v9, :cond_3

    .line 496
    const-wide/32 v9, 0xea60

    div-long v9, v3, v9

    long-to-int v6, v9

    .line 497
    .local v6, mins:I
    if-eqz p3, :cond_2

    const v9, 0x7f0d000a

    :goto_2
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {p0, v9, v6, v10}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    :cond_2
    const v9, 0x7f0d0009

    goto :goto_2

    .line 499
    .end local v6           #mins:I
    :cond_3
    const-wide/32 v9, 0x5265c00

    cmp-long v9, v3, v9

    if-gez v9, :cond_5

    .line 500
    const-wide/32 v9, 0x36ee80

    div-long v9, v3, v9

    long-to-int v5, v9

    .line 501
    .local v5, hours:I
    if-eqz p3, :cond_4

    const v9, 0x7f0d0008

    :goto_3
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {p0, v9, v5, v10}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    :cond_4
    const v9, 0x7f0d0007

    goto :goto_3

    .line 503
    .end local v5           #hours:I
    :cond_5
    const-wide/32 v9, 0x240c8400

    cmp-long v9, v3, v9

    if-gez v9, :cond_7

    .line 504
    const-wide/32 v9, 0x5265c00

    div-long v9, v3, v9

    long-to-int v2, v9

    .line 505
    .local v2, days:I
    if-eqz p3, :cond_6

    const v9, 0x7f0d0006

    :goto_4
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {p0, v9, v2, v10}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    :cond_6
    const v9, 0x7f0d0005

    goto :goto_4

    .line 509
    .end local v2           #days:I
    :cond_7
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 511
    .local v7, now:Ljava/util/Calendar;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 512
    .local v0, c:Ljava/util/Calendar;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 513
    .local v1, d:Ljava/util/Date;
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 515
    const/4 v9, 0x1

    invoke-virtual {v7, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    const/4 v10, 0x1

    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    if-ne v9, v10, :cond_8

    .line 517
    sget-object v9, Lco/vine/android/util/Util;->DAY_MONTH_YEAR:Ljava/text/SimpleDateFormat;

    const v10, 0x7f0e0088

    invoke-virtual {p0, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    .line 522
    :goto_5
    sget-object v9, Lco/vine/android/util/Util;->DAY_MONTH_YEAR:Ljava/text/SimpleDateFormat;

    invoke-virtual {v9, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_1

    .line 520
    :cond_8
    sget-object v9, Lco/vine/android/util/Util;->DAY_MONTH_YEAR:Ljava/text/SimpleDateFormat;

    const v10, 0x7f0e0087

    invoke-virtual {p0, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    goto :goto_5

    .line 526
    .end local v0           #c:Ljava/util/Calendar;
    .end local v1           #d:Ljava/util/Date;
    .end local v7           #now:Ljava/util/Calendar;
    :cond_9
    sget-object v9, Lco/vine/android/util/Util;->DAY_MONTH_YEAR:Ljava/text/SimpleDateFormat;

    const v10, 0x7f0e0087

    invoke-virtual {p0, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    .line 527
    sget-object v9, Lco/vine/android/util/Util;->DAY_MONTH_YEAR:Ljava/text/SimpleDateFormat;

    new-instance v10, Ljava/util/Date;

    invoke-direct {v10, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v9, v10}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_1
.end method

.method public static getShareProfileMessageId()I
    .locals 1

    .prologue
    .line 991
    invoke-static {}, Lco/vine/android/util/BuildUtil;->getMarket()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 997
    const v0, 0x7f0e0198

    :goto_0
    return v0

    .line 993
    :pswitch_0
    const v0, 0x7f0e0199

    goto :goto_0

    .line 991
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public static getSharedPrefs(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;
    .locals 2
    .parameter "context"
    .parameter "name"

    .prologue
    .line 962
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_preferences_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public static getSmsMessageId()I
    .locals 1

    .prologue
    .line 967
    invoke-static {}, Lco/vine/android/util/BuildUtil;->getMarket()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 973
    const v0, 0x7f0e00b8

    :goto_0
    return v0

    .line 969
    :pswitch_0
    const v0, 0x7f0e00b9

    goto :goto_0

    .line 967
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public static getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;
    .locals 12
    .parameter "span"
    .parameter "text"
    .parameter "marker"

    .prologue
    const/4 v11, -0x1

    .line 189
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 190
    .local v6, start:I
    if-ne v6, v11, :cond_0

    .line 191
    new-instance v5, Landroid/text/SpannableString;

    invoke-direct {v5, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 230
    :goto_0
    return-object v5

    .line 193
    :cond_0
    add-int/lit8 v7, v6, 0x1

    invoke-virtual {p1, p2, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 194
    .local v0, end:I
    if-ne v0, v11, :cond_1

    .line 195
    new-instance v5, Landroid/text/SpannableString;

    invoke-direct {v5, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 198
    :cond_1
    array-length v1, p0

    .line 199
    .local v1, maxSpans:I
    const/4 v4, 0x0

    .line 200
    .local v4, spanIndex:I
    const/4 v2, 0x0

    .line 201
    .local v2, next:I
    const/4 v3, 0x0

    .line 202
    .local v3, offset:I
    new-instance v5, Landroid/text/SpannableStringBuilder;

    invoke-direct {v5}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 205
    .local v5, ssb:Landroid/text/SpannableStringBuilder;
    :cond_2
    invoke-virtual {p1, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 208
    add-int/lit8 v7, v6, 0x1

    invoke-virtual {p1, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 210
    aget-object v7, p0, v4

    sub-int v8, v6, v3

    sub-int v9, v0, v3

    add-int/lit8 v9, v9, -0x1

    const/16 v10, 0x21

    invoke-static {v5, v7, v8, v9, v10}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 213
    add-int/lit8 v4, v4, 0x1

    .line 214
    add-int/lit8 v2, v0, 0x1

    .line 215
    if-lt v4, v1, :cond_4

    .line 228
    :cond_3
    :goto_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_0

    .line 219
    :cond_4
    invoke-virtual {p1, p2, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    .line 220
    if-eq v6, v11, :cond_5

    .line 221
    add-int/lit8 v7, v6, 0x1

    invoke-virtual {p1, p2, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 223
    add-int/lit8 v3, v3, 0x2

    .line 225
    :cond_5
    if-eq v6, v11, :cond_3

    if-ne v0, v11, :cond_2

    goto :goto_1
.end method

.method public static getTempFile(Landroid/content/Context;)Ljava/io/File;
    .locals 1
    .parameter "context"

    .prologue
    .line 275
    const/4 v0, 0x6

    invoke-static {p0, v0}, Lco/vine/android/util/Util;->getTempFile(Landroid/content/Context;I)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getTempFile(Landroid/content/Context;I)Ljava/io/File;
    .locals 3
    .parameter "context"
    .parameter "fileNameSize"

    .prologue
    .line 258
    invoke-static {p0}, Lco/vine/android/util/Util;->getCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 259
    .local v0, cacheDir:Ljava/io/File;
    if-eqz v0, :cond_0

    .line 260
    new-instance v1, Ljava/io/File;

    invoke-static {p1}, Lco/vine/android/util/Util;->randomString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 262
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getTimeInMsFromString(Ljava/lang/String;Ljava/lang/String;)J
    .locals 9
    .parameter "time"
    .parameter "format"

    .prologue
    .line 539
    new-instance v3, Ljava/text/SimpleDateFormat;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v3, p1, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 540
    .local v3, sdf:Ljava/text/SimpleDateFormat;
    const-wide/16 v4, 0x0

    .line 542
    .local v4, timestamp:J
    :try_start_0
    invoke-virtual {v3, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 543
    .local v0, date:Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 544
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    .line 545
    .local v6, tz:Ljava/util/TimeZone;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 546
    .local v1, now:Ljava/util/Date;
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/util/TimeZone;->getOffset(J)I
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 547
    .local v2, offsetFromUtc:I
    int-to-long v7, v2

    add-long/2addr v4, v7

    .line 550
    .end local v0           #date:Ljava/util/Date;
    .end local v1           #now:Ljava/util/Date;
    .end local v2           #offsetFromUtc:I
    .end local v6           #tz:Ljava/util/TimeZone;
    :goto_0
    return-wide v4

    .line 548
    :catch_0
    move-exception v7

    goto :goto_0
.end method

.method public static getUsernameFromActivity(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "body"

    .prologue
    .line 574
    sget-object v1, Lco/vine/android/util/Util;->PATTERN_USERNAME:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 575
    .local v0, m:Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 576
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 578
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getVersionName(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 715
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 716
    .local v1, packageName:Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 717
    .local v0, pInfo:Landroid/content/pm/PackageInfo;
    iget-object v2, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object v2
.end method

.method public static isDefaultAvatarUrl(Ljava/lang/String;)Z
    .locals 1
    .parameter "url"

    .prologue
    .line 396
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "default.png"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isIntentAvailable(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .parameter "context"
    .parameter "action"

    .prologue
    .line 241
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 242
    .local v2, packageManager:Landroid/content/pm/PackageManager;
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 243
    .local v0, intent:Landroid/content/Intent;
    const/high16 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 245
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static isPopularTimeline(I)Z
    .locals 1
    .parameter "groupType"

    .prologue
    .line 932
    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    const/16 v0, 0xb

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isUsEnglishLocale()Z
    .locals 2

    .prologue
    .line 1058
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 1059
    .local v0, code:Ljava/lang/String;
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public static isXauth2FactorError(Ltwitter4j/TwitterException;)Z
    .locals 2
    .parameter "e"

    .prologue
    .line 1003
    invoke-virtual {p0}, Ltwitter4j/TwitterException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 1004
    .local v0, message:Ljava/lang/String;
    const-string v1, "231"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "User must verify login"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static md5Digest(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "msg"

    .prologue
    .line 463
    :try_start_0
    const-string v9, "MD5"

    invoke-static {v9}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v8

    .line 464
    .local v8, messageDigest:Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v7

    .line 465
    .local v7, md5bytes:[B
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 466
    .local v2, hexString:Ljava/lang/StringBuilder;
    move-object v0, v7

    .local v0, arr$:[B
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v5, :cond_1

    aget-byte v6, v0, v3

    .line 467
    .local v6, md5byte:B
    and-int/lit16 v9, v6, 0xff

    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 468
    .local v1, hex:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x2

    if-ge v9, v10, :cond_0

    .line 469
    const/16 v9, 0x30

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 471
    :cond_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 475
    .end local v0           #arr$:[B
    .end local v1           #hex:Ljava/lang/String;
    .end local v2           #hexString:Ljava/lang/StringBuilder;
    .end local v3           #i$:I
    .end local v5           #len$:I
    .end local v6           #md5byte:B
    .end local v7           #md5bytes:[B
    .end local v8           #messageDigest:Ljava/security/MessageDigest;
    :catch_0
    move-exception v4

    .line 476
    .local v4, ignore:Ljava/security/NoSuchAlgorithmException;
    const/4 v9, 0x0

    .end local v4           #ignore:Ljava/security/NoSuchAlgorithmException;
    :goto_2
    return-object v9

    .line 474
    .restart local v0       #arr$:[B
    .restart local v2       #hexString:Ljava/lang/StringBuilder;
    .restart local v3       #i$:I
    .restart local v5       #len$:I
    .restart local v7       #md5bytes:[B
    .restart local v8       #messageDigest:Ljava/security/MessageDigest;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    goto :goto_2
.end method

.method public static numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;
    .locals 13
    .parameter "res"
    .parameter "number"

    .prologue
    .line 647
    const v5, 0x7f0e010a

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x4

    if-ne v5, v6, :cond_0

    const/4 v4, 0x1

    .line 650
    .local v4, tenThousands:Z
    :goto_0
    const v5, 0x7f0e0107

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/16 v6, 0x8

    if-ne v5, v6, :cond_1

    const/4 v1, 0x1

    .line 652
    .local v1, hundredMillions:Z
    :goto_1
    const/4 v0, 0x3

    .line 654
    .local v0, groupingSeperatorSize:I
    const v5, 0x7f0e0104

    :try_start_0
    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 659
    :goto_2
    sget-object v5, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    invoke-virtual {v5, v0}, Ljava/text/DecimalFormat;->setGroupingSize(I)V

    .line 660
    sget-object v5, Lco/vine/android/util/Util;->DECIMAL_FORMAT_SYMBOLS:Ljava/text/DecimalFormatSymbols;

    const v6, 0x7f0e0109

    invoke-virtual {p0, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/text/DecimalFormatSymbols;->setGroupingSeparator(C)V

    .line 662
    sget-object v5, Lco/vine/android/util/Util;->DECIMAL_FORMAT_SYMBOLS:Ljava/text/DecimalFormatSymbols;

    const v6, 0x7f0e0102

    invoke-virtual {p0, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/text/DecimalFormatSymbols;->setDecimalSeparator(C)V

    .line 665
    sget-object v5, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/text/DecimalFormat;->setGroupingUsed(Z)V

    .line 666
    sget-object v5, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    sget-object v6, Lco/vine/android/util/Util;->DECIMAL_FORMAT_SYMBOLS:Ljava/text/DecimalFormatSymbols;

    invoke-virtual {v5, v6}, Ljava/text/DecimalFormat;->setDecimalFormatSymbols(Ljava/text/DecimalFormatSymbols;)V

    .line 669
    sget-object v5, Ljava/util/Locale;->KOREA:Ljava/util/Locale;

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 670
    sget-object v5, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    int-to-long v6, p1

    invoke-virtual {v5, v6, v7}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    .line 687
    :goto_3
    return-object v5

    .line 647
    .end local v0           #groupingSeperatorSize:I
    .end local v1           #hundredMillions:Z
    .end local v4           #tenThousands:Z
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 650
    .restart local v4       #tenThousands:Z
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 674
    .restart local v0       #groupingSeperatorSize:I
    .restart local v1       #hundredMillions:Z
    :cond_2
    int-to-double v5, p1

    const-wide v7, 0x412e848000000000L

    div-double v2, v5, v7

    .local v2, n:D
    const-wide/high16 v5, 0x3ff0

    cmpl-double v5, v2, v5

    if-ltz v5, :cond_4

    .line 675
    if-eqz v1, :cond_3

    .line 676
    const-wide/high16 v5, 0x4059

    div-double/2addr v2, v5

    .line 678
    :cond_3
    const v5, 0x7f0e0108

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    sget-object v8, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    const-wide/high16 v9, 0x4024

    mul-double/2addr v9, v2

    invoke-static {v9, v10}, Ljava/lang/Math;->floor(D)D

    move-result-wide v9

    const-wide/high16 v11, 0x4024

    div-double/2addr v9, v11

    invoke-virtual {v8, v9, v10}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {p0, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 680
    :cond_4
    int-to-double v5, p1

    const-wide v7, 0x40c3880000000000L

    div-double v2, v5, v7

    const-wide/high16 v5, 0x3ff0

    cmpl-double v5, v2, v5

    if-ltz v5, :cond_6

    .line 681
    if-eqz v4, :cond_5

    .line 682
    const-wide/high16 v5, 0x4024

    div-double/2addr v2, v5

    .line 684
    :cond_5
    const v5, 0x7f0e010b

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    sget-object v8, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    const-wide/high16 v9, 0x4059

    mul-double/2addr v9, v2

    invoke-static {v9, v10}, Ljava/lang/Math;->floor(D)D

    move-result-wide v9

    const-wide/high16 v11, 0x4024

    div-double/2addr v9, v11

    invoke-virtual {v8, v9, v10}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {p0, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 687
    :cond_6
    sget-object v5, Lco/vine/android/util/Util;->DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    int-to-long v6, p1

    invoke-virtual {v5, v6, v7}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 656
    .end local v2           #n:D
    :catch_0
    move-exception v5

    goto/16 :goto_2
.end method

.method public static parseURI(Ljava/lang/String;)Ljava/net/URI;
    .locals 6
    .parameter "uri"

    .prologue
    const/4 v4, 0x0

    .line 444
    :try_start_0
    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 458
    :goto_0
    return-object v3

    .line 445
    :catch_0
    move-exception v3

    .line 448
    const/16 v3, 0x3a

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 449
    .local v0, colonIndex:I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v0, v3, :cond_0

    .line 450
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 451
    .local v1, scheme:Ljava/lang/String;
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 453
    .local v2, ssp:Ljava/lang/String;
    :try_start_1
    new-instance v3, Ljava/net/URI;

    const/4 v5, 0x0

    invoke-direct {v3, v1, v2, v5}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 454
    :catch_1
    move-exception v3

    .end local v1           #scheme:Ljava/lang/String;
    .end local v2           #ssp:Ljava/lang/String;
    :cond_0
    move-object v3, v4

    .line 458
    goto :goto_0
.end method

.method public static randomString(I)Ljava/lang/String;
    .locals 5
    .parameter "length"

    .prologue
    .line 168
    const/4 v2, 0x1

    if-ge p0, v2, :cond_0

    .line 169
    const/4 v2, 0x0

    .line 176
    :goto_0
    return-object v2

    .line 172
    :cond_0
    new-array v1, p0, [C

    .line 173
    .local v1, randBuffer:[C
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 174
    sget-object v2, Lco/vine/android/util/Util;->numbersAndLetters:[C

    sget-object v3, Lco/vine/android/util/Util;->sRandom:Ljava/security/SecureRandom;

    const/16 v4, 0x47

    invoke-virtual {v3, v4}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v3

    aget-char v2, v2, v3

    aput-char v2, v1, v0

    .line 173
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 176
    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    goto :goto_0
.end method

.method public static readFullyWriteTo(Ljava/io/InputStream;Ljava/io/OutputStream;I)I
    .locals 4
    .parameter "is"
    .parameter "os"
    .parameter "bufferSize"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    new-array v0, p2, [B

    .line 326
    .local v0, buf:[B
    const/4 v2, 0x0

    .line 327
    .local v2, totalBytes:I
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, bytesRead:I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 328
    if-eqz p1, :cond_0

    .line 329
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 331
    :cond_0
    add-int/2addr v2, v1

    goto :goto_0

    .line 333
    :cond_1
    return v2
.end method

.method public static removeCache(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 818
    invoke-static {p0}, Lco/vine/android/util/Util;->getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 819
    .local v0, dir:Ljava/io/File;
    if-nez v0, :cond_1

    .line 829
    :cond_0
    :goto_0
    return-void

    .line 822
    :cond_1
    invoke-static {v0}, Lco/vine/android/util/Util;->deleteFileRecursively(Ljava/io/File;)V

    .line 824
    invoke-static {p0}, Lco/vine/android/util/Util;->getExternalFilesDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 825
    if-eqz v0, :cond_0

    .line 828
    invoke-static {v0}, Lco/vine/android/util/Util;->deleteFileRecursively(Ljava/io/File;)V

    goto :goto_0
.end method

.method public static restartApp(Landroid/content/Context;)V
    .locals 8
    .parameter "context"

    .prologue
    const/4 v7, 0x0

    .line 1068
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 1070
    .local v1, launchIntent:Landroid/content/Intent;
    const-string v2, "alarm"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 1071
    .local v0, am:Landroid/app/AlarmManager;
    const/4 v2, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    add-long/2addr v3, v5

    invoke-static {p0, v7, v1, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 1073
    invoke-static {v7}, Ljava/lang/System;->exit(I)V

    .line 1074
    return-void
.end method

.method public static safeSetDefaultAvatar(Landroid/widget/ImageView;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 726
    const v1, 0x7f020061

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageResource(I)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 731
    :goto_0
    return-void

    .line 727
    :catch_0
    move-exception v0

    .line 729
    .local v0, e:Ljava/lang/OutOfMemoryError;
    const-string v1, "OOM has happened."

    invoke-static {v1}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V
    .locals 5
    .parameter "spannable"
    .parameter "span"
    .parameter "start"
    .parameter "end"
    .parameter "flags"

    .prologue
    .line 914
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 915
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 929
    :goto_0
    return-void

    .line 917
    :cond_0
    if-ltz p2, :cond_1

    invoke-interface {p0}, Landroid/text/Spannable;->length()I

    move-result v1

    if-ge p2, v1, :cond_1

    if-lt p3, p2, :cond_1

    invoke-interface {p0}, Landroid/text/Spannable;->length()I

    move-result v1

    if-ge p3, v1, :cond_1

    .line 919
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    goto :goto_0

    .line 922
    :cond_1
    :try_start_0
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 923
    :catch_0
    move-exception v0

    .line 924
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    const-string v1, "We got an IOOB while setting a span. {} {} {}"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static setSoftInputVisibility(Landroid/content/Context;Landroid/view/View;Z)V
    .locals 3
    .parameter "context"
    .parameter "view"
    .parameter "visible"

    .prologue
    const/4 v2, 0x0

    .line 554
    const-string v1, "input_method"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 557
    .local v0, inputMethodManager:Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_0

    .line 558
    if-eqz p2, :cond_1

    .line 559
    invoke-virtual {v0, p1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 564
    :cond_0
    :goto_0
    return-void

    .line 561
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_0
.end method

.method public static showCenteredToast(Landroid/content/Context;I)V
    .locals 3
    .parameter "context"
    .parameter "resId"

    .prologue
    const/4 v2, 0x0

    .line 386
    const/4 v1, 0x1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    .line 387
    .local v0, t:Landroid/widget/Toast;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 388
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 389
    return-void
.end method

.method public static showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "text"

    .prologue
    const/4 v2, 0x0

    .line 426
    const/4 v1, 0x1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 427
    .local v0, t:Landroid/widget/Toast;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 428
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 429
    return-void
.end method

.method public static showDefaultToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "text"

    .prologue
    .line 405
    const/4 v1, 0x1

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 406
    .local v0, t:Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 407
    return-void
.end method

.method public static showNoCameraToast(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 392
    const v0, 0x7f0e00f9

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 393
    return-void
.end method

.method public static showShortCenteredToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "text"

    .prologue
    const/4 v2, 0x0

    .line 437
    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 438
    .local v0, t:Landroid/widget/Toast;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 439
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 440
    return-void
.end method

.method public static showTopToast(Landroid/content/Context;I)V
    .locals 4
    .parameter "context"
    .parameter "resId"

    .prologue
    const/4 v3, 0x0

    .line 415
    invoke-virtual {p0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 416
    .local v0, t:Landroid/widget/Toast;
    const/16 v1, 0x30

    invoke-virtual {v0, v1, v3, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 417
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 418
    return-void
.end method

.method public static toByteArray(Ljava/lang/Object;)[B
    .locals 5
    .parameter "o"

    .prologue
    .line 699
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v4, 0x200

    invoke-direct {v0, v4}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 700
    .local v0, bos:Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .line 702
    .local v2, oos:Ljava/io/ObjectOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/ObjectOutputStream;

    invoke-direct {v3, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 703
    .end local v2           #oos:Ljava/io/ObjectOutputStream;
    .local v3, oos:Ljava/io/ObjectOutputStream;
    :try_start_1
    invoke-virtual {v3, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 704
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 708
    invoke-static {v3}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 709
    invoke-static {v0}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    move-object v2, v3

    .end local v3           #oos:Ljava/io/ObjectOutputStream;
    .restart local v2       #oos:Ljava/io/ObjectOutputStream;
    :goto_0
    return-object v4

    .line 705
    :catch_0
    move-exception v1

    .line 706
    .local v1, e:Ljava/io/IOException;
    :goto_1
    const/4 v4, 0x0

    .line 708
    invoke-static {v2}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 709
    invoke-static {v0}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_0

    .line 708
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_2
    invoke-static {v2}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 709
    invoke-static {v0}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    throw v4

    .line 708
    .end local v2           #oos:Ljava/io/ObjectOutputStream;
    .restart local v3       #oos:Ljava/io/ObjectOutputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3           #oos:Ljava/io/ObjectOutputStream;
    .restart local v2       #oos:Ljava/io/ObjectOutputStream;
    goto :goto_2

    .line 705
    .end local v2           #oos:Ljava/io/ObjectOutputStream;
    .restart local v3       #oos:Ljava/io/ObjectOutputStream;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3           #oos:Ljava/io/ObjectOutputStream;
    .restart local v2       #oos:Ljava/io/ObjectOutputStream;
    goto :goto_1
.end method

.method public static validateAndFixEntities(Ljava/util/ArrayList;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 734
    .local p0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 735
    return-void
.end method
