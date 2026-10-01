.class public Lvpos/keypad/KeyPad;
.super Ljava/lang/Object;
.source "KeyPad.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;,
        Lvpos/keypad/KeyPad$IFinishInput;
    }
.end annotation


# static fields
.field private static final MSG_WHAT_CLEAR_BUFFER:I = 0x2

.field private static final MSG_WHAT_HIDE_DIALOG:I = 0x1

.field private static final MSG_WHAT_SHOW_DIALOG:I = 0x0

.field private static final TAG_INPUT_RESLUT_BACK:I = -0x1

.field private static final TAG_INPUT_RESLUT_CANCEL:I = -0x4

.field private static final TAG_INPUT_RESLUT_NOFORCUS:I = -0x2

.field private static final TAG_INPUT_RESLUT_NOINPUT:I = -0x3

.field private static final TAG_INPUT_RESLUT_NO_ACTIVITY:I = -0x6

.field private static final TAG_INPUT_RESLUT_OK:I = 0x0

.field private static final TAG_INPUT_RESLUT_TIMEOUT:I = -0x5

.field private static TIMEOUT_MS:I

.field static TYPE:I

.field static amount:I

.field static dAlertDialog:Landroid/app/Dialog;

.field static ptc_couter:I


# instance fields
.field private emvcoHelper:Lvpos/keypad/EMVCOHelper;

.field private handler:Landroid/os/Handler;

.field private ivDel:Landroid/widget/ImageView;

.field keyInputMaxLength:I

.field keyInputMinLength:I

.field keyInputResult:I

.field private listener:Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;

.field mContext:Landroid/content/Context;

.field private mEditText:Landroid/widget/EditText;

.field mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

.field private mIsInputFinish:Z

.field private mNumKeyboard:Landroid/inputmethodservice/Keyboard;

.field mTittleString:Ljava/lang/String;

.field final tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 51
    const/4 v0, 0x0

    sput v0, Lvpos/keypad/KeyPad;->TYPE:I

    sput v0, Lvpos/keypad/KeyPad;->amount:I

    sput v0, Lvpos/keypad/KeyPad;->ptc_couter:I

    .line 66
    const/16 v0, 0x7530

    sput v0, Lvpos/keypad/KeyPad;->TIMEOUT_MS:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const-string v0, "KeyPad"

    iput-object v0, p0, Lvpos/keypad/KeyPad;->tag:Ljava/lang/String;

    .line 70
    const/4 v0, -0x1

    iput v0, p0, Lvpos/keypad/KeyPad;->keyInputResult:I

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lvpos/keypad/KeyPad;->keyInputMinLength:I

    .line 72
    iput v0, p0, Lvpos/keypad/KeyPad;->keyInputMaxLength:I

    .line 73
    const-string v0, "please input Pin ~"

    iput-object v0, p0, Lvpos/keypad/KeyPad;->mTittleString:Ljava/lang/String;

    .line 204
    new-instance v0, Lvpos/keypad/KeyPad$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lvpos/keypad/KeyPad$2;-><init>(Lvpos/keypad/KeyPad;Landroid/os/Looper;)V

    iput-object v0, p0, Lvpos/keypad/KeyPad;->handler:Landroid/os/Handler;

    .line 460
    new-instance v0, Lvpos/keypad/KeyPad$3;

    invoke-direct {v0, p0}, Lvpos/keypad/KeyPad$3;-><init>(Lvpos/keypad/KeyPad;)V

    iput-object v0, p0, Lvpos/keypad/KeyPad;->listener:Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;

    .line 77
    iput-object p1, p0, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    .line 78
    return-void
.end method

.method static synthetic access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;
    .registers 2
    .param p0, "x0"    # Lvpos/keypad/KeyPad;

    .line 47
    iget-object v0, p0, Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$002(Lvpos/keypad/KeyPad;Landroid/widget/EditText;)Landroid/widget/EditText;
    .registers 2
    .param p0, "x0"    # Lvpos/keypad/KeyPad;
    .param p1, "x1"    # Landroid/widget/EditText;

    .line 47
    iput-object p1, p0, Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;

    return-object p1
.end method

.method static synthetic access$100(Lvpos/keypad/KeyPad;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lvpos/keypad/KeyPad;

    .line 47
    iget-object v0, p0, Lvpos/keypad/KeyPad;->ivDel:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$102(Lvpos/keypad/KeyPad;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lvpos/keypad/KeyPad;
    .param p1, "x1"    # Landroid/widget/ImageView;

    .line 47
    iput-object p1, p0, Lvpos/keypad/KeyPad;->ivDel:Landroid/widget/ImageView;

    return-object p1
.end method

.method static synthetic access$200(Lvpos/keypad/KeyPad;)Landroid/inputmethodservice/Keyboard;
    .registers 2
    .param p0, "x0"    # Lvpos/keypad/KeyPad;

    .line 47
    iget-object v0, p0, Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;

    return-object v0
.end method

.method static synthetic access$202(Lvpos/keypad/KeyPad;Landroid/inputmethodservice/Keyboard;)Landroid/inputmethodservice/Keyboard;
    .registers 2
    .param p0, "x0"    # Lvpos/keypad/KeyPad;
    .param p1, "x1"    # Landroid/inputmethodservice/Keyboard;

    .line 47
    iput-object p1, p0, Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;

    return-object p1
.end method

.method static synthetic access$300(Lvpos/keypad/KeyPad;)V
    .registers 1
    .param p0, "x0"    # Lvpos/keypad/KeyPad;

    .line 47
    invoke-direct {p0}, Lvpos/keypad/KeyPad;->randomNumKey()V

    return-void
.end method

.method static synthetic access$400(Lvpos/keypad/KeyPad;)V
    .registers 1
    .param p0, "x0"    # Lvpos/keypad/KeyPad;

    .line 47
    invoke-direct {p0}, Lvpos/keypad/KeyPad;->randomNumKeyPK()V

    return-void
.end method

.method static synthetic access$500(Lvpos/keypad/KeyPad;)V
    .registers 1
    .param p0, "x0"    # Lvpos/keypad/KeyPad;

    .line 47
    invoke-direct {p0}, Lvpos/keypad/KeyPad;->randomNumKeyAsqi()V

    return-void
.end method

.method static synthetic access$600(Lvpos/keypad/KeyPad;)Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;
    .registers 2
    .param p0, "x0"    # Lvpos/keypad/KeyPad;

    .line 47
    iget-object v0, p0, Lvpos/keypad/KeyPad;->listener:Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;

    return-object v0
.end method

.method static synthetic access$702(Lvpos/keypad/KeyPad;Z)Z
    .registers 2
    .param p0, "x0"    # Lvpos/keypad/KeyPad;
    .param p1, "x1"    # Z

    .line 47
    iput-boolean p1, p0, Lvpos/keypad/KeyPad;->mIsInputFinish:Z

    return p1
.end method

.method public static getSequence(I)[I
    .registers 7
    .param p0, "no"    # I

    .line 732
    new-array v0, p0, [I

    .line 733
    .local v0, "sequence":[I
    const/4 v1, 0x0

    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    if-ge v2, p0, :cond_d

    .line 734
    add-int/lit8 v3, v2, 0x1

    aput v3, v0, v2

    .line 733
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 737
    .end local v2    # "i":I
    :cond_d
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 738
    .local v2, "random":Ljava/util/Random;
    nop

    .local v1, "i":I
    :goto_13
    if-ge v1, p0, :cond_24

    .line 739
    invoke-virtual {v2, p0}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    .line 740
    .local v3, "p":I
    aget v4, v0, v1

    .line 741
    .local v4, "tmp":I
    aget v5, v0, v3

    aput v5, v0, v1

    .line 742
    aput v4, v0, v3

    .line 738
    .end local v3    # "p":I
    .end local v4    # "tmp":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 744
    .end local v1    # "i":I
    :cond_24
    const/4 v1, 0x0

    .line 745
    .end local v2    # "random":Ljava/util/Random;
    .local v1, "random":Ljava/util/Random;
    return-object v0
.end method

.method public static randomCommon(III)[I
    .registers 10
    .param p0, "min"    # I
    .param p1, "max"    # I
    .param p2, "n"    # I

    .line 708
    sub-int v0, p1, p0

    add-int/lit8 v0, v0, 0x1

    if-gt p2, v0, :cond_32

    if-ge p1, p0, :cond_9

    goto :goto_32

    .line 711
    :cond_9
    new-array v0, p2, [I

    .line 712
    .local v0, "result":[I
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 713
    .local v2, "count":I
    :goto_d
    if-ge v2, p2, :cond_31

    .line 714
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v3

    sub-int v5, p1, p0

    int-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v5

    double-to-int v3, v3

    add-int/2addr v3, p0

    .line 715
    .local v3, "num":I
    const/4 v4, 0x1

    .line 716
    .local v4, "flag":Z
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1f
    if-ge v5, p2, :cond_2a

    .line 717
    aget v6, v0, v5

    if-ne v3, v6, :cond_27

    .line 718
    const/4 v4, 0x0

    .line 719
    goto :goto_2a

    .line 716
    :cond_27
    add-int/lit8 v5, v5, 0x1

    goto :goto_1f

    .line 722
    .end local v5    # "j":I
    :cond_2a
    :goto_2a
    if-eqz v4, :cond_30

    .line 723
    aput v3, v0, v2

    .line 724
    add-int/lit8 v2, v2, 0x1

    .line 726
    .end local v3    # "num":I
    .end local v4    # "flag":Z
    :cond_30
    goto :goto_d

    .line 727
    :cond_31
    return-object v0

    .line 709
    .end local v0    # "result":[I
    .end local v2    # "count":I
    :cond_32
    :goto_32
    const/4 v0, 0x0

    return-object v0
.end method

.method private randomNumKey()V
    .registers 13

    .line 564
    iget-object v0, p0, Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;

    invoke-virtual {v0}, Landroid/inputmethodservice/Keyboard;->getKeys()Ljava/util/List;

    move-result-object v0

    .line 565
    .local v0, "keyList":Ljava/util/List;, "Ljava/util/List<Landroid/inputmethodservice/Keyboard$Key;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    .line 575
    .local v1, "size":I
    const/16 v2, 0x9

    invoke-virtual {p0, v2, v2}, Lvpos/keypad/KeyPad;->getRandomSet(II)Ljava/util/Set;

    move-result-object v3

    .line 577
    .local v3, "randomSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 578
    .local v4, "it":Ljava/util/Iterator;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 579
    .local v5, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_1b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2b

    .line 580
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    .line 583
    :cond_2b
    const/4 v6, 0x0

    .line 584
    .local v6, "keyIndex":I
    const/4 v7, 0x0

    move v8, v6

    const/4 v6, 0x0

    .local v6, "i":I
    .local v8, "keyIndex":I
    :goto_2f
    if-ge v6, v1, :cond_7c

    .line 586
    const/4 v9, 0x3

    if-ltz v6, :cond_38

    if-ge v6, v9, :cond_38

    .line 587
    move v8, v6

    goto :goto_46

    .line 588
    :cond_38
    const/4 v10, 0x6

    if-lt v6, v9, :cond_40

    if-ge v6, v10, :cond_40

    .line 589
    add-int/lit8 v8, v6, 0x1

    goto :goto_46

    .line 590
    :cond_40
    if-gt v10, v6, :cond_46

    if-ge v6, v2, :cond_46

    .line 591
    add-int/lit8 v8, v6, 0x2

    .line 597
    :cond_46
    :goto_46
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/inputmethodservice/Keyboard$Key;

    iget-object v9, v9, Landroid/inputmethodservice/Keyboard$Key;->codes:[I

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/lit8 v10, v10, 0x30

    aput v10, v9, v7

    .line 598
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/inputmethodservice/Keyboard$Key;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, ""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Landroid/inputmethodservice/Keyboard$Key;->label:Ljava/lang/CharSequence;

    .line 584
    add-int/lit8 v6, v6, 0x1

    goto :goto_2f

    .line 600
    .end local v6    # "i":I
    :cond_7c
    return-void
.end method

.method private randomNumKeyAsqi()V
    .registers 9

    .line 622
    iget-object v0, p0, Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;

    invoke-virtual {v0}, Landroid/inputmethodservice/Keyboard;->getKeys()Ljava/util/List;

    move-result-object v0

    .line 623
    .local v0, "keyList":Ljava/util/List;, "Ljava/util/List<Landroid/inputmethodservice/Keyboard$Key;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x3

    .line 624
    .local v1, "size":I
    const-string v2, "KeyPad"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "size = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 625
    const/16 v2, 0x9

    invoke-virtual {p0, v2, v2}, Lvpos/keypad/KeyPad;->getRandomKeyElements(II)Ljava/util/List;

    move-result-object v2

    .line 627
    .local v2, "keysElement":Ljava/util/List;, "Ljava/util/List<Lvpos/keypad/KeyElement;>;"
    const/4 v3, 0x0

    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2a
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_81

    .line 628
    const-string v5, "liuhao KeyPad "

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "randomNumKeyAsqi() : i = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "  code : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lvpos/keypad/KeyElement;

    invoke-virtual {v7}, Lvpos/keypad/KeyElement;->getKeyCode()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/inputmethodservice/Keyboard$Key;

    iget-object v5, v5, Landroid/inputmethodservice/Keyboard$Key;->codes:[I

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lvpos/keypad/KeyElement;

    invoke-virtual {v6}, Lvpos/keypad/KeyElement;->getKeyCode()I

    move-result v6

    aput v6, v5, v3

    .line 630
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/inputmethodservice/Keyboard$Key;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lvpos/keypad/KeyElement;

    invoke-virtual {v6}, Lvpos/keypad/KeyElement;->getKeyIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    iput-object v6, v5, Landroid/inputmethodservice/Keyboard$Key;->icon:Landroid/graphics/drawable/Drawable;

    .line 627
    add-int/lit8 v4, v4, 0x1

    goto :goto_2a

    .line 632
    .end local v4    # "i":I
    :cond_81
    return-void
.end method

.method private randomNumKeyPK()V
    .registers 11

    .line 604
    iget-object v0, p0, Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;

    invoke-virtual {v0}, Landroid/inputmethodservice/Keyboard;->getKeys()Ljava/util/List;

    move-result-object v0

    .line 605
    .local v0, "keyList":Ljava/util/List;, "Ljava/util/List<Landroid/inputmethodservice/Keyboard$Key;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x3

    .line 606
    .local v1, "size":I
    const-string v2, "KeyPad"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "size = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 607
    const/16 v2, 0x9

    invoke-virtual {p0, v2, v2}, Lvpos/keypad/KeyPad;->getRandomSet(II)Ljava/util/Set;

    move-result-object v2

    .line 609
    .local v2, "randomSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 610
    .local v3, "it":Ljava/util/Iterator;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 611
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_31
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_41

    .line 612
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 615
    :cond_41
    const/4 v5, 0x0

    const/4 v6, 0x0

    .local v6, "i":I
    :goto_43
    if-ge v6, v1, :cond_7b

    .line 616
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/inputmethodservice/Keyboard$Key;

    iget-object v7, v7, Landroid/inputmethodservice/Keyboard$Key;->codes:[I

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    add-int/lit8 v8, v8, 0x30

    aput v8, v7, v5

    .line 617
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/inputmethodservice/Keyboard$Key;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Landroid/inputmethodservice/Keyboard$Key;->label:Ljava/lang/CharSequence;

    .line 615
    add-int/lit8 v6, v6, 0x1

    goto :goto_43

    .line 619
    .end local v6    # "i":I
    :cond_7b
    return-void
.end method


# virtual methods
.method public ClearBuffer()V
    .registers 3

    .line 190
    const-string v0, ""

    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lvpos/keypad/KeyPad;->SendMsg(ILjava/lang/String;)V

    .line 191
    return-void
.end method

.method public HideKeyPad()V
    .registers 3

    .line 184
    const-string v0, ""

    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0}, Lvpos/keypad/KeyPad;->SendMsg(ILjava/lang/String;)V

    .line 186
    iput-boolean v1, p0, Lvpos/keypad/KeyPad;->mIsInputFinish:Z

    .line 187
    return-void
.end method

.method public PciVerifyCipherPinSbank(IIII[BI[B[BI[B)I
    .registers 23
    .param p1, "slot"    # I
    .param p2, "minLen"    # I
    .param p3, "maxLen"    # I
    .param p4, "timeout_s"    # I
    .param p5, "modulus"    # [B
    .param p6, "moduluslen"    # I
    .param p7, "exponent"    # [B
    .param p8, "IccRandom"    # [B
    .param p9, "IccRandomLen"    # I
    .param p10, "IccRsp"    # [B

    .line 98
    move-object v0, p0

    iget-object v1, v0, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/cspos/PaySys;->poskeypad(Landroid/content/Context;)I

    .line 99
    invoke-static/range {p4 .. p4}, Lcom/cspos/PaySys;->SetPadTime(I)I

    .line 101
    move v1, p1

    int-to-byte v11, v1

    .line 102
    .local v11, "slotin":B
    move v2, v11

    move v3, p2

    move v4, p3

    move-object/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move/from16 v9, p9

    move-object/from16 v10, p10

    invoke-static/range {v2 .. v10}, Lcom/cspos/PaySys;->OfflinePinCipher(BII[BI[B[BI[B)I

    move-result v2

    .line 103
    .local v2, "ret":I
    return v2
.end method

.method public PciVerifyPlainPinSbank(IIII[B)I
    .registers 12
    .param p1, "slot"    # I
    .param p2, "minLen"    # I
    .param p3, "maxLen"    # I
    .param p4, "timeout_s"    # I
    .param p5, "IccRsp"    # [B

    .line 83
    const-string v0, "Robert"

    const-string v1, "PciVerifyPlainPinSbank-----------------------0"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    iget-object v0, p0, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/cspos/PaySys;->poskeypad(Landroid/content/Context;)I

    .line 85
    invoke-static {p4}, Lcom/cspos/PaySys;->SetPadTime(I)I

    .line 87
    int-to-byte v0, p1

    .line 88
    .local v0, "slotin":B
    invoke-static {v0, p2, p3, p5}, Lcom/cspos/PaySys;->OfflinePinPlain(BII[B)I

    move-result v1

    .line 89
    .local v1, "ret":I
    const/4 v2, 0x2

    invoke-static {p5, v2}, Lvpos/apipackage/ByteUtil;->bytearrayToHexString([BI)Ljava/lang/String;

    move-result-object v2

    .line 90
    .local v2, "IccRspSTR":Ljava/lang/String;
    const-string v3, "Robert"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "PciVerifyPlainPinSbank IccRsp---"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    return v1
.end method

.method public SendMsg(ILjava/lang/String;)V
    .registers 6
    .param p1, "iType"    # I
    .param p2, "strInfo"    # Ljava/lang/String;

    .line 194
    iget-object v0, p0, Lvpos/keypad/KeyPad;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_1d

    .line 195
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 196
    .local v0, "msg":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 197
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 198
    .local v1, "b":Landroid/os/Bundle;
    const-string v2, "MSG"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 200
    iget-object v2, p0, Lvpos/keypad/KeyPad;->handler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 202
    .end local v0    # "msg":Landroid/os/Message;
    .end local v1    # "b":Landroid/os/Bundle;
    :cond_1d
    return-void
.end method

.method public Settime_ShowKeyPad(I)I
    .registers 3
    .param p1, "Time_S"    # I

    .line 108
    mul-int/lit16 v0, p1, 0x3e8

    sput v0, Lvpos/keypad/KeyPad;->TIMEOUT_MS:I

    .line 110
    sget v0, Lvpos/keypad/KeyPad;->TIMEOUT_MS:I

    return v0
.end method

.method public ShowKeyPad(Ljava/lang/String;I[B[BII)I
    .registers 16
    .param p1, "tittle"    # Ljava/lang/String;
    .param p2, "type"    # I
    .param p3, "input"    # [B
    .param p4, "input_len"    # [B
    .param p5, "Minlength"    # I
    .param p6, "Maxlength"    # I

    .line 114
    const/4 v0, 0x0

    iput-boolean v0, p0, Lvpos/keypad/KeyPad;->mIsInputFinish:Z

    .line 115
    iput p5, p0, Lvpos/keypad/KeyPad;->keyInputMinLength:I

    .line 116
    iput p6, p0, Lvpos/keypad/KeyPad;->keyInputMaxLength:I

    .line 117
    sput p2, Lvpos/keypad/KeyPad;->TYPE:I

    .line 120
    const-string v1, "Robert"

    const-string v2, "showpad-------------------0"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    move-wide v3, v1

    .line 123
    .local v1, "startTime":J
    .local v3, "currentTime":J
    const-string v5, ""

    invoke-virtual {p0, v0, v5}, Lvpos/keypad/KeyPad;->SendMsg(ILjava/lang/String;)V

    .line 125
    :goto_1a
    iget-boolean v0, p0, Lvpos/keypad/KeyPad;->mIsInputFinish:Z

    if-nez v0, :cond_40

    .line 126
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 127
    new-instance v0, Lvpos/keypad/KeyPad$1;

    invoke-direct {v0, p0, p4, p3}, Lvpos/keypad/KeyPad$1;-><init>(Lvpos/keypad/KeyPad;[B[B)V

    invoke-virtual {p0, v0}, Lvpos/keypad/KeyPad;->setIFinishInput(Lvpos/keypad/KeyPad$IFinishInput;)V

    .line 144
    sub-long v5, v3, v1

    sget v0, Lvpos/keypad/KeyPad;->TIMEOUT_MS:I

    int-to-long v7, v0

    cmp-long v0, v5, v7

    if-lez v0, :cond_3a

    .line 145
    const/4 v0, -0x5

    iput v0, p0, Lvpos/keypad/KeyPad;->keyInputResult:I

    .line 146
    invoke-virtual {p0}, Lvpos/keypad/KeyPad;->HideKeyPad()V

    .line 147
    goto :goto_40

    .line 149
    :cond_3a
    const/16 v0, 0x32

    invoke-static {v0}, Lvpos/util/Util;->sleepMs(I)V

    goto :goto_1a

    .line 152
    :cond_40
    :goto_40
    invoke-virtual {p0}, Lvpos/keypad/KeyPad;->ClearBuffer()V

    .line 154
    iget v0, p0, Lvpos/keypad/KeyPad;->keyInputResult:I

    return v0
.end method

.method public getRandomKeyElements(II)Ljava/util/List;
    .registers 14
    .param p1, "size"    # I
    .param p2, "max"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Lvpos/keypad/KeyElement;",
            ">;"
        }
    .end annotation

    .line 652
    const/16 v0, 0x9

    invoke-virtual {p0, v0, v0}, Lvpos/keypad/KeyPad;->getRandomSetAsqi(II)Ljava/util/Set;

    move-result-object v0

    .line 654
    .local v0, "result_int":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 655
    .local v1, "it":Ljava/util/Iterator;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 656
    .local v2, "intList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 657
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 665
    :cond_1f
    iget-object v3, p0, Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;

    invoke-virtual {v3}, Landroid/inputmethodservice/Keyboard;->getKeys()Ljava/util/List;

    move-result-object v3

    .line 666
    .local v3, "keyList":Ljava/util/List;, "Ljava/util/List<Landroid/inputmethodservice/Keyboard$Key;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 668
    .local v4, "keysElement":Ljava/util/List;, "Ljava/util/List<Lvpos/keypad/KeyElement;>;"
    const/4 v5, 0x0

    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2c
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_84

    .line 669
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 670
    .local v7, "tmpIndex":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "liuhao getRandomKeyElements() i  = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "intList.get(keyIndex) = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 671
    new-instance v8, Lvpos/keypad/KeyElement;

    invoke-direct {v8}, Lvpos/keypad/KeyElement;-><init>()V

    .line 672
    .local v8, "keyElement":Lvpos/keypad/KeyElement;
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/inputmethodservice/Keyboard$Key;

    iget-object v9, v9, Landroid/inputmethodservice/Keyboard$Key;->codes:[I

    aget v9, v9, v5

    invoke-virtual {v8, v9}, Lvpos/keypad/KeyElement;->setKeyCode(I)V

    .line 673
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/inputmethodservice/Keyboard$Key;

    iget-object v9, v9, Landroid/inputmethodservice/Keyboard$Key;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8, v9}, Lvpos/keypad/KeyElement;->setKeyIcon(Landroid/graphics/drawable/Drawable;)V

    .line 674
    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 668
    .end local v7    # "tmpIndex":I
    .end local v8    # "keyElement":Lvpos/keypad/KeyElement;
    add-int/lit8 v6, v6, 0x1

    goto :goto_2c

    .line 677
    .end local v6    # "i":I
    :cond_84
    return-object v4
.end method

.method public getRandomSet(II)Ljava/util/Set;
    .registers 6
    .param p1, "size"    # I
    .param p2, "max"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 688
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 689
    .local v0, "random":Ljava/util/Random;
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 690
    .local v1, "result":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :goto_a
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    if-ge v2, p1, :cond_1e

    .line 691
    invoke-virtual {v0, p2}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 692
    .local v2, "next":Ljava/lang/Integer;
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 693
    .end local v2    # "next":Ljava/lang/Integer;
    goto :goto_a

    .line 694
    :cond_1e
    return-object v1
.end method

.method public getRandomSetAsqi(II)Ljava/util/Set;
    .registers 6
    .param p1, "size"    # I
    .param p2, "max"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 641
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 642
    .local v0, "random":Ljava/util/Random;
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 643
    .local v1, "result":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :goto_a
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    if-ge v2, p1, :cond_1c

    .line 644
    invoke-virtual {v0, p2}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 645
    .local v2, "next":Ljava/lang/Integer;
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 646
    .end local v2    # "next":Ljava/lang/Integer;
    goto :goto_a

    .line 647
    :cond_1c
    return-object v1
.end method

.method public setIFinishInput(Lvpos/keypad/KeyPad$IFinishInput;)V
    .registers 2
    .param p1, "iFinishInput"    # Lvpos/keypad/KeyPad$IFinishInput;

    .line 457
    iput-object p1, p0, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    .line 458
    return-void
.end method
