.class Lvpos/keypad/KeyPad$2$3;
.super Ljava/lang/Object;
.source "KeyPad.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lvpos/keypad/KeyPad$2;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lvpos/keypad/KeyPad$2;


# direct methods
.method constructor <init>(Lvpos/keypad/KeyPad$2;)V
    .registers 2
    .param p1, "this$1"    # Lvpos/keypad/KeyPad$2;

    .line 397
    iput-object p1, p0, Lvpos/keypad/KeyPad$2$3;->this$1:Lvpos/keypad/KeyPad$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .line 399
    const/4 v0, 0x4

    if-ne p2, v0, :cond_28

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_28

    .line 401
    iget-object v0, p0, Lvpos/keypad/KeyPad$2$3;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v0, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    const/4 v1, -0x1

    iput v1, v0, Lvpos/keypad/KeyPad;->keyInputResult:I

    .line 403
    iget-object v0, p0, Lvpos/keypad/KeyPad$2$3;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v0, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v0, v0, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    if-eqz v0, :cond_28

    .line 404
    iget-object v0, p0, Lvpos/keypad/KeyPad$2$3;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v0, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v0, v0, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    iget-object v1, p0, Lvpos/keypad/KeyPad$2$3;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v1, v1, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget v1, v1, Lvpos/keypad/KeyPad;->keyInputResult:I

    invoke-interface {v0, v1}, Lvpos/keypad/KeyPad$IFinishInput;->isFinish(I)V

    .line 408
    :cond_28
    const/4 v0, 0x0

    return v0
.end method
