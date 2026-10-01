.class public Lcom/cspos/PaySys;
.super Ljava/lang/Object;
.source "PaySys.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 7
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 8
    const-string v0, "PaypassApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    const-string v0, "VisaLib"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 10
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native CallKeyPad([BI)I
.end method

.method public static native EmvAddOneAIDS([BI)I
.end method

.method public static native EmvAddOneCAPK([BI)I
.end method

.method public static native EmvAddOneCAPKString(Ljava/lang/String;)I
.end method

.method public static native EmvClearAllAIDS()I
.end method

.method public static native EmvClearAllCapks()I
.end method

.method public static native EmvClearOneAIDS([BI)I
.end method

.method public static native EmvClearOneCapks([BI)I
.end method

.method public static native EmvConfigErase()I
.end method

.method public static native EmvConfigExist()I
.end method

.method public static native EmvConfigRead(I[BI)I
.end method

.method public static native EmvConfigWrite(I[BI)I
.end method

.method public static native EmvContextInit(II)I
.end method

.method public static native EmvFinal()I
.end method

.method public static native EmvGetTagData([BII)I
.end method

.method public static native EmvGetVersion([B)I
.end method

.method public static native EmvModifyTermParasTag([BI)I
.end method

.method public static native EmvParaInit()I
.end method

.method public static native EmvPrePare55Field([BI)I
.end method

.method public static native EmvProcess(II)I
.end method

.method public static native EmvReadTermPar([BI[BI)I
.end method

.method public static native EmvSaveTermParas([BII)I
.end method

.method public static native EmvSetCardType(I)I
.end method

.method public static native EmvSetExtAmount([I)I
.end method

.method public static native EmvSetOnlineResult([B[BI)I
.end method

.method public static native EmvSetTransAmount(I)I
.end method

.method public static native EmvSetTransAmountBack(I)I
.end method

.method public static native EmvSetTransType(I)I
.end method

.method public static native GetKLKpinblock(II[B[B[B)I
.end method

.method public static native GetSelPalpinblock(II[B[B[B)I
.end method

.method public static native Getpinblock(II[B[B[B)I
.end method

.method public static native LibAdapterUartBaud([B)I
.end method

.method public static native LogTurnOn(I)I
.end method

.method public static native OfflinePinCipher(BII[BI[B[BI[B)I
.end method

.method public static native OfflinePinPlain(BII[B)I
.end method

.method public static native PapassAidSet(Ljava/lang/String;)I
.end method

.method public static native PapassCapkSet(Ljava/lang/String;)I
.end method

.method public static native PapassKernelSet(Ljava/lang/String;)I
.end method

.method public static native PapassReaderSet(Ljava/lang/String;)I
.end method

.method public static native PapassTransSet(Ljava/lang/String;I)I
.end method

.method public static native PayWaveClearAllAIDS()I
.end method

.method public static native PayWaveClearAllCapk()I
.end method

.method public static native PayWaveClearAllTerm()I
.end method

.method public static native PayWaveDownloadAIDS(Ljava/lang/String;)I
.end method

.method public static native PayWaveDownloadCapks(Ljava/lang/String;)I
.end method

.method public static native PayWaveDownloadTerm(Ljava/lang/String;)I
.end method

.method public static native PayWaveFinal()I
.end method

.method public static native PayWaveGetTagData([BII)I
.end method

.method public static native PayWaveKernelInit()I
.end method

.method public static native PayWaveSetTransAmount(I)I
.end method

.method public static native PayWaveSetTransType(I)I
.end method

.method public static native PayWaveTrans()I
.end method

.method public static native PaypassGetTagValue([BII)I
.end method

.method public static native PaypassKernelInit()I
.end method

.method public static native PaypassOff()I
.end method

.method public static native PaypassTest()I
.end method

.method public static native QvsdcSetOnlineResult([B)I
.end method

.method public static native SDKAuthorization()I
.end method

.method public static native SetPadTime(I)I
.end method

.method public static native SetPinType(I)I
.end method

.method public static native poskeypad(Landroid/content/Context;)I
.end method

.method public static native possetkeypad(IIII[B[BLjava/lang/String;)I
.end method

.method public static native postest()V
.end method
