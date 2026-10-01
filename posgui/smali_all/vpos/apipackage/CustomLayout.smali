.class public Lvpos/apipackage/CustomLayout;
.super Landroid/widget/LinearLayout;
.source "CustomLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvpos/apipackage/CustomLayout$MyViewFocusInterface;
    }
.end annotation


# instance fields
.field myViewFocusInterface:Lvpos/apipackage/CustomLayout$MyViewFocusInterface;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .line 12
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 26
    return-void
.end method


# virtual methods
.method public onWindowFocusChanged(Z)V
    .registers 3
    .param p1, "hasWindowFocus"    # Z

    .line 29
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowFocusChanged(Z)V

    .line 30
    if-nez p1, :cond_a

    .line 31
    iget-object v0, p0, Lvpos/apipackage/CustomLayout;->myViewFocusInterface:Lvpos/apipackage/CustomLayout$MyViewFocusInterface;

    invoke-interface {v0}, Lvpos/apipackage/CustomLayout$MyViewFocusInterface;->isNoFocus()V

    .line 33
    :cond_a
    return-void
.end method

.method public setMyViewFocusInterface(Lvpos/apipackage/CustomLayout$MyViewFocusInterface;)V
    .registers 2
    .param p1, "myViewFocusInterface"    # Lvpos/apipackage/CustomLayout$MyViewFocusInterface;

    .line 42
    iput-object p1, p0, Lvpos/apipackage/CustomLayout;->myViewFocusInterface:Lvpos/apipackage/CustomLayout$MyViewFocusInterface;

    .line 43
    return-void
.end method
