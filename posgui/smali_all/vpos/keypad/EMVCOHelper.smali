.class public Lvpos/keypad/EMVCOHelper;
.super Ljava/lang/Object;
.source "EMVCOHelper.java"


# static fields
.field private static AidCount:I

.field public static Bauder:I

.field private static CAPKCount:I

.field private static EmvConfig_Exist:I

.field private static ExtAmount:I

.field private static ExtPtcCounter:I

.field private static aid_addr:I

.field private static mInstance:Lvpos/keypad/EMVCOHelper;

.field private static final mLock:Ljava/lang/Object;

.field static tmp:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 19
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lvpos/keypad/EMVCOHelper;->mLock:Ljava/lang/Object;

    .line 21
    const/4 v0, 0x0

    sput v0, Lvpos/keypad/EMVCOHelper;->aid_addr:I

    .line 22
    sput v0, Lvpos/keypad/EMVCOHelper;->AidCount:I

    .line 23
    sput v0, Lvpos/keypad/EMVCOHelper;->CAPKCount:I

    .line 24
    const/4 v1, -0x1

    sput v1, Lvpos/keypad/EMVCOHelper;->EmvConfig_Exist:I

    .line 25
    sput v0, Lvpos/keypad/EMVCOHelper;->ExtAmount:I

    .line 26
    const/16 v1, 0xa

    sput v1, Lvpos/keypad/EMVCOHelper;->ExtPtcCounter:I

    .line 27
    sput v0, Lvpos/keypad/EMVCOHelper;->Bauder:I

    .line 722
    sput v0, Lvpos/keypad/EMVCOHelper;->tmp:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static EmvAddOneAIDS([BI)I
    .registers 3
    .param p0, "Input"    # [B
    .param p1, "InLen"    # I

    .line 397
    invoke-static {p0, p1}, Lcom/cspos/PaySys;->EmvAddOneAIDS([BI)I

    move-result v0

    return v0
.end method

.method public static EmvAddOneCAPK([BI)I
    .registers 3
    .param p0, "Input"    # [B
    .param p1, "InLen"    # I

    .line 614
    invoke-static {p0, p1}, Lcom/cspos/PaySys;->EmvAddOneCAPK([BI)I

    move-result v0

    return v0
.end method

.method public static EmvAddOneCAPKString(Ljava/lang/String;)I
    .registers 2
    .param p0, "Input"    # Ljava/lang/String;

    .line 653
    invoke-static {p0}, Lcom/cspos/PaySys;->EmvAddOneCAPKString(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static EmvClearAllAIDS()I
    .registers 2

    .line 373
    const-string v0, "Robert"

    const-string v1, "Emvclear all aids"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    invoke-static {}, Lcom/cspos/PaySys;->EmvClearAllAIDS()I

    move-result v0

    return v0
.end method

.method public static EmvClearAllCapks()I
    .registers 1

    .line 478
    invoke-static {}, Lcom/cspos/PaySys;->EmvClearAllCapks()I

    move-result v0

    return v0
.end method

.method public static EmvClearOneAIDS([BI)I
    .registers 3
    .param p0, "Input"    # [B
    .param p1, "InLen"    # I

    .line 385
    invoke-static {p0, p1}, Lcom/cspos/PaySys;->EmvClearOneAIDS([BI)I

    move-result v0

    return v0
.end method

.method public static EmvClearOneCapks([BI)I
    .registers 3
    .param p0, "Input"    # [B
    .param p1, "InLen"    # I

    .line 490
    invoke-static {p0, p1}, Lcom/cspos/PaySys;->EmvClearOneCapks([BI)I

    move-result v0

    return v0
.end method

.method public static EmvConfigErase()I
    .registers 1

    .line 468
    const/4 v0, 0x0

    .line 469
    .local v0, "ret":I
    invoke-static {}, Lcom/cspos/PaySys;->EmvConfigErase()I

    move-result v0

    .line 470
    return v0
.end method

.method public static EmvConfigRead(I[BI)I
    .registers 4
    .param p0, "uReadAddr"    # I
    .param p1, "pReadBuf"    # [B
    .param p2, "uReadLen"    # I

    .line 657
    invoke-static {p0, p1, p2}, Lcom/cspos/PaySys;->EmvConfigRead(I[BI)I

    move-result v0

    return v0
.end method

.method public static EmvConfigWrite(I[BI)I
    .registers 4
    .param p0, "uWriteAddr"    # I
    .param p1, "pWriteBuf"    # [B
    .param p2, "uWriteLen"    # I

    .line 660
    invoke-static {p0, p1, p2}, Lcom/cspos/PaySys;->EmvConfigWrite(I[BI)I

    move-result v0

    return v0
.end method

.method public static EmvEnvParaInit()I
    .registers 1

    .line 171
    invoke-static {}, Lcom/cspos/PaySys;->EmvParaInit()I

    .line 173
    const/4 v0, 0x0

    return v0
.end method

.method public static EmvFinal()I
    .registers 1

    .line 356
    invoke-static {}, Lcom/cspos/PaySys;->EmvFinal()I

    move-result v0

    return v0
.end method

.method public static EmvGetAllAIDS_Serbank()I
    .registers 11

    .line 85
    const/16 v0, 0x400

    new-array v1, v0, [B

    .line 86
    .local v1, "poutput":[B
    const/16 v2, 0xa

    new-array v2, v2, [B

    .line 87
    .local v2, "Aid_Counter":[B
    const/4 v3, 0x0

    .local v3, "retlen":I
    const/4 v4, 0x0

    .local v4, "Aidtotal":I
    const/4 v5, 0x1

    .line 89
    .local v5, "index":I
    new-array v0, v0, [B

    .line 90
    .local v0, "Termpoutput":[B
    const/4 v6, 0x0

    .local v6, "Termretlen":I
    const/4 v7, 0x0

    .local v7, "TermAidtotal":I
    const/4 v8, 0x1

    .line 92
    .local v8, "Termindex":I
    const/4 v9, 0x2

    invoke-static {v9, v2, v9}, Lvpos/keypad/EMVCOHelper;->EmvConfigRead(I[BI)I

    .line 95
    const/4 v9, 0x0

    aget-byte v10, v2, v9

    and-int/lit16 v4, v10, 0xff

    .line 99
    const/4 v5, 0x1

    :goto_1a
    add-int/lit8 v10, v4, 0x1

    if-ge v5, v10, :cond_3c

    .line 101
    invoke-static {v1, v9}, Ljava/util/Arrays;->fill([BB)V

    .line 102
    invoke-static {v1, v5}, Lvpos/keypad/EMVCOHelper;->EmvGetOneAIDS([BI)I

    move-result v3

    .line 103
    invoke-static {v1, v3}, Lcom/cspos/PaySys;->EmvAddOneAIDS([BI)I

    .line 106
    invoke-static {v1, v3}, Lvpos/apipackage/ByteUtil;->bytearrayToHexString([BI)Ljava/lang/String;

    move-result-object v10

    .line 111
    .local v10, "AidDate":Ljava/lang/String;
    invoke-static {v0, v9}, Ljava/util/Arrays;->fill([BB)V

    .line 112
    invoke-static {v0, v5}, Lvpos/keypad/EMVCOHelper;->EmvGetOneTerm([BI)I

    move-result v3

    .line 113
    invoke-static {v0, v3, v9}, Lcom/cspos/PaySys;->EmvSaveTermParas([BII)I

    .line 116
    invoke-static {v1, v3}, Lvpos/apipackage/ByteUtil;->bytearrayToHexString([BI)Ljava/lang/String;

    .line 99
    .end local v10    # "AidDate":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1a

    .line 122
    :cond_3c
    return v9
.end method

.method public static EmvGetAllCAPK_Serbank()I
    .registers 7

    .line 58
    const/16 v0, 0x400

    new-array v0, v0, [B

    .line 59
    .local v0, "poutput":[B
    const/16 v1, 0xa

    new-array v1, v1, [B

    .line 60
    .local v1, "CAPK_Counter":[B
    const/4 v2, 0x0

    .local v2, "retlen":I
    const/4 v3, 0x0

    .local v3, "Aidtotal":I
    const/4 v4, 0x1

    .line 62
    .local v4, "index":I
    const/4 v5, 0x4

    const/4 v6, 0x2

    invoke-static {v5, v1, v6}, Lvpos/keypad/EMVCOHelper;->EmvConfigRead(I[BI)I

    .line 65
    const/4 v5, 0x0

    aget-byte v6, v1, v5

    and-int/lit16 v3, v6, 0xff

    .line 69
    const/4 v4, 0x1

    :goto_16
    add-int/lit8 v6, v3, 0x1

    if-ge v4, v6, :cond_2a

    .line 71
    invoke-static {v0, v5}, Ljava/util/Arrays;->fill([BB)V

    .line 72
    invoke-static {v0, v4}, Lvpos/keypad/EMVCOHelper;->EmvGetOneCAPK([BI)I

    move-result v2

    .line 73
    invoke-static {v0, v2}, Lcom/cspos/PaySys;->EmvAddOneCAPK([BI)I

    .line 76
    invoke-static {v0, v2}, Lvpos/apipackage/ByteUtil;->bytearrayToHexString([BI)Ljava/lang/String;

    .line 69
    add-int/lit8 v4, v4, 0x1

    goto :goto_16

    .line 80
    :cond_2a
    return v5
.end method

.method public static EmvGetAllTerm_Serbank()I
    .registers 6

    .line 127
    const/16 v0, 0x400

    new-array v0, v0, [B

    .line 128
    .local v0, "poutput":[B
    const/4 v1, 0x0

    .local v1, "retlen":I
    const/4 v2, 0x0

    .local v2, "Aidtotal":I
    const/4 v3, 0x1

    .line 130
    .local v3, "index":I
    const/4 v2, 0x1

    .line 131
    const/4 v3, 0x1

    :goto_9
    add-int/lit8 v4, v2, 0x1

    const/4 v5, 0x0

    if-ge v3, v4, :cond_1f

    .line 133
    invoke-static {v0, v5}, Ljava/util/Arrays;->fill([BB)V

    .line 134
    const/4 v4, 0x1

    invoke-static {v0, v4}, Lvpos/keypad/EMVCOHelper;->EmvGetOneTerm([BI)I

    move-result v1

    .line 135
    invoke-static {v0, v1, v4}, Lcom/cspos/PaySys;->EmvSaveTermParas([BII)I

    .line 138
    invoke-static {v0, v1}, Lvpos/apipackage/ByteUtil;->bytearrayToHexString([BI)Ljava/lang/String;

    .line 131
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 142
    :cond_1f
    return v5
.end method

.method public static EmvGetKLKPinBlock(Landroid/content/Context;II[B[B[BI)I
    .registers 9
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "type"    # I
    .param p2, "pinkey_n"    # I
    .param p3, "card_no"    # [B
    .param p4, "mode"    # [B
    .param p5, "pin_block"    # [B
    .param p6, "timeout"    # I

    .line 717
    invoke-static {p0}, Lvpos/keypad/EMVCOHelper;->EmvKeyPadInit(Landroid/content/Context;)I

    move-result v0

    .line 718
    .local v0, "ret":I
    invoke-static {p6}, Lcom/cspos/PaySys;->SetPadTime(I)I

    .line 719
    const/16 v1, 0xa

    invoke-static {v1}, Lvpos/keypad/EMVCOHelper;->EmvSetPtcCounter(I)I

    .line 720
    invoke-static {p1, p2, p3, p4, p5}, Lcom/cspos/PaySys;->GetKLKpinblock(II[B[B[B)I

    move-result v1

    return v1
.end method

.method public static EmvGetOneAIDS([BI)I
    .registers 8
    .param p0, "Input"    # [B
    .param p1, "index"    # I

    .line 446
    const/4 v0, 0x0

    .line 447
    .local v0, "ret":I
    const/16 v1, 0xa

    new-array v2, v1, [B

    .line 448
    .local v2, "Aid_T":[B
    const/4 v3, 0x0

    .line 449
    .local v3, "aid_datalen":I
    mul-int/lit16 v4, p1, 0x400

    const/16 v5, 0x8

    invoke-static {v4, v2, v5}, Lvpos/keypad/EMVCOHelper;->EmvConfigRead(I[BI)I

    .line 450
    const/4 v4, 0x6

    aget-byte v4, v2, v4

    and-int/lit16 v4, v4, 0xff

    mul-int/lit16 v4, v4, 0x100

    const/4 v5, 0x7

    aget-byte v5, v2, v5

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    .line 451
    .end local v3    # "aid_datalen":I
    .local v4, "aid_datalen":I
    mul-int/lit16 v3, p1, 0x400

    add-int/2addr v3, v1

    invoke-static {v3, p0, v4}, Lvpos/keypad/EMVCOHelper;->EmvConfigRead(I[BI)I

    .line 452
    return v4
.end method

.method public static EmvGetOneCAPK([BI)I
    .registers 9
    .param p0, "Input"    # [B
    .param p1, "index"    # I

    .line 435
    const/4 v0, 0x0

    .line 436
    .local v0, "ret":I
    const/16 v1, 0xa

    new-array v2, v1, [B

    .line 437
    .local v2, "CAPK_T":[B
    const/4 v3, 0x0

    .line 438
    .local v3, "aid_datalen":I
    mul-int/lit16 v4, p1, 0x400

    const v5, 0x32000

    add-int/2addr v4, v5

    const/16 v6, 0x8

    invoke-static {v4, v2, v6}, Lvpos/keypad/EMVCOHelper;->EmvConfigRead(I[BI)I

    .line 439
    const/4 v4, 0x6

    aget-byte v4, v2, v4

    and-int/lit16 v4, v4, 0xff

    mul-int/lit16 v4, v4, 0x100

    const/4 v6, 0x7

    aget-byte v6, v2, v6

    and-int/lit16 v6, v6, 0xff

    add-int/2addr v4, v6

    .line 440
    .end local v3    # "aid_datalen":I
    .local v4, "aid_datalen":I
    mul-int/lit16 v3, p1, 0x400

    add-int/2addr v3, v5

    add-int/2addr v3, v1

    invoke-static {v3, p0, v4}, Lvpos/keypad/EMVCOHelper;->EmvConfigRead(I[BI)I

    .line 441
    return v4
.end method

.method public static EmvGetOneTerm([BI)I
    .registers 8
    .param p0, "Input"    # [B
    .param p1, "index"    # I

    .line 457
    const/4 v0, 0x0

    .line 458
    .local v0, "ret":I
    const/16 v1, 0xa

    new-array v2, v1, [B

    .line 459
    .local v2, "Term_T":[B
    const/4 v3, 0x0

    .line 460
    .local v3, "aid_datalen":I
    mul-int/lit8 v4, p1, 0x64

    mul-int/lit16 v4, v4, 0x400

    const/16 v5, 0x8

    invoke-static {v4, v2, v5}, Lvpos/keypad/EMVCOHelper;->EmvConfigRead(I[BI)I

    .line 461
    const/4 v4, 0x6

    aget-byte v4, v2, v4

    and-int/lit16 v4, v4, 0xff

    mul-int/lit16 v4, v4, 0x100

    const/4 v5, 0x7

    aget-byte v5, v2, v5

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    .line 462
    .end local v3    # "aid_datalen":I
    .local v4, "aid_datalen":I
    mul-int/lit8 v3, p1, 0x64

    mul-int/lit16 v3, v3, 0x400

    add-int/2addr v3, v1

    invoke-static {v3, p0, v4}, Lvpos/keypad/EMVCOHelper;->EmvConfigRead(I[BI)I

    .line 463
    return v4
.end method

.method public static EmvGetPinBlock(Landroid/content/Context;II[B[B[BI)I
    .registers 9
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "type"    # I
    .param p2, "pinkey_n"    # I
    .param p3, "card_no"    # [B
    .param p4, "mode"    # [B
    .param p5, "pin_block"    # [B
    .param p6, "timeout"    # I

    .line 712
    invoke-static {p0}, Lvpos/keypad/EMVCOHelper;->EmvKeyPadInit(Landroid/content/Context;)I

    move-result v0

    .line 713
    .local v0, "ret":I
    invoke-static {p6}, Lcom/cspos/PaySys;->SetPadTime(I)I

    .line 714
    invoke-static {p1, p2, p3, p4, p5}, Lcom/cspos/PaySys;->Getpinblock(II[B[B[B)I

    move-result v1

    return v1
.end method

.method public static EmvGetTagData([BII)I
    .registers 4
    .param p0, "OutPut"    # [B
    .param p1, "OutputBufSize"    # I
    .param p2, "tagname"    # I

    .line 325
    invoke-static {p0, p1, p2}, Lcom/cspos/PaySys;->EmvGetTagData([BII)I

    move-result v0

    return v0
.end method

.method public static EmvGetVersion([B)I
    .registers 2
    .param p0, "Output"    # [B

    .line 360
    invoke-static {p0}, Lcom/cspos/PaySys;->EmvGetVersion([B)I

    move-result v0

    return v0
.end method

.method public static EmvKernelInit()I
    .registers 2

    .line 184
    const/16 v0, 0x36

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/cspos/PaySys;->EmvContextInit(II)I

    move-result v0

    return v0
.end method

.method public static EmvKeyPadInit(Landroid/content/Context;)I
    .registers 2
    .param p0, "ctx"    # Landroid/content/Context;

    .line 708
    invoke-static {p0}, Lcom/cspos/PaySys;->poskeypad(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method public static EmvModifyAllTermParasTag([BI)I
    .registers 3
    .param p0, "TAG_Input"    # [B
    .param p1, "Tag_name"    # I

    .line 698
    invoke-static {p0, p1}, Lcom/cspos/PaySys;->EmvModifyTermParasTag([BI)I

    move-result v0

    return v0
.end method

.method public static EmvPin_PlanText(Landroid/content/Context;III)Ljava/lang/String;
    .registers 10
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "type"    # I
    .param p2, "counter"    # I
    .param p3, "timeout_s"    # I

    .line 746
    const-string v0, "*******"

    .line 747
    .local v0, "Pin_PlanText":Ljava/lang/String;
    const-string v1, "time_out"

    .line 748
    .local v1, "Pin_Timeout":Ljava/lang/String;
    const/4 v2, 0x0

    .line 749
    .local v2, "ret":I
    const/16 v3, 0x38

    new-array v3, v3, [B

    .line 750
    .local v3, "password":[B
    invoke-static {p0}, Lvpos/keypad/EMVCOHelper;->EmvKeyPadInit(Landroid/content/Context;)I

    .line 751
    invoke-static {p2}, Lvpos/keypad/EMVCOHelper;->EmvSetPtcCounter(I)I

    .line 752
    invoke-static {p3}, Lcom/cspos/PaySys;->SetPadTime(I)I

    .line 753
    invoke-static {v3, p1}, Lcom/cspos/PaySys;->CallKeyPad([BI)I

    move-result v2

    .line 754
    const/4 v4, -0x1

    if-ne v2, v4, :cond_1a

    .line 755
    return-object v1

    .line 756
    :cond_1a
    invoke-static {v3}, Lvpos/apipackage/ByteUtil;->bytesToString([B)Ljava/lang/String;

    move-result-object v4

    .line 757
    .local v4, "strPwd":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_29

    .line 758
    return-object v4

    .line 761
    :cond_29
    return-object v0
.end method

.method public static EmvPinbyPass()I
    .registers 8

    .line 797
    const/16 v0, 0x95

    .line 798
    .local v0, "TagPinbyPass":S
    const/4 v1, 0x0

    .line 800
    .local v1, "pinpass":C
    const/16 v2, 0x38

    new-array v3, v2, [B

    .line 801
    .local v3, "TagPinbyPass_Data":[B
    invoke-static {v3, v2, v0}, Lvpos/keypad/EMVCOHelper;->EmvGetTagData([BII)I

    move-result v2

    .line 802
    .local v2, "len":I
    const-string v4, "EMV PinData"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bypass0----"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v6, 0x2

    aget-byte v7, v3, v6

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 803
    aget-byte v4, v3, v6

    int-to-char v1, v4

    .line 805
    and-int/lit8 v4, v1, 0x8

    const/16 v5, 0x8

    if-ne v4, v5, :cond_2f

    .line 806
    const/4 v4, 0x1

    return v4

    .line 808
    :cond_2f
    const/4 v4, 0x0

    return v4
.end method

.method public static EmvPrePare55Field([BI)I
    .registers 3
    .param p0, "OutPut"    # [B
    .param p1, "OutputBufSize"    # I

    .line 336
    invoke-static {p0, p1}, Lcom/cspos/PaySys;->EmvPrePare55Field([BI)I

    move-result v0

    return v0
.end method

.method public static EmvProcess(II)I
    .registers 4
    .param p0, "KernelType"    # I
    .param p1, "FlowType"    # I

    .line 308
    const-string v0, "heyp9"

    const-string v1, "heyp emvprocess"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    invoke-static {p0, p1}, Lcom/cspos/PaySys;->EmvProcess(II)I

    move-result v0

    return v0
.end method

.method public static EmvReadTermPar([BI[BI)I
    .registers 5
    .param p0, "Input"    # [B
    .param p1, "InLen"    # I
    .param p2, "OutPut"    # [B
    .param p3, "OutBufSize"    # I

    .line 664
    invoke-static {p0, p1, p2, p3}, Lcom/cspos/PaySys;->EmvReadTermPar([BI[BI)I

    move-result v0

    return v0
.end method

.method public static EmvSaveTermParas([BII)I
    .registers 4
    .param p0, "Input"    # [B
    .param p1, "InLen"    # I
    .param p2, "index"    # I

    .line 694
    invoke-static {p0, p1, p2}, Lcom/cspos/PaySys;->EmvSaveTermParas([BII)I

    move-result v0

    return v0
.end method

.method public static EmvSetCardType(I)I
    .registers 2
    .param p0, "cardtype"    # I

    .line 268
    invoke-static {p0}, Lcom/cspos/PaySys;->EmvSetCardType(I)I

    move-result v0

    return v0
.end method

.method public static EmvSetExtPtcCounter()I
    .registers 1

    .line 225
    sget v0, Lvpos/keypad/EMVCOHelper;->ExtPtcCounter:I

    return v0
.end method

.method public static EmvSetExtTransAmount()I
    .registers 1

    .line 221
    sget v0, Lvpos/keypad/EMVCOHelper;->ExtAmount:I

    return v0
.end method

.method public static EmvSetOnlineResult([B[BI)I
    .registers 4
    .param p0, "result"    # [B
    .param p1, "IsSuerRespData"    # [B
    .param p2, "IsSuerRespDataLength"    # I

    .line 348
    invoke-static {p0, p1, p2}, Lcom/cspos/PaySys;->EmvSetOnlineResult([B[BI)I

    move-result v0

    return v0
.end method

.method public static EmvSetPtcCounter(I)I
    .registers 2
    .param p0, "counter"    # I

    .line 216
    sput p0, Lvpos/keypad/EMVCOHelper;->ExtPtcCounter:I

    .line 217
    const/4 v0, 0x0

    return v0
.end method

.method public static EmvSetTransAmount(I)I
    .registers 2
    .param p0, "amount"    # I

    .line 211
    sput p0, Lvpos/keypad/EMVCOHelper;->ExtAmount:I

    .line 212
    invoke-static {p0}, Lcom/cspos/PaySys;->EmvSetTransAmount(I)I

    move-result v0

    return v0
.end method

.method public static EmvSetTransAmountBack(I)I
    .registers 2
    .param p0, "amount"    # I

    .line 256
    invoke-static {p0}, Lcom/cspos/PaySys;->EmvSetTransAmountBack(I)I

    move-result v0

    return v0
.end method

.method public static EmvSetTransType(I)I
    .registers 2
    .param p0, "TransType"    # I

    .line 286
    invoke-static {p0}, Lcom/cspos/PaySys;->EmvSetTransType(I)I

    move-result v0

    return v0
.end method

.method public static EmvShowKeyPad(Landroid/content/Context;[BI)I
    .registers 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "password"    # [B
    .param p2, "type"    # I

    .line 724
    invoke-static {p0}, Lvpos/keypad/EMVCOHelper;->EmvKeyPadInit(Landroid/content/Context;)I

    move-result v0

    .line 742
    .local v0, "ret":I
    invoke-static {p1, p2}, Lcom/cspos/PaySys;->CallKeyPad([BI)I

    move-result v1

    return v1
.end method

.method public static Emv_GetPinblock2(Landroid/content/Context;B[BI)I
    .registers 14
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "keyNo"    # B
    .param p2, "pin_block"    # [B
    .param p3, "timeout"    # I

    .line 773
    const-string v0, "*******"

    .line 774
    .local v0, "Pin_PlanText":Ljava/lang/String;
    const-string v1, "time_out"

    .line 775
    .local v1, "Pin_Timeout":Ljava/lang/String;
    const/4 v2, 0x0

    .line 776
    .local v2, "ret":I
    const/4 v3, 0x0

    .line 777
    .local v3, "type":I
    const/16 v4, 0x38

    new-array v4, v4, [B

    .line 778
    .local v4, "password":[B
    const/4 v5, 0x1

    new-array v5, v5, [B

    .line 779
    .local v5, "pingblockmode":[B
    const/4 v6, 0x0

    const/16 v7, 0xc

    aput-byte v7, v5, v6

    .line 780
    const-string v7, "Getpinblock2"

    const-string v8, "start"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 781
    invoke-static {p0}, Lvpos/keypad/EMVCOHelper;->EmvKeyPadInit(Landroid/content/Context;)I

    .line 782
    invoke-static {p3}, Lcom/cspos/PaySys;->SetPadTime(I)I

    .line 784
    invoke-static {v4, v3}, Lcom/cspos/PaySys;->CallKeyPad([BI)I

    move-result v2

    .line 785
    const/4 v7, -0x1

    if-ne v2, v7, :cond_27

    .line 786
    return v7

    .line 787
    :cond_27
    invoke-static {v4}, Lvpos/apipackage/ByteUtil;->bytesToString([B)Ljava/lang/String;

    move-result-object v7

    .line 788
    .local v7, "strPwd":Ljava/lang/String;
    invoke-static {v7}, Lvpos/keypad/EMVCOHelper;->format2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 789
    .local v8, "Pinblock2":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    .line 791
    .local v9, "inData":[B
    invoke-static {v6, p1, v9, v5, p2}, Lcom/cspos/PaySys;->GetSelPalpinblock(II[B[B[B)I

    .line 792
    return v6
.end method

.method public static PayPass_ShowAmount()I
    .registers 9

    .line 229
    const-string v0, ""

    .line 230
    .local v0, "PaypssTag_data":Ljava/lang/String;
    const/16 v1, 0x400

    new-array v2, v1, [B

    .line 231
    .local v2, "PaypassTagBuff":[B
    const v3, 0x9f02

    .line 232
    .local v3, "TagName":I
    const/4 v4, 0x0

    .line 234
    .local v4, "amount_t":I
    invoke-static {v2, v1, v3}, Lvpos/keypad/EMVCOHelper;->PaypassGetTagValue([BII)I

    move-result v1

    .line 235
    .local v1, "Data_len":I
    const/4 v5, 0x0

    if-lez v1, :cond_40

    .line 237
    move-object v6, v0

    const/4 v0, 0x0

    .local v0, "i":I
    .local v6, "PaypssTag_data":Ljava/lang/String;
    :goto_13
    if-ge v0, v1, :cond_2d

    .line 239
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-byte v8, v2, v0

    invoke-static {v8}, Lvpos/apipackage/ByteUtil;->byteToHexString(B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 237
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 242
    .end local v0    # "i":I
    :cond_2d
    div-int/lit8 v0, v1, 0x2

    if-eqz v0, :cond_38

    .line 243
    mul-int/lit8 v0, v1, 0x2

    invoke-virtual {v6, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_39

    .line 245
    :cond_38
    move-object v0, v6

    .end local v6    # "PaypssTag_data":Ljava/lang/String;
    .local v0, "PaypssTag_data":Ljava/lang/String;
    :goto_39
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    sput v6, Lvpos/keypad/EMVCOHelper;->ExtAmount:I

    goto :goto_42

    .line 248
    :cond_40
    sput v5, Lvpos/keypad/EMVCOHelper;->ExtAmount:I

    .line 251
    :goto_42
    invoke-static {}, Lvpos/keypad/EMVCOHelper;->EmvSetExtTransAmount()I

    .line 252
    return v5
.end method

.method public static PayWaveAddAids(Ljava/lang/String;)I
    .registers 2
    .param p0, "AID_input"    # Ljava/lang/String;

    .line 819
    invoke-static {p0}, Lcom/cspos/PaySys;->PayWaveDownloadAIDS(Ljava/lang/String;)I

    move-result v0

    .line 820
    .local v0, "ret":I
    return v0
.end method

.method public static PayWaveAddCapks(Ljava/lang/String;)I
    .registers 2
    .param p0, "CAPK_input"    # Ljava/lang/String;

    .line 825
    invoke-static {p0}, Lcom/cspos/PaySys;->PayWaveDownloadCapks(Ljava/lang/String;)I

    move-result v0

    .line 826
    .local v0, "ret":I
    return v0
.end method

.method public static PayWaveAddTerms(Ljava/lang/String;)I
    .registers 2
    .param p0, "Reader_input"    # Ljava/lang/String;

    .line 831
    invoke-static {p0}, Lcom/cspos/PaySys;->PayWaveDownloadTerm(Ljava/lang/String;)I

    move-result v0

    .line 832
    .local v0, "ret":I
    return v0
.end method

.method public static PayWaveClearAllAIDS()I
    .registers 1

    .line 866
    invoke-static {}, Lcom/cspos/PaySys;->PayWaveClearAllAIDS()I

    move-result v0

    return v0
.end method

.method public static PayWaveClearAllCapk()I
    .registers 1

    .line 860
    invoke-static {}, Lcom/cspos/PaySys;->PayWaveClearAllCapk()I

    move-result v0

    return v0
.end method

.method public static PayWaveClearAllTerm()I
    .registers 1

    .line 863
    invoke-static {}, Lcom/cspos/PaySys;->PayWaveClearAllTerm()I

    move-result v0

    return v0
.end method

.method public static PayWaveFinal()I
    .registers 1

    .line 857
    invoke-static {}, Lcom/cspos/PaySys;->PayWaveFinal()I

    move-result v0

    return v0
.end method

.method public static PayWaveGetTagData([BII)I
    .registers 4
    .param p0, "OutPut"    # [B
    .param p1, "OutputBufSize"    # I
    .param p2, "tagname"    # I

    .line 854
    invoke-static {p0, p1, p2}, Lcom/cspos/PaySys;->PayWaveGetTagData([BII)I

    move-result v0

    return v0
.end method

.method public static PayWaveKernelInit()I
    .registers 1

    .line 869
    invoke-static {}, Lcom/cspos/PaySys;->PayWaveKernelInit()I

    move-result v0

    return v0
.end method

.method public static PayWaveSetTransAmount(I)I
    .registers 2
    .param p0, "Amount"    # I

    .line 843
    sput p0, Lvpos/keypad/EMVCOHelper;->ExtAmount:I

    .line 844
    invoke-static {p0}, Lcom/cspos/PaySys;->PayWaveSetTransAmount(I)I

    move-result v0

    .line 845
    .local v0, "ret":I
    return v0
.end method

.method public static PayWaveSetTransType(I)I
    .registers 2
    .param p0, "Type"    # I

    .line 837
    invoke-static {p0}, Lcom/cspos/PaySys;->PayWaveSetTransType(I)I

    move-result v0

    .line 838
    .local v0, "ret":I
    return v0
.end method

.method public static PayWaveTransProcess()I
    .registers 1

    .line 850
    invoke-static {}, Lcom/cspos/PaySys;->PayWaveTrans()I

    move-result v0

    .line 851
    .local v0, "ret":I
    return v0
.end method

.method public static PaypassAidSet(Ljava/lang/String;)I
    .registers 2
    .param p0, "Aid_Input"    # Ljava/lang/String;

    .line 529
    invoke-static {p0}, Lcom/cspos/PaySys;->PapassAidSet(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static PaypassAllLoad()I
    .registers 7

    .line 578
    const-string v0, "Paypassconfig_Aid"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lvpos/apipackage/FileTools;->read(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    .line 580
    .local v0, "Aid_data":Ljava/lang/String;
    invoke-static {v0}, Lcom/cspos/PaySys;->PapassAidSet(Ljava/lang/String;)I

    .line 582
    const-string v3, "Paypassconfig_Capk"

    invoke-static {v3, v1, v2}, Lvpos/apipackage/FileTools;->read(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v3

    .line 584
    .local v3, "Capk_data":Ljava/lang/String;
    invoke-static {v3}, Lcom/cspos/PaySys;->PapassCapkSet(Ljava/lang/String;)I

    .line 586
    const-string v4, "Paypassconfig_Kernel"

    invoke-static {v4, v1, v2}, Lvpos/apipackage/FileTools;->read(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v4

    .line 588
    .local v4, "Kernel_data":Ljava/lang/String;
    invoke-static {v4}, Lcom/cspos/PaySys;->PapassKernelSet(Ljava/lang/String;)I

    .line 590
    const-string v5, "PaypassReaderSet"

    invoke-static {v5, v1, v2}, Lvpos/apipackage/FileTools;->read(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v5

    .line 592
    .local v5, "Reader_data":Ljava/lang/String;
    invoke-static {v5}, Lcom/cspos/PaySys;->PapassReaderSet(Ljava/lang/String;)I

    .line 594
    const-string v6, "PaypassTransSet"

    invoke-static {v6, v1, v2}, Lvpos/apipackage/FileTools;->read(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v1

    .line 596
    .local v1, "Trans_data":Ljava/lang/String;
    const/16 v2, 0x9

    sput v2, Lvpos/keypad/EMVCOHelper;->Bauder:I

    .line 597
    sget v2, Lvpos/keypad/EMVCOHelper;->Bauder:I

    invoke-static {v1, v2}, Lcom/cspos/PaySys;->PapassTransSet(Ljava/lang/String;I)I

    .line 599
    const/4 v2, 0x0

    return v2
.end method

.method public static PaypassCapkSet(Ljava/lang/String;)I
    .registers 2
    .param p0, "Capk_Input"    # Ljava/lang/String;

    .line 542
    invoke-static {p0}, Lcom/cspos/PaySys;->PapassCapkSet(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static PaypassFinal()I
    .registers 1

    .line 510
    invoke-static {}, Lcom/cspos/PaySys;->PaypassOff()I

    .line 511
    const/4 v0, 0x0

    return v0
.end method

.method public static PaypassGetTagValue([BII)I
    .registers 4
    .param p0, "OutPut"    # [B
    .param p1, "OutputBufSize"    # I
    .param p2, "tagname"    # I

    .line 504
    invoke-static {p0, p1, p2}, Lcom/cspos/PaySys;->PaypassGetTagValue([BII)I

    move-result v0

    .line 506
    .local v0, "ret":I
    return v0
.end method

.method public static PaypassKernelInit()I
    .registers 1

    .line 515
    invoke-static {}, Lcom/cspos/PaySys;->PaypassKernelInit()I

    .line 516
    const/4 v0, 0x0

    return v0
.end method

.method public static PaypassKernelSet(Ljava/lang/String;)I
    .registers 2
    .param p0, "Kernel_Input"    # Ljava/lang/String;

    .line 555
    invoke-static {p0}, Lcom/cspos/PaySys;->PapassKernelSet(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static PaypassProcess()I
    .registers 2

    .line 494
    const-string v0, "heyp"

    const-string v1, "PaypassProcess11111"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    const/4 v0, 0x0

    sput v0, Lvpos/keypad/EMVCOHelper;->AidCount:I

    .line 496
    sput v0, Lvpos/keypad/EMVCOHelper;->CAPKCount:I

    .line 497
    const-string v0, "heyp"

    const-string v1, "PaypassProcess2222"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    invoke-static {}, Lcom/cspos/PaySys;->PaypassTest()I

    move-result v0

    .line 499
    .local v0, "ret":I
    return v0
.end method

.method public static PaypassReaderSet(Ljava/lang/String;)I
    .registers 2
    .param p0, "Reader_Input"    # Ljava/lang/String;

    .line 568
    invoke-static {p0}, Lcom/cspos/PaySys;->PapassReaderSet(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static PaypassTransSet(Ljava/lang/String;)I
    .registers 2
    .param p0, "Trans_Input"    # Ljava/lang/String;

    .line 572
    const/16 v0, 0x9

    sput v0, Lvpos/keypad/EMVCOHelper;->Bauder:I

    .line 573
    sget v0, Lvpos/keypad/EMVCOHelper;->Bauder:I

    invoke-static {p0, v0}, Lcom/cspos/PaySys;->PapassTransSet(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static PciVerifyCipherPin(Landroid/content/Context;BIII[BI[B[BI[B)I
    .registers 20
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "slot"    # B
    .param p2, "minLen"    # I
    .param p3, "maxLen"    # I
    .param p4, "timeout_s"    # I
    .param p5, "modulus"    # [B
    .param p6, "moduluslen"    # I
    .param p7, "exponent"    # [B
    .param p8, "IccRandom"    # [B
    .param p9, "IccRandomLen"    # I
    .param p10, "IccRsp"    # [B

    .line 886
    invoke-static {p0}, Lvpos/keypad/EMVCOHelper;->EmvKeyPadInit(Landroid/content/Context;)I

    .line 887
    invoke-static {p4}, Lcom/cspos/PaySys;->SetPadTime(I)I

    .line 889
    move v0, p1

    move v1, p2

    move v2, p3

    move-object v3, p5

    move v4, p6

    move-object/from16 v5, p7

    move-object/from16 v6, p8

    move/from16 v7, p9

    move-object/from16 v8, p10

    invoke-static/range {v0 .. v8}, Lcom/cspos/PaySys;->OfflinePinCipher(BII[BI[B[BI[B)I

    move-result v0

    .line 890
    .local v0, "ret":I
    return v0
.end method

.method public static PciVerifyPlainPin(Landroid/content/Context;BIII[B)I
    .registers 8
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "slot"    # B
    .param p2, "minLen"    # I
    .param p3, "maxLen"    # I
    .param p4, "timeout_s"    # I
    .param p5, "IccRsp"    # [B

    .line 875
    const-string v0, "Robert"

    const-string v1, "PciVerifyPlainPin-----------------------0"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 876
    invoke-static {p0}, Lvpos/keypad/EMVCOHelper;->EmvKeyPadInit(Landroid/content/Context;)I

    .line 877
    invoke-static {p4}, Lcom/cspos/PaySys;->SetPadTime(I)I

    .line 879
    invoke-static {p1, p2, p3, p5}, Lcom/cspos/PaySys;->OfflinePinPlain(BII[B)I

    move-result v0

    .line 880
    .local v0, "ret":I
    return v0
.end method

.method public static QvsdcSetOnlineResult([B)I
    .registers 2
    .param p0, "result"    # [B

    .line 352
    invoke-static {p0}, Lcom/cspos/PaySys;->QvsdcSetOnlineResult([B)I

    move-result v0

    return v0
.end method

.method public static SDKAuthorization()I
    .registers 1

    .line 314
    invoke-static {}, Lcom/cspos/PaySys;->SDKAuthorization()I

    move-result v0

    return v0
.end method

.method public static SetPinPadTime(I)I
    .registers 2
    .param p0, "time_s"    # I

    .line 364
    invoke-static {p0}, Lcom/cspos/PaySys;->SetPadTime(I)I

    move-result v0

    return v0
.end method

.method public static SetPinPadType(I)I
    .registers 2
    .param p0, "type"    # I

    .line 812
    invoke-static {p0}, Lcom/cspos/PaySys;->SetPinType(I)I

    .line 813
    const/4 v0, 0x0

    return v0
.end method

.method private static format2(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "PIN"    # Ljava/lang/String;

    .line 766
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "2"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 767
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "%-14s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    .line 768
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x20

    const/16 v3, 0x46

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 766
    return-object v0
.end method

.method public static getInstance()Lvpos/keypad/EMVCOHelper;
    .registers 4

    .line 32
    const-string v0, "vpos"

    const-string v1, "vpos EMVCOHelper getInstance--------------------------------------------------------00>> "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_34

    .line 34
    .local v0, "baud":[B
    sget-object v1, Lvpos/keypad/EMVCOHelper;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 35
    :try_start_10
    sget-object v2, Lvpos/keypad/EMVCOHelper;->mInstance:Lvpos/keypad/EMVCOHelper;

    if-nez v2, :cond_1b

    .line 36
    new-instance v2, Lvpos/keypad/EMVCOHelper;

    invoke-direct {v2}, Lvpos/keypad/EMVCOHelper;-><init>()V

    sput-object v2, Lvpos/keypad/EMVCOHelper;->mInstance:Lvpos/keypad/EMVCOHelper;

    .line 38
    :cond_1b
    const-string v2, "vpos"

    const-string v3, "vpos EMVCOHelper getInstance--------------------------------------------------------11>> "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    invoke-static {v0}, Lcom/cspos/PaySys;->LibAdapterUartBaud([B)I

    .line 40
    const-string v2, "vpos"

    const-string v3, "vpos EMVCOHelper getInstance--------------------------------------------------------22>> "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    sget-object v2, Lvpos/keypad/EMVCOHelper;->mInstance:Lvpos/keypad/EMVCOHelper;

    monitor-exit v1

    return-object v2

    .line 42
    :catchall_30
    move-exception v2

    monitor-exit v1
    :try_end_32
    .catchall {:try_start_10 .. :try_end_32} :catchall_30

    throw v2

    nop

    :array_34
    .array-data 1
        0x33t
        0x33t
        0x33t
        0x33t
    .end array-data
.end method


# virtual methods
.method public AdapterUartBaud()I
    .registers 8

    .line 46
    const/4 v0, 0x1

    new-array v1, v0, [B

    .line 48
    .local v1, "baud":[B
    invoke-static {v1}, Lcom/cspos/PaySys;->LibAdapterUartBaud([B)I

    move-result v2

    .line 49
    .local v2, "ret":I
    const-string v3, "Robert"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AdapterUartBaud= "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v5, 0x0

    aget-byte v6, v1, v5

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    aget-byte v3, v1, v5

    const/16 v4, 0x9

    if-ne v3, v4, :cond_29

    .line 51
    sput v4, Lvpos/keypad/EMVCOHelper;->Bauder:I

    goto :goto_2b

    .line 53
    :cond_29
    sput v0, Lvpos/keypad/EMVCOHelper;->Bauder:I

    .line 54
    :goto_2b
    return v2
.end method
