.class public Lvpos/apipackage/PosApiHelper;
.super Ljava/lang/Object;
.source "PosApiHelper.java"


# static fields
.field private static final AAR_VERSION:Ljava/lang/String; = "2.4.6"

.field private static final MAX_INTERVAL:I = 0x4e20

.field private static final MCU_NODE_FILE:Ljava/lang/String; = "/sys/devices/platform/mcu_dev/mcudev_pwren"

.field private static final MIN_INTERVAL:I = 0x4e20

.field private static final NODE_BATT_STATUS:Ljava/lang/String; = "/sys/class/power_supply/battery/status"

.field private static final NODE_BATT_VOL:Ljava/lang/String; = "/sys/class/power_supply/battery/batt_vol"

.field public static final PRINT_MAX_LEN:I = 0x270

.field private static final SET_LEFT_VOLUME_KEY_SCAN:Ljava/lang/String; = "android.intent.action.SET_LEFT_VOLUME_KEY_SCAN"

.field private static final SET_RIGHT_VOLUME_KEY_SCAN:Ljava/lang/String; = "android.intent.action.SET_RIGHT_VOLUME_KEY_SCAN"

.field public static TmpStr:Ljava/lang/String;

.field private static mBCRService:Ljava/lang/Object;

.field private static mInstance:Lvpos/apipackage/PosApiHelper;

.field private static final mLock:Ljava/lang/Object;


# instance fields
.field private BatteryV:I

.field private ret:I

.field private version:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 44
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lvpos/apipackage/PosApiHelper;->mLock:Ljava/lang/Object;

    .line 46
    invoke-static {}, Lvpos/apipackage/PosApiHelper;->getBCRService()Ljava/lang/Object;

    move-result-object v0

    sput-object v0, Lvpos/apipackage/PosApiHelper;->mBCRService:Ljava/lang/Object;

    .line 92
    const-string v0, ""

    sput-object v0, Lvpos/apipackage/PosApiHelper;->TmpStr:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/16 v0, 0x9

    new-array v0, v0, [B

    iput-object v0, p0, Lvpos/apipackage/PosApiHelper;->version:[B

    return-void
.end method

.method public static getBCRService()Ljava/lang/Object;
    .registers 9

    .line 1461
    :try_start_0
    const-string v0, "android.os.ServiceManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1462
    .local v0, "serviceManager":Ljava/lang/Class;
    const-string v1, "getService"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1463
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Object;

    const-string v6, "bcr_service"

    aput-object v6, v4, v5

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/IBinder;

    .line 1464
    .local v3, "b":Landroid/os/IBinder;
    const-string v4, "com.android.server.bcr.IBCRService$Stub"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 1465
    .local v4, "stub":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v6, "asInterface"

    new-array v7, v2, [Ljava/lang/Class;

    const-class v8, Landroid/os/IBinder;

    aput-object v8, v7, v5

    invoke-virtual {v4, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 1469
    .local v6, "asInterfaceMethod":Ljava/lang/reflect/Method;
    new-array v2, v2, [Ljava/lang/Object;

    aput-object v3, v2, v5

    invoke-virtual {v6, v4, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3e} :catch_3f

    return-object v2

    .line 1470
    .end local v0    # "serviceManager":Ljava/lang/Class;
    .end local v1    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "b":Landroid/os/IBinder;
    .end local v4    # "stub":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "asInterfaceMethod":Ljava/lang/reflect/Method;
    :catch_3f
    move-exception v0

    .line 1472
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1474
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getInstance()Lvpos/apipackage/PosApiHelper;
    .registers 4

    .line 110
    const-string v0, "vpos"

    const-string v1, "vpos PosApiHelper getInstance--------------------------------------------------------00>> "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_34

    .line 112
    .local v0, "baud":[B
    sget-object v1, Lvpos/apipackage/PosApiHelper;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 113
    :try_start_10
    sget-object v2, Lvpos/apipackage/PosApiHelper;->mInstance:Lvpos/apipackage/PosApiHelper;

    if-nez v2, :cond_1b

    .line 114
    new-instance v2, Lvpos/apipackage/PosApiHelper;

    invoke-direct {v2}, Lvpos/apipackage/PosApiHelper;-><init>()V

    sput-object v2, Lvpos/apipackage/PosApiHelper;->mInstance:Lvpos/apipackage/PosApiHelper;

    .line 116
    :cond_1b
    const-string v2, "vpos"

    const-string v3, "vpos PosApiHelper getInstance--------------------------------------------------------11>> "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-static {v0}, Lcom/cspos/PaySys;->LibAdapterUartBaud([B)I

    .line 118
    const-string v2, "vpos"

    const-string v3, "vpos PosApiHelper getInstance--------------------------------------------------------22>> "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    sget-object v2, Lvpos/apipackage/PosApiHelper;->mInstance:Lvpos/apipackage/PosApiHelper;

    monitor-exit v1

    return-object v2

    .line 120
    :catchall_30
    move-exception v2

    monitor-exit v1
    :try_end_32
    .catchall {:try_start_10 .. :try_end_32} :catchall_30

    throw v2

    nop

    :array_34
    .array-data 1
        0x33t
        0x33t
        0x33t
        0x33t
    .end array-data
.end method

.method public static installRomPackage(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "romFilePath"    # Ljava/lang/String;

    .line 1478
    const-string v0, "RomUtil"

    const-string v1, "installRomPackage - s"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1480
    const/4 v0, 0x0

    :try_start_8
    sget-object v1, Lvpos/apipackage/PosApiHelper;->mBCRService:Ljava/lang/Object;

    if-nez v1, :cond_12

    .line 1481
    invoke-static {}, Lvpos/apipackage/PosApiHelper;->getBCRService()Ljava/lang/Object;

    move-result-object v1

    sput-object v1, Lvpos/apipackage/PosApiHelper;->mBCRService:Ljava/lang/Object;

    .line 1482
    :cond_12
    sget-object v1, Lvpos/apipackage/PosApiHelper;->mBCRService:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "installPackage"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v0

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1484
    .local v1, "installPackage":Ljava/lang/reflect/Method;
    const-string v2, "RomUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "installPackage - ***********************"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lvpos/apipackage/PosApiHelper;->mBCRService:Ljava/lang/Object;

    new-array v6, v3, [Ljava/lang/Object;

    aput-object p1, v6, v0

    invoke-virtual {v1, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1486
    sget-object v2, Lvpos/apipackage/PosApiHelper;->mBCRService:Ljava/lang/Object;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v0

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_57} :catch_58

    return v2

    .line 1487
    .end local v1    # "installPackage":Ljava/lang/reflect/Method;
    :catch_58
    move-exception v1

    .line 1488
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "RomUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "installRomPackage :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1490
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 1492
    .end local v1    # "e":Ljava/lang/Exception;
    return v0
.end method

.method public static readSysBattCat(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "sys_path"    # Ljava/lang/String;

    .line 815
    const/4 v0, 0x0

    .line 816
    .local v0, "is":Ljava/io/InputStream;
    const/4 v1, 0x0

    .line 817
    .local v1, "isr":Ljava/io/InputStreamReader;
    const/4 v2, 0x0

    move-object v3, v2

    .line 820
    .local v3, "br":Ljava/io/BufferedReader;
    :try_start_4
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    .line 821
    .local v4, "runtime":Ljava/lang/Runtime;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cat "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    .line 822
    .local v5, "process":Ljava/lang/Process;
    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    move-object v0, v6

    .line 823
    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object v1, v6

    .line 824
    new-instance v6, Ljava/io/BufferedReader;

    invoke-direct {v6, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v3, v6

    .line 825
    const-string v6, ""

    .line 826
    .local v6, "line":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_34} :catch_74
    .catchall {:try_start_4 .. :try_end_34} :catchall_72

    move-object v6, v7

    if-eqz v7, :cond_55

    .line 829
    nop

    .line 835
    if-eqz v0, :cond_42

    .line 837
    :try_start_3a
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3d} :catch_3e

    .line 840
    goto :goto_42

    .line 838
    :catch_3e
    move-exception v2

    .line 839
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 842
    .end local v2    # "e":Ljava/io/IOException;
    :cond_42
    :goto_42
    nop

    .line 844
    :try_start_43
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_46} :catch_47

    .line 847
    goto :goto_4b

    .line 845
    :catch_47
    move-exception v2

    .line 846
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 849
    .end local v2    # "e":Ljava/io/IOException;
    :goto_4b
    nop

    .line 851
    :try_start_4c
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_4f} :catch_50

    .line 854
    goto :goto_54

    .line 852
    :catch_50
    move-exception v2

    .line 853
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 829
    .end local v2    # "e":Ljava/io/IOException;
    :goto_54
    return-object v6

    .line 835
    .end local v4    # "runtime":Ljava/lang/Runtime;
    .end local v5    # "process":Ljava/lang/Process;
    .end local v6    # "line":Ljava/lang/String;
    :cond_55
    if-eqz v0, :cond_5f

    .line 837
    :try_start_57
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_5a} :catch_5b

    .line 840
    goto :goto_5f

    .line 838
    :catch_5b
    move-exception v4

    .line 839
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 842
    .end local v4    # "e":Ljava/io/IOException;
    :cond_5f
    :goto_5f
    nop

    .line 844
    :try_start_60
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V
    :try_end_63
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_63} :catch_64

    .line 847
    goto :goto_68

    .line 845
    :catch_64
    move-exception v4

    .line 846
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 849
    .end local v4    # "e":Ljava/io/IOException;
    :goto_68
    nop

    .line 851
    :try_start_69
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_6c
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_6c} :catch_6d

    .line 854
    :goto_6c
    goto :goto_92

    .line 852
    :catch_6d
    move-exception v4

    .line 853
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .end local v4    # "e":Ljava/io/IOException;
    goto :goto_6c

    .line 835
    :catchall_72
    move-exception v2

    goto :goto_93

    .line 831
    :catch_74
    move-exception v4

    .line 832
    .restart local v4    # "e":Ljava/io/IOException;
    :try_start_75
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_78
    .catchall {:try_start_75 .. :try_end_78} :catchall_72

    .line 835
    .end local v4    # "e":Ljava/io/IOException;
    if-eqz v0, :cond_82

    .line 837
    :try_start_7a
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_7d
    .catch Ljava/io/IOException; {:try_start_7a .. :try_end_7d} :catch_7e

    .line 840
    goto :goto_82

    .line 838
    :catch_7e
    move-exception v4

    .line 839
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 842
    .end local v4    # "e":Ljava/io/IOException;
    :cond_82
    :goto_82
    if-eqz v1, :cond_8c

    .line 844
    :try_start_84
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V
    :try_end_87
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_87} :catch_88

    .line 847
    goto :goto_8c

    .line 845
    :catch_88
    move-exception v4

    .line 846
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 849
    .end local v4    # "e":Ljava/io/IOException;
    :cond_8c
    :goto_8c
    if-eqz v3, :cond_92

    .line 851
    :try_start_8e
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_91
    .catch Ljava/io/IOException; {:try_start_8e .. :try_end_91} :catch_6d

    goto :goto_6c

    .line 858
    :cond_92
    :goto_92
    return-object v2

    .line 835
    :goto_93
    if-eqz v0, :cond_9d

    .line 837
    :try_start_95
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_95 .. :try_end_98} :catch_99

    .line 840
    goto :goto_9d

    .line 838
    :catch_99
    move-exception v4

    .line 839
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 842
    .end local v4    # "e":Ljava/io/IOException;
    :cond_9d
    :goto_9d
    if-eqz v1, :cond_a7

    .line 844
    :try_start_9f
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V
    :try_end_a2
    .catch Ljava/io/IOException; {:try_start_9f .. :try_end_a2} :catch_a3

    .line 847
    goto :goto_a7

    .line 845
    :catch_a3
    move-exception v4

    .line 846
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 849
    .end local v4    # "e":Ljava/io/IOException;
    :cond_a7
    :goto_a7
    if-eqz v3, :cond_b1

    .line 851
    :try_start_a9
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_ac
    .catch Ljava/io/IOException; {:try_start_a9 .. :try_end_ac} :catch_ad

    .line 854
    goto :goto_b1

    .line 852
    :catch_ad
    move-exception v4

    .line 853
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 856
    .end local v4    # "e":Ljava/io/IOException;
    :cond_b1
    :goto_b1
    throw v2
.end method

.method public static readSysBattFile(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "sys_path"    # Ljava/lang/String;

    .line 789
    const-string v0, ""

    .line 790
    .local v0, "data":Ljava/lang/String;
    const/4 v1, 0x0

    .line 792
    .local v1, "reader":Ljava/io/BufferedReader;
    :try_start_3
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/FileReader;

    invoke-direct {v3, p0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v1, v2

    .line 793
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_12} :catch_1f
    .catchall {:try_start_3 .. :try_end_12} :catchall_1d

    move-object v0, v2

    .line 798
    nop

    .line 800
    :try_start_14
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_17} :catch_18

    .line 803
    :goto_17
    goto :goto_29

    .line 801
    :catch_18
    move-exception v2

    .line 802
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .end local v2    # "e":Ljava/io/IOException;
    goto :goto_17

    .line 798
    :catchall_1d
    move-exception v2

    goto :goto_2a

    .line 794
    :catch_1f
    move-exception v2

    .line 795
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_20
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_23
    .catchall {:try_start_20 .. :try_end_23} :catchall_1d

    .line 798
    .end local v2    # "e":Ljava/io/IOException;
    if-eqz v1, :cond_29

    .line 800
    :try_start_25
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_28} :catch_18

    goto :goto_17

    .line 807
    :cond_29
    :goto_29
    return-object v0

    .line 798
    :goto_2a
    if-eqz v1, :cond_34

    .line 800
    :try_start_2c
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2f} :catch_30

    .line 803
    goto :goto_34

    .line 801
    :catch_30
    move-exception v3

    .line 802
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 805
    .end local v3    # "e":Ljava/io/IOException;
    :cond_34
    :goto_34
    throw v2
.end method


# virtual methods
.method public Des([B[B[BI)I
    .registers 6
    .param p1, "input"    # [B
    .param p2, "output"    # [B
    .param p3, "deskey"    # [B
    .param p4, "mode"    # I

    .line 97
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Sys;->Lib_Des([B[B[BI)I

    move-result v0

    return v0
.end method

.method public EntryPoint_Close()I
    .registers 2

    .line 278
    invoke-static {}, Lvpos/apipackage/Sys;->Lib_SetEntryModeClose()I

    move-result v0

    return v0
.end method

.method public EntryPoint_Detect()I
    .registers 2

    .line 267
    invoke-static {}, Lvpos/apipackage/Picc;->Lib_EntryPoint()I

    move-result v0

    .line 269
    .local v0, "ret":I
    return v0
.end method

.method public EntryPoint_Open()I
    .registers 2

    .line 274
    invoke-static {}, Lvpos/apipackage/Sys;->Lib_SetEntryModeOpen()I

    move-result v0

    return v0
.end method

.method public IccApduCmd(B[BS[B[B)I
    .registers 7
    .param p1, "slot"    # B
    .param p2, "pbInApdu"    # [B
    .param p3, "usInApduLen"    # S
    .param p4, "pbOut"    # [B
    .param p5, "pbOutLen"    # [B

    .line 185
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Icc;->Lib_IccApduCmd(B[BS[B[B)I

    move-result v0

    return v0
.end method

.method public IccCheck(B)I
    .registers 3
    .param p1, "slot"    # B

    .line 135
    invoke-static {p1}, Lvpos/apipackage/Icc;->Lib_IccCheck(B)I

    move-result v0

    return v0
.end method

.method public IccClose(B)I
    .registers 3
    .param p1, "slot"    # B

    .line 198
    invoke-static {p1}, Lvpos/apipackage/Icc;->Lib_IccClose(B)I

    move-result v0

    return v0
.end method

.method public IccCommand(B[B[B)I
    .registers 5
    .param p1, "slot"    # B
    .param p2, "apduSend"    # [B
    .param p3, "apduResp"    # [B

    .line 181
    invoke-static {p1, p2, p3}, Lvpos/apipackage/Icc;->Lib_IccCommand(B[B[B)I

    move-result v0

    return v0
.end method

.method public IccOpen(BB[B)I
    .registers 5
    .param p1, "slot"    # B
    .param p2, "vccMode"    # B
    .param p3, "atr"    # [B

    .line 158
    invoke-static {p1, p2, p3}, Lvpos/apipackage/Icc;->Lib_IccOpen(BB[B)I

    move-result v0

    return v0
.end method

.method public McrCheck()I
    .registers 2

    .line 459
    invoke-static {}, Lvpos/apipackage/Mcr;->Lib_McrCheck()I

    move-result v0

    return v0
.end method

.method public McrClose()I
    .registers 2

    .line 429
    invoke-static {}, Lvpos/apipackage/Mcr;->Lib_McrClose()I

    move-result v0

    return v0
.end method

.method public McrOpen()I
    .registers 2

    .line 439
    invoke-static {}, Lvpos/apipackage/Mcr;->Lib_McrOpen()I

    move-result v0

    return v0
.end method

.method public McrRead(BB[B[B[B)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "mode"    # B
    .param p3, "track1"    # [B
    .param p4, "track2"    # [B
    .param p5, "track3"    # [B

    .line 480
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Mcr;->Lib_McrRead(BB[B[B[B)I

    move-result v0

    return v0
.end method

.method public McrReset()I
    .registers 2

    .line 449
    invoke-static {}, Lvpos/apipackage/Mcr;->Lib_McrReset()I

    move-result v0

    return v0
.end method

.method public PciAesHandle(II[B[BI[BI[B)I
    .registers 10
    .param p1, "Flag"    # I
    .param p2, "Mode"    # I
    .param p3, "IV"    # [B
    .param p4, "key"    # [B
    .param p5, "KeyType"    # I
    .param p6, "Src"    # [B
    .param p7, "SrcLen"    # I
    .param p8, "Out"    # [B

    .line 1333
    invoke-static/range {p1 .. p8}, Lvpos/apipackage/Pci;->Lib_PciAesHandle(II[B[BI[BI[B)I

    move-result v0

    return v0
.end method

.method public PciEncryptPin(BS[B[B)I
    .registers 6
    .param p1, "keyNo"    # B
    .param p2, "inLen"    # S
    .param p3, "inData"    # [B
    .param p4, "outData"    # [B

    .line 1496
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Pci;->Lib_PciEncryptPin(BS[B[B)I

    move-result v0

    return v0
.end method

.method public PciGetDes(BS[B[BB)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "inLen"    # S
    .param p3, "inData"    # [B
    .param p4, "outData"    # [B
    .param p5, "mode"    # B

    .line 1259
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciGetDes(BS[B[BB)I

    move-result v0

    return v0
.end method

.method public PciGetKLKDes(BS[B[BB)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "inLen"    # S
    .param p3, "inData"    # [B
    .param p4, "outData"    # [B
    .param p5, "mode"    # B

    .line 1263
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciGetKLKDes(BS[B[BB)I

    move-result v0

    return v0
.end method

.method public PciGetKLKMac(BS[B[BB)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "inLen"    # S
    .param p3, "inData"    # [B
    .param p4, "macOut"    # [B
    .param p5, "mode"    # B

    .line 1235
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciGetKLKMac(BS[B[BB)I

    move-result v0

    return v0
.end method

.method public PciGetKLKPin(BBBB[B[B[BBB[BBLandroid/content/Context;)I
    .registers 14
    .param p1, "keyNo"    # B
    .param p2, "minLen"    # B
    .param p3, "maxLen"    # B
    .param p4, "mode"    # B
    .param p5, "cardNo"    # [B
    .param p6, "pinBlock"    # [B
    .param p7, "pinPasswd"    # [B
    .param p8, "pin_len"    # B
    .param p9, "mark"    # B
    .param p10, "iAmount"    # [B
    .param p11, "waitTimeSec"    # B
    .param p12, "ctx"    # Landroid/content/Context;

    .line 1208
    invoke-static/range {p1 .. p12}, Lvpos/apipackage/Pci;->Lib_PciGetKLKPin(BBBB[B[B[BBB[BBLandroid/content/Context;)I

    move-result v0

    return v0
.end method

.method public PciGetKcv([B[B)I
    .registers 4
    .param p1, "output"    # [B
    .param p2, "deskey"    # [B

    .line 1281
    invoke-static {p1, p2}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    move-result v0

    return v0
.end method

.method public PciGetMac(BS[B[BB)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "inLen"    # S
    .param p3, "inData"    # [B
    .param p4, "macOut"    # [B
    .param p5, "mode"    # B

    .line 1232
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciGetMac(BS[B[BB)I

    move-result v0

    return v0
.end method

.method public PciGetPin(BBBB[B[B[BBB[BBLandroid/content/Context;)I
    .registers 14
    .param p1, "keyNo"    # B
    .param p2, "minLen"    # B
    .param p3, "maxLen"    # B
    .param p4, "mode"    # B
    .param p5, "cardNo"    # [B
    .param p6, "pinBlock"    # [B
    .param p7, "pinPasswd"    # [B
    .param p8, "pin_len"    # B
    .param p9, "mark"    # B
    .param p10, "iAmount"    # [B
    .param p11, "waitTimeSec"    # B
    .param p12, "ctx"    # Landroid/content/Context;

    .line 1204
    invoke-static/range {p1 .. p12}, Lvpos/apipackage/Pci;->Lib_PciGetPin(BBBB[B[B[BBB[BBLandroid/content/Context;)I

    move-result v0

    return v0
.end method

.method public PciGetRnd([B)I
    .registers 3
    .param p1, "rnd"    # [B

    .line 1277
    invoke-static {p1}, Lvpos/apipackage/Pci;->Lib_PciGetRnd([B)I

    move-result v0

    return v0
.end method

.method public PciGetSelPalDes(BS[B[BB)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "inLen"    # S
    .param p3, "inData"    # [B
    .param p4, "outData"    # [B
    .param p5, "mode"    # B

    .line 1267
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciGetSelPalDes(BS[B[BB)I

    move-result v0

    return v0
.end method

.method public PciGetSelPalMac(BS[B[BB)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "inLen"    # S
    .param p3, "inData"    # [B
    .param p4, "macOut"    # [B
    .param p5, "mode"    # B

    .line 1238
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciGetSelPalMac(BS[B[BB)I

    move-result v0

    return v0
.end method

.method public PciReadKcv(BB[B)I
    .registers 6
    .param p1, "mkey_no"    # B
    .param p2, "key_type"    # B
    .param p3, "jmkey_kcv"    # [B

    .line 1150
    const-string v0, "VPOS"

    const-string v1, "PciReadKcv: ---0000"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1151
    invoke-static {p1, p2, p3}, Lvpos/apipackage/Pci;->Lib_PciReadKcv(BB[B)I

    .line 1152
    const/4 v0, 0x0

    return v0
.end method

.method public PciRsaDecrypt(I[B[B[B[B)I
    .registers 7
    .param p1, "uiKeyBits"    # I
    .param p2, "n"    # [B
    .param p3, "d"    # [B
    .param p4, "CIPHERTEXT"    # [B
    .param p5, "PLAINTEXT"    # [B

    .line 1318
    invoke-static {p1, p2, p3, p5, p4}, Lvpos/apipackage/Pci;->Lib_PciRsaDecrypt(I[B[B[B[B)I

    move-result v0

    return v0
.end method

.method public PciRsaEncrypt(I[B[B[B)I
    .registers 6
    .param p1, "uiKeyBits"    # I
    .param p2, "n"    # [B
    .param p3, "PLAINTEXT"    # [B
    .param p4, "CIPHERTEXT"    # [B

    .line 1306
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Pci;->Lib_PciRsaEncrypt(I[B[B[B)I

    move-result v0

    return v0
.end method

.method public PciRsaGenKeyPair(I[B[B[B[B)I
    .registers 7
    .param p1, "uiKeyBits"    # I
    .param p2, "n"    # [B
    .param p3, "p"    # [B
    .param p4, "q"    # [B
    .param p5, "d"    # [B

    .line 1295
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciRsaGenKeyPair(I[B[B[B[B)I

    move-result v0

    return v0
.end method

.method public PciTriDes(II[B[BI[BI[B)I
    .registers 11
    .param p1, "Flag"    # I
    .param p2, "Mode"    # I
    .param p3, "IV"    # [B
    .param p4, "key"    # [B
    .param p5, "KeyType"    # I
    .param p6, "Src"    # [B
    .param p7, "SrcLen"    # I
    .param p8, "Out"    # [B

    .line 1271
    const-string v0, "PciTriDes"

    const-string v1, "PciTriDes: ---into"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1272
    invoke-static/range {p1 .. p8}, Lvpos/apipackage/Pci;->Lib_PciTriDesHandle(II[B[BI[BI[B)I

    move-result v0

    return v0
.end method

.method public PciWriteDES_KLKKey(BB[BB[B)I
    .registers 11
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkey_kcv"    # [B

    .line 980
    const/16 v0, 0x20

    new-array v1, v0, [B

    .line 981
    .local v1, "Jmkey_kcv":[B
    const/4 v2, 0x0

    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v0, :cond_d

    .line 982
    aput-byte v2, v1, v3

    .line 981
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 984
    .end local v3    # "i":I
    :cond_d
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Pci;->Lib_PciWriteDES_MKey(BB[BB)I

    .line 985
    invoke-static {v1, p3}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    .line 986
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_14
    if-ge v3, v0, :cond_1d

    .line 987
    aget-byte v4, v1, v3

    aput-byte v4, p5, v3

    .line 986
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 989
    .end local v3    # "i":I
    :cond_1d
    return v2
.end method

.method public PciWriteDES_MKey(BB[BB)I
    .registers 6
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B

    .line 956
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Pci;->Lib_PciWriteDES_MKey(BB[BB)I

    move-result v0

    return v0
.end method

.method public PciWriteDesKey(BB[BBB)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkeyNo"    # B

    .line 1113
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciWriteDesKey(BB[BBB)I

    move-result v0

    return v0
.end method

.method public PciWriteDesKey_HostMK(BB[BBB[B)I
    .registers 19
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkeyNo"    # B
    .param p6, "mkey_kcv"    # [B

    .line 1037
    const/16 v0, 0x20

    new-array v8, v0, [B

    .line 1038
    .local v8, "deskey":[B
    new-array v9, v0, [B

    .line 1039
    .local v9, "Jmkey_kcv":[B
    const/4 v10, 0x0

    .line 1040
    .local v10, "main_flag":B
    const/4 v11, 0x0

    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v0, :cond_12

    .line 1041
    aput-byte v11, v8, v1

    .line 1042
    aput-byte v11, v9, v1

    .line 1040
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 1044
    .end local v1    # "i":I
    :cond_12
    move v1, p1

    move v2, p2

    move-object v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object v6, v8

    move v7, v10

    invoke-static/range {v1 .. v7}, Lvpos/apipackage/Pci;->Lib_PciWriteKLKDesKey(BB[BBB[BB)I

    .line 1045
    invoke-static {v9, v8}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    .line 1046
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_22
    if-ge v1, v0, :cond_2b

    .line 1047
    aget-byte v2, v9, v1

    aput-byte v2, p6, v1

    .line 1046
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 1049
    .end local v1    # "i":I
    :cond_2b
    return v11
.end method

.method public PciWriteDesKey_HostWK(BB[BBB[B)I
    .registers 19
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkeyNo"    # B
    .param p6, "mkey_kcv"    # [B

    .line 1134
    const/16 v0, 0x20

    new-array v8, v0, [B

    .line 1135
    .local v8, "deskey":[B
    new-array v9, v0, [B

    .line 1136
    .local v9, "Jmkey_kcv":[B
    const/4 v10, 0x1

    .line 1137
    .local v10, "work_flag":B
    const/4 v11, 0x0

    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v0, :cond_12

    .line 1138
    aput-byte v11, v8, v1

    .line 1139
    aput-byte v11, v9, v1

    .line 1137
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 1141
    .end local v1    # "i":I
    :cond_12
    move v1, p1

    move v2, p2

    move-object v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object v6, v8

    move v7, v10

    invoke-static/range {v1 .. v7}, Lvpos/apipackage/Pci;->Lib_PciWriteKLKDesKey(BB[BBB[BB)I

    .line 1142
    invoke-static {v9, v8}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    .line 1143
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_22
    if-ge v1, v0, :cond_2b

    .line 1144
    aget-byte v2, v9, v1

    aput-byte v2, p6, v1

    .line 1143
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 1146
    .end local v1    # "i":I
    :cond_2b
    return v11
.end method

.method public PciWriteMAC_KLKKey(BB[BB[B)I
    .registers 11
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkey_kcv"    # [B

    .line 993
    const/16 v0, 0x20

    new-array v1, v0, [B

    .line 994
    .local v1, "Jmkey_kcv":[B
    const/4 v2, 0x0

    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v0, :cond_d

    .line 995
    aput-byte v2, v1, v3

    .line 994
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 997
    .end local v3    # "i":I
    :cond_d
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Pci;->Lib_PciWriteMAC_MKey(BB[BB)I

    .line 998
    invoke-static {v1, p3}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    .line 999
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_14
    if-ge v3, v0, :cond_1d

    .line 1000
    aget-byte v4, v1, v3

    aput-byte v4, p5, v3

    .line 999
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 1002
    .end local v3    # "i":I
    :cond_1d
    return v2
.end method

.method public PciWriteMAC_MKey(BB[BB)I
    .registers 6
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B

    .line 935
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Pci;->Lib_PciWriteMAC_MKey(BB[BB)I

    move-result v0

    return v0
.end method

.method public PciWriteMacKey(BB[BBB)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkeyNo"    # B

    .line 1089
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciWriteMacKey(BB[BBB)I

    move-result v0

    return v0
.end method

.method public PciWriteMacKey_HostMK(BB[BBB[B)I
    .registers 19
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkeyNo"    # B
    .param p6, "mkey_kcv"    # [B

    .line 1053
    const/16 v0, 0x20

    new-array v8, v0, [B

    .line 1054
    .local v8, "deskey":[B
    new-array v9, v0, [B

    .line 1055
    .local v9, "Jmkey_kcv":[B
    const/4 v10, 0x0

    .line 1056
    .local v10, "main_flag":B
    const/4 v11, 0x0

    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v0, :cond_12

    .line 1057
    aput-byte v11, v8, v1

    .line 1058
    aput-byte v11, v9, v1

    .line 1056
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 1060
    .end local v1    # "i":I
    :cond_12
    move v1, p1

    move v2, p2

    move-object v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object v6, v8

    move v7, v10

    invoke-static/range {v1 .. v7}, Lvpos/apipackage/Pci;->Lib_PciWriteKLKMacKey(BB[BBB[BB)I

    .line 1061
    invoke-static {v9, v8}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    .line 1062
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_22
    if-ge v1, v0, :cond_2b

    .line 1063
    aget-byte v2, v9, v1

    aput-byte v2, p6, v1

    .line 1062
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 1065
    .end local v1    # "i":I
    :cond_2b
    return v11
.end method

.method public PciWriteMacKey_HostWK(BB[BBB[B)I
    .registers 19
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkeyNo"    # B
    .param p6, "mkey_kcv"    # [B

    .line 1117
    const/16 v0, 0x20

    new-array v8, v0, [B

    .line 1118
    .local v8, "deskey":[B
    new-array v9, v0, [B

    .line 1119
    .local v9, "Jmkey_kcv":[B
    const/4 v10, 0x1

    .line 1120
    .local v10, "work_flag":B
    const/4 v11, 0x0

    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v0, :cond_12

    .line 1121
    aput-byte v11, v8, v1

    .line 1122
    aput-byte v11, v9, v1

    .line 1120
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 1125
    .end local v1    # "i":I
    :cond_12
    move v1, p1

    move v2, p2

    move-object v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object v6, v8

    move v7, v10

    invoke-static/range {v1 .. v7}, Lvpos/apipackage/Pci;->Lib_PciWriteKLKMacKey(BB[BBB[BB)I

    .line 1126
    invoke-static {v9, v8}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    .line 1127
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_22
    if-ge v1, v0, :cond_2b

    .line 1128
    aget-byte v2, v9, v1

    aput-byte v2, p6, v1

    .line 1127
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 1130
    .end local v1    # "i":I
    :cond_2b
    return v11
.end method

.method public PciWritePIN_KLKKey(BB[BB[B)I
    .registers 11
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkey_kcv"    # [B

    .line 1006
    const/16 v0, 0x20

    new-array v1, v0, [B

    .line 1007
    .local v1, "Jmkey_kcv":[B
    const/4 v2, 0x0

    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v0, :cond_d

    .line 1008
    aput-byte v2, v1, v3

    .line 1007
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 1010
    .end local v3    # "i":I
    :cond_d
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Pci;->Lib_PciWritePIN_MKey(BB[BB)I

    .line 1011
    invoke-static {v1, p3}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    .line 1012
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_14
    if-ge v3, v0, :cond_1d

    .line 1013
    aget-byte v4, v1, v3

    aput-byte v4, p5, v3

    .line 1012
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 1015
    .end local v3    # "i":I
    :cond_1d
    return v2
.end method

.method public PciWritePIN_MKey(BB[BB)I
    .registers 6
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B

    .line 914
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Pci;->Lib_PciWritePIN_MKey(BB[BB)I

    move-result v0

    return v0
.end method

.method public PciWritePinKey(BB[BBB)I
    .registers 7
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkeyNo"    # B

    .line 1018
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Pci;->Lib_PciWritePinKey(BB[BBB)I

    move-result v0

    return v0
.end method

.method public PciWritePinKey_HostMK(BB[BBB[B)I
    .registers 19
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkeyNo"    # B
    .param p6, "mkey_kcv"    # [B

    .line 1021
    const/16 v0, 0x20

    new-array v8, v0, [B

    .line 1022
    .local v8, "deskey":[B
    new-array v9, v0, [B

    .line 1023
    .local v9, "Jmkey_kcv":[B
    const/4 v10, 0x0

    .line 1024
    .local v10, "main_flag":B
    const/4 v11, 0x0

    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v0, :cond_12

    .line 1025
    aput-byte v11, v8, v1

    .line 1026
    aput-byte v11, v9, v1

    .line 1024
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 1028
    .end local v1    # "i":I
    :cond_12
    move v1, p1

    move v2, p2

    move-object v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object v6, v8

    move v7, v10

    invoke-static/range {v1 .. v7}, Lvpos/apipackage/Pci;->Lib_PciWriteKLKPinKey(BB[BBB[BB)I

    .line 1029
    invoke-static {v9, v8}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    .line 1030
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_22
    if-ge v1, v0, :cond_2b

    .line 1031
    aget-byte v2, v9, v1

    aput-byte v2, p6, v1

    .line 1030
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 1033
    .end local v1    # "i":I
    :cond_2b
    return v11
.end method

.method public PciWritePinKey_HostWK(BB[BBB[B)I
    .registers 19
    .param p1, "keyNo"    # B
    .param p2, "keyLen"    # B
    .param p3, "keyData"    # [B
    .param p4, "mode"    # B
    .param p5, "mkeyNo"    # B
    .param p6, "mkey_kcv"    # [B

    .line 1156
    const/16 v0, 0x20

    new-array v8, v0, [B

    .line 1157
    .local v8, "deskey":[B
    new-array v9, v0, [B

    .line 1158
    .local v9, "Jmkey_kcv":[B
    const/4 v10, 0x1

    .line 1159
    .local v10, "work_flag":B
    const/4 v11, 0x0

    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v0, :cond_12

    .line 1160
    aput-byte v11, v8, v1

    .line 1161
    aput-byte v11, v9, v1

    .line 1159
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 1163
    .end local v1    # "i":I
    :cond_12
    move v1, p1

    move v2, p2

    move-object v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object v6, v8

    move v7, v10

    invoke-static/range {v1 .. v7}, Lvpos/apipackage/Pci;->Lib_PciWriteKLKPinKey(BB[BBB[BB)I

    .line 1164
    invoke-static {v9, v8}, Lvpos/apipackage/Pci;->Lib_PciGetTDES([B[B)I

    .line 1165
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_22
    if-ge v1, v0, :cond_2b

    .line 1166
    aget-byte v2, v9, v1

    aput-byte v2, p6, v1

    .line 1165
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 1168
    .end local v1    # "i":I
    :cond_2b
    return v11
.end method

.method public PiccCheck(B[B[B)I
    .registers 5
    .param p1, "mode"    # B
    .param p2, "cardType"    # [B
    .param p3, "serialNo"    # [B

    .line 250
    invoke-static {p1, p2, p3}, Lvpos/apipackage/Picc;->Lib_PiccCheck(B[B[B)I

    move-result v0

    return v0
.end method

.method public PiccClose()I
    .registers 2

    .line 292
    invoke-static {}, Lvpos/apipackage/Picc;->Lib_PiccClose()I

    move-result v0

    return v0
.end method

.method public PiccCommand([B[B)I
    .registers 4
    .param p1, "apduSend"    # [B
    .param p2, "apduResp"    # [B

    .line 264
    invoke-static {p1, p2}, Lvpos/apipackage/Picc;->Lib_PiccCommand([B[B)I

    move-result v0

    return v0
.end method

.method public PiccHalt()I
    .registers 2

    .line 315
    invoke-static {}, Lvpos/apipackage/Picc;->Lib_PiccHalt()I

    move-result v0

    return v0
.end method

.method public PiccM1Authority(BB[B[B)I
    .registers 6
    .param p1, "type"    # B
    .param p2, "blkNo"    # B
    .param p3, "pwd"    # [B
    .param p4, "serialNo"    # [B

    .line 361
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Picc;->Lib_PiccM1Authority(BB[B[B)I

    move-result v0

    return v0
.end method

.method public PiccM1Operate(BB[BB)I
    .registers 6
    .param p1, "type"    # B
    .param p2, "blkNo"    # B
    .param p3, "value"    # [B
    .param p4, "updateBlkNo"    # B

    .line 410
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Picc;->Lib_PiccM1Operate(BB[BB)I

    move-result v0

    return v0
.end method

.method public PiccM1ReadBlock(I[B)I
    .registers 4
    .param p1, "blkNo"    # I
    .param p2, "blkValue"    # [B

    .line 375
    int-to-byte v0, p1

    invoke-static {v0, p2}, Lvpos/apipackage/Picc;->Lib_PiccM1ReadBlock(B[B)I

    move-result v0

    return v0
.end method

.method public PiccM1ReadValue(I[B)I
    .registers 4
    .param p1, "blkNo"    # I
    .param p2, "value"    # [B

    .line 418
    invoke-static {p1, p2}, Lvpos/apipackage/Picc;->Lib_PiccM1ReadValue(I[B)I

    move-result v0

    return v0
.end method

.method public PiccM1WriteBlock(I[B)I
    .registers 4
    .param p1, "blkNo"    # I
    .param p2, "blkValue"    # [B

    .line 388
    int-to-byte v0, p1

    invoke-static {v0, p2}, Lvpos/apipackage/Picc;->Lib_PiccM1WriteBlock(B[B)I

    move-result v0

    return v0
.end method

.method public PiccM1WriteValue(I[B)I
    .registers 4
    .param p1, "blkNo"    # I
    .param p2, "value"    # [B

    .line 414
    invoke-static {p1, p2}, Lvpos/apipackage/Picc;->Lib_PiccM1WriteValue(I[B)I

    move-result v0

    return v0
.end method

.method public PiccNfc([B[B[B[B)I
    .registers 6
    .param p1, "NfcData_Len"    # [B
    .param p2, "Technology"    # [B
    .param p3, "UID"    # [B
    .param p4, "NDEF_message"    # [B

    .line 338
    invoke-static {p1, p2, p3, p4}, Lvpos/apipackage/Picc;->Lib_PiccNfc([B[B[B[B)I

    move-result v0

    return v0
.end method

.method public PiccOpen()I
    .registers 2

    .line 209
    invoke-static {}, Lvpos/apipackage/Picc;->Lib_PiccOpen()I

    move-result v0

    return v0
.end method

.method public PiccPoll([B[B[B[B[B[B)I
    .registers 8
    .param p1, "CardType"    # [B
    .param p2, "UID"    # [B
    .param p3, "ucUIDLen"    # [B
    .param p4, "ATS"    # [B
    .param p5, "ucATSLen"    # [B
    .param p6, "SAK"    # [B

    .line 342
    invoke-static/range {p1 .. p6}, Lvpos/apipackage/Picc;->Lib_PiccPolling([B[B[B[B[B[B)I

    move-result v0

    return v0
.end method

.method public PiccRemove()I
    .registers 2

    .line 304
    invoke-static {}, Lvpos/apipackage/Picc;->Lib_PiccRemove()I

    move-result v0

    return v0
.end method

.method public PiccReset()I
    .registers 2

    .line 326
    invoke-static {}, Lvpos/apipackage/Picc;->Lib_PiccReset()I

    move-result v0

    return v0
.end method

.method public PrintBarcode(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)I
    .registers 6
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "desiredWidth"    # I
    .param p3, "desiredHeight"    # I
    .param p4, "barcodeFormat"    # Lcom/google/zxing/BarcodeFormat;

    .line 885
    new-instance v0, Lvpos/apipackage/Print;

    invoke-direct {v0}, Lvpos/apipackage/Print;-><init>()V

    invoke-virtual {v0, p1, p2, p3, p4}, Lvpos/apipackage/Print;->Lib_PrnBarcode(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)I

    move-result v0

    return v0
.end method

.method public PrintBmp(Landroid/graphics/Bitmap;)I
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .line 869
    new-instance v0, Lvpos/apipackage/Print;

    invoke-direct {v0}, Lvpos/apipackage/Print;-><init>()V

    invoke-virtual {v0, p1}, Lvpos/apipackage/Print;->Lib_PrnBmp(Landroid/graphics/Bitmap;)I

    move-result v0

    return v0
.end method

.method public PrintCheckStatus()I
    .registers 4

    .line 572
    const-string v0, "/sys/class/power_supply/battery/batt_vol"

    invoke-static {v0}, Lvpos/apipackage/PosApiHelper;->readSysBattFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 574
    .local v0, "voltage":I
    const-string v1, "Charging"

    const-string v2, "/sys/class/power_supply/battery/status"

    invoke-static {v2}, Lvpos/apipackage/PosApiHelper;->readSysBattFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    .line 576
    const/4 v1, 0x0

    invoke-static {v1}, Lvpos/apipackage/Print;->Lib_PrnIsCharge(I)I

    goto :goto_21

    .line 582
    :cond_1d
    const/4 v1, 0x1

    invoke-static {v1}, Lvpos/apipackage/Print;->Lib_PrnIsCharge(I)I

    .line 585
    :goto_21
    mul-int/lit8 v1, v0, 0x2

    div-int/lit8 v1, v1, 0x64

    invoke-static {v1}, Lvpos/apipackage/Print;->Lib_PrnSetVoltage(I)I

    move-result v1

    .line 589
    .local v1, "ret":I
    if-eqz v1, :cond_2c

    .line 590
    return v1

    .line 593
    :cond_2c
    invoke-static {}, Lvpos/apipackage/Print;->Lib_PrnCheckStatus()I

    move-result v2

    return v2
.end method

.method public PrintClose()I
    .registers 2

    .line 635
    invoke-static {}, Lvpos/apipackage/Print;->Lib_PrnClose()I

    move-result v0

    return v0
.end method

.method public PrintCtnStart()I
    .registers 3

    .line 598
    const/4 v0, -0x1

    .line 607
    .local v0, "ret":I
    invoke-virtual {p0}, Lvpos/apipackage/PosApiHelper;->PrintCheckStatus()I

    move-result v0

    .line 611
    if-eqz v0, :cond_8

    .line 628
    return v0

    .line 631
    :cond_8
    invoke-static {}, Lvpos/apipackage/Print;->Lib_CTNPrnStart()I

    move-result v1

    return v1
.end method

.method public PrintCutQrCode_Str(Ljava/lang/String;Ljava/lang/String;IIILcom/google/zxing/BarcodeFormat;)I
    .registers 14
    .param p1, "qrContent"    # Ljava/lang/String;
    .param p2, "printTxt"    # Ljava/lang/String;
    .param p3, "distance"    # I
    .param p4, "desiredWidth"    # I
    .param p5, "desiredHeight"    # I
    .param p6, "barcodeFormat"    # Lcom/google/zxing/BarcodeFormat;

    .line 893
    new-instance v0, Lvpos/apipackage/Print;

    invoke-direct {v0}, Lvpos/apipackage/Print;-><init>()V

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lvpos/apipackage/Print;->printCutQrCodeStr(Ljava/lang/String;Ljava/lang/String;IIILcom/google/zxing/BarcodeFormat;)I

    move-result v0

    return v0
.end method

.method public PrintInit()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lvpos/apipackage/PrintInitException;
        }
    .end annotation

    .line 495
    const/16 v0, 0x18

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v0, v2}, Lvpos/apipackage/PosApiHelper;->PrintInit(IIII)I

    move-result v0

    .line 496
    .local v0, "ret":I
    if-nez v0, :cond_b

    .line 500
    return v0

    .line 497
    :cond_b
    new-instance v1, Lvpos/apipackage/PrintInitException;

    invoke-direct {v1, v0}, Lvpos/apipackage/PrintInitException;-><init>(I)V

    throw v1
.end method

.method public PrintInit(IIII)I
    .registers 9
    .param p1, "gray"    # I
    .param p2, "fontHeight"    # I
    .param p3, "fontWidth"    # I
    .param p4, "fontZoom"    # I

    .line 514
    const/4 v0, -0x1

    .line 518
    .local v0, "ret":I
    invoke-static {}, Lvpos/apipackage/Print;->Lib_PrnInit()I

    move-result v0

    .line 520
    if-eqz v0, :cond_8

    .line 522
    return v0

    .line 534
    :cond_8
    invoke-static {p1}, Lvpos/apipackage/Print;->Lib_PrnSetGray(I)I

    move-result v0

    .line 535
    if-eqz v0, :cond_f

    .line 536
    return v0

    .line 540
    :cond_f
    int-to-byte v1, p2

    int-to-byte v2, p3

    int-to-byte v3, p4

    invoke-static {v1, v2, v3}, Lvpos/apipackage/Print;->Lib_PrnSetFont(BBB)I

    move-result v0

    .line 541
    if-eqz v0, :cond_19

    .line 542
    return v0

    .line 545
    :cond_19
    return v0
.end method

.method public PrintOpen()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lvpos/apipackage/PrintInitException;
        }
    .end annotation

    .line 648
    const/4 v0, -0x1

    .line 657
    .local v0, "ret":I
    invoke-virtual {p0}, Lvpos/apipackage/PosApiHelper;->PrintInit()I

    move-result v0

    .line 659
    if-nez v0, :cond_1b

    .line 664
    const-string v1, "\n"

    invoke-virtual {p0, v1}, Lvpos/apipackage/PosApiHelper;->PrintStr(Ljava/lang/String;)I

    .line 665
    const-string v1, "\n"

    invoke-virtual {p0, v1}, Lvpos/apipackage/PosApiHelper;->PrintStr(Ljava/lang/String;)I

    .line 666
    const-string v1, "\n"

    invoke-virtual {p0, v1}, Lvpos/apipackage/PosApiHelper;->PrintStr(Ljava/lang/String;)I

    .line 668
    invoke-virtual {p0}, Lvpos/apipackage/PosApiHelper;->PrintStart()I

    move-result v1

    return v1

    .line 661
    :cond_1b
    new-instance v1, Lvpos/apipackage/PrintInitException;

    invoke-direct {v1, v0}, Lvpos/apipackage/PrintInitException;-><init>(I)V

    throw v1
.end method

.method public PrintQrCode_Cut(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)I
    .registers 6
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "desiredWidth"    # I
    .param p3, "desiredHeight"    # I
    .param p4, "barcodeFormat"    # Lcom/google/zxing/BarcodeFormat;

    .line 889
    new-instance v0, Lvpos/apipackage/Print;

    invoke-direct {v0}, Lvpos/apipackage/Print;-><init>()V

    invoke-virtual {v0, p1, p2, p3, p4}, Lvpos/apipackage/Print;->printCutQrCode(Ljava/lang/String;IILcom/google/zxing/BarcodeFormat;)I

    move-result v0

    return v0
.end method

.method public PrintSetAlign(I)I
    .registers 3
    .param p1, "x"    # I

    .line 688
    invoke-static {p1}, Lvpos/apipackage/Print;->Lib_PrnSetAlign(I)I

    move-result v0

    return v0
.end method

.method public PrintSetFont(BBB)I
    .registers 5
    .param p1, "fontHeight"    # B
    .param p2, "fontWidth"    # B
    .param p3, "zoom"    # B

    .line 701
    invoke-static {p1, p2, p3}, Lvpos/apipackage/Print;->Lib_PrnSetFont(BBB)I

    move-result v0

    return v0
.end method

.method public PrintSetGray(I)I
    .registers 3
    .param p1, "nLevel"    # I

    .line 683
    invoke-static {p1}, Lvpos/apipackage/Print;->Lib_PrnSetGray(I)I

    move-result v0

    return v0
.end method

.method public PrintSetLinPixelDis(C)I
    .registers 3
    .param p1, "iLinDistance"    # C

    .line 720
    invoke-static {p1}, Lvpos/apipackage/Print;->Lib_SetLinPixelDis(C)I

    move-result v0

    return v0
.end method

.method public PrintSetVoltage(I)I
    .registers 3
    .param p1, "voltage"    # I

    .line 557
    invoke-static {p1}, Lvpos/apipackage/Print;->Lib_PrnSetVoltage(I)I

    move-result v0

    return v0
.end method

.method public PrintStart()I
    .registers 2

    .line 733
    const/4 v0, -0x1

    .line 745
    .local v0, "ret":I
    invoke-virtual {p0}, Lvpos/apipackage/PosApiHelper;->PrintCheckStatus()I

    move-result v0

    .line 749
    if-eqz v0, :cond_8

    .line 766
    return v0

    .line 769
    :cond_8
    invoke-static {}, Lvpos/apipackage/Print;->Lib_PrnStart()I

    move-result v0

    .line 772
    if-eqz v0, :cond_f

    .line 773
    return v0

    .line 776
    :cond_f
    return v0
.end method

.method public PrintStr(Ljava/lang/String;)I
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .line 715
    invoke-static {p1}, Lvpos/apipackage/Print;->Lib_PrnStr(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public PrnContinuous(I)I
    .registers 3
    .param p1, "nlevel"    # I

    .line 643
    invoke-static {p1}, Lvpos/apipackage/Print;->Lib_PrnContinuous(I)I

    move-result v0

    return v0
.end method

.method public PrnConventional(I)I
    .registers 3
    .param p1, "nlevel"    # I

    .line 639
    invoke-static {p1}, Lvpos/apipackage/Print;->Lib_PrnConventional(I)I

    move-result v0

    return v0
.end method

.method public RsaDecrypt([BI[B[BI[B)I
    .registers 8
    .param p1, "Jni_pKeyN"    # [B
    .param p2, "Jni_uKeyLenN"    # I
    .param p3, "jni_pKeyD"    # [B
    .param p4, "jni_pInData"    # [B
    .param p5, "jni_uInLen"    # I
    .param p6, "jni_pOutData"    # [B

    .line 1405
    invoke-static/range {p1 .. p6}, Lvpos/apipackage/Sys;->Lib_RsaDecrypt([BI[B[BI[B)I

    move-result v0

    return v0
.end method

.method public RsaEncrypt([BI[BI[B)I
    .registers 7
    .param p1, "Jni_pKey"    # [B
    .param p2, "Jni_uKeyLen"    # I
    .param p3, "jni_pInData"    # [B
    .param p4, "jni_uInLen"    # I
    .param p5, "jni_pOutData"    # [B

    .line 1400
    invoke-static {p1, p2, p3, p4, p5}, Lvpos/apipackage/Sys;->Lib_RsaEncrypt([BI[BI[B)I

    move-result v0

    return v0
.end method

.method public SetKeyScanByLetfVolume(Landroid/content/Context;I)V
    .registers 5
    .param p1, "mContext"    # Landroid/content/Context;
    .param p2, "mode"    # I

    .line 1428
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SET_LEFT_VOLUME_KEY_SCAN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1429
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "value"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1430
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1431
    return-void
.end method

.method public SetKeyScanByRightVolume(Landroid/content/Context;I)V
    .registers 5
    .param p1, "mContext"    # Landroid/content/Context;
    .param p2, "mode"    # I

    .line 1439
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SET_RIGHT_VOLUME_KEY_SCAN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1440
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "value"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1441
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1442
    return-void
.end method

.method public SetMcuPowerMode(I)I
    .registers 12
    .param p1, "mode"    # I

    .line 54
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v1, Ljava/io/File;

    const-string v2, "/sys/devices/platform/mcu_dev/mcudev_pwren"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 55
    .local v0, "fps":Ljava/io/FileOutputStream;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 56
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_27} :catch_60

    .line 60
    .end local v0    # "fps":Ljava/io/FileOutputStream;
    nop

    .line 62
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, v0, :cond_5f

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    move-wide v4, v2

    .line 67
    .local v2, "startTime":J
    .local v4, "currentTime":J
    :cond_31
    :goto_31
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 68
    sub-long v6, v4, v2

    const-wide/16 v8, 0x4e20

    cmp-long v0, v6, v8

    if-lez v0, :cond_56

    sub-long v6, v4, v2

    cmp-long v0, v6, v8

    if-gez v0, :cond_56

    .line 70
    iget-object v0, p0, Lvpos/apipackage/PosApiHelper;->version:[B

    invoke-virtual {p0, v0}, Lvpos/apipackage/PosApiHelper;->SysGetVersion([B)I

    move-result v0

    iput v0, p0, Lvpos/apipackage/PosApiHelper;->ret:I

    .line 71
    iget v0, p0, Lvpos/apipackage/PosApiHelper;->ret:I

    if-nez v0, :cond_50

    .line 72
    return v1

    .line 74
    :cond_50
    const/16 v0, 0xc8

    invoke-static {v0}, Lvpos/util/Util;->sleepMs(I)V

    goto :goto_31

    .line 75
    :cond_56
    const/4 v0, 0x0

    sub-long v6, v4, v2

    cmp-long v0, v6, v8

    if-lez v0, :cond_31

    .line 79
    const/4 v0, -0x2

    return v0

    .line 85
    .end local v2    # "startTime":J
    .end local v4    # "currentTime":J
    :cond_5f
    return v1

    .line 57
    :catch_60
    move-exception v0

    .line 58
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 59
    const/4 v1, -0x1

    return v1
.end method

.method public SysBeep()I
    .registers 2

    .line 1371
    invoke-static {}, Lvpos/apipackage/Sys;->Lib_Beep()I

    move-result v0

    return v0
.end method

.method public SysGetVersion([B)I
    .registers 3
    .param p1, "buf"    # [B

    .line 1419
    invoke-static {p1}, Lvpos/apipackage/Sys;->Lib_GetVersion([B)I

    move-result v0

    return v0
.end method

.method public SysLogSwitch(I)I
    .registers 4
    .param p1, "LogSwitch"    # I

    .line 1357
    invoke-static {p1}, Lcom/cspos/PaySys;->LogTurnOn(I)I

    .line 1358
    const-string v0, "vpos"

    const-string v1, "SysLogSwitch AAR"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1359
    invoke-static {p1}, Lvpos/apipackage/Sys;->Lib_LogSwitch(I)I

    move-result v0

    return v0
.end method

.method public SysReadChipID([BI)I
    .registers 4
    .param p1, "buf"    # [B
    .param p2, "len"    # I

    .line 1383
    invoke-static {p1, p2}, Lvpos/apipackage/Sys;->Lib_ReadChipID([BI)I

    move-result v0

    return v0
.end method

.method public SysReadSN([B)I
    .registers 3
    .param p1, "SN"    # [B

    .line 1415
    invoke-static {p1}, Lvpos/apipackage/Sys;->Lib_ReadSN([B)I

    move-result v0

    return v0
.end method

.method public SysSetEntryMode(I)I
    .registers 3
    .param p1, "mode"    # I

    .line 282
    int-to-byte v0, p1

    invoke-static {v0}, Lvpos/apipackage/Sys;->Lib_SetEntryMode(B)I

    move-result v0

    return v0
.end method

.method public SysSetLedMode(II)I
    .registers 5
    .param p1, "ledIndex"    # I
    .param p2, "mode"    # I

    .line 1351
    int-to-byte v0, p1

    int-to-byte v1, p2

    invoke-static {v0, v1}, Lvpos/apipackage/Sys;->Lib_SetLed(BB)I

    move-result v0

    return v0
.end method

.method public SysUpdate()I
    .registers 2

    .line 1344
    invoke-static {}, Lvpos/apipackage/Sys;->Lib_Update()I

    move-result v0

    return v0
.end method

.method public SysUpdateBoot()I
    .registers 2

    .line 1348
    invoke-static {}, Lvpos/apipackage/Sys;->Lib_UpdateBoot()I

    move-result v0

    return v0
.end method

.method public SysWriteSN([B)I
    .registers 3
    .param p1, "SN"    # [B

    .line 1395
    invoke-static {p1}, Lvpos/apipackage/Sys;->Lib_WriteSN([B)I

    move-result v0

    return v0
.end method

.method public getAARVersion()Ljava/lang/String;
    .registers 2

    .line 1445
    const-string v0, "2.4.6"

    return-object v0
.end method

.method public getBatteryV()I
    .registers 2

    .line 102
    iget v0, p0, Lvpos/apipackage/PosApiHelper;->BatteryV:I

    return v0
.end method

.method public getMcuTargetVersion(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .line 1452
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "mcu_target_version"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOSVersion(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .line 1449
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "custom_build_version"

    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setBatteryV(I)V
    .registers 2
    .param p1, "batteryV"    # I

    .line 106
    iput p1, p0, Lvpos/apipackage/PosApiHelper;->BatteryV:I

    .line 107
    return-void
.end method
