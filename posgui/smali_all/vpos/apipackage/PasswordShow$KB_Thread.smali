.class public Lvpos/apipackage/PasswordShow$KB_Thread;
.super Ljava/lang/Thread;
.source "PasswordShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/apipackage/PasswordShow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "KB_Thread"
.end annotation


# instance fields
.field keyNum:I

.field keyNumOld:I

.field keycode:I

.field private m_bThreadFinished:Z

.field ret:I

.field final synthetic this$0:Lvpos/apipackage/PasswordShow;


# direct methods
.method public constructor <init>(Lvpos/apipackage/PasswordShow;)V
    .registers 3
    .param p1, "this$0"    # Lvpos/apipackage/PasswordShow;

    .line 78
    iput-object p1, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->this$0:Lvpos/apipackage/PasswordShow;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->m_bThreadFinished:Z

    .line 80
    iput v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->keyNumOld:I

    return-void
.end method


# virtual methods
.method public isThreadFinished()Z
    .registers 2

    .line 84
    iget-boolean v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->m_bThreadFinished:Z

    return v0
.end method

.method public run()V
    .registers 5

    .line 88
    const-string v0, "KB_Thread[ run ]"

    const-string v1, "run() begin"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    monitor-enter p0

    .line 90
    :goto_8
    :try_start_8
    iget-object v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->this$0:Lvpos/apipackage/PasswordShow;

    iget-boolean v0, v0, Lvpos/apipackage/PasswordShow;->isQuit:Z

    if-nez v0, :cond_56

    .line 91
    # invokes: Lvpos/apipackage/PasswordShow;->Lib_GetPinEvent()I
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$000()I

    move-result v0

    iput v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->keyNum:I

    .line 92
    iget v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->keyNum:I

    if-gez v0, :cond_19

    .line 93
    goto :goto_8

    .line 94
    :cond_19
    iget v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->keyNum:I

    const/16 v1, 0x3b

    if-ne v0, v1, :cond_26

    .line 95
    iget-object v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->this$0:Lvpos/apipackage/PasswordShow;

    invoke-virtual {v0}, Lvpos/apipackage/PasswordShow;->DismissDialog()I

    .line 96
    monitor-exit p0

    return-void

    .line 97
    :cond_26
    iget v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->keyNum:I

    const/16 v1, 0x1c

    if-ne v0, v1, :cond_33

    .line 98
    iget-object v0, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->this$0:Lvpos/apipackage/PasswordShow;

    invoke-virtual {v0}, Lvpos/apipackage/PasswordShow;->DismissDialog()I

    .line 99
    monitor-exit p0

    return-void

    .line 101
    :cond_33
    const-string v0, ""

    .line 102
    .local v0, "strInfo":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_36
    iget v2, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->keyNum:I

    if-ge v1, v2, :cond_4f

    .line 103
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "*"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v0, v2

    .line 102
    add-int/lit8 v1, v1, 0x1

    goto :goto_36

    .line 106
    .end local v1    # "i":I
    :cond_4f
    iget-object v1, p0, Lvpos/apipackage/PasswordShow$KB_Thread;->this$0:Lvpos/apipackage/PasswordShow;

    const/4 v2, 0x4

    invoke-virtual {v1, v2, v0}, Lvpos/apipackage/PasswordShow;->SendMsg(ILjava/lang/String;)V

    .line 107
    .end local v0    # "strInfo":Ljava/lang/String;
    goto :goto_8

    .line 109
    :cond_56
    monitor-exit p0

    .line 110
    return-void

    .line 109
    :catchall_58
    move-exception v0

    monitor-exit p0
    :try_end_5a
    .catchall {:try_start_8 .. :try_end_5a} :catchall_58

    throw v0
.end method
