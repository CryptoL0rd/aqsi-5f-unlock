.class Lvpos/keypad/KeyPad$2$2;
.super Ljava/lang/Object;
.source "KeyPad.java"

# interfaces
.implements Lvpos/keypad/StockKeyboardView$MyViewFocusInterface;


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

    .line 326
    iput-object p1, p0, Lvpos/keypad/KeyPad$2$2;->this$1:Lvpos/keypad/KeyPad$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isNoFocus()V
    .registers 3

    .line 328
    iget-object v0, p0, Lvpos/keypad/KeyPad$2$2;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v0, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    const/4 v1, -0x2

    iput v1, v0, Lvpos/keypad/KeyPad;->keyInputResult:I

    .line 330
    iget-object v0, p0, Lvpos/keypad/KeyPad$2$2;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v0, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v0, v0, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    if-eqz v0, :cond_1e

    .line 331
    iget-object v0, p0, Lvpos/keypad/KeyPad$2$2;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v0, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v0, v0, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    iget-object v1, p0, Lvpos/keypad/KeyPad$2$2;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v1, v1, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget v1, v1, Lvpos/keypad/KeyPad;->keyInputResult:I

    invoke-interface {v0, v1}, Lvpos/keypad/KeyPad$IFinishInput;->isFinish(I)V

    .line 333
    :cond_1e
    iget-object v0, p0, Lvpos/keypad/KeyPad$2$2;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v0, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    invoke-virtual {v0}, Lvpos/keypad/KeyPad;->HideKeyPad()V

    .line 334
    return-void
.end method
