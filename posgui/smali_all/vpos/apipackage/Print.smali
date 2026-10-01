.class public Lvpos/apipackage/Print;
.super Ljava/lang/Object;
.source "Print.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvpos/apipackage/Print$PrinterBitmap;
    }
.end annotation


# instance fields
.field private final tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 14
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const-string v0, "Print"

    iput-object v0, p0, Lvpos/apipackage/Print;->tag:Ljava/lang/String;

    .line 21
    return-void
.end method

.method private Bitmap2PrintDot(Landroid/graphics/Bitmap;)Lvpos/apipackage/Print$PrinterBitmap;
    .registers 21
    .param p1, "m_pBitmap"    # Landroid/graphics/Bitmap;

    .line 293
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 294
    .local v0, "iW":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 295
    .local v1, "iH":I
    const-string v2, "iW = "

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    const-string v2, "iH = "

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    add-int/lit8 v2, v0, 0x7

    const/16 v3, 0x8

    div-int/2addr v2, v3

    .line 299
    .local v2, "iRowBytes":I
    const-string v4, "iRowBytes = "

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    mul-int v4, v2, v1

    .line 301
    .local v4, "iBufferSize":I
    const-string v5, "iBufferSize = "

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    new-array v5, v4, [B

    .line 304
    .local v5, "byBuffer":[B
    const/4 v6, 0x0

    const/4 v7, 0x0

    .local v7, "iBufferPos":I
    :goto_37
    if-ge v7, v4, :cond_3e

    .line 305
    aput-byte v6, v5, v7

    .line 304
    add-int/lit8 v7, v7, 0x1

    goto :goto_37

    .line 308
    .end local v7    # "iBufferPos":I
    :cond_3e
    const/4 v7, 0x0

    .line 309
    .local v7, "x":I
    const/4 v8, 0x0

    .line 310
    .local v8, "y":I
    const/4 v8, 0x0

    :goto_41
    if-ge v8, v1, :cond_bb

    .line 311
    const/4 v7, 0x0

    .line 312
    move v9, v7

    const/4 v7, 0x0

    .local v7, "iRowByteIndex":I
    .local v9, "x":I
    :goto_46
    if-ge v7, v2, :cond_ac

    .line 313
    move v10, v9

    const/4 v9, 0x0

    .local v9, "iBitIndex":I
    .local v10, "x":I
    :goto_4a
    if-ge v9, v3, :cond_97

    .line 314
    mul-int/lit8 v11, v7, 0x8

    add-int v10, v11, v9

    .line 315
    if-gt v0, v10, :cond_5d

    .line 316
    nop

    .line 312
    move-object/from16 v11, p1

    move/from16 v17, v0

    move/from16 v18, v1

    move/from16 v16, v4

    move v9, v10

    goto :goto_a0

    .line 319
    :cond_5d
    move-object/from16 v11, p1

    invoke-virtual {v11, v10, v8}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v12

    .line 320
    .local v12, "iValue":I
    const/high16 v13, -0x1000000

    if-ne v13, v12, :cond_85

    .line 321
    mul-int v13, v8, v2

    add-int/2addr v13, v7

    aget-byte v14, v5, v13

    int-to-double v14, v14

    move/from16 v16, v4

    .end local v4    # "iBufferSize":I
    .local v16, "iBufferSize":I
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    rsub-int/lit8 v6, v9, 0x7

    move/from16 v17, v0

    move/from16 v18, v1

    .end local v0    # "iW":I
    .end local v1    # "iH":I
    .local v17, "iW":I
    .local v18, "iH":I
    int-to-double v0, v6

    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v14, v0

    double-to-int v0, v14

    int-to-byte v0, v0

    aput-byte v0, v5, v13

    goto :goto_8b

    .line 313
    .end local v12    # "iValue":I
    .end local v16    # "iBufferSize":I
    .end local v17    # "iW":I
    .end local v18    # "iH":I
    .restart local v0    # "iW":I
    .restart local v1    # "iH":I
    .restart local v4    # "iBufferSize":I
    :cond_85
    move/from16 v17, v0

    move/from16 v18, v1

    move/from16 v16, v4

    .end local v0    # "iW":I
    .end local v1    # "iH":I
    .end local v4    # "iBufferSize":I
    .restart local v16    # "iBufferSize":I
    .restart local v17    # "iW":I
    .restart local v18    # "iH":I
    :goto_8b
    add-int/lit8 v9, v9, 0x1

    move/from16 v4, v16

    move/from16 v0, v17

    move/from16 v1, v18

    const/16 v3, 0x8

    const/4 v6, 0x0

    goto :goto_4a

    .line 312
    .end local v9    # "iBitIndex":I
    .end local v16    # "iBufferSize":I
    .end local v17    # "iW":I
    .end local v18    # "iH":I
    .restart local v0    # "iW":I
    .restart local v1    # "iH":I
    .restart local v4    # "iBufferSize":I
    :cond_97
    move-object/from16 v11, p1

    move/from16 v17, v0

    move/from16 v18, v1

    move/from16 v16, v4

    move v9, v10

    .end local v0    # "iW":I
    .end local v1    # "iH":I
    .end local v4    # "iBufferSize":I
    .end local v10    # "x":I
    .local v9, "x":I
    .restart local v16    # "iBufferSize":I
    .restart local v17    # "iW":I
    .restart local v18    # "iH":I
    :goto_a0
    add-int/lit8 v7, v7, 0x1

    move/from16 v4, v16

    move/from16 v0, v17

    move/from16 v1, v18

    const/16 v3, 0x8

    const/4 v6, 0x0

    goto :goto_46

    .line 310
    .end local v7    # "iRowByteIndex":I
    .end local v16    # "iBufferSize":I
    .end local v17    # "iW":I
    .end local v18    # "iH":I
    .restart local v0    # "iW":I
    .restart local v1    # "iH":I
    .restart local v4    # "iBufferSize":I
    :cond_ac
    move-object/from16 v11, p1

    move/from16 v17, v0

    move/from16 v18, v1

    move/from16 v16, v4

    .end local v0    # "iW":I
    .end local v1    # "iH":I
    .end local v4    # "iBufferSize":I
    .restart local v16    # "iBufferSize":I
    .restart local v17    # "iW":I
    .restart local v18    # "iH":I
    add-int/lit8 v8, v8, 0x1

    move v7, v9

    const/16 v3, 0x8

    const/4 v6, 0x0

    goto :goto_41

    .line 327
    .end local v9    # "x":I
    .end local v16    # "iBufferSize":I
    .end local v17    # "iW":I
    .end local v18    # "iH":I
    .restart local v0    # "iW":I
    .restart local v1    # "iH":I
    .restart local v4    # "iBufferSize":I
    .local v7, "x":I
    :cond_bb
    move-object/from16 v11, p1

    move/from16 v17, v0

    move/from16 v18, v1

    move/from16 v16, v4

    .end local v0    # "iW":I
    .end local v1    # "iH":I
    .end local v4    # "iBufferSize":I
    .restart local v16    # "iBufferSize":I
    .restart local v17    # "iW":I
    .restart local v18    # "iH":I
    new-instance v0, Lvpos/apipackage/Print$PrinterBitmap;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lvpos/apipackage/Print$PrinterBitmap;-><init>(Lvpos/apipackage/Print;)V

    .line 328
    .local v0, "bmp":Lvpos/apipackage/Print$PrinterBitmap;
    iput-object v5, v0, Lvpos/apipackage/Print$PrinterBitmap;->m_pDotByteBuffer:[B

    .line 329
    iput v2, v0, Lvpos/apipackage/Print$PrinterBitmap;->m_iRowBytes:I

    .line 330
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iput v3, v0, Lvpos/apipackage/Print$PrinterBitmap;->m_iWidth:I

    .line 331
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iput v3, v0, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    .line 333
    return-object v0
.end method

.method public static native Lib_CTNPrnStart()I
.end method

.method public static native Lib_K21PrnCTN(I)I
.end method

.method public static native Lib_K21PrnCheck()I
.end method

.method public static native Lib_K21PrnData(B[BI)I
.end method

.method public static native Lib_K21PrnData256([BI)I
.end method

.method public static native Lib_K21PrnEnd(B)I
.end method

.method public static native Lib_K21PrnStart256(II)I
.end method

.method public static native Lib_K21PrnStartPrint(B)I
.end method

.method public static native Lib_PrnBlock([B)I
.end method

.method public static native Lib_PrnCheckStatus()I
.end method

.method public static native Lib_PrnClose()I
.end method

.method public static native Lib_PrnContinuous(I)I
.end method

.method public static native Lib_PrnConventional(I)I
.end method

.method public static native Lib_PrnCutPicture([B)I
.end method

.method public static native Lib_PrnCutPictureStr([B[BI)I
.end method

.method public static native Lib_PrnFeedPaper(I)I
.end method

.method public static native Lib_PrnGetFont([B[B[B)I
.end method

.method public static native Lib_PrnInit()I
.end method

.method public static native Lib_PrnIsCharge(I)I
.end method

.method public static native Lib_PrnLogo([B)I
.end method

.method public static native Lib_PrnSetAlign(I)I
.end method

.method public static native Lib_PrnSetCharSpace(I)I
.end method

.method public static native Lib_PrnSetCom460800()I
.end method

.method public static native Lib_PrnSetEnvironment(IIII)I
.end method

.method public static native Lib_PrnSetFont(BBB)I
.end method

.method public static native Lib_PrnSetGray(I)I
.end method

.method public static native Lib_PrnSetLeftIndent(I)I
.end method

.method public static native Lib_PrnSetLeftSpace(I)I
.end method

.method public static native Lib_PrnSetLineSpace(I)I
.end method

.method public static native Lib_PrnSetSpace(BB)I
.end method

.method public static native Lib_PrnSetSpeed(I)I
.end method

.method public static native Lib_PrnSetVoltage(I)I
.end method

.method public static native Lib_PrnStart()I
.end method

.method public static native Lib_PrnStep(I)I
.end method

.method public static Lib_PrnStr(Ljava/lang/String;)I
    .registers 5
    .param p0, "str"    # Ljava/lang/String;

    .line 139
    const/4 v0, 0x0

    .line 142
    .local v0, "strbytes":[B
    :try_start_1
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "original string---"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 143
    const-string v1, "UnicodeBigUnmarked"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1
    :try_end_1d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1d} :catch_1f

    move-object v0, v1

    .line 147
    goto :goto_23

    .line 144
    :catch_1f
    move-exception v1

    .line 146
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 149
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_23
    invoke-static {v0}, Lvpos/apipackage/Print;->Lib_PrnStr([B)I

    .line 150
    const/4 v1, 0x0

    return v1
.end method

.method public static native Lib_PrnStr([B)I
.end method

.method public static native Lib_SetLinPixelDis(C)I
.end method


# virtual methods
.method public Lib_PrnBarcode(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)I
    .registers 10
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "desiredWidth"    # I
    .param p3, "desiredHeight"    # I
    .param p4, "barcodeFormat"    # Lcom/google/zxing/BarcodeFormat;

    .line 164
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/BarcodeCreater;->creatBarcode(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 166
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0, v0}, Lvpos/apipackage/Print;->Lib_PrnBmp(Landroid/graphics/Bitmap;)I

    move-result v1

    .line 167
    .local v1, "iret":I
    if-eqz v1, :cond_21

    .line 168
    const-string v2, "VPOS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Lib_PrnSendBmp fail, iret = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    return v1

    .line 172
    :cond_21
    return v1
.end method

.method public Lib_PrnBmp(Landroid/graphics/Bitmap;)I
    .registers 9
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .line 209
    const/4 v0, 0x0

    .line 211
    .local v0, "iRetCode":I
    invoke-direct {p0, p1}, Lvpos/apipackage/Print;->Bitmap2PrintDot(Landroid/graphics/Bitmap;)Lvpos/apipackage/Print$PrinterBitmap;

    move-result-object v1

    .line 213
    .local v1, "pPrinterBmpLine":Lvpos/apipackage/Print$PrinterBitmap;
    iget v2, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iRowBytes:I

    iget v3, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    mul-int v2, v2, v3

    .line 214
    .local v2, "iBufferSize":I
    add-int/lit8 v3, v2, 0x5

    new-array v3, v3, [B

    .line 215
    .local v3, "byLogoBuffer":[B
    iget-object v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_pDotByteBuffer:[B

    const/4 v5, 0x0

    const/4 v6, 0x5

    invoke-static {v4, v5, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 216
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iWidth:I

    div-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    aput-byte v4, v3, v5

    .line 217
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iWidth:I

    rem-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    const/4 v5, 0x1

    aput-byte v4, v3, v5

    .line 218
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    div-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    const/4 v5, 0x2

    aput-byte v4, v3, v5

    .line 219
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    rem-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    const/4 v5, 0x3

    aput-byte v4, v3, v5

    .line 220
    invoke-static {v3}, Lvpos/apipackage/Print;->Lib_PrnLogo([B)I

    move-result v0

    .line 221
    if-eqz v0, :cond_3c

    .line 222
    return v0

    .line 226
    :cond_3c
    return v0
.end method

.method public printCutQrCode(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)I
    .registers 10
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "desiredWidth"    # I
    .param p3, "desiredHeight"    # I
    .param p4, "barcodeFormat"    # Lcom/google/zxing/BarcodeFormat;

    .line 178
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/BarcodeCreater;->creatBarcode(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 180
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0, v0}, Lvpos/apipackage/Print;->prnCutQrCode(Landroid/graphics/Bitmap;)I

    move-result v1

    .line 181
    .local v1, "iret":I
    if-eqz v1, :cond_21

    .line 182
    const-string v2, "VPOS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Lib_PrnSendBmp fail, iret = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    return v1

    .line 186
    :cond_21
    return v1
.end method

.method public printCutQrCodeStr(Ljava/lang/String;Ljava/lang/String;IIILcom/google/zxing/BarcodeFormat;)I
    .registers 12
    .param p1, "srcContent"    # Ljava/lang/String;
    .param p2, "qrStr"    # Ljava/lang/String;
    .param p3, "distance"    # I
    .param p4, "desiredWidth"    # I
    .param p5, "desiredHeight"    # I
    .param p6, "barcodeFormat"    # Lcom/google/zxing/BarcodeFormat;

    .line 192
    invoke-static {p1, p4, p5, p6}, Lvpos/apipackage/BarcodeCreater;->creatBarcode(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 194
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0, v0, p2, p3}, Lvpos/apipackage/Print;->prnCutQrCodeStr(Landroid/graphics/Bitmap;Ljava/lang/String;I)I

    move-result v1

    .line 195
    .local v1, "iret":I
    if-eqz v1, :cond_21

    .line 196
    const-string v2, "VPOS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Lib_PrnSendBmp fail, iret = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    return v1

    .line 200
    :cond_21
    return v1
.end method

.method public prnCutQrCode(Landroid/graphics/Bitmap;)I
    .registers 9
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .line 235
    const/4 v0, 0x0

    .line 237
    .local v0, "iRetCode":I
    invoke-direct {p0, p1}, Lvpos/apipackage/Print;->Bitmap2PrintDot(Landroid/graphics/Bitmap;)Lvpos/apipackage/Print$PrinterBitmap;

    move-result-object v1

    .line 239
    .local v1, "pPrinterBmpLine":Lvpos/apipackage/Print$PrinterBitmap;
    iget v2, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iRowBytes:I

    iget v3, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    mul-int v2, v2, v3

    .line 240
    .local v2, "iBufferSize":I
    add-int/lit8 v3, v2, 0x5

    new-array v3, v3, [B

    .line 241
    .local v3, "byLogoBuffer":[B
    iget-object v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_pDotByteBuffer:[B

    const/4 v5, 0x0

    const/4 v6, 0x5

    invoke-static {v4, v5, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 242
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iWidth:I

    div-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    aput-byte v4, v3, v5

    .line 243
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iWidth:I

    rem-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    const/4 v5, 0x1

    aput-byte v4, v3, v5

    .line 244
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    div-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    const/4 v5, 0x2

    aput-byte v4, v3, v5

    .line 245
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    rem-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    const/4 v5, 0x3

    aput-byte v4, v3, v5

    .line 246
    invoke-static {v3}, Lvpos/apipackage/Print;->Lib_PrnCutPicture([B)I

    move-result v0

    .line 247
    if-eqz v0, :cond_3c

    .line 248
    return v0

    .line 252
    :cond_3c
    return v0
.end method

.method public prnCutQrCodeStr(Landroid/graphics/Bitmap;Ljava/lang/String;I)I
    .registers 12
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "txt"    # Ljava/lang/String;
    .param p3, "distance"    # I

    .line 256
    const/4 v0, 0x0

    .line 258
    .local v0, "iRetCode":I
    invoke-direct {p0, p1}, Lvpos/apipackage/Print;->Bitmap2PrintDot(Landroid/graphics/Bitmap;)Lvpos/apipackage/Print$PrinterBitmap;

    move-result-object v1

    .line 260
    .local v1, "pPrinterBmpLine":Lvpos/apipackage/Print$PrinterBitmap;
    iget v2, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iRowBytes:I

    iget v3, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    mul-int v2, v2, v3

    .line 262
    .local v2, "iBufferSize":I
    add-int/lit8 v3, v2, 0x5

    new-array v3, v3, [B

    .line 264
    .local v3, "byLogoBuffer":[B
    iget-object v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_pDotByteBuffer:[B

    const/4 v5, 0x0

    const/4 v6, 0x5

    invoke-static {v4, v5, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 266
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iWidth:I

    div-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    aput-byte v4, v3, v5

    .line 267
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iWidth:I

    rem-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    const/4 v5, 0x1

    aput-byte v4, v3, v5

    .line 268
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    div-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    const/4 v5, 0x2

    aput-byte v4, v3, v5

    .line 269
    iget v4, v1, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    rem-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    const/4 v5, 0x3

    aput-byte v4, v3, v5

    .line 271
    const/4 v4, 0x0

    .line 273
    .local v4, "strbytes":[B
    :try_start_36
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "original string---"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 274
    const-string v5, "UnicodeBigUnmarked"

    invoke-virtual {p2, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5
    :try_end_52
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_36 .. :try_end_52} :catch_54

    move-object v4, v5

    .line 277
    goto :goto_58

    .line 275
    :catch_54
    move-exception v5

    .line 276
    .local v5, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v5}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 279
    .end local v5    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_58
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "original string---strbytes.length"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v7, v4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 281
    invoke-static {v3, v4, p3}, Lvpos/apipackage/Print;->Lib_PrnCutPictureStr([B[BI)I

    move-result v0

    .line 283
    if-eqz v0, :cond_76

    .line 284
    return v0

    .line 287
    :cond_76
    return v0
.end method
