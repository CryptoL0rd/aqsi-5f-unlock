.class Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;
.super Ljava/lang/Object;
.source "KeyPad.java"

# interfaces
.implements Ljava/lang/CharSequence;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PasswordCharSequence"
.end annotation


# instance fields
.field private mSource:Ljava/lang/CharSequence;

.field final synthetic this$1:Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;


# direct methods
.method public constructor <init>(Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;Ljava/lang/CharSequence;)V
    .registers 3
    .param p2, "source"    # Ljava/lang/CharSequence;

    .line 756
    iput-object p1, p0, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;->this$1:Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 757
    iput-object p2, p0, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;->mSource:Ljava/lang/CharSequence;

    .line 758
    return-void
.end method


# virtual methods
.method public charAt(I)C
    .registers 4
    .param p1, "index"    # I

    .line 762
    iget-object v0, p0, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;->mSource:Ljava/lang/CharSequence;

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x39

    if-gt v0, v1, :cond_18

    iget-object v0, p0, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;->mSource:Ljava/lang/CharSequence;

    invoke-interface {v0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x30

    if-ge v0, v1, :cond_15

    goto :goto_18

    .line 765
    :cond_15
    const/16 v0, 0x2a

    return v0

    .line 763
    :cond_18
    :goto_18
    const/4 v0, 0x0

    return v0
.end method

.method public length()I
    .registers 2

    .line 769
    iget-object v0, p0, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;->mSource:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .registers 4
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 773
    iget-object v0, p0, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;->mSource:Ljava/lang/CharSequence;

    invoke-interface {v0, p1, p2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method
