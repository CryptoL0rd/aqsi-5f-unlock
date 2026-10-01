.class public Lvpos/keypad/StockKeyboardView;
.super Landroid/inputmethodservice/KeyboardView;
.source "StockKeyboardView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvpos/keypad/StockKeyboardView$MyViewFocusInterface;
    }
.end annotation


# instance fields
.field myViewFocusInterface:Lvpos/keypad/StockKeyboardView$MyViewFocusInterface;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 19
    invoke-direct {p0, p1, p2}, Landroid/inputmethodservice/KeyboardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .line 23
    invoke-direct {p0, p1, p2, p3}, Landroid/inputmethodservice/KeyboardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 24
    return-void
.end method


# virtual methods
.method protected onLongPress(Landroid/inputmethodservice/Keyboard$Key;)Z
    .registers 4
    .param p1, "popupKey"    # Landroid/inputmethodservice/Keyboard$Key;

    .line 29
    iget-object v0, p1, Landroid/inputmethodservice/Keyboard$Key;->codes:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    .line 35
    invoke-super {p0, p1}, Landroid/inputmethodservice/KeyboardView;->onLongPress(Landroid/inputmethodservice/Keyboard$Key;)Z

    move-result v0

    return v0
.end method

.method public onWindowFocusChanged(Z)V
    .registers 4
    .param p1, "hasWindowFocus"    # Z

    .line 48
    invoke-super {p0, p1}, Landroid/inputmethodservice/KeyboardView;->onWindowFocusChanged(Z)V

    .line 50
    if-nez p1, :cond_11

    .line 51
    const-string v0, "liuhao"

    const-string v1, "no focus"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget-object v0, p0, Lvpos/keypad/StockKeyboardView;->myViewFocusInterface:Lvpos/keypad/StockKeyboardView$MyViewFocusInterface;

    invoke-interface {v0}, Lvpos/keypad/StockKeyboardView$MyViewFocusInterface;->isNoFocus()V

    .line 54
    :cond_11
    return-void
.end method

.method public setMyViewFocusInterface(Lvpos/keypad/StockKeyboardView$MyViewFocusInterface;)V
    .registers 2
    .param p1, "myViewFocusInterface"    # Lvpos/keypad/StockKeyboardView$MyViewFocusInterface;

    .line 43
    iput-object p1, p0, Lvpos/keypad/StockKeyboardView;->myViewFocusInterface:Lvpos/keypad/StockKeyboardView$MyViewFocusInterface;

    .line 44
    return-void
.end method
