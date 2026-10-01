.class Lvpos/apipackage/AppTypeWindow$TimeCount;
.super Landroid/os/CountDownTimer;
.source "AppTypeWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/apipackage/AppTypeWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TimeCount"
.end annotation


# instance fields
.field final synthetic this$0:Lvpos/apipackage/AppTypeWindow;


# direct methods
.method public constructor <init>(Lvpos/apipackage/AppTypeWindow;JJ)V
    .registers 6
    .param p1, "this$0"    # Lvpos/apipackage/AppTypeWindow;
    .param p2, "millisInFuture"    # J
    .param p4, "countDownInterval"    # J

    .line 54
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow$TimeCount;->this$0:Lvpos/apipackage/AppTypeWindow;

    .line 55
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 56
    return-void
.end method


# virtual methods
.method public onFinish()V
    .registers 3

    .line 64
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$TimeCount;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-virtual {v0}, Lvpos/apipackage/AppTypeWindow;->CloseWindow()V

    .line 65
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$TimeCount;->this$0:Lvpos/apipackage/AppTypeWindow;

    const/4 v1, 0x0

    iput v1, v0, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    .line 66
    const/4 v0, -0x1

    sput v0, Lvpos/apipackage/AppTypeWindow;->rid:I

    .line 67
    return-void
.end method

.method public onTick(J)V
    .registers 3
    .param p1, "millisUntilFinished"    # J

    .line 60
    return-void
.end method
