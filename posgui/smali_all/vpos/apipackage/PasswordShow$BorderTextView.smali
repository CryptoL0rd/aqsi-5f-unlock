.class public Lvpos/apipackage/PasswordShow$BorderTextView;
.super Landroid/widget/TextView;
.source "PasswordShow.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "DrawAllocation"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/apipackage/PasswordShow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BorderTextView"
.end annotation


# instance fields
.field private sroke_width:I

.field final synthetic this$0:Lvpos/apipackage/PasswordShow;


# direct methods
.method public constructor <init>(Lvpos/apipackage/PasswordShow;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Lvpos/apipackage/PasswordShow;
    .param p2, "context"    # Landroid/content/Context;

    .line 177
    iput-object p1, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->this$0:Lvpos/apipackage/PasswordShow;

    .line 178
    invoke-direct {p0, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 183
    const/16 v0, 0xa

    iput v0, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    .line 179
    return-void
.end method

.method public constructor <init>(Lvpos/apipackage/PasswordShow;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "this$0"    # Lvpos/apipackage/PasswordShow;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .line 180
    iput-object p1, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->this$0:Lvpos/apipackage/PasswordShow;

    .line 181
    invoke-direct {p0, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 183
    const/16 v0, 0xa

    iput v0, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    .line 182
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 186
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 188
    .local v0, "paint":Landroid/graphics/Paint;
    const v1, -0xffff01

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 190
    invoke-virtual {p0}, Lvpos/apipackage/PasswordShow$BorderTextView;->getWidth()I

    move-result v1

    iget v2, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    sub-int/2addr v1, v2

    int-to-float v4, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 191
    invoke-virtual {p0}, Lvpos/apipackage/PasswordShow$BorderTextView;->getHeight()I

    move-result v1

    iget v2, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    sub-int/2addr v1, v2

    int-to-float v5, v1

    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 192
    invoke-virtual {p0}, Lvpos/apipackage/PasswordShow$BorderTextView;->getWidth()I

    move-result v1

    iget v2, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    sub-int/2addr v1, v2

    int-to-float v2, v1

    invoke-virtual {p0}, Lvpos/apipackage/PasswordShow$BorderTextView;->getWidth()I

    move-result v1

    iget v3, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    sub-int/2addr v1, v3

    int-to-float v4, v1

    invoke-virtual {p0}, Lvpos/apipackage/PasswordShow$BorderTextView;->getHeight()I

    move-result v1

    iget v3, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    sub-int/2addr v1, v3

    int-to-float v5, v1

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 193
    invoke-virtual {p0}, Lvpos/apipackage/PasswordShow$BorderTextView;->getHeight()I

    move-result v1

    iget v2, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    sub-int/2addr v1, v2

    int-to-float v3, v1

    invoke-virtual {p0}, Lvpos/apipackage/PasswordShow$BorderTextView;->getWidth()I

    move-result v1

    iget v2, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    sub-int/2addr v1, v2

    int-to-float v4, v1

    invoke-virtual {p0}, Lvpos/apipackage/PasswordShow$BorderTextView;->getHeight()I

    move-result v1

    iget v2, p0, Lvpos/apipackage/PasswordShow$BorderTextView;->sroke_width:I

    sub-int/2addr v1, v2

    int-to-float v5, v1

    const/4 v2, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 194
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 195
    return-void
.end method
