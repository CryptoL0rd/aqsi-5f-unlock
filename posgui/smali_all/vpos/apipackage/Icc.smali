.class public Lvpos/apipackage/Icc;
.super Ljava/lang/Object;
.source "Icc.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 15
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 17
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Lib_IccApduCmd(B[BS[B[B)I
.end method

.method public static native Lib_IccCheck(B)I
.end method

.method public static native Lib_IccClose(B)I
.end method

.method public static native Lib_IccCommand(B[B[B)I
.end method

.method public static native Lib_IccDetectSYN(B)I
.end method

.method public static native Lib_IccDetect_4428(B)I
.end method

.method public static native Lib_IccOpen(BB[B)I
.end method

.method public static native Lib_IccSelectEtu(B)I
.end method

.method public static native Lib_SleChangeSecCode4442(B[B)I
.end method

.method public static native Lib_SleClose4428(B)I
.end method

.method public static native Lib_SleClose4442(B)I
.end method

.method public static native Lib_SleInit4428(B[B)I
.end method

.method public static native Lib_SleInit4442(B[B)I
.end method

.method public static native Lib_SleOpen4428(B)I
.end method

.method public static native Lib_SleOpen4442(B)I
.end method

.method public static native Lib_SleReadErrorCount4442(B)I
.end method

.method public static native Lib_SleReadMem4442(BBI[B)I
.end method

.method public static native Lib_SleReadPinCounter4428(B[B)I
.end method

.method public static native Lib_SleReadProMem4442(B[B)I
.end method

.method public static native Lib_SleReadWithPB4428(BBI[B)I
.end method

.method public static native Lib_SleReadWithoutPB4428(BBI[B)I
.end method

.method public static native Lib_SleReset4428(B[B)I
.end method

.method public static native Lib_SleReset4442(B[B)I
.end method

.method public static native Lib_SleVerSecCode4442(B[B)I
.end method

.method public static native Lib_SleVerifyPin4428(B[B)I
.end method

.method public static native Lib_SleWriteMem4442(BBI[B)I
.end method

.method public static native Lib_SleWritePB4428(BBI[B)I
.end method

.method public static native Lib_SleWritePin4428(B[B)I
.end method

.method public static native Lib_SleWritePinCounter4428(BB)I
.end method

.method public static native Lib_SleWriteProMem4442(BBI[B)I
.end method

.method public static native Lib_SleWriteWithPB4428(BBI[B)I
.end method

.method public static native Lib_SleWriteWithoutPB4428(BBI[B)I
.end method
