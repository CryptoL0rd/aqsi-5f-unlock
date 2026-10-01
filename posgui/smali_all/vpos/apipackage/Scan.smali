.class public Lvpos/apipackage/Scan;
.super Ljava/lang/Object;
.source "Scan.java"


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

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Lib_ScanClose()I
.end method

.method public static native Lib_ScanOpen()I
.end method

.method public static native Lib_ScanRead(S[Ljava/lang/String;)I
.end method
