.class Lvpos/keypad/KeyPad$2;
.super Landroid/os/Handler;
.source "KeyPad.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/keypad/KeyPad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lvpos/keypad/KeyPad;


# direct methods
.method constructor <init>(Lvpos/keypad/KeyPad;Landroid/os/Looper;)V
    .registers 3
    .param p1, "this$0"    # Lvpos/keypad/KeyPad;
    .param p2, "x0"    # Landroid/os/Looper;

    .line 204
    iput-object p1, p0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 18
    .param p1, "msg"    # Landroid/os/Message;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 208
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget v2, v1, Landroid/os/Message;->what:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v2, :pswitch_data_46c

    .line 441
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    .line 442
    .local v2, "b":Landroid/os/Bundle;
    const-string v3, "MSG"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 443
    .local v3, "strInfo":Ljava/lang/String;
    const-string v4, "KeyPad"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_46a

    .line 437
    .end local v2    # "b":Landroid/os/Bundle;
    .end local v3    # "strInfo":Ljava/lang/String;
    :pswitch_1c
    iget-object v2, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v2}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 438
    goto/16 :goto_46a

    .line 421
    :pswitch_29
    sget-object v2, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    if-eqz v2, :cond_38

    .line 422
    sget-object v2, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 423
    sput-object v4, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    .line 424
    iget-object v2, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iput-object v4, v2, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    .line 433
    :cond_38
    iget-object v2, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # setter for: Lvpos/keypad/KeyPad;->mIsInputFinish:Z
    invoke-static {v2, v3}, Lvpos/keypad/KeyPad;->access$702(Lvpos/keypad/KeyPad;Z)Z

    .line 434
    goto/16 :goto_46a

    .line 210
    :pswitch_3f
    const-string v2, "Robert"

    const-string v5, "showpad-------------------MSG_WHAT_SHOW_DIALOG"

    invoke-static {v2, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    iget-object v2, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v2, v2, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 213
    .local v2, "inflater":Landroid/view/LayoutInflater;
    sget v5, Lcom/cspos/R$layout;->keypad_dialog_layout:I

    invoke-virtual {v2, v5, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 214
    .local v5, "layout":Landroid/view/View;
    sget v6, Lcom/cspos/R$id;->replaceLL:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    .line 215
    .local v6, "replaceLL":Landroid/widget/LinearLayout;
    const/4 v7, 0x0

    .line 217
    .local v7, "mKeyboardView":Lvpos/keypad/StockKeyboardView;
    sget v8, Lvpos/keypad/KeyPad;->TYPE:I

    const/4 v9, 0x4

    const/4 v10, 0x3

    const/4 v11, 0x2

    const/4 v12, -0x1

    const/4 v13, 0x0

    if-nez v8, :cond_a2

    .line 218
    sget v8, Lcom/cspos/R$id;->pk_up_lay:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    const/16 v14, 0x8

    invoke-virtual {v8, v14}, Landroid/view/View;->setVisibility(I)V

    .line 219
    sget v8, Lcom/cspos/R$id;->pk_ivDel:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8, v14}, Landroid/view/View;->setVisibility(I)V

    .line 220
    sget v8, Lcom/cspos/R$id;->pk_ptc_count:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8, v14}, Landroid/view/View;->setVisibility(I)V

    .line 221
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 222
    .local v8, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v14, 0x5

    invoke-virtual {v8, v13, v13, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 223
    invoke-virtual {v6, v8}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 225
    sget v14, Lcom/cspos/R$layout;->old_keyboardview_layout:I

    invoke-virtual {v2, v14, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 226
    sget v4, Lcom/cspos/R$id;->keyboard_view:I

    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lvpos/keypad/StockKeyboardView;

    .line 227
    .end local v7    # "mKeyboardView":Lvpos/keypad/StockKeyboardView;
    .end local v8    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    .local v4, "mKeyboardView":Lvpos/keypad/StockKeyboardView;
    goto/16 :goto_234

    .line 228
    .end local v4    # "mKeyboardView":Lvpos/keypad/StockKeyboardView;
    .restart local v7    # "mKeyboardView":Lvpos/keypad/StockKeyboardView;
    :cond_a2
    sget v8, Lcom/cspos/R$id;->pk_up_lay:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8, v13}, Landroid/view/View;->setVisibility(I)V

    .line 229
    sget v8, Lcom/cspos/R$id;->pk_ivDel:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8, v13}, Landroid/view/View;->setVisibility(I)V

    .line 230
    sget v8, Lcom/cspos/R$id;->pk_ptc_count:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8, v13}, Landroid/view/View;->setVisibility(I)V

    .line 231
    sget v8, Lcom/cspos/R$id;->ivLogo:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8, v13}, Landroid/view/View;->setVisibility(I)V

    .line 233
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x2

    invoke-direct {v8, v12, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 234
    .local v8, "uplay_lp":Landroid/widget/LinearLayout$LayoutParams;
    sget v14, Lvpos/keypad/KeyPad;->TYPE:I

    const/16 v15, 0x6e

    if-eq v14, v3, :cond_127

    sget v14, Lvpos/keypad/KeyPad;->TYPE:I

    if-ne v11, v14, :cond_d7

    goto :goto_127

    .line 243
    :cond_d7
    sget v14, Lvpos/keypad/KeyPad;->TYPE:I

    if-eq v14, v10, :cond_df

    sget v14, Lvpos/keypad/KeyPad;->TYPE:I

    if-ne v9, v14, :cond_170

    .line 244
    :cond_df
    invoke-virtual {v8, v13, v15, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 245
    sget v14, Lcom/cspos/R$id;->pk_up_lay:I

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 246
    sget v14, Lcom/cspos/R$id;->ivLogo:I

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x154

    const/16 v12, 0xa0

    invoke-direct {v15, v9, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v14, v15}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 247
    sget v9, Lcom/cspos/R$id;->ivLogo:I

    invoke-virtual {v5, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    iget-object v12, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v12, v12, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    sget v14, Lcom/cspos/R$drawable;->logo_aqsi:I

    invoke-virtual {v12, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    invoke-virtual {v9, v12}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 249
    sget v9, Lcom/cspos/R$layout;->pk_aqsi_keyboardview_layout:I

    invoke-virtual {v2, v9, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 250
    sget v4, Lcom/cspos/R$id;->pk_aqsi_keyboard:I

    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lvpos/keypad/StockKeyboardView;

    goto :goto_170

    .line 235
    :cond_127
    :goto_127
    const/16 v9, 0x3c

    invoke-virtual {v8, v13, v15, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 236
    sget v9, Lcom/cspos/R$id;->pk_up_lay:I

    invoke-virtual {v5, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 237
    sget v9, Lcom/cspos/R$id;->ivLogo:I

    invoke-virtual {v5, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v14, 0x258

    const/16 v15, 0x78

    invoke-direct {v12, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v12}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 238
    sget v9, Lcom/cspos/R$id;->ivLogo:I

    invoke-virtual {v5, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    iget-object v12, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v12, v12, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    sget v14, Lcom/cspos/R$drawable;->logo_serbank:I

    invoke-virtual {v12, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    invoke-virtual {v9, v12}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 240
    sget v9, Lcom/cspos/R$layout;->pk_serbank_keyboardview_layout:I

    invoke-virtual {v2, v9, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 241
    sget v4, Lcom/cspos/R$id;->pk_serbank_keyboard:I

    invoke-virtual {v6, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lvpos/keypad/StockKeyboardView;

    .line 253
    .end local v7    # "mKeyboardView":Lvpos/keypad/StockKeyboardView;
    .restart local v4    # "mKeyboardView":Lvpos/keypad/StockKeyboardView;
    :cond_170
    :goto_170
    move-object v4, v7

    invoke-static {}, Lvpos/keypad/EMVCOHelper;->getInstance()Lvpos/keypad/EMVCOHelper;

    invoke-static {}, Lvpos/keypad/EMVCOHelper;->EmvSetExtTransAmount()I

    move-result v7

    sput v7, Lvpos/keypad/KeyPad;->amount:I

    .line 254
    new-instance v7, Ljava/text/DecimalFormat;

    const-string v9, "0.00"

    invoke-direct {v7, v9}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 255
    .local v7, "df":Ljava/text/DecimalFormat;
    sget v9, Lvpos/keypad/KeyPad;->amount:I

    int-to-float v9, v9

    const/high16 v12, 0x42c80000    # 100.0f

    div-float/2addr v9, v12

    float-to-double v14, v9

    invoke-virtual {v7, v14, v15}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v9

    .line 258
    .local v9, "strAmount":Ljava/lang/String;
    sget v12, Lcom/cspos/R$id;->pk_title_sum:I

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\u041a \u043e\u043f\u043b\u0430\u0442\u0435 : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    invoke-static {}, Lvpos/keypad/EMVCOHelper;->getInstance()Lvpos/keypad/EMVCOHelper;

    invoke-static {}, Lvpos/keypad/EMVCOHelper;->EmvSetExtPtcCounter()I

    move-result v12

    sput v12, Lvpos/keypad/KeyPad;->ptc_couter:I

    .line 260
    const-string v12, "liuhao"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "ptc_couter = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v15, Lvpos/keypad/KeyPad;->ptc_couter:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    sget v12, Lvpos/keypad/KeyPad;->ptc_couter:I

    if-ne v12, v10, :cond_1e2

    .line 263
    const-string v12, "liuhao"

    const-string v14, "ptc_couter 333333333"

    invoke-static {v12, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    sget v12, Lcom/cspos/R$id;->pk_ptc_count:I

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    const-string v14, "\u043e\u0441\u0442\u0430\u043b\u043e\u0441\u044c 3 \u043f\u043e\u043f\u044b\u0442\u043a\u0438"

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_228

    .line 266
    :cond_1e2
    sget v12, Lvpos/keypad/KeyPad;->ptc_couter:I

    if-ne v12, v11, :cond_1fb

    .line 268
    const-string v12, "liuhao"

    const-string v14, "ptc_couter 222222222"

    invoke-static {v12, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    sget v12, Lcom/cspos/R$id;->pk_ptc_count:I

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    const-string v14, "\u043e\u0441\u0442\u0430\u043b\u043e\u0441\u044c 2 \u043f\u043e\u043f\u044b\u0442\u043a\u0438"

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_228

    .line 270
    :cond_1fb
    sget v12, Lvpos/keypad/KeyPad;->ptc_couter:I

    if-ne v12, v3, :cond_214

    .line 271
    const-string v12, "liuhao"

    const-string v14, "ptc_couter 1111111"

    invoke-static {v12, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    sget v12, Lcom/cspos/R$id;->pk_ptc_count:I

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    const-string v14, "\u043f\u043e\u0441\u043b\u0435\u0434\u043d\u044f\u044f \u043f\u043e\u043f\u044b\u0442\u043a\u0430"

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_228

    .line 275
    :cond_214
    const-string v12, "liuhao"

    const-string v14, "ptc_couter esle"

    invoke-static {v12, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    sget v12, Lcom/cspos/R$id;->pk_ptc_count:I

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    const-string v14, ""

    invoke-virtual {v12, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    :goto_228
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x1

    invoke-direct {v12, v14, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 280
    .local v12, "pkLp":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v12, v13, v13, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 281
    invoke-virtual {v6, v12}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 285
    .end local v7    # "df":Ljava/text/DecimalFormat;
    .end local v8    # "uplay_lp":Landroid/widget/LinearLayout$LayoutParams;
    .end local v9    # "strAmount":Ljava/lang/String;
    .end local v12    # "pkLp":Landroid/widget/LinearLayout$LayoutParams;
    :goto_234
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    sget v8, Lcom/cspos/R$id;->pwdEdtiInput:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    # setter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v7, v8}, Lvpos/keypad/KeyPad;->access$002(Lvpos/keypad/KeyPad;Landroid/widget/EditText;)Landroid/widget/EditText;

    .line 286
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mEditText:Landroid/widget/EditText;
    invoke-static {v7}, Lvpos/keypad/KeyPad;->access$000(Lvpos/keypad/KeyPad;)Landroid/widget/EditText;

    move-result-object v7

    new-instance v8, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;

    iget-object v9, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    invoke-direct {v8, v9}, Lvpos/keypad/KeyPad$AsteriskPasswordTransformationMethod;-><init>(Lvpos/keypad/KeyPad;)V

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 289
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    sget v8, Lcom/cspos/R$id;->pk_ivDel:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    # setter for: Lvpos/keypad/KeyPad;->ivDel:Landroid/widget/ImageView;
    invoke-static {v7, v8}, Lvpos/keypad/KeyPad;->access$102(Lvpos/keypad/KeyPad;Landroid/widget/ImageView;)Landroid/widget/ImageView;

    .line 290
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->ivDel:Landroid/widget/ImageView;
    invoke-static {v7}, Lvpos/keypad/KeyPad;->access$100(Lvpos/keypad/KeyPad;)Landroid/widget/ImageView;

    move-result-object v7

    new-instance v8, Lvpos/keypad/KeyPad$2$1;

    invoke-direct {v8, v0}, Lvpos/keypad/KeyPad$2$1;-><init>(Lvpos/keypad/KeyPad$2;)V

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 303
    sget v7, Lvpos/keypad/KeyPad;->TYPE:I

    if-nez v7, :cond_281

    .line 304
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    new-instance v8, Landroid/inputmethodservice/Keyboard;

    iget-object v9, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v9, v9, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    sget v10, Lcom/cspos/R$xml;->symbols:I

    invoke-direct {v8, v9, v10}, Landroid/inputmethodservice/Keyboard;-><init>(Landroid/content/Context;I)V

    # setter for: Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;
    invoke-static {v7, v8}, Lvpos/keypad/KeyPad;->access$202(Lvpos/keypad/KeyPad;Landroid/inputmethodservice/Keyboard;)Landroid/inputmethodservice/Keyboard;

    goto :goto_2b4

    .line 305
    :cond_281
    sget v7, Lvpos/keypad/KeyPad;->TYPE:I

    if-eq v7, v3, :cond_2a4

    sget v7, Lvpos/keypad/KeyPad;->TYPE:I

    if-ne v11, v7, :cond_28a

    goto :goto_2a4

    .line 307
    :cond_28a
    sget v7, Lvpos/keypad/KeyPad;->TYPE:I

    if-eq v7, v10, :cond_293

    sget v7, Lvpos/keypad/KeyPad;->TYPE:I

    const/4 v8, 0x4

    if-ne v8, v7, :cond_2b4

    .line 308
    :cond_293
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    new-instance v8, Landroid/inputmethodservice/Keyboard;

    iget-object v9, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v9, v9, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    sget v10, Lcom/cspos/R$xml;->symbols_pk_aqsi:I

    invoke-direct {v8, v9, v10}, Landroid/inputmethodservice/Keyboard;-><init>(Landroid/content/Context;I)V

    # setter for: Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;
    invoke-static {v7, v8}, Lvpos/keypad/KeyPad;->access$202(Lvpos/keypad/KeyPad;Landroid/inputmethodservice/Keyboard;)Landroid/inputmethodservice/Keyboard;

    goto :goto_2b4

    .line 306
    :cond_2a4
    :goto_2a4
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    new-instance v8, Landroid/inputmethodservice/Keyboard;

    iget-object v9, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v9, v9, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    sget v10, Lcom/cspos/R$xml;->symbols_pk_serbank:I

    invoke-direct {v8, v9, v10}, Landroid/inputmethodservice/Keyboard;-><init>(Landroid/content/Context;I)V

    # setter for: Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;
    invoke-static {v7, v8}, Lvpos/keypad/KeyPad;->access$202(Lvpos/keypad/KeyPad;Landroid/inputmethodservice/Keyboard;)Landroid/inputmethodservice/Keyboard;

    .line 311
    :cond_2b4
    :goto_2b4
    invoke-virtual {v4}, Lvpos/keypad/StockKeyboardView;->requestFocus()Z

    .line 313
    sget v7, Lvpos/keypad/KeyPad;->TYPE:I

    if-nez v7, :cond_2c1

    .line 314
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # invokes: Lvpos/keypad/KeyPad;->randomNumKey()V
    invoke-static {v7}, Lvpos/keypad/KeyPad;->access$300(Lvpos/keypad/KeyPad;)V

    goto :goto_2d5

    .line 315
    :cond_2c1
    sget v7, Lvpos/keypad/KeyPad;->TYPE:I

    if-ne v7, v11, :cond_2cb

    .line 316
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # invokes: Lvpos/keypad/KeyPad;->randomNumKeyPK()V
    invoke-static {v7}, Lvpos/keypad/KeyPad;->access$400(Lvpos/keypad/KeyPad;)V

    goto :goto_2d5

    .line 317
    :cond_2cb
    sget v7, Lvpos/keypad/KeyPad;->TYPE:I

    const/4 v8, 0x4

    if-ne v8, v7, :cond_2d5

    .line 318
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # invokes: Lvpos/keypad/KeyPad;->randomNumKeyAsqi()V
    invoke-static {v7}, Lvpos/keypad/KeyPad;->access$500(Lvpos/keypad/KeyPad;)V

    .line 321
    :cond_2d5
    :goto_2d5
    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->mNumKeyboard:Landroid/inputmethodservice/Keyboard;
    invoke-static {v7}, Lvpos/keypad/KeyPad;->access$200(Lvpos/keypad/KeyPad;)Landroid/inputmethodservice/Keyboard;

    move-result-object v7

    invoke-virtual {v4, v7}, Lvpos/keypad/StockKeyboardView;->setKeyboard(Landroid/inputmethodservice/Keyboard;)V

    .line 322
    invoke-virtual {v4, v3}, Lvpos/keypad/StockKeyboardView;->setEnabled(Z)V

    .line 323
    invoke-virtual {v4, v13}, Lvpos/keypad/StockKeyboardView;->setPreviewEnabled(Z)V

    .line 324
    iget-object v3, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    # getter for: Lvpos/keypad/KeyPad;->listener:Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;
    invoke-static {v3}, Lvpos/keypad/KeyPad;->access$600(Lvpos/keypad/KeyPad;)Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;

    move-result-object v3

    invoke-virtual {v4, v3}, Lvpos/keypad/StockKeyboardView;->setOnKeyboardActionListener(Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;)V

    .line 326
    new-instance v3, Lvpos/keypad/KeyPad$2$2;

    invoke-direct {v3, v0}, Lvpos/keypad/KeyPad$2$2;-><init>(Lvpos/keypad/KeyPad$2;)V

    invoke-virtual {v4, v3}, Lvpos/keypad/StockKeyboardView;->setMyViewFocusInterface(Lvpos/keypad/StockKeyboardView$MyViewFocusInterface;)V

    .line 337
    iget-object v3, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v3, v3, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    instance-of v3, v3, Landroid/app/Activity;

    if-eqz v3, :cond_454

    iget-object v3, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v3, v3, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    check-cast v3, Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_454

    .line 338
    const-string v3, "liuhao KeyPad"

    const-string v7, "(mContext instanceof Activity) && !((Activity) mContext).isFinishing()"

    invoke-static {v3, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    sget v3, Lvpos/keypad/KeyPad;->TYPE:I

    if-eqz v3, :cond_431

    .line 341
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v7, v7, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    sget v8, Lcom/cspos/R$style;->fullStyle:I

    invoke-direct {v3, v7, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 343
    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 344
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v3

    sput-object v3, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    .line 346
    sget-object v3, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v3, v13}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 365
    sget-object v3, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v13, v13, v13, v13}, Landroid/view/View;->setPadding(IIII)V

    .line 367
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v3, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 368
    .local v3, "lp_decor":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v3, v13, v13, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 369
    sget-object v7, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v7}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 371
    sget-object v7, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v7}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v7

    .line 372
    .local v7, "lp_window":Landroid/view/WindowManager$LayoutParams;
    const/4 v8, -0x1

    iput v8, v7, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 373
    iput v8, v7, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 375
    sget-object v9, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v9}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v9

    invoke-virtual {v9, v7}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 377
    sget-object v9, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v9}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v9

    new-instance v10, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v10, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v9, v10}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 378
    const-string v8, "liuhao KeyPad"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "top : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v10, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getPaddingTop()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    const-string v8, "liuhao KeyPad"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "bottom : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v10, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getPaddingBottom()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    const-string v8, "liuhao KeyPad"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "left : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v10, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getPaddingLeft()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    const-string v8, "liuhao KeyPad"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "right : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v10, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getPaddingRight()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    sget-object v8, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v8}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    iget-object v9, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v9, v9, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v8, v9}, Landroid/view/View;->setMinimumWidth(I)V

    .line 385
    sget-object v8, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v8}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    const/4 v9, -0x1

    invoke-virtual {v8, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 387
    .end local v3    # "lp_decor":Landroid/widget/LinearLayout$LayoutParams;
    .end local v7    # "lp_window":Landroid/view/WindowManager$LayoutParams;
    goto :goto_449

    .line 388
    :cond_431
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v7, v7, Lvpos/keypad/KeyPad;->mContext:Landroid/content/Context;

    invoke-direct {v3, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 390
    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 391
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v3

    sput-object v3, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    .line 393
    sget-object v3, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    invoke-virtual {v3, v13}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 397
    :goto_449
    sget-object v3, Lvpos/keypad/KeyPad;->dAlertDialog:Landroid/app/Dialog;

    new-instance v7, Lvpos/keypad/KeyPad$2$3;

    invoke-direct {v7, v0}, Lvpos/keypad/KeyPad$2$3;-><init>(Lvpos/keypad/KeyPad$2;)V

    invoke-virtual {v3, v7}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    goto :goto_46a

    .line 413
    :cond_454
    iget-object v3, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    const/4 v7, -0x6

    iput v7, v3, Lvpos/keypad/KeyPad;->keyInputMaxLength:I

    .line 415
    iget-object v3, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v3, v3, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    if-eqz v3, :cond_46a

    .line 416
    iget-object v3, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget-object v3, v3, Lvpos/keypad/KeyPad;->mIFinishInput:Lvpos/keypad/KeyPad$IFinishInput;

    iget-object v7, v0, Lvpos/keypad/KeyPad$2;->this$0:Lvpos/keypad/KeyPad;

    iget v7, v7, Lvpos/keypad/KeyPad;->keyInputResult:I

    invoke-interface {v3, v7}, Lvpos/keypad/KeyPad$IFinishInput;->isFinish(I)V

    .line 447
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    .end local v4    # "mKeyboardView":Lvpos/keypad/StockKeyboardView;
    .end local v5    # "layout":Landroid/view/View;
    .end local v6    # "replaceLL":Landroid/widget/LinearLayout;
    :cond_46a
    :goto_46a
    return-void

    nop

    :pswitch_data_46c
    .packed-switch 0x0
        :pswitch_3f
        :pswitch_29
        :pswitch_1c
    .end packed-switch
.end method
