.class Lvpos/apipackage/AppTypeWindow$2$2;
.super Ljava/lang/Object;
.source "AppTypeWindow.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lvpos/apipackage/AppTypeWindow$2;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lvpos/apipackage/AppTypeWindow$2;


# direct methods
.method constructor <init>(Lvpos/apipackage/AppTypeWindow$2;)V
    .registers 2
    .param p1, "this$1"    # Lvpos/apipackage/AppTypeWindow$2;

    .line 235
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow$2$2;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 237
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$2;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    const/4 v1, -0x2

    iput v1, v0, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    .line 238
    const-string v0, "liuhao"

    const-string v1, " _____Cancel____"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$2;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow;->mIFinishType:Lvpos/apipackage/AppTypeWindow$IFinishType;

    if-eqz v0, :cond_25

    .line 241
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$2;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow;->mIFinishType:Lvpos/apipackage/AppTypeWindow$IFinishType;

    iget-object v1, p0, Lvpos/apipackage/AppTypeWindow$2$2;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v1, v1, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget v1, v1, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    invoke-interface {v0, v1}, Lvpos/apipackage/AppTypeWindow$IFinishType;->isFinished(I)V

    .line 243
    :cond_25
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$2;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-virtual {v0}, Lvpos/apipackage/AppTypeWindow;->CloseWindow()V

    .line 244
    return-void
.end method
