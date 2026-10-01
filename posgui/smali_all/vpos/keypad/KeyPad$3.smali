.class Lvpos/keypad/KeyPad$3;
.super Ljava/lang/Object;
.source "KeyPad.java"

# interfaces
.implements Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/keypad/KeyPad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lvpos/keypad/KeyPad;


# direct methods
.method constructor <init>(Lvpos/keypad/KeyPad;)V
    .registers 2
    .param p1, "this$0"    # Lvpos/keypad/KeyPad;

    .line 460
    iput-object p1, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(I[I)V
    .registers 7
    .param p1, "primaryCode"    # I
    .param p2, "keyCodes"    # [I

    .line 507
    iget-object v0, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 508
    .local v0, "editable":Landroid/text/Editable;
    iget-object v1, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v1}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v1

    .line 509
    .local v1, "start":I
    packed-switch p1, :pswitch_data_aa

    .line 552
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v2}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    iget-object v3, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    iget v3, v3, Lvpos/keypad/KeyPad;->keyInputMaxLength:I

    if-ge v2, v3, :cond_a8

    .line 553
    int-to-char v2, p1

    invoke-static {v2}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    goto/16 :goto_a8

    .line 518
    :pswitch_35
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    const/4 v3, -0x4

    iput v3, v2, Lvpos/keypad/KeyPad;->keyInputResult:I

    .line 521
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    iget-object v2, v2, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    if-eqz v2, :cond_4b

    .line 522
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    iget-object v2, v2, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    iget-object v3, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    iget v3, v3, Lvpos/keypad/KeyPad;->keyInputResult:I

    invoke-interface {v2, v3}, Lvpos/keypad/KeyPad$IFinishInput;->isFinish(I)V

    .line 525
    :cond_4b
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    invoke-virtual {v2}, Lvpos/keypad/KeyPad;->HideKeyPad()V

    .line 526
    goto :goto_a8

    .line 537
    :pswitch_51
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v2}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    iget-object v3, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    iget v3, v3, Lvpos/keypad/KeyPad;->keyInputMinLength:I

    add-int/lit8 v3, v3, -0x1

    if-le v2, v3, :cond_a8

    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v2}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    iget-object v3, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    iget v3, v3, Lvpos/keypad/KeyPad;->keyInputMaxLength:I

    add-int/lit8 v3, v3, 0x1

    if-ge v2, v3, :cond_a8

    .line 538
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    const/4 v3, 0x0

    iput v3, v2, Lvpos/keypad/KeyPad;->keyInputResult:I

    .line 540
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    iget-object v2, v2, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    if-eqz v2, :cond_93

    .line 541
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    iget-object v2, v2, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    iget-object v3, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    iget v3, v3, Lvpos/keypad/KeyPad;->keyInputResult:I

    invoke-interface {v2, v3}, Lvpos/keypad/KeyPad$IFinishInput;->isFinish(I)V

    .line 544
    :cond_93
    iget-object v2, p0, Lvpos/keypad/KeyPad$3;->this$0:Lvpos/keypad/KeyPad;

    invoke-virtual {v2}, Lvpos/keypad/KeyPad;->HideKeyPad()V

    goto :goto_a8

    .line 511
    :pswitch_99
    if-eqz v0, :cond_a8

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v2

    if-lez v2, :cond_a8

    .line 512
    if-lez v1, :cond_a8

    .line 513
    add-int/lit8 v2, v1, -0x1

    invoke-interface {v0, v2, v1}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 557
    :cond_a8
    :goto_a8
    return-void

    nop

    :pswitch_data_aa
    .packed-switch -0x5
        :pswitch_99
        :pswitch_51
        :pswitch_35
    .end packed-switch
.end method

.method public onPress(I)V
    .registers 2
    .param p1, "primaryCode"    # I

    .line 500
    return-void
.end method

.method public onRelease(I)V
    .registers 2
    .param p1, "primaryCode"    # I

    .line 495
    return-void
.end method

.method public onText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/CharSequence;

    .line 485
    return-void
.end method

.method public swipeDown()V
    .registers 1

    .line 480
    return-void
.end method

.method public swipeLeft()V
    .registers 1

    .line 475
    return-void
.end method

.method public swipeRight()V
    .registers 1

    .line 470
    return-void
.end method

.method public swipeUp()V
    .registers 1

    .line 465
    return-void
.end method
