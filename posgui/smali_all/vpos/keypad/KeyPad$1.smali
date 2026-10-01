.class Lvpos/keypad/KeyPad$1;
.super Ljava/lang/Object;
.source "KeyPad.java"

# interfaces
.implements Lvpos/keypad/KeyPad$IFinishInput;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lvpos/keypad/KeyPad;->ShowKeyPad(Ljava/lang/String;I[B[BII)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lvpos/keypad/KeyPad;

.field final synthetic val$input:[B

.field final synthetic val$input_len:[B


# direct methods
.method constructor <init>(Lvpos/keypad/KeyPad;[B[B)V
    .registers 4
    .param p1, "this$0"    # Lvpos/keypad/KeyPad;

    .line 127
    iput-object p1, p0, Lvpos/keypad/KeyPad$1;->this$0:Lvpos/keypad/KeyPad;

    iput-object p2, p0, Lvpos/keypad/KeyPad$1;->val$input_len:[B

    iput-object p3, p0, Lvpos/keypad/KeyPad$1;->val$input:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isFinish(I)V
    .registers 7
    .param p1, "finishResult"    # I

    .line 130
    iget-object v0, p0, Lvpos/keypad/KeyPad$1;->this$0:Lvpos/keypad/KeyPad;

    iput p1, v0, Lvpos/keypad/KeyPad;->keyInputResult:I

    .line 131
    if-nez p1, :cond_3a

    .line 132
    iget-object v0, p0, Lvpos/keypad/KeyPad$1;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "inputString":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_23

    .line 134
    iget-object v1, p0, Lvpos/keypad/KeyPad$1;->this$0:Lvpos/keypad/KeyPad;

    const/4 v2, -0x3

    iput v2, v1, Lvpos/keypad/KeyPad;->keyInputResult:I

    .line 137
    :cond_23
    iget-object v1, p0, Lvpos/keypad/KeyPad$1;->val$input_len:[B

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    int-to-byte v2, v2

    const/4 v3, 0x0

    aput-byte v2, v1, v3

    .line 138
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    iget-object v2, p0, Lvpos/keypad/KeyPad$1;->val$input:[B

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v1, v3, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 140
    .end local v0    # "inputString":Ljava/lang/String;
    :cond_3a
    iget-object v0, p0, Lvpos/keypad/KeyPad$1;->this$0:Lvpos/keypad/KeyPad;

    invoke-virtual {v0}, Lvpos/keypad/KeyPad;->HideKeyPad()V

    .line 141
    return-void
.end method
