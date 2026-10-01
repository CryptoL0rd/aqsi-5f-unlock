.class Lvpos/keypad/KeyPad$2$1;
.super Ljava/lang/Object;
.source "KeyPad.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 290
    iput-object p1, p0, Lvpos/keypad/KeyPad$2$1;->this$1:Lvpos/keypad/KeyPad$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .line 293
    iget-object v0, p0, Lvpos/keypad/KeyPad$2$1;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v0, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 294
    .local v0, "editable":Landroid/text/Editable;
    iget-object v1, p0, Lvpos/keypad/KeyPad$2$1;->this$1:Lvpos/keypad/KeyPad$2;

    iget-object v1, v1, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v1}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v1

    .line 295
    .local v1, "start":I
    if-eqz v0, :cond_27

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v2

    if-lez v2, :cond_27

    .line 296
    if-lez v1, :cond_27

    .line 297
    add-int/lit8 v2, v1, -0x1

    invoke-interface {v0, v2, v1}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 300
    :cond_27
    return-void
.end method
