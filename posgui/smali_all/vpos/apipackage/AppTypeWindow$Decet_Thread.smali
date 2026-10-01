.class public Lvpos/apipackage/AppTypeWindow$Decet_Thread;
.super Ljava/lang/Thread;
.source "AppTypeWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/apipackage/AppTypeWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Decet_Thread"
.end annotation


# instance fields
.field private m_bThreadFinished:Z

.field final synthetic this$0:Lvpos/apipackage/AppTypeWindow;


# direct methods
.method public constructor <init>(Lvpos/apipackage/AppTypeWindow;)V
    .registers 3
    .param p1, "this$0"    # Lvpos/apipackage/AppTypeWindow;

    .line 152
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 153
    const/4 v0, 0x0

    iput-boolean v0, p0, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->m_bThreadFinished:Z

    return-void
.end method


# virtual methods
.method public isThreadFinished()Z
    .registers 2

    .line 155
    iget-boolean v0, p0, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->m_bThreadFinished:Z

    return v0
.end method

.method public run()V
    .registers 6

    .line 158
    const-string v0, "Robert2030"

    const-string v1, "run() begin"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    monitor-enter p0

    .line 160
    :try_start_8
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lvpos/apipackage/AppTypeWindow;->startTime:J

    .line 161
    :goto_10
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget-wide v0, v0, Lvpos/apipackage/AppTypeWindow;->currentTime:J

    iget-object v2, p0, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget-wide v2, v2, Lvpos/apipackage/AppTypeWindow;->startTime:J

    const/4 v4, 0x0

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x2710

    cmp-long v4, v0, v2

    if-gez v4, :cond_29

    .line 162
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lvpos/apipackage/AppTypeWindow;->currentTime:J

    goto :goto_10

    .line 164
    :cond_29
    const-string v0, "Robert2030"

    const-string v1, "run() close"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->this$0:Lvpos/apipackage/AppTypeWindow;

    const/4 v1, 0x0

    iput v1, v0, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    .line 166
    const/4 v0, -0x1

    sput v0, Lvpos/apipackage/AppTypeWindow;->rid:I

    .line 167
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-virtual {v0}, Lvpos/apipackage/AppTypeWindow;->CloseWindow()V

    .line 168
    monitor-exit p0

    .line 169
    return-void

    .line 168
    :catchall_3f
    move-exception v0

    monitor-exit p0
    :try_end_41
    .catchall {:try_start_8 .. :try_end_41} :catchall_3f

    throw v0
.end method
