.class public Lvpos/keypad/KeyElement;
.super Ljava/lang/Object;
.source "KeyElement.java"


# instance fields
.field keyCode:I

.field keyIcon:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getKeyCode()I
    .registers 2

    .line 11
    iget v0, p0, Lvpos/keypad/KeyElement;->keyCode:I

    return v0
.end method

.method public getKeyIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 19
    iget-object v0, p0, Lvpos/keypad/KeyElement;->keyIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public setKeyCode(I)V
    .registers 2
    .param p1, "keyCode"    # I

    .line 15
    iput p1, p0, Lvpos/keypad/KeyElement;->keyCode:I

    .line 16
    return-void
.end method

.method public setKeyIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "keyIcon"    # Landroid/graphics/drawable/Drawable;

    .line 23
    iput-object p1, p0, Lvpos/keypad/KeyElement;->keyIcon:Landroid/graphics/drawable/Drawable;

    .line 24
    return-void
.end method
