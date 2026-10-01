.class public Lvpos/apipackage/AppTypeApi;
.super Ljava/lang/Object;
.source "AppTypeApi.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 8
    const-string v0, "PosApi"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native initCxt(Landroid/content/Context;)I
.end method

.method public static native showAppWin(I[B)I
.end method
