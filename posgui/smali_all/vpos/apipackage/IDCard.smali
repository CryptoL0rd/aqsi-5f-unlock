.class public Lvpos/apipackage/IDCard;
.super Ljava/lang/Object;
.source "IDCard.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 7
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 8
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Lib_IDCardClose()I
.end method

.method public static native Lib_IDCardOpen()I
.end method

.method public static native Lib_IDCardRead([Ljava/lang/String;[B)I
.end method

.method public static native Lib_IDCardRead2([Ljava/lang/String;)I
.end method
