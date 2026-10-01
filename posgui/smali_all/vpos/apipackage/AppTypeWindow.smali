.class public Lvpos/apipackage/AppTypeWindow;
.super Ljava/lang/Object;
.source "AppTypeWindow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvpos/apipackage/AppTypeWindow$Util;,
        Lvpos/apipackage/AppTypeWindow$Decet_Thread;,
        Lvpos/apipackage/AppTypeWindow$TimeCount;,
        Lvpos/apipackage/AppTypeWindow$IFinishType;
    }
.end annotation


# static fields
.field private static final MSG_WHAT_CLEAR_DIALOG:I = 0x2

.field private static final MSG_WHAT_CLOSE_DIALOG:I = 0x1

.field private static final MSG_WHAT_SHOW_DIALOG:I = 0x0

.field private static final TIME_OUT_MS:I = 0x2710

.field private static dlgSelect:Landroid/app/AlertDialog;

.field static rid:I


# instance fields
.field private bFinish:Z

.field currentTime:J

.field keyInputResult:I

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field mIFinishType:Lvpos/apipackage/AppTypeWindow$IFinishType;

.field m_KBThread:Lvpos/apipackage/AppTypeWindow$Decet_Thread;

.field private radioGroup:Landroid/widget/RadioGroup;

.field startTime:J

.field final tag:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private typeCount:I

.field private types:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 74
    const/4 v0, -0x1

    sput v0, Lvpos/apipackage/AppTypeWindow;->rid:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const-string v0, "liuhao"

    iput-object v0, p0, Lvpos/apipackage/AppTypeWindow;->tag:Ljava/lang/String;

    .line 35
    const-string v0, ""

    iput-object v0, p0, Lvpos/apipackage/AppTypeWindow;->title:Ljava/lang/String;

    .line 39
    const/4 v0, -0x1

    iput v0, p0, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lvpos/apipackage/AppTypeWindow;->bFinish:Z

    .line 151
    const/4 v0, 0x0

    iput-object v0, p0, Lvpos/apipackage/AppTypeWindow;->m_KBThread:Lvpos/apipackage/AppTypeWindow$Decet_Thread;

    .line 171
    new-instance v0, Lvpos/apipackage/AppTypeWindow$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lvpos/apipackage/AppTypeWindow$2;-><init>(Lvpos/apipackage/AppTypeWindow;Landroid/os/Looper;)V

    iput-object v0, p0, Lvpos/apipackage/AppTypeWindow;->mHandler:Landroid/os/Handler;

    .line 71
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;

    .line 72
    return-void
.end method

.method private SendMsg(ILjava/lang/String;)V
    .registers 6
    .param p1, "what"    # I
    .param p2, "strInfo"    # Ljava/lang/String;

    .line 142
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1d

    .line 143
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 144
    .local v0, "msg":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 145
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 146
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "MSG"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 148
    iget-object v2, p0, Lvpos/apipackage/AppTypeWindow;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 150
    .end local v0    # "msg":Landroid/os/Message;
    .end local v1    # "b":Landroid/os/Bundle;
    :cond_1d
    return-void
.end method

.method static synthetic access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;
    .registers 2
    .param p0, "x0"    # Lvpos/apipackage/AppTypeWindow;

    .line 24
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;

    return-object v0
.end method

.method static synthetic access$002(Lvpos/apipackage/AppTypeWindow;Landroid/widget/RadioGroup;)Landroid/widget/RadioGroup;
    .registers 2
    .param p0, "x0"    # Lvpos/apipackage/AppTypeWindow;
    .param p1, "x1"    # Landroid/widget/RadioGroup;

    .line 24
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;

    return-object p1
.end method

.method static synthetic access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lvpos/apipackage/AppTypeWindow;

    .line 24
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$102(Lvpos/apipackage/AppTypeWindow;Landroid/content/Context;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lvpos/apipackage/AppTypeWindow;
    .param p1, "x1"    # Landroid/content/Context;

    .line 24
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;

    return-object p1
.end method

.method static synthetic access$200(Lvpos/apipackage/AppTypeWindow;)I
    .registers 2
    .param p0, "x0"    # Lvpos/apipackage/AppTypeWindow;

    .line 24
    iget v0, p0, Lvpos/apipackage/AppTypeWindow;->typeCount:I

    return v0
.end method

.method static synthetic access$300(Lvpos/apipackage/AppTypeWindow;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lvpos/apipackage/AppTypeWindow;

    .line 24
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow;->types:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lvpos/apipackage/AppTypeWindow;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lvpos/apipackage/AppTypeWindow;

    .line 24
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow;->title:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500()Landroid/app/AlertDialog;
    .registers 1

    .line 24
    sget-object v0, Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$502(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .registers 1
    .param p0, "x0"    # Landroid/app/AlertDialog;

    .line 24
    sput-object p0, Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;

    return-object p0
.end method

.method static synthetic access$602(Lvpos/apipackage/AppTypeWindow;Z)Z
    .registers 2
    .param p0, "x0"    # Lvpos/apipackage/AppTypeWindow;
    .param p1, "x1"    # Z

    .line 24
    iput-boolean p1, p0, Lvpos/apipackage/AppTypeWindow;->bFinish:Z

    return p1
.end method


# virtual methods
.method public ClearWindown()V
    .registers 3

    .line 138
    const-string v0, ""

    const/4 v1, 0x2

    invoke-direct {p0, v1, v0}, Lvpos/apipackage/AppTypeWindow;->SendMsg(ILjava/lang/String;)V

    .line 139
    return-void
.end method

.method public CloseWindow()V
    .registers 3

    .line 133
    const-string v0, ""

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lvpos/apipackage/AppTypeWindow;->SendMsg(ILjava/lang/String;)V

    .line 134
    iput-boolean v1, p0, Lvpos/apipackage/AppTypeWindow;->bFinish:Z

    .line 135
    return-void
.end method

.method public ShowSelectWindow(I[B[B)I
    .registers 10
    .param p1, "typeCount"    # I
    .param p2, "typeBytes"    # [B
    .param p3, "selResult"    # [B

    .line 77
    const/16 v0, 0xa

    new-array v0, v0, [B

    .line 80
    .local v0, "tmp":[B
    const/4 v1, 0x0

    iput-boolean v1, p0, Lvpos/apipackage/AppTypeWindow;->bFinish:Z

    .line 81
    invoke-static {p2}, Lvpos/apipackage/ByteUtil;->bytesToString([B)Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "strApps":Ljava/lang/String;
    const-string v3, "liuhao"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "input = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    const-string v3, ";"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lvpos/apipackage/AppTypeWindow;->types:[Ljava/lang/String;

    .line 85
    iget-object v3, p0, Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/cspos/R$string;->aid_dlg_title:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lvpos/apipackage/AppTypeWindow;->title:Ljava/lang/String;

    .line 86
    iput p1, p0, Lvpos/apipackage/AppTypeWindow;->typeCount:I

    .line 89
    const-string v3, ""

    invoke-direct {p0, v1, v3}, Lvpos/apipackage/AppTypeWindow;->SendMsg(ILjava/lang/String;)V

    .line 91
    const/16 v3, 0xf

    sput v3, Lvpos/apipackage/AppTypeWindow;->rid:I

    .line 92
    sget v3, Lvpos/apipackage/AppTypeWindow;->rid:I

    invoke-static {v3}, Lvpos/apipackage/ByteUtil;->iToBytes(I)[B

    move-result-object v3

    sget v4, Lvpos/apipackage/AppTypeWindow;->rid:I

    invoke-static {v4}, Lvpos/apipackage/ByteUtil;->iToBytes(I)[B

    move-result-object v4

    array-length v4, v4

    invoke-static {v3, v1, p3, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 94
    new-instance v1, Lvpos/apipackage/AppTypeWindow$1;

    invoke-direct {v1, p0, p3}, Lvpos/apipackage/AppTypeWindow$1;-><init>(Lvpos/apipackage/AppTypeWindow;[B)V

    invoke-virtual {p0, v1}, Lvpos/apipackage/AppTypeWindow;->setIFinishType(Lvpos/apipackage/AppTypeWindow$IFinishType;)V

    .line 125
    new-instance v1, Lvpos/apipackage/AppTypeWindow$Decet_Thread;

    invoke-direct {v1, p0}, Lvpos/apipackage/AppTypeWindow$Decet_Thread;-><init>(Lvpos/apipackage/AppTypeWindow;)V

    iput-object v1, p0, Lvpos/apipackage/AppTypeWindow;->m_KBThread:Lvpos/apipackage/AppTypeWindow$Decet_Thread;

    .line 126
    iget-object v1, p0, Lvpos/apipackage/AppTypeWindow;->m_KBThread:Lvpos/apipackage/AppTypeWindow$Decet_Thread;

    invoke-virtual {v1}, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->start()V

    .line 127
    invoke-virtual {p0}, Lvpos/apipackage/AppTypeWindow;->ClearWindown()V

    .line 128
    const-string v1, "liuhao"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Robert select appDLG  return rid = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lvpos/apipackage/AppTypeWindow;->rid:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    sget v1, Lvpos/apipackage/AppTypeWindow;->rid:I

    return v1
.end method

.method public setIFinishType(Lvpos/apipackage/AppTypeWindow$IFinishType;)V
    .registers 2
    .param p1, "mIFinishType"    # Lvpos/apipackage/AppTypeWindow$IFinishType;

    .line 50
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow;->mIFinishType:Lvpos/apipackage/AppTypeWindow$IFinishType;

    .line 51
    return-void
.end method
