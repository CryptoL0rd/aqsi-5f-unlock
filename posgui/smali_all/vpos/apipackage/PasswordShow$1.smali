.class Lvpos/apipackage/PasswordShow$1;
.super Landroid/os/Handler;
.source "PasswordShow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/apipackage/PasswordShow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lvpos/apipackage/PasswordShow;


# direct methods
.method constructor <init>(Lvpos/apipackage/PasswordShow;Landroid/os/Looper;)V
    .registers 3
    .param p1, "this$0"    # Lvpos/apipackage/PasswordShow;
    .param p2, "x0"    # Landroid/os/Looper;

    .line 113
    iput-object p1, p0, Lvpos/apipackage/PasswordShow$1;->this$0:Lvpos/apipackage/PasswordShow;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 9
    .param p1, "msg"    # Landroid/os/Message;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .line 117
    const-string v0, "PasswordShow"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "msg.what="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_108

    .line 165
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 166
    .local v0, "b":Landroid/os/Bundle;
    const-string v1, "MSG"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 167
    .local v1, "strInfo":Ljava/lang/String;
    const-string v2, "PasswordShow"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    goto/16 :goto_107

    .line 156
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v1    # "strInfo":Ljava/lang/String;
    :pswitch_2e
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 157
    .restart local v0    # "b":Landroid/os/Bundle;
    const-string v1, "MSG"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 158
    .restart local v1    # "strInfo":Ljava/lang/String;
    const-string v2, "PasswordShow"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    # getter for: Lvpos/apipackage/PasswordShow;->textView:Lvpos/apipackage/PasswordShow$BorderTextView;
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$300()Lvpos/apipackage/PasswordShow$BorderTextView;

    move-result-object v2

    const/high16 v3, 0x42200000    # 40.0f

    invoke-virtual {v2, v3}, Lvpos/apipackage/PasswordShow$BorderTextView;->setTextSize(F)V

    .line 160
    # getter for: Lvpos/apipackage/PasswordShow;->textView:Lvpos/apipackage/PasswordShow$BorderTextView;
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$300()Lvpos/apipackage/PasswordShow$BorderTextView;

    move-result-object v2

    invoke-virtual {v2, v1}, Lvpos/apipackage/PasswordShow$BorderTextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    goto/16 :goto_107

    .line 131
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v1    # "strInfo":Ljava/lang/String;
    :pswitch_4f
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 132
    .restart local v0    # "b":Landroid/os/Bundle;
    const-string v1, "MSG"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 133
    .restart local v1    # "strInfo":Ljava/lang/String;
    const-string v2, "MSG_WHAT_ID_NATION"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    new-instance v2, Landroid/app/AlertDialog$Builder;

    # getter for: Lvpos/apipackage/PasswordShow;->mctx:Landroid/content/Context;
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$200()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 135
    .local v2, "builder":Landroid/app/AlertDialog$Builder;
    const-string v3, ""

    .line 136
    .local v3, "tittle":Ljava/lang/String;
    iget-object v4, p0, Lvpos/apipackage/PasswordShow$1;->this$0:Lvpos/apipackage/PasswordShow;

    iget-byte v4, v4, Lvpos/apipackage/PasswordShow;->mark:B

    if-eqz v4, :cond_8c

    .line 137
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "Amount: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lvpos/apipackage/PasswordShow$1;->this$0:Lvpos/apipackage/PasswordShow;

    iget-object v5, v5, Lvpos/apipackage/PasswordShow;->amountString:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 138
    :cond_8c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "Input pin: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 139
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 140
    new-instance v4, Lvpos/apipackage/PasswordShow$BorderTextView;

    iget-object v5, p0, Lvpos/apipackage/PasswordShow$1;->this$0:Lvpos/apipackage/PasswordShow;

    # getter for: Lvpos/apipackage/PasswordShow;->mctx:Landroid/content/Context;
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$200()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lvpos/apipackage/PasswordShow$BorderTextView;-><init>(Lvpos/apipackage/PasswordShow;Landroid/content/Context;)V

    # setter for: Lvpos/apipackage/PasswordShow;->textView:Lvpos/apipackage/PasswordShow$BorderTextView;
    invoke-static {v4}, Lvpos/apipackage/PasswordShow;->access$302(Lvpos/apipackage/PasswordShow$BorderTextView;)Lvpos/apipackage/PasswordShow$BorderTextView;

    .line 141
    # getter for: Lvpos/apipackage/PasswordShow;->textView:Lvpos/apipackage/PasswordShow$BorderTextView;
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$300()Lvpos/apipackage/PasswordShow$BorderTextView;

    move-result-object v4

    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Lvpos/apipackage/PasswordShow$BorderTextView;->setGravity(I)V

    .line 143
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 144
    # getter for: Lvpos/apipackage/PasswordShow;->textView:Lvpos/apipackage/PasswordShow$BorderTextView;
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$300()Lvpos/apipackage/PasswordShow$BorderTextView;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 145
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v4

    # setter for: Lvpos/apipackage/PasswordShow;->mdialog:Landroid/app/Dialog;
    invoke-static {v4}, Lvpos/apipackage/PasswordShow;->access$102(Landroid/app/Dialog;)Landroid/app/Dialog;

    .line 147
    # getter for: Lvpos/apipackage/PasswordShow;->mdialog:Landroid/app/Dialog;
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$100()Landroid/app/Dialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    .line 148
    .local v4, "layoutParams":Landroid/view/WindowManager$LayoutParams;
    const/16 v5, 0x1f4

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 149
    const/4 v5, -0x2

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 150
    # getter for: Lvpos/apipackage/PasswordShow;->mdialog:Landroid/app/Dialog;
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$100()Landroid/app/Dialog;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 152
    goto :goto_107

    .line 123
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v1    # "strInfo":Ljava/lang/String;
    .end local v2    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v3    # "tittle":Ljava/lang/String;
    .end local v4    # "layoutParams":Landroid/view/WindowManager$LayoutParams;
    :pswitch_e8
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 124
    .restart local v0    # "b":Landroid/os/Bundle;
    const-string v1, "MSG"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 125
    .restart local v1    # "strInfo":Ljava/lang/String;
    const-string v2, "PasswordShow"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    # getter for: Lvpos/apipackage/PasswordShow;->mdialog:Landroid/app/Dialog;
    invoke-static {}, Lvpos/apipackage/PasswordShow;->access$100()Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 127
    const-string v2, "PasswordShow"

    const-string v3, "mdialog.dismiss();"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    goto :goto_107

    .line 120
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v1    # "strInfo":Ljava/lang/String;
    :pswitch_106
    nop

    .line 171
    :goto_107
    return-void

    :pswitch_data_108
    .packed-switch 0x1
        :pswitch_106
        :pswitch_e8
        :pswitch_4f
        :pswitch_2e
    .end packed-switch
.end method
