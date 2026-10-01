.class public Lvpos/apipackage/Fingerprint;
.super Ljava/lang/Object;
.source "Fingerprint.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 6
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 7
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Lib_FpClose()I
.end method

.method public static native Lib_FpCode([B[I)I
.end method

.method public static native Lib_FpDeleteAll()I
.end method

.method public static native Lib_FpMatch()I
.end method

.method public static native Lib_FpOpen()I
.end method

.method public static native Lib_FpRegister()I
.end method
