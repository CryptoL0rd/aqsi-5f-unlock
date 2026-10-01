.class public Lvpos/apipackage/PrintInitException;
.super Ljava/lang/Exception;
.source "PrintInitException.java"


# static fields
.field public static final PRN_BUFFOVERFLOW:I = -0xfa8

.field public static final PRN_BUSY:I = -0xfa1

.field public static final PRN_DATAERR:I = -0xfa3

.field public static final PRN_FAULT:I = -0xfa4

.field public static final PRN_GETFONTERR:I = -0xfaa

.field public static final PRN_NOFONTLIB:I = -0xfa7

.field public static final PRN_NOPAPER:I = -0xfa2

.field public static final PRN_SETFONTERR:I = -0xfa9

.field public static final PRN_TOOHEAT:I = -0xfa5

.field public static final PRN_UNFINISHED:I = -0xfa6

.field public static exceptionCode:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "code"    # I

    .line 26
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 27
    if-eqz p1, :cond_7

    .line 28
    sput p1, Lvpos/apipackage/PrintInitException;->exceptionCode:I

    .line 30
    :cond_7
    return-void
.end method


# virtual methods
.method public getExceptionCode()I
    .registers 2

    .line 32
    sget v0, Lvpos/apipackage/PrintInitException;->exceptionCode:I

    return v0
.end method

.method public setExceptionCode(I)V
    .registers 2
    .param p1, "exceptionCode"    # I

    .line 35
    sput p1, Lvpos/apipackage/PrintInitException;->exceptionCode:I

    .line 36
    return-void
.end method
