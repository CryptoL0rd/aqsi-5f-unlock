.class public Lvpos/apipackage/Mcr;
.super Ljava/lang/Object;
.source "Mcr.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Lib_McrCheck()I
.end method

.method public static native Lib_McrClose()I
.end method

.method public static native Lib_McrOpen()I
.end method

.method public static native Lib_McrRead(BB[B[B[B)I
.end method

.method public static native Lib_McrReset()I
.end method
