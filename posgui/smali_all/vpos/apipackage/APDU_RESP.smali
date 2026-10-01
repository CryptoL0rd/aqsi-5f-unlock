.class public Lvpos/apipackage/APDU_RESP;
.super Ljava/lang/Object;
.source "APDU_RESP.java"


# instance fields
.field public DataOut:[B

.field public LenOut:S

.field public SWA:B

.field public SWB:B


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, 0x0

    iput-short v0, p0, Lvpos/apipackage/APDU_RESP;->LenOut:S

    .line 6
    const/16 v1, 0x200

    new-array v1, v1, [B

    iput-object v1, p0, Lvpos/apipackage/APDU_RESP;->DataOut:[B

    .line 7
    iput-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWA:B

    .line 8
    iput-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWB:B

    .line 12
    return-void
.end method

.method public constructor <init>(S[BBB)V
    .registers 7
    .param p1, "LenOut"    # S
    .param p2, "DataOut"    # [B
    .param p3, "SWA"    # B
    .param p4, "SWB"    # B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, 0x0

    iput-short v0, p0, Lvpos/apipackage/APDU_RESP;->LenOut:S

    .line 6
    const/16 v1, 0x200

    new-array v1, v1, [B

    iput-object v1, p0, Lvpos/apipackage/APDU_RESP;->DataOut:[B

    .line 7
    iput-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWA:B

    .line 8
    iput-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWB:B

    .line 15
    iput-short p1, p0, Lvpos/apipackage/APDU_RESP;->LenOut:S

    .line 16
    iput-object p2, p0, Lvpos/apipackage/APDU_RESP;->DataOut:[B

    .line 17
    iput-byte p3, p0, Lvpos/apipackage/APDU_RESP;->SWA:B

    .line 18
    iput-byte p4, p0, Lvpos/apipackage/APDU_RESP;->SWB:B

    .line 19
    return-void
.end method

.method public constructor <init>([B)V
    .registers 6
    .param p1, "resp"    # [B

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, 0x0

    iput-short v0, p0, Lvpos/apipackage/APDU_RESP;->LenOut:S

    .line 6
    const/16 v1, 0x200

    new-array v2, v1, [B

    iput-object v2, p0, Lvpos/apipackage/APDU_RESP;->DataOut:[B

    .line 7
    iput-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWA:B

    .line 8
    iput-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWB:B

    .line 23
    const/4 v2, 0x1

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    mul-int/lit16 v2, v2, 0x100

    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    add-int/2addr v2, v3

    int-to-short v2, v2

    iput-short v2, p0, Lvpos/apipackage/APDU_RESP;->LenOut:S

    .line 25
    iget-object v2, p0, Lvpos/apipackage/APDU_RESP;->DataOut:[B

    const/4 v3, 0x2

    invoke-static {p1, v3, v2, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 26
    const/16 v0, 0x202

    aget-byte v0, p1, v0

    iput-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWA:B

    .line 27
    const/16 v0, 0x203

    aget-byte v0, p1, v0

    iput-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWB:B

    .line 28
    return-void
.end method


# virtual methods
.method public getDataOut()[B
    .registers 2

    .line 35
    iget-object v0, p0, Lvpos/apipackage/APDU_RESP;->DataOut:[B

    return-object v0
.end method

.method public getLenOut()S
    .registers 2

    .line 31
    iget-short v0, p0, Lvpos/apipackage/APDU_RESP;->LenOut:S

    return v0
.end method

.method public getSWA()B
    .registers 2

    .line 39
    iget-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWA:B

    return v0
.end method

.method public getSWB()B
    .registers 2

    .line 43
    iget-byte v0, p0, Lvpos/apipackage/APDU_RESP;->SWB:B

    return v0
.end method
