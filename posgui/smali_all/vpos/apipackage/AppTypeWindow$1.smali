.class Lvpos/apipackage/AppTypeWindow$1;
.super Ljava/lang/Object;
.source "AppTypeWindow.java"

# interfaces
.implements Lvpos/apipackage/AppTypeWindow$IFinishType;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lvpos/apipackage/AppTypeWindow;->ShowSelectWindow(I[B[B)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lvpos/apipackage/AppTypeWindow;

.field final synthetic val$selResult:[B


# direct methods
.method constructor <init>(Lvpos/apipackage/AppTypeWindow;[B)V
    .registers 3
    .param p1, "this$0"    # Lvpos/apipackage/AppTypeWindow;

    .line 94
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow$1;->this$0:Lvpos/apipackage/AppTypeWindow;

    iput-object p2, p0, Lvpos/apipackage/AppTypeWindow$1;->val$selResult:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isFinished(I)V
    .registers 6
    .param p1, "finishResult"    # I

    .line 97
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$1;->this$0:Lvpos/apipackage/AppTypeWindow;

    iput p1, v0, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    .line 98
    if-nez p1, :cond_60

    .line 99
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$1;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lvpos/apipackage/AppTypeWindow;->access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v0

    sput v0, Lvpos/apipackage/AppTypeWindow;->rid:I

    .line 100
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$1;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lvpos/apipackage/AppTypeWindow;->access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;

    move-result-object v0

    iget-object v1, p0, Lvpos/apipackage/AppTypeWindow$1;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v1}, Lvpos/apipackage/AppTypeWindow;->access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;

    move-result-object v1

    sget v2, Lvpos/apipackage/AppTypeWindow;->rid:I

    invoke-virtual {v1, v2}, Landroid/widget/RadioGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    sput v0, Lvpos/apipackage/AppTypeWindow;->rid:I

    .line 101
    const-string v0, "liuhao"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Robert select appDLG ===ShowSelectWindow rid = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lvpos/apipackage/AppTypeWindow;->rid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    const-string v0, "liuhao"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Robert select appDLG  ByteUtil.iToBytes(rid).length  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lvpos/apipackage/AppTypeWindow;->rid:I

    invoke-static {v2}, Lvpos/apipackage/ByteUtil;->iToBytes(I)[B

    move-result-object v2

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7b

    .line 104
    :cond_60
    const/4 v0, -0x1

    sput v0, Lvpos/apipackage/AppTypeWindow;->rid:I

    .line 105
    const-string v0, "liuhao"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Robert select appDLG  else ===ShowSelectWindow rid = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lvpos/apipackage/AppTypeWindow;->rid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    :goto_7b
    sget v0, Lvpos/apipackage/AppTypeWindow;->rid:I

    invoke-static {v0}, Lvpos/apipackage/ByteUtil;->iToBytes(I)[B

    move-result-object v0

    iget-object v1, p0, Lvpos/apipackage/AppTypeWindow$1;->val$selResult:[B

    sget v2, Lvpos/apipackage/AppTypeWindow;->rid:I

    invoke-static {v2}, Lvpos/apipackage/ByteUtil;->iToBytes(I)[B

    move-result-object v2

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    const-string v0, "liuhao"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Robert select appDLG  rid return buf = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lvpos/apipackage/AppTypeWindow$1;->val$selResult:[B

    invoke-static {v2}, Lvpos/apipackage/ByteUtil;->bytesToInt([B)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$1;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow;->m_KBThread:Lvpos/apipackage/AppTypeWindow$Decet_Thread;

    invoke-virtual {v0}, Lvpos/apipackage/AppTypeWindow$Decet_Thread;->interrupt()V

    .line 111
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$1;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-virtual {v0}, Lvpos/apipackage/AppTypeWindow;->CloseWindow()V

    .line 112
    return-void
.end method
