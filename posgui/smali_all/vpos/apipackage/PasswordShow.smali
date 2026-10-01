.class public Lvpos/apipackage/PasswordShow;
.super Ljava/lang/Object;
.source "PasswordShow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvpos/apipackage/PasswordShow$BorderTextView;,
        Lvpos/apipackage/PasswordShow$KB_Thread;
    }
.end annotation


# static fields
.field private static mctx:Landroid/content/Context;

.field private static mdialog:Landroid/app/Dialog;

.field private static textView:Lvpos/apipackage/PasswordShow$BorderTextView;


# instance fields
.field amountString:Ljava/lang/String;

.field private handler:Landroid/os/Handler;

.field isQuit:Z

.field m_KBThread:Lvpos/apipackage/PasswordShow$KB_Thread;

.field mark:B

.field private final tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "ctx"    # Landroid/content/Context;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const-string v0, "PasswordShow"

    iput-object v0, p0, Lvpos/apipackage/PasswordShow;->tag:Ljava/lang/String;

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lvpos/apipackage/PasswordShow;->isQuit:Z

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lvpos/apipackage/PasswordShow;->amountString:Ljava/lang/String;

    .line 77
    iput-object v0, p0, Lvpos/apipackage/PasswordShow;->m_KBThread:Lvpos/apipackage/PasswordShow$KB_Thread;

    .line 113
    new-instance v0, Lvpos/apipackage/PasswordShow$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lvpos/apipackage/PasswordShow$1;-><init>(Lvpos/apipackage/PasswordShow;Landroid/os/Looper;)V

    iput-object v0, p0, Lvpos/apipackage/PasswordShow;->handler:Landroid/os/Handler;

    .line 34
    sput-object p1, Lvpos/apipackage/PasswordShow;->mctx:Landroid/content/Context;

    .line 35
    return-void
.end method

.method private static native Lib_GetPinEvent()I
.end method

.method static synthetic access$000()I
    .registers 1

    .line 28
    invoke-static {}, Lvpos/apipackage/PasswordShow;->Lib_GetPinEvent()I

    move-result v0

    return v0
.end method

.method static synthetic access$100()Landroid/app/Dialog;
    .registers 1

    .line 28
    sget-object v0, Lvpos/apipackage/PasswordShow;->mdialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$102(Landroid/app/Dialog;)Landroid/app/Dialog;
    .registers 1
    .param p0, "x0"    # Landroid/app/Dialog;

    .line 28
    sput-object p0, Lvpos/apipackage/PasswordShow;->mdialog:Landroid/app/Dialog;

    return-object p0
.end method

.method static synthetic access$200()Landroid/content/Context;
    .registers 1

    .line 28
    sget-object v0, Lvpos/apipackage/PasswordShow;->mctx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300()Lvpos/apipackage/PasswordShow$BorderTextView;
    .registers 1

    .line 28
    sget-object v0, Lvpos/apipackage/PasswordShow;->textView:Lvpos/apipackage/PasswordShow$BorderTextView;

    return-object v0
.end method

.method static synthetic access$302(Lvpos/apipackage/PasswordShow$BorderTextView;)Lvpos/apipackage/PasswordShow$BorderTextView;
    .registers 1
    .param p0, "x0"    # Lvpos/apipackage/PasswordShow$BorderTextView;

    .line 28
    sput-object p0, Lvpos/apipackage/PasswordShow;->textView:Lvpos/apipackage/PasswordShow$BorderTextView;

    return-object p0
.end method


# virtual methods
.method public DismissDialog()I
    .registers 3

    .line 60
    const-string v0, "PasswordShow"

    const-string v1, "DismissDialog"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    const-string v0, "disShowMessage"

    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lvpos/apipackage/PasswordShow;->SendMsg(ILjava/lang/String;)V

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lvpos/apipackage/PasswordShow;->isQuit:Z

    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public SendMsg(ILjava/lang/String;)V
    .registers 6
    .param p1, "iType"    # I
    .param p2, "strInfo"    # Ljava/lang/String;

    .line 67
    iget-object v0, p0, Lvpos/apipackage/PasswordShow;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_1d

    .line 68
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 69
    .local v0, "msg":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 70
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 71
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "MSG"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 73
    iget-object v2, p0, Lvpos/apipackage/PasswordShow;->handler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 75
    .end local v0    # "msg":Landroid/os/Message;
    .end local v1    # "b":Landroid/os/Bundle;
    :cond_1d
    return-void
.end method

.method public ShowDialog(B[B)I
    .registers 6
    .param p1, "mark"    # B
    .param p2, "amount"    # [B

    .line 46
    const-string v0, "PasswordShow"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ShowDialog iAmount = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p2

    invoke-static {p2, v2}, Lvpos/apipackage/ByteUtil;->bytearrayToHexString([BI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    iput-byte p1, p0, Lvpos/apipackage/PasswordShow;->mark:B

    .line 48
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lvpos/apipackage/PasswordShow;->amountString:Ljava/lang/String;

    .line 49
    const-string v0, "amountString"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "amountString = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lvpos/apipackage/PasswordShow;->amountString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    const-string v0, "showMessage"

    const/4 v1, 0x3

    invoke-virtual {p0, v1, v0}, Lvpos/apipackage/PasswordShow;->SendMsg(ILjava/lang/String;)V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lvpos/apipackage/PasswordShow;->isQuit:Z

    .line 53
    new-instance v1, Lvpos/apipackage/PasswordShow$KB_Thread;

    invoke-direct {v1, p0}, Lvpos/apipackage/PasswordShow$KB_Thread;-><init>(Lvpos/apipackage/PasswordShow;)V

    iput-object v1, p0, Lvpos/apipackage/PasswordShow;->m_KBThread:Lvpos/apipackage/PasswordShow$KB_Thread;

    .line 54
    iget-object v1, p0, Lvpos/apipackage/PasswordShow;->m_KBThread:Lvpos/apipackage/PasswordShow$KB_Thread;

    invoke-virtual {v1}, Lvpos/apipackage/PasswordShow$KB_Thread;->start()V

    .line 56
    return v0
.end method
