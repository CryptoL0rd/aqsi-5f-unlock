.class public Lvpos/apipackage/Pci;
.super Ljava/lang/Object;
.source "Pci.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 15
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Lib_PciAesHandle(II[B[BI[BI[B)I
.end method

.method public static native Lib_PciEncryptPin(BS[B[B)I
.end method

.method public static native Lib_PciGetDes(BS[B[BB)I
.end method

.method public static native Lib_PciGetKLKDes(BS[B[BB)I
.end method

.method public static native Lib_PciGetKLKMac(BS[B[BB)I
.end method

.method public static native Lib_PciGetKLKPin(BBBB[B[B[BBB[BBLandroid/content/Context;)I
.end method

.method public static native Lib_PciGetMac(BS[B[BB)I
.end method

.method public static native Lib_PciGetPin(BBBB[B[B[BBB[BBLandroid/content/Context;)I
.end method

.method public static native Lib_PciGetRnd([B)I
.end method

.method public static native Lib_PciGetSelPalDes(BS[B[BB)I
.end method

.method public static native Lib_PciGetSelPalMac(BS[B[BB)I
.end method

.method public static native Lib_PciGetTDES([B[B)I
.end method

.method public static native Lib_PciOffLineEncPin(BBBS[B)I
.end method

.method public static native Lib_PciOffLinePlainPin(BBBS)I
.end method

.method public static native Lib_PciReadKcv(BB[B)I
.end method

.method public static native Lib_PciRsaDecrypt(I[B[B[B[B)I
.end method

.method public static native Lib_PciRsaEncrypt(I[B[B[B)I
.end method

.method public static native Lib_PciRsaGenKeyPair(I[B[B[B[B)I
.end method

.method public static native Lib_PciTriDesHandle(II[B[BI[BI[B)I
.end method

.method public static native Lib_PciWriteDES_MKey(BB[BB)I
.end method

.method public static native Lib_PciWriteDesKey(BB[BBB)I
.end method

.method public static native Lib_PciWriteKLKDesKey(BB[BBB[BB)I
.end method

.method public static native Lib_PciWriteKLKMacKey(BB[BBB[BB)I
.end method

.method public static native Lib_PciWriteKLKPinKey(BB[BBB[BB)I
.end method

.method public static native Lib_PciWriteMAC_MKey(BB[BB)I
.end method

.method public static native Lib_PciWriteMacKey(BB[BBB)I
.end method

.method public static native Lib_PciWritePIN_MKey(BB[BB)I
.end method

.method public static native Lib_PciWritePinKey(BB[BBB)I
.end method
