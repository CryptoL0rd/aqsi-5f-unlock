.class public Lvpos/apipackage/Key;
.super Ljava/lang/Object;
.source "Key.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 6
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Lib_KbCheck()I
.end method

.method public static native Lib_KbFlush()I
.end method

.method public static native Lib_KbGetKey()I
.end method
