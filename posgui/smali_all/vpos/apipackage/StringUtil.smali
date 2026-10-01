.class public Lvpos/apipackage/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "StringUtil Constructor"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 8
    return-void
.end method

.method public static GBKToUTF8(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "gbkString"    # Ljava/lang/String;

    .line 88
    const-string v0, ""

    .line 89
    .local v0, "utf8String":Ljava/lang/String;
    const/4 v1, 0x0

    .line 91
    .local v1, "byUTF8":[B
    const-string v2, "utf-8"

    invoke-static {p0, v2}, Lvpos/apipackage/StringUtil;->getBytesFromString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v1

    .line 92
    const-string v2, "utf-8"

    invoke-static {v1, v2}, Lvpos/apipackage/StringUtil;->setBytesToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 94
    return-object v0
.end method

.method public static UTF8ToGBK(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "utf8String"    # Ljava/lang/String;

    .line 79
    const/4 v0, 0x0

    .line 81
    .local v0, "byGBK":[B
    const-string v1, "gbk"

    invoke-static {p0, v1}, Lvpos/apipackage/StringUtil;->getBytesFromString(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 82
    const-string v1, "gbk"

    invoke-static {v0, v1}, Lvpos/apipackage/StringUtil;->setBytesToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 84
    .local v1, "gbkString":Ljava/lang/String;
    return-object v1
.end method

.method public static bytesToHexString([BI)Ljava/lang/String;
    .registers 9
    .param p0, "src"    # [B
    .param p1, "len"    # I

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    if-eqz p0, :cond_2e

    array-length v1, p0

    if-gtz v1, :cond_d

    goto :goto_2e

    .line 20
    :cond_d
    const/4 v1, 0x0

    const/4 v2, 0x0

    .local v2, "i":I
    :goto_f
    if-ge v2, p1, :cond_29

    .line 21
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    .line 22
    .local v3, "v":I
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    .line 23
    .local v4, "hv":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x2

    if-ge v5, v6, :cond_23

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    :cond_23
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .end local v3    # "v":I
    .end local v4    # "hv":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 29
    .end local v2    # "i":I
    :cond_29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 17
    :cond_2e
    :goto_2e
    const/4 v1, 0x0

    return-object v1
.end method

.method private static charToByte(C)B
    .registers 2
    .param p0, "c"    # C

    .line 11
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method public static getBytesFromString(Ljava/lang/String;Ljava/lang/String;)[B
    .registers 4
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .line 52
    const/4 v0, 0x0

    .line 55
    .local v0, "retByte":[B
    :try_start_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_5} :catch_7

    move-object v0, v1

    .line 59
    goto :goto_b

    .line 56
    :catch_7
    move-exception v1

    .line 58
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 61
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_b
    return-object v0
.end method

.method public static hexStringToBytes(Ljava/lang/String;)[B
    .registers 8
    .param p0, "hexString"    # Ljava/lang/String;

    .line 33
    if-eqz p0, :cond_38

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_38

    .line 37
    :cond_b
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 40
    .local v0, "length":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 41
    .local v1, "hexChars":[C
    new-array v2, v0, [B

    .line 43
    .local v2, "by":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1c
    if-ge v3, v0, :cond_37

    .line 44
    mul-int/lit8 v4, v3, 0x2

    .line 45
    .local v4, "pos":I
    aget-char v5, v1, v4

    invoke-static {v5}, Lvpos/apipackage/StringUtil;->charToByte(C)B

    move-result v5

    shl-int/lit8 v5, v5, 0x4

    add-int/lit8 v6, v4, 0x1

    aget-char v6, v1, v6

    invoke-static {v6}, Lvpos/apipackage/StringUtil;->charToByte(C)B

    move-result v6

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v2, v3

    .line 43
    .end local v4    # "pos":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    .line 48
    .end local v3    # "i":I
    :cond_37
    return-object v2

    .line 34
    .end local v0    # "length":I
    .end local v1    # "hexChars":[C
    .end local v2    # "by":[B
    :cond_38
    :goto_38
    const/4 v0, 0x0

    return-object v0
.end method

.method public static printBytes([B)V
    .registers 9
    .param p0, "b"    # [B

    .line 98
    array-length v0, p0

    .line 99
    .local v0, "length":I
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "length: %d, bytes: "

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 100
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_17
    if-ge v1, v0, :cond_31

    .line 101
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "%02X "

    new-array v5, v3, [Ljava/lang/Object;

    aget-byte v7, p0, v1

    invoke-static {v7}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 100
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 104
    .end local v1    # "i":I
    :cond_31
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method public static printBytes([BI)V
    .registers 9
    .param p0, "b"    # [B
    .param p1, "len"    # I

    .line 108
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "length: %d, bytes: "

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 109
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    if-ge v0, p1, :cond_30

    .line 110
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "%02X "

    new-array v4, v2, [Ljava/lang/Object;

    aget-byte v6, p0, v0

    invoke-static {v6}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 109
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 113
    .end local v0    # "i":I
    :cond_30
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public static setBytesToString([BLjava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "src"    # [B
    .param p1, "charset"    # Ljava/lang/String;

    .line 65
    const-string v0, ""

    .line 68
    .local v0, "retString":Ljava/lang/String;
    :try_start_2
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_7} :catch_9

    move-object v0, v1

    .line 72
    goto :goto_d

    .line 69
    :catch_9
    move-exception v1

    .line 71
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 74
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_d
    return-object v0
.end method
