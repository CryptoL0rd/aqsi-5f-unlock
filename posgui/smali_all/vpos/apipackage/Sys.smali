.class public Lvpos/apipackage/Sys;
.super Ljava/lang/Object;
.source "Sys.java"


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
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Lib_AppInit(Landroid/content/Context;)V
.end method

.method public static native Lib_Beep()I
.end method

.method public static native Lib_Des([B[B[BI)I
.end method

.method public static native Lib_GetTime([B)I
.end method

.method public static native Lib_GetVersion([B)I
.end method

.method public static native Lib_KeyEvent()I
.end method

.method public static native Lib_LedCtrl(BB)I
.end method

.method public static native Lib_LogSwitch(I)I
.end method

.method public static native Lib_PowerOff()I
.end method

.method public static native Lib_PowerOn()I
.end method

.method public static native Lib_ReadChipID([BI)I
.end method

.method public static native Lib_ReadSN([B)I
.end method

.method public static native Lib_RecvBytes([BII)I
.end method

.method public static native Lib_RecvPacket([B[II)I
.end method

.method public static native Lib_RsaDecrypt([BI[B[BI[B)I
.end method

.method public static native Lib_RsaEncrypt([BI[BI[B)I
.end method

.method public static native Lib_SecuTamperBit(BB)I
.end method

.method public static native Lib_SendBytes([BI)I
.end method

.method public static native Lib_SendPacket([BIBB)I
.end method

.method public static native Lib_SetEntryMode(B)I
.end method

.method public static native Lib_SetEntryModeClose()I
.end method

.method public static native Lib_SetEntryModeOpen()I
.end method

.method public static native Lib_SetLed(BB)I
.end method

.method public static native Lib_SetTime([B)I
.end method

.method public static native Lib_Test(B)I
.end method

.method public static native Lib_Update()I
.end method

.method public static native Lib_UpdateBoot()I
.end method

.method public static native Lib_WriteSN([B)I
.end method

.method public static native Print_Black()I
.end method

.method public static native Print_Time()I
.end method

.method public static native Test_uarts()I
.end method
