.class public Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;
.super Landroid/text/method/PasswordTransformationMethod;
.source "KeyPad.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/keypad/KeyPad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AsteriskPasswordTransformationMethod"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;
    }
.end annotation


# instance fields
.field final synthetic this$0:Lvpos/keypad/KeyPad;


# direct methods
.method public constructor <init>(Lvpos/keypad/KeyPad;)V
    .registers 2
    .param p1, "this$0"    # Lvpos/keypad/KeyPad;

    .line 748
    iput-object p1, p0, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;->this$0:Lvpos/keypad/KeyPad;

    invoke-direct {p0}, Landroid/text/method/PasswordTransformationMethod;-><init>()V

    return-void
.end method


# virtual methods
.method public getTransformation(Ljava/lang/CharSequence;Landroid/view/View;)Ljava/lang/CharSequence;
    .registers 4
    .param p1, "source"    # Ljava/lang/CharSequence;
    .param p2, "view"    # Landroid/view/View;

    .line 750
    new-instance v0, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;

    invoke-direct {v0, p0, p1}, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod$PasswordCharSequence;-><init>(Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;Ljava/lang/CharSequence;)V

    return-object v0
.end method
