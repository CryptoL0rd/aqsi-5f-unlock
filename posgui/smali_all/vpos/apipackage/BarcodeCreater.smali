.class public abstract Lvpos/apipackage/BarcodeCreater;
.super Ljava/lang/Object;
.source "BarcodeCreater.java"


# static fields
.field private static barcodeFormat:Lcom/google/zxing/BarcodeFormat;

.field private static marginW:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 25
    const/16 v0, 0x14

    sput v0, Lvpos/apipackage/BarcodeCreater;->marginW:I

    .line 29
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

    sput-object v0, Lvpos/apipackage/BarcodeCreater;->barcodeFormat:Lcom/google/zxing/BarcodeFormat;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static creatBarcode(Landroid/content/Context;Ljava/lang/String;IIZ)Landroid/graphics/Bitmap;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "desiredWidth"    # I
    .param p3, "desiredHeight"    # I
    .param p4, "displayCode"    # Z

    .line 42
    const/4 v0, 0x0

    .line 43
    .local v0, "ruseltBitmap":Landroid/graphics/Bitmap;
    if-eqz p4, :cond_1e

    .line 44
    sget-object v1, Lvpos/apipackage/BarcodeCreater;->barcodeFormat:Lcom/google/zxing/BarcodeFormat;

    invoke-static {p1, v1, p2, p3}, Lvpos/apipackage/BarcodeCreater;->encodeAsBitmap(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 45
    .local v1, "barcodeBitmap":Landroid/graphics/Bitmap;
    sget v2, Lvpos/apipackage/BarcodeCreater;->marginW:I

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v2, p2

    invoke-static {p1, v2, p3, p0}, Lvpos/apipackage/BarcodeCreater;->creatCodeBitmap(Ljava/lang/String;IILandroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 46
    .local v2, "codeBitmap":Landroid/graphics/Bitmap;
    new-instance v3, Landroid/graphics/PointF;

    const/4 v4, 0x0

    int-to-float v5, p3

    invoke-direct {v3, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-static {v1, v2, v3}, Lvpos/apipackage/BarcodeCreater;->mixtureBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/PointF;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 47
    .end local v1    # "barcodeBitmap":Landroid/graphics/Bitmap;
    .end local v2    # "codeBitmap":Landroid/graphics/Bitmap;
    goto :goto_24

    .line 48
    :cond_1e
    sget-object v1, Lvpos/apipackage/BarcodeCreater;->barcodeFormat:Lcom/google/zxing/BarcodeFormat;

    invoke-static {p1, v1, p2, p3}, Lvpos/apipackage/BarcodeCreater;->encodeAsBitmap(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 51
    :goto_24
    return-object v0
.end method

.method public static creatBarcode(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)Landroid/graphics/Bitmap;
    .registers 5
    .param p0, "contents"    # Ljava/lang/String;
    .param p1, "desiredWidth"    # I
    .param p2, "desiredHeight"    # I
    .param p3, "barcodeFormat"    # Lcom/google/zxing/BarcodeFormat;

    .line 55
    const/4 v0, 0x0

    .line 57
    .local v0, "ruseltBitmap":Landroid/graphics/Bitmap;
    invoke-static {p0, p3, p1, p2}, Lvpos/apipackage/BarcodeCreater;->encodeAsBitmap(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 59
    return-object v0
.end method

.method protected static creatCodeBitmap(Ljava/lang/String;IILandroid/content/Context;)Landroid/graphics/Bitmap;
    .registers 9
    .param p0, "contents"    # Ljava/lang/String;
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "context"    # Landroid/content/Context;

    .line 71
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 72
    .local v0, "tv":Landroid/widget/TextView;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 73
    .local v1, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setHeight(I)V

    .line 76
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 77
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setWidth(I)V

    .line 78
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setDrawingCacheEnabled(Z)V

    .line 79
    const/high16 v2, -0x1000000

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    nop

    .line 81
    const/4 v2, 0x0

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 82
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 80
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->measure(II)V

    .line 83
    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v3

    .line 84
    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v4

    .line 83
    invoke-virtual {v0, v2, v2, v3, v4}, Landroid/widget/TextView;->layout(IIII)V

    .line 86
    invoke-virtual {v0}, Landroid/widget/TextView;->buildDrawingCache()V

    .line 87
    invoke-virtual {v0}, Landroid/widget/TextView;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 88
    .local v2, "bitmapCode":Landroid/graphics/Bitmap;
    return-object v2
.end method

.method protected static encodeAsBitmap(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Landroid/graphics/Bitmap;
    .registers 22
    .param p0, "contents"    # Ljava/lang/String;
    .param p1, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p2, "desiredWidth"    # I
    .param p3, "desiredHeight"    # I

    .line 103
    const/4 v1, -0x1

    .line 104
    .local v1, "WHITE":I
    const/high16 v2, -0x1000000

    .line 106
    .local v2, "BLACK":I
    new-instance v3, Lcom/google/zxing/MultiFormatWriter;

    invoke-direct {v3}, Lcom/google/zxing/MultiFormatWriter;-><init>()V

    .line 107
    .local v3, "writer":Lcom/google/zxing/MultiFormatWriter;
    const/4 v0, 0x0

    move-object v9, v0

    .line 109
    .local v9, "result":Lcom/google/zxing/common/BitMatrix;
    const/4 v8, 0x0

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v6, p2

    move/from16 v7, p3

    :try_start_13
    invoke-virtual/range {v3 .. v8}, Lcom/google/zxing/MultiFormatWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0
    :try_end_17
    .catch Lcom/google/zxing/WriterException; {:try_start_13 .. :try_end_17} :catch_19

    move-object v9, v0

    .line 114
    goto :goto_1f

    .line 111
    :catch_19
    move-exception v0

    move-object v4, v0

    move-object v0, v4

    .line 113
    .local v0, "e":Lcom/google/zxing/WriterException;
    invoke-virtual {v0}, Lcom/google/zxing/WriterException;->printStackTrace()V

    .line 116
    .end local v0    # "e":Lcom/google/zxing/WriterException;
    :goto_1f
    invoke-virtual {v9}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    .line 117
    .local v0, "width":I
    invoke-virtual {v9}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    .line 118
    .local v4, "height":I
    mul-int v5, v0, v4

    new-array v5, v5, [I

    .line 120
    .local v5, "pixels":[I
    const/4 v6, 0x0

    const/4 v7, 0x0

    .local v7, "y":I
    :goto_2d
    if-ge v7, v4, :cond_48

    .line 121
    mul-int v8, v7, v0

    .line 122
    .local v8, "offset":I
    const/4 v10, 0x0

    .local v10, "x":I
    :goto_32
    if-ge v10, v0, :cond_45

    .line 123
    add-int v11, v8, v10

    invoke-virtual {v9, v10, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v12

    if-eqz v12, :cond_3f

    const/high16 v12, -0x1000000

    goto :goto_40

    :cond_3f
    const/4 v12, -0x1

    :goto_40
    aput v12, v5, v11

    .line 122
    add-int/lit8 v10, v10, 0x1

    goto :goto_32

    .line 120
    .end local v8    # "offset":I
    .end local v10    # "x":I
    :cond_45
    add-int/lit8 v7, v7, 0x1

    goto :goto_2d

    .line 127
    .end local v7    # "y":I
    :cond_48
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v4, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 129
    .local v6, "bitmap":Landroid/graphics/Bitmap;
    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object v10, v6

    move-object v11, v5

    move v13, v0

    move/from16 v16, v0

    move/from16 v17, v4

    invoke-virtual/range {v10 .. v17}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 130
    const/4 v3, 0x0

    .line 131
    const/4 v7, 0x0

    .line 132
    .end local v9    # "result":Lcom/google/zxing/common/BitMatrix;
    .local v7, "result":Lcom/google/zxing/common/BitMatrix;
    return-object v6
.end method

.method protected static mixtureBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/PointF;)Landroid/graphics/Bitmap;
    .registers 8
    .param p0, "first"    # Landroid/graphics/Bitmap;
    .param p1, "second"    # Landroid/graphics/Bitmap;
    .param p2, "fromPoint"    # Landroid/graphics/PointF;

    .line 144
    const/4 v0, 0x0

    if-eqz p0, :cond_3f

    if-eqz p1, :cond_3f

    if-nez p2, :cond_8

    goto :goto_3f

    .line 147
    :cond_8
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    add-int/2addr v1, v2

    sget v2, Lvpos/apipackage/BarcodeCreater;->marginW:I

    add-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    add-int/2addr v2, v3

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 149
    .local v1, "newBitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 150
    .local v2, "cv":Landroid/graphics/Canvas;
    sget v3, Lvpos/apipackage/BarcodeCreater;->marginW:I

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-virtual {v2, p0, v3, v4, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 151
    iget v3, p2, Landroid/graphics/PointF;->x:F

    iget v4, p2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v2, p1, v3, v4, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 152
    const/16 v0, 0x1f

    invoke-virtual {v2, v0}, Landroid/graphics/Canvas;->save(I)I

    .line 153
    invoke-virtual {v2}, Landroid/graphics/Canvas;->restore()V

    .line 155
    return-object v1

    .line 145
    .end local v1    # "newBitmap":Landroid/graphics/Bitmap;
    .end local v2    # "cv":Landroid/graphics/Canvas;
    :cond_3f
    :goto_3f
    return-object v0
.end method
