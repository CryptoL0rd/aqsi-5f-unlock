.class Lvpos/apipackage/Print$PrinterBitmap;
.super Ljava/lang/Object;
.source "Print.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvpos/apipackage/Print;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PrinterBitmap"
.end annotation


# instance fields
.field public m_iHeight:I

.field public m_iRowBytes:I

.field public m_iWidth:I

.field public m_pDotByteBuffer:[B

.field final synthetic this$0:Lvpos/apipackage/Print;


# direct methods
.method public constructor <init>(Lvpos/apipackage/Print;)V
    .registers 3

    .line 348
    iput-object p1, p0, Lvpos/apipackage/Print$PrinterBitmap;->this$0:Lvpos/apipackage/Print;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 340
    const/4 p1, 0x0

    iput-object p1, p0, Lvpos/apipackage/Print$PrinterBitmap;->m_pDotByteBuffer:[B

    .line 341
    const/4 v0, 0x0

    iput v0, p0, Lvpos/apipackage/Print$PrinterBitmap;->m_iRowBytes:I

    .line 342
    iput v0, p0, Lvpos/apipackage/Print$PrinterBitmap;->m_iWidth:I

    .line 343
    iput v0, p0, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    .line 349
    iput-object p1, p0, Lvpos/apipackage/Print$PrinterBitmap;->m_pDotByteBuffer:[B

    .line 350
    iput v0, p0, Lvpos/apipackage/Print$PrinterBitmap;->m_iRowBytes:I

    .line 351
    iput v0, p0, Lvpos/apipackage/Print$PrinterBitmap;->m_iWidth:I

    .line 352
    iput v0, p0, Lvpos/apipackage/Print$PrinterBitmap;->m_iHeight:I

    .line 353
    return-void
.end method
