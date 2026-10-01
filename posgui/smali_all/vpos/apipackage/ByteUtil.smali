.class public Lvpos/apipackage/ByteUtil;
.super Ljava/lang/Object;
.source "ByteUtil.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "UseValueOf"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ByteUtil Constructor"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 15
    return-void
.end method

.method public static BytesToChar([BI)C
    .registers 5
    .param p0, "b"    # [B
    .param p1, "offset"    # I

    .line 221
    const/4 v0, 0x0

    .line 223
    .local v0, "s":I
    array-length v1, p0

    sub-int/2addr v1, p1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_2e

    .line 224
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    if-lez v1, :cond_12

    .line 225
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    add-int/2addr v0, v1

    goto :goto_19

    .line 227
    :cond_12
    add-int/lit8 v1, p1, 0x0

    aget-byte v1, p0, v1

    add-int/lit16 v1, v1, 0x100

    add-int/2addr v0, v1

    .line 228
    :goto_19
    mul-int/lit16 v0, v0, 0x100

    .line 229
    add-int/lit8 v1, p1, 0x0

    aget-byte v1, p0, v1

    if-lez v1, :cond_27

    .line 230
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    add-int/2addr v0, v1

    goto :goto_2e

    .line 232
    :cond_27
    add-int/lit8 v1, p1, 0x0

    aget-byte v1, p0, v1

    add-int/lit16 v1, v1, 0x100

    add-int/2addr v0, v1

    .line 235
    :cond_2e
    :goto_2e
    int-to-char v1, v0

    .line 236
    .local v1, "ch":C
    return v1
.end method

.method public static BytesToDouble([BI)D
    .registers 8
    .param p0, "b"    # [B
    .param p1, "offset"    # I

    .line 284
    const-wide/16 v0, 0x0

    .line 286
    .local v0, "l":J
    array-length v2, p0

    sub-int/2addr v2, p1

    const/16 v3, 0x8

    if-lt v2, v3, :cond_66

    .line 287
    const/4 v2, 0x0

    aget-byte v2, p0, v2

    int-to-long v0, v2

    .line 288
    const-wide/16 v4, 0xff

    and-long/2addr v0, v4

    .line 289
    const/4 v2, 0x1

    aget-byte v2, p0, v2

    int-to-long v4, v2

    shl-long v2, v4, v3

    or-long/2addr v0, v2

    .line 290
    const-wide/32 v2, 0xffff

    and-long/2addr v0, v2

    .line 291
    const/4 v2, 0x2

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 292
    const-wide/32 v2, 0xffffff

    and-long/2addr v0, v2

    .line 293
    const/4 v2, 0x3

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 294
    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 295
    const/4 v2, 0x4

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 296
    const-wide v2, 0xffffffffffL

    and-long/2addr v0, v2

    .line 297
    const/4 v2, 0x5

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 298
    const-wide v2, 0xffffffffffffL

    and-long/2addr v0, v2

    .line 299
    const/4 v2, 0x6

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 300
    const-wide v2, 0xffffffffffffffL

    and-long/2addr v0, v2

    .line 301
    const/4 v2, 0x7

    aget-byte v2, p0, v2

    int-to-long v2, v2

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    .line 304
    :cond_66
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    return-wide v2
.end method

.method public static BytesToFloat([BI)F
    .registers 8
    .param p0, "b"    # [B
    .param p1, "offset"    # I

    .line 254
    const/4 v0, 0x0

    .line 256
    .local v0, "l":I
    array-length v1, p0

    sub-int/2addr v1, p1

    const/4 v2, 0x4

    if-lt v1, v2, :cond_35

    .line 257
    add-int/lit8 v1, p1, 0x0

    aget-byte v0, p0, v1

    .line 258
    and-int/lit16 v0, v0, 0xff

    .line 259
    int-to-long v1, v0

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    int-to-long v3, v3

    const/16 v5, 0x8

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    long-to-int v0, v1

    .line 260
    const v1, 0xffff

    and-int/2addr v0, v1

    .line 261
    int-to-long v1, v0

    add-int/lit8 v3, p1, 0x2

    aget-byte v3, p0, v3

    int-to-long v3, v3

    const/16 v5, 0x10

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    long-to-int v0, v1

    .line 262
    const v1, 0xffffff

    and-int/2addr v0, v1

    .line 263
    int-to-long v1, v0

    add-int/lit8 v3, p1, 0x3

    aget-byte v3, p0, v3

    int-to-long v3, v3

    const/16 v5, 0x18

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    long-to-int v0, v1

    .line 266
    :cond_35
    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    return v1
.end method

.method public static BytesToInt([BI)I
    .registers 5
    .param p0, "b"    # [B
    .param p1, "offset"    # I

    .line 164
    const/4 v0, 0x0

    .line 165
    .local v0, "x":I
    array-length v1, p0

    sub-int/2addr v1, p1

    const/4 v2, 0x4

    if-lt v1, v2, :cond_2a

    .line 166
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x0

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x0

    or-int v0, v1, v2

    .line 171
    :cond_2a
    return v0
.end method

.method public static BytesToLong([BI)J
    .registers 12
    .param p0, "b"    # [B
    .param p1, "offset"    # I

    .line 192
    const-wide/16 v0, 0x0

    .line 193
    .local v0, "x":J
    array-length v2, p0

    sub-int/2addr v2, p1

    const/16 v3, 0x8

    if-lt v2, v3, :cond_58

    .line 194
    add-int/lit8 v2, p1, 0x7

    aget-byte v2, p0, v2

    int-to-long v4, v2

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    const/16 v2, 0x38

    shl-long/2addr v4, v2

    add-int/lit8 v2, p1, 0x6

    aget-byte v2, p0, v2

    int-to-long v8, v2

    and-long/2addr v8, v6

    const/16 v2, 0x30

    shl-long/2addr v8, v2

    or-long/2addr v4, v8

    add-int/lit8 v2, p1, 0x5

    aget-byte v2, p0, v2

    int-to-long v8, v2

    and-long/2addr v8, v6

    const/16 v2, 0x28

    shl-long/2addr v8, v2

    or-long/2addr v4, v8

    add-int/lit8 v2, p1, 0x4

    aget-byte v2, p0, v2

    int-to-long v8, v2

    and-long/2addr v8, v6

    const/16 v2, 0x20

    shl-long/2addr v8, v2

    or-long/2addr v4, v8

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    int-to-long v8, v2

    and-long/2addr v8, v6

    const/16 v2, 0x18

    shl-long/2addr v8, v2

    or-long/2addr v4, v8

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    int-to-long v8, v2

    and-long/2addr v8, v6

    const/16 v2, 0x10

    shl-long/2addr v8, v2

    or-long/2addr v4, v8

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    int-to-long v8, v2

    and-long/2addr v8, v6

    shl-long v2, v8, v3

    or-long/2addr v2, v4

    add-int/lit8 v4, p1, 0x0

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    const/4 v6, 0x0

    shl-long/2addr v4, v6

    or-long v0, v2, v4

    .line 203
    :cond_58
    return-wide v0
.end method

.method public static BytesToShort([BI)S
    .registers 5
    .param p0, "b"    # [B
    .param p1, "offset"    # I

    .line 133
    const/4 v0, 0x0

    .line 134
    .local v0, "x":S
    array-length v1, p0

    sub-int/2addr v1, p1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_14

    .line 135
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v2, p1, 0x0

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    int-to-short v0, v1

    .line 138
    :cond_14
    return v0
.end method

.method public static CharToBytes([BCI)V
    .registers 9
    .param p0, "b"    # [B
    .param p1, "ch"    # C
    .param p2, "offset"    # I

    .line 209
    array-length v0, p0

    sub-int/2addr v0, p2

    const/4 v1, 0x2

    if-lt v0, v1, :cond_1d

    .line 210
    move v0, p1

    .line 211
    .local v0, "temp":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v1, :cond_1d

    .line 212
    add-int v3, p2, v2

    new-instance v4, Ljava/lang/Integer;

    and-int/lit16 v5, v0, 0xff

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v4}, Ljava/lang/Integer;->byteValue()B

    move-result v4

    aput-byte v4, p0, v3

    .line 213
    shr-int/lit8 v0, v0, 0x8

    .line 211
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 218
    .end local v0    # "temp":I
    .end local v2    # "i":I
    :cond_1d
    return-void
.end method

.method public static DoubleToBytes([BDI)V
    .registers 10
    .param p0, "b"    # [B
    .param p1, "x"    # D
    .param p3, "offset"    # I

    .line 272
    array-length v0, p0

    sub-int/2addr v0, p3

    const/16 v1, 0x8

    if-lt v0, v1, :cond_1f

    .line 273
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 274
    .local v2, "l":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    const/4 v4, 0x4

    if-ge v0, v4, :cond_1f

    .line 275
    add-int v4, p3, v0

    new-instance v5, Ljava/lang/Long;

    invoke-direct {v5, v2, v3}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v5}, Ljava/lang/Long;->byteValue()B

    move-result v5

    aput-byte v5, p0, v4

    .line 276
    shr-long/2addr v2, v1

    .line 274
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 281
    .end local v0    # "i":I
    .end local v2    # "l":J
    :cond_1f
    return-void
.end method

.method public static FloatToBytes([BFI)V
    .registers 8
    .param p0, "b"    # [B
    .param p1, "x"    # F
    .param p2, "offset"    # I

    .line 242
    array-length v0, p0

    sub-int/2addr v0, p2

    const/4 v1, 0x4

    if-lt v0, v1, :cond_1e

    .line 243
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    .line 244
    .local v0, "l":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    if-ge v2, v1, :cond_1e

    .line 245
    add-int v3, p2, v2

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v4}, Ljava/lang/Integer;->byteValue()B

    move-result v4

    aput-byte v4, p0, v3

    .line 246
    shr-int/lit8 v0, v0, 0x8

    .line 244
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 251
    .end local v0    # "l":I
    .end local v2    # "i":I
    :cond_1e
    return-void
.end method

.method public static IntToBytes([BII)V
    .registers 5
    .param p0, "b"    # [B
    .param p1, "x"    # I
    .param p2, "offset"    # I

    .line 153
    array-length v0, p0

    sub-int/2addr v0, p2

    const/4 v1, 0x4

    if-lt v0, v1, :cond_21

    .line 154
    add-int/lit8 v0, p2, 0x3

    shr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 155
    add-int/lit8 v0, p2, 0x2

    shr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 156
    add-int/lit8 v0, p2, 0x1

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 157
    add-int/lit8 v0, p2, 0x0

    shr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 161
    :cond_21
    return-void
.end method

.method public static LongToBytes([BJI)V
    .registers 8
    .param p0, "b"    # [B
    .param p1, "x"    # J
    .param p3, "offset"    # I

    .line 177
    array-length v0, p0

    sub-int/2addr v0, p3

    const/16 v1, 0x8

    if-lt v0, v1, :cond_53

    .line 178
    add-int/lit8 v0, p3, 0x7

    const/16 v2, 0x38

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 179
    add-int/lit8 v0, p3, 0x6

    const/16 v2, 0x30

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 180
    add-int/lit8 v0, p3, 0x5

    const/16 v2, 0x28

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 181
    add-int/lit8 v0, p3, 0x4

    const/16 v2, 0x20

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 182
    add-int/lit8 v0, p3, 0x3

    const/16 v2, 0x18

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 183
    add-int/lit8 v0, p3, 0x2

    const/16 v2, 0x10

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p0, v0

    .line 184
    add-int/lit8 v0, p3, 0x1

    shr-long v1, p1, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 185
    add-int/lit8 v0, p3, 0x0

    const/4 v1, 0x0

    shr-long v1, p1, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 189
    :cond_53
    return-void
.end method

.method public static ShortToBytes([BSI)V
    .registers 5
    .param p0, "b"    # [B
    .param p1, "x"    # S
    .param p2, "offset"    # I

    .line 124
    array-length v0, p0

    sub-int/2addr v0, p2

    const/4 v1, 0x2

    if-lt v0, v1, :cond_13

    .line 125
    add-int/lit8 v0, p2, 0x1

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 126
    add-int/lit8 v0, p2, 0x0

    shr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 130
    :cond_13
    return-void
.end method

.method public static byteToHexString(B)Ljava/lang/String;
    .registers 4
    .param p0, "b"    # B

    .line 144
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 145
    .local v0, "sbBuffer":Ljava/lang/StringBuffer;
    const-string v1, "0123456789ABCDEF"

    shr-int/lit8 v2, p0, 0x4

    and-int/lit8 v2, v2, 0xf

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 146
    const-string v1, "0123456789ABCDEF"

    and-int/lit8 v2, p0, 0xf

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 147
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static bytearrayToHexString([BI)Ljava/lang/String;
    .registers 6
    .param p0, "b"    # [B
    .param p1, "leng"    # I

    .line 107
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 109
    .local v0, "strbuf":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    if-ge v1, p1, :cond_2e

    .line 110
    const-string v2, "0123456789ABCDEF"

    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xf0

    shr-int/lit8 v3, v3, 0x4

    int-to-byte v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 111
    const-string v2, "0123456789ABCDEF"

    aget-byte v3, p0, v1

    and-int/lit8 v3, v3, 0xf

    int-to-byte v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 112
    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 109
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 114
    .end local v1    # "i":I
    :cond_2e
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static bytesToInt([B)I
    .registers 5
    .param p0, "byteArray"    # [B

    .line 49
    const/4 v0, 0x0

    .line 51
    .local v0, "n":I
    :try_start_1
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 52
    .local v1, "byteInput":Ljava/io/ByteArrayInputStream;
    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 53
    .local v2, "dataInput":Ljava/io/DataInputStream;
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v3
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_f} :catch_11

    move v0, v3

    .line 58
    .end local v1    # "byteInput":Ljava/io/ByteArrayInputStream;
    .end local v2    # "dataInput":Ljava/io/DataInputStream;
    goto :goto_15

    .line 55
    :catch_11
    move-exception v1

    .line 57
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 59
    .end local v1    # "e":Ljava/io/IOException;
    :goto_15
    return v0
.end method

.method public static bytesToString([B)Ljava/lang/String;
    .registers 5
    .param p0, "b"    # [B

    .line 91
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 92
    .local v0, "result":Ljava/lang/StringBuffer;
    array-length v1, p0

    .line 94
    .local v1, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9
    if-ge v2, v1, :cond_19

    .line 95
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    int-to-char v3, v3

    .line 96
    .local v3, "ch":C
    if-nez v3, :cond_13

    .line 97
    goto :goto_19

    .line 100
    :cond_13
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 94
    .end local v3    # "ch":C
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 103
    .end local v2    # "i":I
    :cond_19
    :goto_19
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static decodeOutputBytes([B)S
    .registers 5
    .param p0, "b"    # [B

    .line 428
    const/4 v0, 0x2

    new-array v1, v0, [B

    .line 429
    .local v1, "byShort":[B
    array-length v2, v1

    const/4 v3, 0x0

    invoke-static {p0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 430
    invoke-static {v1, v3}, Lvpos/apipackage/ByteUtil;->BytesToShort([BI)S

    move-result v2

    .line 432
    .local v2, "sLen":S
    invoke-static {p0, v0, p0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 434
    return v2
.end method

.method public static encodeOutputBytes([BS)V
    .registers 5
    .param p0, "b"    # [B
    .param p1, "sLen"    # S

    .line 416
    array-length v0, p0

    add-int/lit8 v1, p1, 0x2

    if-lt v0, v1, :cond_13

    .line 417
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-static {p0, v1, p0, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 418
    new-array v0, v0, [B

    .line 419
    .local v0, "byShort":[B
    invoke-static {v0, p1, v1}, Lvpos/apipackage/ByteUtil;->ShortToBytes([BSI)V

    .line 420
    array-length v2, v0

    invoke-static {v0, v1, p0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 422
    .end local v0    # "byShort":[B
    :cond_13
    return-void
.end method

.method public static hexStr2Str(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "hexStr"    # Ljava/lang/String;

    .line 438
    const-string v0, "0123456789ABCDEF"

    .line 439
    .local v0, "str":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 440
    .local v1, "hexs":[C
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    new-array v2, v2, [B

    .line 443
    .local v2, "bytes":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_f
    array-length v4, v2

    if-ge v3, v4, :cond_2f

    .line 444
    mul-int/lit8 v4, v3, 0x2

    aget-char v4, v1, v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x10

    .line 445
    .local v4, "n":I
    mul-int/lit8 v5, v3, 0x2

    add-int/lit8 v5, v5, 0x1

    aget-char v5, v1, v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    add-int/2addr v4, v5

    .line 446
    and-int/lit16 v5, v4, 0xff

    int-to-byte v5, v5

    aput-byte v5, v2, v3

    .line 443
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 448
    .end local v3    # "i":I
    .end local v4    # "n":I
    :cond_2f
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([B)V

    return-object v3
.end method

.method public static iToBytes(I)[B
    .registers 5
    .param p0, "n"    # I

    .line 27
    const/4 v0, 0x0

    .line 29
    .local v0, "byteArray":[B
    :try_start_1
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 30
    .local v1, "byteOut":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/DataOutputStream;

    invoke-direct {v2, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 31
    .local v2, "dataOut":Ljava/io/DataOutputStream;
    invoke-virtual {v2, p0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 32
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_12} :catch_14

    move-object v0, v3

    .line 38
    .end local v1    # "byteOut":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "dataOut":Ljava/io/DataOutputStream;
    goto :goto_18

    .line 36
    :catch_14
    move-exception v1

    .line 37
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 39
    .end local v1    # "e":Ljava/io/IOException;
    :goto_18
    return-object v0
.end method

.method public static returnActualLength([B)I
    .registers 3
    .param p0, "data"    # [B

    .line 18
    const/4 v0, 0x0

    .line 19
    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_c

    .line 20
    aget-byte v1, p0, v0

    if-nez v1, :cond_9

    .line 21
    goto :goto_c

    .line 19
    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 23
    :cond_c
    :goto_c
    return v0
.end method

.method public static stringToBytes(Ljava/lang/String;)[B
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .line 118
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public static toHL(I)I
    .registers 4
    .param p0, "n"    # I

    .line 349
    const/4 v0, 0x4

    new-array v0, v0, [B

    .line 350
    .local v0, "b":[B
    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x3

    aput-byte v1, v0, v2

    .line 351
    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x2

    aput-byte v1, v0, v2

    .line 352
    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x1

    aput-byte v1, v0, v2

    .line 353
    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    .line 355
    invoke-static {v0, v2}, Lvpos/apipackage/ByteUtil;->BytesToInt([BI)I

    move-result v1

    .line 356
    .local v1, "ret":I
    return v1
.end method

.method public static toHL(J)J
    .registers 8
    .param p0, "n"    # J

    .line 381
    const/16 v0, 0x8

    new-array v1, v0, [B

    .line 382
    .local v1, "b":[B
    const-wide/16 v2, 0xff

    and-long v4, p0, v2

    long-to-int v4, v4

    int-to-byte v4, v4

    const/4 v5, 0x7

    aput-byte v4, v1, v5

    .line 383
    shr-long v4, p0, v0

    and-long/2addr v4, v2

    long-to-int v0, v4

    int-to-byte v0, v0

    const/4 v4, 0x6

    aput-byte v0, v1, v4

    .line 384
    const/16 v0, 0x10

    shr-long v4, p0, v0

    and-long/2addr v4, v2

    long-to-int v0, v4

    int-to-byte v0, v0

    const/4 v4, 0x5

    aput-byte v0, v1, v4

    .line 385
    const/16 v0, 0x18

    shr-long v4, p0, v0

    and-long/2addr v4, v2

    long-to-int v0, v4

    int-to-byte v0, v0

    const/4 v4, 0x4

    aput-byte v0, v1, v4

    .line 386
    const/16 v0, 0x20

    shr-long v4, p0, v0

    and-long/2addr v4, v2

    long-to-int v0, v4

    int-to-byte v0, v0

    const/4 v4, 0x3

    aput-byte v0, v1, v4

    .line 387
    const/16 v0, 0x28

    shr-long v4, p0, v0

    and-long/2addr v4, v2

    long-to-int v0, v4

    int-to-byte v0, v0

    const/4 v4, 0x2

    aput-byte v0, v1, v4

    .line 388
    const/16 v0, 0x30

    shr-long v4, p0, v0

    and-long/2addr v4, v2

    long-to-int v0, v4

    int-to-byte v0, v0

    const/4 v4, 0x1

    aput-byte v0, v1, v4

    .line 389
    const/16 v0, 0x38

    shr-long v4, p0, v0

    and-long/2addr v2, v4

    long-to-int v0, v2

    int-to-byte v0, v0

    const/4 v2, 0x0

    aput-byte v0, v1, v2

    .line 391
    invoke-static {v1, v2}, Lvpos/apipackage/ByteUtil;->BytesToLong([BI)J

    move-result-wide v2

    .line 392
    .local v2, "ret":J
    return-wide v2
.end method

.method public static toHL(S)S
    .registers 4
    .param p0, "n"    # S

    .line 323
    const/4 v0, 0x2

    new-array v0, v0, [B

    .line 324
    .local v0, "b":[B
    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x1

    aput-byte v1, v0, v2

    .line 325
    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    .line 327
    invoke-static {v0, v2}, Lvpos/apipackage/ByteUtil;->BytesToShort([BI)S

    move-result v1

    .line 328
    .local v1, "ret":S
    return v1
.end method

.method public static toLH(I)I
    .registers 5
    .param p0, "n"    # I

    .line 335
    const/4 v0, 0x4

    new-array v0, v0, [B

    .line 336
    .local v0, "b":[B
    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    .line 337
    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v3, 0x1

    aput-byte v1, v0, v3

    .line 338
    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v3, 0x2

    aput-byte v1, v0, v3

    .line 339
    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v3, 0x3

    aput-byte v1, v0, v3

    .line 341
    invoke-static {v0, v2}, Lvpos/apipackage/ByteUtil;->BytesToInt([BI)I

    move-result v1

    .line 342
    .local v1, "ret":I
    return v1
.end method

.method public static toLH(J)J
    .registers 10
    .param p0, "n"    # J

    .line 363
    const/16 v0, 0x8

    new-array v1, v0, [B

    .line 364
    .local v1, "b":[B
    const-wide/16 v2, 0xff

    and-long v4, p0, v2

    long-to-int v4, v4

    int-to-byte v4, v4

    const/4 v5, 0x0

    aput-byte v4, v1, v5

    .line 365
    shr-long v6, p0, v0

    and-long/2addr v6, v2

    long-to-int v0, v6

    int-to-byte v0, v0

    const/4 v4, 0x1

    aput-byte v0, v1, v4

    .line 366
    const/16 v0, 0x10

    shr-long v6, p0, v0

    and-long/2addr v6, v2

    long-to-int v0, v6

    int-to-byte v0, v0

    const/4 v4, 0x2

    aput-byte v0, v1, v4

    .line 367
    const/16 v0, 0x18

    shr-long v6, p0, v0

    and-long/2addr v6, v2

    long-to-int v0, v6

    int-to-byte v0, v0

    const/4 v4, 0x3

    aput-byte v0, v1, v4

    .line 368
    const/16 v0, 0x20

    shr-long v6, p0, v0

    and-long/2addr v6, v2

    long-to-int v0, v6

    int-to-byte v0, v0

    const/4 v4, 0x4

    aput-byte v0, v1, v4

    .line 369
    const/16 v0, 0x28

    shr-long v6, p0, v0

    and-long/2addr v6, v2

    long-to-int v0, v6

    int-to-byte v0, v0

    const/4 v4, 0x5

    aput-byte v0, v1, v4

    .line 370
    const/16 v0, 0x30

    shr-long v6, p0, v0

    and-long/2addr v6, v2

    long-to-int v0, v6

    int-to-byte v0, v0

    const/4 v4, 0x6

    aput-byte v0, v1, v4

    .line 371
    const/16 v0, 0x38

    shr-long v6, p0, v0

    and-long/2addr v2, v6

    long-to-int v0, v2

    int-to-byte v0, v0

    const/4 v2, 0x7

    aput-byte v0, v1, v2

    .line 373
    invoke-static {v1, v5}, Lvpos/apipackage/ByteUtil;->BytesToLong([BI)J

    move-result-wide v2

    .line 374
    .local v2, "ret":J
    return-wide v2
.end method

.method public static toLH(S)S
    .registers 5
    .param p0, "n"    # S

    .line 311
    const/4 v0, 0x2

    new-array v0, v0, [B

    .line 312
    .local v0, "b":[B
    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    .line 313
    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v3, 0x1

    aput-byte v1, v0, v3

    .line 315
    invoke-static {v0, v2}, Lvpos/apipackage/ByteUtil;->BytesToShort([BI)S

    move-result v1

    .line 316
    .local v1, "ret":S
    return v1
.end method


# virtual methods
.method public ByteArrayToInt([B)I
    .registers 5
    .param p1, "bArr"    # [B

    .line 80
    array-length v0, p1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_6

    .line 81
    const/4 v0, -0x1

    return v0

    .line 83
    :cond_6
    const/4 v0, 0x3

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    const/4 v1, 0x2

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    const/4 v1, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    const/4 v1, 0x0

    aget-byte v2, p1, v1

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v1, v2, 0x0

    or-int/2addr v0, v1

    return v0
.end method

.method public IntToByteArray(I)[B
    .registers 5
    .param p1, "n"    # I

    .line 70
    const/4 v0, 0x4

    new-array v0, v0, [B

    .line 71
    .local v0, "b":[B
    and-int/lit16 v1, p1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    .line 72
    shr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x1

    aput-byte v1, v0, v2

    .line 73
    shr-int/lit8 v1, p1, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x2

    aput-byte v1, v0, v2

    .line 74
    shr-int/lit8 v1, p1, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x3

    aput-byte v1, v0, v2

    .line 75
    return-object v0
.end method
