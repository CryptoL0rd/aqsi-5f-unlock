.class Lvpos/apipackage/AppTypeWindow$2$1;
.super Ljava/lang/Object;
.source "AppTypeWindow.java"

# interfaces
.implements Lvpos/apipackage/CustomLayout$MyViewFocusInterface;


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

    .line 202
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow$2$1;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isNoFocus()V
    .registers 3

    .line 204
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$1;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    const/4 v1, -0x1

    iput v1, v0, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    .line 206
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$1;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow;->mIFinishType:Lvpos/apipackage/AppTypeWindow$IFinishType;

    if-eqz v0, :cond_1e

    .line 207
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$1;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow;->mIFinishType:Lvpos/apipackage/AppTypeWindow$IFinishType;

    iget-object v1, p0, Lvpos/apipackage/AppTypeWindow$2$1;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v1, v1, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    iget v1, v1, Lvpos/apipackage/AppTypeWindow;->keyInputResult:I

    invoke-interface {v0, v1}, Lvpos/apipackage/AppTypeWindow$IFinishType;->isFinished(I)V

    .line 209
    :cond_1e
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2$1;->this$1:Lvpos/apipackage/AppTypeWindow$2;

    iget-object v0, v0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-virtual {v0}, Lvpos/apipackage/AppTypeWindow;->CloseWindow()V

    .line 210
    return-void
.end method
