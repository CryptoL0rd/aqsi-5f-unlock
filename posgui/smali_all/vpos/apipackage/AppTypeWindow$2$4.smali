.class Lvpos/apipackage/AppTypeWindow$2$4;
.super Ljava/lang/Object;
.source "AppTypeWindow.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lvpos/apipackage/AppTypeWindow$2;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lvpos/apipackage/AppTypeWindow$2;


# direct methods
.method constructor <init>(Lvpos/apipackage/AppTypeWindow$2;)V
    .registers 2
    .param p1, "this$1"    # Lvpos/apipackage/AppTypeWindow$2;

    .line 256
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow$2$4;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .line 260
    const-string v0, "liuhao"

    const-string v1, ".....start....."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    const/4 v0, 0x4

    if-ne p2, v0, :cond_3d

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3d

    .line 263
    const-string v0, "liuhao"

    const-string v1, ".....back key....."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$4;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    const/4 v1, -0x3

    iput v1, v0, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    .line 266
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$4;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow;->mIFinishType:Lvpos/apipackage/AppTypeWindow$IFinishType;

    if-eqz v0, :cond_36

    .line 267
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$4;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow;->mIFinishType:Lvpos/apipackage/AppTypeWindow$IFinishType;

    iget-object v1, p0, Lvpos/apipackage/AppTypeWindow$2$4;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v1, v1, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget v1, v1, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    invoke-interface {v0, v1}, Lvpos/apipackage/AppTypeWindow$IFinishType;->isFinished(I)V

    .line 269
    :cond_36
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$4;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-virtual {v0}, Lvpos/apipackage/AppTypeWindow;->CloseWindow()V

    .line 271
    :cond_3d
    const/4 v0, 0x0

    return v0
.end method
