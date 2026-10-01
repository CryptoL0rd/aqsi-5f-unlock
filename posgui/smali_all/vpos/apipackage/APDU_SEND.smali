.class public Lvpos/apipackage/APDU_SEND;
.super Ljava/lang/Object;
.source "APDU_SEND.java"


# instance fields
.field public Command:[B

.field public DataIn:[B

.field public Lc:S

.field public Le:S


# direct methods
.method public constructor <init>([BS[BS)V
    .registers 6
    .param p1, "Command"    # [B
    .param p2, "Lc"    # S
    .param p3, "DataIn"    # [B
    .param p4, "Le"    # S

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const/4 v0, 0x0

    iput-object v0, p0, Lvpos/apipackage/APDU_SEND;->Command:[B

    .line 6
    iput-object v0, p0, Lvpos/apipackage/APDU_SEND;->DataIn:[B

    .line 10
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lvpos/apipackage/APDU_SEND;->Command:[B

    .line 11
    array-length v0, p3

    new-array v0, v0, [B

    iput-object v0, p0, Lvpos/apipackage/APDU_SEND;->DataIn:[B

    .line 12
    iput-object p1, p0, Lvpos/apipackage/APDU_SEND;->Command:[B

    .line 13
    iput-short p2, p0, Lvpos/apipackage/APDU_SEND;->Lc:S

    .line 14
    iput-object p3, p0, Lvpos/apipackage/APDU_SEND;->DataIn:[B

    .line 15
    iput-short p4, p0, Lvpos/apipackage/APDU_SEND;->Le:S

    .line 16
    return-void
.end method


# virtual methods
.method public getBytes()[B
    .registers 6

    .line 20
    const/16 v0, 0x208

    new-array v0, v0, [B

    .line 21
    .local v0, "buf":[B
    iget-object v1, p0, Lvpos/apipackage/APDU_SEND;->Command:[B

    iget-object v2, p0, Lvpos/apipackage/APDU_SEND;->Command:[B

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 22
    iget-short v1, p0, Lvpos/apipackage/APDU_SEND;->Lc:S

    div-int/lit16 v1, v1, 0x100

    int-to-byte v1, v1

    const/4 v2, 0x4

    aput-byte v1, v0, v2

    .line 23
    iget-short v1, p0, Lvpos/apipackage/APDU_SEND;->Lc:S

    rem-int/lit16 v1, v1, 0x100

    int-to-byte v1, v1

    const/4 v2, 0x5

    aput-byte v1, v0, v2

    .line 24
    iget-object v1, p0, Lvpos/apipackage/APDU_SEND;->DataIn:[B

    iget-object v2, p0, Lvpos/apipackage/APDU_SEND;->DataIn:[B

    array-length v2, v2

    const/4 v4, 0x6

    invoke-static {v1, v3, v0, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    iget-short v1, p0, Lvpos/apipackage/APDU_SEND;->Le:S

    div-int/lit16 v1, v1, 0x100

    int-to-byte v1, v1

    const/16 v2, 0x206

    aput-byte v1, v0, v2

    .line 26
    iget-short v1, p0, Lvpos/apipackage/APDU_SEND;->Le:S

    rem-int/lit16 v1, v1, 0x100

    int-to-byte v1, v1

    const/16 v2, 0x207

    aput-byte v1, v0, v2

    .line 27
    return-object v0
.end method
