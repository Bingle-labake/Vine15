.class public Lcom/googlecode/javacpp/Generator;
.super Ljava/lang/Object;
.source "Generator.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/googlecode/javacpp/Generator$AdapterInformation;,
        Lcom/googlecode/javacpp/Generator$MethodInformation;,
        Lcom/googlecode/javacpp/Generator$LinkedListRegister;
    }
.end annotation


# static fields
.field public static final JNI_VERSION:Ljava/lang/String; = "JNI_VERSION_1_6"

.field private static final baseClasses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private arrayDeallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/googlecode/javacpp/Generator$LinkedListRegister",
            "<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private deallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/googlecode/javacpp/Generator$LinkedListRegister",
            "<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private functionDefinitions:Lcom/googlecode/javacpp/Generator$LinkedListRegister;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/googlecode/javacpp/Generator$LinkedListRegister",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private functionPointers:Lcom/googlecode/javacpp/Generator$LinkedListRegister;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/googlecode/javacpp/Generator$LinkedListRegister",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/googlecode/javacpp/Generator$LinkedListRegister",
            "<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private jclassesInit:Lcom/googlecode/javacpp/Generator$LinkedListRegister;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/googlecode/javacpp/Generator$LinkedListRegister",
            "<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field private mayThrowExceptions:Z

.field private members:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Class;",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private out:Ljava/io/PrintWriter;

.field private out2:Ljava/io/PrintWriter;

.field private properties:Lcom/googlecode/javacpp/Loader$ClassProperties;

.field private usesAdapters:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 132
    const-class v0, Lcom/googlecode/javacpp/Generator;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    .line 134
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Lcom/googlecode/javacpp/Pointer;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Lcom/googlecode/javacpp/BytePointer;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Lcom/googlecode/javacpp/ShortPointer;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Lcom/googlecode/javacpp/IntPointer;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Lcom/googlecode/javacpp/LongPointer;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lcom/googlecode/javacpp/FloatPointer;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-class v2, Lcom/googlecode/javacpp/DoublePointer;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-class v2, Lcom/googlecode/javacpp/CharPointer;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-class v2, Lcom/googlecode/javacpp/PointerPointer;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-class v2, Lcom/googlecode/javacpp/BoolPointer;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-class v2, Lcom/googlecode/javacpp/CLongPointer;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-class v2, Lcom/googlecode/javacpp/SizeTPointer;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/googlecode/javacpp/Generator;->baseClasses:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Loader$ClassProperties;)V
    .locals 0
    .parameter "properties"

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-object p1, p0, Lcom/googlecode/javacpp/Generator;->properties:Lcom/googlecode/javacpp/Loader$ClassProperties;

    .line 117
    return-void
.end method

.method private doCall(Lcom/googlecode/javacpp/Generator$MethodInformation;Ljava/lang/String;)V
    .locals 18
    .parameter "methodInfo"
    .parameter "returnPrefix"

    .prologue
    .line 1084
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->throwsException:Ljava/lang/Class;

    if-eqz v14, :cond_2

    const-string v3, "        "

    .line 1085
    .local v3, indent:Ljava/lang/String;
    :goto_0
    const-string v8, "("

    .line 1086
    .local v8, prefix:Ljava/lang/String;
    const-string v10, ")"

    .line 1087
    .local v10, suffix:Ljava/lang/String;
    const/4 v9, 0x0

    .line 1088
    .local v9, skipParameters:I
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->method:Ljava/lang/reflect/Method;

    const-class v15, Lcom/googlecode/javacpp/annotation/Index;

    invoke-virtual {v14, v15}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v14

    if-nez v14, :cond_0

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    if-eqz v14, :cond_3

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    const-class v15, Lcom/googlecode/javacpp/annotation/Index;

    invoke-virtual {v14, v15}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_3

    :cond_0
    const/4 v4, 0x1

    .line 1091
    .local v4, index:Z
    :goto_1
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->deallocator:Z

    if-eqz v14, :cond_4

    .line 1092
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "void* allocatedAddress = jlong_to_ptr(arg0);"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1093
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "void (*deallocatorAddress)(void*) = (void(*)(void*))jlong_to_ptr(arg1);"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1094
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "if (deallocatorAddress != NULL && allocatedAddress != NULL) {"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1095
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "    (*deallocatorAddress)(allocatedAddress);"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1096
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "}"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1239
    :cond_1
    :goto_2
    return-void

    .line 1084
    .end local v3           #indent:Ljava/lang/String;
    .end local v4           #index:Z
    .end local v8           #prefix:Ljava/lang/String;
    .end local v9           #skipParameters:I
    .end local v10           #suffix:Ljava/lang/String;
    :cond_2
    const-string v3, "    "

    goto/16 :goto_0

    .line 1088
    .restart local v3       #indent:Ljava/lang/String;
    .restart local v8       #prefix:Ljava/lang/String;
    .restart local v9       #skipParameters:I
    .restart local v10       #suffix:Ljava/lang/String;
    :cond_3
    const/4 v4, 0x0

    goto/16 :goto_1

    .line 1098
    .restart local v4       #index:Z
    :cond_4
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueGetter:Z

    if-nez v14, :cond_5

    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v14, :cond_5

    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    if-nez v14, :cond_5

    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-eqz v14, :cond_16

    .line 1100
    :cond_5
    const/4 v13, 0x0

    .line 1101
    .local v13, wantsPointer:Z
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    array-length v14, v14

    add-int/lit8 v6, v14, -0x1

    .line 1102
    .local v6, k:I
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v14, :cond_6

    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-eqz v14, :cond_8

    :cond_6
    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/googlecode/javacpp/Generator;->getParameterBy(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/annotation/Annotation;

    move-result-object v14

    instance-of v14, v14, Lcom/googlecode/javacpp/annotation/ByRef;

    if-nez v14, :cond_8

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v14, v0, v6}, Lcom/googlecode/javacpp/Generator;->getParameterAdapterInformation(ZLcom/googlecode/javacpp/Generator$MethodInformation;I)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v14

    if-nez v14, :cond_8

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v14, v14, v6

    const-class v15, Ljava/lang/String;

    if-ne v14, v15, :cond_8

    .line 1107
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "strcpy((char*)"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1108
    const/4 v13, 0x1

    .line 1109
    const-string v8, ", "

    .line 1130
    :goto_3
    move-object/from16 v0, p1

    iget v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    invoke-static {v14}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v14

    if-eqz v14, :cond_f

    .line 1131
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    invoke-static/range {p1 .. p1}, Lcom/googlecode/javacpp/Generator;->getCPPScopeName(Lcom/googlecode/javacpp/Generator$MethodInformation;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1182
    .end local v6           #k:I
    .end local v13           #wantsPointer:Z
    :cond_7
    :goto_4
    move v5, v9

    .local v5, j:I
    :goto_5
    move-object/from16 v0, p1

    iget v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->dim:I

    if-ge v5, v14, :cond_20

    .line 1185
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/googlecode/javacpp/Generator;->getParameterCast(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/String;

    move-result-object v2

    .line 1186
    .local v2, cast:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "["

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v14, v14, v5

    invoke-virtual {v14}, Ljava/lang/Class;->isPrimitive()Z

    move-result v14

    if-eqz v14, :cond_1f

    const-string v14, "arg"

    :goto_6
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v16, "]"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v15, v14}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1182
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 1110
    .end local v2           #cast:Ljava/lang/String;
    .end local v5           #j:I
    .restart local v6       #k:I
    .restart local v13       #wantsPointer:Z
    :cond_8
    const/4 v14, 0x1

    if-lt v6, v14, :cond_c

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    const/4 v15, 0x0

    aget-object v14, v14, v15

    invoke-virtual {v14}, Ljava/lang/Class;->isArray()Z

    move-result v14

    if-eqz v14, :cond_c

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    const/4 v15, 0x0

    aget-object v14, v14, v15

    invoke-virtual {v14}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Class;->isPrimitive()Z

    move-result v14

    if-eqz v14, :cond_c

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    const/4 v15, 0x1

    aget-object v14, v14, v15

    sget-object v15, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v14, v15, :cond_9

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    const/4 v15, 0x1

    aget-object v14, v14, v15

    sget-object v15, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v14, v15, :cond_c

    .line 1115
    :cond_9
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "memcpy("

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1116
    const/4 v13, 0x1

    .line 1117
    const-string v8, ", "

    .line 1118
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    if-nez v14, :cond_a

    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueGetter:Z

    if-eqz v14, :cond_b

    .line 1119
    :cond_a
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v15, "ptr0 + arg1, "

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1123
    :goto_7
    const/4 v9, 0x2

    .line 1124
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, " * sizeof(*ptr0)"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_3

    .line 1121
    :cond_b
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "ptr0 + arg1, "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_7

    .line 1126
    :cond_c
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1127
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueGetter:Z

    if-nez v14, :cond_d

    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    if-eqz v14, :cond_e

    :cond_d
    const-string v8, ""

    .line 1128
    :goto_8
    const-string v10, ""

    goto/16 :goto_3

    .line 1127
    :cond_e
    const-string v8, " = "

    goto :goto_8

    .line 1132
    :cond_f
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    if-nez v14, :cond_10

    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-eqz v14, :cond_12

    .line 1133
    :cond_10
    if-eqz v4, :cond_11

    .line 1134
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v15, "(*ptr)"

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1135
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_4

    .line 1137
    :cond_11
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "ptr->"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aget-object v16, v16, v17

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1140
    :cond_12
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    if-eqz v4, :cond_13

    const-string v14, "(*ptr)"

    :goto_9
    invoke-virtual {v15, v14}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_4

    :cond_13
    move-object/from16 v0, p1

    iget v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->dim:I

    if-gtz v14, :cond_14

    if-eqz v13, :cond_15

    :cond_14
    const-string v14, "ptr"

    goto :goto_9

    :cond_15
    const-string v14, "*ptr"

    goto :goto_9

    .line 1142
    .end local v6           #k:I
    .end local v13           #wantsPointer:Z
    :cond_16
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->bufferGetter:Z

    if-eqz v14, :cond_17

    .line 1143
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "ptr"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1144
    const-string v8, ""

    .line 1145
    const-string v10, ""

    goto/16 :goto_4

    .line 1147
    :cond_17
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1148
    const-class v14, Lcom/googlecode/javacpp/FunctionPointer;

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    invoke-virtual {v14, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_19

    .line 1149
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    const-class v15, Lcom/googlecode/javacpp/annotation/Namespace;

    invoke-virtual {v14, v15}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_18

    .line 1150
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v15, "(ptr0->*(ptr->ptr))"

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1151
    const/4 v9, 0x1

    goto/16 :goto_4

    .line 1153
    :cond_18
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v15, "(*ptr->ptr)"

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1155
    :cond_19
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->allocator:Z

    if-eqz v14, :cond_1c

    .line 1156
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    invoke-static {v14}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v11

    .line 1157
    .local v11, typeName:[Ljava/lang/String;
    invoke-static {v11}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1158
    .local v12, valueTypeName:Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    const-class v15, Lcom/googlecode/javacpp/Pointer;

    if-ne v14, v15, :cond_1a

    .line 1160
    const-string v8, ""

    .line 1161
    const-string v10, ""

    goto/16 :goto_4

    .line 1163
    :cond_1a
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->method:Ljava/lang/reflect/Method;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v14, v0}, Lcom/googlecode/javacpp/Generator;->getNoException(Ljava/lang/Class;Ljava/lang/reflect/Method;)Z

    move-result v14

    if-eqz v14, :cond_1b

    const-string v14, "new (std::nothrow) "

    :goto_a
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v16, 0x1

    aget-object v16, v11, v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v15, v14}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1165
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->arrayAllocator:Z

    if-eqz v14, :cond_7

    .line 1166
    const-string v8, "["

    .line 1167
    const-string v10, "]"

    goto/16 :goto_4

    .line 1163
    :cond_1b
    const-string v14, "new "

    goto :goto_a

    .line 1170
    .end local v11           #typeName:[Ljava/lang/String;
    .end local v12           #valueTypeName:Ljava/lang/String;
    :cond_1c
    move-object/from16 v0, p1

    iget v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    invoke-static {v14}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v14

    if-eqz v14, :cond_1d

    .line 1171
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    invoke-static/range {p1 .. p1}, Lcom/googlecode/javacpp/Generator;->getCPPScopeName(Lcom/googlecode/javacpp/Generator$MethodInformation;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1173
    :cond_1d
    if-eqz v4, :cond_1e

    .line 1174
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v15, "(*ptr)"

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1175
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    const/16 v16, 0x0

    aget-object v15, v15, v16

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_4

    .line 1177
    :cond_1e
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "ptr->"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aget-object v16, v16, v17

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1186
    .restart local v2       #cast:Ljava/lang/String;
    .restart local v5       #j:I
    :cond_1f
    const-string v14, "ptr"

    goto/16 :goto_6

    .line 1188
    .end local v2           #cast:Ljava/lang/String;
    :cond_20
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    array-length v14, v14

    const/4 v15, 0x1

    if-le v14, v15, :cond_21

    .line 1189
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    const/16 v16, 0x1

    aget-object v15, v15, v16

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1191
    :cond_21
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    invoke-virtual {v14, v8}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1192
    move-object/from16 v0, p1

    iget-boolean v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->withEnv:Z

    if-eqz v14, :cond_22

    .line 1193
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v0, p1

    iget v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    invoke-static {v14}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v14

    if-eqz v14, :cond_25

    const-string v14, "env, cls"

    :goto_b
    invoke-virtual {v15, v14}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1194
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    array-length v14, v14

    sub-int/2addr v14, v9

    move-object/from16 v0, p1

    iget v15, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->dim:I

    sub-int/2addr v14, v15

    if-lez v14, :cond_22

    .line 1195
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v15, ", "

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1198
    :cond_22
    move-object/from16 v0, p1

    iget v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->dim:I

    add-int v5, v9, v14

    :goto_c
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    array-length v14, v14

    if-ge v5, v14, :cond_2e

    .line 1199
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/googlecode/javacpp/Generator;->getParameterBy(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/annotation/Annotation;

    move-result-object v7

    .line 1200
    .local v7, passBy:Ljava/lang/annotation/Annotation;
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/googlecode/javacpp/Generator;->getParameterCast(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/String;

    move-result-object v2

    .line 1201
    .restart local v2       #cast:Ljava/lang/String;
    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v14, v0, v5}, Lcom/googlecode/javacpp/Generator;->getParameterAdapterInformation(ZLcom/googlecode/javacpp/Generator$MethodInformation;I)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v1

    .line 1203
    .local v1, adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    const-string v14, "(void*)"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_23

    const-string v14, "(void *)"

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_26

    :cond_23
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v14, v14, v5

    sget-object v15, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v14, v15, :cond_26

    .line 1205
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "jlong_to_ptr(arg"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ")"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1226
    :goto_d
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    array-length v14, v14

    add-int/lit8 v14, v14, -0x1

    if-ge v5, v14, :cond_24

    .line 1227
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v15, ", "

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1198
    :cond_24
    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    .line 1193
    .end local v1           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v2           #cast:Ljava/lang/String;
    .end local v7           #passBy:Ljava/lang/annotation/Annotation;
    :cond_25
    const-string v14, "env, obj"

    goto/16 :goto_b

    .line 1206
    .restart local v1       #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .restart local v2       #cast:Ljava/lang/String;
    .restart local v7       #passBy:Ljava/lang/annotation/Annotation;
    :cond_26
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v14, v14, v5

    invoke-virtual {v14}, Ljava/lang/Class;->isPrimitive()Z

    move-result v14

    if-eqz v14, :cond_27

    .line 1207
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "arg"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_d

    .line 1208
    :cond_27
    if-eqz v1, :cond_29

    .line 1209
    iget-object v14, v1, Lcom/googlecode/javacpp/Generator$AdapterInformation;->cast:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 1210
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_28

    const-string v14, "("

    invoke-virtual {v2, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_28

    const-string v14, ")"

    invoke-virtual {v2, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_28

    .line 1211
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "("

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ")"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1213
    :cond_28
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "adapter"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1214
    iget v14, v1, Lcom/googlecode/javacpp/Generator$AdapterInformation;->argc:I

    add-int/lit8 v14, v14, -0x1

    add-int/2addr v5, v14

    goto/16 :goto_d

    .line 1215
    :cond_29
    const-class v14, Lcom/googlecode/javacpp/FunctionPointer;

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v15, v15, v5

    invoke-virtual {v14, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v14

    if-eqz v14, :cond_2a

    if-nez v7, :cond_2a

    .line 1216
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "(ptr"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " == NULL ? NULL : ptr"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "->ptr)"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_d

    .line 1217
    :cond_2a
    instance-of v14, v7, Lcom/googlecode/javacpp/annotation/ByVal;

    if-nez v14, :cond_2b

    instance-of v14, v7, Lcom/googlecode/javacpp/annotation/ByRef;

    if-eqz v14, :cond_2c

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v14, v14, v5

    const-class v15, Ljava/lang/String;

    if-eq v14, v15, :cond_2c

    .line 1219
    :cond_2b
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "*"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "ptr"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_d

    .line 1220
    :cond_2c
    instance-of v14, v7, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    if-eqz v14, :cond_2d

    .line 1221
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "(arg"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " == NULL ? NULL : &ptr"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ")"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_d

    .line 1223
    :cond_2d
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "ptr"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_d

    .line 1230
    .end local v1           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v2           #cast:Ljava/lang/String;
    .end local v7           #passBy:Ljava/lang/annotation/Annotation;
    :cond_2e
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    invoke-virtual {v14, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1231
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    array-length v14, v14

    const/4 v15, 0x2

    if-le v14, v15, :cond_2f

    .line 1232
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    const/16 v16, 0x2

    aget-object v15, v15, v16

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1234
    :cond_2f
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    invoke-static {v14}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v14

    instance-of v14, v14, Lcom/googlecode/javacpp/annotation/ByRef;

    if-eqz v14, :cond_1

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    const-class v15, Ljava/lang/String;

    if-ne v14, v15, :cond_1

    .line 1237
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, ");\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "rptr = rstr.c_str()"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method private doCallback(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/String;Z)V
    .locals 30
    .parameter
    .parameter "callbackMethod"
    .parameter "callbackName"
    .parameter "needFunctor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 1460
    .local p1, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v9

    .line 1461
    .local v9, callbackReturnType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    .line 1462
    .local v7, callbackParameterTypes:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Method;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v5

    .line 1463
    .local v5, callbackAnnotations:[Ljava/lang/annotation/Annotation;
    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Method;->getParameterAnnotations()[[Ljava/lang/annotation/Annotation;

    move-result-object v6

    .line 1465
    .local v6, callbackParameterAnnotations:[[Ljava/lang/annotation/Annotation;
    invoke-direct/range {p0 .. p1}, Lcom/googlecode/javacpp/Generator;->getFunctionClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v12

    .line 1466
    .local v12, instanceTypeName:Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v10

    .line 1467
    .local v10, callbackTypeName:[Ljava/lang/String;
    const/16 v26, 0x0

    aget-object v26, v10, v26

    const-string v27, "\\("

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v19

    .line 1468
    .local v19, returnConvention:[Ljava/lang/String;
    const/16 v26, 0x1

    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    const/16 v29, 0x1

    aget-object v29, v19, v29

    aput-object v29, v27, v28

    invoke-static/range {v27 .. v27}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    aput-object v27, v19, v26

    .line 1469
    const/16 v26, 0x1

    aget-object v26, v10, v26

    const/16 v27, 0x1

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    .line 1470
    .local v15, parameterDeclaration:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->functionPointers:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "static "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "_instance;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    .line 1471
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclassesInit:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    .line 1472
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    if-eqz v26, :cond_0

    .line 1473
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v27, v0

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "JNIIMPORT "

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v28, 0x0

    aget-object v28, v19, v28

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v26, v0

    const/16 v29, 0x1

    move/from16 v0, v26

    move/from16 v1, v29

    if-le v0, v1, :cond_2

    const/16 v26, 0x1

    aget-object v26, v19, v26

    :goto_0
    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, ";"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1476
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v27, v0

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "JNIEXPORT "

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v28, 0x0

    aget-object v28, v19, v28

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v26, v0

    const/16 v29, 0x1

    move/from16 v0, v26

    move/from16 v1, v29

    if-le v0, v1, :cond_3

    const/16 v26, 0x1

    aget-object v26, v19, v26

    :goto_1
    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, " {"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1478
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v27, v0

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v26, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v26

    if-eq v9, v0, :cond_4

    const-string v26, "    return "

    :goto_2
    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, "_instance("

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1479
    const/4 v13, 0x0

    .local v13, j:I
    :goto_3
    array-length v0, v7

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v13, v0, :cond_5

    .line 1480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1481
    array-length v0, v7

    move/from16 v26, v0

    add-int/lit8 v26, v26, -0x1

    move/from16 v0, v26

    if-ge v13, v0, :cond_1

    .line 1482
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, ", "

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1479
    :cond_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 1473
    .end local v13           #j:I
    :cond_2
    const-string v26, ""

    goto/16 :goto_0

    .line 1476
    :cond_3
    const-string v26, ""

    goto/16 :goto_1

    .line 1478
    :cond_4
    const-string v26, "    "

    goto :goto_2

    .line 1485
    .restart local v13       #j:I
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, ");"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1486
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "}"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1487
    if-nez p4, :cond_6

    .line 1788
    :goto_4
    return-void

    .line 1491
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v28, 0x0

    aget-object v28, v19, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "::operator()"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " {"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1492
    const-string v20, ""

    .line 1493
    .local v20, returnPrefix:Ljava/lang/String;
    sget-object v26, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v26

    if-eq v9, v0, :cond_7

    .line 1494
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-static {v9}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " rarg = 0;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1495
    const-string v20, "rarg = "

    .line 1496
    const-class v26, Ljava/lang/String;

    move-object/from16 v0, v26

    if-ne v9, v0, :cond_7

    .line 1497
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "(jstring)"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 1500
    :cond_7
    invoke-static {v5, v9}, Lcom/googlecode/javacpp/Generator;->getCast([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v8

    .line 1501
    .local v8, callbackReturnCast:Ljava/lang/String;
    invoke-static {v5}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v18

    .line 1502
    .local v18, returnBy:Ljava/lang/annotation/Annotation;
    invoke-static {v9}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v21

    .line 1503
    .local v21, returnTypeName:[Ljava/lang/String;
    invoke-static/range {v21 .. v21}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 1504
    .local v22, returnValueTypeName:Ljava/lang/String;
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, v22

    invoke-static {v0, v1, v5}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v17

    .line 1506
    .local v17, returnAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    jthrowable exc = NULL;"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1507
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    JNIEnv* env;"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1508
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    int attached = JavaCPP_getEnv(&env);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1509
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    if (attached < 0) {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1510
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        goto end;"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1511
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1512
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "{"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1513
    array-length v0, v7

    move/from16 v26, v0

    if-lez v26, :cond_24

    .line 1514
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jvalue args["

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    array-length v0, v7

    move/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "];"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1515
    const/4 v13, 0x0

    :goto_5
    array-length v0, v7

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v13, v0, :cond_24

    .line 1516
    aget-object v26, v7, v13

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->isPrimitive()Z

    move-result v26

    if-eqz v26, :cond_9

    .line 1517
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    args["

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "]."

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    aget-object v28, v7, v13

    invoke-static/range {v28 .. v28}, Lcom/googlecode/javacpp/Generator;->getSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = ("

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    aget-object v28, v7, v13

    invoke-static/range {v28 .. v28}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ")arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1515
    :cond_8
    :goto_6
    add-int/lit8 v13, v13, 0x1

    goto :goto_5

    .line 1521
    :cond_9
    aget-object v26, v6, v13

    invoke-static/range {v26 .. v26}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v16

    .line 1522
    .local v16, passBy:Ljava/lang/annotation/Annotation;
    aget-object v26, v7, v13

    invoke-static/range {v26 .. v26}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v24

    .line 1523
    .local v24, typeName:[Ljava/lang/String;
    invoke-static/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 1524
    .local v25, valueTypeName:Ljava/lang/String;
    const/16 v26, 0x0

    aget-object v27, v6, v13

    move/from16 v0, v26

    move-object/from16 v1, v25

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v4

    .line 1526
    .local v4, adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    const/4 v14, 0x0

    .line 1527
    .local v14, needInit:Z
    if-eqz v4, :cond_10

    .line 1528
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/googlecode/javacpp/Generator;->usesAdapters:Z

    .line 1529
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v4, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " adapter"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "(arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1530
    aget-object v26, v7, v13

    const-class v27, Ljava/lang/String;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    if-eq v0, v1, :cond_a

    .line 1531
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jint size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = (jint)adapter"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ".size;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1532
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jlong deallocator"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = ptr_to_jlong(&("

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    iget-object v0, v4, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "::deallocate));"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1534
    :cond_a
    const/4 v14, 0x1

    .line 1544
    :cond_b
    :goto_7
    const-class v26, Lcom/googlecode/javacpp/Pointer;

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-nez v26, :cond_c

    const-class v26, Ljava/nio/Buffer;

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-nez v26, :cond_c

    aget-object v26, v7, v13

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->isArray()Z

    move-result v26

    if-eqz v26, :cond_e

    aget-object v26, v7, v13

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->isPrimitive()Z

    move-result v26

    if-eqz v26, :cond_e

    .line 1548
    :cond_c
    const-class v26, Lcom/googlecode/javacpp/FunctionPointer;

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-eqz v26, :cond_d

    .line 1549
    const/16 v26, 0x0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v28, v7, v13

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lcom/googlecode/javacpp/Generator;->getFunctionClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "*"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    aput-object v27, v24, v26

    .line 1550
    const/16 v26, 0x1

    const-string v27, ""

    aput-object v27, v24, v26

    .line 1551
    invoke-static/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 1553
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    aget-object v28, v7, v13

    invoke-static/range {v28 .. v28}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = NULL;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1554
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = NULL;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1555
    const-class v26, Lcom/googlecode/javacpp/FunctionPointer;

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-eqz v26, :cond_13

    .line 1556
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = new (std::nothrow) "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1557
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    if (ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != NULL) {"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1558
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "->ptr = arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1559
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1579
    :cond_e
    :goto_8
    const-class v26, Lcom/googlecode/javacpp/Pointer;

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-eqz v26, :cond_1c

    .line 1580
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "    obj"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " = env->AllocObject(JavaCPP_getClass(env, "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v27, v0

    aget-object v28, v7, v13

    invoke-virtual/range {v27 .. v28}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, "));"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 1582
    .local v23, s:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclassesInit:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v26, v0

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    .line 1583
    const/16 v26, 0x1

    aget-object v27, v6, v13

    move/from16 v0, v26

    move-object/from16 v1, v25

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v4

    .line 1584
    if-nez v4, :cond_f

    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    move/from16 v26, v0

    if-nez v26, :cond_f

    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByPtrRef;

    move/from16 v26, v0

    if-eqz v26, :cond_1a

    .line 1585
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1591
    :goto_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    if (obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != NULL) { "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1592
    if-eqz v14, :cond_1b

    .line 1593
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        if (deallocator"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != 0) {"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1594
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "            jvalue args[3];"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1595
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "            args[0].j = ptr_to_jlong(ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1596
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "            args[1].i = size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1597
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "            args[2].j = deallocator"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1598
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "            env->CallNonvirtualVoidMethodA(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", JavaCPP_getClass(env, "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v28, v0

    const-class v29, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual/range {v28 .. v29}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "), JavaCPP_initMID, args);"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1600
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        } else {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1601
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "            env->SetLongField(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", JavaCPP_addressFID, ptr_to_jlong(ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "));"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1602
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "            env->SetIntField(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", JavaCPP_limitFID, size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1603
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "            env->SetIntField(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", JavaCPP_capacityFID, size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1604
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1608
    :goto_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1609
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    args["

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "].l = obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 1535
    .end local v23           #s:Ljava/lang/String;
    :cond_10
    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByVal;

    move/from16 v26, v0

    if-eqz v26, :cond_11

    aget-object v26, v7, v13

    const-class v27, Lcom/googlecode/javacpp/Pointer;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    if-ne v0, v1, :cond_12

    :cond_11
    const-class v26, Lcom/googlecode/javacpp/FunctionPointer;

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-eqz v26, :cond_b

    .line 1537
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jint size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = 1;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1538
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jlong deallocator"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = ptr_to_jlong(&JavaCPP_"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    aget-object v28, v7, v13

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "_deallocate);"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1540
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->deallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v26, v0

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    .line 1541
    const/4 v14, 0x1

    goto/16 :goto_7

    .line 1560
    :cond_13
    if-eqz v4, :cond_14

    .line 1561
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = adapter"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_8

    .line 1562
    :cond_14
    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByVal;

    move/from16 v26, v0

    if-eqz v26, :cond_16

    aget-object v26, v7, v13

    const-class v27, Lcom/googlecode/javacpp/Pointer;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    if-eq v0, v1, :cond_16

    .line 1563
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v27, v0

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    ptr"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v28

    aget-object v26, v7, v13

    move-object/from16 v0, v26

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/googlecode/javacpp/Generator;->getNoException(Ljava/lang/Class;Ljava/lang/reflect/Method;)Z

    move-result v26

    if-eqz v26, :cond_15

    const-string v26, " = new (std::nothrow) "

    :goto_b
    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v28, 0x1

    aget-object v28, v24, v28

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, "(*("

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v28, 0x0

    aget-object v28, v24, v28

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v28, 0x1

    aget-object v28, v24, v28

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, ")&arg"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, ");"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_8

    :cond_15
    const-string v26, " = new "

    goto :goto_b

    .line 1566
    :cond_16
    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByVal;

    move/from16 v26, v0

    if-nez v26, :cond_17

    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByRef;

    move/from16 v26, v0

    if-eqz v26, :cond_18

    .line 1567
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = ("

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ")&arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_8

    .line 1568
    :cond_18
    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    move/from16 v26, v0

    if-eqz v26, :cond_19

    .line 1569
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    if (arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " == NULL) {"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1570
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        JavaCPP_log(\"Pointer address of argument "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " is NULL in callback for "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ".\");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1571
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    } else {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1572
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = ("

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ")*arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1573
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_8

    .line 1575
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = ("

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ")arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_8

    .line 1587
    .restart local v23       #s:Ljava/lang/String;
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    if (ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != NULL) { "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1588
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1589
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 1606
    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        env->SetLongField(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", JavaCPP_addressFID, ptr_to_jlong(ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "));"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_a

    .line 1610
    .end local v23           #s:Ljava/lang/String;
    :cond_1c
    aget-object v26, v7, v13

    const-class v27, Ljava/lang/String;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    if-ne v0, v1, :cond_1f

    .line 1611
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v27, v0

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jstring obj"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, " = (const char*)"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    if-eqz v4, :cond_1d

    const-string v26, "adapter"

    :goto_c
    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, " == NULL ? NULL : env->NewStringUTF((const char*)"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    if-eqz v4, :cond_1e

    const-string v26, "adapter"

    :goto_d
    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, ");"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1613
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    args["

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "].l = obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 1611
    :cond_1d
    const-string v26, "arg"

    goto :goto_c

    :cond_1e
    const-string v26, "arg"

    goto :goto_d

    .line 1614
    :cond_1f
    aget-object v26, v7, v13

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->isArray()Z

    move-result v26

    if-eqz v26, :cond_21

    aget-object v26, v7, v13

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->isPrimitive()Z

    move-result v26

    if-eqz v26, :cond_21

    .line 1616
    if-nez v4, :cond_20

    .line 1617
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jint size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != NULL ? 1 : 0;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1619
    :cond_20
    aget-object v26, v7, v13

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v23

    .line 1620
    .restart local v23       #s:Ljava/lang/String;
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v27, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v27, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1621
    .local v3, S:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    if (ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != NULL) {"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1622
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = env->New"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "Array(size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1623
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        env->Set"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "ArrayRegion(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", 0, size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", (j"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "*)ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1624
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1625
    if-eqz v4, :cond_8

    .line 1626
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    if (deallocator"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != 0 && ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != NULL) {"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1627
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        (*(void(*)(void*))jlong_to_ptr(deallocator"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "))((void*)ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1628
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 1630
    .end local v3           #S:Ljava/lang/String;
    .end local v23           #s:Ljava/lang/String;
    :cond_21
    const-class v26, Ljava/nio/Buffer;

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-eqz v26, :cond_23

    .line 1631
    if-nez v4, :cond_22

    .line 1632
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jint size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != NULL ? 1 : 0;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1634
    :cond_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    if (ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != NULL) {"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1635
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = env->NewDirectByteBuffer(ptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", size"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1636
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 1638
    :cond_23
    sget-object v26, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v27, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "Callback \""

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "\" has unsupported parameter type \""

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    aget-object v29, v7, v13

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "\". Compilation will most likely fail."

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v26 .. v28}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto/16 :goto_6

    .line 1645
    .end local v4           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v14           #needInit:Z
    .end local v16           #passBy:Ljava/lang/annotation/Annotation;
    .end local v24           #typeName:[Ljava/lang/String;
    .end local v25           #valueTypeName:Ljava/lang/String;
    :cond_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    if (obj == NULL) {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1646
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        obj = env->NewGlobalRef(env->AllocObject(JavaCPP_getClass(env, "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ")));"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1647
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        if (obj == NULL) {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1648
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "            JavaCPP_log(\"Error creating global reference of "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " instance for callback.\");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1649
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        } else {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1650
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "            env->SetLongField(obj, JavaCPP_addressFID, ptr_to_jlong(this));"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1651
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1652
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        ptr = &"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1653
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1654
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    if (mid == NULL) {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1655
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        mid = env->GetMethodID(JavaCPP_getClass(env, "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "), \""

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\", \"("

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Lcom/googlecode/javacpp/Generator;->getSignature([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ")"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Lcom/googlecode/javacpp/Generator;->getSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1657
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1658
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    if (env->IsSameObject(obj, NULL)) {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1659
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        JavaCPP_log(\"Function pointer object is NULL in callback for "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ".\");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1660
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    } else if (mid == NULL) {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1661
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        JavaCPP_log(\"Error getting method ID of function caller \\\""

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "\\\" for callback.\");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1662
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    } else {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1663
    const-string v23, "Object"

    .line 1664
    .restart local v23       #s:Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/Class;->isPrimitive()Z

    move-result v26

    if-eqz v26, :cond_25

    .line 1665
    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v23

    .line 1666
    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v27, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v27, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 1668
    :cond_25
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v27, v0

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        "

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, "env->Call"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v28, "MethodA(obj, mid, "

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    array-length v0, v7

    move/from16 v26, v0

    if-nez v26, :cond_2c

    const-string v26, "NULL);"

    :goto_e
    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1669
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        if ((exc = env->ExceptionOccurred()) != NULL) {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1670
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "            env->ExceptionClear();"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1671
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1672
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1674
    const/4 v13, 0x0

    :goto_f
    array-length v0, v7

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v13, v0, :cond_2f

    .line 1675
    const-class v26, Lcom/googlecode/javacpp/Pointer;

    aget-object v27, v7, v13

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-eqz v26, :cond_2a

    .line 1676
    aget-object v26, v7, v13

    invoke-static/range {v26 .. v26}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v24

    .line 1677
    .restart local v24       #typeName:[Ljava/lang/String;
    aget-object v26, v6, v13

    invoke-static/range {v26 .. v26}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v16

    .line 1678
    .restart local v16       #passBy:Ljava/lang/annotation/Annotation;
    aget-object v26, v6, v13

    aget-object v27, v7, v13

    invoke-static/range {v26 .. v27}, Lcom/googlecode/javacpp/Generator;->getCast([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v11

    .line 1679
    .local v11, cast:Ljava/lang/String;
    invoke-static/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 1680
    .restart local v25       #valueTypeName:Ljava/lang/String;
    const/16 v26, 0x1

    aget-object v27, v6, v13

    move/from16 v0, v26

    move-object/from16 v1, v25

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v4

    .line 1682
    .restart local v4       #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    const-string v26, "void*"

    const/16 v27, 0x0

    aget-object v27, v24, v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_26

    .line 1683
    const/16 v26, 0x0

    const-string v27, "char*"

    aput-object v27, v24, v26

    .line 1685
    :cond_26
    if-nez v4, :cond_27

    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    move/from16 v26, v0

    if-nez v26, :cond_27

    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByPtrRef;

    move/from16 v26, v0

    if-eqz v26, :cond_2a

    .line 1686
    :cond_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " rptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = ("

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v24, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ")jlong_to_ptr(env->GetLongField(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", JavaCPP_addressFID));"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1688
    if-eqz v4, :cond_28

    .line 1689
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jint rsize"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = env->GetIntField(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", JavaCPP_limitFID);"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1691
    :cond_28
    aget-object v26, v7, v13

    const-class v27, Lcom/googlecode/javacpp/annotation/Opaque;

    invoke-virtual/range {v26 .. v27}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v26

    if-nez v26, :cond_29

    .line 1692
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    jint rposition"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = env->GetIntField(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", JavaCPP_positionFID);"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1693
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    rptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " += rposition"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1694
    if-eqz v4, :cond_29

    .line 1695
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    rsize"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " -= rposition"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1698
    :cond_29
    if-eqz v4, :cond_2d

    .line 1699
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    adapter"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ".assign(rptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ", rsize"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1709
    .end local v4           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v11           #cast:Ljava/lang/String;
    .end local v16           #passBy:Ljava/lang/annotation/Annotation;
    .end local v24           #typeName:[Ljava/lang/String;
    .end local v25           #valueTypeName:Ljava/lang/String;
    :cond_2a
    :goto_10
    aget-object v26, v7, v13

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->isPrimitive()Z

    move-result v26

    if-nez v26, :cond_2b

    .line 1710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    env->DeleteLocalRef(obj"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1674
    :cond_2b
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_f

    .line 1668
    :cond_2c
    const-string v26, "args);"

    goto/16 :goto_e

    .line 1700
    .restart local v4       #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .restart local v11       #cast:Ljava/lang/String;
    .restart local v16       #passBy:Ljava/lang/annotation/Annotation;
    .restart local v24       #typeName:[Ljava/lang/String;
    .restart local v25       #valueTypeName:Ljava/lang/String;
    :cond_2d
    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    move/from16 v26, v0

    if-eqz v26, :cond_2e

    .line 1701
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    if (arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " != NULL) {"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1702
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        *arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = *"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "&rptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1703
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 1704
    :cond_2e
    move-object/from16 v0, v16

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByPtrRef;

    move/from16 v26, v0

    if-eqz v26, :cond_2a

    .line 1705
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    arg"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "rptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 1713
    .end local v4           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v11           #cast:Ljava/lang/String;
    .end local v16           #passBy:Ljava/lang/annotation/Annotation;
    .end local v24           #typeName:[Ljava/lang/String;
    .end local v25           #valueTypeName:Ljava/lang/String;
    :cond_2f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "}"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1714
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "end:"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1716
    sget-object v26, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v26

    if-eq v9, v0, :cond_32

    .line 1717
    const-string v26, "void*"

    const/16 v27, 0x0

    aget-object v27, v21, v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_30

    .line 1718
    const/16 v26, 0x0

    const-string v27, "char*"

    aput-object v27, v21, v26

    .line 1720
    :cond_30
    const-class v26, Lcom/googlecode/javacpp/Pointer;

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-eqz v26, :cond_34

    .line 1721
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v21, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " rptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v21, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = rarg == NULL ? NULL : ("

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v21, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v21, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ")jlong_to_ptr(env->GetLongField(rarg, JavaCPP_addressFID));"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1723
    if-eqz v17, :cond_31

    .line 1724
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    jint rsize = rarg == NULL ? 0 : env->GetIntField(rarg, JavaCPP_limitFID);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1726
    :cond_31
    const-class v26, Lcom/googlecode/javacpp/annotation/Opaque;

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v26

    if-nez v26, :cond_32

    .line 1727
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    jint rposition = rarg == NULL ? 0 : env->GetIntField(rarg, JavaCPP_positionFID);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1728
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    rptr += rposition;"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1729
    if-eqz v17, :cond_32

    .line 1730
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    rsize -= rposition;"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1749
    :cond_32
    :goto_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    if (exc != NULL) {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1750
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        jclass cls = env->GetObjectClass(exc);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1751
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        jmethodID mid = env->GetMethodID(cls, \"toString\", \"()Ljava/lang/String;\");"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1752
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        env->DeleteLocalRef(cls);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1753
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        jstring str = (jstring)env->CallObjectMethod(exc, mid);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1754
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        env->DeleteLocalRef(exc);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1755
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        const char *msg = env->GetStringUTFChars(str, NULL);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1756
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        JavaCPP_exception e(msg);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1757
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        env->ReleaseStringUTFChars(str, msg);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1758
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        env->DeleteLocalRef(str);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1759
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        JavaCPP_detach(attached);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1760
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        throw e;"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1761
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    } else {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1762
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        JavaCPP_detach(attached);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1763
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1765
    sget-object v26, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v26

    if-eq v9, v0, :cond_33

    .line 1766
    invoke-virtual {v9}, Ljava/lang/Class;->isPrimitive()Z

    move-result v26

    if-eqz v26, :cond_37

    .line 1767
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    return "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "rarg;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1787
    :cond_33
    :goto_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "}"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1733
    :cond_34
    const-class v26, Ljava/lang/String;

    move-object/from16 v0, v26

    if-ne v9, v0, :cond_35

    .line 1734
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v21, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " rptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v21, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = rarg == NULL ? NULL : env->GetStringUTFChars(rarg, NULL);"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1735
    if-eqz v17, :cond_32

    .line 1736
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    jint rsize = 0;"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 1738
    :cond_35
    const-class v26, Ljava/nio/Buffer;

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-eqz v26, :cond_36

    .line 1739
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x0

    aget-object v28, v21, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " rptr"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v21, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " = rarg == NULL ? NULL : env->GetDirectBufferAddress(rarg);"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1740
    if-eqz v17, :cond_32

    .line 1741
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    jint rsize = rarg == NULL ? 0 : env->GetDirectBufferCapacity(rarg);"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 1743
    :cond_36
    invoke-virtual {v9}, Ljava/lang/Class;->isPrimitive()Z

    move-result v26

    if-nez v26, :cond_32

    .line 1744
    sget-object v26, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v27, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "Callback \""

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "\" has unsupported return type \""

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual {v9}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, "\". Compilation will most likely fail."

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v26 .. v28}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto/16 :goto_11

    .line 1768
    :cond_37
    if-eqz v17, :cond_38

    .line 1769
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/googlecode/javacpp/Generator;->usesAdapters:Z

    .line 1770
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    return "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "("

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "rptr, rsize);"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 1771
    :cond_38
    const-class v26, Lcom/googlecode/javacpp/FunctionPointer;

    move-object/from16 v0, v26

    invoke-virtual {v0, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v26

    if-eqz v26, :cond_39

    .line 1772
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    return "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "(rptr == NULL ? NULL : rptr->ptr);"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 1773
    :cond_39
    move-object/from16 v0, v18

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByVal;

    move/from16 v26, v0

    if-nez v26, :cond_3a

    move-object/from16 v0, v18

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByRef;

    move/from16 v26, v0

    if-eqz v26, :cond_3b

    .line 1774
    :cond_3a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    if (rptr == NULL) {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1775
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        JavaCPP_log(\"Return pointer address is NULL in callback for "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ".\");"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1776
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        static "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " empty"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const/16 v28, 0x1

    aget-object v28, v21, v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ";"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1777
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "        return empty;"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1778
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    } else {"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1779
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "        return *"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "rptr;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1780
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    const-string v27, "    }"

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 1781
    :cond_3b
    move-object/from16 v0, v18

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    move/from16 v26, v0

    if-eqz v26, :cond_3c

    .line 1782
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    return "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "&rptr;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_12

    .line 1784
    :cond_3c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v26, v0

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "    return "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "rptr;"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_12
.end method

.method private doCallbackAllocator(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 5
    .parameter "cls"
    .parameter "callbackName"

    .prologue
    .line 1793
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Generator;->getFunctionClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 1794
    .local v0, instanceTypeName:Ljava/lang/String;
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "    obj = env->NewWeakGlobalRef(obj);"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1795
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "    if (obj == NULL) {"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1796
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "        JavaCPP_log(\"Error creating global reference of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " instance for callback.\");"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1797
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "        return;"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1798
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "    }"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1799
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "* rptr = new (std::nothrow) "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ";"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1800
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "    if (rptr != NULL) {"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1801
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "        rptr->ptr = &"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ";"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1802
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "        rptr->obj = obj;"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1803
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "        jvalue args[3];"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1804
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "        args[0].j = ptr_to_jlong(rptr);"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1805
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "        args[1].i = 1;"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1806
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "        args[2].j = ptr_to_jlong(&JavaCPP_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_deallocate);"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1807
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->deallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    invoke-virtual {v1, p1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    .line 1808
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "        env->CallNonvirtualVoidMethodA(obj, JavaCPP_getClass(env, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    const-class v4, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual {v3, v4}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "), JavaCPP_initMID, args);"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1810
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "        "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_instance = *rptr;"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1811
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "    }"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1812
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1813
    return-void
.end method

.method private varargs doClasses(ZZLjava/lang/String;[Ljava/lang/Class;)Z
    .locals 27
    .parameter "handleExceptions"
    .parameter "defineAdapters"
    .parameter "classPath"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 196
    .local p4, classes:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "/* DO NOT EDIT THIS FILE - IT IS MACHINE GENERATED */"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 197
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 198
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_0

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "/* DO NOT EDIT THIS FILE - IT IS MACHINE GENERATED */"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 202
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->properties:Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-object/from16 v22, v0

    const-string v23, "generator.define"

    invoke-virtual/range {v22 .. v23}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 203
    .local v19, s:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "#define "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 205
    .end local v19           #s:Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef __APPLE__"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define _JAVASOFT_JNI_MD_H_"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 209
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JNIEXPORT __attribute__((visibility(\"default\")))"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JNIIMPORT"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JNICALL"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 213
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    typedef int jint;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    typedef long long jlong;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    typedef signed char jbyte;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef _WIN32"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define _JAVASOFT_JNI_MD_H_"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JNIEXPORT __declspec(dllexport)"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JNIIMPORT __declspec(dllimport)"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JNICALL __stdcall"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    typedef int jint;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    typedef long long jlong;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    typedef signed char jbyte;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <jni.h>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_2

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <jni.h>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 232
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef ANDROID"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #include <android/log.h>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define NewWeakGlobalRef(obj) NewGlobalRef(obj)"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define DeleteWeakGlobalRef(obj) DeleteGlobalRef(obj)"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <stddef.h>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifndef _WIN32"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #include <stdint.h>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 241
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <stdio.h>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <stdlib.h>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <string.h>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 245
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <exception>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <new>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#define jlong_to_ptr(a) ((void*)(uintptr_t)(a))"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#define ptr_to_jlong(a) ((jlong)(uintptr_t)(a))"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#if defined(_MSC_VER)"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JavaCPP_noinline __declspec(noinline)"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JavaCPP_hidden /* hidden by default */"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 254
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#elif defined(__GNUC__)"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JavaCPP_noinline __attribute__((noinline))"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 256
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JavaCPP_hidden   __attribute__((visibility(\"hidden\")))"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#else"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JavaCPP_noinline"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    #define JavaCPP_hidden"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 262
    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v11, v0, [Ljava/util/List;

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->properties:Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-object/from16 v23, v0

    const-string v24, "generator.include"

    invoke-virtual/range {v23 .. v24}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v23

    aput-object v23, v11, v22

    const/16 v22, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->properties:Lcom/googlecode/javacpp/Loader$ClassProperties;

    move-object/from16 v23, v0

    const-string v24, "generator.cinclude"

    invoke-virtual/range {v23 .. v24}, Lcom/googlecode/javacpp/Loader$ClassProperties;->get(Ljava/lang/String;)Ljava/util/LinkedList;

    move-result-object v23

    aput-object v23, v11, v22

    .line 264
    .local v11, include:[Ljava/util/List;
    const/4 v9, 0x0

    .local v9, i:I
    :goto_1
    array-length v0, v11

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v9, v0, :cond_a

    .line 265
    aget-object v22, v11, v9

    if-eqz v22, :cond_9

    aget-object v22, v11, v9

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v22

    if-lez v22, :cond_9

    .line 266
    const/16 v22, 0x1

    move/from16 v0, v22

    if-ne v9, v0, :cond_3

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "extern \"C\" {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 268
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_3

    .line 269
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef __cplusplus"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "extern \"C\" {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 274
    :cond_3
    aget-object v22, v11, v9

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_4
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 275
    .restart local v19       #s:Ljava/lang/String;
    const-string v13, "#include "

    .line 276
    .local v13, line:Ljava/lang/String;
    const-string v22, "<"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_5

    const-string v22, "\""

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_5

    .line 277
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const/16 v23, 0x22

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 279
    :cond_5
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 280
    const-string v22, ">"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_6

    const-string v22, "\""

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_6

    .line 281
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const/16 v23, 0x22

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 283
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 284
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_4

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 288
    .end local v13           #line:Ljava/lang/String;
    .end local v19           #s:Ljava/lang/String;
    :cond_7
    const/16 v22, 0x1

    move/from16 v0, v22

    if-ne v9, v0, :cond_8

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_8

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef __cplusplus"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 292
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 296
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 264
    :cond_9
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 299
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static JavaVM* JavaCPP_vm = NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "static const char* JavaCPP_classNames["

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->size()I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "] = {"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 301
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 302
    .local v5, classIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/Class;>;"
    const/4 v15, 0x0

    .line 303
    .local v15, maxMemberSize:I
    :cond_b
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_d

    .line 304
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 305
    .local v4, c:Ljava/lang/Class;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "        \""

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x2e

    const/16 v26, 0x2f

    invoke-virtual/range {v24 .. v26}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "\""

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 306
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_c

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, ","

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 309
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->members:Ljava/util/HashMap;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/LinkedList;

    .line 310
    .local v14, m:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    if-eqz v14, :cond_b

    invoke-virtual {v14}, Ljava/util/LinkedList;->size()I

    move-result v22

    move/from16 v0, v22

    if-le v0, v15, :cond_b

    .line 311
    invoke-virtual {v14}, Ljava/util/LinkedList;->size()I

    move-result v15

    goto :goto_3

    .line 314
    .end local v4           #c:Ljava/lang/Class;
    .end local v14           #m:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, " };"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 315
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "static jclass JavaCPP_classes["

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->size()I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "] = { NULL };"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static jmethodID JavaCPP_initMID = NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static jfieldID JavaCPP_addressFID = NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static jfieldID JavaCPP_positionFID = NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 319
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static jfieldID JavaCPP_limitFID = NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 320
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static jfieldID JavaCPP_capacityFID = NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 321
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 322
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static inline void JavaCPP_log(const char* fmt, ...) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 323
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    va_list ap;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    va_start(ap, fmt);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 325
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef ANDROID"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    __android_log_vprint(ANDROID_LOG_ERROR, \"javacpp\", fmt, ap);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 327
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#else"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 328
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    vfprintf(stderr, fmt, ap);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 329
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    fprintf(stderr, \"\\n\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 331
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    va_end(ap);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 332
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 333
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 334
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static JavaCPP_noinline jclass JavaCPP_getClass(JNIEnv* env, int i) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (JavaCPP_classes[i] == NULL && env->PushLocalFrame(1) == 0) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        jclass cls = env->FindClass(JavaCPP_classNames[i]);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        if (cls == NULL || env->ExceptionCheck()) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 338
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            JavaCPP_log(\"Error loading class %s.\", JavaCPP_classNames[i]);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            return NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 340
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 341
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_classes[i] = (jclass)env->NewWeakGlobalRef(cls);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 342
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        if (JavaCPP_classes[i] == NULL || env->ExceptionCheck()) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 343
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            JavaCPP_log(\"Error creating global reference of class %s.\", JavaCPP_classNames[i]);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 344
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            return NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 345
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        env->PopLocalFrame(NULL);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 348
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    return JavaCPP_classes[i];"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 350
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "class JavaCPP_hidden JavaCPP_exception : public std::exception {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 352
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "public:"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JavaCPP_exception(const char* str) throw() {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 354
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        if (str == NULL) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 355
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            strcpy(msg, \"Unknown exception.\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 356
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        } else {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 357
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            strncpy(msg, str, sizeof(msg));"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 358
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            msg[sizeof(msg) - 1] = 0;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 359
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 360
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    virtual const char* what() const throw() { return msg; }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 362
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    char msg[1024];"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 363
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "};"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 364
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 365
    if-eqz p1, :cond_e

    .line 366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static JavaCPP_noinline jthrowable JavaCPP_handleException(JNIEnv* env, int i) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 367
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    jstring str = NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 368
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    try {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 369
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        throw;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 370
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    } catch (std::exception& e) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 371
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        str = env->NewStringUTF(e.what());"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 372
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    } catch (...) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        str = env->NewStringUTF(\"Unknown exception.\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 374
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 375
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    jclass cls = JavaCPP_getClass(env, i);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 376
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    jmethodID mid = env->GetMethodID(cls, \"<init>\", \"(Ljava/lang/String;)V\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 377
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (mid == NULL || env->ExceptionCheck()) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 378
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Error getting constructor ID of %s.\", JavaCPP_classNames[i]);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 379
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    } else {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 381
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return (jthrowable)env->NewObject(cls, mid, str);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 382
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 383
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 384
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 386
    :cond_e
    if-eqz p2, :cond_f

    .line 387
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <vector>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 388
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "template<typename P, typename T = P> class JavaCPP_hidden VectorAdapter {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 389
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "public:"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 390
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    VectorAdapter(const P* ptr, typename std::vector<T>::size_type size) : ptr((P*)ptr), size(size),"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 391
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        vec2(ptr ? std::vector<T>((P*)ptr, (P*)ptr + size) : std::vector<T>()), vec(vec2) { }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 392
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    VectorAdapter(const std::vector<T>& vec) : ptr(0), size(0), vec2(vec), vec(vec2) { }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    VectorAdapter(      std::vector<T>& vec) : ptr(0), size(0), vec(vec) { }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    void assign(P* ptr, typename std::vector<T>::size_type size) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 395
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        this->ptr = ptr;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 396
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        this->size = size;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        vec.assign(ptr, ptr + size);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 399
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    static void deallocate(P* ptr) { delete[] ptr; }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 400
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator P*() {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 401
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        if (vec.size() > size) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 402
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            ptr = new (std::nothrow) P[vec.size()];"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 403
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 404
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        if (ptr) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 405
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            std::copy(vec.begin(), vec.end(), ptr);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 406
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 407
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        size = vec.size();"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 408
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return ptr;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 409
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 410
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator const P*()        { return &vec[0]; }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 411
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator std::vector<T>&() { return vec; }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 412
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator std::vector<T>*() { return ptr ? &vec : 0; }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 413
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    P* ptr;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 414
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    typename std::vector<T>::size_type size;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 415
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    std::vector<T> vec2;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 416
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    std::vector<T>& vec;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 417
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "};"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 418
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 419
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#include <string>"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 420
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "class JavaCPP_hidden StringAdapter {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 421
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "public:"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 422
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    StringAdapter(const          char* ptr, size_t size) : ptr((char*)ptr), size(size),"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 423
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        str2(ptr ? (char*)ptr : \"\"), str(str2) { }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 424
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    StringAdapter(const signed   char* ptr, size_t size) : ptr((char*)ptr), size(size),"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 425
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        str2(ptr ? (char*)ptr : \"\"), str(str2) { }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 426
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    StringAdapter(const unsigned char* ptr, size_t size) : ptr((char*)ptr), size(size),"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 427
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        str2(ptr ? (char*)ptr : \"\"), str(str2) { }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 428
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    StringAdapter(const std::string& str) : ptr(0), size(0), str2(str), str(str2) { }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 429
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    StringAdapter(      std::string& str) : ptr(0), size(0), str(str) { }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 430
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    void assign(char* ptr, size_t size) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 431
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        this->ptr = ptr;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 432
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        this->size = size;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 433
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        str.assign(ptr ? ptr : \"\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 434
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 435
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    static void deallocate(char* ptr) { free(ptr); }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 436
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator char*() {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 437
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        const char* c_str = str.c_str();"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 438
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        if (ptr == NULL || strcmp(c_str, ptr) != 0) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 439
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            ptr = strdup(c_str);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 440
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 441
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        size = strlen(c_str) + 1;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 442
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return ptr;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 443
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 444
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator       signed   char*() { return (signed   char*)(operator char*)(); }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 445
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator       unsigned char*() { return (unsigned char*)(operator char*)(); }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 446
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator const          char*() { return                 str.c_str(); }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator const signed   char*() { return (signed   char*)str.c_str(); }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 448
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator const unsigned char*() { return (unsigned char*)str.c_str(); }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator         std::string&() { return str; }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 450
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    operator         std::string*() { return ptr ? &str : 0; }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 451
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    char* ptr;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 452
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    size_t size;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 453
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    std::string str2;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    std::string& str;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 455
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "};"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 456
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 458
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->functionDefinitions:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->isEmpty()Z

    move-result v22

    if-nez v22, :cond_12

    .line 459
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static JavaCPP_noinline void JavaCPP_detach(int detach) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 460
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (detach > 0 && JavaCPP_vm->DetachCurrentThread() != 0) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 461
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Could not detach the JavaVM from the current thread.\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 462
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 463
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 464
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 465
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "static JavaCPP_noinline int JavaCPP_getEnv(JNIEnv** env) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 466
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    int attached = 0;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 467
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    struct {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 468
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JNIEnv **env;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 469
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        operator JNIEnv**() { return env; } // Android JNI"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 470
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        operator void**() { return (void**)env; } // standard JNI"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 471
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    } env2 = { env };"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 472
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JavaVM *vm = JavaCPP_vm;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 473
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (vm == NULL) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 474
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_10

    .line 475
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifndef ANDROID"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 476
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        int size = 1;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 477
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        if (JNI_GetCreatedJavaVMs(&vm, 1, &size) != 0 || size == 0) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 478
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 480
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            JavaCPP_log(\"Could not get any created JavaVM.\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 481
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            return -1;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 482
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_11

    .line 483
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifndef ANDROID"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 485
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 487
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 488
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (vm->GetEnv((void**)env, JNI_VERSION_1_6) != JNI_OK) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 489
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        if (vm->AttachCurrentThread(env2, NULL) != 0) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 490
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            JavaCPP_log(\"Could not attach the JavaVM to the current thread.\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 491
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            return -1;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 492
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 493
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        attached = 1;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 494
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 495
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (JavaCPP_vm == NULL) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 496
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        if (JNI_OnLoad(vm, NULL) < 0) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 497
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            JavaCPP_detach(attached);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 498
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            return -1;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 499
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 500
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 501
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    return attached;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 502
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 503
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 505
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->functionDefinitions:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_13

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 506
    .restart local v19       #s:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_4

    .line 508
    .end local v19           #s:Ljava/lang/String;
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 509
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->functionPointers:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_5
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_14

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 510
    .restart local v19       #s:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_5

    .line 512
    .end local v19           #s:Ljava/lang/String;
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 513
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->deallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_6
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_16

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 514
    .restart local v4       #c:Ljava/lang/Class;
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "JavaCPP_"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 515
    .local v18, name:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "static void "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "_deallocate("

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 516
    const-class v22, Lcom/googlecode/javacpp/FunctionPointer;

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v22

    if-eqz v22, :cond_15

    .line 517
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/googlecode/javacpp/Generator;->getFunctionClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v20

    .line 518
    .local v20, typeName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "* p) { JNIEnv *e; int a = JavaCPP_getEnv(&e); if (a >= 0) e->DeleteWeakGlobalRef(p->obj); delete p; JavaCPP_detach(a); }"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_6

    .line 520
    .end local v20           #typeName:Ljava/lang/String;
    :cond_15
    invoke-static {v4}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v20

    .line 521
    .local v20, typeName:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v24, 0x0

    aget-object v24, v20, v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " p"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const/16 v24, 0x1

    aget-object v24, v20, v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ") { delete p; }"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 524
    .end local v4           #c:Ljava/lang/Class;
    .end local v18           #name:Ljava/lang/String;
    .end local v20           #typeName:[Ljava/lang/String;
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->arrayDeallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_7
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_17

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 525
    .restart local v4       #c:Ljava/lang/Class;
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "JavaCPP_"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 526
    .restart local v18       #name:Ljava/lang/String;
    invoke-static {v4}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v20

    .line 527
    .restart local v20       #typeName:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "static void "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "_deallocateArray("

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const/16 v24, 0x0

    aget-object v24, v20, v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " p"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const/16 v24, 0x1

    aget-object v24, v20, v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ") { delete[] p; }"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_7

    .line 529
    .end local v4           #c:Ljava/lang/Class;
    .end local v18           #name:Ljava/lang/String;
    .end local v20           #typeName:[Ljava/lang/String;
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 530
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "extern \"C\" {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 531
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_18

    .line 532
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 533
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef __cplusplus"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 534
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "extern \"C\" {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 535
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 536
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "JNIIMPORT int JavaCPP_init(int argc, const char *argv[]);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 537
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 538
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "JNIEXPORT int JavaCPP_init(int argc, const char *argv[]) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 539
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef ANDROID"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 540
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    return JNI_OK;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 541
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#else"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 542
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JavaVM *vm;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 543
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JNIEnv *env;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 544
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    int nOptions = 1 + (argc > 255 ? 255 : argc);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 545
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JavaVMOption options[256] = { { NULL } };"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 546
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    options[0].optionString = (char*)\"-Djava.class.path="

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const/16 v24, 0x5c

    const/16 v25, 0x2f

    move-object/from16 v0, p3

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "\";"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 547
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    for (int i = 1; i < nOptions && argv != NULL; i++) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 548
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        options[i].optionString = (char*)argv[i - 1];"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 549
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 550
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JavaVMInitArgs vm_args = { JNI_VERSION_1_6, nOptions, options };"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 551
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    return JNI_CreateJavaVM(&vm, (void **)&env, &vm_args);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 552
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 553
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 555
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 556
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 557
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JNIEnv* env;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 558
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (vm->GetEnv((void**)&env, JNI_VERSION_1_6) != JNI_OK) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 559
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Could not get JNIEnv for JNI_VERSION_1_6 inside JNI_OnLoad().\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 560
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return JNI_ERR;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 561
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 562
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (JavaCPP_vm == vm) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 563
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return env->GetVersion();"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 564
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 565
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JavaCPP_vm = vm;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 566
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    const char* members["

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->size()I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "]["

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "] = {"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 567
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 568
    :cond_19
    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_1d

    .line 569
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            { "

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 570
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->members:Ljava/util/HashMap;

    move-object/from16 v22, v0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/LinkedList;

    .line 571
    .restart local v14       #m:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    if-nez v14, :cond_1b

    const/16 v16, 0x0

    .line 572
    .local v16, memberIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1a
    :goto_9
    if-eqz v16, :cond_1c

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_1c

    .line 573
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v23, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "\""

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v24, "\""

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 574
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_1a

    .line 575
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, ", "

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_9

    .line 571
    .end local v16           #memberIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1b
    invoke-virtual {v14}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    goto :goto_9

    .line 578
    .restart local v16       #memberIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, " }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 579
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_19

    .line 580
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, ","

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_8

    .line 583
    .end local v14           #m:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    .end local v16           #memberIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, " };"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 584
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    int offsets["

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->size()I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "]["

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "] = {"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 585
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 586
    :cond_1e
    :goto_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_24

    .line 587
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            { "

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 588
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 589
    .restart local v4       #c:Ljava/lang/Class;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->members:Ljava/util/HashMap;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/LinkedList;

    .line 590
    .restart local v14       #m:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    if-nez v14, :cond_21

    const/16 v16, 0x0

    .line 591
    .restart local v16       #memberIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1f
    :goto_b
    if-eqz v16, :cond_23

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_23

    .line 592
    invoke-static {v4}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v20

    .line 593
    .restart local v20       #typeName:[Ljava/lang/String;
    invoke-static/range {v20 .. v20}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 594
    .local v21, valueTypeName:Ljava/lang/String;
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 595
    .local v17, memberName:Ljava/lang/String;
    const-string v22, "sizeof"

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_22

    .line 596
    const-string v22, "void"

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_20

    .line 597
    const-string v21, "void*"

    .line 599
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "sizeof("

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ")"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 603
    :goto_c
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_1f

    .line 604
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, ", "

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_b

    .line 590
    .end local v16           #memberIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v17           #memberName:Ljava/lang/String;
    .end local v20           #typeName:[Ljava/lang/String;
    .end local v21           #valueTypeName:Ljava/lang/String;
    :cond_21
    invoke-virtual {v14}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    goto :goto_b

    .line 601
    .restart local v16       #memberIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v17       #memberName:Ljava/lang/String;
    .restart local v20       #typeName:[Ljava/lang/String;
    .restart local v21       #valueTypeName:Ljava/lang/String;
    :cond_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "offsetof("

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ","

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ")"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_c

    .line 607
    .end local v17           #memberName:Ljava/lang/String;
    .end local v20           #typeName:[Ljava/lang/String;
    .end local v21           #valueTypeName:Ljava/lang/String;
    :cond_23
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, " }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 608
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_1e

    .line 609
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, ","

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_a

    .line 612
    .end local v4           #c:Ljava/lang/Class;
    .end local v14           #m:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    .end local v16           #memberIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, " };"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 613
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    int memberOffsetSizes["

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->size()I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "] = { "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 614
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 615
    :cond_25
    :goto_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_27

    .line 616
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->members:Ljava/util/HashMap;

    move-object/from16 v22, v0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/LinkedList;

    .line 617
    .restart local v14       #m:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v23, v0

    if-nez v14, :cond_26

    const/16 v22, 0x0

    :goto_e
    move-object/from16 v0, v23

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(I)V

    .line 618
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_25

    .line 619
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, ", "

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_d

    .line 617
    :cond_26
    invoke-virtual {v14}, Ljava/util/LinkedList;->size()I

    move-result v22

    goto :goto_e

    .line 622
    .end local v14           #m:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, " };"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 623
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    jmethodID putMemberOffsetMID = env->GetStaticMethodID(JavaCPP_getClass(env, "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    const-class v25, Lcom/googlecode/javacpp/Loader;

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "), \"putMemberOffset\", \"(Ljava/lang/String;Ljava/lang/String;I)V\");"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 625
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (putMemberOffsetMID == NULL || env->ExceptionCheck()) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 626
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Error getting method ID of Loader.putMemberOffset().\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 627
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return JNI_ERR;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 628
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 629
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    for (int i = 0; i < "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->size()I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " && !env->ExceptionCheck(); i++) {"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 630
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        for (int j = 0; j < memberOffsetSizes[i] && !env->ExceptionCheck(); j++) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 631
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            if (env->PushLocalFrame(2) == 0) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 632
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "                jvalue args[3];"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 633
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "                args[0].l = env->NewStringUTF(JavaCPP_classNames[i]);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 634
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "                args[1].l = env->NewStringUTF(members[i][j]);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 635
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "                args[2].i = offsets[i][j];"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 636
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "                env->CallStaticVoidMethodA(JavaCPP_getClass(env, "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    const-class v25, Lcom/googlecode/javacpp/Loader;

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "), putMemberOffsetMID, args);"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 638
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "                env->PopLocalFrame(NULL);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 639
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "            }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 640
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 641
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 642
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    JavaCPP_initMID = env->GetMethodID(JavaCPP_getClass(env, "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    const-class v25, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "), \"init\", \"(JIJ)V\");"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 644
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (JavaCPP_initMID == NULL || env->ExceptionCheck()) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 645
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Error getting method ID of Pointer.init().\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 646
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return JNI_ERR;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 647
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 648
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    JavaCPP_addressFID = env->GetFieldID(JavaCPP_getClass(env, "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    const-class v25, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "), \"address\", \"J\");"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 650
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (JavaCPP_addressFID == NULL || env->ExceptionCheck()) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 651
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Error getting field ID of Pointer.address.\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 652
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return JNI_ERR;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 653
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 654
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    JavaCPP_positionFID = env->GetFieldID(JavaCPP_getClass(env, "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    const-class v25, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "), \"position\", \"I\");"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 656
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (JavaCPP_positionFID == NULL || env->ExceptionCheck()) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 657
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Error getting field ID of Pointer.position.\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 658
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return JNI_ERR;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 659
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 660
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    JavaCPP_limitFID = env->GetFieldID(JavaCPP_getClass(env, "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    const-class v25, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "), \"limit\", \"I\");"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 662
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (JavaCPP_limitFID == NULL || env->ExceptionCheck()) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 663
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Error getting field ID of Pointer.limit.\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 664
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return JNI_ERR;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 665
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 666
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    JavaCPP_capacityFID = env->GetFieldID(JavaCPP_getClass(env, "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    const-class v25, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual/range {v24 .. v25}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "), \"capacity\", \"I\");"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 668
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (JavaCPP_capacityFID == NULL || env->ExceptionCheck()) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 669
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Error getting field ID of Pointer.capacity.\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 670
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return JNI_ERR;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 671
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 672
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclassesInit:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 673
    :cond_28
    :goto_f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_29

    .line 674
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 675
    .restart local v4       #c:Ljava/lang/Class;
    const-class v22, Lcom/googlecode/javacpp/Pointer;

    move-object/from16 v0, v22

    if-eq v4, v0, :cond_28

    .line 678
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    if (JavaCPP_getClass(env, "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->indexOf(Ljava/lang/Object;)I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ") == NULL) {"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 679
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return JNI_ERR;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 680
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_f

    .line 682
    .end local v4           #c:Ljava/lang/Class;
    :cond_29
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    return env->GetVersion();"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 683
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 684
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 685
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_2a

    .line 686
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "JNIIMPORT int JavaCPP_uninit();"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 687
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 688
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "JNIEXPORT int JavaCPP_uninit() {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 689
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef ANDROID"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 690
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    return JNI_OK;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 691
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#else"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 692
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JavaVM *vm = JavaCPP_vm;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 693
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JNI_OnUnload(JavaCPP_vm, NULL);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 694
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    return vm->DestroyJavaVM();"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 695
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 696
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 698
    :cond_2a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 699
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "JNIEXPORT void JNICALL JNI_OnUnload(JavaVM* vm, void* reserved) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 700
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JNIEnv* env;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 701
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    if (vm->GetEnv((void**)&env, JNI_VERSION_1_6) != JNI_OK) {"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 702
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_log(\"Could not get JNIEnv for JNI_VERSION_1_6 inside JNI_OnUnLoad().\");"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 703
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        return;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 704
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 705
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "    for (int i = 0; i < "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->size()I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, "; i++) {"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 706
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        env->DeleteWeakGlobalRef(JavaCPP_classes[i]);"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 707
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "        JavaCPP_classes[i] = NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 708
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    }"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 709
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "    JavaCPP_vm = NULL;"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 711
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 713
    sget-object v22, Lcom/googlecode/javacpp/Generator;->baseClasses:Ljava/util/List;

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_10
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_2b

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Class;

    .line 714
    .local v6, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/googlecode/javacpp/Generator;->doMethods(Ljava/lang/Class;)Z

    goto :goto_10

    .line 717
    .end local v6           #cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_2b
    const/4 v7, 0x0

    .line 718
    .local v7, didSomethingUseful:Z
    move-object/from16 v3, p4

    .local v3, arr$:[Ljava/lang/Class;
    array-length v12, v3

    .local v12, len$:I
    const/4 v10, 0x0

    .local v10, i$:I
    :goto_11
    if-ge v10, v12, :cond_2c

    aget-object v6, v3, v10

    .line 720
    .restart local v6       #cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :try_start_0
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/googlecode/javacpp/Generator;->doMethods(Ljava/lang/Class;)Z
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    move-result v22

    or-int v7, v7, v22

    .line 718
    :goto_12
    add-int/lit8 v10, v10, 0x1

    goto :goto_11

    .line 721
    :catch_0
    move-exception v8

    .line 722
    .local v8, e:Ljava/lang/NoClassDefFoundError;
    sget-object v22, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v23, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Could not generate code for class "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v6}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, ": "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v22 .. v24}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto :goto_12

    .line 726
    .end local v6           #cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v8           #e:Ljava/lang/NoClassDefFoundError;
    :cond_2c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 727
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/io/PrintWriter;->println()V

    .line 728
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    if-eqz v22, :cond_2d

    .line 729
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#ifdef __cplusplus"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 730
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "}"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 731
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    move-object/from16 v22, v0

    const-string v23, "#endif"

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 734
    :cond_2d
    return v7
.end method

.method private doMethods(Ljava/lang/Class;)Z
    .locals 24
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 738
    .local p1, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual/range {p0 .. p1}, Lcom/googlecode/javacpp/Generator;->checkPlatform(Ljava/lang/Class;)Z

    move-result v20

    if-nez v20, :cond_0

    .line 739
    const/4 v5, 0x0

    .line 881
    :goto_0
    return v5

    .line 742
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->members:Ljava/util/HashMap;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/LinkedList;

    .line 743
    .local v11, memberList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const-class v20, Lcom/googlecode/javacpp/annotation/Opaque;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v20

    if-nez v20, :cond_2

    const-class v20, Lcom/googlecode/javacpp/FunctionPointer;

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v20

    if-nez v20, :cond_2

    .line 745
    if-nez v11, :cond_1

    .line 746
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->members:Ljava/util/HashMap;

    move-object/from16 v20, v0

    new-instance v11, Ljava/util/LinkedList;

    .end local v11           #memberList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-direct {v11}, Ljava/util/LinkedList;-><init>()V

    .restart local v11       #memberList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 748
    :cond_1
    const-string v20, "sizeof"

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_2

    .line 749
    const-string v20, "sizeof"

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 753
    :cond_2
    const/4 v5, 0x0

    .line 754
    .local v5, didSomething:Z
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getDeclaredClasses()[Ljava/lang/Class;

    move-result-object v4

    .line 755
    .local v4, classes:[Ljava/lang/Class;
    const/4 v8, 0x0

    .local v8, i:I
    :goto_1
    array-length v0, v4

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v8, v0, :cond_5

    .line 756
    const-class v20, Lcom/googlecode/javacpp/Pointer;

    aget-object v21, v4, v8

    invoke-virtual/range {v20 .. v21}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v20

    if-nez v20, :cond_3

    const-class v20, Lcom/googlecode/javacpp/Pointer$Deallocator;

    aget-object v21, v4, v8

    invoke-virtual/range {v20 .. v21}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v20

    if-eqz v20, :cond_4

    .line 758
    :cond_3
    aget-object v20, v4, v8

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/googlecode/javacpp/Generator;->doMethods(Ljava/lang/Class;)Z

    move-result v20

    or-int v5, v5, v20

    .line 755
    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 762
    :cond_5
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v13

    .line 763
    .local v13, methods:[Ljava/lang/reflect/Method;
    array-length v0, v13

    move/from16 v20, v0

    move/from16 v0, v20

    new-array v2, v0, [Z

    .line 764
    .local v2, callbackAllocators:[Z
    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/googlecode/javacpp/Generator;->getFunctionMethod(Ljava/lang/Class;[Z)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 765
    .local v7, functionMethod:Ljava/lang/reflect/Method;
    if-eqz v7, :cond_6

    .line 766
    invoke-static/range {p1 .. p1}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v19

    .line 767
    .local v19, typeName:[Ljava/lang/String;
    const/16 v20, 0x0

    aget-object v20, v19, v20

    const-string v21, "\\("

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    .line 768
    .local v17, returnConvention:[Ljava/lang/String;
    const/16 v20, 0x1

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x1

    aget-object v23, v17, v23

    aput-object v23, v21, v22

    invoke-static/range {v21 .. v21}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    aput-object v21, v17, v20

    .line 769
    const/16 v20, 0x1

    aget-object v20, v19, v20

    const/16 v21, 0x1

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v16

    .line 770
    .local v16, parameterDeclaration:Ljava/lang/String;
    invoke-direct/range {p0 .. p1}, Lcom/googlecode/javacpp/Generator;->getFunctionClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v9

    .line 771
    .local v9, instanceTypeName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->functionDefinitions:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v20, v0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "struct JavaCPP_hidden "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " {\n"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "    "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "() : ptr(NULL), obj(NULL) { }\n"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "    "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x0

    aget-object v22, v17, v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "operator()"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ";\n"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "    "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x0

    aget-object v22, v19, v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "ptr"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x1

    aget-object v22, v19, v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ";\n"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "    jobject obj; static jmethodID mid;\n"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "};\n"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "jmethodID "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "::mid = NULL;"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    .line 779
    .end local v9           #instanceTypeName:Ljava/lang/String;
    .end local v16           #parameterDeclaration:Ljava/lang/String;
    .end local v17           #returnConvention:[Ljava/lang/String;
    .end local v19           #typeName:[Ljava/lang/String;
    :cond_6
    const/4 v6, 0x1

    .line 780
    .local v6, firstCallback:Z
    const/4 v8, 0x0

    :goto_2
    array-length v0, v13

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v8, v0, :cond_1b

    .line 781
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "_"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    aget-object v21, v13, v8

    invoke-virtual/range {v21 .. v21}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 782
    .local v15, nativeName:Ljava/lang/String;
    aget-object v20, v13, v8

    const-class v21, Lcom/googlecode/javacpp/annotation/Platform;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v20

    check-cast v20, Lcom/googlecode/javacpp/annotation/Platform;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/Generator;->checkPlatform(Lcom/googlecode/javacpp/annotation/Platform;)Z

    move-result v20

    if-nez v20, :cond_8

    .line 780
    :cond_7
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 785
    :cond_8
    aget-object v20, v13, v8

    invoke-static/range {v20 .. v20}, Lcom/googlecode/javacpp/Generator;->getMethodInformation(Ljava/lang/reflect/Method;)Lcom/googlecode/javacpp/Generator$MethodInformation;

    move-result-object v12

    .line 787
    .local v12, methodInfo:Lcom/googlecode/javacpp/Generator$MethodInformation;
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "JavaCPP_"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "_callback"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 788
    .local v3, callbackName:Ljava/lang/String;
    aget-boolean v20, v2, v8

    if-eqz v20, :cond_9

    if-nez v7, :cond_9

    .line 789
    sget-object v20, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v21, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "No callback method call() or apply() has been not declared in \""

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\". No code will be generated for callback allocator."

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto :goto_3

    .line 792
    :cond_9
    aget-boolean v20, v2, v8

    if-nez v20, :cond_a

    aget-object v20, v13, v8

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_c

    if-nez v12, :cond_c

    .line 793
    :cond_a
    aget-object v20, v13, v8

    const-class v21, Lcom/googlecode/javacpp/annotation/Name;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v14

    check-cast v14, Lcom/googlecode/javacpp/annotation/Name;

    .line 794
    .local v14, name:Lcom/googlecode/javacpp/annotation/Name;
    if-eqz v14, :cond_b

    invoke-interface {v14}, Lcom/googlecode/javacpp/annotation/Name;->value()[Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    if-lez v20, :cond_b

    invoke-interface {v14}, Lcom/googlecode/javacpp/annotation/Name;->value()[Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    aget-object v20, v20, v21

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v20

    if-lez v20, :cond_b

    .line 795
    invoke-interface {v14}, Lcom/googlecode/javacpp/annotation/Name;->value()[Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    aget-object v3, v20, v21

    .line 797
    :cond_b
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v7, v3, v6}, Lcom/googlecode/javacpp/Generator;->doCallback(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/String;Z)V

    .line 798
    const/4 v6, 0x0

    .line 799
    const/4 v5, 0x1

    .line 802
    .end local v14           #name:Lcom/googlecode/javacpp/annotation/Name;
    :cond_c
    if-eqz v12, :cond_7

    .line 806
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    move/from16 v20, v0

    if-nez v20, :cond_d

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    move/from16 v20, v0

    if-eqz v20, :cond_e

    :cond_d
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->noOffset:Z

    move/from16 v20, v0

    if-nez v20, :cond_e

    if-eqz v11, :cond_e

    iget v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v20

    if-nez v20, :cond_e

    .line 808
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aget-object v20, v20, v21

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_e

    .line 809
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aget-object v20, v20, v21

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 813
    :cond_e
    const/4 v5, 0x1

    .line 814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "JNIEXPORT "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " JNICALL Java_"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 815
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->overloaded:Z

    move/from16 v20, v0

    if-eqz v20, :cond_f

    .line 816
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "__"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator;->getSignature([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 818
    :cond_f
    iget v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v20

    if-eqz v20, :cond_10

    .line 819
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "(JNIEnv* env, jclass cls"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 823
    :goto_4
    const/4 v10, 0x0

    .local v10, j:I
    :goto_5
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v10, v0, :cond_11

    .line 824
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, ", "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v22, v0

    aget-object v22, v22, v10

    invoke-static/range {v22 .. v22}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " arg"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 823
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 821
    .end local v10           #j:I
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "(JNIEnv* env, jobject obj"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_4

    .line 826
    .restart local v10       #j:I
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, ") {"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 828
    aget-boolean v20, v2, v8

    if-eqz v20, :cond_12

    .line 829
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3}, Lcom/googlecode/javacpp/Generator;->doCallbackAllocator(Ljava/lang/Class;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 831
    :cond_12
    iget v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v20

    if-nez v20, :cond_15

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->allocator:Z

    move/from16 v20, v0

    if-nez v20, :cond_15

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->arrayAllocator:Z

    move/from16 v20, v0

    if-nez v20, :cond_15

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->deallocator:Z

    move/from16 v20, v0

    if-nez v20, :cond_15

    .line 834
    invoke-static/range {p1 .. p1}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v19

    .line 835
    .restart local v19       #typeName:[Ljava/lang/String;
    const-string v20, "void*"

    const/16 v21, 0x0

    aget-object v21, v19, v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_18

    .line 836
    const/16 v20, 0x0

    const-string v21, "char*"

    aput-object v21, v19, v20

    .line 841
    :cond_13
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "    "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x0

    aget-object v22, v19, v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " ptr"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x1

    aget-object v22, v19, v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " = ("

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x0

    aget-object v22, v19, v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x1

    aget-object v22, v19, v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ")jlong_to_ptr(env->GetLongField(obj, JavaCPP_addressFID));"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 843
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    if (ptr == NULL) {"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 844
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "        env->ThrowNew(JavaCPP_getClass(env, "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    const-class v23, Ljava/lang/NullPointerException;

    invoke-virtual/range {v22 .. v23}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "), \"This pointer address is NULL.\");"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 846
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v21, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "        return"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    sget-object v23, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_19

    const-string v20, ";"

    :goto_7
    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 847
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    }"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 848
    const-class v20, Lcom/googlecode/javacpp/FunctionPointer;

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v20

    if-eqz v20, :cond_14

    .line 849
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    if (ptr->ptr == NULL) {"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 850
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "        env->ThrowNew(JavaCPP_getClass(env, "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v22, v0

    const-class v23, Ljava/lang/NullPointerException;

    invoke-virtual/range {v22 .. v23}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "), \"This function pointer address is NULL.\");"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 852
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v21, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "        return"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    sget-object v23, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_1a

    const-string v20, ";"

    :goto_8
    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 853
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    }"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 855
    :cond_14
    const-class v20, Lcom/googlecode/javacpp/annotation/Opaque;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v20

    if-nez v20, :cond_15

    .line 856
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    jint position = env->GetIntField(obj, JavaCPP_positionFID);"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 857
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    ptr += position;"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 858
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->bufferGetter:Z

    move/from16 v20, v0

    if-eqz v20, :cond_15

    .line 859
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    jint size = env->GetIntField(obj, JavaCPP_limitFID);"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 860
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    size -= position;"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 865
    .end local v19           #typeName:[Ljava/lang/String;
    :cond_15
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/googlecode/javacpp/Generator;->doParametersBefore(Lcom/googlecode/javacpp/Generator$MethodInformation;)V

    .line 866
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/googlecode/javacpp/Generator;->doReturnBefore(Lcom/googlecode/javacpp/Generator$MethodInformation;)Ljava/lang/String;

    move-result-object v18

    .line 867
    .local v18, returnPrefix:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v12, v1}, Lcom/googlecode/javacpp/Generator;->doCall(Lcom/googlecode/javacpp/Generator$MethodInformation;Ljava/lang/String;)V

    .line 868
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/googlecode/javacpp/Generator;->doReturnAfter(Lcom/googlecode/javacpp/Generator$MethodInformation;)V

    .line 869
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/googlecode/javacpp/Generator;->doParametersAfter(Lcom/googlecode/javacpp/Generator$MethodInformation;)V

    .line 870
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->throwsException:Ljava/lang/Class;

    move-object/from16 v20, v0

    if-eqz v20, :cond_16

    .line 871
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    if (exc != NULL) {"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 872
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "        env->Throw(exc);"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 873
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    }"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 875
    :cond_16
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    sget-object v21, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_17

    .line 876
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "    return rarg;"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 878
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    const-string v21, "}"

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 837
    .end local v18           #returnPrefix:Ljava/lang/String;
    .restart local v19       #typeName:[Ljava/lang/String;
    :cond_18
    const-class v20, Lcom/googlecode/javacpp/FunctionPointer;

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v20

    if-eqz v20, :cond_13

    .line 838
    const/16 v20, 0x0

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct/range {p0 .. p1}, Lcom/googlecode/javacpp/Generator;->getFunctionClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "*"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    .line 839
    const/16 v20, 0x1

    const-string v21, ""

    aput-object v21, v19, v20

    goto/16 :goto_6

    .line 846
    :cond_19
    const-string v20, " 0;"

    goto/16 :goto_7

    .line 852
    :cond_1a
    const-string v20, " 0;"

    goto/16 :goto_8

    .line 880
    .end local v3           #callbackName:Ljava/lang/String;
    .end local v10           #j:I
    .end local v12           #methodInfo:Lcom/googlecode/javacpp/Generator$MethodInformation;
    .end local v15           #nativeName:Ljava/lang/String;
    .end local v19           #typeName:[Ljava/lang/String;
    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/PrintWriter;->println()V

    goto/16 :goto_0
.end method

.method private doParametersAfter(Lcom/googlecode/javacpp/Generator$MethodInformation;)V
    .locals 14
    .parameter "methodInfo"

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 1400
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->throwsException:Ljava/lang/Class;

    if-eqz v8, :cond_0

    .line 1401
    iput-boolean v13, p0, Lcom/googlecode/javacpp/Generator;->mayThrowExceptions:Z

    .line 1402
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v9, "    } catch (...) {"

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1403
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "        exc = JavaCPP_handleException(env, "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    iget-object v11, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->throwsException:Ljava/lang/Class;

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ");"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1404
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v9, "    }"

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1405
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    invoke-virtual {v8}, Ljava/io/PrintWriter;->println()V

    .line 1407
    :cond_0
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    array-length v8, v8

    if-ge v3, v8, :cond_c

    .line 1408
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterRaw:[Z

    aget-boolean v8, v8, v3

    if-eqz v8, :cond_2

    .line 1407
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1411
    :cond_2
    invoke-static {p1, v3}, Lcom/googlecode/javacpp/Generator;->getParameterBy(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/annotation/Annotation;

    move-result-object v5

    .line 1412
    .local v5, passBy:Ljava/lang/annotation/Annotation;
    invoke-static {p1, v3}, Lcom/googlecode/javacpp/Generator;->getParameterCast(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/String;

    move-result-object v2

    .line 1413
    .local v2, cast:Ljava/lang/String;
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    aget-object v8, v8, v3

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v9, v9, v3

    invoke-static {v8, v9}, Lcom/googlecode/javacpp/Generator;->getCastedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v7

    .line 1414
    .local v7, typeName:[Ljava/lang/String;
    invoke-static {v13, p1, v3}, Lcom/googlecode/javacpp/Generator;->getParameterAdapterInformation(ZLcom/googlecode/javacpp/Generator$MethodInformation;I)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v1

    .line 1415
    .local v1, adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    const-string v8, "void*"

    aget-object v9, v7, v12

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 1416
    const-string v8, "char*"

    aput-object v8, v7, v12

    .line 1418
    :cond_3
    const-class v8, Lcom/googlecode/javacpp/Pointer;

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v9, v9, v3

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 1419
    if-eqz v1, :cond_5

    .line 1420
    const/4 v4, 0x0

    .local v4, k:I
    :goto_2
    iget v8, v1, Lcom/googlecode/javacpp/Generator$AdapterInformation;->argc:I

    if-ge v4, v8, :cond_1

    .line 1421
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v12

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " rptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int v10, v3, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v13

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "adapter"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1422
    iget-object v9, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    jint rsize"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int v10, v3, v4

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " = (jint)adapter"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, ".size"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-lez v4, :cond_4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v11, v4, 0x1

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v11, ";"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_3
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1423
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    if (rptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int v10, v3, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " != "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int v10, v3, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ") {"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1424
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v9, "        jvalue args[3];"

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1425
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "        args[0].j = ptr_to_jlong(rptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int v10, v3, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ");"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1426
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "        args[1].i = rsize"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int v10, v3, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1427
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "        args[2].j = ptr_to_jlong(&("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v1, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "::deallocate));"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1428
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "        env->CallNonvirtualVoidMethodA(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", JavaCPP_getClass(env, "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    const-class v11, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "), JavaCPP_initMID, args);"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1430
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v9, "    } else {"

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1431
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "        env->SetIntField(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", JavaCPP_limitFID, rsize"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int v10, v3, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " + position"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int v10, v3, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ");"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1432
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v9, "    }"

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1420
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2

    .line 1422
    :cond_4
    const-string v8, ";"

    goto/16 :goto_3

    .line 1434
    .end local v4           #k:I
    :cond_5
    instance-of v8, v5, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    if-nez v8, :cond_6

    instance-of v8, v5, Lcom/googlecode/javacpp/annotation/ByPtrRef;

    if-eqz v8, :cond_1

    :cond_6
    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v8, :cond_1

    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-nez v8, :cond_1

    .line 1436
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    const-class v9, Lcom/googlecode/javacpp/annotation/Opaque;

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 1437
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " -= position"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1439
    :cond_7
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    if (arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " != NULL) env->SetLongField(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", JavaCPP_addressFID, ptr_to_jlong(ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "));"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1442
    :cond_8
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    const-class v9, Ljava/lang/String;

    if-ne v8, v9, :cond_9

    .line 1443
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    if (arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " != NULL) env->ReleaseStringUTFChars(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ");"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1444
    :cond_9
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-virtual {v8}, Ljava/lang/Class;->isArray()Z

    move-result v8

    if-eqz v8, :cond_1

    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-virtual {v8}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->isPrimitive()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1446
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    if (arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " != NULL) "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1447
    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueGetter:Z

    if-nez v8, :cond_a

    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v8, :cond_a

    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    if-nez v8, :cond_a

    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-eqz v8, :cond_b

    .line 1449
    :cond_a
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "env->ReleasePrimitiveArrayCritical(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", 0);"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1451
    :cond_b
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-virtual {v8}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    .line 1452
    .local v6, s:Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v12}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1453
    .local v0, S:Ljava/lang/String;
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "env->Release"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "ArrayElements(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", (j"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "*)ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", 0);"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1457
    .end local v0           #S:Ljava/lang/String;
    .end local v1           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v2           #cast:Ljava/lang/String;
    .end local v5           #passBy:Ljava/lang/annotation/Annotation;
    .end local v6           #s:Ljava/lang/String;
    .end local v7           #typeName:[Ljava/lang/String;
    :cond_c
    return-void
.end method

.method private doParametersBefore(Lcom/googlecode/javacpp/Generator$MethodInformation;)V
    .locals 14
    .parameter "methodInfo"

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 885
    const-string v1, ""

    .line 886
    .local v1, adapterLine:Ljava/lang/String;
    const/4 v5, 0x0

    .line 887
    .local v5, prevAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    const/4 v3, 0x0

    .local v3, j:I
    :goto_0
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    array-length v8, v8

    if-ge v3, v8, :cond_1a

    .line 888
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-virtual {v8}, Ljava/lang/Class;->isPrimitive()Z

    move-result v8

    if-nez v8, :cond_3

    .line 889
    invoke-static {p1, v3}, Lcom/googlecode/javacpp/Generator;->getParameterBy(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/annotation/Annotation;

    move-result-object v4

    .line 890
    .local v4, passBy:Ljava/lang/annotation/Annotation;
    invoke-static {p1, v3}, Lcom/googlecode/javacpp/Generator;->getParameterCast(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/String;

    move-result-object v2

    .line 891
    .local v2, cast:Ljava/lang/String;
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-static {v8}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v7

    .line 892
    .local v7, typeName:[Ljava/lang/String;
    invoke-static {v12, p1, v3}, Lcom/googlecode/javacpp/Generator;->getParameterAdapterInformation(ZLcom/googlecode/javacpp/Generator$MethodInformation;I)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v0

    .line 894
    .local v0, adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    const-class v8, Lcom/googlecode/javacpp/FunctionPointer;

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v9, v9, v3

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 895
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    const-class v9, Lcom/googlecode/javacpp/FunctionPointer;

    if-ne v8, v9, :cond_0

    .line 896
    sget-object v8, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v9, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Method \""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\" has an abstract FunctionPointer parameter, "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "but a concrete subclass is required. Compilation will most likely fail."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 899
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v9, v9, v3

    invoke-direct {p0, v9}, Lcom/googlecode/javacpp/Generator;->getFunctionClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "*"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v12

    .line 900
    const-string v8, ""

    aput-object v8, v7, v13

    .line 903
    :cond_1
    aget-object v8, v7, v12

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_2

    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterRaw:[Z

    aget-boolean v8, v8, v3

    if-eqz v8, :cond_4

    .line 904
    :cond_2
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterRaw:[Z

    aput-boolean v13, v8, v3

    .line 905
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-static {v8}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v12

    .line 906
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v12

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 887
    .end local v0           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v2           #cast:Ljava/lang/String;
    .end local v4           #passBy:Ljava/lang/annotation/Annotation;
    .end local v7           #typeName:[Ljava/lang/String;
    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 910
    .restart local v0       #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .restart local v2       #cast:Ljava/lang/String;
    .restart local v4       #passBy:Ljava/lang/annotation/Annotation;
    .restart local v7       #typeName:[Ljava/lang/String;
    :cond_4
    const-string v8, "void*"

    aget-object v9, v7, v12

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 911
    const-string v8, "char*"

    aput-object v8, v7, v12

    .line 913
    :cond_5
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v12

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v13

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 914
    const-class v8, Lcom/googlecode/javacpp/Pointer;

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v9, v9, v3

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 915
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " == NULL ? NULL : ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v12

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v13

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ")jlong_to_ptr(env->GetLongField(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", JavaCPP_addressFID));"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 917
    if-nez v3, :cond_6

    const-class v8, Lcom/googlecode/javacpp/FunctionPointer;

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_6

    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    const-class v9, Lcom/googlecode/javacpp/annotation/Namespace;

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_7

    :cond_6
    instance-of v8, v4, Lcom/googlecode/javacpp/annotation/ByVal;

    if-nez v8, :cond_7

    instance-of v8, v4, Lcom/googlecode/javacpp/annotation/ByRef;

    if-eqz v8, :cond_8

    .line 921
    :cond_7
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    if (ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " == NULL) {"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 922
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "        env->ThrowNew(JavaCPP_getClass(env, "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    const-class v11, Ljava/lang/NullPointerException;

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "), \"Pointer address of argument "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " is NULL.\");"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 924
    iget-object v9, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "        return"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    sget-object v11, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v8, v11, :cond_10

    const-string v8, ";"

    :goto_2
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 925
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v9, "    }"

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 927
    :cond_8
    if-nez v0, :cond_9

    if-eqz v5, :cond_a

    .line 928
    :cond_9
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    jint size"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " == NULL ? 0 : env->GetIntField(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", JavaCPP_limitFID);"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 931
    :cond_a
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    const-class v9, Lcom/googlecode/javacpp/annotation/Opaque;

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_c

    .line 932
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    jint position"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " == NULL ? 0 : env->GetIntField(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", JavaCPP_positionFID);"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 934
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    ptr"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " += position"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 935
    if-nez v0, :cond_b

    if-eqz v5, :cond_c

    .line 936
    :cond_b
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    size"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " -= position"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 971
    :cond_c
    :goto_3
    if-eqz v0, :cond_d

    .line 972
    iput-boolean v13, p0, Lcom/googlecode/javacpp/Generator;->usesAdapters:Z

    .line 973
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v0, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " adapter"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 974
    move-object v5, v0

    .line 976
    :cond_d
    if-eqz v5, :cond_f

    .line 977
    const-class v8, Lcom/googlecode/javacpp/FunctionPointer;

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_e

    .line 979
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 981
    :cond_e
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "ptr"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", size"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 982
    iget v8, v5, Lcom/googlecode/javacpp/Generator$AdapterInformation;->argc:I

    add-int/lit8 v8, v8, -0x1

    iput v8, v5, Lcom/googlecode/javacpp/Generator$AdapterInformation;->argc:I

    if-lez v8, :cond_f

    .line 983
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 986
    :cond_f
    if-eqz v5, :cond_3

    iget v8, v5, Lcom/googlecode/javacpp/Generator$AdapterInformation;->argc:I

    if-gtz v8, :cond_3

    .line 987
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ");"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 988
    const/4 v5, 0x0

    goto/16 :goto_1

    .line 924
    :cond_10
    const-string v8, " 0;"

    goto/16 :goto_2

    .line 939
    :cond_11
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    const-class v9, Ljava/lang/String;

    if-ne v8, v9, :cond_13

    .line 940
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " == NULL ? NULL : env->GetStringUTFChars(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", NULL);"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 941
    if-nez v0, :cond_12

    if-eqz v5, :cond_c

    .line 942
    :cond_12
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    jint size"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = 0;"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 944
    :cond_13
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-virtual {v8}, Ljava/lang/Class;->isArray()Z

    move-result v8

    if-eqz v8, :cond_17

    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-virtual {v8}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->isPrimitive()Z

    move-result v8

    if-eqz v8, :cond_17

    .line 946
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " == NULL ? NULL : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 947
    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-virtual {v8}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    .line 948
    .local v6, s:Ljava/lang/String;
    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueGetter:Z

    if-nez v8, :cond_14

    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v8, :cond_14

    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    if-nez v8, :cond_14

    iget-boolean v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-eqz v8, :cond_16

    .line 950
    :cond_14
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "(j"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "*)env->GetPrimitiveArrayCritical(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", NULL);"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 955
    :goto_4
    if-nez v0, :cond_15

    if-eqz v5, :cond_c

    .line 956
    :cond_15
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    jint size"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " == NULL ? 0 : env->GetArrayLength(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ");"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 952
    :cond_16
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v12}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 953
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "env->Get"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "ArrayElements(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", NULL);"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_4

    .line 959
    .end local v6           #s:Ljava/lang/String;
    :cond_17
    const-class v8, Ljava/nio/Buffer;

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v9, v9, v3

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_19

    .line 960
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " == NULL ? NULL : ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v12

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v13

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ")env->GetDirectBufferAddress(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ");"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 961
    if-nez v0, :cond_18

    if-eqz v5, :cond_c

    .line 962
    :cond_18
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "    jint size"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " == NULL ? 0 : env->GetDirectBufferCapacity(arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ");"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 966
    :cond_19
    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "arg"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 967
    sget-object v8, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v9, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Method \""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\" has an unsupported parameter of type \""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v11, v11, v3

    invoke-virtual {v11}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\". Compilation will most likely fail."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 992
    .end local v0           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v2           #cast:Ljava/lang/String;
    .end local v4           #passBy:Ljava/lang/annotation/Annotation;
    .end local v7           #typeName:[Ljava/lang/String;
    :cond_1a
    return-void
.end method

.method private doReturnAfter(Lcom/googlecode/javacpp/Generator$MethodInformation;)V
    .locals 23
    .parameter "methodInfo"

    .prologue
    .line 1242
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->throwsException:Ljava/lang/Class;

    move-object/from16 v19, v0

    if-eqz v19, :cond_7

    const-string v10, "        "

    .line 1243
    .local v10, indent:Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    invoke-static/range {v19 .. v20}, Lcom/googlecode/javacpp/Generator;->getCastedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v17

    .line 1244
    .local v17, typeName:[Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v14

    .line 1245
    .local v14, returnBy:Ljava/lang/annotation/Annotation;
    invoke-static/range {v17 .. v17}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 1246
    .local v18, valueTypeName:Ljava/lang/String;
    const/16 v19, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    move-object/from16 v20, v0

    move/from16 v0, v19

    move-object/from16 v1, v18

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v5

    .line 1247
    .local v5, adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->deallocator:Z

    move/from16 v19, v0

    if-eqz v19, :cond_8

    const-string v16, ""

    .line 1248
    .local v16, suffix:Ljava/lang/String;
    :goto_1
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->isPrimitive()Z

    move-result v19

    if-nez v19, :cond_0

    if-eqz v5, :cond_0

    .line 1249
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, ")"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 1251
    :cond_0
    const-class v19, Lcom/googlecode/javacpp/Pointer;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-nez v19, :cond_1

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->isArray()Z

    move-result v19

    if-eqz v19, :cond_2

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->isPrimitive()Z

    move-result v19

    if-eqz v19, :cond_2

    .line 1254
    :cond_1
    instance-of v0, v14, Lcom/googlecode/javacpp/annotation/ByVal;

    move/from16 v19, v0

    if-eqz v19, :cond_9

    .line 1255
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, ")"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 1267
    :cond_2
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1269
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    sget-object v20, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_f

    .line 1270
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->allocator:Z

    move/from16 v19, v0

    if-nez v19, :cond_3

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->arrayAllocator:Z

    move/from16 v19, v0

    if-eqz v19, :cond_6

    .line 1271
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, "jint rcapacity = "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->arrayAllocator:Z

    move/from16 v19, v0

    if-eqz v19, :cond_a

    const-string v19, "arg0;"

    :goto_3
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1272
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v19, v0

    const-class v20, Lcom/googlecode/javacpp/Pointer;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_4

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v19, v0

    const-class v20, Lcom/googlecode/javacpp/annotation/NoDeallocator;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_b

    :cond_4
    const/4 v13, 0x1

    .line 1274
    .local v13, noDeallocator:Z
    :goto_4
    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    .local v6, arr$:[Ljava/lang/annotation/Annotation;
    array-length v11, v6

    .local v11, len$:I
    const/4 v9, 0x0

    .local v9, i$:I
    :goto_5
    if-ge v9, v11, :cond_5

    aget-object v4, v6, v9

    .line 1275
    .local v4, a:Ljava/lang/annotation/Annotation;
    instance-of v0, v4, Lcom/googlecode/javacpp/annotation/NoDeallocator;

    move/from16 v19, v0

    if-eqz v19, :cond_c

    .line 1276
    const/4 v13, 0x1

    .line 1280
    .end local v4           #a:Ljava/lang/annotation/Annotation;
    :cond_5
    if-nez v13, :cond_e

    .line 1281
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "jvalue args[3];"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1282
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "args[0].j = ptr_to_jlong(rptr);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "args[1].i = rcapacity;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1284
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "args[2].j = ptr_to_jlong(&JavaCPP_"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1285
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->arrayAllocator:Z

    move/from16 v19, v0

    if-eqz v19, :cond_d

    .line 1286
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    const-string v20, "_deallocateArray);"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->arrayDeallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    .line 1292
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "env->CallNonvirtualVoidMethodA(obj, JavaCPP_getClass(env, "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v21, v0

    const-class v22, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual/range {v21 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "), JavaCPP_initMID, args);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1397
    .end local v6           #arr$:[Ljava/lang/annotation/Annotation;
    .end local v9           #i$:I
    .end local v11           #len$:I
    .end local v13           #noDeallocator:Z
    :cond_6
    :goto_7
    return-void

    .line 1242
    .end local v5           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v10           #indent:Ljava/lang/String;
    .end local v14           #returnBy:Ljava/lang/annotation/Annotation;
    .end local v16           #suffix:Ljava/lang/String;
    .end local v17           #typeName:[Ljava/lang/String;
    .end local v18           #valueTypeName:Ljava/lang/String;
    :cond_7
    const-string v10, "    "

    goto/16 :goto_0

    .line 1247
    .restart local v5       #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .restart local v10       #indent:Ljava/lang/String;
    .restart local v14       #returnBy:Ljava/lang/annotation/Annotation;
    .restart local v17       #typeName:[Ljava/lang/String;
    .restart local v18       #valueTypeName:Ljava/lang/String;
    :cond_8
    const-string v16, ";"

    goto/16 :goto_1

    .line 1256
    .restart local v16       #suffix:Ljava/lang/String;
    :cond_9
    instance-of v0, v14, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    move/from16 v19, v0

    if-eqz v19, :cond_2

    .line 1257
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1258
    const-string v16, ""

    .line 1259
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "if (rptrptr == NULL) {"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1260
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    env->ThrowNew(JavaCPP_getClass(env, "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v21, v0

    const-class v22, Ljava/lang/NullPointerException;

    invoke-virtual/range {v21 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "), \"Return pointer address is NULL.\");"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1262
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "} else {"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    rptr = *rptrptr;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1264
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "}"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1271
    :cond_a
    const-string v19, "1;"

    goto/16 :goto_3

    .line 1272
    :cond_b
    const/4 v13, 0x0

    goto/16 :goto_4

    .line 1274
    .restart local v4       #a:Ljava/lang/annotation/Annotation;
    .restart local v6       #arr$:[Ljava/lang/annotation/Annotation;
    .restart local v9       #i$:I
    .restart local v11       #len$:I
    .restart local v13       #noDeallocator:Z
    :cond_c
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_5

    .line 1289
    .end local v4           #a:Ljava/lang/annotation/Annotation;
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    const-string v20, "_deallocate);"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1290
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->deallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    goto/16 :goto_6

    .line 1295
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "env->SetLongField(obj, JavaCPP_addressFID, ptr_to_jlong(rptr));"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1296
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "env->SetIntField(obj, JavaCPP_limitFID, rcapacity);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1297
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "env->SetIntField(obj, JavaCPP_capacityFID, rcapacity);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 1301
    .end local v6           #arr$:[Ljava/lang/annotation/Annotation;
    .end local v9           #i$:I
    .end local v11           #len$:I
    .end local v13           #noDeallocator:Z
    :cond_f
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    move/from16 v19, v0

    if-nez v19, :cond_6

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    move/from16 v19, v0

    if-nez v19, :cond_6

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->noReturnGetter:Z

    move/from16 v19, v0

    if-nez v19, :cond_6

    .line 1303
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->isPrimitive()Z

    move-result v19

    if-eqz v19, :cond_10

    .line 1304
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "rarg = ("

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ")rvalue;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 1305
    :cond_10
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnRaw:Z

    move/from16 v19, v0

    if-eqz v19, :cond_11

    .line 1306
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "rarg = rptr;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 1308
    :cond_11
    const/4 v12, 0x0

    .line 1309
    .local v12, needInit:Z
    if-eqz v5, :cond_16

    .line 1310
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "rptr = radapter;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1311
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    const-class v20, Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_12

    .line 1312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "jint rcapacity = (jint)radapter.size;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1313
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v20, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, "jlong deallocator = "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    iget-boolean v0, v5, Lcom/googlecode/javacpp/Generator$AdapterInformation;->constant:Z

    move/from16 v19, v0

    if-eqz v19, :cond_15

    const-string v19, "0;"

    :goto_8
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1316
    :cond_12
    const/4 v12, 0x1

    .line 1326
    :cond_13
    :goto_9
    const-class v19, Lcom/googlecode/javacpp/Pointer;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_1b

    .line 1327
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1328
    instance-of v0, v14, Lcom/googlecode/javacpp/annotation/ByVal;

    move/from16 v19, v0

    if-nez v19, :cond_19

    .line 1330
    move-object/from16 v0, p1

    iget v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v19

    if-eqz v19, :cond_18

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    if-lez v19, :cond_18

    .line 1331
    const/4 v8, 0x0

    .local v8, i:I
    :goto_a
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v8, v0, :cond_19

    .line 1332
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lcom/googlecode/javacpp/Generator;->getParameterCast(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/String;

    move-result-object v7

    .line 1333
    .local v7, cast:Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v19, v0

    aget-object v19, v19, v8

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_14

    .line 1334
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "if (rptr == "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "ptr"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ") {"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    rarg = arg"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ";"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "} else "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1331
    :cond_14
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_a

    .line 1313
    .end local v7           #cast:Ljava/lang/String;
    .end local v8           #i:I
    :cond_15
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "ptr_to_jlong(&("

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget-object v0, v5, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v22, "::deallocate));"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    goto/16 :goto_8

    .line 1317
    :cond_16
    instance-of v0, v14, Lcom/googlecode/javacpp/annotation/ByVal;

    move/from16 v19, v0

    if-nez v19, :cond_17

    const-class v19, Lcom/googlecode/javacpp/FunctionPointer;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_13

    .line 1319
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "jint rcapacity = 1;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1320
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "jlong deallocator = ptr_to_jlong(&JavaCPP_"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "_deallocate);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1322
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->deallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    .line 1323
    const/4 v12, 0x1

    goto/16 :goto_9

    .line 1339
    :cond_18
    move-object/from16 v0, p1

    iget v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v19

    if-nez v19, :cond_19

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_19

    .line 1340
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    const-string v20, "if (rptr == ptr) {"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1341
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    rarg = obj;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1342
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "} else "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1345
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    const-string v20, "if (rptr != NULL) {"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    rarg = env->AllocObject(JavaCPP_getClass(env, "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "));"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1348
    if-eqz v12, :cond_1a

    .line 1349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    if (deallocator != 0) {"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1350
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "        jvalue args[3];"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "        args[0].j = ptr_to_jlong(rptr);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1352
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "        args[1].i = rcapacity;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "        args[2].j = deallocator;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1354
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "        env->CallNonvirtualVoidMethodA(rarg, JavaCPP_getClass(env, "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    move-object/from16 v21, v0

    const-class v22, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual/range {v21 .. v22}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "), JavaCPP_initMID, args);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1356
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    } else {"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1357
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "        env->SetLongField(rarg, JavaCPP_addressFID, ptr_to_jlong(rptr));"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1358
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "        env->SetIntField(rarg, JavaCPP_limitFID, rcapacity);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1359
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "        env->SetIntField(rarg, JavaCPP_capacityFID, rcapacity);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1360
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    }"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1364
    :goto_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "}"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 1362
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    env->SetLongField(rarg, JavaCPP_addressFID, ptr_to_jlong(rptr));"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_b

    .line 1365
    :cond_1b
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    const-class v20, Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_1c

    .line 1366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "if (rptr != NULL) {"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1367
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    rarg = env->NewStringUTF(rptr);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1368
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "}"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 1369
    :cond_1c
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->isArray()Z

    move-result v19

    if-eqz v19, :cond_1e

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->isPrimitive()Z

    move-result v19

    if-eqz v19, :cond_1e

    .line 1371
    if-nez v5, :cond_1d

    .line 1372
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "jint rcapacity = rptr != NULL ? 1 : 0;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1374
    :cond_1d
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    .line 1375
    .local v15, s:Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/lang/String;->charAt(I)C

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1376
    .local v3, S:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "if (rptr != NULL) {"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1377
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    rarg = env->New"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "Array(rcapacity);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1378
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    env->Set"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "ArrayRegion(rarg, 0, rcapacity, (j"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "*)rptr);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1379
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "}"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1380
    if-eqz v5, :cond_6

    .line 1381
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "if (deallocator != 0 && rptr != NULL) {"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1382
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    (*(void(*)(void*))jlong_to_ptr(deallocator))((void*)rptr);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1383
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "}"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 1385
    .end local v3           #S:Ljava/lang/String;
    .end local v15           #s:Ljava/lang/String;
    :cond_1e
    const-class v19, Ljava/nio/Buffer;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 1386
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/googlecode/javacpp/Generator$MethodInformation;->bufferGetter:Z

    move/from16 v19, v0

    if-eqz v19, :cond_20

    .line 1387
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "jint rcapacity = size;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1391
    :cond_1f
    :goto_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "if (rptr != NULL) {"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1392
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "    rarg = env->NewDirectByteBuffer(rptr, rcapacity);"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "}"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 1388
    :cond_20
    if-nez v5, :cond_1f

    .line 1389
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "jint rcapacity = rptr != NULL ? 1 : 0;"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_c
.end method

.method private doReturnBefore(Lcom/googlecode/javacpp/Generator$MethodInformation;)Ljava/lang/String;
    .locals 12
    .parameter "methodInfo"

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 995
    const-string v3, ""

    .line 996
    .local v3, returnPrefix:Ljava/lang/String;
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    sget-object v7, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v6, v7, :cond_4

    .line 997
    iget-boolean v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->allocator:Z

    if-nez v6, :cond_0

    iget-boolean v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->arrayAllocator:Z

    if-eqz v6, :cond_2

    .line 998
    :cond_0
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    const-class v7, Lcom/googlecode/javacpp/Pointer;

    if-eq v6, v7, :cond_1

    .line 999
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    if (!env->IsSameObject(env->GetObjectClass(obj), JavaCPP_getClass(env, "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    invoke-virtual {v8, v9}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;->register(Ljava/lang/Object;)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "))) {"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1001
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v7, "        return;"

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1002
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v7, "    }"

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1004
    :cond_1
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    invoke-static {v6}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v4

    .line 1005
    .local v4, typeName:[Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v7, v4, v10

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " rptr"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v4, v11

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1076
    .end local v4           #typeName:[Ljava/lang/String;
    :cond_2
    :goto_0
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->throwsException:Ljava/lang/Class;

    if-eqz v6, :cond_3

    .line 1077
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v7, "    jthrowable exc = NULL;"

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1078
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v7, "    try {"

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1080
    :cond_3
    return-object v3

    .line 1008
    :cond_4
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    iget-object v7, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-static {v6, v7}, Lcom/googlecode/javacpp/Generator;->getCast([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    .line 1009
    .local v1, cast:Ljava/lang/String;
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    iget-object v7, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-static {v6, v7}, Lcom/googlecode/javacpp/Generator;->getCastedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v4

    .line 1010
    .restart local v4       #typeName:[Ljava/lang/String;
    iget-boolean v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v6, :cond_5

    iget-boolean v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-nez v6, :cond_5

    iget-boolean v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->noReturnGetter:Z

    if-eqz v6, :cond_6

    .line 1011
    :cond_5
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v7, "    jobject rarg = obj;"

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 1012
    :cond_6
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1013
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-static {v8}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " rarg = 0;"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1014
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v7, v4, v10

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " rvalue"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v4, v11

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_0

    .line 1016
    :cond_7
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    invoke-static {v6}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    .line 1017
    .local v2, returnBy:Ljava/lang/annotation/Annotation;
    invoke-static {v4}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1019
    .local v5, valueTypeName:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "rptr = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1020
    aget-object v6, v4, v10

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_8

    iget-boolean v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnRaw:Z

    if-eqz v6, :cond_a

    .line 1021
    :cond_8
    iput-boolean v11, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnRaw:Z

    .line 1022
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-static {v6}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v10

    .line 1023
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v4, v10

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " rarg = NULL;"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1024
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v4, v10

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " rptr;"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1069
    :cond_9
    :goto_1
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    invoke-static {v10, v5, v6}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v0

    .line 1070
    .local v0, adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    if-eqz v0, :cond_2

    .line 1071
    iput-boolean v11, p0, Lcom/googlecode/javacpp/Generator;->usesAdapters:Z

    .line 1072
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v0, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " radapter("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_0

    .line 1025
    .end local v0           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    :cond_a
    const-class v6, Lcom/googlecode/javacpp/Pointer;

    iget-object v7, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_b

    const-class v6, Ljava/nio/Buffer;

    iget-object v7, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_b

    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->isArray()Z

    move-result v6

    if-eqz v6, :cond_13

    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-eqz v6, :cond_13

    .line 1029
    :cond_b
    const-class v6, Lcom/googlecode/javacpp/FunctionPointer;

    iget-object v7, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 1030
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-direct {p0, v7}, Lcom/googlecode/javacpp/Generator;->getFunctionClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "*"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v10

    .line 1031
    const-string v6, ""

    aput-object v6, v4, v11

    .line 1032
    invoke-static {v4}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1033
    const-string v3, "if (rptr != NULL) rptr->ptr = "

    .line 1035
    :cond_c
    instance-of v6, v2, Lcom/googlecode/javacpp/annotation/ByVal;

    if-eqz v6, :cond_f

    .line 1036
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->method:Ljava/lang/reflect/Method;

    invoke-static {v6, v8}, Lcom/googlecode/javacpp/Generator;->getNoException(Ljava/lang/Class;Ljava/lang/reflect/Method;)Z

    move-result v6

    if-eqz v6, :cond_e

    const-string v6, "new (std::nothrow) "

    :goto_2
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v4, v11

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1046
    :cond_d
    :goto_3
    iget-boolean v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->bufferGetter:Z

    if-eqz v6, :cond_12

    .line 1047
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v7, "    jobject rarg = NULL;"

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1048
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v7, "    char* rptr;"

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1053
    :goto_4
    const-class v6, Lcom/googlecode/javacpp/FunctionPointer;

    iget-object v7, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 1054
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    rptr = new (std::nothrow) "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ";"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1036
    :cond_e
    const-string v6, "new "

    goto :goto_2

    .line 1038
    :cond_f
    instance-of v6, v2, Lcom/googlecode/javacpp/annotation/ByRef;

    if-eqz v6, :cond_10

    .line 1039
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "&"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 1040
    :cond_10
    instance-of v6, v2, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    if-eqz v6, :cond_d

    .line 1041
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_11

    .line 1042
    aget-object v6, v4, v10

    aget-object v7, v4, v10

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v10, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v10

    .line 1044
    :cond_11
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "rptr = NULL; "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v4, v10

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "* rptrptr"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v4, v11

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_3

    .line 1050
    :cond_12
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-static {v8}, Lcom/googlecode/javacpp/Generator;->getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " rarg = NULL;"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1051
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "    "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v4, v10

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " rptr"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v4, v11

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ";"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 1056
    :cond_13
    iget-object v6, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    if-ne v6, v7, :cond_15

    .line 1057
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v7, "    jstring rarg = NULL;"

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1058
    iget-object v6, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    const-string v7, "    const char* rptr;"

    invoke-virtual {v6, v7}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1059
    instance-of v6, v2, Lcom/googlecode/javacpp/annotation/ByRef;

    if-eqz v6, :cond_14

    .line 1060
    const-string v3, "std::string rstr("

    goto/16 :goto_1

    .line 1062
    :cond_14
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "(const char*)"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_1

    .line 1065
    :cond_15
    sget-object v6, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v7, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Method \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\" has unsupported return type \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    invoke-virtual {v9}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\". Compilation will most likely fail."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method public static varargs getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .locals 18
    .parameter "out"
    .parameter "valueTypeName"
    .parameter "annotations"

    .prologue
    .line 2139
    const/4 v3, 0x0

    .line 2140
    .local v3, adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    const/4 v8, 0x0

    .line 2141
    .local v8, constant:Z
    const-string v6, ""

    .line 2142
    .local v6, cast:Ljava/lang/String;
    move-object/from16 v4, p2

    .local v4, arr$:[Ljava/lang/annotation/Annotation;
    array-length v12, v4

    .local v12, len$:I
    const/4 v11, 0x0

    .local v11, i$:I
    :goto_0
    if-ge v11, v12, :cond_8

    aget-object v1, v4, v11

    .line 2143
    .local v1, a:Ljava/lang/annotation/Annotation;
    instance-of v14, v1, Lcom/googlecode/javacpp/annotation/Adapter;

    if-eqz v14, :cond_5

    move-object v14, v1

    check-cast v14, Lcom/googlecode/javacpp/annotation/Adapter;

    move-object v2, v14

    .line 2144
    .local v2, adapter:Lcom/googlecode/javacpp/annotation/Adapter;
    :goto_1
    if-eqz v2, :cond_6

    .line 2145
    new-instance v3, Lcom/googlecode/javacpp/Generator$AdapterInformation;

    .end local v3           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    invoke-direct {v3}, Lcom/googlecode/javacpp/Generator$AdapterInformation;-><init>()V

    .line 2146
    .restart local v3       #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    invoke-interface {v2}, Lcom/googlecode/javacpp/annotation/Adapter;->value()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v3, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    .line 2147
    invoke-interface {v2}, Lcom/googlecode/javacpp/annotation/Adapter;->argc()I

    move-result v14

    iput v14, v3, Lcom/googlecode/javacpp/Generator$AdapterInformation;->argc:I

    .line 2148
    if-eq v1, v2, :cond_4

    .line 2150
    :try_start_0
    invoke-interface {v1}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v7

    .line 2151
    .local v7, cls:Ljava/lang/Class;
    const-class v14, Lcom/googlecode/javacpp/annotation/Const;

    invoke-virtual {v7, v14}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v14

    if-eqz v14, :cond_0

    .line 2152
    const/4 v8, 0x1

    .line 2155
    :cond_0
    :try_start_1
    const-string v14, "value"

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Class;

    invoke-virtual {v7, v14, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v14

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Object;

    invoke-virtual {v14, v1, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    .line 2156
    .local v13, value:Ljava/lang/String;
    if-eqz v13, :cond_1

    invoke-virtual {v13}, Ljava/lang/String;->length()I
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v14

    if-lez v14, :cond_1

    .line 2157
    move-object/from16 p1, v13

    .line 2164
    .end local v13           #value:Ljava/lang/String;
    :cond_1
    :goto_2
    :try_start_2
    const-class v14, Lcom/googlecode/javacpp/annotation/Cast;

    invoke-virtual {v7, v14}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/googlecode/javacpp/annotation/Cast;

    .line 2165
    .local v5, c:Lcom/googlecode/javacpp/annotation/Cast;
    if-eqz v5, :cond_3

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v14

    if-nez v14, :cond_3

    .line 2166
    invoke-interface {v5}, Lcom/googlecode/javacpp/annotation/Cast;->value()[Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    aget-object v6, v14, v15

    .line 2167
    if-eqz p1, :cond_2

    .line 2168
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "< "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " >"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2170
    :cond_2
    invoke-interface {v5}, Lcom/googlecode/javacpp/annotation/Cast;->value()[Ljava/lang/String;

    move-result-object v14

    array-length v14, v14

    const/4 v15, 0x1

    if-le v14, v15, :cond_3

    .line 2171
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface {v5}, Lcom/googlecode/javacpp/annotation/Cast;->value()[Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x1

    aget-object v15, v15, v16

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v6

    .line 2177
    .end local v5           #c:Lcom/googlecode/javacpp/annotation/Cast;
    .end local v7           #cls:Ljava/lang/Class;
    :cond_3
    :goto_3
    if-eqz p1, :cond_4

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_4

    .line 2178
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v3, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "< "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " >"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v3, Lcom/googlecode/javacpp/Generator$AdapterInformation;->name:Ljava/lang/String;

    .line 2142
    :cond_4
    :goto_4
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_0

    .line 2143
    .end local v2           #adapter:Lcom/googlecode/javacpp/annotation/Adapter;
    :cond_5
    invoke-interface {v1}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v14

    const-class v15, Lcom/googlecode/javacpp/annotation/Adapter;

    invoke-virtual {v14, v15}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v14

    check-cast v14, Lcom/googlecode/javacpp/annotation/Adapter;

    move-object v2, v14

    goto/16 :goto_1

    .line 2160
    .restart local v2       #adapter:Lcom/googlecode/javacpp/annotation/Adapter;
    .restart local v7       #cls:Ljava/lang/Class;
    :catch_0
    move-exception v9

    .line 2162
    .local v9, e:Ljava/lang/NoSuchMethodException;
    const/16 p1, 0x0

    goto/16 :goto_2

    .line 2174
    .end local v7           #cls:Ljava/lang/Class;
    .end local v9           #e:Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v10

    .line 2175
    .local v10, ex:Ljava/lang/Exception;
    sget-object v14, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v15, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Could not invoke the value() method on annotation \""

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\"."

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v15, v0, v10}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 2181
    .end local v10           #ex:Ljava/lang/Exception;
    :cond_6
    instance-of v14, v1, Lcom/googlecode/javacpp/annotation/Const;

    if-eqz v14, :cond_7

    .line 2182
    const/4 v8, 0x1

    goto :goto_4

    .line 2183
    :cond_7
    instance-of v14, v1, Lcom/googlecode/javacpp/annotation/Cast;

    if-eqz v14, :cond_4

    move-object v5, v1

    .line 2184
    check-cast v5, Lcom/googlecode/javacpp/annotation/Cast;

    .line 2185
    .restart local v5       #c:Lcom/googlecode/javacpp/annotation/Cast;
    invoke-interface {v5}, Lcom/googlecode/javacpp/annotation/Cast;->value()[Ljava/lang/String;

    move-result-object v14

    array-length v14, v14

    const/4 v15, 0x1

    if-le v14, v15, :cond_4

    .line 2186
    invoke-interface {v5}, Lcom/googlecode/javacpp/annotation/Cast;->value()[Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    aget-object v6, v14, v15

    goto :goto_4

    .line 2190
    .end local v1           #a:Ljava/lang/annotation/Annotation;
    .end local v2           #adapter:Lcom/googlecode/javacpp/annotation/Adapter;
    .end local v5           #c:Lcom/googlecode/javacpp/annotation/Cast;
    :cond_8
    if-eqz v3, :cond_9

    .line 2191
    iput-object v6, v3, Lcom/googlecode/javacpp/Generator$AdapterInformation;->cast:Ljava/lang/String;

    .line 2192
    iput-boolean v8, v3, Lcom/googlecode/javacpp/Generator$AdapterInformation;->constant:Z

    .line 2194
    :cond_9
    if-eqz p0, :cond_a

    if-eqz v8, :cond_a

    const/4 v3, 0x0

    .end local v3           #adapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    :cond_a
    return-object v3
.end method

.method public static getAnnotatedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;
    .locals 13
    .parameter "annotations"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/annotation/Annotation;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 2270
    invoke-static {p0, p1}, Lcom/googlecode/javacpp/Generator;->getCastedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v8

    .line 2271
    .local v8, typeName:[Ljava/lang/String;
    aget-object v6, v8, v11

    .line 2272
    .local v6, prefix:Ljava/lang/String;
    aget-object v7, v8, v12

    .line 2274
    .local v7, suffix:Ljava/lang/String;
    const/4 v3, 0x0

    .line 2275
    .local v3, casted:Z
    move-object v1, p0

    .local v1, arr$:[Ljava/lang/annotation/Annotation;
    array-length v5, v1

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v0, v1, v4

    .line 2276
    .local v0, a:Ljava/lang/annotation/Annotation;
    instance-of v9, v0, Lcom/googlecode/javacpp/annotation/Cast;

    if-eqz v9, :cond_0

    move-object v9, v0

    check-cast v9, Lcom/googlecode/javacpp/annotation/Cast;

    invoke-interface {v9}, Lcom/googlecode/javacpp/annotation/Cast;->value()[Ljava/lang/String;

    move-result-object v9

    aget-object v9, v9, v11

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-gtz v9, :cond_1

    :cond_0
    instance-of v9, v0, Lcom/googlecode/javacpp/annotation/Const;

    if-eqz v9, :cond_4

    .line 2277
    :cond_1
    const/4 v3, 0x1

    .line 2282
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    :cond_2
    invoke-static {p0}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    .line 2283
    .local v2, by:Ljava/lang/annotation/Annotation;
    instance-of v9, v2, Lcom/googlecode/javacpp/annotation/ByVal;

    if-eqz v9, :cond_5

    .line 2284
    invoke-static {v8}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2293
    :cond_3
    :goto_1
    aput-object v6, v8, v11

    .line 2294
    aput-object v7, v8, v12

    .line 2295
    return-object v8

    .line 2275
    .end local v2           #by:Ljava/lang/annotation/Annotation;
    .restart local v0       #a:Ljava/lang/annotation/Annotation;
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2285
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    .restart local v2       #by:Ljava/lang/annotation/Annotation;
    :cond_5
    instance-of v9, v2, Lcom/googlecode/javacpp/annotation/ByRef;

    if-eqz v9, :cond_6

    .line 2286
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v8}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "&"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 2287
    :cond_6
    instance-of v9, v2, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    if-eqz v9, :cond_7

    if-nez v3, :cond_7

    .line 2288
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "*"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 2289
    :cond_7
    instance-of v9, v2, Lcom/googlecode/javacpp/annotation/ByPtrRef;

    if-eqz v9, :cond_3

    .line 2290
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "&"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1
.end method

.method public static varargs getBehavior([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;
    .locals 9
    .parameter "annotations"

    .prologue
    .line 2243
    const/4 v2, 0x0

    .line 2244
    .local v2, behaviorAnnotation:Ljava/lang/annotation/Annotation;
    move-object v1, p0

    .local v1, arr$:[Ljava/lang/annotation/Annotation;
    array-length v4, v1

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_3

    aget-object v0, v1, v3

    .line 2245
    .local v0, a:Ljava/lang/annotation/Annotation;
    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/Function;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/Allocator;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/ArrayAllocator;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/ValueSetter;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/ValueGetter;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/MemberGetter;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/MemberSetter;

    if-eqz v5, :cond_1

    .line 2248
    :cond_0
    if-eqz v2, :cond_2

    .line 2249
    sget-object v5, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Behavior annotation \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\" already found. Ignoring superfluous annotation \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\"."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 2244
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2252
    :cond_2
    move-object v2, v0

    goto :goto_1

    .line 2256
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    :cond_3
    return-object v2
.end method

.method public static varargs getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;
    .locals 9
    .parameter "annotations"

    .prologue
    .line 2227
    const/4 v2, 0x0

    .line 2228
    .local v2, byAnnotation:Ljava/lang/annotation/Annotation;
    move-object v1, p0

    .local v1, arr$:[Ljava/lang/annotation/Annotation;
    array-length v4, v1

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_3

    aget-object v0, v1, v3

    .line 2229
    .local v0, a:Ljava/lang/annotation/Annotation;
    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/ByPtr;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/ByPtrRef;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/ByRef;

    if-nez v5, :cond_0

    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/ByVal;

    if-eqz v5, :cond_1

    .line 2231
    :cond_0
    if-eqz v2, :cond_2

    .line 2232
    sget-object v5, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\"By\" annotation \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\" already found. Ignoring superfluous annotation \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\"."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 2228
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2235
    :cond_2
    move-object v2, v0

    goto :goto_1

    .line 2239
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    :cond_3
    return-object v2
.end method

.method public static getCPPScopeName(Lcom/googlecode/javacpp/Generator$MethodInformation;)Ljava/lang/String;
    .locals 6
    .parameter "methodInfo"

    .prologue
    .line 2430
    iget-object v3, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    invoke-static {v3}, Lcom/googlecode/javacpp/Generator;->getCPPScopeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    .line 2431
    .local v1, scopeName:Ljava/lang/String;
    iget-object v3, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->method:Ljava/lang/reflect/Method;

    const-class v4, Lcom/googlecode/javacpp/annotation/Namespace;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacpp/annotation/Namespace;

    .line 2432
    .local v0, namespace:Lcom/googlecode/javacpp/annotation/Namespace;
    if-nez v0, :cond_5

    const-string v2, ""

    .line 2433
    .local v2, spaceName:Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/googlecode/javacpp/annotation/Namespace;->value()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    const-string v3, "::"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2434
    :cond_1
    const-string v1, ""

    .line 2436
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    const-string v3, "::"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 2437
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2439
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2440
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4

    const-string v3, "::"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 2441
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2443
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 2432
    .end local v2           #spaceName:Ljava/lang/String;
    :cond_5
    invoke-interface {v0}, Lcom/googlecode/javacpp/annotation/Namespace;->value()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0
.end method

.method public static getCPPScopeName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 2447
    .local p0, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-string v4, ""

    .line 2448
    .local v4, scopeName:Ljava/lang/String;
    :goto_0
    if-eqz p0, :cond_5

    .line 2449
    const-class v6, Lcom/googlecode/javacpp/annotation/Namespace;

    invoke-virtual {p0, v6}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/googlecode/javacpp/annotation/Namespace;

    .line 2450
    .local v2, namespace:Lcom/googlecode/javacpp/annotation/Namespace;
    if-nez v2, :cond_6

    const-string v5, ""

    .line 2451
    .local v5, spaceName:Ljava/lang/String;
    :goto_1
    const-class v6, Lcom/googlecode/javacpp/Pointer;

    invoke-virtual {v6, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_2

    const-class v6, Lcom/googlecode/javacpp/Pointer;

    if-eq p0, v6, :cond_2

    .line 2452
    const-class v6, Lcom/googlecode/javacpp/annotation/Name;

    invoke-virtual {p0, v6}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/googlecode/javacpp/annotation/Name;

    .line 2454
    .local v1, name:Lcom/googlecode/javacpp/annotation/Name;
    if-nez v1, :cond_7

    .line 2455
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 2456
    .local v3, s:Ljava/lang/String;
    const-string v6, "$"

    invoke-virtual {v3, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 2457
    .local v0, i:I
    if-gez v0, :cond_0

    .line 2458
    const-string v6, "."

    invoke-virtual {v3, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 2460
    :cond_0
    add-int/lit8 v6, v0, 0x1

    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 2464
    .end local v0           #i:I
    :goto_2
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_1

    const-string v6, "::"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 2465
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "::"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2467
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2469
    .end local v1           #name:Lcom/googlecode/javacpp/annotation/Name;
    .end local v3           #s:Ljava/lang/String;
    :cond_2
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_3

    const-string v6, "::"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 2470
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "::"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2472
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2473
    if-eqz v2, :cond_4

    invoke-interface {v2}, Lcom/googlecode/javacpp/annotation/Namespace;->value()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_5

    :cond_4
    const-string v6, "::"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 2479
    .end local v2           #namespace:Lcom/googlecode/javacpp/annotation/Namespace;
    .end local v5           #spaceName:Ljava/lang/String;
    :cond_5
    return-object v4

    .line 2450
    .restart local v2       #namespace:Lcom/googlecode/javacpp/annotation/Namespace;
    :cond_6
    invoke-interface {v2}, Lcom/googlecode/javacpp/annotation/Namespace;->value()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_1

    .line 2462
    .restart local v1       #name:Lcom/googlecode/javacpp/annotation/Name;
    .restart local v5       #spaceName:Ljava/lang/String;
    :cond_7
    invoke-interface {v1}, Lcom/googlecode/javacpp/annotation/Name;->value()[Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v3, v6, v7

    .restart local v3       #s:Ljava/lang/String;
    goto/16 :goto_2

    .line 2477
    .end local v1           #name:Lcom/googlecode/javacpp/annotation/Name;
    .end local v3           #s:Ljava/lang/String;
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    move-result-object p0

    .line 2478
    goto/16 :goto_0
.end method

.method public static getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;
    .locals 23
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 2340
    .local p0, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-string v12, ""

    .local v12, prefix:Ljava/lang/String;
    const-string v18, ""

    .line 2341
    .local v18, suffix:Ljava/lang/String;
    const-class v19, Ljava/nio/Buffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_0

    const-class v19, Lcom/googlecode/javacpp/Pointer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_2

    .line 2342
    :cond_0
    const-string v12, "void*"

    .line 2426
    :cond_1
    :goto_0
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v12, v19, v20

    const/16 v20, 0x1

    aput-object v18, v19, v20

    return-object v19

    .line 2343
    :cond_2
    const-class v19, [B

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_3

    const-class v19, Ljava/nio/ByteBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_3

    const-class v19, Lcom/googlecode/javacpp/BytePointer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_4

    .line 2344
    :cond_3
    const-string v12, "signed char*"

    goto :goto_0

    .line 2345
    :cond_4
    const-class v19, [S

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_5

    const-class v19, Ljava/nio/ShortBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_5

    const-class v19, Lcom/googlecode/javacpp/ShortPointer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_6

    .line 2346
    :cond_5
    const-string v12, "short*"

    goto :goto_0

    .line 2347
    :cond_6
    const-class v19, [I

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_7

    const-class v19, Ljava/nio/IntBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_7

    const-class v19, Lcom/googlecode/javacpp/IntPointer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_8

    .line 2348
    :cond_7
    const-string v12, "int*"

    goto :goto_0

    .line 2349
    :cond_8
    const-class v19, [J

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_9

    const-class v19, Ljava/nio/LongBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_9

    const-class v19, Lcom/googlecode/javacpp/LongPointer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_a

    .line 2350
    :cond_9
    const-string v12, "jlong*"

    goto :goto_0

    .line 2351
    :cond_a
    const-class v19, [F

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_b

    const-class v19, Ljava/nio/FloatBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_b

    const-class v19, Lcom/googlecode/javacpp/FloatPointer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_c

    .line 2352
    :cond_b
    const-string v12, "float*"

    goto/16 :goto_0

    .line 2353
    :cond_c
    const-class v19, [D

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_d

    const-class v19, Ljava/nio/DoubleBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_d

    const-class v19, Lcom/googlecode/javacpp/DoublePointer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_e

    .line 2354
    :cond_d
    const-string v12, "double*"

    goto/16 :goto_0

    .line 2355
    :cond_e
    const-class v19, [C

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_f

    const-class v19, Ljava/nio/CharBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_f

    const-class v19, Lcom/googlecode/javacpp/CharPointer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_10

    .line 2356
    :cond_f
    const-string v12, "unsigned short*"

    goto/16 :goto_0

    .line 2357
    :cond_10
    const-class v19, [Z

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_11

    .line 2358
    const-string v12, "unsigned char*"

    goto/16 :goto_0

    .line 2359
    :cond_11
    const-class v19, Lcom/googlecode/javacpp/PointerPointer;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_12

    .line 2360
    const-string v12, "void**"

    goto/16 :goto_0

    .line 2361
    :cond_12
    const-class v19, Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_13

    .line 2362
    const-string v12, "const char*"

    goto/16 :goto_0

    .line 2363
    :cond_13
    sget-object v19, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_14

    .line 2364
    const-string v12, "signed char"

    goto/16 :goto_0

    .line 2365
    :cond_14
    sget-object v19, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_15

    .line 2366
    const-string v12, "jlong"

    goto/16 :goto_0

    .line 2367
    :cond_15
    sget-object v19, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_16

    .line 2368
    const-string v12, "unsigned short"

    goto/16 :goto_0

    .line 2369
    :cond_16
    sget-object v19, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_17

    .line 2370
    const-string v12, "unsigned char"

    goto/16 :goto_0

    .line 2371
    :cond_17
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v19

    if-eqz v19, :cond_18

    .line 2372
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_0

    .line 2373
    :cond_18
    const-class v19, Lcom/googlecode/javacpp/FunctionPointer;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_22

    .line 2374
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/googlecode/javacpp/Generator;->getFunctionMethod(Ljava/lang/Class;[Z)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 2375
    .local v5, functionMethod:Ljava/lang/reflect/Method;
    if-eqz v5, :cond_1

    .line 2376
    const-class v19, Lcom/googlecode/javacpp/annotation/Convention;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lcom/googlecode/javacpp/annotation/Convention;

    .line 2377
    .local v4, convention:Lcom/googlecode/javacpp/annotation/Convention;
    if-nez v4, :cond_1c

    const-string v3, ""

    .line 2378
    .local v3, callingConvention:Ljava/lang/String;
    :goto_1
    const-class v19, Lcom/googlecode/javacpp/annotation/Namespace;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v7

    check-cast v7, Lcom/googlecode/javacpp/annotation/Namespace;

    .line 2379
    .local v7, namespace:Lcom/googlecode/javacpp/annotation/Namespace;
    if-nez v7, :cond_1d

    const-string v17, ""

    .line 2380
    .local v17, spaceName:Ljava/lang/String;
    :goto_2
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_19

    const-string v19, "::"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_19

    .line 2381
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "::"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 2383
    :cond_19
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v14

    .line 2384
    .local v14, returnType:Ljava/lang/Class;
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v11

    .line 2385
    .local v11, parameterTypes:[Ljava/lang/Class;
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v2

    .line 2386
    .local v2, annotations:[Ljava/lang/annotation/Annotation;
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterAnnotations()[[Ljava/lang/annotation/Annotation;

    move-result-object v10

    .line 2387
    .local v10, parameterAnnotations:[[Ljava/lang/annotation/Annotation;
    invoke-static {v2, v14}, Lcom/googlecode/javacpp/Generator;->getAnnotatedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v15

    .line 2388
    .local v15, returnTypeName:[Ljava/lang/String;
    const/16 v19, 0x0

    invoke-static {v15}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v2}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v13

    .line 2389
    .local v13, returnAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    if-eqz v13, :cond_1e

    iget-object v0, v13, Lcom/googlecode/javacpp/Generator$AdapterInformation;->cast:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_1e

    .line 2390
    iget-object v12, v13, Lcom/googlecode/javacpp/Generator$AdapterInformation;->cast:Ljava/lang/String;

    .line 2394
    :goto_3
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " ("

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "*"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 2395
    const-string v18, ")("

    .line 2396
    if-eqz v7, :cond_1a

    const-class v19, Lcom/googlecode/javacpp/Pointer;

    const/16 v20, 0x0

    aget-object v20, v11, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-nez v19, :cond_1a

    .line 2397
    sget-object v19, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v20, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "First parameter of caller method call() or apply() for member function pointer "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " is not a Pointer. Compilation will most likely fail."

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v19 .. v21}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 2400
    :cond_1a
    if-nez v7, :cond_1f

    const/4 v6, 0x0

    .local v6, j:I
    :goto_4
    array-length v0, v11

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v6, v0, :cond_21

    .line 2401
    aget-object v19, v10, v6

    aget-object v20, v11, v6

    invoke-static/range {v19 .. v20}, Lcom/googlecode/javacpp/Generator;->getAnnotatedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v9

    .line 2402
    .local v9, paramTypeName:[Ljava/lang/String;
    const/16 v19, 0x0

    invoke-static {v9}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    aget-object v21, v10, v6

    invoke-static/range {v19 .. v21}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v8

    .line 2403
    .local v8, paramAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    if-eqz v8, :cond_20

    iget-object v0, v8, Lcom/googlecode/javacpp/Generator$AdapterInformation;->cast:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_20

    .line 2404
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget-object v0, v8, Lcom/googlecode/javacpp/Generator$AdapterInformation;->cast:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " arg"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 2408
    :goto_5
    array-length v0, v11

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    move/from16 v0, v19

    if-ge v6, v0, :cond_1b

    .line 2409
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ", "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 2400
    :cond_1b
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 2377
    .end local v2           #annotations:[Ljava/lang/annotation/Annotation;
    .end local v3           #callingConvention:Ljava/lang/String;
    .end local v6           #j:I
    .end local v7           #namespace:Lcom/googlecode/javacpp/annotation/Namespace;
    .end local v8           #paramAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v9           #paramTypeName:[Ljava/lang/String;
    .end local v10           #parameterAnnotations:[[Ljava/lang/annotation/Annotation;
    .end local v11           #parameterTypes:[Ljava/lang/Class;
    .end local v13           #returnAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v14           #returnType:Ljava/lang/Class;
    .end local v15           #returnTypeName:[Ljava/lang/String;
    .end local v17           #spaceName:Ljava/lang/String;
    :cond_1c
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v4}, Lcom/googlecode/javacpp/annotation/Convention;->value()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_1

    .line 2379
    .restart local v3       #callingConvention:Ljava/lang/String;
    .restart local v7       #namespace:Lcom/googlecode/javacpp/annotation/Namespace;
    :cond_1d
    invoke-interface {v7}, Lcom/googlecode/javacpp/annotation/Namespace;->value()Ljava/lang/String;

    move-result-object v17

    goto/16 :goto_2

    .line 2392
    .restart local v2       #annotations:[Ljava/lang/annotation/Annotation;
    .restart local v10       #parameterAnnotations:[[Ljava/lang/annotation/Annotation;
    .restart local v11       #parameterTypes:[Ljava/lang/Class;
    .restart local v13       #returnAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .restart local v14       #returnType:Ljava/lang/Class;
    .restart local v15       #returnTypeName:[Ljava/lang/String;
    .restart local v17       #spaceName:Ljava/lang/String;
    :cond_1e
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v20, 0x0

    aget-object v20, v15, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x1

    aget-object v20, v15, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_3

    .line 2400
    :cond_1f
    const/4 v6, 0x1

    goto/16 :goto_4

    .line 2406
    .restart local v6       #j:I
    .restart local v8       #paramAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .restart local v9       #paramTypeName:[Ljava/lang/String;
    :cond_20
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x0

    aget-object v20, v9, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " arg"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x1

    aget-object v20, v9, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    goto/16 :goto_5

    .line 2412
    .end local v8           #paramAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v9           #paramTypeName:[Ljava/lang/String;
    :cond_21
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ")"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 2413
    const-class v19, Lcom/googlecode/javacpp/annotation/Const;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 2414
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " const"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    goto/16 :goto_0

    .line 2418
    .end local v2           #annotations:[Ljava/lang/annotation/Annotation;
    .end local v3           #callingConvention:Ljava/lang/String;
    .end local v4           #convention:Lcom/googlecode/javacpp/annotation/Convention;
    .end local v5           #functionMethod:Ljava/lang/reflect/Method;
    .end local v6           #j:I
    .end local v7           #namespace:Lcom/googlecode/javacpp/annotation/Namespace;
    .end local v10           #parameterAnnotations:[[Ljava/lang/annotation/Annotation;
    .end local v11           #parameterTypes:[Ljava/lang/Class;
    .end local v13           #returnAdapterInfo:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .end local v14           #returnType:Ljava/lang/Class;
    .end local v15           #returnTypeName:[Ljava/lang/String;
    .end local v17           #spaceName:Ljava/lang/String;
    :cond_22
    invoke-static/range {p0 .. p0}, Lcom/googlecode/javacpp/Generator;->getCPPScopeName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v16

    .line 2419
    .local v16, scopedType:Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_23

    .line 2420
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "*"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_0

    .line 2422
    :cond_23
    sget-object v19, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v20, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "The class "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " does not map to any C++ type. Compilation will most likely fail."

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v19 .. v21}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public static getCast([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)Ljava/lang/String;
    .locals 8
    .parameter "annotations"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/annotation/Annotation;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v7, 0x0

    .line 2207
    const/4 v4, 0x0

    .line 2208
    .local v4, typeName:[Ljava/lang/String;
    move-object v1, p0

    .local v1, arr$:[Ljava/lang/annotation/Annotation;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v0, v1, v2

    .line 2209
    .local v0, a:Ljava/lang/annotation/Annotation;
    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/Cast;

    if-eqz v5, :cond_0

    move-object v5, v0

    check-cast v5, Lcom/googlecode/javacpp/annotation/Cast;

    invoke-interface {v5}, Lcom/googlecode/javacpp/annotation/Cast;->value()[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v7

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-gtz v5, :cond_1

    :cond_0
    instance-of v5, v0, Lcom/googlecode/javacpp/annotation/Const;

    if-eqz v5, :cond_3

    .line 2210
    :cond_1
    invoke-static {p0, p1}, Lcom/googlecode/javacpp/Generator;->getCastedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v4

    .line 2214
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    :cond_2
    if-eqz v4, :cond_4

    array-length v5, v4

    if-lez v5, :cond_4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v4, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    aget-object v6, v4, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1
    return-object v5

    .line 2208
    .restart local v0       #a:Ljava/lang/annotation/Annotation;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2214
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    :cond_4
    const-string v5, ""

    goto :goto_1
.end method

.method public static getCastedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;
    .locals 14
    .parameter "annotations"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/annotation/Annotation;",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 2299
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v9, 0x0

    .line 2300
    .local v9, typeName:[Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, warning:Z
    const/4 v1, 0x0

    .line 2301
    .local v1, adapter:Z
    move-object v2, p0

    .local v2, arr$:[Ljava/lang/annotation/Annotation;
    array-length v5, v2

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_9

    aget-object v0, v2, v4

    .line 2302
    .local v0, a:Ljava/lang/annotation/Annotation;
    instance-of v11, v0, Lcom/googlecode/javacpp/annotation/Cast;

    if-eqz v11, :cond_4

    .line 2303
    if-eqz v9, :cond_2

    const/4 v10, 0x1

    .line 2304
    :goto_1
    check-cast v0, Lcom/googlecode/javacpp/annotation/Cast;

    .end local v0           #a:Ljava/lang/annotation/Annotation;
    invoke-interface {v0}, Lcom/googlecode/javacpp/annotation/Cast;->value()[Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    aget-object v7, v11, v12

    .local v7, prefix:Ljava/lang/String;
    const-string v8, ""

    .line 2305
    .local v8, suffix:Ljava/lang/String;
    const/16 v11, 0x29

    invoke-virtual {v7, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 2306
    .local v6, parenthesis:I
    if-lez v6, :cond_0

    .line 2307
    invoke-virtual {v7, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 2308
    const/4 v11, 0x0

    invoke-virtual {v7, v11, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 2310
    :cond_0
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_3

    const/4 v11, 0x2

    new-array v9, v11, [Ljava/lang/String;

    .end local v9           #typeName:[Ljava/lang/String;
    const/4 v11, 0x0

    aput-object v7, v9, v11

    const/4 v11, 0x1

    aput-object v8, v9, v11

    .line 2301
    .end local v6           #parenthesis:I
    .end local v7           #prefix:Ljava/lang/String;
    .end local v8           #suffix:Ljava/lang/String;
    .restart local v9       #typeName:[Ljava/lang/String;
    :cond_1
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2303
    .restart local v0       #a:Ljava/lang/annotation/Annotation;
    :cond_2
    const/4 v10, 0x0

    goto :goto_1

    .line 2310
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    .restart local v6       #parenthesis:I
    .restart local v7       #prefix:Ljava/lang/String;
    .restart local v8       #suffix:Ljava/lang/String;
    :cond_3
    const/4 v9, 0x0

    goto :goto_2

    .line 2311
    .end local v6           #parenthesis:I
    .end local v7           #prefix:Ljava/lang/String;
    .end local v8           #suffix:Ljava/lang/String;
    .restart local v0       #a:Ljava/lang/annotation/Annotation;
    :cond_4
    instance-of v11, v0, Lcom/googlecode/javacpp/annotation/Const;

    if-eqz v11, :cond_7

    .line 2312
    if-eqz v9, :cond_5

    const/4 v10, 0x1

    :goto_3
    if-nez v10, :cond_1

    .line 2316
    invoke-static {p1}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v9

    .line 2317
    check-cast v0, Lcom/googlecode/javacpp/annotation/Const;

    .end local v0           #a:Ljava/lang/annotation/Annotation;
    invoke-interface {v0}, Lcom/googlecode/javacpp/annotation/Const;->value()Z

    move-result v11

    if-eqz v11, :cond_6

    .line 2318
    const/4 v11, 0x0

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v9}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " const *"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v9, v11

    .line 2322
    :goto_4
    invoke-static {p0}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v3

    .line 2323
    .local v3, by:Ljava/lang/annotation/Annotation;
    instance-of v11, v3, Lcom/googlecode/javacpp/annotation/ByPtrPtr;

    if-eqz v11, :cond_1

    .line 2324
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v12, 0x0

    aget-object v13, v9, v12

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v13, "*"

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v12

    goto :goto_2

    .line 2312
    .end local v3           #by:Ljava/lang/annotation/Annotation;
    .restart local v0       #a:Ljava/lang/annotation/Annotation;
    :cond_5
    const/4 v10, 0x0

    goto :goto_3

    .line 2320
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    :cond_6
    const/4 v11, 0x0

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "const "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v13, 0x0

    aget-object v13, v9, v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v9, v11

    goto :goto_4

    .line 2326
    .restart local v0       #a:Ljava/lang/annotation/Annotation;
    :cond_7
    instance-of v11, v0, Lcom/googlecode/javacpp/annotation/Adapter;

    if-nez v11, :cond_8

    invoke-interface {v0}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v11

    const-class v12, Lcom/googlecode/javacpp/annotation/Adapter;

    invoke-virtual {v11, v12}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 2327
    :cond_8
    const/4 v1, 0x1

    goto/16 :goto_2

    .line 2330
    .end local v0           #a:Ljava/lang/annotation/Annotation;
    :cond_9
    if-eqz v10, :cond_a

    if-nez v1, :cond_a

    .line 2331
    sget-object v11, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v12, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v13, "Without \"Adapter\", \"Cast\" and \"Const\" annotations are mutually exclusive."

    invoke-virtual {v11, v12, v13}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 2333
    :cond_a
    if-nez v9, :cond_b

    .line 2334
    invoke-static {p1}, Lcom/googlecode/javacpp/Generator;->getCPPTypeName(Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v9

    .line 2336
    :cond_b
    return-object v9
.end method

.method private getFunctionClassName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1863
    .local p1, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-class v1, Lcom/googlecode/javacpp/annotation/Name;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacpp/annotation/Name;

    .line 1864
    .local v0, name:Lcom/googlecode/javacpp/annotation/Name;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/googlecode/javacpp/annotation/Name;->value()[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "JavaCPP_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/googlecode/javacpp/Generator;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private static getFunctionMethod(Ljava/lang/Class;[Z)Ljava/lang/reflect/Method;
    .locals 8
    .parameter
    .parameter "callbackAllocators"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[Z)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 1868
    .local p0, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-class v7, Lcom/googlecode/javacpp/FunctionPointer;

    invoke-virtual {v7, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 1869
    const/4 v0, 0x0

    .line 1891
    :cond_0
    return-object v0

    .line 1871
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1872
    .local v3, methods:[Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    .line 1873
    .local v0, functionMethod:Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v7, v3

    if-ge v1, v7, :cond_0

    .line 1874
    aget-object v7, v3, v1

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1875
    .local v2, methodName:Ljava/lang/String;
    aget-object v7, v3, v1

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    .line 1876
    .local v4, modifiers:I
    aget-object v7, v3, v1

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    .line 1877
    .local v5, parameterTypes:[Ljava/lang/Class;
    aget-object v7, v3, v1

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v6

    .line 1878
    .local v6, returnType:Ljava/lang/Class;
    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1873
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1881
    :cond_3
    if-eqz p1, :cond_4

    const-string v7, "allocate"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isNative(I)Z

    move-result v7

    if-eqz v7, :cond_4

    sget-object v7, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v6, v7, :cond_4

    array-length v7, v5

    if-nez v7, :cond_4

    .line 1885
    const/4 v7, 0x1

    aput-boolean v7, p1, v1

    goto :goto_1

    .line 1886
    :cond_4
    const-string v7, "call"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    const-string v7, "apply"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1888
    :cond_5
    aget-object v0, v3, v1

    goto :goto_1
.end method

.method public static getJNITypeName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 1
    .parameter "type"

    .prologue
    .line 2483
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_0

    .line 2484
    const-string v0, "jbyte"

    .line 2524
    :goto_0
    return-object v0

    .line 2485
    :cond_0
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_1

    .line 2486
    const-string v0, "jshort"

    goto :goto_0

    .line 2487
    :cond_1
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_2

    .line 2488
    const-string v0, "jint"

    goto :goto_0

    .line 2489
    :cond_2
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_3

    .line 2490
    const-string v0, "jlong"

    goto :goto_0

    .line 2491
    :cond_3
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_4

    .line 2492
    const-string v0, "jfloat"

    goto :goto_0

    .line 2493
    :cond_4
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_5

    .line 2494
    const-string v0, "jdouble"

    goto :goto_0

    .line 2495
    :cond_5
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_6

    .line 2496
    const-string v0, "jchar"

    goto :goto_0

    .line 2497
    :cond_6
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_7

    .line 2498
    const-string v0, "jboolean"

    goto :goto_0

    .line 2499
    :cond_7
    const-class v0, [B

    if-ne p0, v0, :cond_8

    .line 2500
    const-string v0, "jbyteArray"

    goto :goto_0

    .line 2501
    :cond_8
    const-class v0, [S

    if-ne p0, v0, :cond_9

    .line 2502
    const-string v0, "jshortArray"

    goto :goto_0

    .line 2503
    :cond_9
    const-class v0, [I

    if-ne p0, v0, :cond_a

    .line 2504
    const-string v0, "jintArray"

    goto :goto_0

    .line 2505
    :cond_a
    const-class v0, [J

    if-ne p0, v0, :cond_b

    .line 2506
    const-string v0, "jlongArray"

    goto :goto_0

    .line 2507
    :cond_b
    const-class v0, [F

    if-ne p0, v0, :cond_c

    .line 2508
    const-string v0, "jfloatArray"

    goto :goto_0

    .line 2509
    :cond_c
    const-class v0, [D

    if-ne p0, v0, :cond_d

    .line 2510
    const-string v0, "jdoubleArray"

    goto :goto_0

    .line 2511
    :cond_d
    const-class v0, [C

    if-ne p0, v0, :cond_e

    .line 2512
    const-string v0, "jcharArray"

    goto :goto_0

    .line 2513
    :cond_e
    const-class v0, [Z

    if-ne p0, v0, :cond_f

    .line 2514
    const-string v0, "jbooleanArray"

    goto :goto_0

    .line 2515
    :cond_f
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 2516
    const-string v0, "jobjectArray"

    goto :goto_0

    .line 2517
    :cond_10
    const-class v0, Ljava/lang/String;

    if-ne p0, v0, :cond_11

    .line 2518
    const-string v0, "jstring"

    goto :goto_0

    .line 2519
    :cond_11
    const-class v0, Ljava/lang/Class;

    if-ne p0, v0, :cond_12

    .line 2520
    const-string v0, "jclass"

    goto :goto_0

    .line 2521
    :cond_12
    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_13

    .line 2522
    const-string v0, "void"

    goto/16 :goto_0

    .line 2524
    :cond_13
    const-string v0, "jobject"

    goto/16 :goto_0
.end method

.method public static getMethodInformation(Ljava/lang/reflect/Method;)Lcom/googlecode/javacpp/Generator$MethodInformation;
    .locals 34
    .parameter "method"

    .prologue
    .line 1911
    invoke-virtual/range {p0 .. p0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v30

    invoke-static/range {v30 .. v30}, Ljava/lang/reflect/Modifier;->isNative(I)Z

    move-result v30

    if-nez v30, :cond_1

    .line 1912
    const/4 v12, 0x0

    .line 2098
    :cond_0
    :goto_0
    return-object v12

    .line 1914
    :cond_1
    new-instance v12, Lcom/googlecode/javacpp/Generator$MethodInformation;

    invoke-direct {v12}, Lcom/googlecode/javacpp/Generator$MethodInformation;-><init>()V

    .line 1915
    .local v12, info:Lcom/googlecode/javacpp/Generator$MethodInformation;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v30

    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    .line 1916
    move-object/from16 v0, p0

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->method:Ljava/lang/reflect/Method;

    .line 1917
    invoke-virtual/range {p0 .. p0}, Ljava/lang/reflect/Method;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v30

    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    .line 1918
    invoke-virtual/range {p0 .. p0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v30

    move/from16 v0, v30

    iput v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    .line 1919
    invoke-virtual/range {p0 .. p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v30

    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    .line 1920
    invoke-virtual/range {p0 .. p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->name:Ljava/lang/String;

    .line 1921
    const-class v30, Lcom/googlecode/javacpp/annotation/Name;

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v20

    check-cast v20, Lcom/googlecode/javacpp/annotation/Name;

    .line 1922
    .local v20, name:Lcom/googlecode/javacpp/annotation/Name;
    if-eqz v20, :cond_3

    invoke-interface/range {v20 .. v20}, Lcom/googlecode/javacpp/annotation/Name;->value()[Ljava/lang/String;

    move-result-object v30

    :goto_1
    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    .line 1923
    const-class v30, Lcom/googlecode/javacpp/annotation/Index;

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v11

    check-cast v11, Lcom/googlecode/javacpp/annotation/Index;

    .line 1924
    .local v11, index:Lcom/googlecode/javacpp/annotation/Index;
    if-eqz v11, :cond_4

    invoke-interface {v11}, Lcom/googlecode/javacpp/annotation/Index;->value()I

    move-result v30

    :goto_2
    move/from16 v0, v30

    iput v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->dim:I

    .line 1925
    invoke-virtual/range {p0 .. p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v30

    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    .line 1926
    invoke-virtual/range {p0 .. p0}, Ljava/lang/reflect/Method;->getParameterAnnotations()[[Ljava/lang/annotation/Annotation;

    move-result-object v30

    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    .line 1927
    const-class v30, Lcom/googlecode/javacpp/annotation/Raw;

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v30

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnRaw:Z

    .line 1928
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnRaw:Z

    move/from16 v30, v0

    if-eqz v30, :cond_5

    const-class v30, Lcom/googlecode/javacpp/annotation/Raw;

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v30

    check-cast v30, Lcom/googlecode/javacpp/annotation/Raw;

    invoke-interface/range {v30 .. v30}, Lcom/googlecode/javacpp/annotation/Raw;->withEnv()Z

    move-result v30

    :goto_3
    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->withEnv:Z

    .line 1929
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    new-array v0, v0, [Z

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterRaw:[Z

    .line 1930
    const/4 v10, 0x0

    .local v10, i:I
    :goto_4
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    if-ge v10, v0, :cond_7

    .line 1931
    const/4 v13, 0x0

    .local v13, j:I
    :goto_5
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    move-object/from16 v30, v0

    aget-object v30, v30, v10

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    if-ge v13, v0, :cond_6

    .line 1932
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    move-object/from16 v30, v0

    aget-object v30, v30, v10

    aget-object v30, v30, v13

    move-object/from16 v0, v30

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/Raw;

    move/from16 v30, v0

    if-eqz v30, :cond_2

    .line 1933
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterRaw:[Z

    move-object/from16 v30, v0

    const/16 v31, 0x1

    aput-boolean v31, v30, v10

    .line 1934
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->withEnv:Z

    move/from16 v31, v0

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    move-object/from16 v30, v0

    aget-object v30, v30, v10

    aget-object v30, v30, v13

    check-cast v30, Lcom/googlecode/javacpp/annotation/Raw;

    invoke-interface/range {v30 .. v30}, Lcom/googlecode/javacpp/annotation/Raw;->withEnv()Z

    move-result v30

    or-int v30, v30, v31

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->withEnv:Z

    .line 1931
    :cond_2
    add-int/lit8 v13, v13, 0x1

    goto :goto_5

    .line 1922
    .end local v10           #i:I
    .end local v11           #index:Lcom/googlecode/javacpp/annotation/Index;
    .end local v13           #j:I
    :cond_3
    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->name:Ljava/lang/String;

    move-object/from16 v32, v0

    aput-object v32, v30, v31

    goto/16 :goto_1

    .line 1924
    .restart local v11       #index:Lcom/googlecode/javacpp/annotation/Index;
    :cond_4
    const/16 v30, 0x0

    goto/16 :goto_2

    .line 1928
    :cond_5
    const/16 v30, 0x0

    goto :goto_3

    .line 1930
    .restart local v10       #i:I
    .restart local v13       #j:I
    :cond_6
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 1939
    .end local v13           #j:I
    :cond_7
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v30, v0

    sget-object v31, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_8

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    if-lez v30, :cond_c

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget-object v30, v30, v31

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->isArray()Z

    move-result v30

    if-eqz v30, :cond_c

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget-object v30, v30, v31

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->isPrimitive()Z

    move-result v30

    if-eqz v30, :cond_c

    :cond_8
    const/4 v5, 0x1

    .line 1941
    .local v5, canBeGetter:Z
    :goto_6
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v30, v0

    sget-object v31, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-eq v0, v1, :cond_9

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v30, v0

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v31, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_d

    :cond_9
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    if-lez v30, :cond_d

    const/4 v6, 0x1

    .line 1951
    .local v6, canBeSetter:Z
    :goto_7
    iget v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    move/from16 v30, v0

    invoke-static/range {v30 .. v30}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v30

    if-nez v30, :cond_e

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v30, v0

    sget-object v31, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_e

    const/4 v3, 0x1

    .line 1953
    .local v3, canBeAllocator:Z
    :goto_8
    if-eqz v3, :cond_f

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    const/16 v31, 0x1

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_f

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget-object v30, v30, v31

    sget-object v31, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-eq v0, v1, :cond_a

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget-object v30, v30, v31

    sget-object v31, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_f

    :cond_a
    const/4 v4, 0x1

    .line 1956
    .local v4, canBeArrayAllocator:Z
    :goto_9
    const/16 v28, 0x0

    .line 1957
    .local v28, valueGetter:Z
    const/16 v29, 0x0

    .line 1958
    .local v29, valueSetter:Z
    const/4 v14, 0x0

    .line 1959
    .local v14, memberGetter:Z
    const/4 v15, 0x0

    .line 1960
    .local v15, memberSetter:Z
    const/16 v21, 0x0

    .line 1961
    .local v21, noReturnGetter:Z
    const/16 v22, 0x0

    .line 1962
    .local v22, pairedMethod:Ljava/lang/reflect/Method;
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v18

    .line 1963
    .local v18, methods:[Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    :goto_a
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    if-ge v10, v0, :cond_1f

    .line 1964
    aget-object v16, v18, v10

    .line 1965
    .local v16, method2:Ljava/lang/reflect/Method;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v19

    .line 1966
    .local v19, modifiers2:I
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v26

    .line 1967
    .local v26, returnType2:Ljava/lang/Class;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v17

    .line 1968
    .local v17, methodName2:Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v25

    .line 1970
    .local v25, parameterTypes2:[Ljava/lang/Class;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-nez v30, :cond_b

    invoke-static/range {v19 .. v19}, Ljava/lang/reflect/Modifier;->isNative(I)Z

    move-result v30

    if-nez v30, :cond_10

    .line 1963
    .end local v26           #returnType2:Ljava/lang/Class;
    :cond_b
    :goto_b
    add-int/lit8 v10, v10, 0x1

    goto :goto_a

    .line 1939
    .end local v3           #canBeAllocator:Z
    .end local v4           #canBeArrayAllocator:Z
    .end local v5           #canBeGetter:Z
    .end local v6           #canBeSetter:Z
    .end local v14           #memberGetter:Z
    .end local v15           #memberSetter:Z
    .end local v16           #method2:Ljava/lang/reflect/Method;
    .end local v17           #methodName2:Ljava/lang/String;
    .end local v18           #methods:[Ljava/lang/reflect/Method;
    .end local v19           #modifiers2:I
    .end local v21           #noReturnGetter:Z
    .end local v22           #pairedMethod:Ljava/lang/reflect/Method;
    .end local v25           #parameterTypes2:[Ljava/lang/Class;
    .end local v28           #valueGetter:Z
    .end local v29           #valueSetter:Z
    :cond_c
    const/4 v5, 0x0

    goto/16 :goto_6

    .line 1941
    .restart local v5       #canBeGetter:Z
    :cond_d
    const/4 v6, 0x0

    goto/16 :goto_7

    .line 1951
    .restart local v6       #canBeSetter:Z
    :cond_e
    const/4 v3, 0x0

    goto :goto_8

    .line 1953
    .restart local v3       #canBeAllocator:Z
    :cond_f
    const/4 v4, 0x0

    goto :goto_9

    .line 1974
    .restart local v4       #canBeArrayAllocator:Z
    .restart local v14       #memberGetter:Z
    .restart local v15       #memberSetter:Z
    .restart local v16       #method2:Ljava/lang/reflect/Method;
    .restart local v17       #methodName2:Ljava/lang/String;
    .restart local v18       #methods:[Ljava/lang/reflect/Method;
    .restart local v19       #modifiers2:I
    .restart local v21       #noReturnGetter:Z
    .restart local v22       #pairedMethod:Ljava/lang/reflect/Method;
    .restart local v25       #parameterTypes2:[Ljava/lang/Class;
    .restart local v26       #returnType2:Ljava/lang/Class;
    .restart local v28       #valueGetter:Z
    .restart local v29       #valueSetter:Z
    :cond_10
    const/4 v7, 0x0

    .line 1975
    .local v7, canBeValueGetter:Z
    const/4 v8, 0x0

    .line 1976
    .local v8, canBeValueSetter:Z
    if-eqz v5, :cond_12

    const-string v30, "get"

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->name:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_12

    const-string v30, "put"

    move-object/from16 v0, v30

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_12

    .line 1977
    const/4 v7, 0x1

    .line 1986
    :goto_c
    const/16 v27, 0x1

    .line 1987
    .local v27, sameIndexParameters:Z
    const/4 v13, 0x0

    .restart local v13       #j:I
    :goto_d
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    if-ge v13, v0, :cond_14

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    if-ge v13, v0, :cond_14

    .line 1988
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    aget-object v30, v30, v13

    aget-object v31, v25, v13

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-eq v0, v1, :cond_11

    .line 1989
    const/16 v27, 0x0

    .line 1987
    :cond_11
    add-int/lit8 v13, v13, 0x1

    goto :goto_d

    .line 1978
    .end local v13           #j:I
    .end local v27           #sameIndexParameters:Z
    :cond_12
    if-eqz v6, :cond_13

    const-string v30, "put"

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->name:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_13

    const-string v30, "get"

    move-object/from16 v0, v30

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_13

    .line 1979
    const/4 v8, 0x1

    goto :goto_c

    .line 1980
    :cond_13
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->name:Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_b

    .line 1981
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->overloaded:Z

    goto :goto_c

    .line 1992
    .restart local v13       #j:I
    .restart local v27       #sameIndexParameters:Z
    :cond_14
    if-eqz v27, :cond_b

    .line 1996
    if-eqz v7, :cond_16

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    if-lez v30, :cond_16

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget-object v30, v30, v31

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->isArray()Z

    move-result v30

    if-eqz v30, :cond_16

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget-object v30, v30, v31

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->isPrimitive()Z

    move-result v30

    if-eqz v30, :cond_16

    const/16 v23, 0x1

    .line 1998
    .local v23, parameterAsReturn:Z
    :goto_e
    if-eqz v8, :cond_17

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v30, v0

    if-lez v30, :cond_17

    const/16 v30, 0x0

    aget-object v30, v25, v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->isArray()Z

    move-result v30

    if-eqz v30, :cond_17

    const/16 v30, 0x0

    aget-object v30, v25, v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->isPrimitive()Z

    move-result v30

    if-eqz v30, :cond_17

    const/16 v24, 0x1

    .line 2001
    .local v24, parameterAsReturn2:Z
    :goto_f
    if-eqz v5, :cond_1b

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v31, v0

    if-eqz v23, :cond_18

    const/16 v30, 0x0

    :goto_10
    sub-int v30, v31, v30

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_1b

    if-eqz v23, :cond_19

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    add-int/lit8 v31, v31, -0x1

    aget-object v30, v30, v31

    :goto_11
    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v31, v0

    add-int/lit8 v31, v31, -0x1

    aget-object v31, v25, v31

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_1b

    sget-object v30, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    if-eq v0, v1, :cond_15

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_1b

    .line 2004
    :cond_15
    move-object/from16 v22, v16

    .line 2005
    move/from16 v28, v7

    .line 2006
    if-nez v7, :cond_1a

    const/4 v14, 0x1

    .line 2007
    :goto_12
    move/from16 v21, v23

    goto/16 :goto_b

    .line 1996
    .end local v23           #parameterAsReturn:Z
    .end local v24           #parameterAsReturn2:Z
    :cond_16
    const/16 v23, 0x0

    goto :goto_e

    .line 1998
    .restart local v23       #parameterAsReturn:Z
    :cond_17
    const/16 v24, 0x0

    goto :goto_f

    .line 2001
    .restart local v24       #parameterAsReturn2:Z
    :cond_18
    const/16 v30, 0x1

    goto :goto_10

    :cond_19
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v30, v0

    goto :goto_11

    .line 2006
    :cond_1a
    const/4 v14, 0x0

    goto :goto_12

    .line 2008
    :cond_1b
    if-eqz v6, :cond_b

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v31, v0

    if-eqz v24, :cond_1d

    const/16 v30, 0x0

    :goto_13
    sub-int v30, v31, v30

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_b

    if-eqz v24, :cond_1c

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v30, v0

    add-int/lit8 v30, v30, -0x1

    aget-object v26, v25, v30

    .end local v26           #returnType2:Ljava/lang/Class;
    :cond_1c
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    add-int/lit8 v31, v31, -0x1

    aget-object v30, v30, v31

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_b

    .line 2011
    move-object/from16 v22, v16

    .line 2012
    move/from16 v29, v8

    .line 2013
    if-nez v8, :cond_1e

    const/4 v15, 0x1

    :goto_14
    goto/16 :goto_b

    .line 2008
    .restart local v26       #returnType2:Ljava/lang/Class;
    :cond_1d
    const/16 v30, 0x1

    goto :goto_13

    .line 2013
    .end local v26           #returnType2:Ljava/lang/Class;
    :cond_1e
    const/4 v15, 0x0

    goto :goto_14

    .line 2017
    .end local v7           #canBeValueGetter:Z
    .end local v8           #canBeValueSetter:Z
    .end local v13           #j:I
    .end local v16           #method2:Ljava/lang/reflect/Method;
    .end local v17           #methodName2:Ljava/lang/String;
    .end local v19           #modifiers2:I
    .end local v23           #parameterAsReturn:Z
    .end local v24           #parameterAsReturn2:Z
    .end local v25           #parameterTypes2:[Ljava/lang/Class;
    .end local v27           #sameIndexParameters:Z
    :cond_1f
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/googlecode/javacpp/Generator;->getBehavior([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    .line 2018
    .local v2, behavior:Ljava/lang/annotation/Annotation;
    if-eqz v5, :cond_2a

    instance-of v0, v2, Lcom/googlecode/javacpp/annotation/ValueGetter;

    move/from16 v30, v0

    if-eqz v30, :cond_2a

    .line 2019
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueGetter:Z

    .line 2020
    move/from16 v0, v21

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->noReturnGetter:Z

    .line 2066
    :cond_20
    :goto_15
    if-nez v20, :cond_21

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    move-object/from16 v30, v0

    if-eqz v30, :cond_21

    .line 2067
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    move-object/from16 v30, v0

    const-class v31, Lcom/googlecode/javacpp/annotation/Name;

    invoke-virtual/range {v30 .. v31}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v20

    .end local v20           #name:Lcom/googlecode/javacpp/annotation/Name;
    check-cast v20, Lcom/googlecode/javacpp/annotation/Name;

    .line 2068
    .restart local v20       #name:Lcom/googlecode/javacpp/annotation/Name;
    if-eqz v20, :cond_21

    .line 2069
    invoke-interface/range {v20 .. v20}, Lcom/googlecode/javacpp/annotation/Name;->value()[Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberName:[Ljava/lang/String;

    .line 2073
    :cond_21
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v30, v0

    const-class v31, Lcom/googlecode/javacpp/annotation/NoOffset;

    invoke-virtual/range {v30 .. v31}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v30

    if-nez v30, :cond_22

    const-class v30, Lcom/googlecode/javacpp/annotation/NoOffset;

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v30

    if-nez v30, :cond_22

    const-class v30, Lcom/googlecode/javacpp/annotation/Index;

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v30

    if-eqz v30, :cond_38

    :cond_22
    const/16 v30, 0x1

    :goto_16
    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->noOffset:Z

    .line 2076
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->noOffset:Z

    move/from16 v30, v0

    if-nez v30, :cond_24

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    move-object/from16 v30, v0

    if-eqz v30, :cond_24

    .line 2077
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    move-object/from16 v30, v0

    const-class v31, Lcom/googlecode/javacpp/annotation/NoOffset;

    invoke-virtual/range {v30 .. v31}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v30

    if-nez v30, :cond_23

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    move-object/from16 v30, v0

    const-class v31, Lcom/googlecode/javacpp/annotation/Index;

    invoke-virtual/range {v30 .. v31}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v30

    if-eqz v30, :cond_39

    :cond_23
    const/16 v30, 0x1

    :goto_17
    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->noOffset:Z

    .line 2081
    :cond_24
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    if-eqz v30, :cond_25

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget-object v30, v30, v31

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Class;->isArray()Z

    move-result v30

    if-nez v30, :cond_27

    .line 2082
    :cond_25
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueGetter:Z

    move/from16 v30, v0

    if-nez v30, :cond_26

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    move/from16 v30, v0

    if-eqz v30, :cond_3a

    .line 2083
    :cond_26
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    iput v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->dim:I

    .line 2089
    :cond_27
    :goto_18
    const/16 v30, 0x0

    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->throwsException:Ljava/lang/Class;

    .line 2090
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->cls:Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lcom/googlecode/javacpp/Generator;->getNoException(Ljava/lang/Class;Ljava/lang/reflect/Method;)Z

    move-result v30

    if-nez v30, :cond_0

    .line 2091
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->annotations:[Ljava/lang/annotation/Annotation;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v30

    move-object/from16 v0, v30

    instance-of v0, v0, Lcom/googlecode/javacpp/annotation/ByVal;

    move/from16 v30, v0

    if-eqz v30, :cond_28

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lcom/googlecode/javacpp/Generator;->getNoException(Ljava/lang/Class;Ljava/lang/reflect/Method;)Z

    move-result v30

    if-eqz v30, :cond_29

    :cond_28
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->deallocator:Z

    move/from16 v30, v0

    if-nez v30, :cond_0

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueGetter:Z

    move/from16 v30, v0

    if-nez v30, :cond_0

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    move/from16 v30, v0

    if-nez v30, :cond_0

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    move/from16 v30, v0

    if-nez v30, :cond_0

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    move/from16 v30, v0

    if-nez v30, :cond_0

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->bufferGetter:Z

    move/from16 v30, v0

    if-nez v30, :cond_0

    .line 2094
    :cond_29
    invoke-virtual/range {p0 .. p0}, Ljava/lang/reflect/Method;->getExceptionTypes()[Ljava/lang/Class;

    move-result-object v9

    .line 2095
    .local v9, exceptions:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    array-length v0, v9

    move/from16 v30, v0

    if-lez v30, :cond_3c

    const/16 v30, 0x0

    aget-object v30, v9, v30

    :goto_19
    move-object/from16 v0, v30

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->throwsException:Ljava/lang/Class;

    goto/16 :goto_0

    .line 2021
    .end local v9           #exceptions:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    :cond_2a
    if-eqz v6, :cond_2b

    instance-of v0, v2, Lcom/googlecode/javacpp/annotation/ValueSetter;

    move/from16 v30, v0

    if-eqz v30, :cond_2b

    .line 2022
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    goto/16 :goto_15

    .line 2023
    :cond_2b
    if-eqz v5, :cond_2c

    instance-of v0, v2, Lcom/googlecode/javacpp/annotation/MemberGetter;

    move/from16 v30, v0

    if-eqz v30, :cond_2c

    .line 2024
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    .line 2025
    move/from16 v0, v21

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->noReturnGetter:Z

    goto/16 :goto_15

    .line 2026
    :cond_2c
    if-eqz v6, :cond_2d

    instance-of v0, v2, Lcom/googlecode/javacpp/annotation/MemberSetter;

    move/from16 v30, v0

    if-eqz v30, :cond_2d

    .line 2027
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    goto/16 :goto_15

    .line 2028
    :cond_2d
    if-eqz v3, :cond_2e

    instance-of v0, v2, Lcom/googlecode/javacpp/annotation/Allocator;

    move/from16 v30, v0

    if-eqz v30, :cond_2e

    .line 2029
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->allocator:Z

    goto/16 :goto_15

    .line 2030
    :cond_2e
    if-eqz v4, :cond_2f

    instance-of v0, v2, Lcom/googlecode/javacpp/annotation/ArrayAllocator;

    move/from16 v30, v0

    if-eqz v30, :cond_2f

    .line 2031
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->arrayAllocator:Z

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->allocator:Z

    goto/16 :goto_15

    .line 2032
    :cond_2f
    if-nez v2, :cond_37

    .line 2034
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v30, v0

    sget-object v31, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_30

    const-string v30, "deallocate"

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->name:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_30

    iget v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    move/from16 v30, v0

    invoke-static/range {v30 .. v30}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v30

    if-nez v30, :cond_30

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    const/16 v31, 0x2

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_30

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aget-object v30, v30, v31

    sget-object v31, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_30

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x1

    aget-object v30, v30, v31

    sget-object v31, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-ne v0, v1, :cond_30

    .line 2037
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->deallocator:Z

    goto/16 :goto_15

    .line 2038
    :cond_30
    if-eqz v3, :cond_31

    const-string v30, "allocate"

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->name:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_31

    .line 2039
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->allocator:Z

    goto/16 :goto_15

    .line 2040
    :cond_31
    if-eqz v4, :cond_32

    const-string v30, "allocateArray"

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->name:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_32

    .line 2041
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->arrayAllocator:Z

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->allocator:Z

    goto/16 :goto_15

    .line 2042
    :cond_32
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->returnType:Ljava/lang/Class;

    move-object/from16 v30, v0

    const-class v31, Ljava/nio/ByteBuffer;

    invoke-virtual/range {v30 .. v31}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v30

    if-eqz v30, :cond_33

    const-string v30, "asDirectBuffer"

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->name:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_33

    iget v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->modifiers:I

    move/from16 v30, v0

    invoke-static/range {v30 .. v30}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v30

    if-nez v30, :cond_33

    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    if-nez v30, :cond_33

    .line 2044
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->bufferGetter:Z

    goto/16 :goto_15

    .line 2045
    :cond_33
    if-eqz v28, :cond_34

    .line 2046
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueGetter:Z

    .line 2047
    move/from16 v0, v21

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->noReturnGetter:Z

    .line 2048
    move-object/from16 v0, v22

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    goto/16 :goto_15

    .line 2049
    :cond_34
    if-eqz v29, :cond_35

    .line 2050
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    .line 2051
    move-object/from16 v0, v22

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    goto/16 :goto_15

    .line 2052
    :cond_35
    if-eqz v14, :cond_36

    .line 2053
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberGetter:Z

    .line 2054
    move/from16 v0, v21

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->noReturnGetter:Z

    .line 2055
    move-object/from16 v0, v22

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    goto/16 :goto_15

    .line 2056
    :cond_36
    if-eqz v15, :cond_20

    .line 2057
    const/16 v30, 0x1

    move/from16 v0, v30

    iput-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    .line 2058
    move-object/from16 v0, v22

    iput-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    goto/16 :goto_15

    .line 2061
    :cond_37
    sget-object v30, Lcom/googlecode/javacpp/Generator;->logger:Ljava/util/logging/Logger;

    sget-object v31, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Method \""

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, "\" cannot behave like a \""

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, "\". No code will be generated."

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v30 .. v32}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 2063
    const/4 v12, 0x0

    goto/16 :goto_0

    .line 2073
    :cond_38
    const/16 v30, 0x0

    goto/16 :goto_16

    .line 2077
    :cond_39
    const/16 v30, 0x0

    goto/16 :goto_17

    .line 2084
    :cond_3a
    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    move/from16 v30, v0

    if-nez v30, :cond_3b

    iget-boolean v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    move/from16 v30, v0

    if-eqz v30, :cond_27

    .line 2085
    :cond_3b
    iget-object v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    add-int/lit8 v30, v30, -0x1

    move/from16 v0, v30

    iput v0, v12, Lcom/googlecode/javacpp/Generator$MethodInformation;->dim:I

    goto/16 :goto_18

    .line 2095
    .restart local v9       #exceptions:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    :cond_3c
    const-class v30, Ljava/lang/RuntimeException;

    goto/16 :goto_19
.end method

.method public static getNoException(Ljava/lang/Class;Ljava/lang/reflect/Method;)Z
    .locals 2
    .parameter
    .parameter "method"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 2102
    .local p0, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    sget-object v1, Lcom/googlecode/javacpp/Generator;->baseClasses:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-class v1, Lcom/googlecode/javacpp/annotation/NoException;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 2104
    .local v0, noException:Z
    :goto_0
    if-nez v0, :cond_1

    if-eqz p0, :cond_1

    .line 2105
    const-class v1, Lcom/googlecode/javacpp/annotation/NoException;

    invoke-virtual {p0, v1}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2110
    :cond_1
    return v0

    .line 2102
    .end local v0           #noException:Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 2108
    .restart local v0       #noException:Z
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_0
.end method

.method public static getParameterAdapterInformation(ZLcom/googlecode/javacpp/Generator$MethodInformation;I)Lcom/googlecode/javacpp/Generator$AdapterInformation;
    .locals 7
    .parameter "out"
    .parameter "methodInfo"
    .parameter "j"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 2120
    if-eqz p0, :cond_2

    iget-object v3, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v3, v3, p2

    const-class v4, Ljava/lang/String;

    if-eq v3, v4, :cond_0

    iget-boolean v3, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v3, :cond_0

    iget-boolean v3, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-eqz v3, :cond_2

    .line 2121
    :cond_0
    const/4 v0, 0x0

    .line 2136
    :cond_1
    :goto_0
    return-object v0

    .line 2123
    :cond_2
    invoke-static {p1, p2}, Lcom/googlecode/javacpp/Generator;->getParameterCast(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/String;

    move-result-object v1

    .line 2124
    .local v1, typeName:Ljava/lang/String;
    if-eqz v1, :cond_3

    const-string v3, "("

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2125
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 2127
    :cond_3
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_5

    .line 2128
    :cond_4
    iget-object v3, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    aget-object v3, v3, p2

    iget-object v4, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v4, v4, p2

    invoke-static {v3, v4}, Lcom/googlecode/javacpp/Generator;->getCastedCPPTypeName([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)[Ljava/lang/String;

    move-result-object v3

    aget-object v1, v3, v5

    .line 2130
    :cond_5
    new-array v3, v6, [Ljava/lang/String;

    aput-object v1, v3, v5

    invoke-static {v3}, Lcom/googlecode/javacpp/Generator;->getValueTypeName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2131
    .local v2, valueTypeName:Ljava/lang/String;
    iget-object v3, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    aget-object v3, v3, p2

    invoke-static {p0, v2, v3}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v0

    .line 2132
    .local v0, adapter:Lcom/googlecode/javacpp/Generator$AdapterInformation;
    if-nez v0, :cond_1

    iget-object v3, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_1

    iget-boolean v3, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v3, :cond_6

    iget-boolean v3, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-eqz v3, :cond_1

    .line 2134
    :cond_6
    iget-object v3, p1, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v3

    invoke-static {p0, v2, v3}, Lcom/googlecode/javacpp/Generator;->getAdapterInformation(ZLjava/lang/String;[Ljava/lang/annotation/Annotation;)Lcom/googlecode/javacpp/Generator$AdapterInformation;

    move-result-object v0

    goto :goto_0
.end method

.method public static getParameterBy(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/annotation/Annotation;
    .locals 2
    .parameter "methodInfo"
    .parameter "j"

    .prologue
    .line 2218
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    aget-object v1, v1, p1

    invoke-static {v1}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    .line 2219
    .local v0, passBy:Ljava/lang/annotation/Annotation;
    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-eqz v1, :cond_1

    .line 2221
    :cond_0
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v1

    invoke-static {v1}, Lcom/googlecode/javacpp/Generator;->getBy([Ljava/lang/annotation/Annotation;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    .line 2223
    :cond_1
    return-object v0
.end method

.method public static getParameterCast(Lcom/googlecode/javacpp/Generator$MethodInformation;I)Ljava/lang/String;
    .locals 3
    .parameter "methodInfo"
    .parameter "j"

    .prologue
    .line 2198
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterAnnotations:[[Ljava/lang/annotation/Annotation;

    aget-object v1, v1, p1

    iget-object v2, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    aget-object v2, v2, p1

    invoke-static {v1, v2}, Lcom/googlecode/javacpp/Generator;->getCast([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 2199
    .local v0, cast:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->parameterTypes:[Ljava/lang/Class;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-ne p1, v1, :cond_2

    iget-boolean v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->valueSetter:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->memberSetter:Z

    if-eqz v1, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_2

    .line 2201
    iget-object v1, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v1

    iget-object v2, p0, Lcom/googlecode/javacpp/Generator$MethodInformation;->pairedMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/googlecode/javacpp/Generator;->getCast([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 2203
    :cond_2
    return-object v0
.end method

.method public static getSignature(Ljava/lang/Class;)Ljava/lang/String;
    .locals 4
    .parameter "type"

    .prologue
    .line 2536
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_0

    .line 2537
    const-string v0, "B"

    .line 2557
    :goto_0
    return-object v0

    .line 2538
    :cond_0
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_1

    .line 2539
    const-string v0, "S"

    goto :goto_0

    .line 2540
    :cond_1
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_2

    .line 2541
    const-string v0, "I"

    goto :goto_0

    .line 2542
    :cond_2
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_3

    .line 2543
    const-string v0, "J"

    goto :goto_0

    .line 2544
    :cond_3
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_4

    .line 2545
    const-string v0, "F"

    goto :goto_0

    .line 2546
    :cond_4
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_5

    .line 2547
    const-string v0, "D"

    goto :goto_0

    .line 2548
    :cond_5
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_6

    .line 2549
    const-string v0, "Z"

    goto :goto_0

    .line 2550
    :cond_6
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_7

    .line 2551
    const-string v0, "C"

    goto :goto_0

    .line 2552
    :cond_7
    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_8

    .line 2553
    const-string v0, "V"

    goto :goto_0

    .line 2554
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 2555
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "."

    const-string v2, "/"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2557
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "L"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "."

    const-string v3, "/"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static varargs getSignature([Ljava/lang/Class;)Ljava/lang/String;
    .locals 3
    .parameter "types"

    .prologue
    .line 2529
    new-instance v1, Ljava/lang/StringBuilder;

    array-length v2, p0

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 2530
    .local v1, signature:Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2531
    aget-object v2, p0, v0

    invoke-static {v2}, Lcom/googlecode/javacpp/Generator;->getSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2530
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2533
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static varargs getValueTypeName([Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "typeName"

    .prologue
    const/4 v2, 0x0

    .line 2260
    aget-object v0, p0, v2

    .line 2261
    .local v0, type:Ljava/lang/String;
    const-string v1, "const "

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2262
    const/4 v1, 0x6

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 2266
    :cond_0
    :goto_0
    return-object v0

    .line 2263
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 2264
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static mangle(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "name"

    .prologue
    .line 2562
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 2563
    .local v3, mangledName:Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_9

    .line 2564
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 2565
    .local v0, c:C
    const/16 v4, 0x30

    if-lt v0, v4, :cond_0

    const/16 v4, 0x39

    if-le v0, v4, :cond_2

    :cond_0
    const/16 v4, 0x41

    if-lt v0, v4, :cond_1

    const/16 v4, 0x5a

    if-le v0, v4, :cond_2

    :cond_1
    const/16 v4, 0x61

    if-lt v0, v4, :cond_3

    const/16 v4, 0x7a

    if-gt v0, v4, :cond_3

    .line 2566
    :cond_2
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2563
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2567
    :cond_3
    const/16 v4, 0x5f

    if-ne v0, v4, :cond_4

    .line 2568
    const-string v4, "_1"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 2569
    :cond_4
    const/16 v4, 0x3b

    if-ne v0, v4, :cond_5

    .line 2570
    const-string v4, "_2"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 2571
    :cond_5
    const/16 v4, 0x5b

    if-ne v0, v4, :cond_6

    .line 2572
    const-string v4, "_3"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 2573
    :cond_6
    const/16 v4, 0x2e

    if-eq v0, v4, :cond_7

    const/16 v4, 0x2f

    if-ne v0, v4, :cond_8

    .line 2574
    :cond_7
    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 2576
    :cond_8
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 2577
    .local v1, code:Ljava/lang/String;
    const-string v4, "_0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2578
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 2582
    :goto_2
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 2579
    :pswitch_0
    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2580
    :pswitch_1
    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2581
    :pswitch_2
    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 2586
    .end local v0           #c:C
    .end local v1           #code:Ljava/lang/String;
    :cond_9
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 2578
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public checkPlatform(Lcom/googlecode/javacpp/annotation/Platform;)Z
    .locals 13
    .parameter "platform"

    .prologue
    const/4 v12, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 1842
    if-nez p1, :cond_1

    .line 1859
    :cond_0
    :goto_0
    return v8

    .line 1845
    :cond_1
    iget-object v10, p0, Lcom/googlecode/javacpp/Generator;->properties:Lcom/googlecode/javacpp/Loader$ClassProperties;

    const-string v11, "platform.name"

    invoke-virtual {v10, v11}, Lcom/googlecode/javacpp/Loader$ClassProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1846
    .local v6, platformName:Ljava/lang/String;
    new-array v5, v12, [[Ljava/lang/String;

    invoke-interface {p1}, Lcom/googlecode/javacpp/annotation/Platform;->value()[Ljava/lang/String;

    move-result-object v10

    aput-object v10, v5, v9

    invoke-interface {p1}, Lcom/googlecode/javacpp/annotation/Platform;->not()[Ljava/lang/String;

    move-result-object v10

    aput-object v10, v5, v8

    .line 1847
    .local v5, names:[[Ljava/lang/String;
    new-array v4, v12, [Z

    fill-array-data v4, :array_0

    .line 1848
    .local v4, matches:[Z
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v10, v5

    if-ge v1, v10, :cond_4

    .line 1849
    aget-object v0, v5, v1

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_2
    if-ge v2, v3, :cond_2

    aget-object v7, v0, v2

    .line 1850
    .local v7, s:Ljava/lang/String;
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 1851
    aput-boolean v8, v4, v1

    .line 1848
    .end local v7           #s:Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1849
    .restart local v7       #s:Ljava/lang/String;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1856
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v7           #s:Ljava/lang/String;
    :cond_4
    aget-object v10, v5, v9

    array-length v10, v10

    if-eqz v10, :cond_5

    aget-boolean v10, v4, v9

    if-eqz v10, :cond_6

    :cond_5
    aget-object v10, v5, v8

    array-length v10, v10

    if-eqz v10, :cond_0

    aget-boolean v10, v4, v8

    if-eqz v10, :cond_0

    :cond_6
    move v8, v9

    .line 1859
    goto :goto_0

    .line 1847
    nop

    :array_0
    .array-data 0x1
        0x0t
        0x0t
    .end array-data
.end method

.method public checkPlatform(Ljava/lang/Class;)Z
    .locals 10
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v9, 0x1

    .line 1816
    const-class v8, Lcom/googlecode/javacpp/annotation/Properties;

    invoke-virtual {p1, v8}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/googlecode/javacpp/annotation/Properties;

    .line 1818
    .local v2, classProperties:Lcom/googlecode/javacpp/annotation/Properties;
    if-eqz v2, :cond_3

    .line 1819
    invoke-interface {v2}, Lcom/googlecode/javacpp/annotation/Properties;->inherit()[Ljava/lang/Class;

    move-result-object v3

    .line 1820
    .local v3, classes:[Ljava/lang/Class;
    if-eqz v3, :cond_1

    .line 1821
    move-object v0, v3

    .local v0, arr$:[Ljava/lang/Class;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v1, v0, v4

    .line 1822
    .local v1, c:Ljava/lang/Class;
    invoke-virtual {p0, v1}, Lcom/googlecode/javacpp/Generator;->checkPlatform(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_0

    move v8, v9

    .line 1838
    .end local v0           #arr$:[Ljava/lang/Class;
    .end local v1           #c:Ljava/lang/Class;
    .end local v3           #classes:[Ljava/lang/Class;
    .end local v4           #i$:I
    .end local v5           #len$:I
    :goto_1
    return v8

    .line 1821
    .restart local v0       #arr$:[Ljava/lang/Class;
    .restart local v1       #c:Ljava/lang/Class;
    .restart local v3       #classes:[Ljava/lang/Class;
    .restart local v4       #i$:I
    .restart local v5       #len$:I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1827
    .end local v0           #arr$:[Ljava/lang/Class;
    .end local v1           #c:Ljava/lang/Class;
    .end local v4           #i$:I
    .end local v5           #len$:I
    :cond_1
    invoke-interface {v2}, Lcom/googlecode/javacpp/annotation/Properties;->value()[Lcom/googlecode/javacpp/annotation/Platform;

    move-result-object v7

    .line 1828
    .local v7, platforms:[Lcom/googlecode/javacpp/annotation/Platform;
    if-eqz v7, :cond_4

    .line 1829
    move-object v0, v7

    .local v0, arr$:[Lcom/googlecode/javacpp/annotation/Platform;
    array-length v5, v0

    .restart local v5       #len$:I
    const/4 v4, 0x0

    .restart local v4       #i$:I
    :goto_2
    if-ge v4, v5, :cond_4

    aget-object v6, v0, v4

    .line 1830
    .local v6, p:Lcom/googlecode/javacpp/annotation/Platform;
    invoke-virtual {p0, v6}, Lcom/googlecode/javacpp/Generator;->checkPlatform(Lcom/googlecode/javacpp/annotation/Platform;)Z

    move-result v8

    if-eqz v8, :cond_2

    move v8, v9

    .line 1831
    goto :goto_1

    .line 1829
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1835
    .end local v0           #arr$:[Lcom/googlecode/javacpp/annotation/Platform;
    .end local v3           #classes:[Ljava/lang/Class;
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v6           #p:Lcom/googlecode/javacpp/annotation/Platform;
    .end local v7           #platforms:[Lcom/googlecode/javacpp/annotation/Platform;
    :cond_3
    const-class v8, Lcom/googlecode/javacpp/annotation/Platform;

    invoke-virtual {p1, v8}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v8

    check-cast v8, Lcom/googlecode/javacpp/annotation/Platform;

    invoke-virtual {p0, v8}, Lcom/googlecode/javacpp/Generator;->checkPlatform(Lcom/googlecode/javacpp/annotation/Platform;)Z

    move-result v8

    if-eqz v8, :cond_4

    move v8, v9

    .line 1836
    goto :goto_1

    .line 1838
    :cond_4
    const/4 v8, 0x0

    goto :goto_1
.end method

.method public close()V
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    if-eqz v0, :cond_1

    .line 191
    iget-object v0, p0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 193
    :cond_1
    return-void
.end method

.method public varargs generate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Z
    .locals 4
    .parameter "sourceFilename"
    .parameter "headerFilename"
    .parameter "classPath"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .local p4, classes:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    const/4 v3, 0x1

    const/4 v0, 0x0

    .line 159
    new-instance v1, Ljava/io/PrintWriter;

    new-instance v2, Lcom/googlecode/javacpp/Generator$1;

    invoke-direct {v2, p0}, Lcom/googlecode/javacpp/Generator$1;-><init>(Lcom/googlecode/javacpp/Generator;)V

    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    iput-object v1, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    .line 164
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    .line 165
    new-instance v1, Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    invoke-direct {v1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;-><init>()V

    iput-object v1, p0, Lcom/googlecode/javacpp/Generator;->functionDefinitions:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    .line 166
    new-instance v1, Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    invoke-direct {v1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;-><init>()V

    iput-object v1, p0, Lcom/googlecode/javacpp/Generator;->functionPointers:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    .line 167
    new-instance v1, Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    invoke-direct {v1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;-><init>()V

    iput-object v1, p0, Lcom/googlecode/javacpp/Generator;->deallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    .line 168
    new-instance v1, Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    invoke-direct {v1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;-><init>()V

    iput-object v1, p0, Lcom/googlecode/javacpp/Generator;->arrayDeallocators:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    .line 169
    new-instance v1, Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    invoke-direct {v1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;-><init>()V

    iput-object v1, p0, Lcom/googlecode/javacpp/Generator;->jclasses:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    .line 170
    new-instance v1, Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    invoke-direct {v1}, Lcom/googlecode/javacpp/Generator$LinkedListRegister;-><init>()V

    iput-object v1, p0, Lcom/googlecode/javacpp/Generator;->jclassesInit:Lcom/googlecode/javacpp/Generator$LinkedListRegister;

    .line 171
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/googlecode/javacpp/Generator;->members:Ljava/util/HashMap;

    .line 172
    iput-boolean v0, p0, Lcom/googlecode/javacpp/Generator;->mayThrowExceptions:Z

    .line 173
    iput-boolean v0, p0, Lcom/googlecode/javacpp/Generator;->usesAdapters:Z

    .line 174
    invoke-direct {p0, v3, v3, p3, p4}, Lcom/googlecode/javacpp/Generator;->doClasses(ZZLjava/lang/String;[Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 176
    new-instance v0, Ljava/io/PrintWriter;

    invoke-direct {v0, p1}, Ljava/io/PrintWriter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/googlecode/javacpp/Generator;->out:Ljava/io/PrintWriter;

    .line 177
    if-eqz p2, :cond_0

    .line 178
    new-instance v0, Ljava/io/PrintWriter;

    invoke-direct {v0, p2}, Ljava/io/PrintWriter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/googlecode/javacpp/Generator;->out2:Ljava/io/PrintWriter;

    .line 180
    :cond_0
    iget-boolean v0, p0, Lcom/googlecode/javacpp/Generator;->mayThrowExceptions:Z

    iget-boolean v1, p0, Lcom/googlecode/javacpp/Generator;->usesAdapters:Z

    invoke-direct {p0, v0, v1, p3, p4}, Lcom/googlecode/javacpp/Generator;->doClasses(ZZLjava/lang/String;[Ljava/lang/Class;)Z

    move-result v0

    .line 182
    :cond_1
    return v0
.end method
