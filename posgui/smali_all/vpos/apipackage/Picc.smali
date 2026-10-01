.class public Lvpos/apipackage/Picc;
.super Ljava/lang/Object;
.source "Picc.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 733
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 734
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 731
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Lib_EntryPoint()I
.end method

.method public static native Lib_MifareKeyAuth(BBB)I
.end method

.method public static native Lib_MifareKeyStore(B[B)I
.end method

.method public static native Lib_PiccApduCmd([BS[B[B)I
.end method

.method public static native Lib_PiccCheck(B[B[B)I
.end method

.method public static native Lib_PiccClose()I
.end method

.method public static native Lib_PiccCommand([B[B)I
.end method

.method public static native Lib_PiccDataExchange([BS[B[B)I
.end method

.method public static native Lib_PiccHalt()I
.end method

.method public static native Lib_PiccHwConfig(SS)I
.end method

.method public static native Lib_PiccHwModeSet(I)I
.end method

.method public static native Lib_PiccKeyStore([BBBBB)I
.end method

.method public static native Lib_PiccM1Authority(BB[B[B)I
.end method

.method public static native Lib_PiccM1Operate(BB[BB)I
.end method

.method public static native Lib_PiccM1ReadBlock(B[B)I
.end method

.method public static native Lib_PiccM1ReadValue(I[B)I
.end method

.method public static native Lib_PiccM1RestoreTransfer(BB)I
.end method

.method public static native Lib_PiccM1WriteBlock(B[B)I
.end method

.method public static native Lib_PiccM1WriteValue(I[B)I
.end method

.method public static native Lib_PiccMfpActivateCard()I
.end method

.method public static native Lib_PiccMfpAuthenticateClassicSL2(BBSS)I
.end method

.method public static native Lib_PiccMfpAuthenticateSL(BBSSSB[BB[B[B[B[B)I
.end method

.method public static native Lib_PiccMfpChangeKey(BSSSB[B)I
.end method

.method public static native Lib_PiccMfpCommitPerso()I
.end method

.method public static native Lib_PiccMfpMultiBlockRead(BB[B)I
.end method

.method public static native Lib_PiccMfpMultiBlockWrite(BB[B)I
.end method

.method public static native Lib_PiccMfpProximityCheck(I[BBB[B)I
.end method

.method public static native Lib_PiccMfpRead(BBBSB[B)I
.end method

.method public static native Lib_PiccMfpReadValue(IBBS[B[B)I
.end method

.method public static native Lib_PiccMfpResetAuth()I
.end method

.method public static native Lib_PiccMfpResetSecMsgState()I
.end method

.method public static native Lib_PiccMfpWrite(BBSB[B)I
.end method

.method public static native Lib_PiccMfpWritePerso(S[B)I
.end method

.method public static native Lib_PiccMfpWriteValue(BBS[BB)I
.end method

.method public static native Lib_PiccMfulActivateCard()I
.end method

.method public static native Lib_PiccMfulIncrCnt(I[B)I
.end method

.method public static native Lib_PiccMfulPwdAuth([B[B)I
.end method

.method public static native Lib_PiccMfulRead(I[B)I
.end method

.method public static native Lib_PiccMfulReadCnt(I[B)I
.end method

.method public static native Lib_PiccMfulReadSign(I[B)I
.end method

.method public static native Lib_PiccMfulUlcAuthenticate(SS)I
.end method

.method public static native Lib_PiccMfulWrite(I[B)I
.end method

.method public static native Lib_PiccNfc([B[B[B[B)I
.end method

.method public static native Lib_PiccOpen()I
.end method

.method public static native Lib_PiccOriDataExchange(BBBB[BS[B[B)I
.end method

.method public static native Lib_PiccPoll(B[B[B[B[B[B[B)I
.end method

.method public static native Lib_PiccPolling([B[B[B[B[B[B)I
.end method

.method public static native Lib_PiccRemove()I
.end method

.method public static native Lib_PiccReset()I
.end method

.method public static native Lib_PiccSamAv2Ini(BB[BBB[B[B[B[B)I
.end method

.method public static native Lib_PiccSamAv2Init(I[B[B[B[B)I
.end method

.method public static native Lib_PiccSamAv2Initi(B[BBB[B[B[B[B)I
.end method

.method public static native Lib_PiccSamClose(I)I
.end method

.method public static native Lib_PiccSamMfcAuth(BBBB)I
.end method

.method public static native Lib_PiccSamOpen(I[B)I
.end method

.method public static native Lib_PiccWriSl1KeyToAv2([BBBB)I
.end method
