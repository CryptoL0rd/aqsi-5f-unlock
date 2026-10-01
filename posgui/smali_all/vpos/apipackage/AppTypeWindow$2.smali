.class Lvpos/apipackage/AppTypeWindow$2;
.super Landroid/os/Handler;
.source "AppTypeWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/apipackage/AppTypeWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lvpos/apipackage/AppTypeWindow;


# direct methods
.method constructor <init>(Lvpos/apipackage/AppTypeWindow;Landroid/os/Looper;)V
    .registers 3
    .param p1, "this$0"    # Lvpos/apipackage/AppTypeWindow;
    .param p2, "x0"    # Landroid/os/Looper;

    .line 171
    iput-object p1, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 10
    .param p1, "msg"    # Landroid/os/Message;

    .line 173
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 175
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_1d2

    goto/16 :goto_1d0

    .line 290
    :pswitch_b
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lvpos/apipackage/AppTypeWindow;->access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;

    move-result-object v0

    if-eqz v0, :cond_1d0

    .line 291
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v0}, Lvpos/apipackage/AppTypeWindow;->access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/RadioGroup;->clearCheck()V

    goto/16 :goto_1d0

    .line 279
    :pswitch_1e
    # getter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {}, Lvpos/apipackage/AppTypeWindow;->access$500()Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_34

    .line 280
    # getter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {}, Lvpos/apipackage/AppTypeWindow;->access$500()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 281
    const/4 v0, 0x0

    # setter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {v0}, Lvpos/apipackage/AppTypeWindow;->access$502(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 282
    iget-object v2, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # setter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v2, v0}, Lvpos/apipackage/AppTypeWindow;->access$102(Lvpos/apipackage/AppTypeWindow;Landroid/content/Context;)Landroid/content/Context;

    .line 285
    :cond_34
    iget-object v0, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # setter for: Lvpos/apipackage/AppTypeWindow;->bFinish:Z
    invoke-static {v0, v1}, Lvpos/apipackage/AppTypeWindow;->access$602(Lvpos/apipackage/AppTypeWindow;Z)Z

    .line 287
    goto/16 :goto_1d0

    .line 178
    :pswitch_3b
    const-string v0, "liuhao"

    const-string v2, "handler  MSG_WHAT_SHOW_DIALOG .........."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    new-instance v0, Lvpos/apipackage/CustomLayout;

    iget-object v2, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lvpos/apipackage/AppTypeWindow;->access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lvpos/apipackage/CustomLayout;-><init>(Landroid/content/Context;)V

    .line 181
    .local v0, "layout":Lvpos/apipackage/CustomLayout;
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Lvpos/apipackage/CustomLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    invoke-virtual {v0, v1}, Lvpos/apipackage/CustomLayout;->setOrientation(I)V

    .line 183
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lvpos/apipackage/CustomLayout;->setGravity(I)V

    .line 187
    iget-object v2, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    new-instance v4, Landroid/widget/RadioGroup;

    iget-object v5, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lvpos/apipackage/AppTypeWindow;->access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    # setter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v2, v4}, Lvpos/apipackage/AppTypeWindow;->access$002(Lvpos/apipackage/AppTypeWindow;Landroid/widget/RadioGroup;)Landroid/widget/RadioGroup;

    .line 188
    iget-object v2, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v2}, Lvpos/apipackage/AppTypeWindow;->access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;

    move-result-object v2

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4}, Landroid/widget/RadioGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 189
    iget-object v2, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v2}, Lvpos/apipackage/AppTypeWindow;->access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;

    move-result-object v2

    const/16 v4, 0x8

    const/16 v5, 0x12

    const/16 v6, 0x26

    invoke-virtual {v2, v6, v4, v6, v5}, Landroid/widget/RadioGroup;->setPadding(IIII)V

    .line 190
    const/4 v2, 0x0

    const/4 v4, 0x0

    .local v4, "i":I
    :goto_8d
    iget-object v5, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->typeCount:I
    invoke-static {v5}, Lvpos/apipackage/AppTypeWindow;->access$200(Lvpos/apipackage/AppTypeWindow;)I

    move-result v5

    const/4 v6, -0x2

    if-ge v4, v5, :cond_dd

    .line 191
    new-instance v5, Landroid/widget/RadioButton;

    iget-object v7, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lvpos/apipackage/AppTypeWindow;->access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;

    move-result-object v7

    invoke-direct {v5, v7}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    .line 192
    .local v5, "radioButton":Landroid/widget/RadioButton;
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v3, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7}, Landroid/widget/RadioButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 193
    const/high16 v6, 0x41f00000    # 30.0f

    invoke-virtual {v5, v6}, Landroid/widget/RadioButton;->setTextSize(F)V

    .line 194
    iget-object v6, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v6}, Lvpos/apipackage/AppTypeWindow;->access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/cspos/R$color;->rbColor1:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/RadioButton;->setTextColor(I)V

    .line 195
    iget-object v6, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->types:[Ljava/lang/String;
    invoke-static {v6}, Lvpos/apipackage/AppTypeWindow;->access$300(Lvpos/apipackage/AppTypeWindow;)[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v4

    invoke-virtual {v5, v6}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 196
    sget v6, Lcom/cspos/R$drawable;->dialog_app_radio_button_style:I

    invoke-virtual {v5, v6}, Landroid/widget/RadioButton;->setButtonDrawable(I)V

    .line 197
    iget-object v6, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v6}, Lvpos/apipackage/AppTypeWindow;->access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;

    move-result-object v6

    invoke-virtual {v6, v5, v4}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;I)V

    .line 190
    .end local v5    # "radioButton":Landroid/widget/RadioButton;
    add-int/lit8 v4, v4, 0x1

    goto :goto_8d

    .line 200
    .end local v4    # "i":I
    :cond_dd
    iget-object v4, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->radioGroup:Landroid/widget/RadioGroup;
    invoke-static {v4}, Lvpos/apipackage/AppTypeWindow;->access$000(Lvpos/apipackage/AppTypeWindow;)Landroid/widget/RadioGroup;

    move-result-object v4

    invoke-virtual {v0, v4}, Lvpos/apipackage/CustomLayout;->addView(Landroid/view/View;)V

    .line 202
    new-instance v4, Lvpos/apipackage/AppTypeWindow$2$1;

    invoke-direct {v4, p0}, Lvpos/apipackage/AppTypeWindow$2$1;-><init>(Lvpos/apipackage/AppTypeWindow$2;)V

    invoke-virtual {v0, v4}, Lvpos/apipackage/CustomLayout;->setMyViewFocusInterface(Lvpos/apipackage/CustomLayout$MyViewFocusInterface;)V

    .line 213
    new-instance v4, Landroid/widget/TextView;

    iget-object v5, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lvpos/apipackage/AppTypeWindow;->access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 214
    .local v4, "tvTitle":Landroid/widget/TextView;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 215
    const/16 v5, 0xf

    const/16 v7, 0x19

    invoke-virtual {v4, v7, v5, v7, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 216
    iget-object v5, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->title:Ljava/lang/String;
    invoke-static {v5}, Lvpos/apipackage/AppTypeWindow;->access$400(Lvpos/apipackage/AppTypeWindow;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    const/high16 v5, 0x41b00000    # 22.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 218
    iget-object v5, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lvpos/apipackage/AppTypeWindow;->access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v7, Lcom/cspos/R$color;->black:I

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 219
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 221
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v5}, Lvpos/apipackage/AppTypeWindow;->access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;

    move-result-object v5

    sget v7, Lcom/cspos/R$style;->mDlgTheme:I

    invoke-direct {v1, v5, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 222
    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setCustomTitle(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 223
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v5, "OK"

    new-instance v7, Lvpos/apipackage/AppTypeWindow$2$3;

    invoke-direct {v7, p0}, Lvpos/apipackage/AppTypeWindow$2$3;-><init>(Lvpos/apipackage/AppTypeWindow$2;)V

    .line 224
    invoke-virtual {v1, v5, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v5, "Cancel"

    new-instance v7, Lvpos/apipackage/AppTypeWindow$2$2;

    invoke-direct {v7, p0}, Lvpos/apipackage/AppTypeWindow$2$2;-><init>(Lvpos/apipackage/AppTypeWindow$2;)V

    .line 235
    invoke-virtual {v1, v5, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 246
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    .line 221
    # setter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {v1}, Lvpos/apipackage/AppTypeWindow;->access$502(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 247
    # getter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {}, Lvpos/apipackage/AppTypeWindow;->access$500()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 249
    # getter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {}, Lvpos/apipackage/AppTypeWindow;->access$500()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    const/high16 v5, 0x41900000    # 18.0f

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setTextSize(F)V

    .line 250
    # getter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {}, Lvpos/apipackage/AppTypeWindow;->access$500()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setTextSize(F)V

    .line 251
    # getter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {}, Lvpos/apipackage/AppTypeWindow;->access$500()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    iget-object v3, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lvpos/apipackage/AppTypeWindow;->access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v5, Lcom/cspos/R$color;->accent1:I

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 252
    # getter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {}, Lvpos/apipackage/AppTypeWindow;->access$500()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    iget-object v3, p0, Lvpos/apipackage/AppTypeWindow$2;->this$0:Lvpos/apipackage/AppTypeWindow;

    # getter for: Lvpos/apipackage/AppTypeWindow;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lvpos/apipackage/AppTypeWindow;->access$100(Lvpos/apipackage/AppTypeWindow;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v5, Lcom/cspos/R$color;->accent1:I

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 253
    # getter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {}, Lvpos/apipackage/AppTypeWindow;->access$500()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 256
    # getter for: Lvpos/apipackage/AppTypeWindow;->dlgSelect:Landroid/app/AlertDialog;
    invoke-static {}, Lvpos/apipackage/AppTypeWindow;->access$500()Landroid/app/AlertDialog;

    move-result-object v1

    new-instance v2, Lvpos/apipackage/AppTypeWindow$2$4;

    invoke-direct {v2, p0}, Lvpos/apipackage/AppTypeWindow$2$4;-><init>(Lvpos/apipackage/AppTypeWindow$2;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 275
    nop

    .line 295
    .end local v0    # "layout":Lvpos/apipackage/CustomLayout;
    .end local v4    # "tvTitle":Landroid/widget/TextView;
    :cond_1d0
    :goto_1d0
    return-void

    nop

    :pswitch_data_1d2
    .packed-switch 0x0
        :pswitch_3b
        :pswitch_1e
        :pswitch_b
    .end packed-switch
.end method
